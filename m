Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAA3282EE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Apr 2025 04:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743826063; cv=none; b=lob6rAsbPkFfPGGEWoQoxUf5YrnleVZ80XtcD2JqRi/IUr8sFXy/iCC9UGUvRUHb99NvAsaJ0+ovFakL8r0qiich3/sceSvzzWC77QM7q49MLATS2APBDeyuMJYIWWnUb92m67jKcbLZ5NZ0Fj0o+Mio/aREM5VdTZ6nILBWdlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743826063; c=relaxed/simple;
	bh=SsV2HiAzUp1ehnEBUIyBEul6kXNw0vinIw36ivI8U1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KQihQBkUXOIyuNebw2huHAKjw4S0MQX2EIMee2gasanDPQBlquM7w9irM84JngIYHNq8EX7ZQqWg4APrWrh4hBw5h2E5kxfU7hmwcNRdCP3wDsFhmRrX9Pf6RnROa6Zc0llnAoSK2FTzpEUHmdUayW6YK04nrZh9hPlVA+aCxew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M+CJQkn/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+CJQkn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743826061; x=1775362061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SsV2HiAzUp1ehnEBUIyBEul6kXNw0vinIw36ivI8U1Y=;
  b=M+CJQkn/8EjKZt4QPRws+MjYrbvcUpf8pBrk0TwELQo8hsa9+MQ7/UVu
   DrawqVAAWRf7YDOLTOW+hUwJmee5Q01fDKrD1Bd8voZ06cRt8/evZZKAp
   Sk43ebvz5e8T+dmf8sq+ilbFTiVSJgWdhP2FJwieJvc5qO03aWzVhct39
   35j90vDzkHFoWMQ3fSPnF8N5Gq26kzLtTtGtyH/5l7EjVIVe8AN+QokhD
   F/DY8DKPCzW0ovsUuLe2izls/2Yg+Rvx0+j6TAYN+1vtW+v0Dooqu7T55
   3DgReApc5B1ch6V0+uZf7xylErFqOVHlpXk0diVfrcckjrDTay5Gxnxg5
   Q==;
X-CSE-ConnectionGUID: gPJx2G9RRcClDYLslqYf/g==
X-CSE-MsgGUID: B/cOAH8AQFig2Ci9KmJF/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="70651849"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="70651849"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 21:07:39 -0700
X-CSE-ConnectionGUID: 3w94VfL1QeapE0aqkL0KmA==
X-CSE-MsgGUID: msHq6w3gQqiqGZo119gZQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="131620025"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Apr 2025 21:07:38 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0uoi-0001nx-24;
	Sat, 05 Apr 2025 04:07:36 +0000
Date: Sat, 5 Apr 2025 12:07:01 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-werror 6/7] arch/x86/kernel/fpu/xstate.h:209:13:
 warning: unused variable 'hmask'
