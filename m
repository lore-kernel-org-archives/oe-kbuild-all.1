Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DD43EBF32
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 11:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770378298; cv=none; b=gN08lh64NvBWLYb6WfnrJWQIu+bRxlsW2vtJOz16tvo+Yu6S0JaBkyMPQpSof6YxxeycKdeTYQccZu2w3Am2EEHmAksoUZvjI+/tiMmJq1B9mQ/wHwzaqcwd2ryoHXrCvvIsccEMZyR5Mp88wjq5fNkBthsA9Cswpj7U+KRJX28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770378298; c=relaxed/simple;
	bh=qiRc0iK21shElh9phKw7GFQuUwZ4YLKIyUJPW8lN+VQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H4MmB3UF3MsC7XH/EV4FBZrOLw3Tp6XILlxEm/RVxyk9lyr8tdVph6QHKda9rgFn9uwXOk5dRO7X/g12iAP1D6vWqYbiKBMffXDZRdAva7BmQbXBo1DboTrdC82j0/nmtGOhphQT4CbEcX1jtQySj39SWdhGaoEcuf3piBWw3ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+T17ajT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+T17ajT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770378297; x=1801914297;
  h=date:from:to:cc:subject:message-id;
  bh=qiRc0iK21shElh9phKw7GFQuUwZ4YLKIyUJPW8lN+VQ=;
  b=S+T17ajT4cbu+onJPjsTbNsh60pv2fPM0X3iEbobARgWIGRN3mdmQ4OS
   gAl4eIOzvxvS1kIGMW5Y7Jq8gbvK8d4IozsdQ/spuzaKC5RdS5TjLHa4h
   pizaqn1YJoA6ZbmtaA2A+oT3ajy45sYsMOmozA5DxpPB7JSt0bfAHDAMz
   R/X1YZtHE4lYdHWPp7faZ1eCAxJ2trW32uTiGyP9dK3CBP7d9FjE4O9xN
   nNTWOofl1HWwtUHAVRgE+fFkokjo1AZ0t0lYa5SJ5LOPvoIYZpYnQgerS
   3CTUNTx7evsYf1jP+yz/1ORCjrMTjlfUqe50VlkJ/jOP4PT2t8JbSbszt
   w==;
X-CSE-ConnectionGUID: ga2RdkTeTn6LX8qY5fE+Zg==
X-CSE-MsgGUID: UHprZ3M6S+uhYbFSWNlGKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="89008745"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="89008745"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 03:44:57 -0800
X-CSE-ConnectionGUID: jHWHS492SK+ue+FrxfsxNA==
X-CSE-MsgGUID: IsiZGZnZQo2DJa3r/WsP2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="210893077"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Feb 2026 03:44:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voKGb-00000000khk-1CPS;
	Fri, 06 Feb 2026 11:44:53 +0000
Date: Fri, 06 Feb 2026 19:43:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 12/12]
 drivers/soc/fsl/qe/qmc.c:1958:23: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202602061902.AeOYbVUa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   6b1c42d783637b473efce598dce9deab5c10ed42
