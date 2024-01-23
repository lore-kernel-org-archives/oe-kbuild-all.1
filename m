Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5513058ABB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jan 2024 09:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706001939; cv=none; b=FF0VV7GR0hj3+7P06WAoXlfGpTPLoSA4xXkEfB7LSawmS9F1G3gIzjEJY4HTmWFf9Z6GAmYA4a+Tjvp6onEiTButfmIp7yYGC5P6IOCmhB7Zvhfi7hrk9Cxa2jVVJ65wZkLzTf8uNwfL5ckXDr7cVpEg4ZB7UA6qdcGyet5HoGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706001939; c=relaxed/simple;
	bh=r4YRhZLeSLaO0uN9+71zEwgu+kYHeWqL9fe4m98ZZYM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ef0W428O4mK/fLnxWvtomrmoY7NCdg9p20ZPupd7l7M6C3xAvK7zrYdfs/wJ0Kw/kw4FYPPB24LJnbiveQiwFw1raLH9Yjk7KLot/8q7EZ6Br58k0IziJvamVrYB0PwoXgslTLvatV7kxCZ3tSiXCglC5Qxa+DSTPmMjckXZCvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1rSD26-0001ky-SV; Tue, 23 Jan 2024 10:25:26 +0100
Message-ID: <387720feac4593ac66fac594950975a6a317da46.camel@pengutronix.de>
Subject: Re: [linux-next:master 139/1036]
 drivers/gpu/drm/etnaviv/etnaviv_drv.c:614:3-14: ERROR: probable double put.
 (fwd)
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui JIngfeng <sui.jingfeng@linux.dev>, Julia Lawall
 <julia.lawall@inria.fr>
Cc: Linux Memory Management List <linux-mm@kvack.org>, 
	oe-kbuild-all@lists.linux.dev
Date: Tue, 23 Jan 2024 10:25:25 +0100
In-Reply-To: <8f844ac1-eecf-4ace-854e-6d7d7aad9ad6@linux.dev>
References: <94afe420-f3b-5620-2380-82c9c62838f0@inria.fr>
	 <8f844ac1-eecf-4ace-854e-6d7d7aad9ad6@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: oe-kbuild-all@lists.linux.dev

Hi Jingfeng, hi Julia,

Am Montag, dem 22.01.2024 um 21:49 +0800 schrieb Sui JIngfeng:
> Hi,
>=20
>=20
> On 2024/1/22 20:33, Julia Lawall wrote:
> > The of_node_put on line 614 does not look useful.
>=20
> Simply delete that line would solve this problem, what do you think?
>=20
Yes, that looks right. As the patch was only in etnaviv/next, which is
not a stable branch I amended the patch, dropping this line.

Regards,
Lucas