Message-ID: <202504051255.5YHdRseN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-werror
head:   d9200f830505ef0415720e0bd90fe183e62222c5
commit: 31eabb43d04f7a788da11c3c06cb00ace7e6bd2e [6/7] x86/alternative: Improve code generation readability
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250405/202504051255.5YHdRseN-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504051255.5YHdRseN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504051255.5YHdRseN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/fpu/init.c:15:
   arch/x86/kernel/fpu/xstate.h: In function 'os_xsave':
   arch/x86/kernel/fpu/xstate.h:215:61: error: macro "__ALTERNATIVE_3" passed 7 arguments, but takes just 5
     215 |         XSTATE_XSAVE(&fpstate->regs.xsave, lmask, hmask, err);
         |                                                             ^
   In file included from arch/x86/include/asm/page_64.h:9,
                    from arch/x86/include/asm/page.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from arch/x86/include/asm/tlbflush.h:5,
                    from arch/x86/kernel/fpu/init.c:6:
   arch/x86/include/asm/alternative.h:184: note: macro "__ALTERNATIVE_3" defined here
     184 | #define __ALTERNATIVE_3(oldinstr, newinstr1, ft_flags1,                 \
         | 
   arch/x86/include/asm/alternative.h:207:9: error: expected ':' or ')' before '__ALTERNATIVE_3'
     207 |         __ALTERNATIVE_3("\n\t" oldinstr, newinstr1, ft_flags1,          \
         |         ^~~~~~~~~~~~~~~
   arch/x86/kernel/fpu/xstate.h:139:28: note: in expansion of macro 'ALTERNATIVE_3'
     139 |         asm volatile("1: " ALTERNATIVE_3(XSAVE,                         \
         |                            ^~~~~~~~~~~~~
   arch/x86/kernel/fpu/xstate.h:215:9: note: in expansion of macro 'XSTATE_XSAVE'
     215 |         XSTATE_XSAVE(&fpstate->regs.xsave, lmask, hmask, err);
         |         ^~~~~~~~~~~~
   In file included from arch/x86/kernel/fpu/init.c:15:
>> arch/x86/kernel/fpu/xstate.h:209:13: warning: unused variable 'hmask' [-Wunused-variable]
     209 |         u32 hmask = mask >> 32;
         |             ^~~~~
>> arch/x86/kernel/fpu/xstate.h:208:13: warning: unused variable 'lmask' [-Wunused-variable]
     208 |         u32 lmask = mask;
         |             ^~~~~


vim +/hmask +209 arch/x86/kernel/fpu/xstate.h

672365477ae8afc Chang S. Bae    2021-10-21  198  
df95b0f1aa56dfa Thomas Gleixner 2021-10-15  199  /*
df95b0f1aa56dfa Thomas Gleixner 2021-10-15  200   * Save processor xstate to xsave area.
df95b0f1aa56dfa Thomas Gleixner 2021-10-15  201   *
df95b0f1aa56dfa Thomas Gleixner 2021-10-15  202   * Uses either XSAVE or XSAVEOPT or XSAVES depending on the CPU features
df95b0f1aa56dfa Thomas Gleixner 2021-10-15  203   * and command line options. The choice is permanent until the next reboot.
df95b0f1aa56dfa Thomas Gleixner 2021-10-15  204   */
073e627a4537e68 Thomas Gleixner 2021-10-13  205  static inline void os_xsave(struct fpstate *fpstate)
df95b0f1aa56dfa Thomas Gleixner 2021-10-15  206  {
073e627a4537e68 Thomas Gleixner 2021-10-13  207  	u64 mask = fpstate->xfeatures;
df95b0f1aa56dfa Thomas Gleixner 2021-10-15 @208  	u32 lmask = mask;
df95b0f1aa56dfa Thomas Gleixner 2021-10-15 @209  	u32 hmask = mask >> 32;
df95b0f1aa56dfa Thomas Gleixner 2021-10-15  210  	int err;
df95b0f1aa56dfa Thomas Gleixner 2021-10-15  211  
df95b0f1aa56dfa Thomas Gleixner 2021-10-15  212  	WARN_ON_FPU(!alternatives_patched);
5529acf47ec31ec Thomas Gleixner 2021-10-21  213  	xfd_validate_state(fpstate, mask, false);
df95b0f1aa56dfa Thomas Gleixner 2021-10-15  214  
073e627a4537e68 Thomas Gleixner 2021-10-13  215  	XSTATE_XSAVE(&fpstate->regs.xsave, lmask, hmask, err);
df95b0f1aa56dfa Thomas Gleixner 2021-10-15  216  
df95b0f1aa56dfa Thomas Gleixner 2021-10-15  217  	/* We should never fault when copying to a kernel buffer: */
df95b0f1aa56dfa Thomas Gleixner 2021-10-15  218  	WARN_ON_FPU(err);
df95b0f1aa56dfa Thomas Gleixner 2021-10-15  219  }
df95b0f1aa56dfa Thomas Gleixner 2021-10-15  220  

:::::: The code at line 209 was first introduced by commit
:::::: df95b0f1aa56dfa71a0ef657e3e62294ee6d9034 x86/fpu: Move os_xsave() and os_xrstor() to core

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
