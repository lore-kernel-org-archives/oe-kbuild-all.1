Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC0D7F0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 01:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692150272; x=1723686272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=++51fYrPXDud2qrFkgtcmAB5Db8ZuCftwHu7jzRJVeI=;
  b=kJqfBCJIbfPckNpXUAKvmKUwH/DH7xdjnBMvKtjVQCTqudF5vE9DoYJy
   +fMfyOfrtOeOc4d3uH5deJzXD5bNk6GqIs4wp7Nen1EwxncW0IWlYDK3o
   Msly6+RBnTIRYls7FO5kGudxeKjYRAHGocapO/ObQGxlz+RVjl6J851xD
   FfS11WzI9hvUUiM4sYK3Z+dHJb22gHfd3QGZ9bR9Have2ikMMPkCxPPpm
   yEBKGjS2ZXBBLCg8Fs/nlRfZyHlFhLuI9AXqoANACcLvNKQ0A8Bdsq3ne
   4bR5i7EP9eeNufzlbUbq4Hz0edoVwnl5f2se2oZxc4ZUzYUw36UiJVSMd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436317158"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="436317158"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 18:44:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763468441"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="763468441"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 15 Aug 2023 18:44:30 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW5aH-0001O7-0M;
	Wed, 16 Aug 2023 01:44:29 +0000
Date: Wed, 16 Aug 2023 09:44:06 +0800
From: kernel test robot <lkp@intel.com>
To: Dean Luick <dean.luick@cornelisnetworks.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Subject: [cornelisnetworks:for-upstream_20230815 18/26]
 drivers/infiniband/hw/hfi1/sdma.c:2086:32: error: 'dd' undeclared; did you
 mean 'fd'?
Message-ID: <202308160918.0foGuxx5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20230815
head:   5536d462af3f2f64d807c8f142bace179036dd1e
commit: 9a37586d8521d92fc2d3bc63a091d8bcff4ce89d [18/26] RDMA/hfi1: Parameterize read of send sizes
config: x86_64-buildonly-randconfig-r001-20230816 (https://download.01.org/0day-ci/archive/20230816/202308160918.0foGuxx5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308160918.0foGuxx5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308160918.0foGuxx5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/infiniband/hw/hfi1/sdma.c: In function 'sdma_dumpstate':
>> drivers/infiniband/hw/hfi1/sdma.c:2086:32: error: 'dd' undeclared (first use in this function); did you mean 'fd'?
    2086 |         sdma_dumpstate_helper0(dd->params->send_dma_engines_reg);
         |                                ^~
   drivers/infiniband/hw/hfi1/sdma.c:2044:41: note: in definition of macro 'sdma_dumpstate_helper0'
    2044 |                 csr = read_csr(sde->dd, reg); \
         |                                         ^~~
   drivers/infiniband/hw/hfi1/sdma.c:2086:32: note: each undeclared identifier is reported only once for each function it appears in
    2086 |         sdma_dumpstate_helper0(dd->params->send_dma_engines_reg);
         |                                ^~
   drivers/infiniband/hw/hfi1/sdma.c:2044:41: note: in definition of macro 'sdma_dumpstate_helper0'
    2044 |                 csr = read_csr(sde->dd, reg); \
         |                                         ^~~


vim +2086 drivers/infiniband/hw/hfi1/sdma.c

  2042	
  2043	#define sdma_dumpstate_helper0(reg) do { \
  2044			csr = read_csr(sde->dd, reg); \
  2045			dd_dev_err(sde->dd, "%36s     0x%016llx\n", #reg, csr); \
  2046		} while (0)
  2047	
  2048	#define sdma_dumpstate_helper(reg) do { \
  2049			csr = read_sde_csr(sde, reg); \
  2050			dd_dev_err(sde->dd, "%36s[%02u] 0x%016llx\n", \
  2051				#reg, sde->this_idx, csr); \
  2052		} while (0)
  2053	
  2054	#define sdma_dumpstate_helper2(reg) do { \
  2055			csr = read_csr(sde->dd, reg + (8 * i)); \
  2056			dd_dev_err(sde->dd, "%33s_%02u     0x%016llx\n", \
  2057					#reg, i, csr); \
  2058		} while (0)
  2059	
  2060	void sdma_dumpstate(struct sdma_engine *sde)
  2061	{
  2062		u64 csr;
  2063		unsigned i;
  2064	
  2065		sdma_dumpstate_helper(SD(CTRL));
  2066		sdma_dumpstate_helper(SD(STATUS));
  2067		sdma_dumpstate_helper0(SD(ERR_STATUS));
  2068		sdma_dumpstate_helper0(SD(ERR_MASK));
  2069		sdma_dumpstate_helper(SD(ENG_ERR_STATUS));
  2070		sdma_dumpstate_helper(SD(ENG_ERR_MASK));
  2071	
  2072		for (i = 0; i < CCE_NUM_INT_CSRS; ++i) {
  2073			sdma_dumpstate_helper2(CCE_INT_STATUS);
  2074			sdma_dumpstate_helper2(CCE_INT_MASK);
  2075			sdma_dumpstate_helper2(CCE_INT_BLOCKED);
  2076		}
  2077	
  2078		sdma_dumpstate_helper(SD(TAIL));
  2079		sdma_dumpstate_helper(SD(HEAD));
  2080		sdma_dumpstate_helper(SD(PRIORITY_THLD));
  2081		sdma_dumpstate_helper(SD(IDLE_CNT));
  2082		sdma_dumpstate_helper(SD(RELOAD_CNT));
  2083		sdma_dumpstate_helper(SD(DESC_CNT));
  2084		sdma_dumpstate_helper(SD(DESC_FETCHED_CNT));
  2085		sdma_dumpstate_helper(SD(MEMORY));
> 2086		sdma_dumpstate_helper0(dd->params->send_dma_engines_reg);
  2087		sdma_dumpstate_helper0(dd->params->send_dma_mem_size_reg);
  2088		/* sdma_dumpstate_helper(SEND_EGRESS_SEND_DMA_STATUS);  */
  2089		sdma_dumpstate_helper(SD(BASE_ADDR));
  2090		sdma_dumpstate_helper(SD(LEN_GEN));
  2091		sdma_dumpstate_helper(SD(HEAD_ADDR));
  2092		sdma_dumpstate_helper(SD(CHECK_ENABLE));
  2093		sdma_dumpstate_helper(SD(CHECK_VL));
  2094		sdma_dumpstate_helper(SD(CHECK_JOB_KEY));
  2095		sdma_dumpstate_helper(SD(CHECK_PARTITION_KEY));
  2096		sdma_dumpstate_helper(SD(CHECK_SLID));
  2097		sdma_dumpstate_helper(SD(CHECK_OPCODE));
  2098	}
  2099	#endif
  2100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
