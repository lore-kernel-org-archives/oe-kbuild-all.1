Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6D2DDCF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 08:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695198423; x=1726734423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C0F5YbDFCz75sfXUOQcFBf63WMC5WfJoh3pFVE5WcXs=;
  b=Z1afCX7QTtpglZMX1uiBm1m94RrPM/2Tp974FN8/LrIuCmWN4SVpTj8Q
   aanCHiV3AmNntwJ1+zf7GZnwhYXSx1g9qo+7wawWbp+j6PoKDUKgHz8my
   Qc6V80Ycx94A1YLxabgtVgw3GmlvjNK26qm8UspbkxFYV9c+RI9C8/pyI
   mfRSAV6UiAlynY9DmB6ej48LSLBVg5UYtk+DrLVAIkKhVQB8tNXpgVEEZ
   MDKmiOrBCvs6IZ9FrWnCmblxwII+NHAQaSF1l6g/VwosylNRu/jdq8/cb
   7ptovmWzQQEAEswb6gqVD4cW5ZGIml7wgmaFw2Eqlu/u/XT9JsvwTcaCB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="377468787"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="377468787"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 01:27:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781607027"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="781607027"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 20 Sep 2023 01:27:00 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qisXy-0008Vd-2J;
	Wed, 20 Sep 2023 08:26:58 +0000
Date: Wed, 20 Sep 2023 16:26:08 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Stefan Asserhall <stefan.asserhall@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 190/1363]
 arch/microblaze/include/asm/spinlock_types.h:10:3: error: #error "please
 don't include this file directly"
Message-ID: <202309201657.vTULJr8p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   4f412ed20fd2c5353c1e878ef9ed77952a5040a1
commit: ea81ee258e9f1abbfb27c667cbd3161c039af2cd [190/1363] microblaze: Enable experimental SMP functionality
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20230920/202309201657.vTULJr8p-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201657.vTULJr8p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201657.vTULJr8p-lkp@intel.com/

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

84966a8e9d282c8 Stefan Asserhall 2020-02-03   8  
84966a8e9d282c8 Stefan Asserhall 2020-02-03   9  #ifndef __LINUX_SPINLOCK_TYPES_H
84966a8e9d282c8 Stefan Asserhall 2020-02-03 @10  # error "please don't include this file directly"
84966a8e9d282c8 Stefan Asserhall 2020-02-03  11  #endif
84966a8e9d282c8 Stefan Asserhall 2020-02-03  12  

:::::: The code at line 10 was first introduced by commit
:::::: 84966a8e9d282c8cf43064ef2bebc7260d7725e6 microblaze: Implement architecture spinlock

:::::: TO: Stefan Asserhall <stefan.asserhall@xilinx.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
