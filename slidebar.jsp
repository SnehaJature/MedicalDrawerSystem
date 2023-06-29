<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <div class="main-content">
<div class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left cbp-spmenu-open" id="cbp-spmenu-s1">
		<!--left-fixed -navigation-->
		<aside class="sidebar-left">
      <nav class="navbar navbar-inverse">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".collapse" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            </button>
            <h1><a class="navbar-brand" href="index.jsp"><span class="fa fa-area-chart"></span> Medical<span class="dashboard_text">Medical Drawer</span></a></h1>
          </div>
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="sidebar-menu">
              <li class="header"></li>
              <li class="treeview">
                <a href="index.jsp">
                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                </a>
              </li>
			  <li class="treeview">
                <a href="#">
                <i class="fa fa-laptop"></i>
                <span>Drawers Section</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li><a href="addDrawer.jsp"><i class="fa fa-angle-right"></i> Add Drawers</a></li>
                 
                </ul>
              </li>
              
              <li class="treeview">
                <a href="#">
                <i class="fa fa-laptop"></i>
                <span>Tablet Section</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li><a href="addTablets.jsp"><i class="fa fa-angle-right"></i> Add Tablets</a></li>
                   <li><a href="viewTablets.jsp"><i class="fa fa-angle-right"></i> View Tablets</a></li>
                 
                </ul>
              </li>
              
              <li class="treeview">
                <a href="#">
                <i class="fa fa-laptop"></i>
                <span>Bill Section</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li><a href="addBill.jsp"><i class="fa fa-angle-right"></i> Add Bill</a></li>
                   <li><a href="viewBill.jsp"><i class="fa fa-angle-right"></i> View Bill</a></li>
                 
                </ul>
              </li>
              

            </ul>
          </div>
          <!-- /.navbar-collapse -->
      </nav>
    </aside>
	</div>
		<!--left-fixed -navigation-->