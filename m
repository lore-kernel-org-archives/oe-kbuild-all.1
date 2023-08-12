Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D3C628
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 08:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691830331; x=1723366331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6MsRystri9JlECPzjUSJq8nQKF7cR6i2se5FADohEdM=;
  b=loglbaeoKPMHgafekWGT74326ZCUuYPynszvRRhxhjKCPbOQ8ZceNnOv
   aQ4yNFhaegynHzz2cqFvSCIDT2fWyIH/MvvM2nVcvxsD+/TZ/+4td6kdm
   kT4xQ7ltVn6TnvYPXPjg1PzJslAq9sgTasLefpHJ7398nxwi3yP7c92+F
   vutj5/kGrqKJmhdYW+FInb4/E0nE/CPcr/KppGgqfbTU0XBVdBR0saYya
   Bsv1F9DOsImlLvNcYI/tlCsSu3H6a7fJHL8VQroDD1yabPzvWgAJAS4HI
   LaXpU6IWFqjGDxBR67g/XvFdsck6ULMZswGSEdNkXNpakypUrOjIbsAGb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="458185417"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="458185417"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 01:52:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="735998919"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="735998919"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Aug 2023 01:52:08 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUkLv-0008Qe-2E;
	Sat, 12 Aug 2023 08:52:07 +0000
Date: Sat, 12 Aug 2023 16:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4 7964/8003]
 drivers/mtd/nand/spi/core.c:979:5: warning: no previous prototype for
 function 'spinand_cal_read'
Message-ID: <202308121657.WCEbQu3q-lkp@intel.com>
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
config: i386-randconfig-i014-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121657.WCEbQu3q-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121657.WCEbQu3q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121657.WCEbQu3q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/nand/spi/core.c:1020:37: error: too few arguments to function call, expected 4, have 2
           ret = spinand_wait(spinand, &status);
                 ~~~~~~~~~~~~                 ^
   drivers/mtd/nand/spi/core.c:499:12: note: 'spinand_wait' declared here
   static int spinand_wait(struct spinand_device *spinand,
              ^
>> drivers/mtd/nand/spi/core.c:979:5: warning: no previous prototype for function 'spinand_cal_read' [-Wmissing-prototypes]
   int spinand_cal_read(void *priv, u32 *addr, int addrlen, u8 *buf, int readlen) {
       ^
   drivers/mtd/nand/spi/core.c:979:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int spinand_cal_read(void *priv, u32 *addr, int addrlen, u8 *buf, int readlen) {
   ^
   static 
   1 warning and 1 error generated.


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
> 1020		ret = spinand_wait(spinand, &status);
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
