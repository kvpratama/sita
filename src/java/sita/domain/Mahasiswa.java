/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sita.domain;

/**
 *
 * @author kpratama
 */
public class Mahasiswa {
    private String nim;
    private String nama;
    private String angkatan;
    private String id_jurusan;

    public String getAngkatan() {
        return angkatan;
    }

    public void setAngkatan(String angkatan) {
        this.angkatan = angkatan;
    }

    public String getId_jurusan() {
        return id_jurusan;
    }

    public void setId_jurusan(String id_jurusan) {
        this.id_jurusan = id_jurusan;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getNim() {
        return nim;
    }

    public void setNim(String nim) {
        this.nim = nim;
    }
}
