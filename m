Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E5F11705
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 14:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694443220; x=1725979220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qt5dcOfPu2buantpEui6TTwrxWgFjXT3sul69eIDXEI=;
  b=WL/7Re0n4aLJGi9hz3G3lYftUbqiA+VTKpuJmMDUZGeFbR80LhkGAF9y
   4QxJOhwmrg3vwI7lisnzwBkWdRlxHkPFTJ0XPcxn3G0l5zH7B2b+TTAzv
   YnjoW+o8YZ92HB4Q3GZmQiYQEQqYO/JCXRemduAtYNEGjskuQG1vBZI2e
   nCKtSLXlPsNegXrfutP2Rb3MiCO3fx0TNv/blm3x+9VPU0tp3+ivv8mev
   JaM71+ZwAOGIFhag31knUS77loJ6FOrzwqTrqvvO4EJE62UBTGDAEFfNS
   JKkzwhuZXDp89Llc5LLunw0572zxR3XvH7sQx6Y86dE08odDwNjFL+DNg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="378013770"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="378013770"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 07:40:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="866965171"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="866965171"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Sep 2023 07:40:16 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfi5G-0006Kq-0g;
	Mon, 11 Sep 2023 14:40:14 +0000
Date: Mon, 11 Sep 2023 22:39:15 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Arjan van de Ven <arjan@linux.intel.com>
Subject: [tglx-devel:x86/topology 13/41]
 arch/x86/include/asm/processor.h:698:16: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202309112221.0UDZmuGD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   75f5f85b73b5996415faac82e1535525a1cf01c4
commit: eb0af6119858a60b987bfed6d1e412ff2cb26ddd [13/41] x86/cpu: Move cpu_l[l2]c_id into topology info
config: x86_64-randconfig-122-20230911 (https://download.01.org/0day-ci/archive/20230911/202309112221.0UDZmuGD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309112221.0UDZmuGD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309112221.0UDZmuGD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/events/amd/uncore.c: note: in included file (through arch/x86/include/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
>> arch/x86/include/asm/processor.h:698:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned int * @@
   arch/x86/include/asm/processor.h:698:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/include/asm/processor.h:698:16: sparse:     got unsigned int *

vim +698 arch/x86/include/asm/processor.h

   695	
   696	static inline u16 per_cpu_llc_id(unsigned int cpu)
   697	{
 > 698		return per_cpu(cpu_info.topo.llc_id, cpu);
   699	}
   700	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
