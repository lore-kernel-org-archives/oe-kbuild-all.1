Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208DD800
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Oct 2023 08:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2hzCvzV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696840876; x=1728376876;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Utpz2yBC/zzhR60T6KL4rWzz5NMlwoo60TkH2Hc4wb4=;
  b=k2hzCvzV0/RbZb57c9V8NMKmw5v4xiPfUzzF3vRrX9ZTNjy7Aet7oLYp
   j/s6i9M4qPkZumN97Z4Ycb6KydXEKYBWoj9J9QVq1m4Gal6STm3vwQNcT
   f1xMneQksIr82QJGgAOzRW0kmVo5qQs2T5cHyTZKwyNld+WLRpsfS2XOJ
   NTDVgdKGOUkbPcFb49PkU5OTrjsUWL+lzJ1nA1w8V5JycO0J3iyoA9dO9
   g1m+BgOqC9lIaj0csB4rQYB6I1+KzuME2GeW60EwueK2hJj8i3jE5blR0
   2zxcBKffMgiXyMbX1fxo0SpO/FrAQ5ixY8GO6A1a1SxiJhREmCTsGN2RC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="470361691"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="470361691"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 01:41:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="788088696"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="788088696"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 09 Oct 2023 01:41:13 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qplp9-00001o-1V;
	Mon, 09 Oct 2023 08:41:11 +0000
Date: Mon, 9 Oct 2023 16:40:59 +0800
From: kernel test robot <lkp@intel.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] powerpc/paravirt: Improve vcpu_is_preempted
Message-ID: <202310091636.lElmJkYV-lkp@intel.com>
References: <20231009051740.17683-1-srikar@linux.vnet.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009051740.17683-1-srikar@linux.vnet.ibm.com>

Hi Srikar,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on linus/master v6.6-rc5 next-20231009]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srikar-Dronamraju/powerpc-paravirt-Improve-vcpu_is_preempted/20231009-131957
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20231009051740.17683-1-srikar%40linux.vnet.ibm.com
patch subject: [PATCH] powerpc/paravirt: Improve vcpu_is_preempted
config: powerpc-randconfig-002-20231009 (https://download.01.org/0day-ci/archive/20231009/202310091636.lElmJkYV-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231009/202310091636.lElmJkYV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310091636.lElmJkYV-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from arch/powerpc/include/asm/qspinlock.h:7,
                    from arch/powerpc/include/asm/spinlock.h:7,
                    from include/linux/spinlock.h:95,
                    from include/linux/ipc.h:5,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/compat.h:14,
                    from arch/powerpc/kernel/asm-offsets.c:12:
   arch/powerpc/include/asm/paravirt.h: In function 'vcpu_is_preempted':
>> arch/powerpc/include/asm/paravirt.h:130:14: error: implicit declaration of function 'lppaca_of' [-Werror=implicit-function-declaration]
     130 |         if (!lppaca_of(cpu).idle)
         |              ^~~~~~~~~
>> arch/powerpc/include/asm/paravirt.h:130:28: error: request for member 'idle' in something not a structure or union
     130 |         if (!lppaca_of(cpu).idle)
         |                            ^
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/powerpc/kernel/asm-offsets.s] Error 1 shuffle=3266844477
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1287: prepare0] Error 2 shuffle=3266844477
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=3266844477
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=3266844477
   make: Target 'prepare' not remade because of errors.


vim +/lppaca_of +130 arch/powerpc/include/asm/paravirt.h

   103	
   104	#define vcpu_is_preempted vcpu_is_preempted
   105	static inline bool vcpu_is_preempted(int cpu)
   106	{
   107		/*
   108		 * The dispatch/yield bit alone is an imperfect indicator of
   109		 * whether the hypervisor has dispatched @cpu to run on a physical
   110		 * processor. When it is clear, @cpu is definitely not preempted.
   111		 * But when it is set, it means only that it *might* be, subject to
   112		 * other conditions. So we check other properties of the VM and
   113		 * @cpu first, resorting to the yield count last.
   114		 */
   115	
   116		/*
   117		 * Hypervisor preemption isn't possible in dedicated processor
   118		 * mode by definition.
   119		 */
   120		if (!is_shared_processor())
   121			return false;
   122	
   123		if (!(yield_count_of(cpu) & 1))
   124			return false;
   125	
   126		/*
   127		 * If CPU has yielded but OS has not requested idle then this CPU is
   128		 * definitely preempted.
   129		 */
 > 130		if (!lppaca_of(cpu).idle)
   131			return true;
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
