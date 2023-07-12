Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67B51D2F6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 23:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689204193; x=1720740193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6cnEbeyhh+nykkS4fSJYhk+c8W/qZm27D0HUlclQrFo=;
  b=XLPM1AzCAmQn8M0iWZM+PvMyUZB4rAVeahDkO9BnmRNuGCJk2YZRsMRw
   jbOujZHuhi2wb2iWhvmm/qVpZMb9/tC51SWsn5Iw2PHMKni31650HpiCt
   cxJB2EmiOHsudUt27tUA1vQ8PRoNYL+e7f91nHPP/aCyJuckzmTv3oiui
   kpZfokWBYaTwyJr6zWLpJXPV2gPjJlAYdTLkSNOwq2YLz1mDjQ6k/k6m6
   W5R3nHPMOAejdK6gQFrc0w21uj2Vazjf64aBMsoTf/wi4RCCEXkf18h87
   1/7bf2j17FSz22SMzh2rTXOL+W67S4+y10fif15J52/cIpAb4kkthoKVj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="451391110"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="451391110"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 16:23:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="751355885"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="751355885"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Jul 2023 16:23:10 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJjAq-00062L-1A;
	Wed, 12 Jul 2023 23:23:08 +0000
Date: Thu, 13 Jul 2023 07:22:20 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-passthrough-fd 5/10] include/linux/aio.h:15:20:
 sparse: sparse: incorrect type in return expression (different base types)
Message-ID: <202307130746.kDGA4Pjq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fuse-passthrough-fd
head:   08997a107eeaed80a804aaf7e52d8f0b11adc7f2
commit: b7e821030dcbc56c4271545cce37ab8e8caafac6 [5/10] fuse: Handle asynchronous read and write in passthrough
config: openrisc-randconfig-r083-20230710 (https://download.01.org/0day-ci/archive/20230713/202307130746.kDGA4Pjq-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130746.kDGA4Pjq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130746.kDGA4Pjq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/fuse/passthrough.c: note: in included file:
>> include/linux/aio.h:15:20: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __kernel_rwf_t @@     got int @@
   include/linux/aio.h:15:20: sparse:     expected restricted __kernel_rwf_t
   include/linux/aio.h:15:20: sparse:     got int
>> include/linux/aio.h:15:20: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __kernel_rwf_t @@     got int @@
   include/linux/aio.h:15:20: sparse:     expected restricted __kernel_rwf_t
   include/linux/aio.h:15:20: sparse:     got int

vim +15 include/linux/aio.h

^1da177e4c3f415 Linus Torvalds  2005-04-16  12  
a21465fcfea5761 Alessio Balsini 2021-01-14  13  static inline rwf_t iocb_to_rw_flags(int ifl, int iocb_mask)
a21465fcfea5761 Alessio Balsini 2021-01-14  14  {
a21465fcfea5761 Alessio Balsini 2021-01-14 @15  	return ifl & iocb_mask;
a21465fcfea5761 Alessio Balsini 2021-01-14  16  }
a21465fcfea5761 Alessio Balsini 2021-01-14  17  

:::::: The code at line 15 was first introduced by commit
:::::: a21465fcfea57614b1c07e56f0c2e34b8c915ac4 fs: Generic function to convert iocb to rw flags

:::::: TO: Alessio Balsini <balsini@android.com>
:::::: CC: Amir Goldstein <amir73il@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
