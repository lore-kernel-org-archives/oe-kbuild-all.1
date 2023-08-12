Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC9C10EE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 00:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691800257; x=1723336257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M3fgAZK3t5gdozkdAd/MyPPGN6jnDtpXO9nf3SdMnbI=;
  b=n9d2CSj1dXbiKP3sR+s0yPsbLHV5my+7QyoMnsoKL8S+y1s6Sg01QvZh
   gI6V42FXaZWUqXUTietH/+8zrSP68TfHxN2w8hFrSMWynpluKfuepZx88
   s03s9ksbGj7k6OPSABRm0SimBSRgdB3rmChErm4prz5hJyjvcwFhGXl/1
   mZTyExO4mSpFKMM37+3omvSi3qruzhjoZybKQhKcGxqGrusmpJvrD4qW5
   DeogKxsyVlGS+u5qDju2b528Pmf1BEblukkrlYt3ZrDne7eGksnweCBnb
   INxDKUyYlyoRDkl8WdPqa9KCAEeQ5OccmVQ9rRr2iIpMZPnNxEL8TFi1l
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="361933179"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="361933179"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 17:30:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="682707218"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="682707218"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Aug 2023 17:30:55 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUcWt-00088q-0x;
	Sat, 12 Aug 2023 00:30:55 +0000
Date: Sat, 12 Aug 2023 08:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4 7964/8003]
 drivers/mtd/nand/spi/core.c:979:5: warning: no previous prototype for
 'spinand_cal_read'
Message-ID: <202308120837.4YCQEd5y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4
head:   33ae06cdbe7cdded20d1ac549403343243272109
commit: fae799ea02997ecb310c01fac5bf75ff56d09b1a [7964/8003] drivers: mtd: spinand: Add calibration support for spinand
config: sparc64-randconfig-r031-20230812 (https://download.01.org/0day-ci/archive/20230812/202308120837.4YCQEd5y-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120837.4YCQEd5y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120837.4YCQEd5y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/spi/core.c:979:5: warning: no previous prototype for 'spinand_cal_read' [-Wmissing-prototypes]
     979 | int spinand_cal_read(void *priv, u32 *addr, int addrlen, u8 *buf, int readlen) {
         |     ^~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c: In function 'spinand_cal_read':
   drivers/mtd/nand/spi/core.c:1020:37: warning: passing argument 2 of 'spinand_wait' makes integer from pointer without a cast [-Wint-conversion]
    1020 |         ret = spinand_wait(spinand, &status);
         |                                     ^~~~~~~
         |                                     |
         |                                     u8 * {aka unsigned char *}
   drivers/mtd/nand/spi/core.c:500:39: note: expected 'long unsigned int' but argument is of type 'u8 *' {aka 'unsigned char *'}
     500 |                         unsigned long initial_delay_us,
         |                         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:1020:15: error: too few arguments to function 'spinand_wait'
    1020 |         ret = spinand_wait(spinand, &status);
         |               ^~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:499:12: note: declared here
     499 | static int spinand_wait(struct spinand_device *spinand,
         |            ^~~~~~~~~~~~


vim +/spinand_cal_read +979 drivers/mtd/nand/spi/core.c

   978	
 > 979	int spinand_cal_read(void *priv, u32 *addr, int addrlen, u8 *buf, int readlen) {
   980		struct spinand_device *spinand = (struct spinand_device *)priv;
   981		struct device *dev = &spinand->spimem->spi->dev;
   982		struct spi_mem_op op = SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, buf, readlen);
   983		struct nand_pos pos;
   984		struct nand_page_io_req req;
   985		u8 status;
   986		int ret;
   987	
   988		if(addrlen != sizeof(struct nand_addr)/sizeof(unsigned int)) {
   989			dev_err(dev, "Must provide correct addr(length) for spinand calibration\n");
   990			return -EINVAL;
   991		}
   992	
   993		ret = spinand_reset_op(spinand);
   994		if (ret)
   995			return ret;
   996	
   997		/* We should store our golden data in first target because
   998		 * we can't switch target at this moment.
   999		 */
  1000		pos = (struct nand_pos){
  1001			.target = 0,
  1002			.lun = *addr,
  1003			.plane = *(addr+1),
  1004			.eraseblock = *(addr+2),
  1005			.page = *(addr+3),
  1006		};
  1007	
  1008		req = (struct nand_page_io_req){
  1009			.pos = pos,
  1010			.dataoffs = *(addr+4),
  1011			.datalen = readlen,
  1012			.databuf.in = buf,
  1013			.mode = MTD_OPS_AUTO_OOB,
  1014		};
  1015	
  1016		ret = spinand_load_page_op(spinand, &req);
  1017		if (ret)
  1018			return ret;
  1019	
  1020		ret = spinand_wait(spinand, &status);
  1021		if (ret < 0)
  1022			return ret;
  1023	
  1024		ret = spi_mem_exec_op(spinand->spimem, &op);
  1025	
  1026		return 0;
  1027	}
  1028	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
