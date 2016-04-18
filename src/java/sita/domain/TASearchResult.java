/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sita.domain;

/**
 *
 * @author kpratama
 */
public class TASearchResult {
    private String judul;
    private String nama;
    private String tahun;
    private String dosen1;
    private String dosen2;
    private String abstrak;
    private String path;

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getAbstrak() {
        return abstrak;
    }

    public void setAbstrak(String abstrak) {
        this.abstrak = abstrak;
    }

    public String getDosen1() {
        return dosen1;
    }

    public void setDosen1(String dosen1) {
        this.dosen1 = dosen1;
    }

    public String getDosen2() {
        return dosen2;
    }

    public void setDosen2(String dosen2) {
        this.dosen2 = dosen2;
    }

    public String getJudul() {
        return judul;
    }

    public void setJudul(String judul) {
        this.judul = judul;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getTahun() {
        return tahun;
    }

    public void setTahun(String tahun) {
        this.tahun = tahun;
    }
}
