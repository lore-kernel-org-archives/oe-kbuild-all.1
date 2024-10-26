Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437ED217F2E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 01:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729905888; cv=none; b=BAny0yyOyZemQ8xyK4feXpABylC2RjDCJUzFx/FtsVcIQoNfhwye0fQhvHlnMlw6VaOWQQgSPZs+4pK+zcyB+f6jQqu2pkxVodnhUfcJSYyYUFX1l94gBtZe4J5/0fCmMfNcpAqbyVhZWAAvm1zF9YRR0db5hQVZtUudx2i3Idw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729905888; c=relaxed/simple;
	bh=bu++eqOHSvNxyQTCIZifMt/DTHiiAPVPIF2l+JB8vmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXzp/fWAuvSD0X4zux726Q5sZUpt5kKbCwc6/3WG0F58zsCAQs3CA+rA35Z35/KnfvQD2dpv3o4AW3NL/Ovv8D+P+z00Owp6N9CeuUzpK4rztRkzj6y32ouNXgSAqYongT2mwcdkXmzfmBuSIjBMrOXz9KLFqI31gZmBcpYcAq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jnAsrTwt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jnAsrTwt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729905886; x=1761441886;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bu++eqOHSvNxyQTCIZifMt/DTHiiAPVPIF2l+JB8vmA=;
  b=jnAsrTwtZgl5931dpnUkeinzs25ZMvzYJbps9+3StJVtzGQDpkhimUOG
   fcgy6++bgnu/OgrryCtE2BOK4/D8ykiC2SeADC7zClxg+5TDY0aojIpfG
   ZP5F1LuwjGKpd+Jgy9gHcl1Q9QQpKMyu8cCPFxGjniCq9TifBOXOJRdMB
   xeM91HfFNWPN15vwL5on6sRTB4Ztbx9nB2rqYWlKTP18/mc00MBp0lGUa
   U5MPWuwLYzKzFaTRj0+ZuL0I1xfxCRjEiY5nx39ffQz6aIDm+UYOHh/J0
   ei3/bUaoP98vaaXo1WrCDtOxC7uKdTdhctr2Sa7Ae3CTcEAXUqb3sTNp/
   A==;
X-CSE-ConnectionGUID: CLBfKLGEQYunMYqSS34Q5g==
X-CSE-MsgGUID: YFVL8ahCT8qXiAnwWDCZlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33284407"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33284407"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 18:24:42 -0700
X-CSE-ConnectionGUID: 2B2vReUzSuGAJH2Q8emYlA==
X-CSE-MsgGUID: I8b63GOqTTuiFaNrkxVUAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="81183321"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Oct 2024 18:24:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4VXi-000Z7Z-08;
	Sat, 26 Oct 2024 01:24:38 +0000
Date: Sat, 26 Oct 2024 09:24:15 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadfed@meta.com>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, x86@kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 1/2] bpf: add bpf_get_hw_counter kfunc
Message-ID: <202410260919.mccgFynd-lkp@intel.com>
References: <20241024205113.762622-1-vadfed@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024205113.762622-1-vadfed@meta.com>

Hi Vadim,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/selftests-bpf-add-selftest-to-check-rdtsc-jit/20241025-045340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20241024205113.762622-1-vadfed%40meta.com
patch subject: [PATCH bpf-next v2 1/2] bpf: add bpf_get_hw_counter kfunc
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20241026/202410260919.mccgFynd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260919.mccgFynd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260919.mccgFynd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/vdso/processor.h:10,
                    from include/vdso/datapage.h:17,
                    from kernel/bpf/helpers.c:26:
>> arch/x86/include/asm/vdso/processor.h:11:29: error: redefinition of 'rep_nop'
      11 | static __always_inline void rep_nop(void)
         |                             ^~~~~~~
   In file included from include/linux/spinlock_up.h:8,
                    from include/linux/spinlock.h:97,
                    from include/linux/debugobjects.h:6,
                    from include/linux/timer.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:10,
                    from kernel/bpf/helpers.c:4:
   arch/x86/um/asm/processor.h:25:29: note: previous definition of 'rep_nop' with type 'void(void)'
      25 | static __always_inline void rep_nop(void)
         |                             ^~~~~~~
>> arch/x86/include/asm/vdso/processor.h:16:29: error: redefinition of 'cpu_relax'
      16 | static __always_inline void cpu_relax(void)
         |                             ^~~~~~~~~
   arch/x86/um/asm/processor.h:30:29: note: previous definition of 'cpu_relax' with type 'void(void)'
      30 | static __always_inline void cpu_relax(void)
         |                             ^~~~~~~~~
   In file included from include/uapi/linux/filter.h:9,
                    from include/linux/bpf.h:8:
   arch/x86/include/asm/vdso/gettimeofday.h: In function '__arch_get_hw_counter':
   arch/x86/include/asm/vdso/gettimeofday.h:253:34: error: 'VDSO_CLOCKMODE_TSC' undeclared (first use in this function); did you mean 'VDSO_CLOCKMODE_MAX'?
     253 |         if (likely(clock_mode == VDSO_CLOCKMODE_TSC))
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   arch/x86/include/asm/vdso/gettimeofday.h:253:34: note: each undeclared identifier is reported only once for each function it appears in
     253 |         if (likely(clock_mode == VDSO_CLOCKMODE_TSC))
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   arch/x86/include/asm/vdso/gettimeofday.h: In function 'vdso_calc_ns':
>> arch/x86/include/asm/vdso/gettimeofday.h:334:32: error: 'const struct vdso_data' has no member named 'max_cycles'
     334 |         if (unlikely(delta > vd->max_cycles)) {
         |                                ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +/rep_nop +11 arch/x86/include/asm/vdso/processor.h

abc22418db02b9 Vincenzo Frascino 2020-03-20   9  
abc22418db02b9 Vincenzo Frascino 2020-03-20  10  /* REP NOP (PAUSE) is a good thing to insert into busy-wait loops. */
abc22418db02b9 Vincenzo Frascino 2020-03-20 @11  static __always_inline void rep_nop(void)
abc22418db02b9 Vincenzo Frascino 2020-03-20  12  {
abc22418db02b9 Vincenzo Frascino 2020-03-20  13  	asm volatile("rep; nop" ::: "memory");
abc22418db02b9 Vincenzo Frascino 2020-03-20  14  }
abc22418db02b9 Vincenzo Frascino 2020-03-20  15  
abc22418db02b9 Vincenzo Frascino 2020-03-20 @16  static __always_inline void cpu_relax(void)
abc22418db02b9 Vincenzo Frascino 2020-03-20  17  {
abc22418db02b9 Vincenzo Frascino 2020-03-20  18  	rep_nop();
abc22418db02b9 Vincenzo Frascino 2020-03-20  19  }
abc22418db02b9 Vincenzo Frascino 2020-03-20  20  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
