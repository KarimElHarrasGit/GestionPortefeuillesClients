/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import beans.resultatrequete;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.MagasinHelper;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

/**
 *
 * @author kelharra
 */
public class Controlleur extends MultiActionController {

    MagasinHelper requeteur;
    String erreur;

    public ModelAndView afficherClients(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        try {
            requeteur = new MagasinHelper();
            resultatrequete a = new resultatrequete();
            a.setResult(requeteur.getClients());
            return new ModelAndView("resultat").addObject("resultat", a);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ModelAndView detailClient(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        try {
            requeteur = new MagasinHelper();
            resultatrequete a = new resultatrequete();
            a.setClient(requeteur.getClient(Integer.parseInt(request.getParameter("Operation"))));
            resultatrequete b = new resultatrequete();
            b.setResult(requeteur.getDiscountCode());
            resultatrequete c = new resultatrequete();
            c.setResult(requeteur.getMicroMarket());
            ModelAndView mv = new ModelAndView("detail");
            mv.addObject("resultat", a);
            mv.addObject("dc", b);
            mv.addObject("zip", c);
            return mv;
        } catch (Exception e) {
            request.setAttribute("erreur", "erreur requete " + e);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
        return null;
    }

    public ModelAndView afficherFormInscriptionClient(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        try {
            requeteur = new MagasinHelper();
            resultatrequete a = new resultatrequete();
            resultatrequete b = new resultatrequete();
            a.setResult(requeteur.getDiscountCode());
            b.setResult(requeteur.getMicroMarket());
            ModelAndView mv = new ModelAndView("form_inscription");
            mv.addObject("dc", a);
            mv.addObject("cp", b);
            return mv;
        } catch (SQLException e) {
            request.setAttribute("erreur", "erreur requete " + e);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
        return null;
    }

    public ModelAndView enregistrerClient(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        try {
            requeteur = new MagasinHelper();
            String param1 = request.getParameter("nom");
            String param2 = request.getParameter("adresse");
            String param3 = request.getParameter("telephone");
            String param4 = request.getParameter("email");
            String param5 = request.getParameter("code_remise");
            String param6 = request.getParameter("CP");
            requeteur.insertCustomer(param1, param2, param3, param4, param5, param6);
            return new ModelAndView("confirm").addObject("confirm", "Enregistrement effectué");
        } catch (Exception e) {
            request.setAttribute("erreur", "erreur requete " + e);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
        return null;
    }

    public ModelAndView modifierClient(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        try {
            requeteur = new MagasinHelper();
            String param1 = request.getParameter("numero");
            String param2 = request.getParameter("nom");
            String param3 = request.getParameter("adresse");
            String param4 = request.getParameter("telephone");
            String param5 = request.getParameter("email");
            Character param6 = request.getParameter("Remise").charAt(0);
            String param7 = request.getParameter("Code_Postal");
            requeteur.updateCustomer(Integer.parseInt(param1), param2, param3, param4, param5, param6, param7);
            return new ModelAndView("confirm").addObject("confirm", "Modification effectuée");  //message de confirmation de modification envoyé à la jsp           
        } catch (Exception e) {
            request.setAttribute("erreur", "erreur requete " + e);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
        return null;
    }

    public ModelAndView supprimerClient(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        try {
            requeteur = new MagasinHelper();
            String param1 = request.getParameter("numero");
            requeteur.deleteCustomer(Integer.parseInt(param1));
            return new ModelAndView("confirm").addObject("confirm", "Suppression effectuée");  //message de confirmation de suppression envoyé à la jsp           
        } catch (Exception e) {
            request.setAttribute("erreur", "erreur requete " + e);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
        return null;
    }

    public ModelAndView afficherAchats(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        try {
            requeteur = new MagasinHelper();
            resultatrequete a = new resultatrequete();
            a.setResult(requeteur.getAchats(Integer.parseInt(request.getParameter("numero"))));
            request.setAttribute("resultat", a);//déclaration de mon javabean dans mes paramètres POST
            return new ModelAndView("achats").addObject("resultat", a);
        } catch (Exception e) {
            request.setAttribute("erreur", "erreur requete " + e);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
        return null;
    }

//    public ModelAndView rechercher(HttpServletRequest request,
//			HttpServletResponse response) throws Exception {
//		
//		return new ModelAndView("affichage").addObject("tableau", liste);
//	}
//    
}
