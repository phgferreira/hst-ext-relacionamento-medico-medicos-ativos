select pr.NM_PRESTADOR NOME, pr.DS_CODIGO_CONSELHO CD_CONSELHO, pr.DS_EMAIL EMAIL,
es.DS_ESPECIALID ESPECIALIDADE, tic.DS_TIP_COMUN TIPO, prt.DS_TIP_COMUN_PREST NUMERO,
max(pdc.dh_criacao) ult_documento

from PRESTADOR PR

inner join ESP_MED ESPM
on pr.CD_PRESTADOR = espm.CD_PRESTADOR

inner join ESPECIALID ES
on espm.CD_ESPECIALID = es.CD_ESPECIALID

--inner join CONSELHO CONS
--on pr.CD_CONSELHO =  cons.CD_CONSELHO

inner join PRESTADOR_TIP_COMUN PRT
on pr.CD_PRESTADOR = prt.CD_PRESTADOR

inner join TIP_COMUN TIC
on prt.CD_TIP_COMUN = tic.CD_TIP_COMUN

inner join empresa_prestador e on e.cd_prestador = pr.cd_prestador

left join dbamv.pw_documento_clinico pdc   on pdc.cd_prestador = pr.cd_prestador
--inner join dbamv.pre_med pm                 on pm.cd_prestador = pr.cd_prestador

where espm.SN_ESPECIAL_PRINCIPAL = 'S' and pr.tp_situacao = 'A' and pr.cd_conselho = 27
and e.cd_multi_empresa = 4

group by pr.NM_PRESTADOR, pr.DS_CODIGO_CONSELHO, pr.DS_EMAIL,
es.DS_ESPECIALID, tic.DS_TIP_COMUN, prt.DS_TIP_COMUN_PREST
order by nome
