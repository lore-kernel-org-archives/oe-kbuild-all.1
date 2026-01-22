Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF4B34F478
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 09:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769075459; cv=none; b=NsXM/S7qINxAKI61fkLdC6ihErh7S1WndAnADAblaesS4GyqO2y148AYLE75CMcvc4UgxE0/qMoOVyCim7/lFBCFWUQ8xg+VBtaa4rkjJU81SB4aBHVsa8Z0LinRAnwbVG1cskr1YeMJCvzTcWHhqFIxiU4XCRCAIT+UnnhIOeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769075459; c=relaxed/simple;
	bh=SK0TTySXcMAjfptkqz6z6DHd1o9lYyEfqKDxQTvd8s8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QCw9TiMSrX+GoWkPx1qIvqOJhuT0JY8c5HwsCXJ2Lkhf9bWc4hEqHEw3JTda6xvMddFx79LylyYbDE+GdwEwaGZu6UDsdfAFNdQjtKIOBeHLeYQ0JY281PpHYtxvPq10IevlrOZ71wxixGXgZKfex+ASApu7hjiN2EJnwcVipQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AmCata5W; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AmCata5W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769075455; x=1800611455;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SK0TTySXcMAjfptkqz6z6DHd1o9lYyEfqKDxQTvd8s8=;
  b=AmCata5WfYB4nI6HQXzlFNbB36FLufeHNxmHjcBPyssgUuibW7D0ZRjz
   /rncwcyn/w3AxA94WIEM+k6Ou1fmVogTw59bjbbLRWYQw5TxT3TACjUS6
   VCI4xTKBGp/QuDZ9/gXgJj473HuIaouU5vYDGcxbibjonT08ZjjlrR5Gd
   NHixBYzr51tLzgVC8Xpdwicdq7JLkARm3ARJ/ApzYZpjqiuxS0c5hXbnf
   qmSkQDBHuaj7THXE9vGfJeIE0yIbYC9qbUGObbmxWLm6TzHJOczNsS7PC
   GI0gUHdN4WqHK0RZwV5gkc2NQAiB4/c0FmZkPQadpVae9LctELWrp41sT
   Q==;
X-CSE-ConnectionGUID: u8HVVhW3RDaoBelxI2ulhg==
X-CSE-MsgGUID: rNRbnt4CQtC0vyjJ9baclg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70221298"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="70221298"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 01:50:53 -0800
X-CSE-ConnectionGUID: XhrOG6FVSw6o2rJu7+7Cog==
X-CSE-MsgGUID: DZaLsH8GS5yjqQgxFB6Hig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="237951563"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jan 2026 01:50:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1virKz-00000000ShH-2Duh;
	Thu, 22 Jan 2026 09:50:49 +0000
Date: Thu, 22 Jan 2026 17:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/gpib/eastwood/fluke_gpib.c:1002:23: error: call to
 undeclared function 'ioremap'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202601221748.AFAqHieJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Dave,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a66191c590b3b58eaff05d2277971f854772bd5b
