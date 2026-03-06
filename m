Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E2C31E854
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 05:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772775722; cv=none; b=eMaHUD1LQs6fq4H64V+zPZQOhPaej6tQj51kZYm1lPDHEFBjZjmXUyzLWhez2ssf5hJMuyrgqS86PVcGKL2mWZRgHORt2JOfTuO0R4R77bCAsBGXISa44mBGTc0MHQ1MgQvvbgCWowZNME6fyhnRgjYmBXLV69FwJ67896T3dRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772775722; c=relaxed/simple;
	bh=R0ZISotv0Pe0I5Ibg+ECnamKPa7j3+VrBI6muX3OL1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DYOYGLdxeXVQ5S1fQUeZAvz0vDohWnsBqxGhO50dfuibnaBd5XQo23qB2xQttnjJDIIPtO+BuUUD5qKRwn6Eg5KamiUHwGy3hyHJBSQPooZpiIHhV9psJ2s8iftFQJfRcaJ7bUtPnnLas7iH+A22Fi5GkFUCIETLZkQzJkGhVWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjtVrfvV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjtVrfvV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772775722; x=1804311722;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=R0ZISotv0Pe0I5Ibg+ECnamKPa7j3+VrBI6muX3OL1g=;
  b=hjtVrfvVSpttZwha/+iX2t4lM3W1h7IxaWu88ERs1NfbACY6OuIZ2B5t
   evJ6vtMPOLRA5Fm6ask2KNfW3pxUajyf4f8BCFIOqol/tNSM93Wl3gDga
   +J1Gh6yzaabsMyNnCVHkAewPHHfR4TP7UJ4A22UexJv87lRWaLOU43Pnc
   CE0DZZuYsqclcBape6B0DrehHuXVf9KmB1NqJnMsNhHJhqlF/JZJizUJY
   12iIlJEnZcDQmXLhOTiIOZVnb+tn78gZNtCgCqhz+pQRPyzbEP8sjEYQ9
   iawxRlPo1XE2IMELbVpZ4/vk2SCSJiWrQs/1gCwoit9XqjWavzqRrbJmK
   g==;
X-CSE-ConnectionGUID: UMGp5etuQrudUaLorrayWQ==
X-CSE-MsgGUID: poTSLxgRQkSAXjAdWwoBlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="85351555"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="85351555"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 21:42:02 -0800
X-CSE-ConnectionGUID: oF7WW7dyRz2rHBrWREEXuA==
X-CSE-MsgGUID: p2MBlSXET/GsuHWoauHoSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="218863868"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Mar 2026 21:41:58 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyNwh-000000000PX-49hO;
	Fri, 06 Mar 2026 05:41:55 +0000
Date: Fri, 06 Mar 2026 13:41:17 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:tsu 10/10]
 drivers/net/ethernet/cadence/macb_main.c:4320:29: warning: unused variable
 'np'
