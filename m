Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D86641E32
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 19:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695411621; x=1726947621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0z0fqBsmATbX1FM2dceRLYFkyQXOxPbLwEOx95eOKAo=;
  b=FORE65Fk9Er+DFOmuZ6GNtUZ/L1xg2NBH2Zg+8h2wVM2tN0XZX0fuZXR
   BtSn9h30YCSwJUhbPM7+0VogH3RIWe1hRrS/1D1rOOXS7OpovEprZqg7Y
   jeENz0dmr8bSKv/Ty7S2LLE3nwEA6JFpX1mLG+L1Nq18pZn23gujbbR72
   aNiGunXmviA/9oiMbinCXUbpAGYAFqjIaRk/ocCWXHOJ3JB7+y/Tty//3
   tqOk52umrEiAKKgYtwfX3IVVgTVJYv1iDCtKlTKgzdkrLV3k2KVWcdYhk
   +scOGD7WuRJhkzCi3a15Bsge9Xc4Cj2G95/iER+jCEAvKl37RvybpymS3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="361170904"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="361170904"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 12:40:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="747644942"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="747644942"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 22 Sep 2023 12:40:18 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjm0e-0001E8-2L;
	Fri, 22 Sep 2023 19:40:16 +0000
Date: Sat, 23 Sep 2023 03:39:20 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 323/382]
 drivers/spi/spi-cadence-quadspi.c:393: undefined reference to
 `spi_mem_exec_op'
Message-ID: <202309230341.kwiHMIhX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   b76e01bf23c451952b4bbff4640419fd7d1d3c82
commit: 4535fc8cd288f5c537ff9b8abe0e3131a0ebcc98 [323/382] spi: cadence-qspi: Tune PHY to allow running at higher frequencies
config: i386-randconfig-016-20230922 (https://download.01.org/0day-ci/archive/20230923/202309230341.kwiHMIhX-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309230341.kwiHMIhX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309230341.kwiHMIhX-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/spi/spi-cadence-quadspi.o: in function `cqspi_phy_check_pattern':
>> drivers/spi/spi-cadence-quadspi.c:393: undefined reference to `spi_mem_exec_op'


vim +393 drivers/spi/spi-cadence-quadspi.c

   377	
   378	static int cqspi_phy_check_pattern(struct cqspi_flash_pdata *f_pdata,
   379					   struct spi_mem *mem)
   380	{
   381		struct spi_mem_op op = f_pdata->phy_read_op;
   382		u8 *read_data;
   383		unsigned int size = sizeof(phy_tuning_pattern);
   384		int ret;
   385	
   386		read_data = kmalloc(size, GFP_KERNEL);
   387		if (!read_data)
   388			return -ENOMEM;
   389	
   390		op.data.buf.in = read_data;
   391		op.data.nbytes = size;
   392	
 > 393		ret = spi_mem_exec_op(mem, &op);
   394		if (ret)
   395			goto out;
   396	
   397		if (memcmp(read_data, phy_tuning_pattern,
   398			   ARRAY_SIZE(phy_tuning_pattern))) {
   399			ret = -EAGAIN;
   400			goto out;
   401		}
   402	
   403		ret = 0;
   404	
   405	out:
   406		kfree(read_data);
   407		return ret;
   408	}
   409	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
