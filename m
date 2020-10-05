Content-Type: multipart/mixed; boundary="===============8956702368454150982=="
MIME-Version: 1.0
From: Julia Lawall <julia.lawall@inria.fr>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 11257/12819] net/smc/af_smc.c:1719:10-11: WARNING: opportunity for kzfree/kvfree_sensitive (fwd)
Date: Mon, 05 Oct 2020 15:34:45 +0200
Message-ID: <alpine.DEB.2.22.394.2010051533490.2635@hadrien>
In-Reply-To: <20201005152935.045d9c122713383087f8a401@linux.ibm.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8956702368454150982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On Mon, 5 Oct 2020, Karsten Graul wrote:

>
> Thanks for the note Julia, we also saw this message before and we plan to=
 fix it.
> Its not that kzfree() would help here, the memset is done because we use =
this area
> again for another socket receive, using the pointer cclc2:
>
> 	cclc2 =3D (struct smc_clc_msg_accept_confirm_v2 *)buf;
>
> But the checker assumes that the code does a final memset() before callin=
g kfree()
> to clear sensitive bytes from the buffer.

OK, sorry for not noticing the false positive.  We should improve the
rule.

julia

>
> Karsten
>
>
> On Fri, 2 Oct 2020 15:59:51 +0200 (CEST)
> Julia Lawall <julia.lawall@inria.fr> wrote:
>
> > Hello,
> >
> > This warning is triggered by the presence of the memset 0 on line 1691.
> >
> > julia
> >
> > ---------- Forwarded message ----------
> > Date: Fri, 2 Oct 2020 07:54:04 +0800
> > From: kernel test robot <lkp@intel.com>
> > To: kbuild(a)lists.01.org
> > Cc: lkp(a)intel.com, Julia Lawall <julia.lawall@lip6.fr>
> > Subject: [linux-next:master 11257/12819] net/smc/af_smc.c:1719:10-11: W=
ARNING:
> >     opportunity for kzfree/kvfree_sensitive
> >
> > CC: kbuild-all(a)lists.01.org
> > TO: Ursula Braun <ubraun@linux.ibm.com>
> > CC: Karsten Graul <kgraul@linux.ibm.com>
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   d39294091fee6b89d9c4a683bb19441b25098330
> > commit: a7c9c5f4af7f6098da68705fc5d86565d0728ef7 [11257/12819] net/smc:=
 CLC accept / confirm V2
