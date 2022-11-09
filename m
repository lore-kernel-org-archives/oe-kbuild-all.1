Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6BFA461
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Nov 2022 00:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667954531; x=1699490531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VbgrtqpJa1WqRlm+SIgt4tEAN94JEaK3JWsvSu7uu+k=;
  b=db9Xe+Dif589QmO455mBEWZO5KiA332IEPrTFcmoJceB/HCjWFPhdWD/
   3JJ5otU/Cq9b6N66OFNJBOXNjaID8gqvRudEBi6Moa3NXIoFyxm57R7ZF
   9ApXTdMFNfXv351QgAMYbQSoZo5wB4zsLBk69qOvkbW9Vs9L5IHXk3Dfp
   8GnHY8Woe4eNGLpdQORPYbOTAHunTtiL1hDaBiBkZDKRBR0HV9d50Il++
   t6BfwlUm/4dW2Js9oXsupGniBNcNUP1lllIMeobhu8A8vdSkrgrb7Yk4Q
   e8JbAngsuuqB+rRHiAjNVHS7YRqZBG/1uiptRfYlwpVdiMqwiStis4we0
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="312006323"
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; 
   d="scan'208";a="312006323"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 16:42:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="725755342"
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; 
   d="scan'208";a="725755342"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Nov 2022 16:42:08 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1osZAN-0000pK-1Z;
	Wed, 09 Nov 2022 00:42:07 +0000
Date: Wed, 9 Nov 2022 08:41:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [ammarfaizi2-block:tglx/devel/devmsi 23/91]
 drivers/crypto/inside-secure/safexcel.c:1607:23: error: implicit declaration
 of function 'pci_alloc_irq_vectors'; did you mean 'pci_irq_vector'?
Message-ID: <202211090854.hWQvYYNp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="LFPHK5Hplgf6z90w"
Content-Disposition: inline


--LFPHK5Hplgf6z90w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block tglx/devel/devmsi
head:   e2cf9a4421f6a876ff8d2bac1bda6e6e14fdf211
commit: 735009b3bda06b61977cde97de5e8c96d6d15edc [23/91] PCI/MSI: Move pci_alloc_irq_vectors() to api.c
config: arm-randconfig-r005-20221108
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/735009b3bda06b61977cde97de5e8c96d6d15edc
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block tglx/devel/devmsi
        git checkout 735009b3bda06b61977cde97de5e8c96d6d15edc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/crypto/inside-secure/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/crypto/inside-secure/safexcel.c: In function 'safexcel_probe_generic':
