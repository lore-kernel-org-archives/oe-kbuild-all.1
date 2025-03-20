Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA8E221DA1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 09:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742462533; cv=none; b=CNJ5E+h9/3xNTegDh4C79xsSrL4AIas7ddW+eP9ozarM5ScyMdCk8Fj6sF2anmBqYNoAL20IF7EJ9vw/lnr7neWvfJDY6aelfzbsPotyT0h7POvrVY9m5/P885sYyGZPTRlJ/liToBgzaKam/AhQ0d9bNRnnlwXGT4aGQ34rwzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742462533; c=relaxed/simple;
	bh=SZZWveavxTQPIW7d36Xec3EMu8+8V1Sw8m6SD/obLb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HkBzQ8u9kI2AtAUhkDyA8txTMu14eda96KKXXLkbfwGfKak6W+zmR2TXzs7bQIdpobNuHTqK+N+jJRQoKOM2CM/x5dKRYW2QMFZE0dMONvq/YvooVFk+PlJpe4AQRp9jSm5YSWmeF/GAXj+NioUkxgUSxL+NmNiMIIPl0AenIbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z2K/WkgG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z2K/WkgG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742462531; x=1773998531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SZZWveavxTQPIW7d36Xec3EMu8+8V1Sw8m6SD/obLb4=;
  b=Z2K/WkgGg0/O4DRH6TTfBqie3I4nFM3/RRsB0hcJSybMm1Z6WjmZpTJH
   fB7k8lLCFeTkhsaZ9+M1STN5tPdvWeiivVF7JCLCk5qCfUi4k+xi7DD9Z
   BrGgOkDdvaVOLSkNqW+IGDCMG5qu4LaAm/Aq7ymHBf6+cbFAfruCq7B/C
   IA2G7znjdmY5DmCTnKqqCIUHoEHouHiEjp5FLFZzWHl6+6t4Rk62qQkM1
   1X06qTixxaRD/cM07ia1xl6Jj/a8YgBEjHwUbIy1jjtgHVkWbiD7Kptpk
   X4YE6S5asDZ2EPKUo9TmE7SnTIUAm2ADnKufUQI93u9nZydlu+uAicN2A
   w==;
X-CSE-ConnectionGUID: 7hE6VcRyTuWsnwg9tGnRhA==
X-CSE-MsgGUID: 1/DFjfI+QZCK/C+Ed/q8rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="47339437"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="47339437"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 02:22:10 -0700
X-CSE-ConnectionGUID: CMLIEQyfRbqpnmv7MP3zhA==
X-CSE-MsgGUID: 9kSff5z/RhOGL1E34U4S6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="127874338"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 20 Mar 2025 02:22:10 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvC6I-0000KJ-2k;
	Thu, 20 Mar 2025 09:22:06 +0000
Date: Thu, 20 Mar 2025 17:22:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1509/1509] drivers/dma/pl330.c:2599:15:
 warning: 'src' may be used uninitialized in this function
Message-ID: <202503201721.gZeymcpc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d54ba3f54612a8622df13d42bc1870048cb63d20
commit: 0299853c014aa0eecf7fb85ac2f1ebd0a9a6ba73 [1509/1509] dmaengine: fix is_slave_direction() return false when DMA_DEV_TO_DEV
config: arm64-randconfig-003-20250320 (https://download.01.org/0day-ci/archive/20250320/202503201721.gZeymcpc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503201721.gZeymcpc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503201721.gZeymcpc-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   drivers/dma/pl330.c: In function 'pl330_prep_dma_cyclic':
>> drivers/dma/pl330.c:2599:15: warning: 'src' may be used uninitialized in this function [-Wmaybe-uninitialized]
    2599 |  px->src_addr = src;
         |  ~~~~~~~~~~~~~^~~~~
   drivers/dma/pl330.c:2657:13: note: 'src' was declared here
    2657 |  dma_addr_t src;
         |             ^~~
>> drivers/dma/pl330.c:2598:15: warning: 'dst' may be used uninitialized in this function [-Wmaybe-uninitialized]
    2598 |  px->dst_addr = dst;
         |  ~~~~~~~~~~~~~^~~~~
   drivers/dma/pl330.c:2656:13: note: 'dst' was declared here
    2656 |  dma_addr_t dst;
         |             ^~~
   drivers/dma/pl330.c:297: warning: cannot understand function prototype: 'struct pl330_reqcfg '


vim +/src +2599 drivers/dma/pl330.c

b3040e40675ec2c Jassi Brar 2010-05-23  2593  
b3040e40675ec2c Jassi Brar 2010-05-23  2594  static inline void fill_px(struct pl330_xfer *px,
b3040e40675ec2c Jassi Brar 2010-05-23  2595  		dma_addr_t dst, dma_addr_t src, size_t len)
b3040e40675ec2c Jassi Brar 2010-05-23  2596  {
b3040e40675ec2c Jassi Brar 2010-05-23  2597  	px->bytes = len;
b3040e40675ec2c Jassi Brar 2010-05-23 @2598  	px->dst_addr = dst;
b3040e40675ec2c Jassi Brar 2010-05-23 @2599  	px->src_addr = src;
b3040e40675ec2c Jassi Brar 2010-05-23  2600  }
b3040e40675ec2c Jassi Brar 2010-05-23  2601  

:::::: The code at line 2599 was first introduced by commit
:::::: b3040e40675ec2c43542331cd30d4ee3dae797e8 DMA: PL330: Add dma api driver

:::::: TO: Jassi Brar <jassi.brar@samsung.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