>=20
> >=20
> > ---------- Forwarded message ----------
> > Date: Mon, 22 Jan 2024 19:18:22 +0800
> > From: kernel test robot <lkp@intel.com>
> > To: oe-kbuild@lists.linux.dev
> > Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> > Subject: [linux-next:master 139/1036]
> >      drivers/gpu/drm/etnaviv/etnaviv_drv.c:614:3-14: ERROR: probable do=
uble put.
> >=20
> > BCC: lkp@intel.com
> > CC: oe-kbuild-all@lists.linux.dev
> > CC: Linux Memory Management List <linux-mm@kvack.org>
> > TO: Sui Jingfeng <suijingfeng@loongson.cn>
> > CC: Lucas Stach <l.stach@pengutronix.de>
> >=20
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   319fbd8fc6d339e0a1c7b067eed870c518a13a02
> > commit: 56df40c804fa40712239478355abe265aeda2197 [139/1036] drm/etnaviv=
: Add a helper to get the first available GPU device node
> > :::::: branch date: 10 hours ago
> > :::::: commit date: 3 months ago
> > config: x86_64-randconfig-102-20240122 (https://download.01.org/0day-ci=
/archive/20240122/202401221903.GjEKVu8R-lkp@intel.com/config)
> > compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm=
/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Reported-by: Julia Lawall <julia.lawall@inria.fr>
> > > Closes: https://lore.kernel.org/r/202401221903.GjEKVu8R-lkp@intel.com=
/
> >=20
> > cocci warnings: (new ones prefixed by >>)
> > > > drivers/gpu/drm/etnaviv/etnaviv_drv.c:614:3-14: ERROR: probable dou=
ble put.
> > vim +614 drivers/gpu/drm/etnaviv/etnaviv_drv.c
> >=20
> > a8c21a5451d831 The etnaviv authors 2015-12-03  597
> > a8c21a5451d831 The etnaviv authors 2015-12-03  598  static int etnaviv_=
pdev_probe(struct platform_device *pdev)
> > a8c21a5451d831 The etnaviv authors 2015-12-03  599  {
> > a8c21a5451d831 The etnaviv authors 2015-12-03  600  	struct device *dev=
 =3D &pdev->dev;
> > 0ea057a9cb2be4 Michael Walle       2021-09-07  601  	struct device_node=
 *first_node =3D NULL;
> > a8c21a5451d831 The etnaviv authors 2015-12-03  602  	struct component_m=
atch *match =3D NULL;
> > a8c21a5451d831 The etnaviv authors 2015-12-03  603
> > 246774d17fc05a Lucas Stach         2018-01-24  604  	if (!dev->platform=
_data) {
> > a8c21a5451d831 The etnaviv authors 2015-12-03  605  		struct device_nod=
e *core_node;
> > a8c21a5451d831 The etnaviv authors 2015-12-03  606
> > 246774d17fc05a Lucas Stach         2018-01-24  607  		for_each_compatib=
le_node(core_node, NULL, "vivante,gc") {
> > 246774d17fc05a Lucas Stach         2018-01-24  608  			if (!of_device_i=
s_available(core_node))
> > 246774d17fc05a Lucas Stach         2018-01-24  609  				continue;
> > a8c21a5451d831 The etnaviv authors 2015-12-03  610
> > 97ac0e47aed5f6 Russell King        2016-10-19  611  			drm_of_component=
_match_add(&pdev->dev, &match,
> > 0a522394202f1f Yong Wu             2022-02-14  612  						   component_=
compare_of, core_node);
> > 56df40c804fa40 Sui Jingfeng        2023-10-02  613
> > 56df40c804fa40 Sui Jingfeng        2023-10-02 @614  			of_node_put(core=
_node);
> > a8c21a5451d831 The etnaviv authors 2015-12-03  615  		}
> > 246774d17fc05a Lucas Stach         2018-01-24  616  	} else {
> > a8c21a5451d831 The etnaviv authors 2015-12-03  617  		char **names =3D =
dev->platform_data;
> > a8c21a5451d831 The etnaviv authors 2015-12-03  618  		unsigned i;
> > a8c21a5451d831 The etnaviv authors 2015-12-03  619
> > a8c21a5451d831 The etnaviv authors 2015-12-03  620  		for (i =3D 0; nam=
es[i]; i++)
> > 0a522394202f1f Yong Wu             2022-02-14  621  			component_match_=
add(dev, &match, component_compare_dev_name, names[i]);
> > a8c21a5451d831 The etnaviv authors 2015-12-03  622  	}
> > a8c21a5451d831 The etnaviv authors 2015-12-03  623
> > f5be833dc86f49 Michael Walle       2021-09-07  624  	/*
> > f5be833dc86f49 Michael Walle       2021-09-07  625  	 * PTA and MTLB ca=
n have 40 bit base addresses, but
> > f5be833dc86f49 Michael Walle       2021-09-07  626  	 * unfortunately, =
an entry in the MTLB can only point to a
> > f5be833dc86f49 Michael Walle       2021-09-07  627  	 * 32 bit base add=
ress of a STLB. Moreover, to initialize the
> > f5be833dc86f49 Michael Walle       2021-09-07  628  	 * MMU we need a c=
ommand buffer with a 32 bit address because
> > f5be833dc86f49 Michael Walle       2021-09-07  629  	 * without an MMU =
there is only an indentity mapping between
> > f5be833dc86f49 Michael Walle       2021-09-07  630  	 * the internal 32=
 bit addresses and the bus addresses.
> > f5be833dc86f49 Michael Walle       2021-09-07  631  	 *
> > f5be833dc86f49 Michael Walle       2021-09-07  632  	 * To make things =
easy, we set the dma_coherent_mask to 32
> > f5be833dc86f49 Michael Walle       2021-09-07  633  	 * bit to make sur=
e we are allocating the command buffers and
> > f5be833dc86f49 Michael Walle       2021-09-07  634  	 * TLBs in the low=
er 4 GiB address space.
> > f5be833dc86f49 Michael Walle       2021-09-07  635  	 */
> > f5be833dc86f49 Michael Walle       2021-09-07  636  	if (dma_set_mask(&=
pdev->dev, DMA_BIT_MASK(40)) ||
> > f5be833dc86f49 Michael Walle       2021-09-07  637  	    dma_set_cohere=
nt_mask(&pdev->dev, DMA_BIT_MASK(32))) {
> > f5be833dc86f49 Michael Walle       2021-09-07  638  		dev_dbg(&pdev->de=
v, "No suitable DMA available\n");
> > f5be833dc86f49 Michael Walle       2021-09-07  639  		return -ENODEV;
> > f5be833dc86f49 Michael Walle       2021-09-07  640  	}
> > f5be833dc86f49 Michael Walle       2021-09-07  641
> > 0ea057a9cb2be4 Michael Walle       2021-09-07  642  	/*
> > 0ea057a9cb2be4 Michael Walle       2021-09-07  643  	 * Apply the same =
DMA configuration to the virtual etnaviv
> > 0ea057a9cb2be4 Michael Walle       2021-09-07  644  	 * device as the G=
PU we found. This assumes that all Vivante
> > 0ea057a9cb2be4 Michael Walle       2021-09-07  645  	 * GPUs in the sys=
tem share the same DMA constraints.
> > 0ea057a9cb2be4 Michael Walle       2021-09-07  646  	 */
> > 56df40c804fa40 Sui Jingfeng        2023-10-02  647  	first_node =3D etn=
aviv_of_first_available_node();
> > 56df40c804fa40 Sui Jingfeng        2023-10-02  648  	if (first_node) {
> > 0ea057a9cb2be4 Michael Walle       2021-09-07  649  		of_dma_configure(=
&pdev->dev, first_node, true);
> > 56df40c804fa40 Sui Jingfeng        2023-10-02  650  		of_node_put(first=
_node);
> > 56df40c804fa40 Sui Jingfeng        2023-10-02  651  	}
> > 0ea057a9cb2be4 Michael Walle       2021-09-07  652
> > a8c21a5451d831 The etnaviv authors 2015-12-03  653  	return component_m=
aster_add_with_match(dev, &etnaviv_master_ops, match);
> > a8c21a5451d831 The etnaviv authors 2015-12-03  654  }
> > a8c21a5451d831 The etnaviv authors 2015-12-03  655
> >=20