>> drivers/crypto/inside-secure/safexcel.c:1607:23: error: implicit declaration of function 'pci_alloc_irq_vectors'; did you mean 'pci_irq_vector'? [-Werror=implicit-function-declaration]
    1607 |                 ret = pci_alloc_irq_vectors(pci_pdev,
         |                       ^~~~~~~~~~~~~~~~~~~~~
         |                       pci_irq_vector
   cc1: some warnings being treated as errors


vim +1607 drivers/crypto/inside-secure/safexcel.c

871df319bd48ac Antoine Tenart     2017-12-14  1389  
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1390  /*
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1391   * Generic part of probe routine, shared by platform and PCI driver
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1392   *
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1393   * Assumes IO resources have been mapped, private data mem has been allocated,
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1394   * clocks have been enabled, device pointer has been assigned etc.
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1395   *
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1396   */
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1397  static int safexcel_probe_generic(void *pdev,
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1398  				  struct safexcel_crypto_priv *priv,
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1399  				  int is_pci_dev)
1b44c5a60c137e Antoine Tenart     2017-05-24  1400  {
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1401  	struct device *dev = priv->dev;
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1402  	u32 peid, version, mask, val, hiaopt, hwopt, peopt;
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1403  	int i, ret, hwctg;
1b44c5a60c137e Antoine Tenart     2017-05-24  1404  
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1405  	priv->context_pool = dmam_pool_create("safexcel-context", dev,
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1406  					      sizeof(struct safexcel_context_record),
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1407  					      1, 0);
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1408  	if (!priv->context_pool)
1b44c5a60c137e Antoine Tenart     2017-05-24  1409  		return -ENOMEM;
1b44c5a60c137e Antoine Tenart     2017-05-24  1410  
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1411  	/*
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1412  	 * First try the EIP97 HIA version regs
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1413  	 * For the EIP197, this is guaranteed to NOT return any of the test
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1414  	 * values
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1415  	 */
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1416  	version = readl(priv->base + EIP97_HIA_AIC_BASE + EIP197_HIA_VERSION);
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1417  
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1418  	mask = 0;  /* do not swap */
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1419  	if (EIP197_REG_LO16(version) == EIP197_HIA_VERSION_LE) {
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1420  		priv->hwconfig.hiaver = EIP197_VERSION_MASK(version);
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1421  	} else if (EIP197_REG_HI16(version) == EIP197_HIA_VERSION_BE) {
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1422  		/* read back byte-swapped, so complement byte swap bits */
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1423  		mask = EIP197_MST_CTRL_BYTE_SWAP_BITS;
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1424  		priv->hwconfig.hiaver = EIP197_VERSION_SWAP(version);
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1425  	} else {
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1426  		/* So it wasn't an EIP97 ... maybe it's an EIP197? */
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1427  		version = readl(priv->base + EIP197_HIA_AIC_BASE +
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1428  				EIP197_HIA_VERSION);
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1429  		if (EIP197_REG_LO16(version) == EIP197_HIA_VERSION_LE) {
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1430  			priv->hwconfig.hiaver = EIP197_VERSION_MASK(version);
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1431  			priv->flags |= SAFEXCEL_HW_EIP197;
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1432  		} else if (EIP197_REG_HI16(version) ==
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1433  			   EIP197_HIA_VERSION_BE) {
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1434  			/* read back byte-swapped, so complement swap bits */
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1435  			mask = EIP197_MST_CTRL_BYTE_SWAP_BITS;
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1436  			priv->hwconfig.hiaver = EIP197_VERSION_SWAP(version);
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1437  			priv->flags |= SAFEXCEL_HW_EIP197;
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1438  		} else {
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1439  			return -ENODEV;
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1440  		}
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1441  	}
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1442  
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1443  	/* Now initialize the reg offsets based on the probing info so far */
871df319bd48ac Antoine Tenart     2017-12-14  1444  	safexcel_init_register_offsets(priv);
1b44c5a60c137e Antoine Tenart     2017-05-24  1445  
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1446  	/*
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1447  	 * If the version was read byte-swapped, we need to flip the device
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1448  	 * swapping Keep in mind here, though, that what we write will also be
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1449  	 * byte-swapped ...
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1450  	 */
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1451  	if (mask) {
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1452  		val = readl(EIP197_HIA_AIC(priv) + EIP197_HIA_MST_CTRL);
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1453  		val = val ^ (mask >> 24); /* toggle byte swap bits */
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1454  		writel(val, EIP197_HIA_AIC(priv) + EIP197_HIA_MST_CTRL);
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1455  	}
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1456  
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1457  	/*
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1458  	 * We're not done probing yet! We may fall through to here if no HIA
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1459  	 * was found at all. So, with the endianness presumably correct now and
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1460  	 * the offsets setup, *really* probe for the EIP97/EIP197.
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1461  	 */
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1462  	version = readl(EIP197_GLOBAL(priv) + EIP197_VERSION);
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1463  	if (((priv->flags & SAFEXCEL_HW_EIP197) &&
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1464  	     (EIP197_REG_LO16(version) != EIP197_VERSION_LE) &&
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1465  	     (EIP197_REG_LO16(version) != EIP196_VERSION_LE)) ||
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1466  	    ((!(priv->flags & SAFEXCEL_HW_EIP197) &&
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1467  	     (EIP197_REG_LO16(version) != EIP97_VERSION_LE)))) {
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1468  		/*
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1469  		 * We did not find the device that matched our initial probing
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1470  		 * (or our initial probing failed) Report appropriate error.
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1471  		 */
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1472  		dev_err(priv->dev, "Probing for EIP97/EIP19x failed - no such device (read %08x)\n",
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1473  			version);
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1474  		return -ENODEV;
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1475  	}
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1476  
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1477  	priv->hwconfig.hwver = EIP197_VERSION_MASK(version);
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1478  	hwctg = version >> 28;
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1479  	peid = version & 255;
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1480  
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1481  	/* Detect EIP206 processing pipe */
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1482  	version = readl(EIP197_PE(priv) + + EIP197_PE_VERSION(0));
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1483  	if (EIP197_REG_LO16(version) != EIP206_VERSION_LE) {
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1484  		dev_err(priv->dev, "EIP%d: EIP206 not detected\n", peid);
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1485  		return -ENODEV;
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1486  	}
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1487  	priv->hwconfig.ppver = EIP197_VERSION_MASK(version);
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1488  
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1489  	/* Detect EIP96 packet engine and version */
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1490  	version = readl(EIP197_PE(priv) + EIP197_PE_EIP96_VERSION(0));
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1491  	if (EIP197_REG_LO16(version) != EIP96_VERSION_LE) {
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1492  		dev_err(dev, "EIP%d: EIP96 not detected.\n", peid);
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1493  		return -ENODEV;
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1494  	}
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1495  	priv->hwconfig.pever = EIP197_VERSION_MASK(version);
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1496  
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1497  	hwopt = readl(EIP197_GLOBAL(priv) + EIP197_OPTIONS);
35c0e6c375ac7a Pascal van Leeuwen 2019-09-06  1498  	hiaopt = readl(EIP197_HIA_AIC(priv) + EIP197_HIA_OPTIONS);
35c0e6c375ac7a Pascal van Leeuwen 2019-09-06  1499  
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1500  	priv->hwconfig.icever = 0;
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1501  	priv->hwconfig.ocever = 0;
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1502  	priv->hwconfig.psever = 0;
35c0e6c375ac7a Pascal van Leeuwen 2019-09-06  1503  	if (priv->flags & SAFEXCEL_HW_EIP197) {
35c0e6c375ac7a Pascal van Leeuwen 2019-09-06  1504  		/* EIP197 */
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1505  		peopt = readl(EIP197_PE(priv) + EIP197_PE_OPTIONS(0));
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1506  
35c0e6c375ac7a Pascal van Leeuwen 2019-09-06  1507  		priv->hwconfig.hwdataw  = (hiaopt >> EIP197_HWDATAW_OFFSET) &
35c0e6c375ac7a Pascal van Leeuwen 2019-09-06  1508  					  EIP197_HWDATAW_MASK;
35c0e6c375ac7a Pascal van Leeuwen 2019-09-06  1509  		priv->hwconfig.hwcfsize = ((hiaopt >> EIP197_CFSIZE_OFFSET) &
35c0e6c375ac7a Pascal van Leeuwen 2019-09-06  1510  					   EIP197_CFSIZE_MASK) +
35c0e6c375ac7a Pascal van Leeuwen 2019-09-06  1511  					  EIP197_CFSIZE_ADJUST;
b2d92ac1c5eebc Pascal van Leeuwen 2019-09-06  1512  		priv->hwconfig.hwrfsize = ((hiaopt >> EIP197_RFSIZE_OFFSET) &
b2d92ac1c5eebc Pascal van Leeuwen 2019-09-06  1513  					   EIP197_RFSIZE_MASK) +
b2d92ac1c5eebc Pascal van Leeuwen 2019-09-06  1514  					  EIP197_RFSIZE_ADJUST;
84ca4e54ab792b Pascal van Leeuwen 2019-09-18  1515  		priv->hwconfig.hwnumpes	= (hiaopt >> EIP197_N_PES_OFFSET) &
84ca4e54ab792b Pascal van Leeuwen 2019-09-18  1516  					  EIP197_N_PES_MASK;
84ca4e54ab792b Pascal van Leeuwen 2019-09-18  1517  		priv->hwconfig.hwnumrings = (hiaopt >> EIP197_N_RINGS_OFFSET) &
84ca4e54ab792b Pascal van Leeuwen 2019-09-18  1518  					    EIP197_N_RINGS_MASK;
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1519  		if (hiaopt & EIP197_HIA_OPT_HAS_PE_ARB)
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1520  			priv->flags |= EIP197_PE_ARB;
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1521  		if (EIP206_OPT_ICE_TYPE(peopt) == 1) {
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1522  			priv->flags |= EIP197_ICE;
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1523  			/* Detect ICE EIP207 class. engine and version */
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1524  			version = readl(EIP197_PE(priv) +
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1525  				  EIP197_PE_ICE_VERSION(0));
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1526  			if (EIP197_REG_LO16(version) != EIP207_VERSION_LE) {
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1527  				dev_err(dev, "EIP%d: ICE EIP207 not detected.\n",
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1528  					peid);
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1529  				return -ENODEV;
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1530  			}
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1531  			priv->hwconfig.icever = EIP197_VERSION_MASK(version);
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1532  		}
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1533  		if (EIP206_OPT_OCE_TYPE(peopt) == 1) {
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1534  			priv->flags |= EIP197_OCE;
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1535  			/* Detect EIP96PP packet stream editor and version */
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1536  			version = readl(EIP197_PE(priv) + EIP197_PE_PSE_VERSION(0));
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1537  			if (EIP197_REG_LO16(version) != EIP96_VERSION_LE) {
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1538  				dev_err(dev, "EIP%d: EIP96PP not detected.\n", peid);
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1539  				return -ENODEV;
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1540  			}
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1541  			priv->hwconfig.psever = EIP197_VERSION_MASK(version);
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1542  			/* Detect OCE EIP207 class. engine and version */
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1543  			version = readl(EIP197_PE(priv) +
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1544  				  EIP197_PE_ICE_VERSION(0));
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1545  			if (EIP197_REG_LO16(version) != EIP207_VERSION_LE) {
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1546  				dev_err(dev, "EIP%d: OCE EIP207 not detected.\n",
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1547  					peid);
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1548  				return -ENODEV;
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1549  			}
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1550  			priv->hwconfig.ocever = EIP197_VERSION_MASK(version);
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1551  		}
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1552  		/* If not a full TRC, then assume simple TRC */
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1553  		if (!(hwopt & EIP197_OPT_HAS_TRC))
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1554  			priv->flags |= EIP197_SIMPLE_TRC;
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1555  		/* EIP197 always has SOME form of TRC */
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1556  		priv->flags |= EIP197_TRC_CACHE;
35c0e6c375ac7a Pascal van Leeuwen 2019-09-06  1557  	} else {
35c0e6c375ac7a Pascal van Leeuwen 2019-09-06  1558  		/* EIP97 */
35c0e6c375ac7a Pascal van Leeuwen 2019-09-06  1559  		priv->hwconfig.hwdataw  = (hiaopt >> EIP197_HWDATAW_OFFSET) &
35c0e6c375ac7a Pascal van Leeuwen 2019-09-06  1560  					  EIP97_HWDATAW_MASK;
35c0e6c375ac7a Pascal van Leeuwen 2019-09-06  1561  		priv->hwconfig.hwcfsize = (hiaopt >> EIP97_CFSIZE_OFFSET) &
35c0e6c375ac7a Pascal van Leeuwen 2019-09-06  1562  					  EIP97_CFSIZE_MASK;
b2d92ac1c5eebc Pascal van Leeuwen 2019-09-06  1563  		priv->hwconfig.hwrfsize = (hiaopt >> EIP97_RFSIZE_OFFSET) &
b2d92ac1c5eebc Pascal van Leeuwen 2019-09-06  1564  					  EIP97_RFSIZE_MASK;
84ca4e54ab792b Pascal van Leeuwen 2019-09-18  1565  		priv->hwconfig.hwnumpes	= 1; /* by definition */
84ca4e54ab792b Pascal van Leeuwen 2019-09-18  1566  		priv->hwconfig.hwnumrings = (hiaopt >> EIP197_N_RINGS_OFFSET) &
84ca4e54ab792b Pascal van Leeuwen 2019-09-18  1567  					    EIP197_N_RINGS_MASK;
35c0e6c375ac7a Pascal van Leeuwen 2019-09-06  1568  	}
35c0e6c375ac7a Pascal van Leeuwen 2019-09-06  1569  
946a4a2a49195e Pascal van Leeuwen 2019-09-18  1570  	/* Scan for ring AIC's */
946a4a2a49195e Pascal van Leeuwen 2019-09-18  1571  	for (i = 0; i < EIP197_MAX_RING_AIC; i++) {
946a4a2a49195e Pascal van Leeuwen 2019-09-18  1572  		version = readl(EIP197_HIA_AIC_R(priv) +
946a4a2a49195e Pascal van Leeuwen 2019-09-18  1573  				EIP197_HIA_AIC_R_VERSION(i));
946a4a2a49195e Pascal van Leeuwen 2019-09-18  1574  		if (EIP197_REG_LO16(version) != EIP201_VERSION_LE)
946a4a2a49195e Pascal van Leeuwen 2019-09-18  1575  			break;
946a4a2a49195e Pascal van Leeuwen 2019-09-18  1576  	}
946a4a2a49195e Pascal van Leeuwen 2019-09-18  1577  	priv->hwconfig.hwnumraic = i;
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1578  	/* Low-end EIP196 may not have any ring AIC's ... */
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1579  	if (!priv->hwconfig.hwnumraic) {
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1580  		dev_err(priv->dev, "No ring interrupt controller present!\n");
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1581  		return -ENODEV;
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1582  	}
946a4a2a49195e Pascal van Leeuwen 2019-09-18  1583  
062b64ca6db409 Pascal van Leeuwen 2019-08-30  1584  	/* Get supported algorithms from EIP96 transform engine */
062b64ca6db409 Pascal van Leeuwen 2019-08-30  1585  	priv->hwconfig.algo_flags = readl(EIP197_PE(priv) +
062b64ca6db409 Pascal van Leeuwen 2019-08-30  1586  				    EIP197_PE_EIP96_OPTIONS(0));
062b64ca6db409 Pascal van Leeuwen 2019-08-30  1587  
118db42deeeff1 Pascal van Leeuwen 2019-09-06  1588  	/* Print single info line describing what we just detected */
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1589  	dev_info(priv->dev, "EIP%d:%x(%d,%d,%d,%d)-HIA:%x(%d,%d,%d),PE:%x/%x(alg:%08x)/%x/%x/%x\n",
84ca4e54ab792b Pascal van Leeuwen 2019-09-18  1590  		 peid, priv->hwconfig.hwver, hwctg, priv->hwconfig.hwnumpes,
946a4a2a49195e Pascal van Leeuwen 2019-09-18  1591  		 priv->hwconfig.hwnumrings, priv->hwconfig.hwnumraic,
946a4a2a49195e Pascal van Leeuwen 2019-09-18  1592  		 priv->hwconfig.hiaver, priv->hwconfig.hwdataw,
946a4a2a49195e Pascal van Leeuwen 2019-09-18  1593  		 priv->hwconfig.hwcfsize, priv->hwconfig.hwrfsize,
5fd39c4d96c9bc Pascal van Leeuwen 2019-09-18  1594  		 priv->hwconfig.ppver, priv->hwconfig.pever,
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1595  		 priv->hwconfig.algo_flags, priv->hwconfig.icever,
dbc756fcf7f3b8 Pascal van Leeuwen 2020-09-11  1596  		 priv->hwconfig.ocever, priv->hwconfig.psever);
1b44c5a60c137e Antoine Tenart     2017-05-24  1597  
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1598  	safexcel_configure(priv);
5b37689653cbe7 Gregory CLEMENT    2018-03-13  1599  
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1600  	if (IS_ENABLED(CONFIG_PCI) && priv->version == EIP197_DEVBRD) {
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1601  		/*
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1602  		 * Request MSI vectors for global + 1 per ring -
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1603  		 * or just 1 for older dev images
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1604  		 */
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1605  		struct pci_dev *pci_pdev = pdev;
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1606  
625f269a5a7a36 Pascal van Leeuwen 2019-08-19 @1607  		ret = pci_alloc_irq_vectors(pci_pdev,
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1608  					    priv->config.rings + 1,
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1609  					    priv->config.rings + 1,
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1610  					    PCI_IRQ_MSI | PCI_IRQ_MSIX);
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1611  		if (ret < 0) {
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1612  			dev_err(dev, "Failed to allocate PCI MSI interrupts\n");
1b44c5a60c137e Antoine Tenart     2017-05-24  1613  			return ret;
1b44c5a60c137e Antoine Tenart     2017-05-24  1614  		}
1b44c5a60c137e Antoine Tenart     2017-05-24  1615  	}
1b44c5a60c137e Antoine Tenart     2017-05-24  1616  
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1617  	/* Register the ring IRQ handlers and configure the rings */
329e09893909d4 Kees Cook          2018-10-05  1618  	priv->ring = devm_kcalloc(dev, priv->config.rings,
329e09893909d4 Kees Cook          2018-10-05  1619  				  sizeof(*priv->ring),
18e0e95b82e444 Ofer Heifetz       2018-06-28  1620  				  GFP_KERNEL);
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1621  	if (!priv->ring)
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1622  		return -ENOMEM;
18e0e95b82e444 Ofer Heifetz       2018-06-28  1623  
1b44c5a60c137e Antoine Tenart     2017-05-24  1624  	for (i = 0; i < priv->config.rings; i++) {
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1625  		char wq_name[9] = {0};
1b44c5a60c137e Antoine Tenart     2017-05-24  1626  		int irq;
1b44c5a60c137e Antoine Tenart     2017-05-24  1627  		struct safexcel_ring_irq_data *ring_irq;
1b44c5a60c137e Antoine Tenart     2017-05-24  1628  
1b44c5a60c137e Antoine Tenart     2017-05-24  1629  		ret = safexcel_init_ring_descriptors(priv,
1b44c5a60c137e Antoine Tenart     2017-05-24  1630  						     &priv->ring[i].cdr,
1b44c5a60c137e Antoine Tenart     2017-05-24  1631  						     &priv->ring[i].rdr);
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1632  		if (ret) {
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1633  			dev_err(dev, "Failed to initialize rings\n");
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1634  			return ret;
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1635  		}
1b44c5a60c137e Antoine Tenart     2017-05-24  1636  
329e09893909d4 Kees Cook          2018-10-05  1637  		priv->ring[i].rdr_req = devm_kcalloc(dev,
329e09893909d4 Kees Cook          2018-10-05  1638  			EIP197_DEFAULT_RING_SIZE,
c98e233062cd9d Colin Ian King     2020-10-10  1639  			sizeof(*priv->ring[i].rdr_req),
9744fec95f0674 Ofer Heifetz       2018-06-28  1640  			GFP_KERNEL);
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1641  		if (!priv->ring[i].rdr_req)
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1642  			return -ENOMEM;
9744fec95f0674 Ofer Heifetz       2018-06-28  1643  
1b44c5a60c137e Antoine Tenart     2017-05-24  1644  		ring_irq = devm_kzalloc(dev, sizeof(*ring_irq), GFP_KERNEL);
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1645  		if (!ring_irq)
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1646  			return -ENOMEM;
1b44c5a60c137e Antoine Tenart     2017-05-24  1647  
1b44c5a60c137e Antoine Tenart     2017-05-24  1648  		ring_irq->priv = priv;
1b44c5a60c137e Antoine Tenart     2017-05-24  1649  		ring_irq->ring = i;
1b44c5a60c137e Antoine Tenart     2017-05-24  1650  
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1651  		irq = safexcel_request_ring_irq(pdev,
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1652  						EIP197_IRQ_NUMBER(i, is_pci_dev),
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1653  						is_pci_dev,
c6720415907f21 Sven Auhagen       2020-07-21  1654  						i,
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1655  						safexcel_irq_ring,
69ee4dd5ea8ce0 Antoine Tenart     2017-12-14  1656  						safexcel_irq_ring_thread,
1b44c5a60c137e Antoine Tenart     2017-05-24  1657  						ring_irq);
b7d65fe18129e2 Christophe Jaillet 2017-08-15  1658  		if (irq < 0) {
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1659  			dev_err(dev, "Failed to get IRQ ID for ring %d\n", i);
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1660  			return irq;
b7d65fe18129e2 Christophe Jaillet 2017-08-15  1661  		}
1b44c5a60c137e Antoine Tenart     2017-05-24  1662  
c6720415907f21 Sven Auhagen       2020-07-21  1663  		priv->ring[i].irq = irq;
1b44c5a60c137e Antoine Tenart     2017-05-24  1664  		priv->ring[i].work_data.priv = priv;
1b44c5a60c137e Antoine Tenart     2017-05-24  1665  		priv->ring[i].work_data.ring = i;
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1666  		INIT_WORK(&priv->ring[i].work_data.work,
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1667  			  safexcel_dequeue_work);
1b44c5a60c137e Antoine Tenart     2017-05-24  1668  
1b44c5a60c137e Antoine Tenart     2017-05-24  1669  		snprintf(wq_name, 9, "wq_ring%d", i);
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1670  		priv->ring[i].workqueue =
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1671  			create_singlethread_workqueue(wq_name);
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1672  		if (!priv->ring[i].workqueue)
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1673  			return -ENOMEM;
1b44c5a60c137e Antoine Tenart     2017-05-24  1674  
f7268c538b3d84 Antoine Tenart     2018-02-13  1675  		priv->ring[i].requests = 0;
dc7e28a3286ed4 Antoine Tenart     2017-12-14  1676  		priv->ring[i].busy = false;
dc7e28a3286ed4 Antoine Tenart     2017-12-14  1677  
86671abbbbfc95 Antoine Tenart     2017-06-15  1678  		crypto_init_queue(&priv->ring[i].queue,
86671abbbbfc95 Antoine Tenart     2017-06-15  1679  				  EIP197_DEFAULT_RING_SIZE);
86671abbbbfc95 Antoine Tenart     2017-06-15  1680  
1b44c5a60c137e Antoine Tenart     2017-05-24  1681  		spin_lock_init(&priv->ring[i].lock);
86671abbbbfc95 Antoine Tenart     2017-06-15  1682  		spin_lock_init(&priv->ring[i].queue_lock);
1b44c5a60c137e Antoine Tenart     2017-05-24  1683  	}
1b44c5a60c137e Antoine Tenart     2017-05-24  1684  
1b44c5a60c137e Antoine Tenart     2017-05-24  1685  	atomic_set(&priv->ring_used, 0);
1b44c5a60c137e Antoine Tenart     2017-05-24  1686  
1b44c5a60c137e Antoine Tenart     2017-05-24  1687  	ret = safexcel_hw_init(priv);
1b44c5a60c137e Antoine Tenart     2017-05-24  1688  	if (ret) {
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1689  		dev_err(dev, "HW init failed (%d)\n", ret);
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1690  		return ret;
1b44c5a60c137e Antoine Tenart     2017-05-24  1691  	}
1b44c5a60c137e Antoine Tenart     2017-05-24  1692  
1b44c5a60c137e Antoine Tenart     2017-05-24  1693  	ret = safexcel_register_algorithms(priv);
1b44c5a60c137e Antoine Tenart     2017-05-24  1694  	if (ret) {
1b44c5a60c137e Antoine Tenart     2017-05-24  1695  		dev_err(dev, "Failed to register algorithms (%d)\n", ret);
625f269a5a7a36 Pascal van Leeuwen 2019-08-19  1696  		return ret;
1b44c5a60c137e Antoine Tenart     2017-05-24  1697  	}
1b44c5a60c137e Antoine Tenart     2017-05-24  1698  
1b44c5a60c137e Antoine Tenart     2017-05-24  1699  	return 0;
1b44c5a60c137e Antoine Tenart     2017-05-24  1700  }
1b44c5a60c137e Antoine Tenart     2017-05-24  1701  

:::::: The code at line 1607 was first introduced by commit
:::::: 625f269a5a7a3643771320387e474bd0a61d9654 crypto: inside-secure - add support for PCI based FPGA development board

:::::: TO: Pascal van Leeuwen <pvanleeuwen@insidesecure.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--LFPHK5Hplgf6z90w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/arm 6.1.0-rc4 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="arm-linux-gnueabi-gcc (GCC) 12.1.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120100
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23800
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23800
CONFIG_LLD_VERSION=0
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_IRQ_WORK=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
# CONFIG_KERNEL_GZIP is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
CONFIG_KERNEL_LZ4=y
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
# CONFIG_POSIX_MQUEUE is not set
CONFIG_WATCH_QUEUE=y
CONFIG_USELIB=y
# CONFIG_AUDIT is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_SHOW_LEVEL=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_GENERIC_IRQ_MULTI_HANDLER=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_TIME_KUNIT_TEST=y

#
# Timers subsystem
#
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
# CONFIG_NO_HZ is not set
# CONFIG_HIGH_RES_TIMERS is not set
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
# end of BPF subsystem

CONFIG_PREEMPT_NONE_BUILD=y
CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
# CONFIG_TASKSTATS is not set
CONFIG_PSI=y
# CONFIG_PSI_DEFAULT_DISABLED is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TINY_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_NEED_SEGCBLIST=y
# end of RCU Subsystem

CONFIG_IKCONFIG=y
# CONFIG_IKCONFIG_PROC is not set
CONFIG_IKHEADERS=y
CONFIG_GENERIC_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
CONFIG_MEMCG=y
CONFIG_MEMCG_KMEM=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
# CONFIG_CFS_BANDWIDTH is not set
CONFIG_RT_GROUP_SCHED=y
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
# CONFIG_CGROUP_FREEZER is not set
CONFIG_CGROUP_DEVICE=y
# CONFIG_CGROUP_CPUACCT is not set
# CONFIG_CGROUP_BPF is not set
# CONFIG_CGROUP_MISC is not set
CONFIG_CGROUP_DEBUG=y
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
CONFIG_CHECKPOINT_RESTORE=y
CONFIG_SCHED_AUTOGROUP=y
CONFIG_SYSFS_DEPRECATED=y
# CONFIG_SYSFS_DEPRECATED_V2 is not set
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
# CONFIG_RD_GZIP is not set
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
# CONFIG_RD_LZ4 is not set
CONFIG_RD_ZSTD=y
# CONFIG_BOOT_CONFIG is not set
CONFIG_INITRAMFS_PRESERVE_MTIME=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_EXPERT=y
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
# CONFIG_SYSFS_SYSCALL is not set
CONFIG_FHANDLE=y
# CONFIG_POSIX_TIMERS is not set
# CONFIG_PRINTK is not set
# CONFIG_BUG is not set
CONFIG_ELF_CORE=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
# CONFIG_EPOLL is not set
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_AIO=y
CONFIG_IO_URING=y
# CONFIG_ADVISE_SYSCALLS is not set
# CONFIG_MEMBARRIER is not set
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_ALL is not set
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
# CONFIG_RSEQ is not set
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
# CONFIG_PERF_EVENTS is not set
# end of Kernel Performance Events And Counters

CONFIG_SYSTEM_DATA_VERIFICATION=y
# CONFIG_PROFILING is not set
# end of General setup

CONFIG_ARM=y
CONFIG_SYS_SUPPORTS_APM_EMULATION=y
CONFIG_NO_IOPORT_MAP=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_PHYS_OFFSET=0x00800000
CONFIG_PGTABLE_LEVELS=2

#
# System Type
#
# CONFIG_MMU is not set
CONFIG_ARM_SINGLE_ARMV7M=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_BITS_MAX=16
CONFIG_ARCH_AT91=y
# CONFIG_SOC_SAMV7 is not set

#
# Clocksource driver selection
#
CONFIG_ATMEL_CLOCKSOURCE_TCB=y
# CONFIG_MICROCHIP_CLOCKSOURCE_PIT64B is not set
CONFIG_COMMON_CLK_AT91=y
# CONFIG_ARCH_MXC is not set
CONFIG_ARCH_STM32=y
# CONFIG_MACH_STM32F429 is not set
CONFIG_MACH_STM32F469=y
# CONFIG_MACH_STM32F746 is not set
# CONFIG_MACH_STM32F769 is not set
# CONFIG_MACH_STM32H743 is not set
# CONFIG_ARCH_LPC18XX is not set
# CONFIG_ARCH_MPS2 is not set

#
# Processor Type
#
CONFIG_CPU_V7M=y
CONFIG_CPU_THUMBONLY=y
CONFIG_CPU_THUMB_CAPABLE=y
CONFIG_CPU_32v7M=y
CONFIG_CPU_ABRT_NOMMU=y
CONFIG_CPU_PABRT_LEGACY=y
CONFIG_CPU_CACHE_NOP=y
CONFIG_CPU_CACHE_V7M=y
CONFIG_CPU_V7M_NUM_IRQ=90

#
# Processor Features
#
CONFIG_ARM_THUMB=y
CONFIG_CPU_LITTLE_ENDIAN=y
# CONFIG_CPU_BIG_ENDIAN is not set
CONFIG_CPU_ICACHE_DISABLE=y
# CONFIG_CPU_DCACHE_DISABLE is not set
CONFIG_CPU_BPREDICT_DISABLE=y
CONFIG_ARM_L1_CACHE_SHIFT=5
CONFIG_ARM_DMA_MEM_BUFFERABLE=y
# CONFIG_SET_MEM_PARAM is not set
CONFIG_DRAM_BASE=0x00800000
CONFIG_DRAM_SIZE=0x00800000
CONFIG_REMAP_VECTORS_TO_RAM=y
# CONFIG_ARM_MPU is not set
# end of System Type

#
# Bus support
#
# end of Bus support

#
# Kernel Features
#
CONFIG_IRQSTACKS=y
CONFIG_PAGE_OFFSET=0x00800000
CONFIG_ARCH_NR_GPIO=0
CONFIG_HZ_FIXED=0
# CONFIG_HZ_100 is not set
# CONFIG_HZ_200 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_500=y
# CONFIG_HZ_1000 is not set
CONFIG_HZ=500
CONFIG_THUMB2_KERNEL=y
CONFIG_AEABI=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_FORCE_MAX_ORDER=11
# CONFIG_PARAVIRT is not set
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
CONFIG_CC_HAVE_STACKPROTECTOR_TLS=y
# end of Kernel Features

#
# Boot options
#
CONFIG_USE_OF=y
CONFIG_ATAGS=y
# CONFIG_UNUSED_BOARD_FILES is not set
CONFIG_DEPRECATED_PARAM_STRUCT=y
CONFIG_ZBOOT_ROM_TEXT=0x0
CONFIG_ZBOOT_ROM_BSS=0x0
# CONFIG_ARM_APPENDED_DTB is not set
CONFIG_CMDLINE=""
# CONFIG_XIP_KERNEL is not set
# CONFIG_CRASH_DUMP is not set
CONFIG_AUTO_ZRELADDR=y
# end of Boot options

#
# CPU Power Management
#

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
# CONFIG_CPU_FREQ_STAT is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y

#
# CPU frequency scaling drivers
#
CONFIG_CPUFREQ_DT=y
CONFIG_CPUFREQ_DT_PLATDEV=y
CONFIG_ARM_BRCMSTB_AVS_CPUFREQ=y
CONFIG_ARM_MEDIATEK_CPUFREQ_HW=y
# CONFIG_ARM_QCOM_CPUFREQ_HW is not set
# CONFIG_ARM_RASPBERRYPI_CPUFREQ is not set
# CONFIG_ARM_SCMI_CPUFREQ is not set
# CONFIG_QORIQ_CPUFREQ is not set
# end of CPU Frequency scaling

#
# CPU Idle
#
# CONFIG_CPU_IDLE is not set
# end of CPU Idle
# end of CPU Power Management

#
# Floating point emulation
#

#
# At least one emulation must be selected
#
# end of Floating point emulation

#
# Power management options
#
# CONFIG_SUSPEND is not set
# CONFIG_PM is not set
CONFIG_APM_EMULATION=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
# end of Power management options

CONFIG_AS_VFP_VMRS_FPINST=y

#
# General architecture-dependent options
#
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_HAVE_NMI=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_GENERIC_IDLE_POLL_SETUP=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_KEEPINITRD=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
# CONFIG_SECCOMP_CACHE_DEBUG is not set
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
# CONFIG_STACKPROTECTOR_STRONG is not set
CONFIG_LTO_NONE=y
CONFIG_HAVE_CONTEXT_TRACKING_USER=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_REL=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_CLONE_BACKWARDS=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_LOCK_EVENT_COUNTS=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_HAVE_ARCH_PFN_VALID=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_GCC_PLUGINS=y
CONFIG_GCC_PLUGIN_LATENT_ENTROPY=y
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
# CONFIG_MODULES is not set
# CONFIG_BLOCK is not set
CONFIG_ASN1=y
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF_FDPIC=y
CONFIG_ELFCORE=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_ARCH_HAS_BINFMT_FLAT=y
# CONFIG_BINFMT_FLAT is not set
CONFIG_BINFMT_FLAT_ARGVP_ENVP_ON_STACK=y
CONFIG_BINFMT_MISC=y
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLOB is not set
CONFIG_SLAB_MERGE_DEFAULT=y
# CONFIG_SLAB_FREELIST_RANDOM is not set
CONFIG_SLAB_FREELIST_HARDENED=y
# CONFIG_SLUB_STATS is not set
# end of SLAB allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
# CONFIG_COMPAT_BRK is not set
CONFIG_MMAP_ALLOW_UNINITIALIZED=y
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_FLATMEM_MANUAL=y
# CONFIG_SPARSEMEM_MANUAL is not set
CONFIG_FLATMEM=y
CONFIG_ARCH_KEEP_MEMBLOCK=y
CONFIG_SPLIT_PTLOCK_CPUS=999999
CONFIG_MEMORY_BALLOON=y
CONFIG_PAGE_REPORTING=y
CONFIG_NOMMU_INITIAL_TRIM_EXCESS=1
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_NEED_PER_CPU_KM=y
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
# CONFIG_VM_EVENT_COUNTERS is not set
CONFIG_PERCPU_STATS=y
CONFIG_GUP_TEST=y

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_DIAG is not set
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
# CONFIG_UNIX_DIAG is not set
# CONFIG_XDP_SOCKETS is not set
# CONFIG_INET is not set
# CONFIG_NETWORK_SECMARK is not set
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
CONFIG_NETFILTER=y
# CONFIG_NETFILTER_ADVANCED is not set
CONFIG_ATM=y
CONFIG_ATM_LANE=y
CONFIG_STP=y
CONFIG_GARP=y
CONFIG_MRP=y
CONFIG_BRIDGE=y
# CONFIG_BRIDGE_VLAN_FILTERING is not set
CONFIG_BRIDGE_MRP=y
# CONFIG_BRIDGE_CFM is not set
CONFIG_VLAN_8021Q=y
CONFIG_VLAN_8021Q_GVRP=y
CONFIG_VLAN_8021Q_MVRP=y
CONFIG_LLC=y
# CONFIG_LLC2 is not set
CONFIG_ATALK=y
CONFIG_DEV_APPLETALK=y
CONFIG_IPDDP=y
CONFIG_IPDDP_ENCAP=y
CONFIG_X25=y
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
CONFIG_IEEE802154=y
CONFIG_IEEE802154_NL802154_EXPERIMENTAL=y
CONFIG_IEEE802154_SOCKET=y
CONFIG_MAC802154=y
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_CBQ=y
CONFIG_NET_SCH_HTB=y
CONFIG_NET_SCH_HFSC=y
# CONFIG_NET_SCH_ATM is not set
CONFIG_NET_SCH_PRIO=y
# CONFIG_NET_SCH_MULTIQ is not set
CONFIG_NET_SCH_RED=y
CONFIG_NET_SCH_SFB=y
CONFIG_NET_SCH_SFQ=y
CONFIG_NET_SCH_TEQL=y
CONFIG_NET_SCH_TBF=y
# CONFIG_NET_SCH_CBS is not set
CONFIG_NET_SCH_ETF=y
# CONFIG_NET_SCH_TAPRIO is not set
# CONFIG_NET_SCH_GRED is not set
CONFIG_NET_SCH_DSMARK=y
# CONFIG_NET_SCH_NETEM is not set
CONFIG_NET_SCH_DRR=y
CONFIG_NET_SCH_MQPRIO=y
# CONFIG_NET_SCH_SKBPRIO is not set
CONFIG_NET_SCH_CHOKE=y
# CONFIG_NET_SCH_QFQ is not set
# CONFIG_NET_SCH_CODEL is not set
CONFIG_NET_SCH_FQ_CODEL=y
CONFIG_NET_SCH_CAKE=y
# CONFIG_NET_SCH_FQ is not set
CONFIG_NET_SCH_HHF=y
CONFIG_NET_SCH_PIE=y
# CONFIG_NET_SCH_FQ_PIE is not set
CONFIG_NET_SCH_PLUG=y
CONFIG_NET_SCH_ETS=y
CONFIG_NET_SCH_DEFAULT=y
# CONFIG_DEFAULT_FQ_CODEL is not set
# CONFIG_DEFAULT_SFQ is not set
CONFIG_DEFAULT_PFIFO_FAST=y
CONFIG_DEFAULT_NET_SCH="pfifo_fast"

#
# Classification
#
CONFIG_NET_CLS=y
# CONFIG_NET_CLS_BASIC is not set
CONFIG_NET_CLS_TCINDEX=y
# CONFIG_NET_CLS_FW is not set
CONFIG_NET_CLS_U32=y
CONFIG_CLS_U32_PERF=y
CONFIG_CLS_U32_MARK=y
# CONFIG_NET_CLS_RSVP is not set
CONFIG_NET_CLS_RSVP6=y
CONFIG_NET_CLS_FLOW=y
CONFIG_NET_CLS_CGROUP=y
CONFIG_NET_CLS_BPF=y
CONFIG_NET_CLS_FLOWER=y
CONFIG_NET_CLS_MATCHALL=y
CONFIG_NET_EMATCH=y
CONFIG_NET_EMATCH_STACK=32
CONFIG_NET_EMATCH_CMP=y
# CONFIG_NET_EMATCH_NBYTE is not set
CONFIG_NET_EMATCH_U32=y
# CONFIG_NET_EMATCH_META is not set
CONFIG_NET_EMATCH_TEXT=y
CONFIG_NET_EMATCH_CANID=y
# CONFIG_NET_CLS_ACT is not set
CONFIG_NET_SCH_FIFO=y
# CONFIG_DCB is not set
CONFIG_DNS_RESOLVER=y
CONFIG_BATMAN_ADV=y
CONFIG_BATMAN_ADV_BATMAN_V=y
# CONFIG_BATMAN_ADV_NC is not set
# CONFIG_BATMAN_ADV_DEBUG is not set
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
CONFIG_MPLS_ROUTING=y
# CONFIG_NET_NSH is not set
CONFIG_HSR=y
CONFIG_QRTR=y
# CONFIG_QRTR_SMD is not set
CONFIG_QRTR_TUN=y
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y

#
# Network testing
#
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=y
CONFIG_CAN_RAW=y
# CONFIG_CAN_BCM is not set
CONFIG_CAN_GW=y
CONFIG_CAN_J1939=y
CONFIG_CAN_ISOTP=y
CONFIG_BT=y
CONFIG_BT_BREDR=y
CONFIG_BT_RFCOMM=y
CONFIG_BT_BNEP=y
# CONFIG_BT_BNEP_MC_FILTER is not set
CONFIG_BT_BNEP_PROTO_FILTER=y
# CONFIG_BT_HS is not set
# CONFIG_BT_LE is not set
CONFIG_BT_LEDS=y
CONFIG_BT_MSFTEXT=y
# CONFIG_BT_AOSPEXT is not set
# CONFIG_BT_DEBUGFS is not set
# CONFIG_BT_SELFTEST is not set
# CONFIG_BT_FEATURE_DEBUG is not set

#
# Bluetooth device drivers
#
CONFIG_BT_MTK=y
CONFIG_BT_HCIBTSDIO=y
CONFIG_BT_HCIVHCI=y
CONFIG_BT_MRVL=y
CONFIG_BT_MRVL_SDIO=y
CONFIG_BT_MTKSDIO=y
# CONFIG_BT_MTKUART is not set
# CONFIG_BT_QCOMSMD is not set
CONFIG_BT_VIRTIO=y
# end of Bluetooth device drivers

# CONFIG_MCTP is not set
CONFIG_WIRELESS=y
CONFIG_WEXT_CORE=y
CONFIG_WEXT_PROC=y
CONFIG_CFG80211=y
# CONFIG_NL80211_TESTMODE is not set
# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
# CONFIG_CFG80211_CERTIFICATION_ONUS is not set
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
CONFIG_CFG80211_DEFAULT_PS=y
CONFIG_CFG80211_DEBUGFS=y
CONFIG_CFG80211_CRDA_SUPPORT=y
CONFIG_CFG80211_WEXT=y
CONFIG_MAC80211=y
# CONFIG_MAC80211_RC_MINSTREL is not set
CONFIG_MAC80211_RC_DEFAULT=""

#
# Some wireless drivers require a rate control algorithm
#
# CONFIG_MAC80211_MESH is not set
# CONFIG_MAC80211_LEDS is not set
# CONFIG_MAC80211_DEBUGFS is not set
CONFIG_MAC80211_MESSAGE_TRACING=y
CONFIG_MAC80211_DEBUG_MENU=y
# CONFIG_MAC80211_NOINLINE is not set
# CONFIG_MAC80211_VERBOSE_DEBUG is not set
CONFIG_MAC80211_MLME_DEBUG=y
CONFIG_MAC80211_STA_DEBUG=y
# CONFIG_MAC80211_HT_DEBUG is not set
CONFIG_MAC80211_OCB_DEBUG=y
# CONFIG_MAC80211_IBSS_DEBUG is not set
CONFIG_MAC80211_PS_DEBUG=y
CONFIG_MAC80211_TDLS_DEBUG=y
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
CONFIG_RFKILL=y
CONFIG_RFKILL_LEDS=y
# CONFIG_RFKILL_GPIO is not set
# CONFIG_NET_9P is not set
CONFIG_CAIF=y
CONFIG_CAIF_DEBUG=y
CONFIG_CAIF_NETDEV=y
# CONFIG_CAIF_USB is not set
CONFIG_NFC=y
CONFIG_NFC_DIGITAL=y
CONFIG_NFC_NCI=y
# CONFIG_NFC_NCI_SPI is not set
CONFIG_NFC_HCI=y
# CONFIG_NFC_SHDLC is not set

#
# Near Field Communication (NFC) devices
#
CONFIG_NFC_TRF7970A=y
CONFIG_NFC_SIM=y
# CONFIG_NFC_VIRTUAL_NCI is not set
# CONFIG_NFC_FDP is not set
CONFIG_NFC_PN533=y
CONFIG_NFC_PN533_I2C=y
# CONFIG_NFC_PN532_UART is not set
CONFIG_NFC_ST_NCI=y
CONFIG_NFC_ST_NCI_I2C=y
CONFIG_NFC_ST_NCI_SPI=y
# CONFIG_NFC_NXP_NCI is not set
CONFIG_NFC_S3FWRN5=y
# CONFIG_NFC_S3FWRN5_I2C is not set
CONFIG_NFC_S3FWRN82_UART=y
CONFIG_NFC_ST95HF=y
# end of Near Field Communication (NFC) devices

CONFIG_PSAMPLE=y
CONFIG_NET_IFE=y
# CONFIG_LWTUNNEL is not set
CONFIG_NET_SOCK_MSG=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=y
# CONFIG_ETHTOOL_NETLINK is not set
CONFIG_NETDEV_ADDR_LIST_TEST=y

#
# Device Drivers
#
CONFIG_ARM_AMBA=y
# CONFIG_PCCARD is not set

#
# Generic Driver Options
#
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
# CONFIG_DEVTMPFS_SAFE is not set
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
# CONFIG_FW_LOADER_COMPRESS is not set
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
CONFIG_DEBUG_DRIVER=y
CONFIG_DEBUG_DEVRES=y
CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
CONFIG_PM_QOS_KUNIT_TEST=y
CONFIG_DRIVER_PE_KUNIT_TEST=y
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_SOUNDWIRE=y
CONFIG_REGMAP_SOUNDWIRE_MBQ=y
CONFIG_REGMAP_I3C=y
CONFIG_REGMAP_SPI_AVMM=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_ARM_INTEGRATOR_LM is not set
CONFIG_BRCMSTB_GISB_ARB=y
# CONFIG_BT1_APB is not set
# CONFIG_BT1_AXI is not set
# CONFIG_MOXTET is not set
# CONFIG_HISILICON_LPC is not set
# CONFIG_INTEL_IXP4XX_EB is not set
# CONFIG_QCOM_EBI2 is not set
CONFIG_VEXPRESS_CONFIG=y
# CONFIG_FSL_MC_BUS is not set
# CONFIG_MHI_BUS is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

# CONFIG_CONNECTOR is not set

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# CONFIG_ARM_SCMI_PROTOCOL is not set
CONFIG_ARM_SCMI_POWER_DOMAIN=y
# CONFIG_ARM_SCMI_POWER_CONTROL is not set
# end of ARM System Control and Management Interface Protocol

# CONFIG_ARM_SCPI_PROTOCOL is not set
CONFIG_ARM_SCPI_POWER_DOMAIN=y
# CONFIG_FIRMWARE_MEMMAP is not set
# CONFIG_TURRIS_MOX_RWTM is not set
# CONFIG_BCM47XX_NVRAM is not set
CONFIG_CS_DSP=y
# CONFIG_GOOGLE_FIRMWARE is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=y
CONFIG_GNSS_SERIAL=y
CONFIG_GNSS_MTK_SERIAL=y
CONFIG_GNSS_SIRF_SERIAL=y
CONFIG_GNSS_UBX_SERIAL=y
CONFIG_MTD=y

#
# Partition parsers
#
# CONFIG_MTD_AR7_PARTS is not set
# CONFIG_MTD_BCM63XX_PARTS is not set
# CONFIG_MTD_BRCM_U_BOOT is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
CONFIG_MTD_OF_PARTS=y
# CONFIG_MTD_OF_PARTS_BCM4908 is not set
# CONFIG_MTD_OF_PARTS_LINKSYS_NS is not set
# CONFIG_MTD_PARSER_IMAGETAG is not set
CONFIG_MTD_AFS_PARTS=y
# CONFIG_MTD_PARSER_TRX is not set
# CONFIG_MTD_SHARPSL_PARTS is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_OOPS=y
CONFIG_MTD_PARTITIONED_MASTER=y

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_AMDSTD=y
# CONFIG_MTD_CFI_STAA is not set
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_RAM=y
CONFIG_MTD_ROM=y
CONFIG_MTD_ABSENT=y
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
CONFIG_MTD_PHYSMAP=y
# CONFIG_MTD_PHYSMAP_COMPAT is not set
CONFIG_MTD_PHYSMAP_OF=y
# CONFIG_MTD_PHYSMAP_BT1_ROM is not set
# CONFIG_MTD_PHYSMAP_VERSATILE is not set
# CONFIG_MTD_PHYSMAP_GEMINI is not set
# CONFIG_MTD_PHYSMAP_IXP4XX is not set
# CONFIG_MTD_SC520CDP is not set
# CONFIG_MTD_NETSC520 is not set
# CONFIG_MTD_TS5500 is not set
CONFIG_MTD_IMPA7=y
CONFIG_MTD_UCLINUX=y
CONFIG_MTD_PLATRAM=y
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_DATAFLASH is not set
CONFIG_MTD_MCHP23K256=y
CONFIG_MTD_MCHP48L640=y
CONFIG_MTD_SPEAR_SMI=y
CONFIG_MTD_SST25L=y
CONFIG_MTD_SLRAM=y
CONFIG_MTD_PHRAM=y
CONFIG_MTD_MTDRAM=y
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=y
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_NAND_CORE=y
# CONFIG_MTD_ONENAND is not set
# CONFIG_MTD_RAW_NAND is not set
# CONFIG_MTD_SPI_NAND is not set

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
# CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC is not set
# CONFIG_MTD_NAND_ECC_SW_BCH is not set
CONFIG_MTD_NAND_ECC_MXIC=y
# CONFIG_MTD_NAND_ECC_MEDIATEK is not set
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=y
CONFIG_MTD_QINFO_PROBE=y
CONFIG_MTD_LPDDR2_NVM=y
# end of LPDDR & LPDDR2 PCM memory drivers

CONFIG_MTD_SPI_NOR=y
CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=y
CONFIG_MTD_SPI_NOR_SWP_DISABLE=y
# CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE is not set
# CONFIG_MTD_SPI_NOR_SWP_KEEP is not set
# CONFIG_SPI_HISI_SFC is not set
# CONFIG_SPI_NXP_SPIFI is not set
CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
CONFIG_MTD_UBI_FASTMAP=y
CONFIG_MTD_UBI_GLUEBI=y
# CONFIG_MTD_HYPERBUS is not set
CONFIG_DTC=y
CONFIG_OF=y
CONFIG_OF_UNITTEST=y
# CONFIG_OF_ALL_DTBS is not set
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_KOBJ=y
# CONFIG_OF_DYNAMIC is not set
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
CONFIG_OF_RESERVED_MEM=y
CONFIG_OF_RESOLVE=y
# CONFIG_OF_OVERLAY is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=y
# CONFIG_PARPORT_PC is not set
# CONFIG_PARPORT_AX88796 is not set
CONFIG_PARPORT_1284=y

#
# NVME Support
#
# end of NVME Support

#
# Misc devices
#
CONFIG_AD525X_DPOT=y
CONFIG_AD525X_DPOT_I2C=y
CONFIG_AD525X_DPOT_SPI=y
# CONFIG_DUMMY_IRQ is not set
CONFIG_ICS932S401=y
CONFIG_ATMEL_SSC=y
# CONFIG_ENCLOSURE_SERVICES is not set
# CONFIG_GEHC_ACHC is not set
# CONFIG_QCOM_COINCELL is not set
# CONFIG_QCOM_FASTRPC is not set
CONFIG_APDS9802ALS=y
# CONFIG_ISL29003 is not set
# CONFIG_ISL29020 is not set
# CONFIG_SENSORS_TSL2550 is not set
CONFIG_SENSORS_BH1770=y
CONFIG_SENSORS_APDS990X=y
CONFIG_HMC6352=y
# CONFIG_DS1682 is not set
CONFIG_LATTICE_ECP3_CONFIG=y
# CONFIG_SRAM is not set
CONFIG_XILINX_SDFEC=y
# CONFIG_OPEN_DICE is not set
# CONFIG_VCPU_STALL_DETECTOR is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
CONFIG_EEPROM_AT25=y
CONFIG_EEPROM_LEGACY=y
CONFIG_EEPROM_MAX6875=y
# CONFIG_EEPROM_93CX6 is not set
# CONFIG_EEPROM_93XX46 is not set
CONFIG_EEPROM_IDT_89HPESX=y
CONFIG_EEPROM_EE1004=y
# end of EEPROM support

#
# Texas Instruments shared transport line discipline
#
# end of Texas Instruments shared transport line discipline

CONFIG_ALTERA_STAPL=y
CONFIG_ECHO=y
# CONFIG_PVPANIC is not set
# end of Misc devices

#
# SCSI device support
#
# end of SCSI device support

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# end of IEEE 1394 (FireWire) support

# CONFIG_NETDEVICES is not set

#
# Input device support
#
# CONFIG_INPUT is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_PARKBD=y
CONFIG_SERIO_AMBAKMI=y
# CONFIG_SERIO_LIBPS2 is not set
CONFIG_SERIO_RAW=y
CONFIG_SERIO_ALTERA_PS2=y
CONFIG_SERIO_PS2MULT=y
# CONFIG_SERIO_ARC_PS2 is not set
CONFIG_SERIO_APBPS2=y
# CONFIG_SERIO_OLPC_APSP is not set
# CONFIG_SERIO_SUN4I_PS2 is not set
CONFIG_SERIO_GPIO_PS2=y
CONFIG_USERIO=y
CONFIG_GAMEPORT=y
CONFIG_GAMEPORT_NS558=y
# CONFIG_GAMEPORT_L4 is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
# CONFIG_TTY is not set
CONFIG_SERIAL_DEV_BUS=y
CONFIG_PRINTER=y
CONFIG_LP_CONSOLE=y
CONFIG_PPDEV=y
# CONFIG_IPMI_HANDLER is not set
# CONFIG_ASPEED_KCS_IPMI_BMC is not set
# CONFIG_NPCM7XX_KCS_IPMI_BMC is not set
# CONFIG_ASPEED_BT_IPMI_BMC is not set
CONFIG_IPMB_DEVICE_INTERFACE=y
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=y
CONFIG_HW_RANDOM_ATMEL=y
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_BCM2835=y
CONFIG_HW_RANDOM_IPROC_RNG200=y
CONFIG_HW_RANDOM_IXP4XX=y
CONFIG_HW_RANDOM_OMAP=y
CONFIG_HW_RANDOM_OMAP3_ROM=y
CONFIG_HW_RANDOM_VIRTIO=y
CONFIG_HW_RANDOM_IMX_RNGC=y
CONFIG_HW_RANDOM_NOMADIK=y
# CONFIG_HW_RANDOM_STM32 is not set
CONFIG_HW_RANDOM_MESON=y
CONFIG_HW_RANDOM_MTK=y
CONFIG_HW_RANDOM_EXYNOS=y
CONFIG_HW_RANDOM_NPCM=y
CONFIG_HW_RANDOM_KEYSTONE=y
CONFIG_HW_RANDOM_CCTRNG=y
CONFIG_HW_RANDOM_XIPHERA=y
CONFIG_DEVMEM=y
# CONFIG_TCG_TPM is not set
CONFIG_XILLYBUS_CLASS=y
CONFIG_XILLYBUS=y
# CONFIG_XILLYBUS_OF is not set
CONFIG_RANDOM_TRUST_CPU=y
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
# CONFIG_I2C_CHARDEV is not set
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_ARB_GPIO_CHALLENGE=y
CONFIG_I2C_MUX_GPIO=y
CONFIG_I2C_MUX_GPMUX=y
CONFIG_I2C_MUX_LTC4306=y
CONFIG_I2C_MUX_PCA9541=y
# CONFIG_I2C_MUX_PCA954x is not set
# CONFIG_I2C_MUX_PINCTRL is not set
CONFIG_I2C_MUX_REG=y
# CONFIG_I2C_DEMUX_PINCTRL is not set
CONFIG_I2C_MUX_MLXCPLD=y
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=y

#
# I2C Hardware Bus support
#
# CONFIG_I2C_HIX5HD2 is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_ALTERA is not set
# CONFIG_I2C_ASPEED is not set
# CONFIG_I2C_AT91 is not set
# CONFIG_I2C_AXXIA is not set
# CONFIG_I2C_BCM2835 is not set
# CONFIG_I2C_BCM_IPROC is not set
# CONFIG_I2C_BCM_KONA is not set
CONFIG_I2C_BRCMSTB=y
# CONFIG_I2C_CADENCE is not set
# CONFIG_I2C_CBUS_GPIO is not set
# CONFIG_I2C_DAVINCI is not set
CONFIG_I2C_DESIGNWARE_CORE=y
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=y
# CONFIG_I2C_DIGICOLOR is not set
CONFIG_I2C_EMEV2=y
# CONFIG_I2C_EXYNOS5 is not set
CONFIG_I2C_GPIO=y
# CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
# CONFIG_I2C_HIGHLANDER is not set
# CONFIG_I2C_HISI is not set
# CONFIG_I2C_IMG is not set
# CONFIG_I2C_IMX is not set
# CONFIG_I2C_IMX_LPI2C is not set
# CONFIG_I2C_IOP3XX is not set
# CONFIG_I2C_JZ4780 is not set
# CONFIG_I2C_LPC2K is not set
# CONFIG_I2C_MESON is not set
# CONFIG_I2C_MICROCHIP_CORE is not set
# CONFIG_I2C_MT65XX is not set
# CONFIG_I2C_MT7621 is not set
# CONFIG_I2C_MV64XXX is not set
# CONFIG_I2C_MXS is not set
# CONFIG_I2C_NOMADIK is not set
# CONFIG_I2C_NPCM is not set
CONFIG_I2C_OCORES=y
# CONFIG_I2C_OMAP is not set
# CONFIG_I2C_OWL is not set
# CONFIG_I2C_APPLE is not set
CONFIG_I2C_PCA_PLATFORM=y
# CONFIG_I2C_PNX is not set
# CONFIG_I2C_PXA is not set
# CONFIG_I2C_QCOM_CCI is not set
# CONFIG_I2C_QUP is not set
# CONFIG_I2C_RIIC is not set
# CONFIG_I2C_RK3X is not set
# CONFIG_I2C_RZV2M is not set
# CONFIG_I2C_S3C2410 is not set
# CONFIG_I2C_SH_MOBILE is not set
CONFIG_I2C_SIMTEC=y
# CONFIG_I2C_SPRD is not set
# CONFIG_I2C_ST is not set
# CONFIG_I2C_STM32F4 is not set
CONFIG_I2C_STM32F7=y
# CONFIG_I2C_SUN6I_P2WI is not set
# CONFIG_I2C_SYNQUACER is not set
# CONFIG_I2C_TEGRA is not set
# CONFIG_I2C_TEGRA_BPMP is not set
# CONFIG_I2C_UNIPHIER is not set
# CONFIG_I2C_UNIPHIER_F is not set
# CONFIG_I2C_VERSATILE is not set
# CONFIG_I2C_WMT is not set
CONFIG_I2C_XILINX=y
# CONFIG_I2C_XLP9XX is not set
# CONFIG_I2C_RCAR is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_PARPORT is not set

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_MLXCPLD is not set
CONFIG_I2C_CROS_EC_TUNNEL=y
CONFIG_I2C_FSI=y
CONFIG_I2C_VIRTIO=y
# end of I2C Hardware Bus support

CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
# CONFIG_I2C_SLAVE_TESTUNIT is not set
CONFIG_I2C_DEBUG_CORE=y
CONFIG_I2C_DEBUG_ALGO=y
CONFIG_I2C_DEBUG_BUS=y
# end of I2C support

CONFIG_I3C=y
# CONFIG_CDNS_I3C_MASTER is not set
CONFIG_DW_I3C_MASTER=y
# CONFIG_SVC_I3C_MASTER is not set
CONFIG_MIPI_I3C_HCI=y
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
CONFIG_SPI_MEM=y

#
# SPI Master Controller Drivers
#
CONFIG_SPI_ALTERA=y
CONFIG_SPI_ALTERA_CORE=y
# CONFIG_SPI_AR934X is not set
# CONFIG_SPI_ATH79 is not set
# CONFIG_SPI_ARMADA_3700 is not set
# CONFIG_SPI_ASPEED_SMC is not set
CONFIG_SPI_ATMEL=y
CONFIG_SPI_ATMEL_QUADSPI=y
CONFIG_SPI_AXI_SPI_ENGINE=y
# CONFIG_SPI_BCM2835 is not set
# CONFIG_SPI_BCM2835AUX is not set
# CONFIG_SPI_BCM63XX is not set
# CONFIG_SPI_BCM63XX_HSSPI is not set
# CONFIG_SPI_BCM_QSPI is not set
CONFIG_SPI_BITBANG=y
# CONFIG_SPI_BUTTERFLY is not set
# CONFIG_SPI_CADENCE is not set
CONFIG_SPI_CADENCE_QUADSPI=y
# CONFIG_SPI_CADENCE_XSPI is not set
# CONFIG_SPI_CLPS711X is not set
CONFIG_SPI_DESIGNWARE=y
# CONFIG_SPI_DW_DMA is not set
CONFIG_SPI_DW_MMIO=y
# CONFIG_SPI_DW_BT1 is not set
# CONFIG_SPI_EP93XX is not set
CONFIG_SPI_FSI=y
# CONFIG_SPI_FSL_LPSPI is not set
# CONFIG_SPI_FSL_QUADSPI is not set
# CONFIG_SPI_GXP is not set
# CONFIG_SPI_HISI_KUNPENG is not set
# CONFIG_SPI_HISI_SFC_V3XX is not set
# CONFIG_SPI_NXP_FLEXSPI is not set
# CONFIG_SPI_GPIO is not set
# CONFIG_SPI_IMG_SPFI is not set
# CONFIG_SPI_IMX is not set
# CONFIG_SPI_INGENIC is not set
# CONFIG_SPI_INTEL_PLATFORM is not set
# CONFIG_SPI_JCORE is not set
CONFIG_SPI_LM70_LLP=y
# CONFIG_SPI_LP8841_RTC is not set
CONFIG_SPI_FSL_LIB=y
CONFIG_SPI_FSL_SPI=y
# CONFIG_SPI_FSL_DSPI is not set
# CONFIG_SPI_MESON_SPICC is not set
# CONFIG_SPI_MESON_SPIFC is not set
# CONFIG_SPI_MICROCHIP_CORE is not set
# CONFIG_SPI_MICROCHIP_CORE_QSPI is not set
# CONFIG_SPI_MT65XX is not set
# CONFIG_SPI_MT7621 is not set
# CONFIG_SPI_MTK_NOR is not set
# CONFIG_SPI_NPCM_FIU is not set
# CONFIG_SPI_NPCM_PSPI is not set
# CONFIG_SPI_LANTIQ_SSC is not set
# CONFIG_SPI_OC_TINY is not set
# CONFIG_SPI_OMAP_UWIRE is not set
# CONFIG_SPI_OMAP24XX is not set
# CONFIG_SPI_TI_QSPI is not set
# CONFIG_SPI_OMAP_100K is not set
# CONFIG_SPI_ORION is not set
# CONFIG_SPI_PIC32 is not set
# CONFIG_SPI_PIC32_SQI is not set
CONFIG_SPI_PL022=y
# CONFIG_SPI_PXA2XX is not set
# CONFIG_SPI_ROCKCHIP is not set
# CONFIG_SPI_ROCKCHIP_SFC is not set
# CONFIG_SPI_RSPI is not set
# CONFIG_SPI_QUP is not set
# CONFIG_SPI_S3C64XX is not set
# CONFIG_SPI_SC18IS602 is not set
# CONFIG_SPI_SH_MSIOF is not set
# CONFIG_SPI_SH is not set
# CONFIG_SPI_SH_HSPI is not set
CONFIG_SPI_SIFIVE=y
# CONFIG_SPI_SPRD is not set
# CONFIG_SPI_SPRD_ADI is not set
CONFIG_SPI_STM32=y
CONFIG_SPI_STM32_QSPI=y
# CONFIG_SPI_ST_SSC4 is not set
# CONFIG_SPI_SUN4I is not set
# CONFIG_SPI_SUN6I is not set
# CONFIG_SPI_SUNPLUS_SP7021 is not set
# CONFIG_SPI_SYNQUACER is not set
CONFIG_SPI_MXIC=y
# CONFIG_SPI_TEGRA210_QUAD is not set
# CONFIG_SPI_TEGRA114 is not set
# CONFIG_SPI_TEGRA20_SFLASH is not set
# CONFIG_SPI_TEGRA20_SLINK is not set
# CONFIG_SPI_UNIPHIER is not set
# CONFIG_SPI_XCOMM is not set
CONFIG_SPI_XILINX=y
# CONFIG_SPI_XLP is not set
# CONFIG_SPI_XTENSA_XTFPGA is not set
# CONFIG_SPI_ZYNQ_QSPI is not set
CONFIG_SPI_ZYNQMP_GQSPI=y
CONFIG_SPI_AMD=y

#
# SPI Multiplexer support
#
CONFIG_SPI_MUX=y

#
# SPI Protocol Masters
#
# CONFIG_SPI_SPIDEV is not set
CONFIG_SPI_TLE62X0=y
# CONFIG_SPI_SLAVE is not set
# CONFIG_SPMI is not set
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#
# CONFIG_OMAP_SSI is not set

#
# HSI clients
#
CONFIG_HSI_CHAR=y
CONFIG_PPS=y
CONFIG_PPS_DEBUG=y
# CONFIG_NTP_PPS is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
# CONFIG_PPS_CLIENT_PARPORT is not set
CONFIG_PPS_CLIENT_GPIO=y

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
# CONFIG_PINCTRL_AMD is not set
CONFIG_PINCTRL_AT91=y
# CONFIG_PINCTRL_AT91PIO4 is not set
# CONFIG_PINCTRL_AXP209 is not set
# CONFIG_PINCTRL_BM1880 is not set
# CONFIG_PINCTRL_CY8C95X0 is not set
# CONFIG_PINCTRL_DA850_PUPD is not set
# CONFIG_PINCTRL_DA9062 is not set
# CONFIG_PINCTRL_EQUILIBRIUM is not set
# CONFIG_PINCTRL_INGENIC is not set
# CONFIG_PINCTRL_LPC18XX is not set
CONFIG_PINCTRL_MAX77620=y
# CONFIG_PINCTRL_MCP23S08 is not set
CONFIG_PINCTRL_MICROCHIP_SGPIO=y
# CONFIG_PINCTRL_OCELOT is not set
# CONFIG_PINCTRL_PISTACHIO is not set
CONFIG_PINCTRL_RK805=y
# CONFIG_PINCTRL_ROCKCHIP is not set
CONFIG_PINCTRL_SINGLE=y
CONFIG_PINCTRL_STMFX=y
CONFIG_PINCTRL_SX150X=y
# CONFIG_PINCTRL_OWL is not set
# CONFIG_PINCTRL_ASPEED_G4 is not set
# CONFIG_PINCTRL_ASPEED_G5 is not set
# CONFIG_PINCTRL_ASPEED_G6 is not set
# CONFIG_PINCTRL_BCM281XX is not set
# CONFIG_PINCTRL_BCM2835 is not set
# CONFIG_PINCTRL_BCM4908 is not set
# CONFIG_PINCTRL_BCM6318 is not set
# CONFIG_PINCTRL_BCM6328 is not set
# CONFIG_PINCTRL_BCM6358 is not set
# CONFIG_PINCTRL_BCM6362 is not set
# CONFIG_PINCTRL_BCM6368 is not set
# CONFIG_PINCTRL_BCM63268 is not set
# CONFIG_PINCTRL_IPROC_GPIO is not set
# CONFIG_PINCTRL_CYGNUS_MUX is not set
# CONFIG_PINCTRL_NS is not set
# CONFIG_PINCTRL_NSP_GPIO is not set
# CONFIG_PINCTRL_NS2_MUX is not set
# CONFIG_PINCTRL_NSP_MUX is not set
# CONFIG_PINCTRL_AS370 is not set
# CONFIG_PINCTRL_BERLIN_BG4CT is not set
CONFIG_PINCTRL_LOCHNAGAR=y
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L15=y
CONFIG_PINCTRL_CS47L35=y
CONFIG_PINCTRL_CS47L90=y
CONFIG_PINCTRL_CS47L92=y

#
# Intel pinctrl drivers
#
# end of Intel pinctrl drivers

#
# MediaTek pinctrl drivers
#
# CONFIG_EINT_MTK is not set
# CONFIG_PINCTRL_MT2701 is not set
# CONFIG_PINCTRL_MT7623 is not set
# CONFIG_PINCTRL_MT7629 is not set
# CONFIG_PINCTRL_MT8135 is not set
# CONFIG_PINCTRL_MT8127 is not set
# CONFIG_PINCTRL_MT2712 is not set
# CONFIG_PINCTRL_MT6765 is not set
# CONFIG_PINCTRL_MT6779 is not set
# CONFIG_PINCTRL_MT6795 is not set
# CONFIG_PINCTRL_MT6797 is not set
# CONFIG_PINCTRL_MT7622 is not set
# CONFIG_PINCTRL_MT7986 is not set
# CONFIG_PINCTRL_MT8167 is not set
# CONFIG_PINCTRL_MT8173 is not set
# CONFIG_PINCTRL_MT8183 is not set
# CONFIG_PINCTRL_MT8186 is not set
# CONFIG_PINCTRL_MT8188 is not set
# CONFIG_PINCTRL_MT8192 is not set
# CONFIG_PINCTRL_MT8195 is not set
# CONFIG_PINCTRL_MT8365 is not set
# CONFIG_PINCTRL_MT8516 is not set
# CONFIG_PINCTRL_MT6397 is not set
# end of MediaTek pinctrl drivers

CONFIG_PINCTRL_MESON=y
CONFIG_PINCTRL_MESON8=y
CONFIG_PINCTRL_MESON8B=y
CONFIG_PINCTRL_MESON8_PMX=y
# CONFIG_PINCTRL_WPCM450 is not set
# CONFIG_PINCTRL_NPCM7XX is not set
# CONFIG_PINCTRL_PXA25X is not set
# CONFIG_PINCTRL_PXA27X is not set
# CONFIG_PINCTRL_MSM is not set
# CONFIG_PINCTRL_QCOM_SSBI_PMIC is not set
# CONFIG_PINCTRL_LPASS_LPI is not set

#
# Renesas pinctrl drivers
#
# CONFIG_PINCTRL_RENESAS is not set
# CONFIG_PINCTRL_PFC_EMEV2 is not set
# CONFIG_PINCTRL_PFC_R8A77995 is not set
# CONFIG_PINCTRL_PFC_R8A7794 is not set
# CONFIG_PINCTRL_PFC_R8A77990 is not set
# CONFIG_PINCTRL_PFC_R8A7779 is not set
# CONFIG_PINCTRL_PFC_R8A7790 is not set
# CONFIG_PINCTRL_PFC_R8A77950 is not set
# CONFIG_PINCTRL_PFC_R8A77951 is not set
# CONFIG_PINCTRL_PFC_R8A7778 is not set
# CONFIG_PINCTRL_PFC_R8A7793 is not set
# CONFIG_PINCTRL_PFC_R8A7791 is not set
# CONFIG_PINCTRL_PFC_R8A77965 is not set
# CONFIG_PINCTRL_PFC_R8A77960 is not set
# CONFIG_PINCTRL_PFC_R8A77961 is not set
# CONFIG_PINCTRL_PFC_R8A779F0 is not set
# CONFIG_PINCTRL_PFC_R8A7792 is not set
# CONFIG_PINCTRL_PFC_R8A77980 is not set
# CONFIG_PINCTRL_PFC_R8A77970 is not set
# CONFIG_PINCTRL_PFC_R8A779A0 is not set
# CONFIG_PINCTRL_PFC_R8A779G0 is not set
# CONFIG_PINCTRL_PFC_R8A7740 is not set
# CONFIG_PINCTRL_PFC_R8A73A4 is not set
# CONFIG_PINCTRL_RZA1 is not set
# CONFIG_PINCTRL_RZA2 is not set
# CONFIG_PINCTRL_RZG2L is not set
# CONFIG_PINCTRL_PFC_R8A77470 is not set
# CONFIG_PINCTRL_PFC_R8A7745 is not set
# CONFIG_PINCTRL_PFC_R8A7742 is not set
# CONFIG_PINCTRL_PFC_R8A7743 is not set
# CONFIG_PINCTRL_PFC_R8A7744 is not set
# CONFIG_PINCTRL_PFC_R8A774C0 is not set
# CONFIG_PINCTRL_PFC_R8A774E1 is not set
# CONFIG_PINCTRL_PFC_R8A774A1 is not set
# CONFIG_PINCTRL_PFC_R8A774B1 is not set
# CONFIG_PINCTRL_RZN1 is not set
# CONFIG_PINCTRL_RZV2M is not set
# CONFIG_PINCTRL_PFC_SH7203 is not set
# CONFIG_PINCTRL_PFC_SH7264 is not set
# CONFIG_PINCTRL_PFC_SH7269 is not set
# CONFIG_PINCTRL_PFC_SH7720 is not set
# CONFIG_PINCTRL_PFC_SH7722 is not set
# CONFIG_PINCTRL_PFC_SH7734 is not set
# CONFIG_PINCTRL_PFC_SH7757 is not set
# CONFIG_PINCTRL_PFC_SH7785 is not set
# CONFIG_PINCTRL_PFC_SH7786 is not set
# CONFIG_PINCTRL_PFC_SH73A0 is not set
# CONFIG_PINCTRL_PFC_SH7723 is not set
# CONFIG_PINCTRL_PFC_SH7724 is not set
# CONFIG_PINCTRL_PFC_SHX3 is not set
# end of Renesas pinctrl drivers

# CONFIG_PINCTRL_EXYNOS is not set
# CONFIG_PINCTRL_S3C24XX is not set
# CONFIG_PINCTRL_S3C64XX is not set
# CONFIG_PINCTRL_SPRD_SC9860 is not set
# CONFIG_PINCTRL_STARFIVE_JH7100 is not set
CONFIG_PINCTRL_STM32=y
# CONFIG_PINCTRL_STM32F429 is not set
CONFIG_PINCTRL_STM32F469=y
# CONFIG_PINCTRL_STM32F746 is not set
# CONFIG_PINCTRL_STM32F769 is not set
# CONFIG_PINCTRL_STM32H743 is not set
# CONFIG_PINCTRL_STM32MP135 is not set
# CONFIG_PINCTRL_STM32MP157 is not set
# CONFIG_PINCTRL_TI_IODELAY is not set
CONFIG_PINCTRL_UNIPHIER=y
CONFIG_PINCTRL_UNIPHIER_LD4=y
CONFIG_PINCTRL_UNIPHIER_PRO4=y
CONFIG_PINCTRL_UNIPHIER_SLD8=y
CONFIG_PINCTRL_UNIPHIER_PRO5=y
CONFIG_PINCTRL_UNIPHIER_PXS2=y
CONFIG_PINCTRL_UNIPHIER_LD6B=y
# CONFIG_PINCTRL_UNIPHIER_LD11 is not set
# CONFIG_PINCTRL_UNIPHIER_LD20 is not set
# CONFIG_PINCTRL_UNIPHIER_PXS3 is not set
# CONFIG_PINCTRL_UNIPHIER_NX1 is not set
# CONFIG_PINCTRL_TMPV7700 is not set
CONFIG_ARCH_HAVE_CUSTOM_GPIO_H=y
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_DEBUG_GPIO=y
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_MAX730X=y

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_74XX_MMIO=y
CONFIG_GPIO_ALTERA=y
# CONFIG_GPIO_ASPEED is not set
# CONFIG_GPIO_ASPEED_SGPIO is not set
# CONFIG_GPIO_ATH79 is not set
# CONFIG_GPIO_RASPBERRYPI_EXP is not set
# CONFIG_GPIO_BCM_KONA is not set
# CONFIG_GPIO_BCM_XGS_IPROC is not set
# CONFIG_GPIO_BRCMSTB is not set
CONFIG_GPIO_CADENCE=y
# CONFIG_GPIO_CLPS711X is not set
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EIC_SPRD is not set
# CONFIG_GPIO_EM is not set
CONFIG_GPIO_FTGPIO010=y
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_GRGPIO=y
# CONFIG_GPIO_HISI is not set
CONFIG_GPIO_HLWD=y
# CONFIG_GPIO_IOP is not set
CONFIG_GPIO_LOGICVC=y
# CONFIG_GPIO_LPC18XX is not set
# CONFIG_GPIO_LPC32XX is not set
CONFIG_GPIO_MB86S7X=y
CONFIG_GPIO_MENZ127=y
# CONFIG_GPIO_MPC8XXX is not set
# CONFIG_GPIO_MT7621 is not set
# CONFIG_GPIO_MXC is not set
# CONFIG_GPIO_MXS is not set
# CONFIG_GPIO_OMAP is not set
CONFIG_GPIO_PL061=y
# CONFIG_GPIO_PMIC_EIC_SPRD is not set
# CONFIG_GPIO_PXA is not set
# CONFIG_GPIO_RCAR is not set
# CONFIG_GPIO_RDA is not set
# CONFIG_GPIO_ROCKCHIP is not set
CONFIG_GPIO_SAMA5D2_PIOBU=y
# CONFIG_GPIO_SIFIVE is not set
CONFIG_GPIO_SIOX=y
# CONFIG_GPIO_SNPS_CREG is not set
# CONFIG_GPIO_SPRD is not set
# CONFIG_GPIO_STP_XWAY is not set
CONFIG_GPIO_SYSCON=y
# CONFIG_GPIO_TEGRA is not set
# CONFIG_GPIO_TEGRA186 is not set
# CONFIG_GPIO_TS4800 is not set
# CONFIG_GPIO_UNIPHIER is not set
# CONFIG_GPIO_VISCONTI is not set
# CONFIG_GPIO_XGENE_SB is not set
# CONFIG_GPIO_XILINX is not set
# CONFIG_GPIO_XLP is not set
CONFIG_GPIO_ZEVIO=y
CONFIG_GPIO_AMD_FCH=y
# CONFIG_GPIO_IDT3243X is not set
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_ADNP=y
# CONFIG_GPIO_GW_PLD is not set
CONFIG_GPIO_MAX7300=y
CONFIG_GPIO_MAX732X=y
# CONFIG_GPIO_MAX732X_IRQ is not set
CONFIG_GPIO_PCA953X=y
CONFIG_GPIO_PCA953X_IRQ=y
# CONFIG_GPIO_PCA9570 is not set
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_TPIC2810 is not set
# CONFIG_GPIO_TS4900 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ARIZONA=y
CONFIG_GPIO_BD71815=y
# CONFIG_GPIO_BD71828 is not set
# CONFIG_GPIO_DA9052 is not set
CONFIG_GPIO_DA9055=y
CONFIG_HTC_EGPIO=y
# CONFIG_GPIO_LP3943 is not set
CONFIG_GPIO_LP873X=y
CONFIG_GPIO_LP87565=y
CONFIG_GPIO_MADERA=y
CONFIG_GPIO_MAX77620=y
CONFIG_GPIO_MAX77650=y
CONFIG_GPIO_RC5T583=y
# CONFIG_GPIO_SL28CPLD is not set
CONFIG_GPIO_STMPE=y
CONFIG_GPIO_TPS65218=y
# CONFIG_GPIO_TPS65910 is not set
# CONFIG_GPIO_UCB1400 is not set
CONFIG_GPIO_WM831X=y
# CONFIG_GPIO_WM8350 is not set
# CONFIG_GPIO_WM8994 is not set
# end of MFD GPIO expanders

#
# SPI GPIO expanders
#
# CONFIG_GPIO_74X164 is not set
CONFIG_GPIO_MAX3191X=y
# CONFIG_GPIO_MAX7301 is not set
CONFIG_GPIO_MC33880=y
CONFIG_GPIO_PISOSR=y
# CONFIG_GPIO_XRA1403 is not set
# end of SPI GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=y
CONFIG_GPIO_MOCKUP=y
CONFIG_GPIO_VIRTIO=y
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

CONFIG_W1=y

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_DS2482 is not set
# CONFIG_W1_MASTER_MXC is not set
# CONFIG_W1_MASTER_DS1WM is not set
CONFIG_W1_MASTER_GPIO=y
# CONFIG_W1_MASTER_SGI is not set
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
# CONFIG_W1_SLAVE_THERM is not set
CONFIG_W1_SLAVE_SMEM=y
CONFIG_W1_SLAVE_DS2405=y
CONFIG_W1_SLAVE_DS2408=y
CONFIG_W1_SLAVE_DS2408_READBACK=y
CONFIG_W1_SLAVE_DS2413=y
CONFIG_W1_SLAVE_DS2406=y
CONFIG_W1_SLAVE_DS2423=y
CONFIG_W1_SLAVE_DS2805=y
# CONFIG_W1_SLAVE_DS2430 is not set
CONFIG_W1_SLAVE_DS2431=y
CONFIG_W1_SLAVE_DS2433=y
# CONFIG_W1_SLAVE_DS2433_CRC is not set
CONFIG_W1_SLAVE_DS2438=y
CONFIG_W1_SLAVE_DS250X=y
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=y
# CONFIG_W1_SLAVE_DS28E17 is not set
# end of 1-wire Slaves

CONFIG_POWER_RESET=y
CONFIG_POWER_RESET_AT91_POWEROFF=y
CONFIG_POWER_RESET_AT91_RESET=y
# CONFIG_POWER_RESET_AT91_SAMA5D2_SHDWC is not set
# CONFIG_POWER_RESET_ATC260X is not set
# CONFIG_POWER_RESET_BRCMKONA is not set
CONFIG_POWER_RESET_BRCMSTB=y
# CONFIG_POWER_RESET_GEMINI_POWEROFF is not set
# CONFIG_POWER_RESET_GPIO is not set
CONFIG_POWER_RESET_GPIO_RESTART=y
# CONFIG_POWER_RESET_OCELOT_RESET is not set
# CONFIG_POWER_RESET_LTC2952 is not set
# CONFIG_POWER_RESET_RESTART is not set
# CONFIG_POWER_RESET_VERSATILE is not set
# CONFIG_POWER_RESET_VEXPRESS is not set
# CONFIG_POWER_RESET_KEYSTONE is not set
# CONFIG_POWER_RESET_SYSCON is not set
# CONFIG_POWER_RESET_SYSCON_POWEROFF is not set
# CONFIG_POWER_RESET_RMOBILE is not set
# CONFIG_SYSCON_REBOOT_MODE is not set
# CONFIG_POWER_RESET_SC27XX is not set
# CONFIG_NVMEM_REBOOT_MODE is not set
# CONFIG_POWER_SUPPLY is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
CONFIG_HWMON_DEBUG_CHIP=y

#
# Native drivers
#
CONFIG_SENSORS_AD7314=y
# CONFIG_SENSORS_AD7414 is not set
CONFIG_SENSORS_AD7418=y
CONFIG_SENSORS_ADM1025=y
CONFIG_SENSORS_ADM1026=y
CONFIG_SENSORS_ADM1029=y
# CONFIG_SENSORS_ADM1031 is not set
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=y
CONFIG_SENSORS_ADT7X10=y
CONFIG_SENSORS_ADT7310=y
CONFIG_SENSORS_ADT7410=y
# CONFIG_SENSORS_ADT7411 is not set
CONFIG_SENSORS_ADT7462=y
CONFIG_SENSORS_ADT7470=y
CONFIG_SENSORS_ADT7475=y
# CONFIG_SENSORS_AHT10 is not set
CONFIG_SENSORS_AS370=y
# CONFIG_SENSORS_ASC7621 is not set
CONFIG_SENSORS_AXI_FAN_CONTROL=y
# CONFIG_SENSORS_ASB100 is not set
CONFIG_SENSORS_ASPEED=y
# CONFIG_SENSORS_ATXP1 is not set
# CONFIG_SENSORS_BT1_PVT is not set
# CONFIG_SENSORS_DS620 is not set
CONFIG_SENSORS_DS1621=y
CONFIG_SENSORS_DA9052_ADC=y
CONFIG_SENSORS_DA9055=y
# CONFIG_SENSORS_SPARX5 is not set
CONFIG_SENSORS_F71805F=y
# CONFIG_SENSORS_F71882FG is not set
# CONFIG_SENSORS_F75375S is not set
CONFIG_SENSORS_GSC=y
CONFIG_SENSORS_MC13783_ADC=y
# CONFIG_SENSORS_FSCHMD is not set
CONFIG_SENSORS_FTSTEUTATES=y
# CONFIG_SENSORS_GL518SM is not set
CONFIG_SENSORS_GL520SM=y
# CONFIG_SENSORS_G760A is not set
CONFIG_SENSORS_G762=y
CONFIG_SENSORS_GPIO_FAN=y
CONFIG_SENSORS_HIH6130=y
CONFIG_SENSORS_IIO_HWMON=y
CONFIG_SENSORS_IT87=y
CONFIG_SENSORS_JC42=y
CONFIG_SENSORS_POWR1220=y
# CONFIG_SENSORS_LAN966X is not set
CONFIG_SENSORS_LINEAGE=y
CONFIG_SENSORS_LOCHNAGAR=y
CONFIG_SENSORS_LTC2945=y
CONFIG_SENSORS_LTC2947=y
CONFIG_SENSORS_LTC2947_I2C=y
CONFIG_SENSORS_LTC2947_SPI=y
# CONFIG_SENSORS_LTC2990 is not set
CONFIG_SENSORS_LTC2992=y
# CONFIG_SENSORS_LTC4151 is not set
# CONFIG_SENSORS_LTC4215 is not set
CONFIG_SENSORS_LTC4222=y
CONFIG_SENSORS_LTC4245=y
CONFIG_SENSORS_LTC4260=y
# CONFIG_SENSORS_LTC4261 is not set
# CONFIG_SENSORS_MAX1111 is not set
# CONFIG_SENSORS_MAX127 is not set
CONFIG_SENSORS_MAX16065=y
# CONFIG_SENSORS_MAX1619 is not set
CONFIG_SENSORS_MAX1668=y
# CONFIG_SENSORS_MAX197 is not set
CONFIG_SENSORS_MAX31722=y
CONFIG_SENSORS_MAX31730=y
# CONFIG_SENSORS_MAX31760 is not set
# CONFIG_SENSORS_MAX6620 is not set
CONFIG_SENSORS_MAX6621=y
CONFIG_SENSORS_MAX6639=y
CONFIG_SENSORS_MAX6650=y
CONFIG_SENSORS_MAX6697=y
CONFIG_SENSORS_MAX31790=y
CONFIG_SENSORS_MCP3021=y
CONFIG_SENSORS_MLXREG_FAN=y
CONFIG_SENSORS_TC654=y
# CONFIG_SENSORS_TPS23861 is not set
CONFIG_SENSORS_MR75203=y
CONFIG_SENSORS_ADCXX=y
CONFIG_SENSORS_LM63=y
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=y
# CONFIG_SENSORS_LM75 is not set
CONFIG_SENSORS_LM77=y
CONFIG_SENSORS_LM78=y
# CONFIG_SENSORS_LM80 is not set
CONFIG_SENSORS_LM83=y
CONFIG_SENSORS_LM85=y
# CONFIG_SENSORS_LM87 is not set
CONFIG_SENSORS_LM90=y
CONFIG_SENSORS_LM92=y
CONFIG_SENSORS_LM93=y
CONFIG_SENSORS_LM95234=y
# CONFIG_SENSORS_LM95241 is not set
CONFIG_SENSORS_LM95245=y
CONFIG_SENSORS_PC87360=y
CONFIG_SENSORS_PC87427=y
# CONFIG_SENSORS_NTC_THERMISTOR is not set
CONFIG_SENSORS_NCT6683=y
# CONFIG_SENSORS_NCT6775 is not set
# CONFIG_SENSORS_NCT6775_I2C is not set
# CONFIG_SENSORS_NCT7802 is not set
CONFIG_SENSORS_NCT7904=y
CONFIG_SENSORS_NPCM7XX=y
# CONFIG_SENSORS_NSA320 is not set
CONFIG_SENSORS_OCC_P8_I2C=y
CONFIG_SENSORS_OCC=y
# CONFIG_SENSORS_PCF8591 is not set
# CONFIG_PMBUS is not set
# CONFIG_SENSORS_PWM_FAN is not set
# CONFIG_SENSORS_RASPBERRYPI_HWMON is not set
# CONFIG_SENSORS_SL28CPLD is not set
CONFIG_SENSORS_SBTSI=y
CONFIG_SENSORS_SBRMI=y
CONFIG_SENSORS_SHT15=y
# CONFIG_SENSORS_SHT21 is not set
CONFIG_SENSORS_SHT3x=y
# CONFIG_SENSORS_SHT4x is not set
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_DME1737=y
CONFIG_SENSORS_EMC1403=y
CONFIG_SENSORS_EMC2103=y
# CONFIG_SENSORS_EMC2305 is not set
CONFIG_SENSORS_EMC6W201=y
CONFIG_SENSORS_SMSC47M1=y
CONFIG_SENSORS_SMSC47M192=y
# CONFIG_SENSORS_SMSC47B397 is not set
CONFIG_SENSORS_SCH56XX_COMMON=y
CONFIG_SENSORS_SCH5627=y
# CONFIG_SENSORS_SCH5636 is not set
CONFIG_SENSORS_STTS751=y
# CONFIG_SENSORS_SMM665 is not set
CONFIG_SENSORS_ADC128D818=y
CONFIG_SENSORS_ADS7828=y
CONFIG_SENSORS_ADS7871=y
# CONFIG_SENSORS_AMC6821 is not set
CONFIG_SENSORS_INA209=y
CONFIG_SENSORS_INA2XX=y
# CONFIG_SENSORS_INA238 is not set
CONFIG_SENSORS_INA3221=y
# CONFIG_SENSORS_TC74 is not set
# CONFIG_SENSORS_THMC50 is not set
CONFIG_SENSORS_TMP102=y
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=y
CONFIG_SENSORS_TMP421=y
# CONFIG_SENSORS_TMP464 is not set
CONFIG_SENSORS_TMP513=y
CONFIG_SENSORS_VEXPRESS=y
# CONFIG_SENSORS_VT1211 is not set
CONFIG_SENSORS_W83773G=y
CONFIG_SENSORS_W83781D=y
# CONFIG_SENSORS_W83791D is not set
CONFIG_SENSORS_W83792D=y
CONFIG_SENSORS_W83793=y
CONFIG_SENSORS_W83795=y
CONFIG_SENSORS_W83795_FANCTRL=y
CONFIG_SENSORS_W83L785TS=y
# CONFIG_SENSORS_W83L786NG is not set
# CONFIG_SENSORS_W83627HF is not set
CONFIG_SENSORS_W83627EHF=y
# CONFIG_SENSORS_WM831X is not set
CONFIG_SENSORS_WM8350=y
CONFIG_SENSORS_INTEL_M10_BMC_HWMON=y
# CONFIG_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
CONFIG_WATCHDOG_NOWAYOUT=y
# CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y
CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT=y

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
# CONFIG_SOFT_WATCHDOG is not set
# CONFIG_DA9052_WATCHDOG is not set
CONFIG_DA9055_WATCHDOG=y
# CONFIG_DA9063_WATCHDOG is not set
CONFIG_DA9062_WATCHDOG=y
CONFIG_GPIO_WATCHDOG=y
CONFIG_GPIO_WATCHDOG_ARCH_INITCALL=y
# CONFIG_MENF21BMC_WATCHDOG is not set
# CONFIG_MENZ069_WATCHDOG is not set
CONFIG_WM831X_WATCHDOG=y
CONFIG_WM8350_WATCHDOG=y
CONFIG_XILINX_WATCHDOG=y
# CONFIG_ZIIRAVE_WATCHDOG is not set
CONFIG_MLX_WDT=y
# CONFIG_SL28CPLD_WATCHDOG is not set
CONFIG_ARM_SP805_WATCHDOG=y
# CONFIG_ARMADA_37XX_WATCHDOG is not set
# CONFIG_ASM9260_WATCHDOG is not set
# CONFIG_AT91RM9200_WATCHDOG is not set
CONFIG_AT91SAM9X_WATCHDOG=y
CONFIG_SAMA5D4_WATCHDOG=y
CONFIG_CADENCE_WATCHDOG=y
# CONFIG_977_WATCHDOG is not set
# CONFIG_FTWDT010_WATCHDOG is not set
# CONFIG_S3C2410_WATCHDOG is not set
# CONFIG_DW_WATCHDOG is not set
# CONFIG_EP93XX_WATCHDOG is not set
# CONFIG_OMAP_WATCHDOG is not set
# CONFIG_PNX4008_WATCHDOG is not set
# CONFIG_DAVINCI_WATCHDOG is not set
# CONFIG_K3_RTI_WATCHDOG is not set
# CONFIG_ORION_WATCHDOG is not set
CONFIG_RN5T618_WATCHDOG=y
# CONFIG_SUNXI_WATCHDOG is not set
# CONFIG_NPCM7XX_WATCHDOG is not set
# CONFIG_STMP3XXX_RTC_WATCHDOG is not set
# CONFIG_TS4800_WATCHDOG is not set
# CONFIG_TS72XX_WATCHDOG is not set
CONFIG_MAX63XX_WATCHDOG=y
CONFIG_MAX77620_WATCHDOG=y
# CONFIG_IMX2_WDT is not set
# CONFIG_IMX7ULP_WDT is not set
CONFIG_RETU_WATCHDOG=y
# CONFIG_MOXART_WDT is not set
# CONFIG_ST_LPC_WATCHDOG is not set
# CONFIG_TEGRA_WATCHDOG is not set
# CONFIG_QCOM_WDT is not set
# CONFIG_MESON_GXBB_WATCHDOG is not set
# CONFIG_MESON_WATCHDOG is not set
# CONFIG_MEDIATEK_WATCHDOG is not set
# CONFIG_DIGICOLOR_WATCHDOG is not set
# CONFIG_LPC18XX_WATCHDOG is not set
# CONFIG_RENESAS_WDT is not set
# CONFIG_RENESAS_RZAWDT is not set
# CONFIG_RENESAS_RZN1WDT is not set
# CONFIG_RENESAS_RZG2LWDT is not set
# CONFIG_ASPEED_WATCHDOG is not set
CONFIG_STM32_WATCHDOG=y
CONFIG_STPMIC1_WATCHDOG=y
# CONFIG_UNIPHIER_WATCHDOG is not set
# CONFIG_RTD119X_WATCHDOG is not set
# CONFIG_REALTEK_OTTO_WDT is not set
# CONFIG_SPRD_WATCHDOG is not set
# CONFIG_VISCONTI_WATCHDOG is not set
# CONFIG_MSC313E_WATCHDOG is not set
# CONFIG_APPLE_WATCHDOG is not set
# CONFIG_SUNPLUS_WATCHDOG is not set
# CONFIG_SC520_WDT is not set
# CONFIG_ATH79_WDT is not set
# CONFIG_BCM47XX_WDT is not set
# CONFIG_BCM2835_WDT is not set
# CONFIG_BCM_KONA_WDT is not set
# CONFIG_BCM7038_WDT is not set
# CONFIG_IMGPDC_WDT is not set
# CONFIG_MPC5200_WDT is not set
CONFIG_MEN_A21_WDT=y
# CONFIG_UML_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_SDIOHOST_POSSIBLE=y
# CONFIG_SSB_SDIOHOST is not set
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
# CONFIG_BCMA_HOST_SOC is not set
# CONFIG_BCMA_DRIVER_MIPS is not set
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_ACT8945A is not set
# CONFIG_MFD_SUN4I_GPADC is not set
# CONFIG_MFD_AS3711 is not set
# CONFIG_MFD_AS3722 is not set
# CONFIG_PMIC_ADP5520 is not set
CONFIG_MFD_AAT2870_CORE=y
# CONFIG_MFD_AT91_USART is not set
CONFIG_MFD_ATMEL_FLEXCOM=y
# CONFIG_MFD_ATMEL_HLCDC is not set
CONFIG_MFD_BCM590XX=y
# CONFIG_MFD_BD9571MWV is not set
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
CONFIG_MFD_CROS_EC_DEV=y
CONFIG_MFD_MADERA=y
# CONFIG_MFD_MADERA_I2C is not set
CONFIG_MFD_MADERA_SPI=y
CONFIG_MFD_CS47L15=y
CONFIG_MFD_CS47L35=y
# CONFIG_MFD_CS47L85 is not set
CONFIG_MFD_CS47L90=y
CONFIG_MFD_CS47L92=y
CONFIG_MFD_ASIC3=y
# CONFIG_PMIC_DA903X is not set
CONFIG_PMIC_DA9052=y
# CONFIG_MFD_DA9052_SPI is not set
CONFIG_MFD_DA9052_I2C=y
CONFIG_MFD_DA9055=y
CONFIG_MFD_DA9062=y
# CONFIG_MFD_DA9063 is not set
CONFIG_MFD_DA9150=y
# CONFIG_MFD_ENE_KB3930 is not set
# CONFIG_MFD_EXYNOS_LPASS is not set
CONFIG_MFD_GATEWORKS_GSC=y
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_SPI=y
CONFIG_MFD_MC13XXX_I2C=y
CONFIG_MFD_MP2629=y
# CONFIG_MFD_MXS_LRADC is not set
# CONFIG_MFD_MX25_TSADC is not set
CONFIG_MFD_HI6421_PMIC=y
# CONFIG_MFD_HI655X_PMIC is not set
CONFIG_HTC_PASIC3=y
CONFIG_HTC_I2CPLD=y
# CONFIG_INTEL_SOC_PMIC is not set
CONFIG_MFD_IQS62X=y
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
CONFIG_MFD_88PM805=y
CONFIG_MFD_88PM860X=y
# CONFIG_MFD_MAX14577 is not set
CONFIG_MFD_MAX77620=y
CONFIG_MFD_MAX77650=y
# CONFIG_MFD_MAX77686 is not set
CONFIG_MFD_MAX77693=y
# CONFIG_MFD_MAX77714 is not set
CONFIG_MFD_MAX77843=y
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
CONFIG_MFD_MAX8997=y
CONFIG_MFD_MAX8998=y
CONFIG_MFD_MT6360=y
# CONFIG_MFD_MT6370 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_MFD_OCELOT is not set
CONFIG_EZX_PCAP=y
# CONFIG_MFD_CPCAP is not set
CONFIG_MFD_NTXEC=y
CONFIG_MFD_RETU=y
# CONFIG_MFD_PCF50633 is not set
CONFIG_UCB1400_CORE=y
CONFIG_MFD_PM8XXX=y
# CONFIG_MFD_SY7636A is not set
CONFIG_MFD_RT4831=y
CONFIG_MFD_RT5033=y
# CONFIG_MFD_RT5120 is not set
CONFIG_MFD_RC5T583=y
CONFIG_MFD_RK808=y
CONFIG_MFD_RN5T618=y
CONFIG_MFD_SEC_CORE=y
CONFIG_MFD_SI476X_CORE=y
# CONFIG_MFD_SL28CPLD is not set
CONFIG_MFD_SM501=y
CONFIG_MFD_SM501_GPIO=y
CONFIG_MFD_SKY81452=y
# CONFIG_MFD_SC27XX_PMIC is not set
# CONFIG_ABX500_CORE is not set
CONFIG_MFD_STMPE=y

#
# STMicroelectronics STMPE Interface Drivers
#
# CONFIG_STMPE_I2C is not set
# CONFIG_STMPE_SPI is not set
# end of STMicroelectronics STMPE Interface Drivers

# CONFIG_MFD_SUN6I_PRCM is not set
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
CONFIG_MFD_LP3943=y
# CONFIG_MFD_LP8788 is not set
CONFIG_MFD_TI_LMU=y
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
CONFIG_TPS65010=y
# CONFIG_TPS6507X is not set
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TPS65217 is not set
CONFIG_MFD_TI_LP873X=y
CONFIG_MFD_TI_LP87565=y
CONFIG_MFD_TPS65218=y
# CONFIG_MFD_TPS6586X is not set
CONFIG_MFD_TPS65910=y
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS65912_SPI is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
CONFIG_MFD_WL1273_CORE=y
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TC3589X is not set
CONFIG_MFD_TMIO=y
CONFIG_MFD_T7L66XB=y
# CONFIG_MFD_TC6387XB is not set
CONFIG_MFD_TC6393XB=y
CONFIG_MFD_TQMX86=y
CONFIG_MFD_LOCHNAGAR=y
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
# CONFIG_MFD_ARIZONA_SPI is not set
# CONFIG_MFD_CS47L24 is not set
# CONFIG_MFD_WM5102 is not set
CONFIG_MFD_WM5110=y
# CONFIG_MFD_WM8997 is not set
CONFIG_MFD_WM8998=y
# CONFIG_MFD_WM8400 is not set
CONFIG_MFD_WM831X=y
# CONFIG_MFD_WM831X_I2C is not set
CONFIG_MFD_WM831X_SPI=y
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
CONFIG_MFD_WM8994=y
# CONFIG_MFD_STW481X is not set
CONFIG_MFD_ROHM_BD718XX=y
CONFIG_MFD_ROHM_BD71828=y
# CONFIG_MFD_ROHM_BD957XMUF is not set
CONFIG_MFD_STM32_LPTIMER=y
CONFIG_MFD_STM32_TIMERS=y
CONFIG_MFD_STPMIC1=y
CONFIG_MFD_STMFX=y
# CONFIG_MFD_WCD934X is not set
CONFIG_MFD_ATC260X=y
CONFIG_MFD_ATC260X_I2C=y
# CONFIG_MFD_KHADAS_MCU is not set
# CONFIG_MFD_ACER_A500_EC is not set
CONFIG_MFD_QCOM_PM8008=y
# CONFIG_MFD_VEXPRESS_SYSREG is not set
# CONFIG_RAVE_SP_CORE is not set
CONFIG_MFD_INTEL_M10_BMC=y
CONFIG_MFD_RSMU_I2C=y
CONFIG_MFD_RSMU_SPI=y
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
# CONFIG_TEGRA_HOST1X is not set
# CONFIG_IMX_IPUV3_CORE is not set
# CONFIG_DRM is not set
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set

#
# ARM devices
#
# end of ARM devices

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
CONFIG_FB_FOREIGN_ENDIAN=y
CONFIG_FB_BOTH_ENDIAN=y
# CONFIG_FB_BIG_ENDIAN is not set
# CONFIG_FB_LITTLE_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
# CONFIG_FB_TILEBLITTING is not set

#
# Frame buffer hardware drivers
#
CONFIG_FB_ARMCLCD=y
# CONFIG_FB_CLPS711X is not set
# CONFIG_FB_IMX is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_CONTROL is not set
# CONFIG_FB_GBE is not set
# CONFIG_FB_PVR2 is not set
CONFIG_FB_OPENCORES=y
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_ATMEL is not set
# CONFIG_FB_WM8505 is not set
# CONFIG_FB_PXA168 is not set
# CONFIG_FB_W100 is not set
# CONFIG_FB_SH_MOBILE_LCDC is not set
# CONFIG_FB_TMIO is not set
# CONFIG_FB_S3C is not set
# CONFIG_FB_SM501 is not set
CONFIG_FB_IBM_GXT4500=y
# CONFIG_FB_GOLDFISH is not set
# CONFIG_FB_DA8XX is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_BROADSHEET is not set
# CONFIG_FB_SIMPLE is not set
CONFIG_FB_SSD1307=y
# CONFIG_FB_OMAP is not set
CONFIG_FB_OMAP_LCD_H3=y
# CONFIG_FB_OMAP2 is not set
# CONFIG_MMP_DISP is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=y
CONFIG_LCD_L4F00242T03=y
CONFIG_LCD_LMS283GF05=y
# CONFIG_LCD_LTV350QV is not set
# CONFIG_LCD_ILI922X is not set
CONFIG_LCD_ILI9320=y
CONFIG_LCD_TDO24M=y
CONFIG_LCD_VGG2432A4=y
# CONFIG_LCD_PLATFORM is not set
CONFIG_LCD_AMS369FG06=y
CONFIG_LCD_LMS501KF03=y
# CONFIG_LCD_HX8357 is not set
CONFIG_LCD_OTM3225A=y
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_KTD253=y
# CONFIG_BACKLIGHT_OMAP1 is not set
# CONFIG_BACKLIGHT_PWM is not set
CONFIG_BACKLIGHT_DA9052=y
CONFIG_BACKLIGHT_QCOM_WLED=y
CONFIG_BACKLIGHT_RT4831=y
CONFIG_BACKLIGHT_WM831X=y
CONFIG_BACKLIGHT_ADP8860=y
CONFIG_BACKLIGHT_ADP8870=y
# CONFIG_BACKLIGHT_88PM860X is not set
# CONFIG_BACKLIGHT_AAT2870 is not set
# CONFIG_BACKLIGHT_LM3630A is not set
CONFIG_BACKLIGHT_LM3639=y
CONFIG_BACKLIGHT_LP855X=y
CONFIG_BACKLIGHT_SKY81452=y
CONFIG_BACKLIGHT_GPIO=y
CONFIG_BACKLIGHT_LV5207LP=y
CONFIG_BACKLIGHT_BD6107=y
CONFIG_BACKLIGHT_ARCXCNN=y
CONFIG_BACKLIGHT_LED=y
# end of Backlight & LCD device support

CONFIG_VIDEOMODE_HELPERS=y
# CONFIG_LOGO is not set
# end of Graphics support

CONFIG_SOUND=y
CONFIG_SND=y
CONFIG_SND_TIMER=y
CONFIG_SND_PCM=y
CONFIG_SND_PCM_IEC958=y
CONFIG_SND_DMAENGINE_PCM=y
CONFIG_SND_RAWMIDI=y
CONFIG_SND_COMPRESS_OFFLOAD=y
CONFIG_SND_JACK=y
# CONFIG_SND_OSSEMUL is not set
CONFIG_SND_PCM_TIMER=y
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
# CONFIG_SND_SUPPORT_OLD_API is not set
CONFIG_SND_PROC_FS=y
CONFIG_SND_VERBOSE_PROCFS=y
CONFIG_SND_VERBOSE_PRINTK=y
CONFIG_SND_CTL_FAST_LOOKUP=y
# CONFIG_SND_DEBUG is not set
# CONFIG_SND_CTL_INPUT_VALIDATION is not set
CONFIG_SND_VMASTER=y
# CONFIG_SND_SEQUENCER is not set
CONFIG_SND_MPU401_UART=y
CONFIG_SND_AC97_CODEC=y
CONFIG_SND_DRIVERS=y
# CONFIG_SND_DUMMY is not set
# CONFIG_SND_ALOOP is not set
# CONFIG_SND_MTPAV is not set
CONFIG_SND_MTS64=y
CONFIG_SND_SERIAL_U16550=y
# CONFIG_SND_SERIAL_GENERIC is not set
CONFIG_SND_MPU401=y
CONFIG_SND_PORTMAN2X4=y
CONFIG_SND_AC97_POWER_SAVE=y
CONFIG_SND_AC97_POWER_SAVE_DEFAULT=0

#
# HD-Audio
#
# end of HD-Audio

CONFIG_SND_HDA_PREALLOC_SIZE=64
# CONFIG_SND_ARM is not set

#
# Atmel devices (AT91)
#
# CONFIG_SND_ATMEL_AC97C is not set
# end of Atmel devices (AT91)

CONFIG_SND_SPI=y
CONFIG_SND_AT73C213=y
CONFIG_SND_AT73C213_TARGET_BITRATE=48000
CONFIG_SND_SOC=y
CONFIG_SND_SOC_AC97_BUS=y
CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=y
CONFIG_SND_SOC_COMPRESS=y
CONFIG_SND_SOC_UTILS_KUNIT_TEST=y
# CONFIG_SND_SOC_ADI is not set
CONFIG_SND_SOC_AMD_ACP=y
# CONFIG_SND_SOC_AMD_CZ_RT5645_MACH is not set
CONFIG_SND_AMD_ACP_CONFIG=y
# CONFIG_SND_SOC_APPLE_MCA is not set
CONFIG_SND_ATMEL_SOC=y
CONFIG_SND_ATMEL_SOC_PDC=y
CONFIG_SND_ATMEL_SOC_DMA=y
CONFIG_SND_ATMEL_SOC_SSC=y
CONFIG_SND_ATMEL_SOC_SSC_PDC=y
CONFIG_SND_ATMEL_SOC_SSC_DMA=y
CONFIG_SND_AT91_SOC_SAM9G20_WM8731=y
# CONFIG_SND_ATMEL_SOC_WM8904 is not set
# CONFIG_SND_AT91_SOC_SAM9X5_WM8731 is not set
CONFIG_SND_ATMEL_SOC_CLASSD=y
CONFIG_SND_ATMEL_SOC_PDMIC=y
CONFIG_SND_ATMEL_SOC_TSE850_PCM5142=y
CONFIG_SND_ATMEL_SOC_I2S=y
CONFIG_SND_SOC_MIKROE_PROTO=y
# CONFIG_SND_MCHP_SOC_I2S_MCC is not set
CONFIG_SND_MCHP_SOC_SPDIFTX=y
CONFIG_SND_MCHP_SOC_SPDIFRX=y
# CONFIG_SND_MCHP_SOC_PDMC is not set
# CONFIG_SND_BCM2835_SOC_I2S is not set
# CONFIG_SND_SOC_CYGNUS is not set
CONFIG_SND_BCM63XX_I2S_WHISTLER=y
# CONFIG_SND_EP93XX_SOC is not set
CONFIG_SND_DESIGNWARE_I2S=y
# CONFIG_SND_DESIGNWARE_PCM is not set

#
# SoC Audio for Freescale CPUs
#

#
# Common SoC Audio options for Freescale CPUs:
#
CONFIG_SND_SOC_FSL_ASRC=y
CONFIG_SND_SOC_FSL_SAI=y
CONFIG_SND_SOC_FSL_MQS=y
CONFIG_SND_SOC_FSL_AUDMIX=y
# CONFIG_SND_SOC_FSL_SSI is not set
# CONFIG_SND_SOC_FSL_SPDIF is not set
# CONFIG_SND_SOC_FSL_ESAI is not set
CONFIG_SND_SOC_FSL_MICFIL=y
# CONFIG_SND_SOC_FSL_EASRC is not set
CONFIG_SND_SOC_FSL_XCVR=y
# CONFIG_SND_SOC_FSL_AUD2HTX is not set
CONFIG_SND_SOC_FSL_UTILS=y
CONFIG_SND_SOC_FSL_RPMSG=y
CONFIG_SND_SOC_IMX_AUDMUX=y
# CONFIG_SND_IMX_SOC is not set
# end of SoC Audio for Freescale CPUs

# CONFIG_SND_I2S_HI6210_I2S is not set
# CONFIG_SND_JZ4740_SOC_I2S is not set
# CONFIG_SND_KIRKWOOD_SOC is not set
CONFIG_SND_SOC_IMG=y
CONFIG_SND_SOC_IMG_I2S_IN=y
CONFIG_SND_SOC_IMG_I2S_OUT=y
CONFIG_SND_SOC_IMG_PARALLEL_OUT=y
CONFIG_SND_SOC_IMG_SPDIF_IN=y
CONFIG_SND_SOC_IMG_SPDIF_OUT=y
# CONFIG_SND_SOC_IMG_PISTACHIO_INTERNAL_DAC is not set
CONFIG_SND_SOC_INTEL_SST_TOPLEVEL=y
# CONFIG_SND_SOC_INTEL_KEEMBAY is not set
CONFIG_SND_SOC_INTEL_MACH=y
# CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES is not set
# CONFIG_SND_SOC_MT8186 is not set
# CONFIG_SND_SOC_MTK_BTCVSD is not set
# CONFIG_SND_SOC_MT8195 is not set

#
# ASoC support for Amlogic platforms
#
# CONFIG_SND_MESON_AIU is not set
# CONFIG_SND_MESON_AXG_FRDDR is not set
# CONFIG_SND_MESON_AXG_TODDR is not set
# CONFIG_SND_MESON_AXG_TDMIN is not set
# CONFIG_SND_MESON_AXG_TDMOUT is not set
# CONFIG_SND_MESON_AXG_SOUND_CARD is not set
# CONFIG_SND_MESON_AXG_SPDIFOUT is not set
# CONFIG_SND_MESON_AXG_SPDIFIN is not set
# CONFIG_SND_MESON_AXG_PDM is not set
# CONFIG_SND_MESON_GX_SOUND_CARD is not set
# CONFIG_SND_MESON_G12A_TOACODEC is not set
# CONFIG_SND_MESON_G12A_TOHDMITX is not set
# CONFIG_SND_SOC_MESON_T9015 is not set
# end of ASoC support for Amlogic platforms

# CONFIG_SND_MXS_SOC is not set
# CONFIG_SND_PXA2XX_SOC is not set
# CONFIG_SND_SOC_QCOM is not set
# CONFIG_SND_SOC_ROCKCHIP is not set
# CONFIG_SND_SOC_SAMSUNG is not set

#
# SoC Audio support for Renesas SoCs
#
# CONFIG_SND_SOC_SH4_FSI is not set
# CONFIG_SND_SOC_RCAR is not set
# CONFIG_SND_SOC_RZ is not set
# end of SoC Audio support for Renesas SoCs

# CONFIG_SND_SOC_SOF_TOPLEVEL is not set
# CONFIG_SND_SOC_SPRD is not set
# CONFIG_SND_SOC_STI is not set

#
# STMicroelectronics STM32 SOC audio support
#
CONFIG_SND_SOC_STM32_SAI=y
CONFIG_SND_SOC_STM32_I2S=y
CONFIG_SND_SOC_STM32_SPDIFRX=y
# CONFIG_SND_SOC_STM32_DFSDM is not set
# end of STMicroelectronics STM32 SOC audio support

#
# Allwinner SoC Audio support
#
# CONFIG_SND_SUN4I_CODEC is not set
# CONFIG_SND_SUN8I_CODEC is not set
# CONFIG_SND_SUN8I_CODEC_ANALOG is not set
# CONFIG_SND_SUN50I_CODEC_ANALOG is not set
# CONFIG_SND_SUN4I_I2S is not set
# CONFIG_SND_SUN4I_SPDIF is not set
# CONFIG_SND_SUN50I_DMIC is not set
# end of Allwinner SoC Audio support

# CONFIG_SND_SOC_TEGRA is not set

#
# Audio support for Texas Instruments SoCs
#

#
# Texas Instruments DAI support for:
#
# CONFIG_SND_SOC_DAVINCI_ASP is not set
# CONFIG_SND_SOC_DAVINCI_MCASP is not set
# CONFIG_SND_SOC_DAVINCI_VCIF is not set
# CONFIG_SND_SOC_OMAP_DMIC is not set
# CONFIG_SND_SOC_OMAP_MCBSP is not set
# CONFIG_SND_SOC_OMAP_MCPDM is not set

#
# Audio support for boards with Texas Instruments SoCs
#
# CONFIG_SND_SOC_OMAP_HDMI is not set
# CONFIG_SND_SOC_J721E_EVM is not set
# end of Audio support for Texas Instruments SoCs

# CONFIG_SND_SOC_UNIPHIER is not set
CONFIG_SND_SOC_XILINX_I2S=y
CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER=y
CONFIG_SND_SOC_XILINX_SPDIF=y
# CONFIG_SND_SOC_XTFPGA_I2S is not set
CONFIG_SND_SOC_I2C_AND_SPI=y

#
# CODEC drivers
#
# CONFIG_SND_SOC_ALL_CODECS is not set
CONFIG_SND_SOC_WM_ADSP=y
CONFIG_SND_SOC_AC97_CODEC=y
CONFIG_SND_SOC_ADAU_UTILS=y
CONFIG_SND_SOC_ADAU1372=y
CONFIG_SND_SOC_ADAU1372_I2C=y
# CONFIG_SND_SOC_ADAU1372_SPI is not set
CONFIG_SND_SOC_ADAU1701=y
CONFIG_SND_SOC_ADAU17X1=y
CONFIG_SND_SOC_ADAU1761=y
CONFIG_SND_SOC_ADAU1761_I2C=y
CONFIG_SND_SOC_ADAU1761_SPI=y
CONFIG_SND_SOC_ADAU7002=y
CONFIG_SND_SOC_ADAU7118=y
# CONFIG_SND_SOC_ADAU7118_HW is not set
CONFIG_SND_SOC_ADAU7118_I2C=y
CONFIG_SND_SOC_AK4104=y
# CONFIG_SND_SOC_AK4118 is not set
CONFIG_SND_SOC_AK4375=y
CONFIG_SND_SOC_AK4458=y
CONFIG_SND_SOC_AK4554=y
CONFIG_SND_SOC_AK4613=y
# CONFIG_SND_SOC_AK4642 is not set
CONFIG_SND_SOC_AK5386=y
CONFIG_SND_SOC_AK5558=y
CONFIG_SND_SOC_ALC5623=y
# CONFIG_SND_SOC_AW8738 is not set
# CONFIG_SND_SOC_BD28623 is not set
CONFIG_SND_SOC_BT_SCO=y
# CONFIG_SND_SOC_CPCAP is not set
# CONFIG_SND_SOC_CROS_EC_CODEC is not set
# CONFIG_SND_SOC_CS35L32 is not set
# CONFIG_SND_SOC_CS35L33 is not set
CONFIG_SND_SOC_CS35L34=y
# CONFIG_SND_SOC_CS35L35 is not set
CONFIG_SND_SOC_CS35L36=y
CONFIG_SND_SOC_CS35L41_LIB=y
CONFIG_SND_SOC_CS35L41=y
# CONFIG_SND_SOC_CS35L41_SPI is not set
CONFIG_SND_SOC_CS35L41_I2C=y
CONFIG_SND_SOC_CS35L45_TABLES=y
CONFIG_SND_SOC_CS35L45=y
CONFIG_SND_SOC_CS35L45_SPI=y
# CONFIG_SND_SOC_CS35L45_I2C is not set
CONFIG_SND_SOC_CS42L42_CORE=y
CONFIG_SND_SOC_CS42L42=y
CONFIG_SND_SOC_CS42L51=y
CONFIG_SND_SOC_CS42L51_I2C=y
CONFIG_SND_SOC_CS42L73=y
# CONFIG_SND_SOC_CS42L83 is not set
# CONFIG_SND_SOC_CS4234 is not set
# CONFIG_SND_SOC_CS4265 is not set
# CONFIG_SND_SOC_CS4270 is not set
CONFIG_SND_SOC_CS4271=y
CONFIG_SND_SOC_CS4271_I2C=y
# CONFIG_SND_SOC_CS4271_SPI is not set
CONFIG_SND_SOC_CS42XX8=y
CONFIG_SND_SOC_CS42XX8_I2C=y
CONFIG_SND_SOC_CS43130=y
# CONFIG_SND_SOC_CS4341 is not set
CONFIG_SND_SOC_CS4349=y
CONFIG_SND_SOC_CS53L30=y
# CONFIG_SND_SOC_CX2072X is not set
# CONFIG_SND_SOC_JZ4740_CODEC is not set
# CONFIG_SND_SOC_JZ4725B_CODEC is not set
# CONFIG_SND_SOC_JZ4760_CODEC is not set
# CONFIG_SND_SOC_JZ4770_CODEC is not set
# CONFIG_SND_SOC_DA7213 is not set
CONFIG_SND_SOC_DMIC=y
# CONFIG_SND_SOC_ES7134 is not set
CONFIG_SND_SOC_ES7241=y
CONFIG_SND_SOC_ES8316=y
# CONFIG_SND_SOC_ES8326 is not set
CONFIG_SND_SOC_ES8328=y
CONFIG_SND_SOC_ES8328_I2C=y
CONFIG_SND_SOC_ES8328_SPI=y
CONFIG_SND_SOC_GTM601=y
# CONFIG_SND_SOC_HDA is not set
CONFIG_SND_SOC_ICS43432=y
CONFIG_SND_SOC_INNO_RK3036=y
CONFIG_SND_SOC_LOCHNAGAR_SC=y
CONFIG_SND_SOC_MAX98088=y
CONFIG_SND_SOC_MAX98357A=y
CONFIG_SND_SOC_MAX98504=y
CONFIG_SND_SOC_MAX9867=y
# CONFIG_SND_SOC_MAX98927 is not set
# CONFIG_SND_SOC_MAX98520 is not set
CONFIG_SND_SOC_MAX98373=y
CONFIG_SND_SOC_MAX98373_I2C=y
# CONFIG_SND_SOC_MAX98373_SDW is not set
CONFIG_SND_SOC_MAX98390=y
CONFIG_SND_SOC_MAX98396=y
CONFIG_SND_SOC_MAX9860=y
# CONFIG_SND_SOC_MSM8916_WCD_ANALOG is not set
CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=y
CONFIG_SND_SOC_PCM1681=y
# CONFIG_SND_SOC_PCM1789_I2C is not set
CONFIG_SND_SOC_PCM179X=y
CONFIG_SND_SOC_PCM179X_I2C=y
# CONFIG_SND_SOC_PCM179X_SPI is not set
CONFIG_SND_SOC_PCM186X=y
CONFIG_SND_SOC_PCM186X_I2C=y
CONFIG_SND_SOC_PCM186X_SPI=y
CONFIG_SND_SOC_PCM3060=y
# CONFIG_SND_SOC_PCM3060_I2C is not set
CONFIG_SND_SOC_PCM3060_SPI=y
CONFIG_SND_SOC_PCM3168A=y
CONFIG_SND_SOC_PCM3168A_I2C=y
CONFIG_SND_SOC_PCM3168A_SPI=y
# CONFIG_SND_SOC_PCM5102A is not set
CONFIG_SND_SOC_PCM512x=y
CONFIG_SND_SOC_PCM512x_I2C=y
# CONFIG_SND_SOC_PCM512x_SPI is not set
CONFIG_SND_SOC_RK3328=y
# CONFIG_SND_SOC_RK817 is not set
CONFIG_SND_SOC_RL6231=y
CONFIG_SND_SOC_RT1308_SDW=y
CONFIG_SND_SOC_RT1316_SDW=y
# CONFIG_SND_SOC_RT5616 is not set
CONFIG_SND_SOC_RT5631=y
CONFIG_SND_SOC_RT5640=y
CONFIG_SND_SOC_RT5659=y
CONFIG_SND_SOC_RT5682=y
CONFIG_SND_SOC_RT5682_SDW=y
CONFIG_SND_SOC_RT700=y
CONFIG_SND_SOC_RT700_SDW=y
CONFIG_SND_SOC_RT711=y
CONFIG_SND_SOC_RT711_SDW=y
# CONFIG_SND_SOC_RT711_SDCA_SDW is not set
CONFIG_SND_SOC_RT715=y
CONFIG_SND_SOC_RT715_SDW=y
CONFIG_SND_SOC_RT715_SDCA_SDW=y
# CONFIG_SND_SOC_RT9120 is not set
# CONFIG_SND_SOC_SDW_MOCKUP is not set
CONFIG_SND_SOC_SGTL5000=y
CONFIG_SND_SOC_SIGMADSP=y
CONFIG_SND_SOC_SIGMADSP_I2C=y
CONFIG_SND_SOC_SIGMADSP_REGMAP=y
CONFIG_SND_SOC_SIMPLE_AMPLIFIER=y
CONFIG_SND_SOC_SIMPLE_MUX=y
CONFIG_SND_SOC_SPDIF=y
# CONFIG_SND_SOC_SRC4XXX_I2C is not set
CONFIG_SND_SOC_SSM2305=y
CONFIG_SND_SOC_SSM2518=y
CONFIG_SND_SOC_SSM2602=y
# CONFIG_SND_SOC_SSM2602_SPI is not set
CONFIG_SND_SOC_SSM2602_I2C=y
CONFIG_SND_SOC_SSM4567=y
CONFIG_SND_SOC_STA32X=y
CONFIG_SND_SOC_STA350=y
# CONFIG_SND_SOC_STI_SAS is not set
CONFIG_SND_SOC_TAS2552=y
CONFIG_SND_SOC_TAS2562=y
# CONFIG_SND_SOC_TAS2764 is not set
# CONFIG_SND_SOC_TAS2770 is not set
# CONFIG_SND_SOC_TAS2780 is not set
CONFIG_SND_SOC_TAS5086=y
CONFIG_SND_SOC_TAS571X=y
# CONFIG_SND_SOC_TAS5720 is not set
CONFIG_SND_SOC_TAS5805M=y
CONFIG_SND_SOC_TAS6424=y
# CONFIG_SND_SOC_TDA7419 is not set
# CONFIG_SND_SOC_TFA9879 is not set
CONFIG_SND_SOC_TFA989X=y
CONFIG_SND_SOC_TLV320ADC3XXX=y
CONFIG_SND_SOC_TLV320AIC23=y
# CONFIG_SND_SOC_TLV320AIC23_I2C is not set
CONFIG_SND_SOC_TLV320AIC23_SPI=y
CONFIG_SND_SOC_TLV320AIC31XX=y
CONFIG_SND_SOC_TLV320AIC32X4=y
CONFIG_SND_SOC_TLV320AIC32X4_I2C=y
CONFIG_SND_SOC_TLV320AIC32X4_SPI=y
CONFIG_SND_SOC_TLV320AIC3X=y
# CONFIG_SND_SOC_TLV320AIC3X_I2C is not set
CONFIG_SND_SOC_TLV320AIC3X_SPI=y
CONFIG_SND_SOC_TLV320ADCX140=y
CONFIG_SND_SOC_TS3A227E=y
CONFIG_SND_SOC_TSCS42XX=y
CONFIG_SND_SOC_TSCS454=y
# CONFIG_SND_SOC_UDA1334 is not set
# CONFIG_SND_SOC_WCD9335 is not set
CONFIG_SND_SOC_WCD_MBHC=y
# CONFIG_SND_SOC_WCD934X is not set
CONFIG_SND_SOC_WCD938X=y
CONFIG_SND_SOC_WCD938X_SDW=y
# CONFIG_SND_SOC_WM8510 is not set
CONFIG_SND_SOC_WM8523=y
CONFIG_SND_SOC_WM8524=y
CONFIG_SND_SOC_WM8580=y
# CONFIG_SND_SOC_WM8711 is not set
# CONFIG_SND_SOC_WM8728 is not set
CONFIG_SND_SOC_WM8731=y
CONFIG_SND_SOC_WM8731_I2C=y
# CONFIG_SND_SOC_WM8731_SPI is not set
CONFIG_SND_SOC_WM8737=y
CONFIG_SND_SOC_WM8741=y
CONFIG_SND_SOC_WM8750=y
CONFIG_SND_SOC_WM8753=y
CONFIG_SND_SOC_WM8770=y
CONFIG_SND_SOC_WM8776=y
CONFIG_SND_SOC_WM8782=y
CONFIG_SND_SOC_WM8804=y
CONFIG_SND_SOC_WM8804_I2C=y
CONFIG_SND_SOC_WM8804_SPI=y
CONFIG_SND_SOC_WM8903=y
CONFIG_SND_SOC_WM8904=y
# CONFIG_SND_SOC_WM8940 is not set
# CONFIG_SND_SOC_WM8960 is not set
CONFIG_SND_SOC_WM8974=y
CONFIG_SND_SOC_WM8978=y
# CONFIG_SND_SOC_WM8985 is not set
# CONFIG_SND_SOC_WSA881X is not set
# CONFIG_SND_SOC_WSA883X is not set
CONFIG_SND_SOC_ZL38060=y
# CONFIG_SND_SOC_MAX9759 is not set
CONFIG_SND_SOC_MT6351=y
# CONFIG_SND_SOC_MT6358 is not set
CONFIG_SND_SOC_MT6660=y
# CONFIG_SND_SOC_NAU8315 is not set
CONFIG_SND_SOC_NAU8540=y
CONFIG_SND_SOC_NAU8810=y
CONFIG_SND_SOC_NAU8821=y
CONFIG_SND_SOC_NAU8822=y
CONFIG_SND_SOC_NAU8824=y
CONFIG_SND_SOC_TPA6130A2=y
CONFIG_SND_SOC_LPASS_MACRO_COMMON=y
# CONFIG_SND_SOC_LPASS_WSA_MACRO is not set
CONFIG_SND_SOC_LPASS_VA_MACRO=y
# CONFIG_SND_SOC_LPASS_RX_MACRO is not set
# CONFIG_SND_SOC_LPASS_TX_MACRO is not set
# end of CODEC drivers

CONFIG_SND_SIMPLE_CARD_UTILS=y
CONFIG_SND_SIMPLE_CARD=y
CONFIG_SND_AUDIO_GRAPH_CARD=y
CONFIG_SND_AUDIO_GRAPH_CARD2=y
# CONFIG_SND_AUDIO_GRAPH_CARD2_CUSTOM_SAMPLE is not set
CONFIG_SND_TEST_COMPONENT=y
# CONFIG_SND_VIRTIO is not set
CONFIG_AC97_BUS=y
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
# CONFIG_USB_SUPPORT is not set
CONFIG_MMC=y
# CONFIG_PWRSEQ_EMMC is not set
CONFIG_PWRSEQ_SD8787=y
# CONFIG_PWRSEQ_SIMPLE is not set
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
# CONFIG_MMC_ARMMMCI is not set
CONFIG_MMC_SDHCI=y
# CONFIG_MMC_SDHCI_PLTFM is not set
# CONFIG_MMC_SDHCI_S3C is not set
# CONFIG_MMC_SDHCI_SPEAR is not set
# CONFIG_MMC_MESON_GX is not set
# CONFIG_MMC_MESON_MX_SDHC is not set
# CONFIG_MMC_MESON_MX_SDIO is not set
# CONFIG_MMC_MOXART is not set
# CONFIG_MMC_OMAP_HS is not set
CONFIG_MMC_ATMELMCI=y
# CONFIG_MMC_MVSDIO is not set
# CONFIG_MMC_DAVINCI is not set
CONFIG_MMC_SPI=y
# CONFIG_MMC_S3C is not set
CONFIG_MMC_TMIO_CORE=y
CONFIG_MMC_TMIO=y
# CONFIG_MMC_SDHI is not set
# CONFIG_MMC_UNIPHIER is not set
# CONFIG_MMC_DW is not set
# CONFIG_MMC_SH_MMCIF is not set
CONFIG_MMC_USDHI6ROL0=y
CONFIG_MMC_CQHCI=y
CONFIG_MMC_HSQ=y
# CONFIG_MMC_BCM2835 is not set
# CONFIG_MMC_MTK is not set
# CONFIG_MMC_OWL is not set
# CONFIG_MMC_LITEX is not set
CONFIG_MEMSTICK=y
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set

#
# MemoryStick Host Controller Drivers
#
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y
CONFIG_LEDS_CLASS_MULTICOLOR=y
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
CONFIG_LEDS_88PM860X=y
CONFIG_LEDS_AN30259A=y
# CONFIG_LEDS_ARIEL is not set
# CONFIG_LEDS_AW2013 is not set
# CONFIG_LEDS_BCM6328 is not set
CONFIG_LEDS_BCM6358=y
# CONFIG_LEDS_CR0014114 is not set
# CONFIG_LEDS_EL15203000 is not set
# CONFIG_LEDS_TURRIS_OMNIA is not set
CONFIG_LEDS_LM3530=y
# CONFIG_LEDS_LM3532 is not set
CONFIG_LEDS_LM3642=y
# CONFIG_LEDS_LM3692X is not set
# CONFIG_LEDS_S3C24XX is not set
# CONFIG_LEDS_COBALT_QUBE is not set
# CONFIG_LEDS_COBALT_RAQ is not set
CONFIG_LEDS_GPIO=y
# CONFIG_LEDS_LP3944 is not set
# CONFIG_LEDS_LP3952 is not set
CONFIG_LEDS_LP50XX=y
# CONFIG_LEDS_LP55XX_COMMON is not set
# CONFIG_LEDS_LP8860 is not set
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_WM831X_STATUS is not set
CONFIG_LEDS_WM8350=y
# CONFIG_LEDS_DA9052 is not set
CONFIG_LEDS_DAC124S085=y
# CONFIG_LEDS_PWM is not set
# CONFIG_LEDS_BD2802 is not set
# CONFIG_LEDS_LT3593 is not set
CONFIG_LEDS_MC13783=y
CONFIG_LEDS_NS2=y
CONFIG_LEDS_NETXBIG=y
# CONFIG_LEDS_ASIC3 is not set
CONFIG_LEDS_TCA6507=y
CONFIG_LEDS_TLC591XX=y
CONFIG_LEDS_MAX77650=y
CONFIG_LEDS_MAX8997=y
# CONFIG_LEDS_LM355x is not set
# CONFIG_LEDS_OT200 is not set
# CONFIG_LEDS_IS31FL319X is not set
# CONFIG_LEDS_IS31FL32XX is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
CONFIG_LEDS_SYSCON=y
CONFIG_LEDS_PM8058=y
CONFIG_LEDS_MLXREG=y
CONFIG_LEDS_USER=y
# CONFIG_LEDS_SPI_BYTE is not set
CONFIG_LEDS_TI_LMU_COMMON=y
CONFIG_LEDS_LM3697=y
# CONFIG_LEDS_LM36274 is not set
# CONFIG_LEDS_IP30 is not set
# CONFIG_LEDS_BCM63138 is not set
# CONFIG_LEDS_LGM is not set

#
# Flash and Torch LED drivers
#
CONFIG_LEDS_AAT1290=y
CONFIG_LEDS_AS3645A=y
# CONFIG_LEDS_KTD2692 is not set
CONFIG_LEDS_LM3601X=y
# CONFIG_LEDS_MAX77693 is not set
# CONFIG_LEDS_MT6360 is not set
CONFIG_LEDS_RT4505=y
CONFIG_LEDS_RT8515=y
CONFIG_LEDS_SGM3140=y

#
# RGB LED drivers
#
# CONFIG_LEDS_PWM_MULTICOLOR is not set

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=y
CONFIG_LEDS_TRIGGER_ONESHOT=y
# CONFIG_LEDS_TRIGGER_MTD is not set
# CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
CONFIG_LEDS_TRIGGER_BACKLIGHT=y
CONFIG_LEDS_TRIGGER_CPU=y
CONFIG_LEDS_TRIGGER_ACTIVITY=y
# CONFIG_LEDS_TRIGGER_GPIO is not set
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
CONFIG_LEDS_TRIGGER_CAMERA=y
CONFIG_LEDS_TRIGGER_PANIC=y
CONFIG_LEDS_TRIGGER_NETDEV=y
# CONFIG_LEDS_TRIGGER_PATTERN is not set
CONFIG_LEDS_TRIGGER_AUDIO=y

#
# Simple LED drivers
#
CONFIG_ACCESSIBILITY=y

#
# Speakup console speech
#
# end of Speakup console speech

CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
# CONFIG_EDAC is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
# CONFIG_RTC_HCTOSYS is not set
CONFIG_RTC_SYSTOHC=y
CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
CONFIG_RTC_DEBUG=y
CONFIG_RTC_LIB_KUNIT_TEST=y
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
CONFIG_RTC_DRV_TEST=y

#
# I2C RTC drivers
#
CONFIG_RTC_DRV_88PM860X=y
CONFIG_RTC_DRV_ABB5ZES3=y
# CONFIG_RTC_DRV_ABEOZ9 is not set
# CONFIG_RTC_DRV_ABX80X is not set
# CONFIG_RTC_DRV_BRCMSTB is not set
CONFIG_RTC_DRV_DS1307=y
CONFIG_RTC_DRV_DS1307_CENTURY=y
# CONFIG_RTC_DRV_DS1374 is not set
CONFIG_RTC_DRV_DS1672=y
CONFIG_RTC_DRV_HYM8563=y
CONFIG_RTC_DRV_MAX6900=y
# CONFIG_RTC_DRV_MAX8907 is not set
# CONFIG_RTC_DRV_MAX8998 is not set
CONFIG_RTC_DRV_MAX8997=y
# CONFIG_RTC_DRV_MAX77686 is not set
# CONFIG_RTC_DRV_NCT3018Y is not set
# CONFIG_RTC_DRV_RK808 is not set
CONFIG_RTC_DRV_RS5C372=y
CONFIG_RTC_DRV_ISL1208=y
CONFIG_RTC_DRV_ISL12022=y
# CONFIG_RTC_DRV_ISL12026 is not set
CONFIG_RTC_DRV_X1205=y
CONFIG_RTC_DRV_PCF8523=y
CONFIG_RTC_DRV_PCF85063=y
CONFIG_RTC_DRV_PCF85363=y
# CONFIG_RTC_DRV_PCF8563 is not set
# CONFIG_RTC_DRV_PCF8583 is not set
CONFIG_RTC_DRV_M41T80=y
CONFIG_RTC_DRV_M41T80_WDT=y
CONFIG_RTC_DRV_BD70528=y
CONFIG_RTC_DRV_BQ32K=y
# CONFIG_RTC_DRV_TPS65910 is not set
CONFIG_RTC_DRV_RC5T583=y
# CONFIG_RTC_DRV_RC5T619 is not set
# CONFIG_RTC_DRV_S35390A is not set
# CONFIG_RTC_DRV_FM3130 is not set
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=y
# CONFIG_RTC_DRV_RX8025 is not set
# CONFIG_RTC_DRV_EM3027 is not set
CONFIG_RTC_DRV_RV3028=y
CONFIG_RTC_DRV_RV3032=y
# CONFIG_RTC_DRV_RV8803 is not set
CONFIG_RTC_DRV_S5M=y
CONFIG_RTC_DRV_SD3078=y

#
# SPI RTC drivers
#
CONFIG_RTC_DRV_M41T93=y
CONFIG_RTC_DRV_M41T94=y
CONFIG_RTC_DRV_DS1302=y
CONFIG_RTC_DRV_DS1305=y
# CONFIG_RTC_DRV_DS1343 is not set
# CONFIG_RTC_DRV_DS1347 is not set
CONFIG_RTC_DRV_DS1390=y
# CONFIG_RTC_DRV_MAX6916 is not set
CONFIG_RTC_DRV_R9701=y
CONFIG_RTC_DRV_RX4581=y
# CONFIG_RTC_DRV_RS5C348 is not set
# CONFIG_RTC_DRV_MAX6902 is not set
CONFIG_RTC_DRV_PCF2123=y
CONFIG_RTC_DRV_MCP795=y
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
# CONFIG_RTC_DRV_DS3232 is not set
CONFIG_RTC_DRV_PCF2127=y
CONFIG_RTC_DRV_RV3029C2=y
CONFIG_RTC_DRV_RV3029_HWMON=y
CONFIG_RTC_DRV_RX6110=y

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
CONFIG_RTC_DRV_DS1286=y
# CONFIG_RTC_DRV_DS1511 is not set
CONFIG_RTC_DRV_DS1553=y
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
CONFIG_RTC_DRV_DS1742=y
CONFIG_RTC_DRV_DS2404=y
CONFIG_RTC_DRV_DA9052=y
CONFIG_RTC_DRV_DA9055=y
# CONFIG_RTC_DRV_DA9063 is not set
CONFIG_RTC_DRV_STK17TA8=y
CONFIG_RTC_DRV_M48T86=y
CONFIG_RTC_DRV_M48T35=y
CONFIG_RTC_DRV_M48T59=y
CONFIG_RTC_DRV_MSM6242=y
CONFIG_RTC_DRV_BQ4802=y
CONFIG_RTC_DRV_RP5C01=y
CONFIG_RTC_DRV_V3020=y
# CONFIG_RTC_DRV_GAMECUBE is not set
CONFIG_RTC_DRV_WM831X=y
# CONFIG_RTC_DRV_WM8350 is not set
# CONFIG_RTC_DRV_SC27XX is not set
CONFIG_RTC_DRV_SPEAR=y
# CONFIG_RTC_DRV_ZYNQMP is not set
CONFIG_RTC_DRV_CROS_EC=y
CONFIG_RTC_DRV_NTXEC=y

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_ASM9260 is not set
# CONFIG_RTC_DRV_DAVINCI is not set
# CONFIG_RTC_DRV_DIGICOLOR is not set
# CONFIG_RTC_DRV_FSL_FTM_ALARM is not set
# CONFIG_RTC_DRV_MESON is not set
# CONFIG_RTC_DRV_MESON_VRTC is not set
# CONFIG_RTC_DRV_OMAP is not set
# CONFIG_RTC_DRV_S3C is not set
# CONFIG_RTC_DRV_EP93XX is not set
CONFIG_RTC_DRV_PL030=y
# CONFIG_RTC_DRV_PL031 is not set
# CONFIG_RTC_DRV_AT91RM9200 is not set
CONFIG_RTC_DRV_AT91SAM9=y
# CONFIG_RTC_DRV_RZN1 is not set
# CONFIG_RTC_DRV_GENERIC is not set
# CONFIG_RTC_DRV_VT8500 is not set
# CONFIG_RTC_DRV_SUN6I is not set
# CONFIG_RTC_DRV_SUNXI is not set
# CONFIG_RTC_DRV_MV is not set
# CONFIG_RTC_DRV_ARMADA38X is not set
CONFIG_RTC_DRV_CADENCE=y
CONFIG_RTC_DRV_FTRTC010=y
# CONFIG_RTC_DRV_STMP is not set
CONFIG_RTC_DRV_PCAP=y
CONFIG_RTC_DRV_MC13XXX=y
# CONFIG_RTC_DRV_JZ4740 is not set
# CONFIG_RTC_DRV_LPC24XX is not set
# CONFIG_RTC_DRV_LPC32XX is not set
CONFIG_RTC_DRV_PM8XXX=y
# CONFIG_RTC_DRV_TEGRA is not set
# CONFIG_RTC_DRV_MXC is not set
# CONFIG_RTC_DRV_MXC_V2 is not set
# CONFIG_RTC_DRV_SNVS is not set
# CONFIG_RTC_DRV_MOXART is not set
# CONFIG_RTC_DRV_MT2712 is not set
# CONFIG_RTC_DRV_MT6397 is not set
# CONFIG_RTC_DRV_MT7622 is not set
# CONFIG_RTC_DRV_XGENE is not set
CONFIG_RTC_DRV_R7301=y
CONFIG_RTC_DRV_STM32=y
# CONFIG_RTC_DRV_RTD119X is not set
# CONFIG_RTC_DRV_ASPEED is not set
# CONFIG_RTC_DRV_TI_K3 is not set

#
# HID Sensor RTC drivers
#
CONFIG_RTC_DRV_GOLDFISH=y
# CONFIG_RTC_DRV_MSC313 is not set
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH=y
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_OF=y
# CONFIG_ALTERA_MSGDMA is not set
# CONFIG_AMBA_PL08X is not set
# CONFIG_APPLE_ADMAC is not set
CONFIG_AT_HDMAC=y
CONFIG_AT_XDMAC=y
# CONFIG_AXI_DMAC is not set
# CONFIG_DMA_JZ4780 is not set
# CONFIG_DMA_SA11X0 is not set
# CONFIG_DMA_SUN6I is not set
CONFIG_DW_AXI_DMAC=y
# CONFIG_EP93XX_DMA is not set
# CONFIG_FSL_EDMA is not set
CONFIG_FSL_QDMA=y
# CONFIG_IMG_MDC_DMA is not set
CONFIG_INTEL_IDMA64=y
# CONFIG_INTEL_IOP_ADMA is not set
# CONFIG_K3_DMA is not set
# CONFIG_MCF_EDMA is not set
# CONFIG_MILBEAUT_HDMAC is not set
# CONFIG_MILBEAUT_XDMAC is not set
# CONFIG_MMP_PDMA is not set
# CONFIG_MMP_TDMA is not set
# CONFIG_MV_XOR is not set
# CONFIG_MXS_DMA is not set
CONFIG_NBPFAXI_DMA=y
# CONFIG_PL330_DMA is not set
# CONFIG_STM32_DMA is not set
# CONFIG_STM32_DMAMUX is not set
CONFIG_STM32_MDMA=y
# CONFIG_SPRD_DMA is not set
# CONFIG_S3C24XX_DMAC is not set
# CONFIG_TEGRA20_APB_DMA is not set
# CONFIG_TEGRA210_ADMA is not set
# CONFIG_TIMB_DMA is not set
# CONFIG_UNIPHIER_MDMAC is not set
# CONFIG_UNIPHIER_XDMAC is not set
# CONFIG_XGENE_DMA is not set
# CONFIG_XILINX_ZYNQMP_DMA is not set
CONFIG_XILINX_ZYNQMP_DPDMA=y
# CONFIG_MTK_HSDMA is not set
# CONFIG_MTK_CQDMA is not set
# CONFIG_QCOM_ADM is not set
# CONFIG_QCOM_BAM_DMA is not set
CONFIG_QCOM_HIDMA_MGMT=y
CONFIG_QCOM_HIDMA=y
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=y
# CONFIG_RZN1_DMAMUX is not set
CONFIG_SF_PDMA=y
CONFIG_RENESAS_DMA=y
CONFIG_SH_DMAE_BASE=y
# CONFIG_SH_DMAE is not set
# CONFIG_RCAR_DMAC is not set
# CONFIG_RENESAS_USB_DMAC is not set
# CONFIG_RZ_DMAC is not set
CONFIG_TI_EDMA=y
CONFIG_DMA_OMAP=y
CONFIG_TI_DMA_CROSSBAR=y
# CONFIG_INTEL_LDMA is not set

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
CONFIG_DMATEST=y
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
# CONFIG_SYNC_FILE is not set
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_MOVE_NOTIFY is not set
CONFIG_DMABUF_DEBUG=y
CONFIG_DMABUF_SELFTESTS=y
CONFIG_DMABUF_HEAPS=y
CONFIG_DMABUF_SYSFS_STATS=y
# CONFIG_DMABUF_HEAPS_SYSTEM is not set
# end of DMABUF options

CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
# CONFIG_LINEDISP is not set
CONFIG_HD44780_COMMON=y
CONFIG_HD44780=y
# CONFIG_IMG_ASCII_LCD is not set
CONFIG_LCD2S=y
CONFIG_PARPORT_PANEL=y
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
CONFIG_PANEL_CHANGE_MESSAGE=y
CONFIG_PANEL_BOOT_MESSAGE=""
CONFIG_CHARLCD_BL_OFF=y
# CONFIG_CHARLCD_BL_ON is not set
# CONFIG_CHARLCD_BL_FLASH is not set
CONFIG_PANEL=y
# CONFIG_VFIO is not set
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_BALLOON=y
# CONFIG_VIRTIO_MMIO is not set
# CONFIG_VDPA is not set
CONFIG_VHOST_IOTLB=y
CONFIG_VHOST=y
CONFIG_VHOST_MENU=y
CONFIG_VHOST_NET=y
CONFIG_VHOST_CROSS_ENDIAN_LEGACY=y

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
CONFIG_COMEDI=y
CONFIG_COMEDI_DEBUG=y
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
# CONFIG_COMEDI_MISC_DRIVERS is not set
# CONFIG_COMEDI_ISA_DRIVERS is not set
CONFIG_COMEDI_8255=y
CONFIG_COMEDI_8255_SA=y
CONFIG_COMEDI_KCOMEDILIB=y
CONFIG_COMEDI_TESTS=y
CONFIG_COMEDI_TESTS_EXAMPLE=y
# CONFIG_COMEDI_TESTS_NI_ROUTES is not set
# CONFIG_STAGING is not set
CONFIG_GOLDFISH=y
# CONFIG_GOLDFISH_PIPE is not set
CONFIG_CHROME_PLATFORMS=y
CONFIG_CROS_EC=y
CONFIG_CROS_EC_I2C=y
# CONFIG_CROS_EC_RPMSG is not set
# CONFIG_CROS_EC_SPI is not set
CONFIG_CROS_EC_PROTO=y
# CONFIG_CROS_KBD_LED_BACKLIGHT is not set
# CONFIG_CROS_EC_CHARDEV is not set
# CONFIG_CROS_EC_LIGHTBAR is not set
CONFIG_CROS_EC_VBC=y
CONFIG_CROS_EC_DEBUGFS=y
CONFIG_CROS_EC_SENSORHUB=y
# CONFIG_CROS_EC_SYSFS is not set
# CONFIG_CROS_USBPD_NOTIFY is not set
CONFIG_CROS_KUNIT=y
CONFIG_MELLANOX_PLATFORM=y
# CONFIG_MLXREG_HOTPLUG is not set
CONFIG_MLXREG_IO=y
# CONFIG_MLXREG_LC is not set
# CONFIG_NVSW_SN2201 is not set
# CONFIG_OLPC_XO175 is not set
CONFIG_SURFACE_PLATFORMS=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
# CONFIG_COMMON_CLK_WM831X is not set

#
# Clock driver for ARM Reference designs
#
# CONFIG_CLK_ICST is not set
# CONFIG_CLK_SP810 is not set
CONFIG_CLK_VEXPRESS_OSC=y
# end of Clock driver for ARM Reference designs

# CONFIG_CLK_HSDK is not set
CONFIG_LMK04832=y
# CONFIG_COMMON_CLK_APPLE_NCO is not set
CONFIG_COMMON_CLK_MAX77686=y
# CONFIG_COMMON_CLK_MAX9485 is not set
# CONFIG_COMMON_CLK_RK808 is not set
# CONFIG_COMMON_CLK_HI655X is not set
# CONFIG_COMMON_CLK_SCMI is not set
# CONFIG_COMMON_CLK_SCPI is not set
CONFIG_COMMON_CLK_SI5341=y
# CONFIG_COMMON_CLK_SI5351 is not set
# CONFIG_COMMON_CLK_SI514 is not set
CONFIG_COMMON_CLK_SI544=y
CONFIG_COMMON_CLK_SI570=y
# CONFIG_COMMON_CLK_BM1880 is not set
CONFIG_COMMON_CLK_CDCE706=y
# CONFIG_COMMON_CLK_TPS68470 is not set
CONFIG_COMMON_CLK_CDCE925=y
CONFIG_COMMON_CLK_CS2000_CP=y
# CONFIG_COMMON_CLK_EN7523 is not set
# CONFIG_COMMON_CLK_FSL_FLEXSPI is not set
# CONFIG_COMMON_CLK_FSL_SAI is not set
# CONFIG_COMMON_CLK_GEMINI is not set
# CONFIG_COMMON_CLK_LAN966X is not set
# CONFIG_COMMON_CLK_ASPEED is not set
CONFIG_COMMON_CLK_S2MPS11=y
# CONFIG_COMMON_CLK_AXI_CLKGEN is not set
# CONFIG_CLK_QORIQ is not set
# CONFIG_CLK_LS1028A_PLLDIG is not set
# CONFIG_COMMON_CLK_XGENE is not set
# CONFIG_COMMON_CLK_LOCHNAGAR is not set
# CONFIG_COMMON_CLK_PWM is not set
# CONFIG_COMMON_CLK_OXNAS is not set
# CONFIG_COMMON_CLK_RS9_PCIE is not set
CONFIG_COMMON_CLK_VC5=y
# CONFIG_COMMON_CLK_VC7 is not set
CONFIG_COMMON_CLK_STM32F=y
# CONFIG_COMMON_CLK_MMP2_AUDIO is not set
# CONFIG_COMMON_CLK_BD718XX is not set
# CONFIG_COMMON_CLK_FIXED_MMIO is not set
# CONFIG_CLK_ACTIONS is not set
# CONFIG_CLK_BAIKAL_T1 is not set
# CONFIG_CLK_BCM2711_DVP is not set
# CONFIG_CLK_BCM2835 is not set
# CONFIG_CLK_BCM_63XX is not set
# CONFIG_CLK_BCM_63XX_GATE is not set
# CONFIG_CLK_BCM_KONA is not set
# CONFIG_CLK_BCM_CYGNUS is not set
# CONFIG_CLK_BCM_HR2 is not set
# CONFIG_CLK_BCM_NSP is not set
# CONFIG_CLK_BCM_NS2 is not set
# CONFIG_CLK_BCM_SR is not set
# CONFIG_CLK_RASPBERRYPI is not set
# CONFIG_COMMON_CLK_HI3516CV300 is not set
# CONFIG_COMMON_CLK_HI3519 is not set
# CONFIG_COMMON_CLK_HI3559A is not set
# CONFIG_COMMON_CLK_HI3660 is not set
# CONFIG_COMMON_CLK_HI3670 is not set
# CONFIG_COMMON_CLK_HI3798CV200 is not set
# CONFIG_COMMON_CLK_HI6220 is not set
# CONFIG_RESET_HISI is not set
# CONFIG_STUB_CLK_HI6220 is not set
# CONFIG_STUB_CLK_HI3660 is not set
# CONFIG_COMMON_CLK_BOSTON is not set
# CONFIG_MXC_CLK is not set
# CONFIG_CLK_IMX8MM is not set
# CONFIG_CLK_IMX8MN is not set
# CONFIG_CLK_IMX8MP is not set
# CONFIG_CLK_IMX8MQ is not set
# CONFIG_CLK_IMX8ULP is not set
# CONFIG_CLK_IMX93 is not set

#
# Ingenic SoCs drivers
#
# CONFIG_INGENIC_CGU_JZ4740 is not set
# CONFIG_INGENIC_CGU_JZ4725B is not set
# CONFIG_INGENIC_CGU_JZ4760 is not set
# CONFIG_INGENIC_CGU_JZ4770 is not set
# CONFIG_INGENIC_CGU_JZ4780 is not set
# CONFIG_INGENIC_CGU_X1000 is not set
# CONFIG_INGENIC_CGU_X1830 is not set
# CONFIG_INGENIC_TCU_CLK is not set
# end of Ingenic SoCs drivers

# CONFIG_COMMON_CLK_KEYSTONE is not set
# CONFIG_TI_SYSCON_CLK is not set

#
# Clock driver for MediaTek SoC
#
# CONFIG_COMMON_CLK_MT2701 is not set
# CONFIG_COMMON_CLK_MT2712 is not set
# CONFIG_COMMON_CLK_MT6765 is not set
# CONFIG_COMMON_CLK_MT6779 is not set
# CONFIG_COMMON_CLK_MT6795 is not set
# CONFIG_COMMON_CLK_MT6797 is not set
# CONFIG_COMMON_CLK_MT7622 is not set
# CONFIG_COMMON_CLK_MT7629 is not set
# CONFIG_COMMON_CLK_MT7986 is not set
# CONFIG_COMMON_CLK_MT8135 is not set
# CONFIG_COMMON_CLK_MT8167 is not set
# CONFIG_COMMON_CLK_MT8173 is not set
# CONFIG_COMMON_CLK_MT8183 is not set
# CONFIG_COMMON_CLK_MT8186 is not set
# CONFIG_COMMON_CLK_MT8192 is not set
# CONFIG_COMMON_CLK_MT8195 is not set
# CONFIG_COMMON_CLK_MT8365 is not set
# CONFIG_COMMON_CLK_MT8516 is not set
# end of Clock driver for MediaTek SoC

#
# Clock support for Amlogic platforms
#
CONFIG_COMMON_CLK_MESON_REGMAP=y
CONFIG_COMMON_CLK_MESON_MPLL=y
CONFIG_COMMON_CLK_MESON_PLL=y
CONFIG_COMMON_CLK_MESON8B=y
# end of Clock support for Amlogic platforms

# CONFIG_MSTAR_MSC313_MPLL is not set
# CONFIG_MCHP_CLK_MPFS is not set
# CONFIG_COMMON_CLK_PISTACHIO is not set
# CONFIG_COMMON_CLK_QCOM is not set
# CONFIG_CLK_MT7621 is not set
# CONFIG_CLK_RENESAS is not set
# CONFIG_COMMON_CLK_SAMSUNG is not set
# CONFIG_S3C2410_COMMON_CLK is not set
# CONFIG_S3C2412_COMMON_CLK is not set
# CONFIG_S3C2443_COMMON_CLK is not set
# CONFIG_CLK_SIFIVE is not set
# CONFIG_CLK_INTEL_SOCFPGA is not set
# CONFIG_SPRD_COMMON_CLK is not set
# CONFIG_CLK_STARFIVE_JH7100 is not set
CONFIG_CLK_SUNXI=y
CONFIG_CLK_SUNXI_CLOCKS=y
CONFIG_CLK_SUNXI_PRCM_SUN6I=y
CONFIG_CLK_SUNXI_PRCM_SUN8I=y
CONFIG_CLK_SUNXI_PRCM_SUN9I=y
# CONFIG_SUNXI_CCU is not set
# CONFIG_COMMON_CLK_TI_ADPLL is not set
# CONFIG_CLK_UNIPHIER is not set
# CONFIG_COMMON_CLK_VISCONTI is not set
# CONFIG_CLK_LGM_CGU is not set
# CONFIG_XILINX_VCU is not set
# CONFIG_COMMON_CLK_XLNX_CLKWZRD is not set
# CONFIG_COMMON_CLK_ZYNQMP is not set
CONFIG_CLK_KUNIT_TEST=y
CONFIG_CLK_GATE_KUNIT_TEST=y
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_TIMER_OF=y
CONFIG_TIMER_PROBE=y
CONFIG_CLKSRC_MMIO=y
# CONFIG_BCM2835_TIMER is not set
# CONFIG_BCM_KONA_TIMER is not set
# CONFIG_DAVINCI_TIMER is not set
# CONFIG_DIGICOLOR_TIMER is not set
# CONFIG_OMAP_DM_TIMER is not set
# CONFIG_DW_APB_TIMER is not set
# CONFIG_FTTMR010_TIMER is not set
# CONFIG_IXP4XX_TIMER is not set
# CONFIG_ROCKCHIP_TIMER is not set
# CONFIG_ARMADA_370_XP_TIMER is not set
# CONFIG_MESON6_TIMER is not set
# CONFIG_ORION_TIMER is not set
# CONFIG_OWL_TIMER is not set
# CONFIG_RDA_TIMER is not set
# CONFIG_SUN4I_TIMER is not set
# CONFIG_SUN5I_HSTIMER is not set
# CONFIG_TEGRA_TIMER is not set
# CONFIG_TEGRA186_TIMER is not set
# CONFIG_VT8500_TIMER is not set
# CONFIG_NPCM7XX_TIMER is not set
# CONFIG_CADENCE_TTC_TIMER is not set
# CONFIG_ASM9260_TIMER is not set
# CONFIG_CLKSRC_NOMADIK_MTU is not set
# CONFIG_CLKSRC_DBX500_PRCMU is not set
# CONFIG_CLPS711X_TIMER is not set
# CONFIG_MXS_TIMER is not set
# CONFIG_NSPIRE_TIMER is not set
# CONFIG_KEYSTONE_TIMER is not set
# CONFIG_INTEGRATOR_AP_TIMER is not set
# CONFIG_CLKSRC_LPC32XX is not set
# CONFIG_CLKSRC_PISTACHIO is not set
# CONFIG_CLKSRC_TI_32K is not set
CONFIG_CLKSRC_STM32=y
# CONFIG_CLKSRC_STM32_LP is not set
# CONFIG_CLKSRC_MPS2 is not set
# CONFIG_ARC_TIMERS is not set
# CONFIG_ARM_GLOBAL_TIMER is not set
# CONFIG_ARM_TIMER_SP804 is not set
CONFIG_ARMV7M_SYSTICK=y
# CONFIG_ATMEL_PIT is not set
# CONFIG_ATMEL_ST is not set
CONFIG_ATMEL_TCB_CLKSRC=y
# CONFIG_CLKSRC_EXYNOS_MCT is not set
# CONFIG_CLKSRC_SAMSUNG_PWM is not set
# CONFIG_FSL_FTM_TIMER is not set
# CONFIG_OXNAS_RPS_TIMER is not set
# CONFIG_MTK_TIMER is not set
# CONFIG_SPRD_TIMER is not set
# CONFIG_CLKSRC_JCORE_PIT is not set
# CONFIG_SH_TIMER_CMT is not set
# CONFIG_SH_TIMER_MTU2 is not set
# CONFIG_RENESAS_OSTM is not set
# CONFIG_SH_TIMER_TMU is not set
# CONFIG_EM_TIMER_STI is not set
# CONFIG_CLKSRC_QCOM is not set
# CONFIG_CLKSRC_VERSATILE is not set
# CONFIG_CLKSRC_PXA is not set
# CONFIG_CLKSRC_IMX_GPT is not set
# CONFIG_CLKSRC_IMX_TPM is not set
# CONFIG_TIMER_IMX_SYS_CTR is not set
# CONFIG_CLKSRC_ST_LPC is not set
# CONFIG_GXP_TIMER is not set
# CONFIG_MILBEAUT_TIMER is not set
# CONFIG_MSC313E_TIMER is not set
# CONFIG_INGENIC_TIMER is not set
# CONFIG_INGENIC_SYSOST is not set
# CONFIG_INGENIC_OST is not set
CONFIG_MICROCHIP_PIT64B=y
# CONFIG_GOLDFISH_TIMER is not set
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_ARM_MHU=y
CONFIG_ARM_MHU_V2=y
# CONFIG_IMX_MBOX is not set
CONFIG_PLATFORM_MHU=y
# CONFIG_PL320_MBOX is not set
# CONFIG_ARMADA_37XX_RWTM_MBOX is not set
# CONFIG_ROCKCHIP_MBOX is not set
CONFIG_ALTERA_MBOX=y
# CONFIG_HI3660_MBOX is not set
# CONFIG_HI6220_MBOX is not set
# CONFIG_MAILBOX_TEST is not set
# CONFIG_POLARFIRE_SOC_MAILBOX is not set
# CONFIG_QCOM_APCS_IPC is not set
# CONFIG_BCM_PDC_MBOX is not set
# CONFIG_STM32_IPCC is not set
# CONFIG_MTK_ADSP_MBOX is not set
# CONFIG_MTK_CMDQ_MBOX is not set
# CONFIG_SUN6I_MSGBOX is not set
# CONFIG_SPRD_MBOX is not set
# CONFIG_QCOM_IPCC is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
CONFIG_RPMSG_CHAR=y
# CONFIG_RPMSG_CTRL is not set
CONFIG_RPMSG_NS=y
CONFIG_RPMSG_QCOM_GLINK=y
CONFIG_RPMSG_QCOM_GLINK_RPM=y
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

CONFIG_SOUNDWIRE=y

#
# SoundWire Devices
#
CONFIG_SOUNDWIRE_QCOM=y

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# CONFIG_MESON_CANVAS is not set
# CONFIG_MESON_CLK_MEASURE is not set
# CONFIG_MESON_GX_SOCINFO is not set
# CONFIG_MESON_MX_SOCINFO is not set
# end of Amlogic SoC drivers

#
# Apple SoC drivers
#
# CONFIG_APPLE_RTKIT is not set
# CONFIG_APPLE_SART is not set
# end of Apple SoC drivers

#
# ASPEED SoC drivers
#
# CONFIG_ASPEED_LPC_CTRL is not set
# CONFIG_ASPEED_LPC_SNOOP is not set
# CONFIG_ASPEED_UART_ROUTING is not set
# CONFIG_ASPEED_P2A_CTRL is not set
# CONFIG_ASPEED_SOCINFO is not set
# end of ASPEED SoC drivers

CONFIG_AT91_SOC_ID=y
CONFIG_AT91_SOC_SFR=y

#
# Broadcom SoC drivers
#
# CONFIG_BCM2835_POWER is not set
# CONFIG_SOC_BCM63XX is not set
# CONFIG_SOC_BRCMSTB is not set
# CONFIG_BCM_PMB is not set
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
CONFIG_QUICC_ENGINE=y
CONFIG_DPAA2_CONSOLE=y
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# CONFIG_SOC_IMX8M is not set
# CONFIG_SOC_IMX9 is not set
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
# CONFIG_IXP4XX_QMGR is not set
# CONFIG_IXP4XX_NPE is not set
# end of IXP4xx SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
CONFIG_LITEX=y
CONFIG_LITEX_SOC_CONTROLLER=y
# end of Enable LiteX SoC Builder specific drivers

#
# MediaTek SoC drivers
#
# CONFIG_MTK_CMDQ is not set
# CONFIG_MTK_DEVAPC is not set
# CONFIG_MTK_INFRACFG is not set
# CONFIG_MTK_PMIC_WRAP is not set
# CONFIG_MTK_SCPSYS is not set
# CONFIG_MTK_MMSYS is not set
# end of MediaTek SoC drivers

#
# Qualcomm SoC drivers
#
# CONFIG_QCOM_COMMAND_DB is not set
# CONFIG_QCOM_GENI_SE is not set
# CONFIG_QCOM_GSBI is not set
# CONFIG_QCOM_LLCC is not set
# CONFIG_QCOM_RPMH is not set
# CONFIG_QCOM_SMD_RPM is not set
# CONFIG_QCOM_SPM is not set
# CONFIG_QCOM_WCNSS_CTRL is not set
# CONFIG_QCOM_APR is not set
# CONFIG_QCOM_ICC_BWMON is not set
# end of Qualcomm SoC drivers

# CONFIG_SOC_RENESAS is not set
# CONFIG_ROCKCHIP_GRF is not set
# CONFIG_ROCKCHIP_IODOMAIN is not set
# CONFIG_SOC_SAMSUNG is not set
# CONFIG_SOC_TI is not set
# CONFIG_UX500_SOC_ID is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_ADC_JACK=y
CONFIG_EXTCON_GPIO=y
# CONFIG_EXTCON_MAX3355 is not set
CONFIG_EXTCON_MAX77843=y
CONFIG_EXTCON_MAX8997=y
# CONFIG_EXTCON_PTN5150 is not set
# CONFIG_EXTCON_QCOM_SPMI_MISC is not set
CONFIG_EXTCON_RT8973A=y
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=y
CONFIG_EXTCON_USBC_CROS_EC=y
# CONFIG_MEMORY is not set
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
CONFIG_IIO_BUFFER_DMA=y
CONFIG_IIO_BUFFER_DMAENGINE=y
CONFIG_IIO_BUFFER_HW_CONSUMER=y
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=y
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=y
CONFIG_IIO_SW_TRIGGER=y
CONFIG_IIO_TRIGGERED_EVENT=y

#
# Accelerometers
#
CONFIG_ADIS16201=y
# CONFIG_ADIS16209 is not set
# CONFIG_ADXL313_I2C is not set
# CONFIG_ADXL313_SPI is not set
CONFIG_ADXL345=y
CONFIG_ADXL345_I2C=y
CONFIG_ADXL345_SPI=y
# CONFIG_ADXL355_I2C is not set
# CONFIG_ADXL355_SPI is not set
# CONFIG_ADXL367_SPI is not set
# CONFIG_ADXL367_I2C is not set
CONFIG_ADXL372=y
CONFIG_ADXL372_SPI=y
CONFIG_ADXL372_I2C=y
# CONFIG_BMA180 is not set
CONFIG_BMA220=y
CONFIG_BMA400=y
CONFIG_BMA400_I2C=y
CONFIG_BMA400_SPI=y
CONFIG_BMC150_ACCEL=y
CONFIG_BMC150_ACCEL_I2C=y
CONFIG_BMC150_ACCEL_SPI=y
CONFIG_BMI088_ACCEL=y
CONFIG_BMI088_ACCEL_SPI=y
CONFIG_DA280=y
CONFIG_DA311=y
# CONFIG_DMARD06 is not set
CONFIG_DMARD09=y
# CONFIG_DMARD10 is not set
CONFIG_FXLS8962AF=y
CONFIG_FXLS8962AF_I2C=y
CONFIG_FXLS8962AF_SPI=y
# CONFIG_IIO_CROS_EC_ACCEL_LEGACY is not set
CONFIG_IIO_ST_ACCEL_3AXIS=y
CONFIG_IIO_ST_ACCEL_I2C_3AXIS=y
CONFIG_IIO_ST_ACCEL_SPI_3AXIS=y
CONFIG_KXSD9=y
CONFIG_KXSD9_SPI=y
CONFIG_KXSD9_I2C=y
CONFIG_KXCJK1013=y
CONFIG_MC3230=y
CONFIG_MMA7455=y
CONFIG_MMA7455_I2C=y
# CONFIG_MMA7455_SPI is not set
# CONFIG_MMA7660 is not set
CONFIG_MMA8452=y
CONFIG_MMA9551_CORE=y
CONFIG_MMA9551=y
CONFIG_MMA9553=y
# CONFIG_MSA311 is not set
# CONFIG_MXC4005 is not set
CONFIG_MXC6255=y
# CONFIG_SCA3000 is not set
# CONFIG_SCA3300 is not set
# CONFIG_STK8312 is not set
# CONFIG_STK8BA50 is not set
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD_SIGMA_DELTA=y
# CONFIG_AD7091R5 is not set
CONFIG_AD7124=y
CONFIG_AD7192=y
# CONFIG_AD7266 is not set
# CONFIG_AD7280 is not set
CONFIG_AD7291=y
# CONFIG_AD7292 is not set
CONFIG_AD7298=y
CONFIG_AD7476=y
CONFIG_AD7606=y
# CONFIG_AD7606_IFACE_PARALLEL is not set
CONFIG_AD7606_IFACE_SPI=y
CONFIG_AD7766=y
CONFIG_AD7768_1=y
# CONFIG_AD7780 is not set
# CONFIG_AD7791 is not set
CONFIG_AD7793=y
# CONFIG_AD7887 is not set
CONFIG_AD7923=y
# CONFIG_AD7949 is not set
# CONFIG_AD799X is not set
CONFIG_AD9467=y
CONFIG_ADI_AXI_ADC=y
# CONFIG_ASPEED_ADC is not set
CONFIG_AT91_SAMA5D2_ADC=y
CONFIG_AXP20X_ADC=y
# CONFIG_AXP288_ADC is not set
# CONFIG_BCM_IPROC_ADC is not set
# CONFIG_BERLIN2_ADC is not set
CONFIG_DA9150_GPADC=y
# CONFIG_ENVELOPE_DETECTOR is not set
# CONFIG_EXYNOS_ADC is not set
# CONFIG_HI8435 is not set
CONFIG_HX711=y
# CONFIG_INGENIC_ADC is not set
# CONFIG_IMX7D_ADC is not set
# CONFIG_IMX8QXP_ADC is not set
# CONFIG_LPC18XX_ADC is not set
# CONFIG_LPC32XX_ADC is not set
# CONFIG_LTC2471 is not set
# CONFIG_LTC2485 is not set
# CONFIG_LTC2496 is not set
CONFIG_LTC2497=y
# CONFIG_MAX1027 is not set
CONFIG_MAX11100=y
CONFIG_MAX1118=y
# CONFIG_MAX11205 is not set
CONFIG_MAX1241=y
CONFIG_MAX1363=y
CONFIG_MAX9611=y
# CONFIG_MCP320X is not set
CONFIG_MCP3422=y
CONFIG_MCP3911=y
CONFIG_MEDIATEK_MT6360_ADC=y
# CONFIG_MEDIATEK_MT6577_AUXADC is not set
CONFIG_MEN_Z188_ADC=y
# CONFIG_MESON_SARADC is not set
CONFIG_MP2629_ADC=y
CONFIG_NAU7802=y
# CONFIG_NPCM_ADC is not set
CONFIG_QCOM_VADC_COMMON=y
CONFIG_QCOM_PM8XXX_XOADC=y
# CONFIG_RCAR_GYRO_ADC is not set
CONFIG_RN5T618_ADC=y
# CONFIG_ROCKCHIP_SARADC is not set
# CONFIG_RICHTEK_RTQ6056 is not set
# CONFIG_RZG2L_ADC is not set
# CONFIG_SC27XX_ADC is not set
# CONFIG_SPEAR_ADC is not set
CONFIG_SD_ADC_MODULATOR=y
CONFIG_STM32_DFSDM_CORE=y
CONFIG_STM32_DFSDM_ADC=y
CONFIG_STMPE_ADC=y
# CONFIG_TI_ADC081C is not set
CONFIG_TI_ADC0832=y
CONFIG_TI_ADC084S021=y
# CONFIG_TI_ADC12138 is not set
CONFIG_TI_ADC108S102=y
CONFIG_TI_ADC128S052=y
CONFIG_TI_ADC161S626=y
CONFIG_TI_ADS1015=y
CONFIG_TI_ADS7950=y
CONFIG_TI_ADS8344=y
CONFIG_TI_ADS8688=y
# CONFIG_TI_ADS124S08 is not set
CONFIG_TI_ADS131E08=y
CONFIG_TI_AM335X_ADC=y
# CONFIG_TI_TLC4541 is not set
CONFIG_TI_TSC2046=y
CONFIG_VF610_ADC=y
# CONFIG_XILINX_XADC is not set
# CONFIG_XILINX_AMS is not set
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
# CONFIG_AD74413R is not set
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
# CONFIG_IIO_RESCALE is not set
# end of Analog Front Ends

#
# Amplifiers
#
CONFIG_AD8366=y
# CONFIG_ADA4250 is not set
CONFIG_HMC425=y
# end of Amplifiers

#
# Capacitance to digital converters
#
CONFIG_AD7150=y
# CONFIG_AD7746 is not set
# end of Capacitance to digital converters

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=y
CONFIG_ATLAS_EZO_SENSOR=y
CONFIG_BME680=y
CONFIG_BME680_I2C=y
CONFIG_BME680_SPI=y
CONFIG_CCS811=y
# CONFIG_IAQCORE is not set
# CONFIG_PMS7003 is not set
# CONFIG_SCD30_CORE is not set
# CONFIG_SCD4X is not set
# CONFIG_SENSIRION_SGP30 is not set
CONFIG_SENSIRION_SGP40=y
CONFIG_SPS30=y
CONFIG_SPS30_I2C=y
CONFIG_SPS30_SERIAL=y
# CONFIG_SENSEAIR_SUNRISE_CO2 is not set
CONFIG_VZ89X=y
# end of Chemical Sensors

CONFIG_IIO_CROS_EC_SENSORS_CORE=y
# CONFIG_IIO_CROS_EC_SENSORS is not set
# CONFIG_IIO_CROS_EC_SENSORS_LID_ANGLE is not set

#
# Hid Sensor IIO Common
#
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=y

#
# IIO SCMI Sensors
#
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# CONFIG_IIO_SSP_SENSORS_COMMONS is not set
CONFIG_IIO_SSP_SENSORHUB=y
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=y
CONFIG_IIO_ST_SENSORS_SPI=y
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Digital to analog converters
#
# CONFIG_AD3552R is not set
CONFIG_AD5064=y
# CONFIG_AD5360 is not set
CONFIG_AD5380=y
CONFIG_AD5421=y
# CONFIG_AD5446 is not set
CONFIG_AD5449=y
CONFIG_AD5592R_BASE=y
CONFIG_AD5592R=y
# CONFIG_AD5593R is not set
CONFIG_AD5504=y
CONFIG_AD5624R_SPI=y
# CONFIG_LTC2688 is not set
CONFIG_AD5686=y
CONFIG_AD5686_SPI=y
CONFIG_AD5696_I2C=y
CONFIG_AD5755=y
# CONFIG_AD5758 is not set
# CONFIG_AD5761 is not set
CONFIG_AD5764=y
CONFIG_AD5766=y
CONFIG_AD5770R=y
CONFIG_AD5791=y
# CONFIG_AD7293 is not set
CONFIG_AD7303=y
CONFIG_AD8801=y
CONFIG_DPOT_DAC=y
# CONFIG_DS4424 is not set
# CONFIG_LPC18XX_DAC is not set
# CONFIG_LTC1660 is not set
# CONFIG_LTC2632 is not set
CONFIG_M62332=y
# CONFIG_MAX517 is not set
CONFIG_MAX5821=y
# CONFIG_MCP4725 is not set
CONFIG_MCP4922=y
CONFIG_TI_DAC082S085=y
CONFIG_TI_DAC5571=y
CONFIG_TI_DAC7311=y
CONFIG_TI_DAC7612=y
CONFIG_VF610_DAC=y
# end of Digital to analog converters

#
# IIO dummy driver
#
# CONFIG_IIO_SIMPLE_DUMMY is not set
# end of IIO dummy driver

#
# Filters
#
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
CONFIG_AD9523=y
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
CONFIG_ADF4350=y
CONFIG_ADF4371=y
# CONFIG_ADMV1013 is not set
# CONFIG_ADMV4420 is not set
# CONFIG_ADRF6780 is not set
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
# CONFIG_ADIS16080 is not set
# CONFIG_ADIS16130 is not set
# CONFIG_ADIS16136 is not set
CONFIG_ADIS16260=y
CONFIG_ADXRS290=y
# CONFIG_ADXRS450 is not set
CONFIG_BMG160=y
CONFIG_BMG160_I2C=y
CONFIG_BMG160_SPI=y
CONFIG_FXAS21002C=y
CONFIG_FXAS21002C_I2C=y
CONFIG_FXAS21002C_SPI=y
CONFIG_MPU3050=y
CONFIG_MPU3050_I2C=y
CONFIG_IIO_ST_GYRO_3AXIS=y
CONFIG_IIO_ST_GYRO_I2C_3AXIS=y
CONFIG_IIO_ST_GYRO_SPI_3AXIS=y
CONFIG_ITG3200=y
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4403=y
CONFIG_AFE4404=y
CONFIG_MAX30100=y
CONFIG_MAX30102=y
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
CONFIG_AM2315=y
# CONFIG_DHT11 is not set
CONFIG_HDC100X=y
# CONFIG_HDC2010 is not set
# CONFIG_HTS221 is not set
CONFIG_HTU21=y
CONFIG_SI7005=y
CONFIG_SI7020=y
# end of Humidity sensors

#
# Inertial measurement units
#
CONFIG_ADIS16400=y
CONFIG_ADIS16460=y
CONFIG_ADIS16475=y
# CONFIG_ADIS16480 is not set
CONFIG_BMI160=y
CONFIG_BMI160_I2C=y
CONFIG_BMI160_SPI=y
# CONFIG_BOSCH_BNO055_SERIAL is not set
# CONFIG_BOSCH_BNO055_I2C is not set
CONFIG_FXOS8700=y
CONFIG_FXOS8700_I2C=y
CONFIG_FXOS8700_SPI=y
CONFIG_KMX61=y
CONFIG_INV_ICM42600=y
CONFIG_INV_ICM42600_I2C=y
CONFIG_INV_ICM42600_SPI=y
CONFIG_INV_MPU6050_IIO=y
CONFIG_INV_MPU6050_I2C=y
CONFIG_INV_MPU6050_SPI=y
CONFIG_IIO_ST_LSM6DSX=y
CONFIG_IIO_ST_LSM6DSX_I2C=y
CONFIG_IIO_ST_LSM6DSX_SPI=y
CONFIG_IIO_ST_LSM6DSX_I3C=y
CONFIG_IIO_ST_LSM9DS0=y
CONFIG_IIO_ST_LSM9DS0_I2C=y
CONFIG_IIO_ST_LSM9DS0_SPI=y
# end of Inertial measurement units

CONFIG_IIO_ADIS_LIB=y
CONFIG_IIO_ADIS_LIB_BUFFER=y

#
# Light sensors
#
CONFIG_ADJD_S311=y
# CONFIG_ADUX1020 is not set
# CONFIG_AL3010 is not set
CONFIG_AL3320A=y
CONFIG_APDS9300=y
# CONFIG_APDS9960 is not set
# CONFIG_AS73211 is not set
CONFIG_BH1750=y
# CONFIG_BH1780 is not set
CONFIG_CM32181=y
# CONFIG_CM3232 is not set
# CONFIG_CM3323 is not set
# CONFIG_CM3605 is not set
CONFIG_CM36651=y
# CONFIG_IIO_CROS_EC_LIGHT_PROX is not set
# CONFIG_GP2AP002 is not set
CONFIG_GP2AP020A00F=y
# CONFIG_IQS621_ALS is not set
CONFIG_SENSORS_ISL29018=y
# CONFIG_SENSORS_ISL29028 is not set
CONFIG_ISL29125=y
CONFIG_JSA1212=y
CONFIG_RPR0521=y
CONFIG_LTR501=y
# CONFIG_LTRF216A is not set
# CONFIG_LV0104CS is not set
CONFIG_MAX44000=y
CONFIG_MAX44009=y
# CONFIG_NOA1305 is not set
CONFIG_OPT3001=y
CONFIG_PA12203001=y
# CONFIG_SI1133 is not set
CONFIG_SI1145=y
CONFIG_STK3310=y
# CONFIG_ST_UVIS25 is not set
CONFIG_TCS3414=y
# CONFIG_TCS3472 is not set
CONFIG_SENSORS_TSL2563=y
CONFIG_TSL2583=y
# CONFIG_TSL2591 is not set
CONFIG_TSL2772=y
CONFIG_TSL4531=y
CONFIG_US5182D=y
CONFIG_VCNL4000=y
# CONFIG_VCNL4035 is not set
# CONFIG_VEML6030 is not set
CONFIG_VEML6070=y
CONFIG_VL6180=y
CONFIG_ZOPT2201=y
# end of Light sensors

#
# Magnetometer sensors
#
# CONFIG_AK8974 is not set
CONFIG_AK8975=y
# CONFIG_AK09911 is not set
CONFIG_BMC150_MAGN=y
CONFIG_BMC150_MAGN_I2C=y
CONFIG_BMC150_MAGN_SPI=y
CONFIG_MAG3110=y
CONFIG_MMC35240=y
CONFIG_IIO_ST_MAGN_3AXIS=y
CONFIG_IIO_ST_MAGN_I2C_3AXIS=y
CONFIG_IIO_ST_MAGN_SPI_3AXIS=y
CONFIG_SENSORS_HMC5843=y
CONFIG_SENSORS_HMC5843_I2C=y
CONFIG_SENSORS_HMC5843_SPI=y
CONFIG_SENSORS_RM3100=y
CONFIG_SENSORS_RM3100_I2C=y
CONFIG_SENSORS_RM3100_SPI=y
CONFIG_YAMAHA_YAS530=y
# end of Magnetometer sensors

#
# Multiplexers
#
CONFIG_IIO_MUX=y
# end of Multiplexers

#
# Inclinometer sensors
#
# end of Inclinometer sensors

CONFIG_IIO_FORMAT_KUNIT_TEST=y

#
# Triggers - standalone
#
CONFIG_IIO_HRTIMER_TRIGGER=y
# CONFIG_IIO_INTERRUPT_TRIGGER is not set
CONFIG_IIO_STM32_LPTIMER_TRIGGER=y
# CONFIG_IIO_STM32_TIMER_TRIGGER is not set
# CONFIG_IIO_TIGHTLOOP_TRIGGER is not set
CONFIG_IIO_SYSFS_TRIGGER=y
# end of Triggers - standalone

#
# Linear and angular position sensors
#
CONFIG_IQS624_POS=y
# end of Linear and angular position sensors

#
# Digital potentiometers
#
CONFIG_AD5110=y
CONFIG_AD5272=y
CONFIG_DS1803=y
# CONFIG_MAX5432 is not set
CONFIG_MAX5481=y
CONFIG_MAX5487=y
CONFIG_MCP4018=y
CONFIG_MCP4131=y
CONFIG_MCP4531=y
CONFIG_MCP41010=y
CONFIG_TPL0102=y
# end of Digital potentiometers

#
# Digital potentiostats
#
# CONFIG_LMP91000 is not set
# end of Digital potentiostats

#
# Pressure sensors
#
# CONFIG_ABP060MG is not set
CONFIG_BMP280=y
CONFIG_BMP280_I2C=y
CONFIG_BMP280_SPI=y
CONFIG_IIO_CROS_EC_BARO=y
# CONFIG_DLHL60D is not set
CONFIG_DPS310=y
CONFIG_HP03=y
CONFIG_ICP10100=y
# CONFIG_MPL115_I2C is not set
# CONFIG_MPL115_SPI is not set
# CONFIG_MPL3115 is not set
# CONFIG_MS5611 is not set
CONFIG_MS5637=y
CONFIG_IIO_ST_PRESS=y
CONFIG_IIO_ST_PRESS_I2C=y
CONFIG_IIO_ST_PRESS_SPI=y
# CONFIG_T5403 is not set
# CONFIG_HP206C is not set
CONFIG_ZPA2326=y
CONFIG_ZPA2326_I2C=y
CONFIG_ZPA2326_SPI=y
# end of Pressure sensors

#
# Lightning sensors
#
# CONFIG_AS3935 is not set
# end of Lightning sensors

#
# Proximity and distance sensors
#
CONFIG_CROS_EC_MKBP_PROXIMITY=y
# CONFIG_ISL29501 is not set
# CONFIG_LIDAR_LITE_V2 is not set
CONFIG_MB1232=y
# CONFIG_PING is not set
CONFIG_RFD77402=y
# CONFIG_SRF04 is not set
CONFIG_SX_COMMON=y
CONFIG_SX9310=y
CONFIG_SX9324=y
# CONFIG_SX9360 is not set
# CONFIG_SX9500 is not set
CONFIG_SRF08=y
# CONFIG_VCNL3020 is not set
CONFIG_VL53L0X_I2C=y
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# CONFIG_AD2S90 is not set
CONFIG_AD2S1200=y
# end of Resolver to digital converters

#
# Temperature sensors
#
CONFIG_IQS620AT_TEMP=y
CONFIG_LTC2983=y
# CONFIG_MAXIM_THERMOCOUPLE is not set
# CONFIG_MLX90614 is not set
# CONFIG_MLX90632 is not set
CONFIG_TMP006=y
CONFIG_TMP007=y
CONFIG_TMP117=y
# CONFIG_TSYS01 is not set
CONFIG_TSYS02D=y
CONFIG_MAX31856=y
# CONFIG_MAX31865 is not set
# end of Temperature sensors

CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
CONFIG_PWM_ATMEL=y
# CONFIG_PWM_ATMEL_TCB is not set
# CONFIG_PWM_BCM_IPROC is not set
# CONFIG_PWM_BCM_KONA is not set
# CONFIG_PWM_BCM2835 is not set
# CONFIG_PWM_BERLIN is not set
# CONFIG_PWM_BRCMSTB is not set
# CONFIG_PWM_CLK is not set
# CONFIG_PWM_CLPS711X is not set
CONFIG_PWM_CROS_EC=y
# CONFIG_PWM_EP93XX is not set
# CONFIG_PWM_FSL_FTM is not set
# CONFIG_PWM_HIBVT is not set
# CONFIG_PWM_IMG is not set
# CONFIG_PWM_IMX1 is not set
# CONFIG_PWM_IMX27 is not set
# CONFIG_PWM_IMX_TPM is not set
# CONFIG_PWM_INTEL_LGM is not set
CONFIG_PWM_IQS620A=y
# CONFIG_PWM_JZ4740 is not set
# CONFIG_PWM_KEEMBAY is not set
CONFIG_PWM_LP3943=y
# CONFIG_PWM_LPC18XX_SCT is not set
# CONFIG_PWM_LPC32XX is not set
# CONFIG_PWM_LPSS_PLATFORM is not set
# CONFIG_PWM_MESON is not set
# CONFIG_PWM_MTK_DISP is not set
# CONFIG_PWM_MEDIATEK is not set
# CONFIG_PWM_MXS is not set
CONFIG_PWM_NTXEC=y
# CONFIG_PWM_OMAP_DMTIMER is not set
CONFIG_PWM_PCA9685=y
# CONFIG_PWM_PXA is not set
# CONFIG_PWM_RASPBERRYPI_POE is not set
# CONFIG_PWM_RCAR is not set
# CONFIG_PWM_RENESAS_TPU is not set
# CONFIG_PWM_ROCKCHIP is not set
# CONFIG_PWM_SAMSUNG is not set
# CONFIG_PWM_SIFIVE is not set
# CONFIG_PWM_SL28CPLD is not set
# CONFIG_PWM_SPEAR is not set
# CONFIG_PWM_SPRD is not set
# CONFIG_PWM_STI is not set
# CONFIG_PWM_STM32 is not set
# CONFIG_PWM_STM32_LP is not set
# CONFIG_PWM_STMPE is not set
# CONFIG_PWM_SUN4I is not set
# CONFIG_PWM_SUNPLUS is not set
# CONFIG_PWM_TEGRA is not set
# CONFIG_PWM_TIECAP is not set
# CONFIG_PWM_TIEHRPWM is not set
# CONFIG_PWM_VISCONTI is not set
# CONFIG_PWM_VT8500 is not set
# CONFIG_PWM_XILINX is not set

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
CONFIG_ARM_NVIC=y
CONFIG_AL_FIC=y
CONFIG_MADERA_IRQ=y
# CONFIG_JCORE_AIC is not set
# CONFIG_RENESAS_INTC_IRQPIN is not set
# CONFIG_RENESAS_IRQC is not set
# CONFIG_RENESAS_RZA1_IRQC is not set
# CONFIG_RENESAS_RZG2L_IRQC is not set
# CONFIG_SL28CPLD_INTC is not set
# CONFIG_TS4800_IRQ is not set
# CONFIG_XILINX_INTC is not set
# CONFIG_INGENIC_TCU_IRQ is not set
CONFIG_STM32_EXTI=y
# CONFIG_IRQ_UNIPHIER_AIDET is not set
# CONFIG_MESON_IRQ_GPIO is not set
# CONFIG_IMX_IRQSTEER is not set
# CONFIG_IMX_INTMUX is not set
# CONFIG_IMX_MU_MSI is not set
# CONFIG_EXYNOS_IRQ_COMBINER is not set
# CONFIG_MST_IRQ is not set
# CONFIG_MCHP_EIC is not set
# CONFIG_SUNPLUS_SP7021_INTC is not set
# end of IRQ chip support

CONFIG_IPACK_BUS=y
CONFIG_ARCH_HAS_RESET_CONTROLLER=y
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_A10SR is not set
# CONFIG_RESET_ATH79 is not set
# CONFIG_RESET_AXS10X is not set
# CONFIG_RESET_BCM6345 is not set
# CONFIG_RESET_BERLIN is not set
# CONFIG_RESET_BRCMSTB is not set
# CONFIG_RESET_BRCMSTB_RESCAL is not set
# CONFIG_RESET_HSDK is not set
# CONFIG_RESET_IMX7 is not set
# CONFIG_RESET_INTEL_GW is not set
# CONFIG_RESET_K210 is not set
# CONFIG_RESET_LANTIQ is not set
# CONFIG_RESET_LPC18XX is not set
# CONFIG_RESET_MCHP_SPARX5 is not set
# CONFIG_RESET_MESON is not set
# CONFIG_RESET_MESON_AUDIO_ARB is not set
# CONFIG_RESET_NPCM is not set
# CONFIG_RESET_PISTACHIO is not set
# CONFIG_RESET_QCOM_AOSS is not set
# CONFIG_RESET_QCOM_PDC is not set
# CONFIG_RESET_RASPBERRYPI is not set
# CONFIG_RESET_RZG2L_USBPHY_CTRL is not set
# CONFIG_RESET_SCMI is not set
CONFIG_RESET_SIMPLE=y
# CONFIG_RESET_SOCFPGA is not set
# CONFIG_RESET_STARFIVE_JH7100 is not set
# CONFIG_RESET_SUNPLUS is not set
# CONFIG_RESET_SUNXI is not set
# CONFIG_RESET_TI_SCI is not set
# CONFIG_RESET_TI_SYSCON is not set
# CONFIG_RESET_TI_TPS380X is not set
# CONFIG_RESET_TN48M_CPLD is not set
# CONFIG_RESET_UNIPHIER is not set
# CONFIG_RESET_UNIPHIER_GLUE is not set
# CONFIG_RESET_ZYNQ is not set
# CONFIG_COMMON_RESET_HI3660 is not set
# CONFIG_COMMON_RESET_HI6220 is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
# CONFIG_PHY_LPC18XX_USB_OTG is not set
# CONFIG_PHY_PISTACHIO_USB is not set
# CONFIG_PHY_XGENE is not set
CONFIG_PHY_CAN_TRANSCEIVER=y
# CONFIG_PHY_SUN6I_MIPI_DPHY is not set
# CONFIG_PHY_SUN50I_USB3 is not set
# CONFIG_PHY_MESON8_HDMI_TX is not set
# CONFIG_PHY_MESON_G12A_MIPI_DPHY_ANALOG is not set
# CONFIG_PHY_MESON_G12A_USB2 is not set
# CONFIG_PHY_MESON_G12A_USB3_PCIE is not set
# CONFIG_PHY_MESON_AXG_PCIE is not set
# CONFIG_PHY_MESON_AXG_MIPI_PCIE_ANALOG is not set
# CONFIG_PHY_MESON_AXG_MIPI_DPHY is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_PHY_BCM63XX_USBH is not set
# CONFIG_PHY_CYGNUS_PCIE is not set
# CONFIG_PHY_BCM_SR_USB is not set
# CONFIG_BCM_KONA_USB2_PHY is not set
# CONFIG_PHY_BCM_NS_USB2 is not set
# CONFIG_PHY_NS2_USB_DRD is not set
# CONFIG_PHY_BRCM_SATA is not set
# CONFIG_PHY_BRCM_USB is not set
# CONFIG_PHY_BCM_SR_PCIE is not set
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_CADENCE_TORRENT is not set
CONFIG_PHY_CADENCE_DPHY=y
# CONFIG_PHY_CADENCE_DPHY_RX is not set
CONFIG_PHY_CADENCE_SIERRA=y
CONFIG_PHY_CADENCE_SALVO=y
# CONFIG_PHY_FSL_IMX8MQ_USB is not set
# CONFIG_PHY_MIXEL_LVDS_PHY is not set
# CONFIG_PHY_MIXEL_MIPI_DPHY is not set
# CONFIG_PHY_FSL_IMX8M_PCIE is not set
# CONFIG_PHY_FSL_LYNX_28G is not set
# CONFIG_PHY_HI6220_USB is not set
# CONFIG_PHY_HI3660_USB is not set
# CONFIG_PHY_HI3670_USB is not set
# CONFIG_PHY_HI3670_PCIE is not set
# CONFIG_PHY_HISTB_COMBPHY is not set
# CONFIG_PHY_HISI_INNO_USB2 is not set
# CONFIG_PHY_LANTIQ_VRX200_PCIE is not set
# CONFIG_PHY_LANTIQ_RCU_USB2 is not set
# CONFIG_ARMADA375_USBCLUSTER_PHY is not set
# CONFIG_PHY_BERLIN_SATA is not set
# CONFIG_PHY_BERLIN_USB is not set
CONFIG_PHY_MVEBU_A3700_UTMI=y
# CONFIG_PHY_MVEBU_A38X_COMPHY is not set
CONFIG_PHY_PXA_28NM_HSIC=y
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_PXA_USB is not set
# CONFIG_PHY_MMP3_USB is not set
# CONFIG_PHY_MMP3_HSIC is not set
# CONFIG_PHY_MTK_PCIE is not set
# CONFIG_PHY_MTK_TPHY is not set
# CONFIG_PHY_MTK_UFS is not set
# CONFIG_PHY_MTK_XSPHY is not set
# CONFIG_PHY_MTK_HDMI is not set
# CONFIG_PHY_MTK_MIPI_DSI is not set
# CONFIG_PHY_MTK_DP is not set
# CONFIG_PHY_SPARX5_SERDES is not set
# CONFIG_PHY_LAN966X_SERDES is not set
CONFIG_PHY_OCELOT_SERDES=y
# CONFIG_PHY_ATH79_USB is not set
# CONFIG_PHY_QCOM_EDP is not set
# CONFIG_PHY_QCOM_IPQ4019_USB is not set
# CONFIG_PHY_QCOM_PCIE2 is not set
# CONFIG_PHY_QCOM_QMP is not set
# CONFIG_PHY_QCOM_QUSB2 is not set
# CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2 is not set
# CONFIG_PHY_QCOM_USB_HS_28NM is not set
# CONFIG_PHY_QCOM_USB_SS is not set
# CONFIG_PHY_QCOM_IPQ806X_USB is not set
# CONFIG_PHY_MT7621_PCI is not set
# CONFIG_PHY_RALINK_USB is not set
# CONFIG_PHY_RCAR_GEN3_USB3 is not set
# CONFIG_PHY_ROCKCHIP_DPHY_RX0 is not set
# CONFIG_PHY_ROCKCHIP_INNO_HDMI is not set
# CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY is not set
# CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY is not set
# CONFIG_PHY_ROCKCHIP_PCIE is not set
# CONFIG_PHY_ROCKCHIP_SNPS_PCIE3 is not set
# CONFIG_PHY_ROCKCHIP_TYPEC is not set
# CONFIG_PHY_EXYNOS_DP_VIDEO is not set
# CONFIG_PHY_EXYNOS_MIPI_VIDEO is not set
# CONFIG_PHY_EXYNOS_PCIE is not set
# CONFIG_PHY_SAMSUNG_UFS is not set
# CONFIG_PHY_SAMSUNG_USB2 is not set
# CONFIG_PHY_UNIPHIER_USB2 is not set
# CONFIG_PHY_UNIPHIER_USB3 is not set
# CONFIG_PHY_UNIPHIER_PCIE is not set
# CONFIG_PHY_UNIPHIER_AHCI is not set
# CONFIG_PHY_ST_SPEAR1310_MIPHY is not set
# CONFIG_PHY_ST_SPEAR1340_MIPHY is not set
# CONFIG_PHY_STIH407_USB is not set
CONFIG_PHY_STM32_USBPHYC=y
# CONFIG_PHY_SUNPLUS_USB is not set
# CONFIG_PHY_TEGRA194_P2U is not set
# CONFIG_PHY_DA8XX_USB is not set
# CONFIG_PHY_AM654_SERDES is not set
# CONFIG_PHY_J721E_WIZ is not set
# CONFIG_OMAP_CONTROL_PHY is not set
# CONFIG_TI_PIPE3 is not set
# CONFIG_PHY_INTEL_KEEMBAY_EMMC is not set
# CONFIG_PHY_INTEL_KEEMBAY_USB is not set
# CONFIG_PHY_INTEL_LGM_COMBO is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# CONFIG_PHY_INTEL_THUNDERBAY_EMMC is not set
# CONFIG_PHY_XILINX_ZYNQMP is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_DTPM=y
CONFIG_MCB=y
CONFIG_MCB_LPC=y
CONFIG_RAS=y

#
# Android
#
# end of Android

CONFIG_DAX=y
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
# CONFIG_NVMEM_APPLE_EFUSES is not set
# CONFIG_NVMEM_BCM_OCOTP is not set
# CONFIG_NVMEM_BRCM_NVRAM is not set
# CONFIG_NVMEM_IMX_IIM is not set
# CONFIG_NVMEM_IMX_OCOTP is not set
# CONFIG_NVMEM_JZ4780_EFUSE is not set
# CONFIG_NVMEM_LAN9662_OTPC is not set
# CONFIG_NVMEM_LAYERSCAPE_SFP is not set
# CONFIG_NVMEM_LPC18XX_EEPROM is not set
# CONFIG_NVMEM_LPC18XX_OTP is not set
# CONFIG_NVMEM_MESON_MX_EFUSE is not set
# CONFIG_NVMEM_MICROCHIP_OTPC is not set
# CONFIG_NVMEM_MTK_EFUSE is not set
# CONFIG_NVMEM_MXS_OCOTP is not set
# CONFIG_NVMEM_NINTENDO_OTP is not set
# CONFIG_NVMEM_QCOM_QFPROM is not set
CONFIG_NVMEM_RMEM=y
# CONFIG_NVMEM_ROCKCHIP_EFUSE is not set
# CONFIG_NVMEM_ROCKCHIP_OTP is not set
# CONFIG_NVMEM_SC27XX_EFUSE is not set
# CONFIG_NVMEM_SNVS_LPGPR is not set
# CONFIG_NVMEM_SPRD_EFUSE is not set
CONFIG_NVMEM_STM32_ROMEM=y
# CONFIG_NVMEM_SUNPLUS_OCOTP is not set
# CONFIG_NVMEM_U_BOOT_ENV is not set
# CONFIG_NVMEM_UNIPHIER_EFUSE is not set
# CONFIG_NVMEM_VF610_OCOTP is not set

#
# HW tracing support
#
CONFIG_STM=y
# CONFIG_STM_PROTO_BASIC is not set
CONFIG_STM_PROTO_SYS_T=y
CONFIG_STM_DUMMY=y
# CONFIG_STM_SOURCE_CONSOLE is not set
CONFIG_STM_SOURCE_HEARTBEAT=y
CONFIG_INTEL_TH=y
CONFIG_INTEL_TH_GTH=y
CONFIG_INTEL_TH_STH=y
# CONFIG_INTEL_TH_MSU is not set
CONFIG_INTEL_TH_PTI=y
# CONFIG_INTEL_TH_DEBUG is not set
# end of HW tracing support

CONFIG_FPGA=y
# CONFIG_FPGA_MGR_SOCFPGA is not set
# CONFIG_FPGA_MGR_SOCFPGA_A10 is not set
# CONFIG_ALTERA_PR_IP_CORE is not set
CONFIG_FPGA_MGR_ALTERA_PS_SPI=y
# CONFIG_FPGA_MGR_ZYNQ_FPGA is not set
# CONFIG_FPGA_MGR_XILINX_SPI is not set
# CONFIG_FPGA_MGR_ICE40_SPI is not set
CONFIG_FPGA_MGR_MACHXO2_SPI=y
CONFIG_FPGA_BRIDGE=y
CONFIG_ALTERA_FREEZE_BRIDGE=y
CONFIG_XILINX_PR_DECOUPLER=y
CONFIG_FPGA_REGION=y
# CONFIG_OF_FPGA_REGION is not set
# CONFIG_FPGA_DFL is not set
# CONFIG_FPGA_MGR_ZYNQMP_FPGA is not set
# CONFIG_FPGA_MGR_VERSAL_FPGA is not set
# CONFIG_FPGA_MGR_MICROCHIP_SPI is not set
CONFIG_FSI=y
CONFIG_FSI_NEW_DEV_NODE=y
# CONFIG_FSI_MASTER_GPIO is not set
CONFIG_FSI_MASTER_HUB=y
# CONFIG_FSI_MASTER_ASPEED is not set
# CONFIG_FSI_SCOM is not set
CONFIG_FSI_SBEFIFO=y
# CONFIG_FSI_OCC is not set
# CONFIG_TEE is not set
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
# CONFIG_MUX_ADG792A is not set
CONFIG_MUX_ADGS1408=y
CONFIG_MUX_GPIO=y
CONFIG_MUX_MMIO=y
# end of Multiplexer drivers

CONFIG_PM_OPP=y
CONFIG_SIOX=y
# CONFIG_SIOX_BUS_GPIO is not set
CONFIG_SLIMBUS=y
CONFIG_SLIM_QCOM_CTRL=y
# CONFIG_SLIM_QCOM_NGD_CTRL is not set
CONFIG_INTERCONNECT=y
# CONFIG_INTERCONNECT_IMX is not set
# CONFIG_INTERCONNECT_QCOM_OSM_L3 is not set
# CONFIG_INTERCONNECT_SAMSUNG is not set
CONFIG_COUNTER=y
# CONFIG_104_QUAD_8 is not set
# CONFIG_INTERRUPT_CNT is not set
CONFIG_STM32_TIMER_CNT=y
# CONFIG_STM32_LPTIMER_CNT is not set
# CONFIG_TI_EQEP is not set
# CONFIG_FTM_QUADDEC is not set
# CONFIG_MICROCHIP_TCB_CAPTURE is not set
# CONFIG_TI_ECAP_CAPTURE is not set
# CONFIG_MOST is not set
# CONFIG_PECI is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
CONFIG_VALIDATE_FS_PARSER=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
CONFIG_FS_VERITY=y
CONFIG_FS_VERITY_DEBUG=y
# CONFIG_FS_VERITY_BUILTIN_SIGNATURES is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
CONFIG_PRINT_QUOTA_WARNING=y
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
# CONFIG_FUSE_FS is not set
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
# CONFIG_FSCACHE is not set
# end of Caches

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_CHILDREN=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=y
CONFIG_NLS_CODEPAGE_775=y
# CONFIG_NLS_CODEPAGE_850 is not set
# CONFIG_NLS_CODEPAGE_852 is not set
CONFIG_NLS_CODEPAGE_855=y
# CONFIG_NLS_CODEPAGE_857 is not set
CONFIG_NLS_CODEPAGE_860=y
# CONFIG_NLS_CODEPAGE_861 is not set
CONFIG_NLS_CODEPAGE_862=y
CONFIG_NLS_CODEPAGE_863=y
CONFIG_NLS_CODEPAGE_864=y
# CONFIG_NLS_CODEPAGE_865 is not set
# CONFIG_NLS_CODEPAGE_866 is not set
CONFIG_NLS_CODEPAGE_869=y
CONFIG_NLS_CODEPAGE_936=y
CONFIG_NLS_CODEPAGE_950=y
CONFIG_NLS_CODEPAGE_932=y
CONFIG_NLS_CODEPAGE_949=y
# CONFIG_NLS_CODEPAGE_874 is not set
CONFIG_NLS_ISO8859_8=y
# CONFIG_NLS_CODEPAGE_1250 is not set
CONFIG_NLS_CODEPAGE_1251=y
# CONFIG_NLS_ASCII is not set
# CONFIG_NLS_ISO8859_1 is not set
CONFIG_NLS_ISO8859_2=y
CONFIG_NLS_ISO8859_3=y
CONFIG_NLS_ISO8859_4=y
CONFIG_NLS_ISO8859_5=y
CONFIG_NLS_ISO8859_6=y
# CONFIG_NLS_ISO8859_7 is not set
CONFIG_NLS_ISO8859_9=y
# CONFIG_NLS_ISO8859_13 is not set
# CONFIG_NLS_ISO8859_14 is not set
CONFIG_NLS_ISO8859_15=y
CONFIG_NLS_KOI8_R=y
CONFIG_NLS_KOI8_U=y
CONFIG_NLS_MAC_ROMAN=y
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=y
CONFIG_NLS_MAC_CROATIAN=y
CONFIG_NLS_MAC_CYRILLIC=y
CONFIG_NLS_MAC_GAELIC=y
# CONFIG_NLS_MAC_GREEK is not set
CONFIG_NLS_MAC_ICELAND=y
CONFIG_NLS_MAC_INUIT=y
CONFIG_NLS_MAC_ROMANIAN=y
CONFIG_NLS_MAC_TURKISH=y
CONFIG_NLS_UTF8=y
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
# CONFIG_PERSISTENT_KEYRINGS is not set
# CONFIG_TRUSTED_KEYS is not set
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_KEY_NOTIFICATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
# CONFIG_SECURITY is not set
CONFIG_SECURITYFS=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
# CONFIG_HARDENED_USERCOPY is not set
CONFIG_FORTIFY_SOURCE=y
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
CONFIG_INIT_STACK_ALL_PATTERN=y
# CONFIG_INIT_STACK_ALL_ZERO is not set
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
CONFIG_ZERO_CALL_USED_REGS=y
# end of Memory initialization

# CONFIG_RANDSTRUCT_NONE is not set
CONFIG_RANDSTRUCT_FULL=y
# CONFIG_RANDSTRUCT_PERFORMANCE is not set
CONFIG_RANDSTRUCT=y
CONFIG_GCC_PLUGIN_RANDSTRUCT=y
# end of Kernel hardening options
# end of Security options

CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_ENGINE=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_ECDSA=y
# CONFIG_CRYPTO_ECRDSA is not set
CONFIG_CRYPTO_SM2=y
# CONFIG_CRYPTO_CURVE25519 is not set
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
CONFIG_CRYPTO_ANUBIS=y
# CONFIG_CRYPTO_ARIA is not set
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
# CONFIG_CRYPTO_CAMELLIA is not set
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_FCRYPT=y
CONFIG_CRYPTO_KHAZAD=y
CONFIG_CRYPTO_SEED=y
CONFIG_CRYPTO_SERPENT=y
# CONFIG_CRYPTO_SM4_GENERIC is not set
CONFIG_CRYPTO_TEA=y
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
CONFIG_CRYPTO_ADIANTUM=y
CONFIG_CRYPTO_ARC4=y
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_HCTR2 is not set
# CONFIG_CRYPTO_KEYWRAP is not set
# CONFIG_CRYPTO_LRW is not set
# CONFIG_CRYPTO_OFB is not set
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_NHPOLY1305=y
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
CONFIG_CRYPTO_AEGIS128=y
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=y
# CONFIG_CRYPTO_SEQIV is not set
CONFIG_CRYPTO_ECHAINIV=y
CONFIG_CRYPTO_ESSIV=y
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=y
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
# CONFIG_CRYPTO_MICHAEL_MIC is not set
CONFIG_CRYPTO_POLY1305=y
# CONFIG_CRYPTO_RMD160 is not set
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
CONFIG_CRYPTO_SM3=y
# CONFIG_CRYPTO_SM3_GENERIC is not set
CONFIG_CRYPTO_STREEBOG=y
CONFIG_CRYPTO_VMAC=y
CONFIG_CRYPTO_WP512=y
CONFIG_CRYPTO_XCBC=y
CONFIG_CRYPTO_XXHASH=y
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
# CONFIG_CRYPTO_CRC32 is not set
CONFIG_CRYPTO_CRCT10DIF=y
# CONFIG_CRYPTO_CRC64_ROCKSOFT is not set
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=y
CONFIG_CRYPTO_LZ4=y
# CONFIG_CRYPTO_LZ4HC is not set
CONFIG_CRYPTO_ZSTD=y
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_ANSI_CPRNG=y
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
CONFIG_CRYPTO_USER_API_SKCIPHER=y
# CONFIG_CRYPTO_USER_API_RNG is not set
CONFIG_CRYPTO_USER_API_AEAD=y
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (arm)
#
# CONFIG_CRYPTO_POLY1305_ARM is not set
# CONFIG_CRYPTO_BLAKE2S_ARM is not set
# CONFIG_CRYPTO_SHA1_ARM is not set
# CONFIG_CRYPTO_AES_ARM is not set
# CONFIG_CRYPTO_CHACHA20_NEON is not set
# end of Accelerated Cryptographic Algorithms for CPU (arm)

CONFIG_CRYPTO_HW=y
# CONFIG_CRYPTO_DEV_ALLWINNER is not set
# CONFIG_CRYPTO_DEV_EXYNOS_RNG is not set
# CONFIG_CRYPTO_DEV_S5P is not set
# CONFIG_CRYPTO_DEV_ATMEL_AES is not set
# CONFIG_CRYPTO_DEV_ATMEL_TDES is not set
CONFIG_CRYPTO_DEV_ATMEL_SHA=y
CONFIG_CRYPTO_DEV_ATMEL_I2C=y
CONFIG_CRYPTO_DEV_ATMEL_ECC=y
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
# CONFIG_CRYPTO_DEV_QCE is not set
# CONFIG_CRYPTO_DEV_QCOM_RNG is not set
# CONFIG_CRYPTO_DEV_IMGTEC_HASH is not set
# CONFIG_CRYPTO_DEV_ZYNQMP_AES is not set
# CONFIG_CRYPTO_DEV_ZYNQMP_SHA3 is not set
CONFIG_CRYPTO_DEV_VIRTIO=y
# CONFIG_CRYPTO_DEV_STM32_CRC is not set
CONFIG_CRYPTO_DEV_STM32_HASH=y
# CONFIG_CRYPTO_DEV_STM32_CRYP is not set
CONFIG_CRYPTO_DEV_SAFEXCEL=y
# CONFIG_CRYPTO_DEV_ARTPEC6 is not set
# CONFIG_CRYPTO_DEV_CCREE is not set
# CONFIG_CRYPTO_DEV_HISI_SEC is not set
CONFIG_CRYPTO_DEV_AMLOGIC_GXL=y
CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG=y
# CONFIG_CRYPTO_DEV_SA2UL is not set
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4 is not set
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_ECC is not set
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_HCU is not set
# CONFIG_CRYPTO_DEV_ASPEED is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=y
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
CONFIG_SIGNED_PE_FILE_VERIFICATION=y
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
CONFIG_SYSTEM_EXTRA_CERTIFICATE=y
CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE=4096
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
CONFIG_SYSTEM_REVOCATION_LIST=y
CONFIG_SYSTEM_REVOCATION_KEYS=""
# CONFIG_SYSTEM_BLACKLIST_AUTH_UPDATE is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_HAVE_ARCH_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=y
CONFIG_PRIME_NUMBERS=y
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519=y
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=9
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=y
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=y
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
# CONFIG_CRC64_ROCKSOFT is not set
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
CONFIG_CRC32_BIT=y
CONFIG_CRC64=y
CONFIG_CRC4=y
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
CONFIG_RANDOM32_SELFTEST=y
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
# CONFIG_XZ_DEC_X86 is not set
CONFIG_XZ_DEC_POWERPC=y
# CONFIG_XZ_DEC_IA64 is not set
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_TEST=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_BCH=y
CONFIG_BCH_CONST_PARAMS=y
CONFIG_TEXTSEARCH=y
CONFIG_TEXTSEARCH_KMP=y
CONFIG_TEXTSEARCH_BM=y
CONFIG_TEXTSEARCH_FSM=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_DMA_DECLARE_COHERENT=y
CONFIG_ARCH_HAS_SETUP_DMA_OPS=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU=y
CONFIG_DMA_NONCOHERENT_MMAP=y
CONFIG_DMA_GLOBAL_POOL=y
CONFIG_DMA_API_DEBUG=y
CONFIG_DMA_API_DEBUG_SG=y
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_GENERIC_ATOMIC64=y
CONFIG_CLZ_TAB=y
# CONFIG_IRQ_POLL is not set
CONFIG_MPILIB=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
CONFIG_STACKDEPOT=y
# CONFIG_PARMAN is not set
# CONFIG_OBJAGG is not set
# end of Library routines

CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_SYMBOLIC_ERRNAME is not set
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
# CONFIG_DEBUG_MISC is not set

#
# Compile-time checks and compiler options
#
CONFIG_AS_HAS_NON_CONST_LEB128=y
CONFIG_DEBUG_INFO_NONE=y
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_FRAME_WARN=2048
CONFIG_STRIP_ASM_SYMS=y
CONFIG_READABLE_ASM=y
CONFIG_HEADERS_INSTALL=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_VMLINUX_MAP=y
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
# CONFIG_MAGIC_SYSRQ is not set
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_UBSAN=y
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ONLY_BOUNDS=y
CONFIG_UBSAN_SHIFT=y
CONFIG_UBSAN_DIV_ZERO=y
CONFIG_UBSAN_UNREACHABLE=y
CONFIG_UBSAN_BOOL=y
CONFIG_UBSAN_ENUM=y
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# CONFIG_DEBUG_NET is not set
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
CONFIG_DEBUG_PAGEALLOC=y
CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=y
# CONFIG_SLUB_DEBUG is not set
CONFIG_PAGE_OWNER=y
CONFIG_PAGE_POISONING=y
CONFIG_DEBUG_OBJECTS=y
CONFIG_DEBUG_OBJECTS_SELFTEST=y
CONFIG_DEBUG_OBJECTS_FREE=y
CONFIG_DEBUG_OBJECTS_TIMERS=y
CONFIG_DEBUG_OBJECTS_WORK=y
# CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
# CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
# CONFIG_SHRINKER_DEBUG is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
CONFIG_DEBUG_STACK_USAGE=y
CONFIG_SCHED_STACK_END_CHECK=y
CONFIG_DEBUG_VM_IRQSOFF=y
CONFIG_DEBUG_VM=y
# CONFIG_DEBUG_VM_MAPLE_TREE is not set
# CONFIG_DEBUG_VM_RB is not set
# CONFIG_DEBUG_VM_PGFLAGS is not set
CONFIG_DEBUG_NOMMU_REGIONS=y
# CONFIG_DEBUG_MEMORY_INIT is not set
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
# CONFIG_SOFTLOCKUP_DETECTOR is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
CONFIG_BOOTPARAM_HUNG_TASK_PANIC=y
# CONFIG_WQ_WATCHDOG is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
# CONFIG_SCHEDSTATS is not set
# end of Scheduler Debugging

CONFIG_DEBUG_TIMEKEEPING=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_DEBUG_RT_MUTEXES=y
# CONFIG_DEBUG_SPINLOCK is not set
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_RWSEMS=y
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
# CONFIG_LOCK_TORTURE_TEST is not set
CONFIG_WW_MUTEX_SELFTEST=y
CONFIG_SCF_TORTURE_TEST=y
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_DEBUG_IRQFLAGS=y
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set
CONFIG_DEBUG_KOBJECT_RELEASE=y

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
CONFIG_DEBUG_SG=y
CONFIG_DEBUG_NOTIFIERS=y
CONFIG_BUG_ON_DATA_CORRUPTION=y
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=y
CONFIG_RCU_SCALE_TEST=y
CONFIG_RCU_TORTURE_TEST=y
CONFIG_RCU_REF_SCALE_TEST=y
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_LATENCYTOP is not set
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
# CONFIG_SAMPLES is not set

#
# arm Debugging
#
CONFIG_UNWINDER_ARM=y
CONFIG_ARM_UNWIND=y
# CONFIG_BACKTRACE_VERBOSE is not set
# CONFIG_DEBUG_USER is not set
# CONFIG_DEBUG_LL is not set
CONFIG_DEBUG_LL_INCLUDE="mach/debug-macro.S"
CONFIG_UNCOMPRESS_INCLUDE="debug/uncompress.h"
# CONFIG_CORESIGHT is not set
# end of arm Debugging

#
# Kernel Testing and Coverage
#
CONFIG_KUNIT=y
CONFIG_KUNIT_DEBUGFS=y
CONFIG_KUNIT_TEST=y
CONFIG_KUNIT_EXAMPLE_TEST=y
CONFIG_KUNIT_ALL_TESTS=y
CONFIG_KUNIT_DEFAULT_ENABLED=y
CONFIG_NOTIFIER_ERROR_INJECTION=y
CONFIG_NETDEV_NOTIFIER_ERROR_INJECT=y
CONFIG_FAULT_INJECTION=y
CONFIG_FAILSLAB=y
# CONFIG_FAIL_PAGE_ALLOC is not set
CONFIG_FAULT_INJECTION_USERCOPY=y
CONFIG_FAIL_FUTEX=y
CONFIG_FAULT_INJECTION_DEBUG_FS=y
# CONFIG_FAIL_MMC_REQUEST is not set
# CONFIG_FAULT_INJECTION_STACKTRACE_FILTER is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_KCOV=y
# CONFIG_KCOV_ENABLE_COMPARISONS is not set
# CONFIG_KCOV_INSTRUMENT_ALL is not set
CONFIG_KCOV_IRQ_AREA_SIZE=0x40000
# CONFIG_RUNTIME_TESTING_MENU is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking

# CONFIG_WARN_MISSING_DOCUMENTS is not set
# CONFIG_WARN_ABI_ERRORS is not set
# end of Kernel hacking

--LFPHK5Hplgf6z90w--
