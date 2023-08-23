Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE438BEA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 07:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692776759; x=1724312759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TPfIOvpB32X9fS3aEpRsQhowAdnmhwleoacNANacyBM=;
  b=Piv/857UDt2eMxH1g1YlY7LItp+JTsRqWKFtfy78NcZm6ZRzhjAnCprW
   cnGKPgyW8qO8uMoIuxn+cu1Eyo6he3DvMYFkQKDOiTT/VnQhZws/pU51n
   dB92K1szM4GwtXTzgdTMWlJOgXsmaViNJsVOy6zHI0alxj6ikLSI6565s
   ARFXyCKdbNG8HeGSeQaPOpuHBaE96G+mZRVIGT7pnMgLBb2eTMjvHWBA/
   kAM+R6NXIXK0FTexXta8Rnvki5/88in4RZIVxge6V3jEKOkoFIZUzyAWM
   Stkd8Bu+w0En2gULITPaUvYT21e9qxPnWWZuPR0R7M5Uz/4ArwspCegH+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="371509688"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="371509688"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 00:45:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="730114329"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="730114329"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 23 Aug 2023 00:45:56 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYiYt-0000yG-3A;
	Wed, 23 Aug 2023 07:45:55 +0000
Date: Wed, 23 Aug 2023 15:45:14 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/microcode 1/30] arch/x86/kernel/cpu/common.c:2143:
 undefined reference to `show_ucode_info_early'
Message-ID: <202308231517.u9apdMGd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/microcode
head:   a668da234bfa80152aa1ade7c86fe6be90e1d52b
commit: 19443e4292d6776382ba2190028d0ea563b940e9 [1/30] x86/microcode/32: Move early loading after paging enable
config: i386-randconfig-011-20230823 (https://download.01.org/0day-ci/archive/20230823/202308231517.u9apdMGd-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308231517.u9apdMGd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308231517.u9apdMGd-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/cpu/common.o: in function `ucode_cpu_init':
>> arch/x86/kernel/cpu/common.c:2143: undefined reference to `show_ucode_info_early'


vim +2143 arch/x86/kernel/cpu/common.c

505b789996f64b Thomas Gleixner 2019-11-11  2140  
505b789996f64b Thomas Gleixner 2019-11-11  2141  static inline void ucode_cpu_init(int cpu)
505b789996f64b Thomas Gleixner 2019-11-11  2142  {
505b789996f64b Thomas Gleixner 2019-11-11 @2143  	show_ucode_info_early();
505b789996f64b Thomas Gleixner 2019-11-11  2144  }
505b789996f64b Thomas Gleixner 2019-11-11  2145  

:::::: The code at line 2143 was first introduced by commit
:::::: 505b789996f64bdbfcc5847dd4b5076fc7c50274 x86/cpu: Unify cpu_init()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
