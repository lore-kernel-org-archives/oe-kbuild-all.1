Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EC416D4E3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 May 2024 12:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716898974; cv=none; b=HGabd7ykBMSVp2S96egeZ6+XczJPMsQHQ7eUrq4klhgu6+ObyGrgoYqywr0RR3GOjDRi/ho5qEYG4ffpdn65eHhNhVWbs3UkgMpAlskA91zs3Rrvfx9BgYWYPgFQk+PLkhcApQxwPz/wKgbynE2i5KLVBb+mnE3bSGbPe3B5gfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716898974; c=relaxed/simple;
	bh=KjKbFlMb+jJc1eeLU4kns7MHmvkZGq7XLqQ26l4Xvxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=avb4dt48OMSvAX+Oh8Pd3xavYNstNpTU71/o6jKxVIj6q9RkRe41lJSm902HkTuguNYzsM9qeLsyFZFbgzkqHksXn/ApmWEVeXHRG0kt7uHVcvTtzJxLmZ8cVeSzOh2UtmFo64+pMN9g2ZPIqvhE2kFGVuod737jLn3HHTjZfiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TVspQ7WN; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TVspQ7WN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716898972; x=1748434972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KjKbFlMb+jJc1eeLU4kns7MHmvkZGq7XLqQ26l4Xvxw=;
  b=TVspQ7WNuIl2B+CdpFQD/leQ0PteqKK+mJl/yMH5w3qspC3HgMBmrD90
   sLLl3C1knxNsZJIZfZDify9vQj2yX0Xcr2MWFUQ88RzeL7xeeg1Dx+lgL
   7xscB2s6w2ctfuIKIGMGqwlrNmDUGBwRjgR0ZCU/EGGhDfJxLbZzB9Vhv
   obJQ6CaDXtm0Li+LDkJp9ntqbIs+sP3mBFXLun0B8FFqzXXZE+EYbjIdC
   lIk0WkdmyMV05REpT9vXtLkCneOMa2UETQAHzNda/IsrHRC1LELJuuA23
   WYOXe5h7Jx2Qbr0hOr/JUHVGiYWRiCbhlQbOi5fwPX/UZoaz0GBCks5sM
   w==;
X-CSE-ConnectionGUID: BZgT/yiWTmmEKvh60LpgFQ==
X-CSE-MsgGUID: G31AgV61RY2k6VDEiDaSkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="17029190"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; 
   d="scan'208";a="17029190"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 05:22:50 -0700
X-CSE-ConnectionGUID: odPOU+1tT4eHOFFvbTZ1MQ==
X-CSE-MsgGUID: /Rw084JcRcqTnz4fvXatjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; 
   d="scan'208";a="35077969"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 28 May 2024 05:22:49 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBvqo-000CAZ-1i;
	Tue, 28 May 2024 12:22:46 +0000
Date: Tue, 28 May 2024 20:22:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [linux-next:master 1849/2075]
 drivers/mtd/nand/raw/mxc_nand.c:1479:26: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202405282036.maEDO54Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6dc544b66971c7f9909ff038b62149105272d26a
commit: 2ba9d29c44cc046b46c275d654fa946a0781a540 [1849/2075] mtd: nand: mxc_nand: support software ECC
config: nios2-randconfig-r133-20240528 (https://download.01.org/0day-ci/archive/20240528/202405282036.maEDO54Q-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240528/202405282036.maEDO54Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405282036.maEDO54Q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/nand/raw/mxc_nand.c:1479:26: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short [noderef] [usertype] __iomem *t @@     got void *buf @@
   drivers/mtd/nand/raw/mxc_nand.c:1479:26: sparse:     expected unsigned short [noderef] [usertype] __iomem *t
   drivers/mtd/nand/raw/mxc_nand.c:1479:26: sparse:     got void *buf
>> drivers/mtd/nand/raw/mxc_nand.c:1516:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *buf @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/mxc_nand.c:1516:65: sparse:     expected void *buf
   drivers/mtd/nand/raw/mxc_nand.c:1516:65: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/raw/mxc_nand.c:1527:87: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *buf @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/mxc_nand.c:1527:87: sparse:     expected void *buf
   drivers/mtd/nand/raw/mxc_nand.c:1527:87: sparse:     got void [noderef] __iomem *

vim +1479 drivers/mtd/nand/raw/mxc_nand.c

  1476	
  1477	static void memff16_toio(void *buf, int n)
  1478	{
> 1479		__iomem u16 *t = buf;
  1480		int i;
  1481	
  1482		for (i = 0; i < (n >> 1); i++)
  1483			__raw_writew(0xffff, t++);
  1484	}
  1485	
  1486	static void copy_page_to_sram(struct mtd_info *mtd, const void *buf, int buf_len)
  1487	{
  1488		struct nand_chip *this = mtd_to_nand(mtd);
  1489		struct mxc_nand_host *host = nand_get_controller_data(this);
  1490		unsigned int no_subpages = mtd->writesize / 512;
  1491		int oob_per_subpage, i;
  1492	
  1493		oob_per_subpage = (mtd->oobsize / no_subpages) & ~1;
  1494	
  1495		/*
  1496		 * During a page write the i.MX NAND controller will read 512b from
  1497		 * main_area0 SRAM, then oob_per_subpage bytes from spare0 SRAM, then
  1498		 * 512b from main_area1 SRAM and so on until the full page is written.
  1499		 * For software ECC we want to have a 1:1 mapping between the raw page
  1500		 * data on the NAND chip and the view of the NAND core. This is
  1501		 * necessary to make the NAND_CMD_RNDOUT read the data it expects.
  1502		 * To accomplish this we have to write the data in the order the controller
  1503		 * reads it. This is reversed in copy_page_from_sram() below.
  1504		 *
  1505		 * buf_len can either be the full page including the OOB or user data only.
  1506		 * When it's user data only make sure that we fill up the rest of the
  1507		 * SRAM with 0xff.
  1508		 */
  1509		for (i = 0; i < no_subpages; i++) {
  1510			int now = min(buf_len, 512);
  1511	
  1512			if (now)
  1513				memcpy16_toio(host->main_area0 + i * 512, buf, now);
  1514	
  1515			if (now < 512)
> 1516				memff16_toio(host->main_area0 + i * 512 + now, 512 - now);
  1517	
  1518			buf += 512;
  1519			buf_len -= now;
  1520	
  1521			now = min(buf_len, oob_per_subpage);
  1522			if (now)
  1523				memcpy16_toio(host->spare0 + i * host->devtype_data->spare_len,
  1524					      buf, now);
  1525	
  1526			if (now < oob_per_subpage)
  1527				memff16_toio(host->spare0 + i * host->devtype_data->spare_len + now,
  1528					     oob_per_subpage - now);
  1529	
  1530			buf += oob_per_subpage;
  1531			buf_len -= now;
  1532		}
  1533	}
  1534	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