commit: e6ab504633e4c06e35377ecf3c8cbc304de79858 staging: gpib: Destage gpib
date:   8 weeks ago
config: s390-randconfig-r132-20260122 (https://download.01.org/0day-ci/arch=
ive/20260122/202601221748.AFAqHieJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260122/202601221748.AFAqHieJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221748.AFAqHieJ-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> drivers/gpib/eastwood/fluke_gpib.c:1002:23: error: call to undeclared fu=
nction 'ioremap'; ISO C99 and later do not support implicit function declar=
ations [-Wimplicit-function-declaration]
    1002 |         nec_priv->mmiobase =3D ioremap(e_priv->gpib_iomem_res->s=
tart,
         |                              ^
>> drivers/gpib/eastwood/fluke_gpib.c:1002:21: error: incompatible integer =
to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
    1002 |         nec_priv->mmiobase =3D ioremap(e_priv->gpib_iomem_res->s=
tart,
         |                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
    1003 |                                      resource_size(e_priv->gpib_=
iomem_res));
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   drivers/gpib/eastwood/fluke_gpib.c:1036:33: error: incompatible integer =
to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
    1036 |         e_priv->write_transfer_counter =3D ioremap(e_priv->write=
_transfer_counter_res->start,
         |                                        ^ ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1037 |                                                  resource_size(e=
_priv->write_transfer_counter_res));
         |                                                  ~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/ioremap +1002 drivers/gpib/eastwood/fluke_gpib.c

55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   962 =20
4800ec89999049 drivers/staging/gpib/eastwood/fluke_gpib.c Michael Rubin 202=
5-04-08   963  static int fluke_attach_impl(struct gpib_board *board, const=
 struct gpib_board_config *config,
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   964  			     unsigned int handshake_mode)
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   965  {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   966  	struct fluke_priv *e_priv;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   967  	struct nec7210_priv *nec_priv;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   968  	int isr_flags =3D 0;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   969  	int retval;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   970  	int irq;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   971  	struct resource *res;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   972  	dma_cap_mask_t dma_cap;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   973 =20
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   974  	if (!fluke_gpib_pdev) {
f2bda0b660bd37 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
5-02-14   975  		dev_err(board->gpib_dev, "No fluke device was found, attac=
h failed.\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   976  		return -ENODEV;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   977  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   978 =20
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   979  	retval =3D fluke_generic_attach(board);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   980  	if (retval)
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   981  		return retval;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   982 =20
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   983  	e_priv =3D board->private_data;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   984  	nec_priv =3D &e_priv->nec7210_priv;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   985  	nec_priv->offset =3D fluke_reg_offset;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   986  	board->dev =3D &fluke_gpib_pdev->dev;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   987 =20
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   988  	res =3D platform_get_resource(fluke_gpib_pdev, IORESOURCE_M=
EM, 0);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   989  	if (!res) {
f2bda0b660bd37 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
5-02-14   990  		dev_err(&fluke_gpib_pdev->dev, "Unable to locate mmio reso=
urce\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   991  		return -ENODEV;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   992  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   993 =20
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   994  	if (request_mem_region(res->start,
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   995  			       resource_size(res),
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   996  			       fluke_gpib_pdev->name) =3D=3D NULL) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   997  		dev_err(&fluke_gpib_pdev->dev, "cannot claim registers\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   998  		return -ENXIO;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18   999  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1000  	e_priv->gpib_iomem_res =3D res;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1001 =20
baf8855c916007 drivers/staging/gpib/eastwood/fluke_gpib.c Arnd Bergmann 202=
4-12-13 @1002  	nec_priv->mmiobase =3D ioremap(e_priv->gpib_iomem_res->star=
t,
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1003  				     resource_size(e_priv->gpib_iomem_res));
baf8855c916007 drivers/staging/gpib/eastwood/fluke_gpib.c Arnd Bergmann 202=
4-12-13  1004  	if (!nec_priv->mmiobase) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1005  		dev_err(&fluke_gpib_pdev->dev, "Could not map I/O memory\n=
");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1006  		return -ENOMEM;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1007  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1008 =20
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1009  	res =3D platform_get_resource(fluke_gpib_pdev, IORESOURCE_M=
EM, 1);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1010  	if (!res) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1011  		dev_err(&fluke_gpib_pdev->dev, "Unable to locate mmio reso=
urce for gpib dma port\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1012  		return -ENODEV;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1013  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1014  	if (request_mem_region(res->start,
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1015  			       resource_size(res),
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1016  			       fluke_gpib_pdev->name) =3D=3D NULL) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1017  		dev_err(&fluke_gpib_pdev->dev, "cannot claim registers\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1018  		return -ENXIO;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1019  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1020  	e_priv->dma_port_res =3D res;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1021 =20
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1022  	res =3D platform_get_resource(fluke_gpib_pdev, IORESOURCE_M=
EM, 2);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1023  	if (!res) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1024  		dev_err(&fluke_gpib_pdev->dev, "Unable to locate mmio reso=
urce for write transfer counter\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1025  		return -ENODEV;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1026  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1027 =20
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1028  	if (request_mem_region(res->start,
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1029  			       resource_size(res),
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1030  			       fluke_gpib_pdev->name) =3D=3D NULL) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1031  		dev_err(&fluke_gpib_pdev->dev, "cannot claim registers\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1032  		return -ENXIO;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1033  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1034  	e_priv->write_transfer_counter_res =3D res;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1035 =20
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1036  	e_priv->write_transfer_counter =3D ioremap(e_priv->write_tr=
ansfer_counter_res->start,
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1037  						 resource_size(e_priv->write_transfer_counter_res));
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1038  	if (!e_priv->write_transfer_counter) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1039  		dev_err(&fluke_gpib_pdev->dev, "Could not map I/O memory\n=
");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1040  		return -ENOMEM;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1041  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1042 =20
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1043  	irq =3D platform_get_irq(fluke_gpib_pdev, 0);
51ab134daf5b9b drivers/staging/gpib/eastwood/fluke_gpib.c Chen Ni       202=
5-04-07  1044  	if (irq < 0)
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1045  		return -EBUSY;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1046  	retval =3D request_irq(irq, fluke_gpib_interrupt, isr_flags=
, fluke_gpib_pdev->name, board);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1047  	if (retval) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1048  		dev_err(&fluke_gpib_pdev->dev,
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1049  			"cannot register interrupt handler err=3D%d\n",
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1050  			retval);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1051  		return retval;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1052  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1053  	e_priv->irq =3D irq;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1054 =20
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1055  	dma_cap_zero(dma_cap);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1056  	dma_cap_set(DMA_SLAVE, dma_cap);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1057  	e_priv->dma_channel =3D dma_request_channel(dma_cap, gpib_d=
ma_channel_filter, NULL);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1058  	if (!e_priv->dma_channel) {
f2bda0b660bd37 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
5-02-14  1059  		dev_err(board->gpib_dev, "failed to allocate a dma channel=
.\n");
073b54f342be3e drivers/staging/gpib/eastwood/fluke_gpib.c Paul Retourn=C3=
=A9 2025-04-11  1060  		/*
073b54f342be3e drivers/staging/gpib/eastwood/fluke_gpib.c Paul Retourn=C3=
=A9 2025-04-11  1061  		 * we don't error out here because unaccel interfac=
e will still
073b54f342be3e drivers/staging/gpib/eastwood/fluke_gpib.c Paul Retourn=C3=
=A9 2025-04-11  1062  		 * work without dma
073b54f342be3e drivers/staging/gpib/eastwood/fluke_gpib.c Paul Retourn=C3=
=A9 2025-04-11  1063  		 */
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1064  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1065 =20
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1066  	return fluke_init(e_priv, board, handshake_mode);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1067  }
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  202=
4-09-18  1068 =20

:::::: The code at line 1002 was first introduced by commit
:::::: baf8855c916007a8a372576b65492316f43ed60b staging: gpib: fix address =
space mixup

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
