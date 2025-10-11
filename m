Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE91163
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 00:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760141928; cv=none; b=mCsssMHRDd4j6kYA+JmYYfuo6tHPtz3bwgH2ctVEH7+jTpow6gajbaQNHLx2vVurOCuYTkUXO9FE7aDj/68gKki4Dm8OMGBFrDUHvjVV6Ka/A+JGrM4H8YqZeNF5pyW30JC5AGY1W0iInYszLOwO7glTspn7CJjshTiQsgwouL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760141928; c=relaxed/simple;
	bh=Rl5ernR/BsvDpwvmJQYI9yMDXU108XS9RXqEHEO35N8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rzgcyKmNREsC9/qBQBpVavX/H22sw/AWfT6NOCNSGJrZU1qM7G7bpZF2AiidLisZElMhRcKQE7Mq70Ox2CxNICRAJr8Y4tGvByXICW3Mal+SvMJbkH8Qb/V2AJq+bl9uxkao0gvWyH3pnNPznq0FH1HFhPTXXT5kj9Ro+KfAnAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FICFuHBi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FICFuHBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760141926; x=1791677926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rl5ernR/BsvDpwvmJQYI9yMDXU108XS9RXqEHEO35N8=;
  b=FICFuHBi2vo4R1YCsdK0hWX1S0Ahw4fe3kJKnnsahUcfd1ju9H+Rp9tK
   kRKAlFppdfTBhh9V5MfitNTuuvSqc3Lru8n7ajV7ktf07XJ9cgJPYN1qo
   iDhIUi6n4WOgVOq/KHaOAgHmlWUZT8OugBaY8H5yXlyUdJyTjsBpTbg2H
   gA+lWo2U+h+1WZWO9olWj+Y0yoq1J+DHnA7z7ecupLx9Rum18ii3HkmY2
   xm8kYMUuYIsQDeI214nr+8bcSlK9n5hj8Vb1wFey3r4JLtNV7TdDyEa5V
   pjEIcHHGzckmOWHej//le4vgzve/Xpy4Tfqsr5KgIq6HKl5xv2+4wA45G
   g==;
X-CSE-ConnectionGUID: wCzYDgR0Q3Cr9zhADyQp+Q==
X-CSE-MsgGUID: kKcDiCGqQZeXKC+70fj89g==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="73049976"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="73049976"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 17:18:45 -0700
X-CSE-ConnectionGUID: n2JHHqiQSaW06+qxAdc7Gg==
X-CSE-MsgGUID: LBSkd54tQ+K/zluTvRlvdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="185477302"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Oct 2025 17:18:44 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7NJq-0003K7-0u;
	Sat, 11 Oct 2025 00:18:42 +0000
Date: Sat, 11 Oct 2025 08:18:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [jpoimboe:objtool/merge 70/70] include/linux/annotate.h:113:38:
 error: expected string literal before '__ASM_ANNOTATE'
Message-ID: <202510110855.gkMGp6l8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool/merge
head:   3e27bab1833984d06315b7bad8bc4492719bac7e
commit: 3e27bab1833984d06315b7bad8bc4492719bac7e [70/70] Merge remote-tracking branch 'tip/x86/core' into objtool/merge
config: arc-randconfig-002-20251011 (https://download.01.org/0day-ci/archive/20251011/202510110855.gkMGp6l8-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110855.gkMGp6l8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110855.gkMGp6l8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/objtool.h:6,
                    from drivers/misc/lkdtm/perms.c:12:
>> include/linux/annotate.h:113:38: error: expected string literal before '__ASM_ANNOTATE'
     113 | #define ANNOTATE_NOCFI_SYM(sym)  asm(__ASM_ANNOTATE(sym, ANNOTYPE_NOCFI))
         |                                      ^~~~~~~~~~~~~~
   drivers/misc/lkdtm/perms.c:93:1: note: in expansion of macro 'ANNOTATE_NOCFI_SYM'
      93 | ANNOTATE_NOCFI_SYM(execute_location);
         | ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/objtool.h:6,
                    from perms.c:12:
>> include/linux/annotate.h:113:38: error: expected string literal before '__ASM_ANNOTATE'
     113 | #define ANNOTATE_NOCFI_SYM(sym)  asm(__ASM_ANNOTATE(sym, ANNOTYPE_NOCFI))
         |                                      ^~~~~~~~~~~~~~
   perms.c:93:1: note: in expansion of macro 'ANNOTATE_NOCFI_SYM'
      93 | ANNOTATE_NOCFI_SYM(execute_location);
         | ^~~~~~~~~~~~~~~~~~


vim +/__ASM_ANNOTATE +113 include/linux/annotate.h

    69	
    70	/*
    71	 * This should be used immediately before an indirect jump/call. It tells
    72	 * objtool the subsequent indirect jump/call is vouched safe for retpoline
    73	 * builds.
    74	 */
    75	#define ANNOTATE_RETPOLINE_SAFE		ASM_ANNOTATE(ANNOTYPE_RETPOLINE_SAFE)
    76	/*
    77	 * See linux/instrumentation.h
    78	 */
    79	#define ANNOTATE_INSTR_BEGIN(label)	ASM_ANNOTATE_LABEL(label, ANNOTYPE_INSTR_BEGIN)
    80	#define ANNOTATE_INSTR_END(label)	ASM_ANNOTATE_LABEL(label, ANNOTYPE_INSTR_END)
    81	/*
    82	 * objtool annotation to ignore the alternatives and only consider the original
    83	 * instruction(s).
    84	 */
    85	#define ANNOTATE_IGNORE_ALTERNATIVE	ASM_ANNOTATE(ANNOTYPE_IGNORE_ALTS)
    86	/*
    87	 * This macro indicates that the following intra-function call is valid.
    88	 * Any non-annotated intra-function call will cause objtool to issue a warning.
    89	 */
    90	#define ANNOTATE_INTRA_FUNCTION_CALL	ASM_ANNOTATE(ANNOTYPE_INTRA_FUNCTION_CALL)
    91	/*
    92	 * Use objtool to validate the entry requirement that all code paths do
    93	 * VALIDATE_UNRET_END before RET.
    94	 *
    95	 * NOTE: The macro must be used at the beginning of a global symbol, otherwise
    96	 * it will be ignored.
    97	 */
    98	#define ANNOTATE_UNRET_BEGIN		ASM_ANNOTATE(ANNOTYPE_UNRET_BEGIN)
    99	/*
   100	 * This should be used to refer to an instruction that is considered
   101	 * terminating, like a noreturn CALL or UD2 when we know they are not -- eg
   102	 * WARN using UD2.
   103	 */
   104	#define ANNOTATE_REACHABLE(label)	ASM_ANNOTATE_LABEL(label, ANNOTYPE_REACHABLE)
   105	/*
   106	 * This should not be used; it annotates away CFI violations. There are a few
   107	 * valid use cases like kexec handover to the next kernel image, and there is
   108	 * no security concern there.
   109	 *
   110	 * There are also a few real issues annotated away, like EFI because we can't
   111	 * control the EFI code.
   112	 */
 > 113	#define ANNOTATE_NOCFI_SYM(sym)		asm(__ASM_ANNOTATE(sym, ANNOTYPE_NOCFI))
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