commit: 6b1c42d783637b473efce598dce9deab5c10ed42 [12/12] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: powerpc64-randconfig-r122-20260206 (https://download.01.org/0day-ci/archive/20260206/202602061902.AeOYbVUa-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602061902.AeOYbVUa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602061902.AeOYbVUa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/fsl/qe/qmc.c:1958:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table @@     got void * @@
   drivers/soc/fsl/qe/qmc.c:1958:23: sparse:     expected struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table
   drivers/soc/fsl/qe/qmc.c:1958:23: sparse:     got void *
>> drivers/soc/fsl/qe/qmc.c:1964:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table @@
   drivers/soc/fsl/qe/qmc.c:1964:19: sparse:     expected void *
   drivers/soc/fsl/qe/qmc.c:1964:19: sparse:     got struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table
>> drivers/soc/fsl/qe/qmc.c:1970:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned short [noderef] [usertype] __iomem *int_table @@     got void * @@
   drivers/soc/fsl/qe/qmc.c:1970:24: sparse:     expected unsigned short [noderef] [usertype] __iomem *int_table
   drivers/soc/fsl/qe/qmc.c:1970:24: sparse:     got void *
>> drivers/soc/fsl/qe/qmc.c:1976:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got unsigned short [noderef] [usertype] __iomem *int_table @@
   drivers/soc/fsl/qe/qmc.c:1976:19: sparse:     expected void *
   drivers/soc/fsl/qe/qmc.c:1976:19: sparse:     got unsigned short [noderef] [usertype] __iomem *int_table

vim +1958 drivers/soc/fsl/qe/qmc.c

de5fdb7d14b34f Herve Codina 2024-08-08  1909  
3178d58e0b9772 Herve Codina 2023-02-17  1910  static int qmc_probe(struct platform_device *pdev)
3178d58e0b9772 Herve Codina 2023-02-17  1911  {
3178d58e0b9772 Herve Codina 2023-02-17  1912  	struct device_node *np = pdev->dev.of_node;
3178d58e0b9772 Herve Codina 2023-02-17  1913  	unsigned int nb_chans;
3178d58e0b9772 Herve Codina 2023-02-17  1914  	struct qmc *qmc;
3178d58e0b9772 Herve Codina 2023-02-17  1915  	int irq;
3178d58e0b9772 Herve Codina 2023-02-17  1916  	int ret;
3178d58e0b9772 Herve Codina 2023-02-17  1917  
3178d58e0b9772 Herve Codina 2023-02-17  1918  	qmc = devm_kzalloc(&pdev->dev, sizeof(*qmc), GFP_KERNEL);
3178d58e0b9772 Herve Codina 2023-02-17  1919  	if (!qmc)
3178d58e0b9772 Herve Codina 2023-02-17  1920  		return -ENOMEM;
3178d58e0b9772 Herve Codina 2023-02-17  1921  
3178d58e0b9772 Herve Codina 2023-02-17  1922  	qmc->dev = &pdev->dev;
d23ae9f1815e89 Herve Codina 2024-08-08  1923  	qmc->data = of_device_get_match_data(&pdev->dev);
d23ae9f1815e89 Herve Codina 2024-08-08  1924  	if (!qmc->data) {
d23ae9f1815e89 Herve Codina 2024-08-08  1925  		dev_err(qmc->dev, "Missing match data\n");
d23ae9f1815e89 Herve Codina 2024-08-08  1926  		return -EINVAL;
d23ae9f1815e89 Herve Codina 2024-08-08  1927  	}
3178d58e0b9772 Herve Codina 2023-02-17  1928  	INIT_LIST_HEAD(&qmc->chan_head);
3178d58e0b9772 Herve Codina 2023-02-17  1929  
a13bf605342ea9 Herve Codina 2024-08-08  1930  	qmc->tsa_serial = devm_tsa_serial_get_byphandle(qmc->dev, np, "fsl,tsa-serial");
a13bf605342ea9 Herve Codina 2024-08-08  1931  	if (IS_ERR(qmc->tsa_serial)) {
a13bf605342ea9 Herve Codina 2024-08-08  1932  		return dev_err_probe(qmc->dev, PTR_ERR(qmc->tsa_serial),
a13bf605342ea9 Herve Codina 2024-08-08  1933  				     "Failed to get TSA serial\n");
a13bf605342ea9 Herve Codina 2024-08-08  1934  	}
a13bf605342ea9 Herve Codina 2024-08-08  1935  
727b3ab490a5f5 Herve Codina 2024-08-08  1936  	ret = qmc_init_resources(qmc, pdev);
727b3ab490a5f5 Herve Codina 2024-08-08  1937  	if (ret)
727b3ab490a5f5 Herve Codina 2024-08-08  1938  		return ret;
3178d58e0b9772 Herve Codina 2023-02-17  1939  
8655b76b7004d5 Herve Codina 2024-08-08  1940  	if (qmc_is_qe(qmc)) {
8655b76b7004d5 Herve Codina 2024-08-08  1941  		ret = qmc_qe_soft_qmc_init(qmc, np);
8655b76b7004d5 Herve Codina 2024-08-08  1942  		if (ret)
8655b76b7004d5 Herve Codina 2024-08-08  1943  			return ret;
8655b76b7004d5 Herve Codina 2024-08-08  1944  	}
8655b76b7004d5 Herve Codina 2024-08-08  1945  
3178d58e0b9772 Herve Codina 2023-02-17  1946  	/* Parse channels informationss */
3178d58e0b9772 Herve Codina 2023-02-17  1947  	ret = qmc_of_parse_chans(qmc, np);
3178d58e0b9772 Herve Codina 2023-02-17  1948  	if (ret)
a13bf605342ea9 Herve Codina 2024-08-08  1949  		return ret;
3178d58e0b9772 Herve Codina 2023-02-17  1950  
3178d58e0b9772 Herve Codina 2023-02-17  1951  	nb_chans = qmc_nb_chans(qmc);
3178d58e0b9772 Herve Codina 2023-02-17  1952  
3178d58e0b9772 Herve Codina 2023-02-17  1953  	/*
3178d58e0b9772 Herve Codina 2023-02-17  1954  	 * Allocate the buffer descriptor table
3178d58e0b9772 Herve Codina 2023-02-17  1955  	 * 8 rx and 8 tx descriptors per channel
3178d58e0b9772 Herve Codina 2023-02-17  1956  	 */
3178d58e0b9772 Herve Codina 2023-02-17  1957  	qmc->bd_size = (nb_chans * (QMC_NB_TXBDS + QMC_NB_RXBDS)) * sizeof(cbd_t);
3178d58e0b9772 Herve Codina 2023-02-17 @1958  	qmc->bd_table = dmam_alloc_coherent(qmc->dev, qmc->bd_size,
3178d58e0b9772 Herve Codina 2023-02-17  1959  					    &qmc->bd_dma_addr, GFP_KERNEL);
3178d58e0b9772 Herve Codina 2023-02-17  1960  	if (!qmc->bd_table) {
3178d58e0b9772 Herve Codina 2023-02-17  1961  		dev_err(qmc->dev, "Failed to allocate bd table\n");
a13bf605342ea9 Herve Codina 2024-08-08  1962  		return -ENOMEM;
3178d58e0b9772 Herve Codina 2023-02-17  1963  	}
3178d58e0b9772 Herve Codina 2023-02-17 @1964  	memset(qmc->bd_table, 0, qmc->bd_size);
3178d58e0b9772 Herve Codina 2023-02-17  1965  
3178d58e0b9772 Herve Codina 2023-02-17  1966  	qmc_write32(qmc->scc_pram + QMC_GBL_MCBASE, qmc->bd_dma_addr);
3178d58e0b9772 Herve Codina 2023-02-17  1967  
3178d58e0b9772 Herve Codina 2023-02-17  1968  	/* Allocate the interrupt table */
3178d58e0b9772 Herve Codina 2023-02-17  1969  	qmc->int_size = QMC_NB_INTS * sizeof(u16);
3178d58e0b9772 Herve Codina 2023-02-17 @1970  	qmc->int_table = dmam_alloc_coherent(qmc->dev, qmc->int_size,
3178d58e0b9772 Herve Codina 2023-02-17  1971  					     &qmc->int_dma_addr, GFP_KERNEL);
3178d58e0b9772 Herve Codina 2023-02-17  1972  	if (!qmc->int_table) {
3178d58e0b9772 Herve Codina 2023-02-17  1973  		dev_err(qmc->dev, "Failed to allocate interrupt table\n");
a13bf605342ea9 Herve Codina 2024-08-08  1974  		return -ENOMEM;
3178d58e0b9772 Herve Codina 2023-02-17  1975  	}
3178d58e0b9772 Herve Codina 2023-02-17 @1976  	memset(qmc->int_table, 0, qmc->int_size);
3178d58e0b9772 Herve Codina 2023-02-17  1977  
3178d58e0b9772 Herve Codina 2023-02-17  1978  	qmc->int_curr = qmc->int_table;
3178d58e0b9772 Herve Codina 2023-02-17  1979  	qmc_write32(qmc->scc_pram + QMC_GBL_INTBASE, qmc->int_dma_addr);
3178d58e0b9772 Herve Codina 2023-02-17  1980  	qmc_write32(qmc->scc_pram + QMC_GBL_INTPTR, qmc->int_dma_addr);
3178d58e0b9772 Herve Codina 2023-02-17  1981  
3178d58e0b9772 Herve Codina 2023-02-17  1982  	/* Set MRBLR (valid for HDLC only) max MRU + max CRC */
3178d58e0b9772 Herve Codina 2023-02-17  1983  	qmc_write16(qmc->scc_pram + QMC_GBL_MRBLR, HDLC_MAX_MRU + 4);
3178d58e0b9772 Herve Codina 2023-02-17  1984  
3178d58e0b9772 Herve Codina 2023-02-17  1985  	qmc_write16(qmc->scc_pram + QMC_GBL_GRFTHR, 1);
3178d58e0b9772 Herve Codina 2023-02-17  1986  	qmc_write16(qmc->scc_pram + QMC_GBL_GRFCNT, 1);
3178d58e0b9772 Herve Codina 2023-02-17  1987  
3178d58e0b9772 Herve Codina 2023-02-17  1988  	qmc_write32(qmc->scc_pram + QMC_GBL_C_MASK32, 0xDEBB20E3);
3178d58e0b9772 Herve Codina 2023-02-17  1989  	qmc_write16(qmc->scc_pram + QMC_GBL_C_MASK16, 0xF0B8);
3178d58e0b9772 Herve Codina 2023-02-17  1990  
eb680d563089e5 Herve Codina 2024-08-08  1991  	if (qmc_is_qe(qmc)) {
eb680d563089e5 Herve Codina 2024-08-08  1992  		/* Zeroed the reserved area */
eb680d563089e5 Herve Codina 2024-08-08  1993  		memset_io(qmc->scc_pram + QMC_QE_GBL_RSV_B0_START, 0,
eb680d563089e5 Herve Codina 2024-08-08  1994  			  QMC_QE_GBL_RSV_B0_SIZE);
eb680d563089e5 Herve Codina 2024-08-08  1995  
eb680d563089e5 Herve Codina 2024-08-08  1996  		qmc_write32(qmc->scc_pram + QMC_QE_GBL_GCSBASE, qmc->dpram_offset);
eb680d563089e5 Herve Codina 2024-08-08  1997  
eb680d563089e5 Herve Codina 2024-08-08  1998  		/* Init 'framer parameters' area and set the base addresses */
eb680d563089e5 Herve Codina 2024-08-08  1999  		memset_io(qmc->scc_pram + UCC_SLOW_PRAM_SIZE, 0x01, 64);
eb680d563089e5 Herve Codina 2024-08-08  2000  		memset_io(qmc->scc_pram + UCC_SLOW_PRAM_SIZE + 64, 0x01, 64);
eb680d563089e5 Herve Codina 2024-08-08  2001  		qmc_write16(qmc->scc_pram + QMC_QE_GBL_RX_FRM_BASE,
eb680d563089e5 Herve Codina 2024-08-08  2002  			    qmc->scc_pram_offset + UCC_SLOW_PRAM_SIZE);
eb680d563089e5 Herve Codina 2024-08-08  2003  		qmc_write16(qmc->scc_pram + QMC_QE_GBL_TX_FRM_BASE,
eb680d563089e5 Herve Codina 2024-08-08  2004  			    qmc->scc_pram_offset + UCC_SLOW_PRAM_SIZE + 64);
eb680d563089e5 Herve Codina 2024-08-08  2005  	}
eb680d563089e5 Herve Codina 2024-08-08  2006  
2d965e25fa4180 Herve Codina 2023-12-05  2007  	ret = qmc_init_tsa(qmc);
3178d58e0b9772 Herve Codina 2023-02-17  2008  	if (ret)
a13bf605342ea9 Herve Codina 2024-08-08  2009  		return ret;
3178d58e0b9772 Herve Codina 2023-02-17  2010  
3178d58e0b9772 Herve Codina 2023-02-17  2011  	qmc_write16(qmc->scc_pram + QMC_GBL_QMCSTATE, 0x8000);
3178d58e0b9772 Herve Codina 2023-02-17  2012  
3178d58e0b9772 Herve Codina 2023-02-17  2013  	ret = qmc_setup_chans(qmc);
3178d58e0b9772 Herve Codina 2023-02-17  2014  	if (ret)
a13bf605342ea9 Herve Codina 2024-08-08  2015  		return ret;
3178d58e0b9772 Herve Codina 2023-02-17  2016  
3178d58e0b9772 Herve Codina 2023-02-17  2017  	/* Init interrupts table */
3178d58e0b9772 Herve Codina 2023-02-17  2018  	ret = qmc_setup_ints(qmc);
3178d58e0b9772 Herve Codina 2023-02-17  2019  	if (ret)
a13bf605342ea9 Herve Codina 2024-08-08  2020  		return ret;
a13bf605342ea9 Herve Codina 2024-08-08  2021  
eb680d563089e5 Herve Codina 2024-08-08  2022  	/* Init SCC (CPM1) or UCC (QE) */
de5fdb7d14b34f Herve Codina 2024-08-08  2023  	ret = qmc_init_xcc(qmc);
de5fdb7d14b34f Herve Codina 2024-08-08  2024  	if (ret)
a13bf605342ea9 Herve Codina 2024-08-08  2025  		return ret;
a13bf605342ea9 Herve Codina 2024-08-08  2026  
de5fdb7d14b34f Herve Codina 2024-08-08  2027  	/* Set the irq handler */
3178d58e0b9772 Herve Codina 2023-02-17  2028  	irq = platform_get_irq(pdev, 0);
cb3daa51db819a Herve Codina 2024-11-05  2029  	if (irq < 0) {
cb3daa51db819a Herve Codina 2024-11-05  2030  		ret = irq;
de5fdb7d14b34f Herve Codina 2024-08-08  2031  		goto err_exit_xcc;
cb3daa51db819a Herve Codina 2024-11-05  2032  	}
3178d58e0b9772 Herve Codina 2023-02-17  2033  	ret = devm_request_irq(qmc->dev, irq, qmc_irq_handler, 0, "qmc", qmc);
3178d58e0b9772 Herve Codina 2023-02-17  2034  	if (ret < 0)
de5fdb7d14b34f Herve Codina 2024-08-08  2035  		goto err_exit_xcc;
3178d58e0b9772 Herve Codina 2023-02-17  2036  
3178d58e0b9772 Herve Codina 2023-02-17  2037  	/* Enable interrupts */
3178d58e0b9772 Herve Codina 2023-02-17  2038  	qmc_write16(qmc->scc_regs + SCC_SCCM,
3178d58e0b9772 Herve Codina 2023-02-17  2039  		    SCC_SCCE_IQOV | SCC_SCCE_GINT | SCC_SCCE_GUN | SCC_SCCE_GOV);
3178d58e0b9772 Herve Codina 2023-02-17  2040  
3178d58e0b9772 Herve Codina 2023-02-17  2041  	ret = qmc_finalize_chans(qmc);
3178d58e0b9772 Herve Codina 2023-02-17  2042  	if (ret < 0)
3178d58e0b9772 Herve Codina 2023-02-17  2043  		goto err_disable_intr;
3178d58e0b9772 Herve Codina 2023-02-17  2044  
e49dd637e02589 Herve Codina 2024-08-08  2045  	/* Enable transmitter and receiver */
3178d58e0b9772 Herve Codina 2023-02-17  2046  	qmc_setbits32(qmc->scc_regs + SCC_GSMRL, SCC_GSMRL_ENR | SCC_GSMRL_ENT);
3178d58e0b9772 Herve Codina 2023-02-17  2047  
3178d58e0b9772 Herve Codina 2023-02-17  2048  	platform_set_drvdata(pdev, qmc);
3178d58e0b9772 Herve Codina 2023-02-17  2049  
ba3b7e4753c5ad Herve Codina 2023-12-05  2050  	/* Populate channel related devices */
ba3b7e4753c5ad Herve Codina 2023-12-05  2051  	ret = devm_of_platform_populate(qmc->dev);
ba3b7e4753c5ad Herve Codina 2023-12-05  2052  	if (ret)
ba3b7e4753c5ad Herve Codina 2023-12-05  2053  		goto err_disable_txrx;
ba3b7e4753c5ad Herve Codina 2023-12-05  2054  
3178d58e0b9772 Herve Codina 2023-02-17  2055  	return 0;
3178d58e0b9772 Herve Codina 2023-02-17  2056  
ba3b7e4753c5ad Herve Codina 2023-12-05  2057  err_disable_txrx:
ba3b7e4753c5ad Herve Codina 2023-12-05  2058  	qmc_setbits32(qmc->scc_regs + SCC_GSMRL, 0);
ba3b7e4753c5ad Herve Codina 2023-12-05  2059  
3178d58e0b9772 Herve Codina 2023-02-17  2060  err_disable_intr:
3178d58e0b9772 Herve Codina 2023-02-17  2061  	qmc_write16(qmc->scc_regs + SCC_SCCM, 0);
3178d58e0b9772 Herve Codina 2023-02-17  2062  
de5fdb7d14b34f Herve Codina 2024-08-08  2063  err_exit_xcc:
de5fdb7d14b34f Herve Codina 2024-08-08  2064  	qmc_exit_xcc(qmc);
3178d58e0b9772 Herve Codina 2023-02-17  2065  	return ret;
3178d58e0b9772 Herve Codina 2023-02-17  2066  }
3178d58e0b9772 Herve Codina 2023-02-17  2067  

:::::: The code at line 1958 was first introduced by commit
:::::: 3178d58e0b9772d690456c0bdf8c9f5e191d45f1 soc: fsl: cpm1: Add support for QMC

:::::: TO: Herve Codina <herve.codina@bootlin.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