> > :::::: branch date: 13 hours ago
> > :::::: commit date: 3 days ago
> > config: i386-randconfig-c001-20200930 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Julia Lawall <julia.lawall@lip6.fr>
> >
> > 	echo
> > 	echo "coccinelle warnings: (new ones prefixed by >>)"
> > 	echo
> > >> net/smc/af_smc.c:1719:10-11: WARNING: opportunity for kzfree/kvfree_=
sensitive
> >
> > vim +1719 net/smc/af_smc.c
> >
> > e6727f39004bd95 Ursula Braun  2017-01-09  1607
> > 7affc809822a4e1 Ursula Braun  2020-09-26  1608  /* setup for connection=
 of server */
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1609  static void smc_listen_=
work(struct work_struct *work)
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1610  {
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1611  	struct smc_sock *new_s=
mc =3D container_of(work, struct smc_sock,
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1612  						smc_listen_work);
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1613  	struct socket *newclcs=
ock =3D new_smc->clcsock;
> > a7c9c5f4af7f609 Ursula Braun  2020-09-26  1614  	struct smc_clc_msg_acc=
ept_confirm_v2 *cclc2;
> > a7c9c5f4af7f609 Ursula Braun  2020-09-26  1615  	struct smc_clc_msg_acc=
ept_confirm *cclc;
> > 6bb14e48ee8d8ec Ursula Braun  2020-09-10  1616  	struct smc_clc_msg_pro=
posal_area *buf;
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1617  	struct smc_clc_msg_pro=
posal *pclc;
> > 3fc6493761372c5 Ursula Braun  2020-09-26  1618  	struct smc_init_info *=
ini =3D NULL;
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1619  	int rc =3D 0;
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1620
> > fd57770dd198f5b Karsten Graul 2019-04-11  1621  	if (new_smc->listen_sm=
c->sk.sk_state !=3D SMC_LISTEN)
> > fd57770dd198f5b Karsten Graul 2019-04-11  1622  		return smc_listen_out=
_err(new_smc);
> > fd57770dd198f5b Karsten Graul 2019-04-11  1623
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1624  	if (new_smc->use_fallb=
ack) {
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1625  		smc_listen_out_connec=
ted(new_smc);
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1626  		return;
> > a046d57da19f812 Ursula Braun  2017-01-09  1627  	}
> > a046d57da19f812 Ursula Braun  2017-01-09  1628
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1629  	/* check if peer is sm=
c capable */
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1630  	if (!tcp_sk(newclcsock=
->sk)->syn_smc) {
> > 07603b230895a74 Ursula Braun  2019-04-11  1631  		smc_switch_to_fallbac=
k(new_smc);
> > 603cc1498455cf5 Karsten Graul 2018-07-25  1632  		new_smc->fallback_rsn=
 =3D SMC_CLC_DECL_PEERNOSMC;
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1633  		smc_listen_out_connec=
ted(new_smc);
> > a046d57da19f812 Ursula Braun  2017-01-09  1634  		return;
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1635  	}
> > a046d57da19f812 Ursula Braun  2017-01-09  1636
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1637  	/* do inband token exc=
hange -
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1638  	 * wait for and receiv=
e SMC Proposal CLC message
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1639  	 */
> > 6bb14e48ee8d8ec Ursula Braun  2020-09-10  1640  	buf =3D kzalloc(sizeof=
(*buf), GFP_KERNEL);
> > 6bb14e48ee8d8ec Ursula Braun  2020-09-10  1641  	if (!buf) {
> > 6bb14e48ee8d8ec Ursula Braun  2020-09-10  1642  		rc =3D SMC_CLC_DECL_M=
EM;
> > 6bb14e48ee8d8ec Ursula Braun  2020-09-10  1643  		goto out_decl;
> > 6bb14e48ee8d8ec Ursula Braun  2020-09-10  1644  	}
> > 6bb14e48ee8d8ec Ursula Braun  2020-09-10  1645  	pclc =3D (struct smc_c=
lc_msg_proposal *)buf;
> > 6bb14e48ee8d8ec Ursula Braun  2020-09-10  1646  	rc =3D smc_clc_wait_ms=
g(new_smc, pclc, sizeof(*buf),
> > 2b59f58e34e78ab Ursula Braun  2018-11-22  1647  			      SMC_CLC_PROPOS=
AL, CLC_WAIT_TIME);
> > 9aa68d298c80d11 Karsten Graul 2019-04-12  1648  	if (rc)
> > 9aa68d298c80d11 Karsten Graul 2019-04-12  1649  		goto out_decl;
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1650
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1651  	/* IPSec connections o=
pt out of SMC-R optimizations */
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1652  	if (using_ipsec(new_sm=
c)) {
> > 9aa68d298c80d11 Karsten Graul 2019-04-12  1653  		rc =3D SMC_CLC_DECL_I=
PSEC;
> > 9aa68d298c80d11 Karsten Graul 2019-04-12  1654  		goto out_decl;
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1655  	}
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1656
> > 3fc6493761372c5 Ursula Braun  2020-09-26  1657  	ini =3D kzalloc(sizeof=
(*ini), GFP_KERNEL);
> > 3fc6493761372c5 Ursula Braun  2020-09-26  1658  	if (!ini) {
> > 3fc6493761372c5 Ursula Braun  2020-09-26  1659  		rc =3D SMC_CLC_DECL_M=
EM;
> > 3fc6493761372c5 Ursula Braun  2020-09-26  1660  		goto out_decl;
> > 3fc6493761372c5 Ursula Braun  2020-09-26  1661  	}
> > 3fc6493761372c5 Ursula Braun  2020-09-26  1662
> > 5c21c4ccafe8590 Ursula Braun  2020-09-26  1663  	/* initial version che=
cking */
> > 5c21c4ccafe8590 Ursula Braun  2020-09-26  1664  	rc =3D smc_listen_v2_c=
heck(new_smc, pclc, ini);
> > 5c21c4ccafe8590 Ursula Braun  2020-09-26  1665  	if (rc)
> > 9aa68d298c80d11 Karsten Graul 2019-04-12  1666  		goto out_decl;
> > fba7e8ef513ce73 Karsten Graul 2019-04-12  1667
> > 72a36a8aecb520f Hans Wippel   2019-02-07  1668  	mutex_lock(&smc_server=
_lgr_pending);
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1669  	smc_close_init(new_smc=
);
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1670  	smc_rx_init(new_smc);
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1671  	smc_tx_init(new_smc);
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1672
> > 7affc809822a4e1 Ursula Braun  2020-09-26  1673  	/* determine ISM or Ro=
CE device used for connection */
> > 3fc6493761372c5 Ursula Braun  2020-09-26  1674  	rc =3D smc_listen_find=
_device(new_smc, pclc, ini);
> > 9aa68d298c80d11 Karsten Graul 2019-04-12  1675  	if (rc)
> > 9aa68d298c80d11 Karsten Graul 2019-04-12  1676  		goto out_unlock;
> > a046d57da19f812 Ursula Braun  2017-01-09  1677
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1678  	/* send SMC Accept CLC=
 message */
> > a7c9c5f4af7f609 Ursula Braun  2020-09-26  1679  	rc =3D smc_clc_send_ac=
cept(new_smc, ini->first_contact_local,
> > a7c9c5f4af7f609 Ursula Braun  2020-09-26  1680  				 ini->smcd_version =
=3D=3D SMC_V2 ? SMC_V2 : SMC_V1);
> > 9aa68d298c80d11 Karsten Graul 2019-04-12  1681  	if (rc)
> > 9aa68d298c80d11 Karsten Graul 2019-04-12  1682  		goto out_unlock;
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1683
> > 62c7139f3ed0113 Hans Wippel   2019-02-07  1684  	/* SMC-D does not need=
 this lock any more */
> > 3fc6493761372c5 Ursula Braun  2020-09-26  1685  	if (ini->is_smcd)
> > 72a36a8aecb520f Hans Wippel   2019-02-07  1686  		mutex_unlock(&smc_ser=
ver_lgr_pending);
> > 62c7139f3ed0113 Hans Wippel   2019-02-07  1687
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1688  	/* receive SMC Confirm=
 CLC message */
> > a7c9c5f4af7f609 Ursula Braun  2020-09-26  1689  	cclc2 =3D (struct smc_=
clc_msg_accept_confirm_v2 *)buf;
> > a7c9c5f4af7f609 Ursula Braun  2020-09-26  1690  	cclc =3D (struct smc_c=
lc_msg_accept_confirm *)cclc2;
> > a7c9c5f4af7f609 Ursula Braun  2020-09-26  1691  	memset(buf, 0, sizeof(=
struct smc_clc_msg_proposal_area));
> > a7c9c5f4af7f609 Ursula Braun  2020-09-26  1692  	rc =3D smc_clc_wait_ms=
g(new_smc, cclc2,
> > a7c9c5f4af7f609 Ursula Braun  2020-09-26  1693  			      sizeof(struct =
smc_clc_msg_proposal_area),
> > 2b59f58e34e78ab Ursula Braun  2018-11-22  1694  			      SMC_CLC_CONFIR=
M, CLC_WAIT_TIME);
> > 228bae05be32804 Karsten Graul 2019-04-12  1695  	if (rc) {
> > 3fc6493761372c5 Ursula Braun  2020-09-26  1696  		if (!ini->is_smcd)
> > 9aa68d298c80d11 Karsten Graul 2019-04-12  1697  			goto out_unlock;
> > 9aa68d298c80d11 Karsten Graul 2019-04-12  1698  		goto out_decl;
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1699  	}
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1700
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1701  	/* finish worker */
> > 3fc6493761372c5 Ursula Braun  2020-09-26  1702  	if (!ini->is_smcd) {
> > a7c9c5f4af7f609 Ursula Braun  2020-09-26  1703  		rc =3D smc_listen_rdm=
a_finish(new_smc, cclc,
> > 3fc6493761372c5 Ursula Braun  2020-09-26  1704  					    ini->first_con=
tact_local);
> > 62c7139f3ed0113 Hans Wippel   2019-02-07  1705  		if (rc)
> > 0c881ada3d1e7f5 Ursula Braun  2020-09-10  1706  			goto out_unlock;
> > 0c881ada3d1e7f5 Ursula Braun  2020-09-10  1707  		mutex_unlock(&smc_ser=
ver_lgr_pending);
> > 1ca52fcfaca4366 Ursula Braun  2018-09-18  1708  	}
> > a7c9c5f4af7f609 Ursula Braun  2020-09-26  1709  	smc_conn_save_peer_inf=
o(new_smc, cclc);
> > 3b2dec2603d5b06 Hans Wippel   2018-05-18  1710  	smc_listen_out_connect=
ed(new_smc);
> > ac679364b98edb4 Ursula Braun  2020-09-17  1711  	goto out_free;
> > 9aa68d298c80d11 Karsten Graul 2019-04-12  1712
> > 9aa68d298c80d11 Karsten Graul 2019-04-12  1713  out_unlock:
> > 9aa68d298c80d11 Karsten Graul 2019-04-12  1714  	mutex_unlock(&smc_serv=
er_lgr_pending);
> > 9aa68d298c80d11 Karsten Graul 2019-04-12  1715  out_decl:
> > a7c9c5f4af7f609 Ursula Braun  2020-09-26  1716  	smc_listen_decline(new=
_smc, rc, ini);
> > ac679364b98edb4 Ursula Braun  2020-09-17  1717  out_free:
> > 3fc6493761372c5 Ursula Braun  2020-09-26  1718  	kfree(ini);
> > 6bb14e48ee8d8ec Ursula Braun  2020-09-10 @1719  	kfree(buf);
> > a046d57da19f812 Ursula Braun  2017-01-09  1720  }
> > a046d57da19f812 Ursula Braun  2017-01-09  1721
> >
> > :::::: The code at line 1719 was first introduced by commit
> > :::::: 6bb14e48ee8d8ec23d191fd91de33f09da1ecce4 net/smc: dynamic alloca=
tion of CLC proposal buffer
> >
> > :::::: TO: Ursula Braun <ubraun@linux.ibm.com>
> > :::::: CC: David S. Miller <davem@davemloft.net>
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>
>
> --
> Karsten Graul <kgraul@linux.ibm.com>
>
--===============8956702368454150982==--

