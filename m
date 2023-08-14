Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4C7BA45
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 15:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692025372; x=1723561372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xyJJj31CRcD9Fl6fyRvwRAPJnI+6vmrzVXK+kD82ka4=;
  b=Zdw+bSTC0s8xoCdT1SMKpgnh1/Xdvtlr2FrhHFrqiT4EfZ8a4LjrowVb
   AFUihemfpyvQDYwKo7A7z2iCFz74C/705tP+8gvfjxAAHNLy4JziuQtoW
   8uhAyGZmKBV5ivK9E1hSapBhGDUhn4LdIE5GEm5UHlfxwaRDz6cDYGGtg
   gok5dxDJoQlnF2Q0xvvynxTwz2nRQ4yj4UYk8tCqIE5jfzlkRDBkMHFce
   ThdykncHxexnupuXVnkaSoTK7D4Png5yi1npGJBww2iDBBOyJe+BPAiZ2
   7mLlDhcwiHviyt9jBl7GkjYNyxoC4NwEO8qEGaeyfrtfK+8AhQLyyHM5/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="372050959"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="372050959"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 08:02:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="907264971"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="907264971"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Aug 2023 08:02:11 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVZ58-0000Cm-2y;
	Mon, 14 Aug 2023 15:02:10 +0000
Date: Mon, 14 Aug 2023 23:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Arjan van de Ven <arjan@linux.intel.com>
Subject: [tglx-devel:x86/topology 13/41]
 arch/x86/include/asm/processor.h:696:16: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202308142210.0QTIYvAF-lkp@intel.com>
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
head:   14b61d5479684fac2a098660b8b3beaf57445fac
commit: 5a90456249f51bd57f6dc99c5bac551c1821ffae [13/41] x86/cpu: Move cpu_l[l2]c_id into topology info
config: i386-randconfig-i062-20230814 (https://download.01.org/0day-ci/archive/20230814/202308142210.0QTIYvAF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308142210.0QTIYvAF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308142210.0QTIYvAF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/events/amd/uncore.c: note: in included file (through arch/x86/include/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
>> arch/x86/include/asm/processor.h:696:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned int * @@
   arch/x86/include/asm/processor.h:696:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/include/asm/processor.h:696:16: sparse:     got unsigned int *

vim +696 arch/x86/include/asm/processor.h

   693	
   694	static inline u16 per_cpu_llc_id(unsigned int cpu)
   695	{
 > 696		return per_cpu(cpu_info.topo.llc_id, cpu);
   697	}
   698	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
