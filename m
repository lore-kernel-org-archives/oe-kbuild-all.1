Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C547480F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 04:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HFcNT82k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698209090; x=1729745090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1SYQSH9UKl7+I8MKsrIPK/Ch6S/tK0aTZ1/CB7YwypI=;
  b=HFcNT82kLokc/aoCILOWKLlWd6pyj84vSEEuvvOV6J7bt5nPmn3ZITTn
   kwCISD3jLLQ6Wj87w7piDwP5nwC9Miumlkox0Xqn9QpUVewjiHi7Y8CMj
   75ooLX83NIcaPvs1SAe70DrL2xx6TPZoSFgqvdfytlzLzK1VPGLEIWmKr
   HMMX271Ic8QrbozoCjOUjbFfIpPzrUBQEyGDPeQv3UcS24IrQAFzGZclA
   p3Tdm/MteZ6pL++kiYTR412Nh31gVVGomtKm63MaCnRCKRnj5F/JI6Khi
   w1VtpZlx7A+4JFPFauxzCHtBc0wpBssvIBRsPpzfaIJYDFL8fp1eSnCs6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="451461150"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="451461150"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 21:44:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="758741374"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="758741374"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Oct 2023 21:44:48 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvVl8-0008cb-0d;
	Wed, 25 Oct 2023 04:44:46 +0000
Date: Wed, 25 Oct 2023 12:43:48 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-dango 7031/7095]
 drivers/mtd/nand/spi/core.c:979:5: warning: no previous declaration for
 'spinand_cal_read'
Message-ID: <202310251218.uHYMFj3z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-dango
head:   7c273a7526ad5e3284b1763207b1d8d6178d9ca4
commit: e8053513c51df65611d3654a449fa15561cbe7b7 [7031/7095] drivers: mtd: spinand: Add calibration support for spinand
config: x86_64-randconfig-003-20231025 (https://download.01.org/0day-ci/archive/20231025/202310251218.uHYMFj3z-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310251218.uHYMFj3z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310251218.uHYMFj3z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/spi/core.c:979:5: warning: no previous declaration for 'spinand_cal_read' [-Wmissing-declarations]
    int spinand_cal_read(void *priv, u32 *addr, int addrlen, u8 *buf, int readlen) {
        ^~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c: In function 'spinand_cal_read':
   drivers/mtd/nand/spi/core.c:1020:30: warning: passing argument 2 of 'spinand_wait' makes integer from pointer without a cast [-Wint-conversion]
     ret = spinand_wait(spinand, &status);
                                 ^
   drivers/mtd/nand/spi/core.c:499:12: note: expected 'long unsigned int' but argument is of type 'u8 * {aka unsigned char *}'
    static int spinand_wait(struct spinand_device *spinand,
               ^~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:1020:8: error: too few arguments to function 'spinand_wait'
     ret = spinand_wait(spinand, &status);
           ^~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:499:12: note: declared here
    static int spinand_wait(struct spinand_device *spinand,
               ^~~~~~~~~~~~


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
