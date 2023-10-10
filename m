Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214B127442
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 15:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n8u9r7rK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696952616; x=1728488616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bYeJBx2JohR+P8H4/gY/9Ps3/sB+SCL9iyJomr3iVik=;
  b=n8u9r7rK9OUJ1kmXVC+t88SgZSwVycXvkspulG59xuOQxMVoJn3dH9Er
   9k4sbO4So37QR0I6YHylLe9lD7+sOCBG0h43Aa+gyMqn3abQbi+Gpqm+x
   EGrbHr0bzVpyvLiKoqC3bP/CfIgqzUluDcvt27U/uqdHPzmYTee149XBL
   xIHU7rAtnuu+E7WxykPLgoF04gDB1qd4RZn1EZjU1DmQigyzknTa/rUCv
   mSUH5HQgdQuTBd/UcqAj0xKcs69IGBATPdPOrP4qMYjnVfTdDJUPsyvpn
   As4oTHx7v+BaBVpDyvBs5IPjhgw0L2v9xL0XImIi89ixihfGGFRscODOn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="384283713"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="384283713"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 08:43:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="747108352"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="747108352"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 10 Oct 2023 08:43:33 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqEtP-0000gC-0k;
	Tue, 10 Oct 2023 15:43:31 +0000
Date: Tue, 10 Oct 2023 23:42:31 +0800
From: kernel test robot <lkp@intel.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] powerpc/paravirt: Improve vcpu_is_preempted
Message-ID: <202310102341.K0sgoqQL-lkp@intel.com>
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
[also build test ERROR on linus/master v6.6-rc5 next-20231010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srikar-Dronamraju/powerpc-paravirt-Improve-vcpu_is_preempted/20231009-131957
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20231009051740.17683-1-srikar%40linux.vnet.ibm.com
patch subject: [PATCH] powerpc/paravirt: Improve vcpu_is_preempted
config: powerpc64-randconfig-003-20231010 (https://download.01.org/0day-ci/archive/20231010/202310102341.K0sgoqQL-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310102341.K0sgoqQL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310102341.K0sgoqQL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/paca.h:18,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/thread_info.h:23,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/ipc.h:5,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/compat.h:14,
                    from arch/powerpc/kernel/asm-offsets.c:12:
   arch/powerpc/include/asm/paravirt.h: In function 'vcpu_is_preempted':
>> arch/powerpc/include/asm/lppaca.h:121:41: error: 'struct paca_struct' has no member named 'lppaca_ptr'
     121 | #define lppaca_of(cpu)  (*paca_ptrs[cpu]->lppaca_ptr)
         |                                         ^~
   arch/powerpc/include/asm/paravirt.h:130:14: note: in expansion of macro 'lppaca_of'
     130 |         if (!lppaca_of(cpu).idle)
         |              ^~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/powerpc/kernel/asm-offsets.s] Error 1 shuffle=2717580973
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1287: prepare0] Error 2 shuffle=2717580973
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=2717580973
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=2717580973
   make: Target 'prepare' not remade because of errors.


vim +121 arch/powerpc/include/asm/lppaca.h

3356bb9f7ba378a include/asm-powerpc/lppaca.h      David Gibson    2006-01-13  120  
d2e60075a3d4422 arch/powerpc/include/asm/lppaca.h Nicholas Piggin 2018-02-14 @121  #define lppaca_of(cpu)	(*paca_ptrs[cpu]->lppaca_ptr)
8154c5d22d91cd1 arch/powerpc/include/asm/lppaca.h Paul Mackerras  2010-08-12  122  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
