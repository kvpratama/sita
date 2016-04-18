/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sita.model;

import java.util.ArrayList;
import sita.domain.Dosen;
import sita.domain.PembimbingTA;
import sita.domain.TA;
import sita.domain.TASearchResult;
import sita.services.Search;

/**
 *
 * @author kpratama
 */
public class SearchTA {

    public int countRow(String keyword) {
        Search s = new Search();
        int count = s.count(createCountQuery(keyword));
        return count;
    }

    public ArrayList<TASearchResult> search(String keyword) {
        Search s = new Search();
        ArrayList<TA> ta = s.search(createSelectQuery(keyword));
        ArrayList<PembimbingTA> pta = s.getPembimbing();
        ArrayList<Dosen> dosen = s.getDosen();
        ArrayList<TASearchResult> taSearch = new ArrayList<TASearchResult>();
        String[] d = new String[2];

        for (int i = 0; i < ta.size(); i++) {
            int l = 0;
            for (int j = 0; j < pta.size(); j++) {
                if (ta.get(i).getNim().equals(pta.get(j).getNim())) {
                    for (int k = 0; k < dosen.size(); k++) {
                        if (pta.get(j).getId_dosen().equals(dosen.get(k).getDosen_id())) {
                            d[l] = dosen.get(k).getName();
                            l++;
                        }
                    }
                }
            }
            TASearchResult tas = new TASearchResult();
            tas.setJudul(ta.get(i).getJudul());
            tas.setNama(ta.get(i).getNama_mahasiswa());
            tas.setTahun(ta.get(i).getTahun());
            tas.setDosen1(d[0]);
            tas.setDosen2(d[1]);
            tas.setAbstrak(ta.get(i).getAbstrak());
            taSearch.add(tas);
        }
        return taSearch;
    }

    public String[] keywordFact(String keyword) {
        int count = 0;
        for (int i = 0; i < keyword.length(); i++) {
            if (keyword.charAt(i) == ' ') {
                count++;
            }
        }
        String[] keywords = new String[count + 1];
        int first = 0;
        int i = 0;
        for (int j = 0; j < keyword.length(); j++) {
            if (j == keyword.length() - 1) {
                keywords[i] = keyword.substring(first, j + 1);
            } else if (keyword.charAt(j) == ' ') {
                keywords[i] = keyword.substring(first, j);
                first = j + 1;
                i++;
            }
        }
        return keywords;
    }

    public String createSelectQuery(String keyword) {
        String addQuery = "judul like \"%";
        String orQuery = "%\" or ";
        String closeQuery = "%\"";
        String query = "select t.nim, t.judul, m.nama_mahasiswa, t.tahun, substring(t.abstrak, 1, 100), t.path, t.status from mahasiswa m join ta t on m.nim = t.nim where (";
//        String query = "select nim, judul, nama_mahasiswa, tahun, "
//                + "substring(abstrak, 1, 100), abstrak, path, status "
//                + "from mahasiswa natural join ta "
//                + "where ";
        String[] keywords = keywordFact(keyword);

        return queryMaker(addQuery, orQuery, closeQuery, query, keywords);
    }

    public String queryMaker(String addQuery, String orQuery, String closeQuery,
            String query, String[] keywords) {
        for (int i = 0; i < keywords.length; i++) {
            if (i == keywords.length - 1) {
                query = query + addQuery + keywords[i] + closeQuery;
            } else {
                query = query + addQuery + keywords[i] + orQuery;
            }
        }
        return query + ") and status = 'active'";
    }

    public String createCountQuery(String keyword) {
        String addQuery = "judul like (\"%";
        String orQuery = "%\" or ";
        String closeQuery = "%\"";
        String query = "select count(judul)from ta where ";
        String[] keywords = keywordFact(keyword);
//        System.out.println("count q: " + queryMaker(addQuery, orQuery, closeQuery, query, keywords));
        return queryMaker(addQuery, orQuery, closeQuery, query, keywords);
    }

    public ArrayList<TASearchResult> searchByJudul(String judul) {
        String query = "select nim, judul, nama_mahasiswa, tahun, abstrak, path, status "
                + "from mahasiswa natural join ta "
                + "where judul = '" + judul + "'";
        Search s = new Search();
//        String q = query + "'" + judul + "'";
//        System.out.println(q);
        ArrayList<TA> ta = s.search(query);
        ArrayList<PembimbingTA> pta = s.getPembimbing();
        ArrayList<Dosen> dosen = s.getDosen();
        ArrayList<TASearchResult> taSearch = new ArrayList<TASearchResult>();
        String[] d = new String[2];

        for (int i = 0; i < ta.size(); i++) {
            int l = 0;
            for (int j = 0; j < pta.size(); j++) {
                if (ta.get(i).getNim().equals(pta.get(j).getNim())) {
                    for (int k = 0; k < dosen.size(); k++) {
                        if (pta.get(j).getId_dosen().equals(dosen.get(k).getDosen_id())) {
                            d[l] = dosen.get(k).getName();
                            l++;
                        }
                    }
                }
            }
            TASearchResult tas = new TASearchResult();
            tas.setJudul(ta.get(i).getJudul());
            tas.setNama(ta.get(i).getNama_mahasiswa());
            tas.setTahun(ta.get(i).getTahun());
            tas.setDosen1(d[0]);
            tas.setDosen2(d[1]);
            tas.setAbstrak(ta.get(i).getAbstrak());
            tas.setPath(ta.get(i).getPath());
            taSearch.add(tas);
        }
        return taSearch;
    }
}