Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718421D6188
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 13:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765545479; cv=none; b=TqKNjjmd5r2WaE57gPfw2kHgMok32meZs6bFIWIHHeKN9bYqpG+IHb3t8Q+82AqW2nsDKnKHzl8QdNqbnCLLU0RSiDF7ienParv83hG/8QjENcX+hXRKfVgUQBAR++Vuo8ALAgJ/ghUMynt8K23Jn4nF6dZyGmEOPSzSxZPbn6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765545479; c=relaxed/simple;
	bh=6qnldeFfSgk/V91dfajv9+ljB9fq1ZgD5VKUP+pi66k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pfx727i/8/+OqxUKtrhKO+illHYzJjwo9vPQZdOs7/m5VSp1Xjq3jM2J+lXJrCPSdtAZXfT3WhfADlVp8Sqi9VypI4nCyMoBYLehvmdcAXCSTUzEO0O4ikYyH29AUdnfaap8W5OEP1aUsx+k6zExlBqa9zMWCYXUGgpXFH/qMiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lu6p0xra; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lu6p0xra"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765545478; x=1797081478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6qnldeFfSgk/V91dfajv9+ljB9fq1ZgD5VKUP+pi66k=;
  b=lu6p0xraEhCYPPjbUDgx7gAdvD5gAchMniF0SQ5+JyDlxsI8AtT77rc8
   4qKcFP7yXOxwka96X1X30OVyd4dDr/+mHOsXPIh/p88xBWjxsiq2/lIco
   FosrYFMRyN5tU2uy5FZ/ke2sjA6coXOaOJx2GnctZf0u/AoQMDMMZAH0I
   JsShPk6roNwT9Ai9v1NZBw+mCyuKINw0RXJFJhEk6GL0QP8eGPBLGVK/O
   T7wuS9angY+ZRyakUvvMj9lCJBYVP+ZWjWtB5+NbFw/Ziaa/lL5fwQwUJ
   HOG7nvSXm2SsH1fPt8z9zGY25hg5rUI0zpPZ7Vmk9gOLteshgKJe1Awty
   g==;
X-CSE-ConnectionGUID: 0NasygscSRq0jUQFSmaZWA==
X-CSE-MsgGUID: KP5Yuj5eQOSb3ojJyp25Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="70129871"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="70129871"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 05:17:57 -0800
X-CSE-ConnectionGUID: iAcRMEYYRPi6EKGwIYFkUw==
X-CSE-MsgGUID: HymxEafLRY+DF8EHrQh9Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="197153418"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Dec 2025 05:17:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU31t-0000000065P-07Fi;
	Fri, 12 Dec 2025 13:17:53 +0000
Date: Fri, 12 Dec 2025 21:17:19 +0800
From: kernel test robot <lkp@intel.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: drivers/spi/spi-ti-qspi.c:266:38: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202512122110.ZdyWcFXR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tiwei,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   7 months ago
config: um-randconfig-r121-20251212 (https://download.01.org/0day-ci/archive/20251212/202512122110.ZdyWcFXR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512122110.ZdyWcFXR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512122110.ZdyWcFXR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/spi/spi-ti-qspi.c:266:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] data @@     got restricted __be32 [usertype] @@
   drivers/spi/spi-ti-qspi.c:266:38: sparse:     expected unsigned int [usertype] data
   drivers/spi/spi-ti-qspi.c:266:38: sparse:     got restricted __be32 [usertype]
   drivers/spi/spi-ti-qspi.c:269:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] data @@     got restricted __be32 [usertype] @@
   drivers/spi/spi-ti-qspi.c:269:38: sparse:     expected unsigned int [usertype] data
   drivers/spi/spi-ti-qspi.c:269:38: sparse:     got restricted __be32 [usertype]
   drivers/spi/spi-ti-qspi.c:272:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] data @@     got restricted __be32 [usertype] @@
   drivers/spi/spi-ti-qspi.c:272:38: sparse:     expected unsigned int [usertype] data
   drivers/spi/spi-ti-qspi.c:272:38: sparse:     got restricted __be32 [usertype]
   drivers/spi/spi-ti-qspi.c:275:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] data @@     got restricted __be32 [usertype] @@
   drivers/spi/spi-ti-qspi.c:275:38: sparse:     expected unsigned int [usertype] data
   drivers/spi/spi-ti-qspi.c:275:38: sparse:     got restricted __be32 [usertype]
   drivers/spi/spi-ti-qspi.c:376:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:376:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:376:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:376:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:376:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:376:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:378:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:378:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:378:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:378:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:378:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:378:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:380:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:380:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:380:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:380:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:380:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:380:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:382:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:382:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:382:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:382:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:382:42: sparse: sparse: cast to restricted __be32
   drivers/spi/spi-ti-qspi.c:382:42: sparse: sparse: cast to restricted __be32
