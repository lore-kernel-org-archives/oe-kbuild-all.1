Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AB1D30D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 15:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693929192; x=1725465192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AnKCweLRBOLG2dwn+e+Zx6V0x4nckLDFGJaKBIKrAjg=;
  b=BCZcNNzbPhA+1lf7tLqPbouk5XxpIKBAkMnWMwNC/9lilnAFbzU+tQnL
   XzQeGk1PS3vV2aZge0YrTzOvD6OWDit+ucby+o9pTtoqXYS6T/n5zOsiF
   XRxtxkog9UJQcPxxHt4v6OMGMp7ROJ+MrzCyZ/Xl+4FW4WjpK5muhhbSs
   z0c0WBDkDvDI6wQiyEXxt/63Z6l7I/8Z70u43xeI7kc+1VoqlNcwOdfSg
   8YpS03mv80zQ8FKIwo2d7Lni46c0zxyfput8k9GRvxqna5oDWMt9VKsmQ
   dYK7/Rx6/ULbYF1Z1vEty7N8si34+zTEaMcHz0hf0umoPDJkrNpPwC8Z1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="367048927"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="367048927"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 08:53:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="831294850"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="831294850"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Sep 2023 08:53:08 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdYMU-0001ol-1Y;
	Tue, 05 Sep 2023 15:53:06 +0000
Date: Tue, 5 Sep 2023 23:52:26 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Stefan Asserhall <stefan.asserhall@xilinx.com>
Subject: [xilinx-xlnx:master 193/1123]
 arch/microblaze/include/asm/spinlock_types.h:10:3: error: #error "please
 don't include this file directly"
Message-ID: <202309052334.KiG7i40r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx master
head:   cb1f2dbc7e487361688257fccf78bf3f3ce0e9ed
commit: e9633648b270ab87fa48c330ed2f24813c56c765 [193/1123] microblaze: Enable experimental SMP functionality
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20230905/202309052334.KiG7i40r-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309052334.KiG7i40r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309052334.KiG7i40r-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/spinlock_types_raw.h:7,
                    from include/linux/ratelimit_types.h:7,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from ./arch/microblaze/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
>> arch/microblaze/include/asm/spinlock_types.h:10:3: error: #error "please don't include this file directly"
      10 | # error "please don't include this file directly"
         |   ^~~~~
   make[2]: *** [scripts/Makefile.build:118: kernel/bounds.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1270: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:231: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +10 arch/microblaze/include/asm/spinlock_types.h

6e06bc1974c8311 Stefan Asserhall 2020-02-03   8  
6e06bc1974c8311 Stefan Asserhall 2020-02-03   9  #ifndef __LINUX_SPINLOCK_TYPES_H
6e06bc1974c8311 Stefan Asserhall 2020-02-03 @10  # error "please don't include this file directly"
6e06bc1974c8311 Stefan Asserhall 2020-02-03  11  #endif
6e06bc1974c8311 Stefan Asserhall 2020-02-03  12  

:::::: The code at line 10 was first introduced by commit
:::::: 6e06bc1974c83114c1b10b5552ef024f76643e24 microblaze: Implement architecture spinlock

:::::: TO: Stefan Asserhall <stefan.asserhall@xilinx.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