Message-ID: <202603061353.1XrtNTvO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git tsu
head:   f1a69ca8e9945732f492b2a9904a721faa55a753
commit: caabb51b836b75217ed258f9ecefe2791396d806 [10/10] net: macb: rework =
usrio refclk selection code
config: i386-randconfig-141-20260306 (https://download.01.org/0day-ci/archi=
ve/20260306/202603061353.1XrtNTvO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260306/202603061353.1XrtNTvO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061353.1XrtNTvO-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/cadence/macb_main.c: In function 'macb_configure_ca=
ps':
>> drivers/net/ethernet/cadence/macb_main.c:4320:29: warning: unused variab=
le 'np' [-Wunused-variable]
    4320 |         struct device_node *np =3D bp->pdev->dev.of_node;
         |                             ^~


vim +/np +4320 drivers/net/ethernet/cadence/macb_main.c

5f1fa992382cf8 drivers/net/macb.c                       Alexander Beregalov=
 2009-04-11  4313 =20
64ec42fe272322 drivers/net/ethernet/cadence/macb.c      Moritz Fischer     =
 2016-03-29  4314  /* Configure peripheral capabilities according to device=
 tree
e175587f4d32de drivers/net/ethernet/cadence/macb.c      Nicolas Ferre      =
 2014-07-24  4315   * and integration options used
e175587f4d32de drivers/net/ethernet/cadence/macb.c      Nicolas Ferre      =
 2014-07-24  4316   */
64ec42fe272322 drivers/net/ethernet/cadence/macb.c      Moritz Fischer     =
 2016-03-29  4317  static void macb_configure_caps(struct macb *bp,
64ec42fe272322 drivers/net/ethernet/cadence/macb.c      Moritz Fischer     =
 2016-03-29  4318  				const struct macb_config *dt_conf)
e175587f4d32de drivers/net/ethernet/cadence/macb.c      Nicolas Ferre      =
 2014-07-24  4319  {
dce32ece3bb8f3 drivers/net/ethernet/cadence/macb_main.c Ryan Wanner        =
 2025-07-14 @4320  	struct device_node *np =3D bp->pdev->dev.of_node;
e175587f4d32de drivers/net/ethernet/cadence/macb.c      Nicolas Ferre      =
 2014-07-24  4321  	u32 dcfg;
e175587f4d32de drivers/net/ethernet/cadence/macb.c      Nicolas Ferre      =
 2014-07-24  4322 =20
f6970505defd0e drivers/net/ethernet/cadence/macb.c      Nicolas Ferre      =
 2015-03-31  4323  	if (dt_conf)
f6970505defd0e drivers/net/ethernet/cadence/macb.c      Nicolas Ferre      =
 2015-03-31  4324  		bp->caps =3D dt_conf->caps;
f6970505defd0e drivers/net/ethernet/cadence/macb.c      Nicolas Ferre      =
 2015-03-31  4325 =20
f2ce8a9e48385f drivers/net/ethernet/cadence/macb.c      Andy Shevchenko    =
 2015-07-24  4326  	if (hw_is_gem(bp->regs, bp->native_io)) {
e175587f4d32de drivers/net/ethernet/cadence/macb.c      Nicolas Ferre      =
 2014-07-24  4327  		bp->caps |=3D MACB_CAPS_MACB_IS_GEM;
e175587f4d32de drivers/net/ethernet/cadence/macb.c      Nicolas Ferre      =
 2014-07-24  4328 =20
e175587f4d32de drivers/net/ethernet/cadence/macb.c      Nicolas Ferre      =
 2014-07-24  4329  		dcfg =3D gem_readl(bp, DCFG1);
e175587f4d32de drivers/net/ethernet/cadence/macb.c      Nicolas Ferre      =
 2014-07-24  4330  		if (GEM_BFEXT(IRQCOR, dcfg) =3D=3D 0)
e175587f4d32de drivers/net/ethernet/cadence/macb.c      Nicolas Ferre      =
 2014-07-24  4331  			bp->caps |=3D MACB_CAPS_ISR_CLEAR_ON_WRITE;
e4e143e26ce8f5 drivers/net/ethernet/cadence/macb_main.c Parshuram Thombare =
 2020-10-29  4332  		if (GEM_BFEXT(NO_PCS, dcfg) =3D=3D 0)
e4e143e26ce8f5 drivers/net/ethernet/cadence/macb_main.c Parshuram Thombare =
 2020-10-29  4333  			bp->caps |=3D MACB_CAPS_PCS;
e4e143e26ce8f5 drivers/net/ethernet/cadence/macb_main.c Parshuram Thombare =
 2020-10-29  4334  		dcfg =3D gem_readl(bp, DCFG12);
e4e143e26ce8f5 drivers/net/ethernet/cadence/macb_main.c Parshuram Thombare =
 2020-10-29  4335  		if (GEM_BFEXT(HIGH_SPEED, dcfg) =3D=3D 1)
e4e143e26ce8f5 drivers/net/ethernet/cadence/macb_main.c Parshuram Thombare =
 2020-10-29  4336  			bp->caps |=3D MACB_CAPS_HIGH_SPEED;
e175587f4d32de drivers/net/ethernet/cadence/macb.c      Nicolas Ferre      =
 2014-07-24  4337  		dcfg =3D gem_readl(bp, DCFG2);
e175587f4d32de drivers/net/ethernet/cadence/macb.c      Nicolas Ferre      =
 2014-07-24  4338  		if ((dcfg & (GEM_BIT(RX_PKT_BUFF) | GEM_BIT(TX_PKT_BUF=
F))) =3D=3D 0)
e175587f4d32de drivers/net/ethernet/cadence/macb.c      Nicolas Ferre      =
 2014-07-24  4339  			bp->caps |=3D MACB_CAPS_FIFO_MODE;
ae7a9585ea6974 drivers/net/ethernet/cadence/macb_main.c Th=C3=A9o Lebrun   =
      2025-10-23  4340  		if (GEM_BFEXT(PBUF_RSC, gem_readl(bp, DCFG6)))
ae7a9585ea6974 drivers/net/ethernet/cadence/macb_main.c Th=C3=A9o Lebrun   =
      2025-10-23  4341  			bp->caps |=3D MACB_CAPS_RSC;
ab91f0a9b5f4b9 drivers/net/ethernet/cadence/macb_main.c Rafal Ozieblo      =
 2017-06-29  4342  		if (gem_has_ptp(bp)) {
7b4296148066f1 drivers/net/ethernet/cadence/macb.c      Rafal Ozieblo      =
 2017-06-29  4343  			if (!GEM_BFEXT(TSU, gem_readl(bp, DCFG5)))
7897b071ac3b45 drivers/net/ethernet/cadence/macb_main.c Antoine Tenart     =
 2019-11-13  4344  				dev_err(&bp->pdev->dev,
7897b071ac3b45 drivers/net/ethernet/cadence/macb_main.c Antoine Tenart     =
 2019-11-13  4345  					"GEM doesn't support hardware ptp.\n");
ab91f0a9b5f4b9 drivers/net/ethernet/cadence/macb_main.c Rafal Ozieblo      =
 2017-06-29  4346  			else {
adee474a3b43df drivers/net/ethernet/cadence/macb_main.c Harini Katakam     =
 2023-04-11  4347  #ifdef CONFIG_MACB_USE_HWSTAMP
731e991afb75c3 drivers/net/ethernet/cadence/macb_main.c Th=C3=A9o Lebrun   =
      2025-10-14  4348  				bp->caps |=3D MACB_CAPS_DMA_PTP;
ab91f0a9b5f4b9 drivers/net/ethernet/cadence/macb_main.c Rafal Ozieblo      =
 2017-06-29  4349  				bp->ptp_info =3D &gem_ptp_info;
adee474a3b43df drivers/net/ethernet/cadence/macb_main.c Harini Katakam     =
 2023-04-11  4350  #endif
7b4296148066f1 drivers/net/ethernet/cadence/macb.c      Rafal Ozieblo      =
 2017-06-29  4351  			}
e175587f4d32de drivers/net/ethernet/cadence/macb.c      Nicolas Ferre      =
 2014-07-24  4352  		}
ab91f0a9b5f4b9 drivers/net/ethernet/cadence/macb_main.c Rafal Ozieblo      =
 2017-06-29  4353  	}
e175587f4d32de drivers/net/ethernet/cadence/macb.c      Nicolas Ferre      =
 2014-07-24  4354 =20
a35919e174350d drivers/net/ethernet/cadence/macb.c      Andy Shevchenko    =
 2015-07-24  4355  	dev_dbg(&bp->pdev->dev, "Cadence caps 0x%08x\n", bp->ca=
ps);
e175587f4d32de drivers/net/ethernet/cadence/macb.c      Nicolas Ferre      =
 2014-07-24  4356  }
e175587f4d32de drivers/net/ethernet/cadence/macb.c      Nicolas Ferre      =
 2014-07-24  4357 =20

:::::: The code at line 4320 was first introduced by commit
:::::: dce32ece3bb8f3768d04d01cbe146b7ac5ccdbde net: cadence: macb: Expose =
REFCLK as a device tree property

:::::: TO: Ryan Wanner <Ryan.Wanner@microchip.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