--
>> drivers/soc/qcom/smd-rpm.c:177:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned char const * @@
   drivers/soc/qcom/smd-rpm.c:177:47: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/soc/qcom/smd-rpm.c:177:47: sparse:     got unsigned char const *
--
>> drivers/misc/keba/cp500.c:962:34: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/tty/serial/pch_uart.c:1403:30: sparse: sparse: restricted upf_t degrades to integer
   drivers/tty/serial/pch_uart.c:1407:32: sparse: sparse: invalid assignment: &=
   drivers/tty/serial/pch_uart.c:1407:32: sparse:    left side has type int
   drivers/tty/serial/pch_uart.c:1407:32: sparse:    right side has type restricted upf_t
   drivers/tty/serial/pch_uart.c:1579:9: sparse: sparse: context imbalance in 'pch_console_write' - different lock contexts for basic block
--
>> drivers/video/fbdev/aty/atyfb_base.c:483:9: sparse: sparse: switch with no cases

vim +266 drivers/spi/spi-ti-qspi.c

57c2ecd9bf9719 Vignesh R     2015-10-13  241  
1ff7760ff66b98 Ben Hutchings 2016-04-12  242  static int qspi_write_msg(struct ti_qspi *qspi, struct spi_transfer *t,
1ff7760ff66b98 Ben Hutchings 2016-04-12  243  			  int count)
505a14954e2d7f Sourav Poddar 2013-08-20  244  {
1ff7760ff66b98 Ben Hutchings 2016-04-12  245  	int wlen, xfer_len;
505a14954e2d7f Sourav Poddar 2013-08-20  246  	unsigned int cmd;
505a14954e2d7f Sourav Poddar 2013-08-20  247  	const u8 *txbuf;
f682c4ffd25a19 Vignesh R     2015-08-20  248  	u32 data;
505a14954e2d7f Sourav Poddar 2013-08-20  249  
505a14954e2d7f Sourav Poddar 2013-08-20  250  	txbuf = t->tx_buf;
505a14954e2d7f Sourav Poddar 2013-08-20  251  	cmd = qspi->cmd | QSPI_WR_SNGL;
3ab546205411a2 Axel Lin      2014-01-12  252  	wlen = t->bits_per_word >> 3;	/* in bytes */
f682c4ffd25a19 Vignesh R     2015-08-20  253  	xfer_len = wlen;
505a14954e2d7f Sourav Poddar 2013-08-20  254  
505a14954e2d7f Sourav Poddar 2013-08-20  255  	while (count) {
006110476478c6 Mugunthan V N 2015-02-18  256  		if (qspi_is_busy(qspi))
006110476478c6 Mugunthan V N 2015-02-18  257  			return -EBUSY;
006110476478c6 Mugunthan V N 2015-02-18  258  
505a14954e2d7f Sourav Poddar 2013-08-20  259  		switch (wlen) {
3ab546205411a2 Axel Lin      2014-01-12  260  		case 1:
505a14954e2d7f Sourav Poddar 2013-08-20  261  			dev_dbg(qspi->dev, "tx cmd %08x dc %08x data %02x\n",
505a14954e2d7f Sourav Poddar 2013-08-20  262  					cmd, qspi->dc, *txbuf);
f682c4ffd25a19 Vignesh R     2015-08-20  263  			if (count >= QSPI_WLEN_MAX_BYTES) {
f682c4ffd25a19 Vignesh R     2015-08-20  264  				u32 *txp = (u32 *)txbuf;
f682c4ffd25a19 Vignesh R     2015-08-20  265  
f682c4ffd25a19 Vignesh R     2015-08-20 @266  				data = cpu_to_be32(*txp++);
f682c4ffd25a19 Vignesh R     2015-08-20  267  				writel(data, qspi->base +
f682c4ffd25a19 Vignesh R     2015-08-20  268  				       QSPI_SPI_DATA_REG_3);
f682c4ffd25a19 Vignesh R     2015-08-20  269  				data = cpu_to_be32(*txp++);
f682c4ffd25a19 Vignesh R     2015-08-20  270  				writel(data, qspi->base +
f682c4ffd25a19 Vignesh R     2015-08-20  271  				       QSPI_SPI_DATA_REG_2);
f682c4ffd25a19 Vignesh R     2015-08-20  272  				data = cpu_to_be32(*txp++);
f682c4ffd25a19 Vignesh R     2015-08-20  273  				writel(data, qspi->base +
f682c4ffd25a19 Vignesh R     2015-08-20  274  				       QSPI_SPI_DATA_REG_1);
f682c4ffd25a19 Vignesh R     2015-08-20  275  				data = cpu_to_be32(*txp++);
f682c4ffd25a19 Vignesh R     2015-08-20  276  				writel(data, qspi->base +
f682c4ffd25a19 Vignesh R     2015-08-20  277  				       QSPI_SPI_DATA_REG);
f682c4ffd25a19 Vignesh R     2015-08-20  278  				xfer_len = QSPI_WLEN_MAX_BYTES;
f682c4ffd25a19 Vignesh R     2015-08-20  279  				cmd |= QSPI_WLEN(QSPI_WLEN_MAX_BITS);
f682c4ffd25a19 Vignesh R     2015-08-20  280  			} else {
505a14954e2d7f Sourav Poddar 2013-08-20  281  				writeb(*txbuf, qspi->base + QSPI_SPI_DATA_REG);
f682c4ffd25a19 Vignesh R     2015-08-20  282  				cmd = qspi->cmd | QSPI_WR_SNGL;
f682c4ffd25a19 Vignesh R     2015-08-20  283  				xfer_len = wlen;
f682c4ffd25a19 Vignesh R     2015-08-20  284  				cmd |= QSPI_WLEN(wlen);
f682c4ffd25a19 Vignesh R     2015-08-20  285  			}
505a14954e2d7f Sourav Poddar 2013-08-20  286  			break;
3ab546205411a2 Axel Lin      2014-01-12  287  		case 2:
505a14954e2d7f Sourav Poddar 2013-08-20  288  			dev_dbg(qspi->dev, "tx cmd %08x dc %08x data %04x\n",
505a14954e2d7f Sourav Poddar 2013-08-20  289  					cmd, qspi->dc, *txbuf);
505a14954e2d7f Sourav Poddar 2013-08-20  290  			writew(*((u16 *)txbuf), qspi->base + QSPI_SPI_DATA_REG);
505a14954e2d7f Sourav Poddar 2013-08-20  291  			break;
3ab546205411a2 Axel Lin      2014-01-12  292  		case 4:
505a14954e2d7f Sourav Poddar 2013-08-20  293  			dev_dbg(qspi->dev, "tx cmd %08x dc %08x data %08x\n",
505a14954e2d7f Sourav Poddar 2013-08-20  294  					cmd, qspi->dc, *txbuf);
505a14954e2d7f Sourav Poddar 2013-08-20  295  			writel(*((u32 *)txbuf), qspi->base + QSPI_SPI_DATA_REG);
3ab546205411a2 Axel Lin      2014-01-12  296  			break;
3ab546205411a2 Axel Lin      2014-01-12  297  		}
3ab546205411a2 Axel Lin      2014-01-12  298  
505a14954e2d7f Sourav Poddar 2013-08-20  299  		ti_qspi_write(qspi, cmd, QSPI_SPI_CMD_REG);
57c2ecd9bf9719 Vignesh R     2015-10-13  300  		if (ti_qspi_poll_wc(qspi)) {
505a14954e2d7f Sourav Poddar 2013-08-20  301  			dev_err(qspi->dev, "write timed out\n");
505a14954e2d7f Sourav Poddar 2013-08-20  302  			return -ETIMEDOUT;
505a14954e2d7f Sourav Poddar 2013-08-20  303  		}
f682c4ffd25a19 Vignesh R     2015-08-20  304  		txbuf += xfer_len;
f682c4ffd25a19 Vignesh R     2015-08-20  305  		count -= xfer_len;
505a14954e2d7f Sourav Poddar 2013-08-20  306  	}
505a14954e2d7f Sourav Poddar 2013-08-20  307  
505a14954e2d7f Sourav Poddar 2013-08-20  308  	return 0;
505a14954e2d7f Sourav Poddar 2013-08-20  309  }
505a14954e2d7f Sourav Poddar 2013-08-20  310  

:::::: The code at line 266 was first introduced by commit
:::::: f682c4ffd25a19594d21987c19a69fa123242eb7 spi: ti-qspi: use 128 bit transfer mode where possible

:::::: TO: Vignesh R <vigneshr@ti.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
