<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Clientes</title>

<%@ include file="../estrutura/head.jspf"%>
</head>
<body
	class="skin-blue-light fixed sidebar-mini  sidebar-mini wysihtml5-supported skin-blue">

	<%@ include file="../estrutura/cabecalho.jspf"%>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
		<h1>
			Manter cliente <small>INFORMAÇÕES SOBRE O CLIENTE</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Clientes</a></li>
			<li class="active">Manter cliente</li>
		</ol>
		</section>


		<!-- Main content -->
		<section class="content">
		<div class="row">
			<form class="form-horizontal" action="manterCliente" method="post">
				<input name="id" type="hidden" value="${cliente.id}">

				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">Detalhes do Cliente</h3>
						</div>
						<!-- /.box-header -->

						<div class="box-body">

							<div class="col-md-8">

								<div class="form-group col-md-12">
									<label>Nome completo</label> <input type="text"
										class="form-control" id="nome" name="nome" placeholder="Nome"
										value="${cliente.nome}" required>
								</div>
								<!-- /.form-group -->
							</div>

							<div class="col-md-8">
								<div class="form-group col-md-8">
									<label>E-mail</label> <input type="email" class="form-control"
										id="email" name="email" placeholder="Informe o e-mail"
										value="${cliente.email}" required>
								</div>
								<!-- /.form-group -->
							</div>

							<div class="col-md-8">
								<div class="form-group col-md-3">
									<label>Telefone</label> <input type="text" class="form-control"
										id="telefone" name="telefone" placeholder="Informe o telefone"
										value="${cliente.telefone}" required>
								</div>
								<!-- /.form-group -->
							</div>

							<div class="col-md-8">
								<div class="form-group col-md-4">
									<label>CNPJ</label> <input type="text" class="form-control"
										id="cnpj" name="cnpj" placeholder="Informe o CNPJ"
										value="${cliente.cnpj}" required>
								</div>
								<!-- /.form-group -->

							</div>
							<!-- /.col -->

						</div>
						<!-- /.box-body -->

						<div class="box-footer">
							<button type="submit" class="btn btn-primary pull-right">Salvar</button>
						</div>
						<!-- /.box-footer -->

					</div>
					<!-- /.box -->
				</div>
				<!-- /.col -->

				<div class="col-md-12">
					<c:if test="${not empty mensagem}">
						<div class="alert alert-danger alert-dismissable">
							<button type="button" class="close" data-dismiss="alert"
								aria-hidden="true">&times;</button>
							<p>${mensagem}</p>
						</div>
					</c:if>
				</div>
				<!-- /.col -->

				<div class="col-md-12">

					<div class="box box-default">
						<div class="box-header with-border">

							<h3 class="box-title">Endereços</h3>

						</div>
						<!-- /.box-header -->

						<c:if test="${not empty cliente.enderecos}">
							<div class="box-body">

								<div class="col-md-12">
									<table id="tabela" class="table table-bordered table-striped">
										<thead>
											<tr>
												<th style="width: 180px">Tipo</th>
												<th>Endereço</th>
												<th style="width: 200px">Cidade / Estado</th>
												<th style="width: 130px">CEP</th>
												<th>Observação</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${cliente.enderecos}" var="endereco">
												<tr>
													<td>${endereco.tipo}</td>
													<td>${endereco.rua}-<c:choose>
															<c:when test="${not empty endereco.numero}"> Nº ${endereco.numero}
											</c:when>
															<c:when test="${empty endereco.numero}"> S/Nº
											</c:when>
														</c:choose> <c:if test="${not empty endereco.complemento}"> - ${endereco.complemento}</c:if></td>
													<td>${endereco.cidade}/${endereco.estado}</td>
													<td>${endereco.cep}</td>
													<td>${endereco.observacao}</td>
													<td><a class="btn .btn-xs"
														href="alterarEndereco?id=${endereco.id}"> <i
															class="fa fa-edit"></i> Visualizar
													</a> <a class="btn .btn-xs"
														href="excluirEndereco?id=${endereco.id}"> <i
															class="fa  fa-trash"></i> Excluir
													</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- /.div col-->
								</div>

								<!-- /.box body -->
							</div>
						</c:if>

						<div class="box-footer">
							<a
								style="${not empty cliente.id ? 'display:block' : 'display:none'}"
								class="btn btn-primary pull-right" href="cadastrarEndereco">Cadastrar
								novo</a>
						</div>
						<!-- /.box-footer -->

					</div>
					<!-- /.box -->
				</div>
				<!-- /.col -->

			</form>
		</div>
		<!-- /.row --> </section>
		<!-- /.content -->



	</div>
	<!-- /.content-wrapper -->
	<%@ include file="../estrutura/rodape.jspf"%>

	<!-- Select2 -->
	<script src="<c:url value="/resources/plugins/select2/select2.full.min.js" />"
		type="text/javascript"></script>
	<!-- InputMask -->
	<script src="<c:url value="/resources/plugins/input-mask/jquery.inputmask.js" />"
		type="text/javascript"></script>
	<script
		src="<c:url value="/resources/plugins/input-mask/jquery.inputmask.date.extensions.js" />"
		type="text/javascript"></script>
	<script
		src="<c:url value="/resources/plugins/input-mask/jquery.inputmask.extensions.js" />"
		type="text/javascript"></script>

	<script src="<c:url value="/resources/plugins/iCheck/icheck.min.js" />"
		type="text/javascript"></script>
	
	<!-- page script -->
	<script type="text/javascript">
		$(function() {
			//Initialize Select2 Elements
			$(".select2").select2();

			//Datemask dd/mm/yyyy
			$("#datemask").inputmask("dd/mm/yyyy", {
				"placeholder" : "dd/mm/yyyy"
			});
			//Datemask2 mm/dd/yyyy
			$("#datemask2").inputmask("mm/dd/yyyy", {
				"placeholder" : "mm/dd/yyyy"
			});
			//Money Euro
			$("[data-mask]").inputmask();

			//Date range picker
			$('#reservation').daterangepicker();
			//Date range picker with time picker
			$('#reservationtime').daterangepicker({
				timePicker : true,
				timePickerIncrement : 30,
				format : 'MM/DD/YYYY h:mm A'
			});
			//Date range as a button
			$('#daterange-btn').daterangepicker(
					{
						ranges : {
							'Today' : [ moment(), moment() ],
							'Yesterday' : [ moment().subtract(1, 'days'),
									moment().subtract(1, 'days') ],
							'Last 7 Days' : [ moment().subtract(6, 'days'),
									moment() ],
							'Last 30 Days' : [ moment().subtract(29, 'days'),
									moment() ],
							'This Month' : [ moment().startOf('month'),
									moment().endOf('month') ],
							'Last Month' : [
									moment().subtract(1, 'month').startOf(
											'month'),
									moment().subtract(1, 'month')
											.endOf('month') ]
						},
						startDate : moment().subtract(29, 'days'),
						endDate : moment()
					},
					function(start, end) {
						$('#reportrange span').html(
								start.format('MMMM D, YYYY') + ' - '
										+ end.format('MMMM D, YYYY'));
					});

			//iCheck for checkbox and radio inputs
			$('input[type="checkbox"].minimal, input[type="radio"].minimal')
					.iCheck({
						checkboxClass : 'icheckbox_minimal-blue',
						radioClass : 'iradio_minimal-blue'
					});
			//Red color scheme for iCheck
			$(
					'input[type="checkbox"].minimal-red, input[type="radio"].minimal-red')
					.iCheck({
						checkboxClass : 'icheckbox_minimal-red',
						radioClass : 'iradio_minimal-red'
					});
			//Flat red color scheme for iCheck
			$('input[type="checkbox"].flat-red, input[type="radio"].flat-red')
					.iCheck({
						checkboxClass : 'icheckbox_flat-green',
						radioClass : 'iradio_flat-green'
					});

			//Colorpicker
			$(".my-colorpicker1").colorpicker();
			//color picker with addon
			$(".my-colorpicker2").colorpicker();

			//Timepicker
			$(".timepicker").timepicker({
				showInputs : false
			});
		});
	</script>
</body>
</html>