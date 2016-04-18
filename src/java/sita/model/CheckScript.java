/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sita.model;

/**
 *
 * @author kpratama
 */
public class CheckScript {

    public String checkScript(String s) {
        if (s.contains("<") || s.contains(">")) {
//            System.out.println("contain");
            s = s.replace('<', ' ');
            s = s.replace('>', ' ');
        } else {
//            System.out.println("not contain");
        }
        return s;
    }

    public String[] checkScript(String[] s) {
        for (int i = 0; i < s.length; i++) {
            if (s[i].contains("<") || s[i].contains(">")) {
//                System.out.println("contain");
                s[i] = s[i].replace('<', ' ');
                s[i] = s[i].replace('>', ' ');
            } else {
//                System.out.println("not contain");
            }
        }
        return s;
    }

//    public static void main(String[] args) {
//        CheckScript c = new CheckScript();
//        String[] d = c.checkScript(new String[]{"dia muka", "ada<scrip>", "awas ada<got"});
//        System.out.println(d[0]);
//        System.out.println(d[1]);
//        System.out.println(d[2]);
//        System.out.println(c.checkScript("<script>"));
//    }
}
