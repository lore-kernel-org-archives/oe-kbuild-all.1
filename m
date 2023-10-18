Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4E6CA74
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 07:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X4jiqviI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697612907; x=1729148907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QS9c5i9LW+EvOZgR4u/5vpYKyp1BXo4t2Y8DvQ2A+Jc=;
  b=X4jiqviITypTvVuscY/Cu1E7nwHIMMTmD8Lp4afAZiy4FHHAv0MU4oV2
   KNIs2spgk8FrkPIH1Ajk7+KhLWaEoatXXMGWwXBTi0Ajg0jU3EqaHhoSl
   h8jU/JRBkGt6p2WzCeQ7JkI/BF60r+AeWG78lR5JLtbBDvyknnGv+oegJ
   Vi+0+0VwLtdSqf5X5GsFoTRnzJcxCh8D4LJNqu1w/vS3706ve4zBt80Gt
   P+x4I4tWdmVPmkCRZXyxRMbc8ahUHRNvcmbJdOwJ1rKewWBhiHTeOwn3m
   LnUtcgMplzh2fdjaRgZZ/G1e0NR5zjh39N/GY5u/QMtnVGkf9rKgFCs/K
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="452426785"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="452426785"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 00:08:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826757515"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="826757515"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Oct 2023 00:08:22 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt0fD-000036-1x;
	Wed, 18 Oct 2023 07:08:19 +0000
Date: Wed, 18 Oct 2023 15:07:34 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2560/30000]
 drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc
 ivac,%r14'
Message-ID: <202310181416.nwAZ9Ze5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 6a74b3766942efaff185457d8b426f5d007e1ac5 [2560/30000] soc: fsl: dpio: QMAN performance improvement. Function pointer indirection.
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231018/202310181416.nwAZ9Ze5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310181416.nwAZ9Ze5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310181416.nwAZ9Ze5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/fsl/dpio/qbman-portal.c: Assembler messages:
   drivers/soc/fsl/dpio/qbman-portal.c:1309: Error: no such instruction: `dc cvac,%r15'
   drivers/soc/fsl/dpio/qbman-portal.c:622: Error: no such instruction: `dc cvac,%rbx'
>> drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%r14'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%r12'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%rax'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%r13'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%r13'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%rax'
   drivers/soc/fsl/dpio/qbman-portal.c:962: Error: no such instruction: `dc cvac,%rbp'
   drivers/soc/fsl/dpio/qbman-portal.c:423: Error: no such instruction: `dc cvac,%r13'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%r12'
   drivers/soc/fsl/dpio/qbman-portal.c:423: Error: no such instruction: `dc cvac,%rbx'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%r13'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%r13'
   drivers/soc/fsl/dpio/qbman-portal.c:423: Error: no such instruction: `dc cvac,%rbp'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%r13'
   drivers/soc/fsl/dpio/qbman-portal.c:423: Error: no such instruction: `dc cvac,%rbp'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%r13'
   drivers/soc/fsl/dpio/qbman-portal.c:423: Error: no such instruction: `dc cvac,%r15'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%r13'
   drivers/soc/fsl/dpio/qbman-portal.c:423: Error: no such instruction: `dc cvac,%rbp'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%r13'
   drivers/soc/fsl/dpio/qbman-portal.c:423: Error: no such instruction: `dc cvac,%rbp'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GPIO_MXC
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && ARCH_MXC
   Selected by [y]:
   - GPIO_MXC_PAD_WAKEUP [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && IMX_SCU [=y]


vim +167 drivers/soc/fsl/dpio/qbman-portal.c

6a74b3766942ef Youri Querry 2019-11-04  121  
6a74b3766942ef Youri Querry 2019-11-04  122  static int qbman_swp_release_direct(struct qbman_swp *s,
6a74b3766942ef Youri Querry 2019-11-04  123  				    const struct qbman_release_desc *d,
6a74b3766942ef Youri Querry 2019-11-04  124  				    const u64 *buffers,
6a74b3766942ef Youri Querry 2019-11-04  125  				    unsigned int num_buffers);
6a74b3766942ef Youri Querry 2019-11-04  126  static int qbman_swp_release_mem_back(struct qbman_swp *s,
6a74b3766942ef Youri Querry 2019-11-04  127  				      const struct qbman_release_desc *d,
6a74b3766942ef Youri Querry 2019-11-04  128  				      const u64 *buffers,
6a74b3766942ef Youri Querry 2019-11-04  129  				      unsigned int num_buffers);
6a74b3766942ef Youri Querry 2019-11-04  130  
6a74b3766942ef Youri Querry 2019-11-04  131  /* Function pointers */
6a74b3766942ef Youri Querry 2019-11-04  132  int (*qbman_swp_enqueue_ptr)(struct qbman_swp *s,
6a74b3766942ef Youri Querry 2019-11-04  133  			     const struct qbman_eq_desc *d,
6a74b3766942ef Youri Querry 2019-11-04  134  			     const struct dpaa2_fd *fd)
6a74b3766942ef Youri Querry 2019-11-04  135  	= qbman_swp_enqueue_direct;
6a74b3766942ef Youri Querry 2019-11-04  136  
6a74b3766942ef Youri Querry 2019-11-04  137  int (*qbman_swp_enqueue_multiple_ptr)(struct qbman_swp *s,
6a74b3766942ef Youri Querry 2019-11-04  138  				      const struct qbman_eq_desc *d,
6a74b3766942ef Youri Querry 2019-11-04  139  				      const struct dpaa2_fd *fd,
6a74b3766942ef Youri Querry 2019-11-04  140  				      uint32_t *flags,
6a74b3766942ef Youri Querry 2019-11-04  141  					     int num_frames)
6a74b3766942ef Youri Querry 2019-11-04  142  	= qbman_swp_enqueue_multiple_direct;
6a74b3766942ef Youri Querry 2019-11-04  143  
6a74b3766942ef Youri Querry 2019-11-04  144  int
6a74b3766942ef Youri Querry 2019-11-04  145  (*qbman_swp_enqueue_multiple_desc_ptr)(struct qbman_swp *s,
6a74b3766942ef Youri Querry 2019-11-04  146  				       const struct qbman_eq_desc *d,
6a74b3766942ef Youri Querry 2019-11-04  147  				       const struct dpaa2_fd *fd,
6a74b3766942ef Youri Querry 2019-11-04  148  				       int num_frames)
6a74b3766942ef Youri Querry 2019-11-04  149  	= qbman_swp_enqueue_multiple_desc_direct;
6a74b3766942ef Youri Querry 2019-11-04  150  
6a74b3766942ef Youri Querry 2019-11-04  151  int (*qbman_swp_pull_ptr)(struct qbman_swp *s, struct qbman_pull_desc *d)
6a74b3766942ef Youri Querry 2019-11-04  152  			= qbman_swp_pull_direct;
6a74b3766942ef Youri Querry 2019-11-04  153  
6a74b3766942ef Youri Querry 2019-11-04  154  const struct dpaa2_dq *(*qbman_swp_dqrr_next_ptr)(struct qbman_swp *s)
6a74b3766942ef Youri Querry 2019-11-04  155  			= qbman_swp_dqrr_next_direct;
6a74b3766942ef Youri Querry 2019-11-04  156  
6a74b3766942ef Youri Querry 2019-11-04  157  int (*qbman_swp_release_ptr)(struct qbman_swp *s,
6a74b3766942ef Youri Querry 2019-11-04  158  			     const struct qbman_release_desc *d,
6a74b3766942ef Youri Querry 2019-11-04  159  			     const u64 *buffers,
6a74b3766942ef Youri Querry 2019-11-04  160  			     unsigned int num_buffers)
6a74b3766942ef Youri Querry 2019-11-04  161  			= qbman_swp_release_direct;
6a74b3766942ef Youri Querry 2019-11-04  162  
166290c21079e1 Haiying Wang 2017-04-13  163  #define dccvac(p) { asm volatile("dc cvac, %0;" : : "r" (p) : "memory"); }
166290c21079e1 Haiying Wang 2017-04-13  164  #define dcivac(p) { asm volatile("dc ivac, %0" : : "r"(p) : "memory"); }
9a499cc1e7316e Youri Querry 2019-11-04  165  static inline void qbman_inval_prefetch(struct qbman_swp *p, u32 offset)
166290c21079e1 Haiying Wang 2017-04-13  166  {
166290c21079e1 Haiying Wang 2017-04-13 @167  	dcivac(p->addr_cena + offset);
166290c21079e1 Haiying Wang 2017-04-13  168  	prefetch(p->addr_cena + offset);
166290c21079e1 Haiying Wang 2017-04-13  169  }
166290c21079e1 Haiying Wang 2017-04-13  170  

:::::: The code at line 167 was first introduced by commit
:::::: 166290c21079e1ae6c20592d3a252df0ece8588e soc: fsl: dpio: enable qbman CENA portal memory access

:::::: TO: Haiying Wang <Haiying.Wang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
