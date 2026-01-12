Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841D8320CD6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 19:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768246194; cv=none; b=tIDg49Uh/VDl2WwJxatjkYKsWDr7z5mSF8uxTy6RFYfP6eJpeMEwigue7IYDXQi/An6xj310ULfQ+1SwF4e375OblSHbGRwZShvdNjJYh3iJlxRP6Sdtgi1x5HIgPMO38UlpKXyr0j51kFjJ4aJ/4KfdPD8bndqmqz5kTzgb/gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768246194; c=relaxed/simple;
	bh=jfDV/HRiXfO1ihdf4ymg7M3/1OuKNnGbJ+nMq/DYs8E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UCPQLUbVY+gCC4a9QY6Cq8CrX0Yo27uGG/p7meTVNdvk9RAb1Ptnjj+XvhhbIzMVuH+3t5PTSl6xJEzi5SrjnzANUhWj3Mij/g5HF/heC6G7/bCNo5rvVJ9ywjaysOSP5w5vRdiiA+uwHwP6X/VRSXf/cpXD1d/7E+Xd6zsYqHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CUYTLOEA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CUYTLOEA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768246193; x=1799782193;
  h=date:from:to:cc:subject:message-id;
  bh=jfDV/HRiXfO1ihdf4ymg7M3/1OuKNnGbJ+nMq/DYs8E=;
  b=CUYTLOEA1ElLAWElGQA6pTA7mdQM3iP1csbMTDhFgrfxFfUBLY2RKdao
   NVL5ak0IUpoistDh1Yj4qr034CZ4Sr6hwwE57/CCLYQ8zdKHW1nTJpCwc
   sGmuTvxBfLG49pK3V/S7H7cUXpLiXw3ak2DzWShmPMJsdi33Pik1uEib0
   KVkZnAvzcuJYvoE/UF2T29QLhiC49LgNJupu3Q4fSquQb4yGp5EsdkBiI
   uoqNTU6aM+culeBV1Mh6p3iGOWESE3TrHH8K3tk4KViG9hwNJ0XPdQiQP
   et2fq8v6chJdJb+bd9SrBj04b4CvfUFVeemnagJWHUmsDdfEGjVkV6Eox
   w==;
X-CSE-ConnectionGUID: CgXBRybSRgymKdUxmOZCQQ==
X-CSE-MsgGUID: +x5wRjMNTsawnDIxKi69Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69440261"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="69440261"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 11:29:51 -0800
X-CSE-ConnectionGUID: Bq/vyE/aTR+SYwPIZTJmFg==
X-CSE-MsgGUID: Se/nSa8ITmCxBb/edG29XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="203332884"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jan 2026 11:29:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfNbn-00000000DnE-1lWb;
	Mon, 12 Jan 2026 19:29:47 +0000
Date: Tue, 13 Jan 2026 03:29:45 +0800
From: kernel test robot <lkp@intel.com>
To: Hou Wenlong <houwenlong.hwl@antgroup.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/urgent 2/2]
 arch/x86/kernel/traps.c:400:14: warning: no previous prototype for
 'handle_bug'
Message-ID: <202601130348.XDX2GfU6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/urgent
head:   695d896472d6543523de43110b0016b8b4469643
commit: 695d896472d6543523de43110b0016b8b4469643 [2/2] x86_64/bug: Handle __WARN_printf() trap in early_fixup_exception()
config: i386-buildonly-randconfig-001-20260113 (https://download.01.org/0day-ci/archive/20260113/202601130348.XDX2GfU6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130348.XDX2GfU6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130348.XDX2GfU6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/traps.c:400:14: warning: no previous prototype for 'handle_bug' [-Wmissing-prototypes]
     400 | noinstr bool handle_bug(struct pt_regs *regs)
         |              ^~~~~~~~~~


vim +/handle_bug +400 arch/x86/kernel/traps.c

   399	
 > 400	noinstr bool handle_bug(struct pt_regs *regs)
   401	{
   402		unsigned long addr = regs->ip;
   403		bool handled = false;
   404		int ud_type, ud_len;
   405		s32 ud_imm;
   406	
   407		ud_type = decode_bug(addr, &ud_imm, &ud_len);
   408		if (ud_type == BUG_NONE)
   409			return handled;
   410	
   411		/*
   412		 * All lies, just get the WARN/BUG out.
   413		 */
   414		instrumentation_begin();
   415		/*
   416		 * Normally @regs are unpoisoned by irqentry_enter(), but handle_bug()
   417		 * is a rare case that uses @regs without passing them to
   418		 * irqentry_enter().
   419		 */
   420		kmsan_unpoison_entry_regs(regs);
   421		/*
   422		 * Since we're emulating a CALL with exceptions, restore the interrupt
   423		 * state to what it was at the exception site.
   424		 */
   425		if (regs->flags & X86_EFLAGS_IF)
   426			raw_local_irq_enable();
   427	
   428		switch (ud_type) {
   429		case BUG_UD1_WARN:
   430			if (report_bug_entry((void *)pt_regs_val(regs, ud_imm), regs) == BUG_TRAP_TYPE_WARN)
   431				handled = true;
   432			break;
   433	
   434		case BUG_UD2:
   435			if (report_bug(regs->ip, regs) == BUG_TRAP_TYPE_WARN) {
   436				handled = true;
   437				break;
   438			}
   439			fallthrough;
   440	
   441		case BUG_UDB:
   442		case BUG_LOCK:
   443			if (handle_cfi_failure(regs) == BUG_TRAP_TYPE_WARN) {
   444				handled = true;
   445				break;
   446			}
   447			break;
   448	
   449		case BUG_UD1_UBSAN:
   450			if (IS_ENABLED(CONFIG_UBSAN_TRAP)) {
   451				pr_crit("%s at %pS\n",
   452					report_ubsan_failure(ud_imm),
   453					(void *)regs->ip);
   454			}
   455			break;
   456	
   457		default:
   458			break;
   459		}
   460	
   461		/*
   462		 * When continuing, and regs->ip hasn't changed, move it to the next
   463		 * instruction. When not continuing execution, restore the instruction
   464		 * pointer.
   465		 */
   466		if (handled) {
   467			if (regs->ip == addr)
   468				regs->ip += ud_len;
   469		} else {
   470			regs->ip = addr;
   471		}
   472	
   473		if (regs->flags & X86_EFLAGS_IF)
   474			raw_local_irq_disable();
   475		instrumentation_end();
   476	
   477		return handled;
   478	}
   479	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
