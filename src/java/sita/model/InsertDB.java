/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sita.model;

import sita.domain.Mahasiswa;
import sita.domain.PembimbingTA;
import sita.domain.TA;
import sita.services.Insert;

/**
 *
 * @author kpratama
 */
public class InsertDB {

    public boolean insertUser(String nim, String nama, String password) {
        if (insertMahasiswa(nim, nama)) {
            Insert insertUser = new Insert();
            if (insertUser.insertNewUser(nim, password)) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public boolean insertMahasiswa(String nim, String nama) {
        String id_jurusan = nim.substring(0, 3);
        String angkatan = "20" + nim.substring(3, 5);

        Mahasiswa m = new Mahasiswa();
        m.setNim(nim);
        m.setNama(nama);
        m.setAngkatan(angkatan);
        m.setId_jurusan(id_jurusan);
        Insert im = new Insert();
        if (im.insertNewMahasiswa(m)) {
            return true;
        } else {
            return false;
        }
    }
    
    public boolean insertTA(String nim, String judul, String tahun, String abstrak, String path) {
        TA newTa = new TA();
        newTa.setNim(nim);
        newTa.setJudul(judul);
        newTa.setTahun(tahun);
        newTa.setAbstrak(abstrak);
        newTa.setPath(path);
        Insert ta = new Insert();
        if (ta.insertNewTA(newTa)) {
            return true;
        } else {
            return false;
        }
    }
    
    public boolean insertPembimbing(String nim, String dosen_id) {
        PembimbingTA p = new PembimbingTA();
        p.setNim(nim);
        p.setId_dosen(dosen_id);
        Insert ip = new Insert();
        if (ip.insertPembimbing(p)) {
            return true;
        } else {
            return false;
        }
    }
}
