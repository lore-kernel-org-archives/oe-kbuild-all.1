Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399F513AC1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 22:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694124966; x=1725660966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AreWRSNv7SDBi0nqhaEf4zszLAN7NOgctBu273FIGG4=;
  b=P1HwIZxOqfRqz8xFMInQ1ZygYnkw1bDdhSMDDqsLUcujmPI5qjywlU2W
   95bVrGKsy+JXxKYJPylwtIiHsT8XmnpVXUDN3xMqqynX2ujcbzvpGWCZN
   n27gxcyWV26s4Sk/DBWA1IOYjv5TXuxpu7QwYR2vpubLGWaOD03B/L9Uk
   MIEEMdH5j0m/bKwxB064irYhfPhRe4RWcX0tmvY98N0OPjOgfZfpUaaxR
   WQcRyR48ihEcsy4W8riSgrAmdd8b1hgLqx2ijHW/kEf7Sd3nJ0axHgzzB
   qtGUGrgjbecTjDbIkyRIPT5ZKTq6jqeJuzhMzVtGLeltzftE6aEJ1IURP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="362553514"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="362553514"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 15:15:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="735693000"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="735693000"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 Sep 2023 15:15:34 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeNHg-0001dP-0p;
	Thu, 07 Sep 2023 22:15:32 +0000
Date: Fri, 8 Sep 2023 06:15:02 +0800
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:isp/heap-alloc 113/132]
 drivers/media/platform/apple/isp/isp-drv.c:392:34: warning:
 'apple_isp_hw_t8110' defined but not used
Message-ID: <202309080655.lepl3Xhj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux isp/heap-alloc
head:   d5548fd857a3ca9087e974c8e73d6f487b11c94b
commit: 0d0847e7706a7944b9c5a7ddbd497517e5ff1c64 [113/132] media: apple: isp: IMX558 initial support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230908/202309080655.lepl3Xhj-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080655.lepl3Xhj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080655.lepl3Xhj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/apple/isp/isp-drv.c:392:34: warning: 'apple_isp_hw_t8110' defined but not used [-Wunused-const-variable=]
     392 | static const struct apple_isp_hw apple_isp_hw_t8110 = {
         |                                  ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/apple/isp/isp-drv.c:365:34: warning: 'apple_isp_hw_t6000' defined but not used [-Wunused-const-variable=]
     365 | static const struct apple_isp_hw apple_isp_hw_t6000 = {
         |                                  ^~~~~~~~~~~~~~~~~~


vim +/apple_isp_hw_t8110 +392 drivers/media/platform/apple/isp/isp-drv.c

   364	
 > 365	static const struct apple_isp_hw apple_isp_hw_t6000 = {
   366		.pmu_base = 0x28e584000,
   367	
   368		.dsid_clr_base0 = 0x200014000,
   369		.dsid_clr_base1 = 0x200054000,
   370		.dsid_clr_base2 = 0x200094000,
   371		.dsid_clr_base3 = 0x2000d4000,
   372		.dsid_clr_range0 = 0x1000,
   373		.dsid_clr_range1 = 0x1000,
   374		.dsid_clr_range2 = 0x1000,
   375		.dsid_clr_range3 = 0x1000,
   376	
   377		.clock_scratch = 0x28e3d0868,
   378		.clock_base = 0x0,
   379		.clock_bit = 0x0,
   380		.clock_size = 0x8,
   381		.bandwidth_scratch = 0x28e3d0980,
   382		.bandwidth_base = 0x0,
   383		.bandwidth_bit = 0x0,
   384		.bandwidth_size = 0x8,
   385	
   386		.stream_command = DART_T8020_STREAM_COMMAND,
   387		.stream_select = DART_T8020_STREAM_SELECT,
   388		.ttbr = DART_T8020_TTBR,
   389		.stream_command_invalidate = DART_T8020_STREAM_COMMAND_INVALIDATE,
   390	};
   391	
 > 392	static const struct apple_isp_hw apple_isp_hw_t8110 = {
   393		.pmu_base = 0x23b704000,
   394	
   395		.dsid_clr_base0 = 0x200014000, // TODO
   396		.dsid_clr_base1 = 0x200054000,
   397		.dsid_clr_base2 = 0x200094000,
   398		.dsid_clr_base3 = 0x2000d4000,
   399		.dsid_clr_range0 = 0x1000,
   400		.dsid_clr_range1 = 0x1000,
   401		.dsid_clr_range2 = 0x1000,
   402		.dsid_clr_range3 = 0x1000,
   403	
   404		.clock_scratch = 0x23b3d0560,
   405		.clock_base = 0x0,
   406		.clock_bit = 0x0,
   407		.clock_size = 0x8,
   408		.bandwidth_scratch = 0x23b3d05d0,
   409		.bandwidth_base = 0x0,
   410		.bandwidth_bit = 0x0,
   411		.bandwidth_size = 0x8,
   412	
   413		.stream_command = DART_T8020_STREAM_COMMAND, // TODO
   414		.stream_select = DART_T8020_STREAM_SELECT,
   415		.ttbr = DART_T8020_TTBR,
   416		.stream_command_invalidate = DART_T8020_STREAM_COMMAND_INVALIDATE,
   417	};
   418	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
