/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sita.model;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author kpratama
 */
public class UploadFile {

    String[] data = new String[7];

    public String[] upload(HttpServletRequest request, String realPath) {
        //create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        //set factory constraints
        factory.setSizeThreshold(256000);
        factory.setRepository(new File(realPath));

        //create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        //set overall request size constraint
        upload.setSizeMax(5120000);

        String path = "";
        try {
            List<?> items = upload.parseRequest(request);

            //process the uploaded items
            Iterator<?> iter = items.iterator();
            int i = 0;
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();

                if (item.isFormField()) {
                    data[i] = item.getString();
                } else {
                    path = processUploadedFile(item, realPath);
                    data[i] = path;
                    System.out.println("form");
                }
                i++;
            }
//            System.out.println("welcome data");
//            for (int j = 0; j < data.length; j++) {
//                System.out.println("data: " + data[j]);
//            }
        } catch (FileUploadException ex) {
            ex.printStackTrace();
        }
        return data;
    }

    public String processUploadedFile(FileItem item, String realPath) {
        String itemName = item.getName();
        if (item.getSize() > 5120000) {
            
        }
        if (itemName.length() == 0) {
            //System.out.println("NO FILE");
            itemName = "default.png";
        } else {
            String fileType = "";
            boolean check = false;
            for (int i = 0; i < itemName.length(); i++) {
                char c = itemName.charAt(i);
                if (c == '.') {
                    check = true;
                }
                if (check == true) {
                    fileType += c;
                }
            }
            if (fileType.equals(".jpg") || fileType.equals(".png") || fileType.equals(".jpeg") || item.getSize()>5120000) {
                itemName = FilenameUtils.getName(itemName);
            } else {
                itemName = "default.png";
            }
        }
//        System.out.println("file name: " + itemName);

        String foldername = realPath;

        File targetFolder = new File(foldername);
        if (targetFolder.exists() || targetFolder.mkdir()) {
            File uploaded = new File(foldername + itemName);
            try {
//                System.out.println("current folder: " + new File(".").getAbsolutePath());
//                System.out.println("upload folder: " + uploaded.getAbsolutePath());
                item.write(uploaded);
            } catch (Exception ex) {
            }
        }
        item.delete();
        return itemName;
    }
}
