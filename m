Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4331C2D7DDE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 07:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762845306; cv=none; b=K12V/ZIwoBlhFp668xk6RKAF9QFzOSCq5KWSsvVKH9qRy3IMdTlrfdBUsjli5HyDwdOd9LJSy3HQULtuMKZZFnsUfbZ+MJd5FY2fHtaONkIQ9HbozqX06T8HZ5ExeMJsNUUKnmoQcuoKoSFIjAVhaFpUlqELQculMRNaWIbyM0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762845306; c=relaxed/simple;
	bh=KViPjW2BfRPnwNhaOPdvx5E1YWmaEuy47N0tCuQeCOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eCF2nAnhUzVENePG0nnyP1TDOuQq3O+TfHuOFtBBTq0fz0+PZN/XalEB8sJgFnv+T5pLt7wGjqWegP2LdcL5mmCeiwTu+G/6/DZUYHx7IgGQu44LgWuUKCgeUCg/Jzs5RYp3XcDAyh6dGYJyV7vqzQy+IX9PhiIc3ChczPmzAvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABXiJQMA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABXiJQMA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762845305; x=1794381305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KViPjW2BfRPnwNhaOPdvx5E1YWmaEuy47N0tCuQeCOY=;
  b=ABXiJQMAcM3bBsHNZOEpsR+j/TmLUfEHDmD5erftoesynSeo3v9hr1hP
   NsLlpUBu4keSHclZbHlVmI/czUu6RpWnZJga+XTHrqeNvLf8QMA5/aXZC
   8URyBdvKAun70Kzf5bRggkcEJYT+XWSw1M3gqJp0cKzwImNCyD1h2Pizm
   1hrj/hO46amidvK3gpy/ULh+jsKAhuVZCwiekp34zHQhlPdpdlb5vETGX
   5T8enkCRtTXyiuwwKOlKifF5iDnFTtVfkD7snb27ptZYr22Yhnk7BRmai
   cnnF9ol8YAYg3i3yf5s2484/7629MLiJjEMKZwq4OFMJSqZRMWe8Yamee
   Q==;
X-CSE-ConnectionGUID: VjEpO0unRH6+sT7UFBz0Cg==
X-CSE-MsgGUID: 3SEgNy/eTnikBTncjowk1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="67509289"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; 
   d="scan'208";a="67509289"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 23:14:59 -0800
X-CSE-ConnectionGUID: 6wTJj2DfSgeethEGRYPC3g==
X-CSE-MsgGUID: s4agIsm3TBq3gWtKvhhrEQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Nov 2025 23:14:58 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIiae-0002tz-0j;
	Tue, 11 Nov 2025 07:14:56 +0000
Date: Tue, 11 Nov 2025 15:14:17 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/bugs 10/12] arch/x86/kernel/traps.c:426:21: error:
 implicit declaration of function 'report_bug_entry'; did you mean
 'report_bug'?
Message-ID: <202511111520.c8nM3yMl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/bugs
head:   ab2670d0a3af9012cda95e696875f0f5baf98564
commit: f13fcc54fe7e8767271acf675ed71951eba37bbb [10/12] x86_64/bug: Implement __WARN_printf()
config: x86_64-buildonly-randconfig-001-20251111 (https://download.01.org/0day-ci/archive/20251111/202511111520.c8nM3yMl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511111520.c8nM3yMl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511111520.c8nM3yMl-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/traps.c: In function 'handle_bug':
>> arch/x86/kernel/traps.c:426:21: error: implicit declaration of function 'report_bug_entry'; did you mean 'report_bug'? [-Wimplicit-function-declaration]
     426 |                 if (report_bug_entry((void *)pt_regs_val(regs, ud_imm), regs) == BUG_TRAP_TYPE_WARN)
         |                     ^~~~~~~~~~~~~~~~
         |                     report_bug


vim +426 arch/x86/kernel/traps.c

   395	
   396	static noinstr bool handle_bug(struct pt_regs *regs)
   397	{
   398		unsigned long addr = regs->ip;
   399		bool handled = false;
   400		int ud_type, ud_len;
   401		s32 ud_imm;
   402	
   403		ud_type = decode_bug(addr, &ud_imm, &ud_len);
   404		if (ud_type == BUG_NONE)
   405			return handled;
   406	
   407		/*
   408		 * All lies, just get the WARN/BUG out.
   409		 */
   410		instrumentation_begin();
   411		/*
   412		 * Normally @regs are unpoisoned by irqentry_enter(), but handle_bug()
   413		 * is a rare case that uses @regs without passing them to
   414		 * irqentry_enter().
   415		 */
   416		kmsan_unpoison_entry_regs(regs);
   417		/*
   418		 * Since we're emulating a CALL with exceptions, restore the interrupt
   419		 * state to what it was at the exception site.
   420		 */
   421		if (regs->flags & X86_EFLAGS_IF)
   422			raw_local_irq_enable();
   423	
   424		switch (ud_type) {
   425		case BUG_UD1_WARN:
 > 426			if (report_bug_entry((void *)pt_regs_val(regs, ud_imm), regs) == BUG_TRAP_TYPE_WARN)
   427				handled = true;
   428			break;
   429	
   430		case BUG_UD2:
   431			if (report_bug(regs->ip, regs) == BUG_TRAP_TYPE_WARN) {
   432				handled = true;
   433				break;
   434			}
   435			fallthrough;
   436	
   437		case BUG_UDB:
   438		case BUG_LOCK:
   439			if (handle_cfi_failure(regs) == BUG_TRAP_TYPE_WARN) {
   440				handled = true;
   441				break;
   442			}
   443			break;
   444	
   445		case BUG_UD1_UBSAN:
   446			if (IS_ENABLED(CONFIG_UBSAN_TRAP)) {
   447				pr_crit("%s at %pS\n",
   448					report_ubsan_failure(ud_imm),
   449					(void *)regs->ip);
   450			}
   451			break;
   452	
   453		default:
   454			break;
   455		}
   456	
   457		/*
   458		 * When continuing, and regs->ip hasn't changed, move it to the next
   459		 * instruction. When not continuing execution, restore the instruction
   460		 * pointer.
   461		 */
   462		if (handled) {
   463			if (regs->ip == addr)
   464				regs->ip += ud_len;
   465		} else {
   466			regs->ip = addr;
   467		}
   468	
   469		if (regs->flags & X86_EFLAGS_IF)
   470			raw_local_irq_disable();
   471		instrumentation_end();
   472	
   473		return handled;
   474	}
   475	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
