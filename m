Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81C42453E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 20:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691612564; x=1723148564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lGIVXCtJXi4oSTagKdaP2E1rjItNIPjLFv4tWuDg4ZA=;
  b=SJHnKpIe56Gx0dfrb8ys7T9Eg1B0K0CZe+BPKB5zYiXEWDNh9wJRx83X
   dQQK6Yl2BfIMGgkGpmeU08+e72epi07ihdGXmkUNurIFg7FTaAozNKsUw
   CytrTyUgSmg9Z28AdbB5w0LXlkZDyPf+Wad3DpYs4RyoNlrj2N+8zW55k
   CpThWgj8/hIfuzkRitggoSBR5BLWAypx1p0SXFuqpo5gNu4YqaUoQqAso
   XpgtcoKpAD56cJJVwzWA79n5YLOn6RIkQ6wPe1fuxriuHlXIpZl/OOM4Z
   b+wiX/Co58sDMCFOhEG7zyIo69Rm8cAZhgcq+Wb8Fit9cvF6F9X36PM5g
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="402180973"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="402180973"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 13:22:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="797326476"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="797326476"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Aug 2023 13:22:43 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTpha-0006Mm-1m;
	Wed, 09 Aug 2023 20:22:42 +0000
Date: Thu, 10 Aug 2023 04:22:09 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:virt-to-pfn-v6.5-rc1 9/12]
 ld:arch/powerpc/kernel/vdso/vdso32.lds:234: syntax error
Message-ID: <202308100413.1eNSyDgi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git virt-to-pfn-v6.5-rc1
head:   b6a25d37eca4850c246b94d73bd2e3c75860d265
commit: 4d8e8621e8b067862e6b7a0f5545022931bc0823 [9/12] powerpc: Make virt_to_pfn() a static inline
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230810/202308100413.1eNSyDgi-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100413.1eNSyDgi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100413.1eNSyDgi-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> ld:arch/powerpc/kernel/vdso/vdso32.lds:234: syntax error
   collect2: error: ld returned 1 exit status
   make[3]: *** [arch/powerpc/kernel/vdso/Makefile:78: arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
   make[3]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
   make[2]: *** [arch/powerpc/Makefile:372: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
