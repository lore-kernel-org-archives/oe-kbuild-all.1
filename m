Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7823148C5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 09:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777975131; cv=none; b=u7/lhv5banfrMhyLzCXLsIGPpp8mylhsLlbwS41ZQAHeoHydZF5o5+otVBJUXZnrbnJkB77lsnRsxEEH4UTuwSF11RbnWQOZe24beyE4rxfH8koxWAR7wj8/t+o6acKVLVQ+1+XRYpoXoKWF10NVWWcXRa0tgZfvdziFX9gSroY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777975131; c=relaxed/simple;
	bh=qHGClcuFdhwH2M0ZUCbNxsrsMu+caPrSkpw+3xdkHp0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ml2trUmH9oI3WjQNhKobUUJ7kIdrP2f68bocp4Y4VC8CwC6MnM/Zvmnt5nsrFSSi2JQhvAdB2t2hbQKfoxy3KBRh8NjWEClCQHfHBZG50QW+CJSIBgZgsTj4WAaFH1LQiXX/5t73Scr03BCM1mR8wqFJPBy9ESlppc3BHXWbX7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H4Jos+ih; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4Jos+ih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777975131; x=1809511131;
  h=date:from:to:cc:subject:message-id;
  bh=qHGClcuFdhwH2M0ZUCbNxsrsMu+caPrSkpw+3xdkHp0=;
  b=H4Jos+ihJlmZHVtNU0s8I2/9ZNlYvKxNq8jQJ+661IAZCGHLQ8TS2oKj
   m4kbpHN8H690UIbgml9a7/XvpCk07UvBohmXBAhcQN3XIpk2w6AJpy7ds
   oM65cifvVJMR4ByAJVLd+m7IV+TzzfaMWIWSbENDNZEZItftEEe/vfY4q
   dsNGeFlBNQIrgcIWFsriivLSwCSVAzxMiCXAB/OyHoHnpz3z5iNTzE4g7
   9L3S5WXW97t5MWfxMsQL9HyqjY8mftnHQdiGGF15mafi3YWQfpTl+wnRq
   rXKag8LjzrUM/p5GFNveiDVj6hOQU4kr1NL8OMVIWesrwiTuSD/BnKHds
   A==;
X-CSE-ConnectionGUID: dKb3XzNXSxKoikTv0jaASg==
X-CSE-MsgGUID: 0NwPjsQnSrC/HsaiiOygDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="96268744"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="96268744"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 02:58:47 -0700
X-CSE-ConnectionGUID: dJ9zFDXcTb6KmI2wjNAN8g==
X-CSE-MsgGUID: G63o9HdwSaKBuxdc+0K+FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="273918769"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 May 2026 02:58:45 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKCY6-0000000003V-1tAG;
	Tue, 05 May 2026 09:58:42 +0000
Date: Tue, 05 May 2026 17:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lindholm-alpha:entry 1/5] arch/alpha/kernel/ptrace.c:252
 alpha_elf_gregs_set() warn: inconsistent indenting
Message-ID: <202605051745.R7BnZxjn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git entry
head:   179e607df962ebcf32040f8e9091bf75006e8970
commit: 798dd93852a44b4b649ea71287dad554b0579f90 [1/5] alpha: enable regset-based ptrace and core dumps
config: alpha-randconfig-r071-20260505 (https://download.01.org/0day-ci/archive/20260505/202605051745.R7BnZxjn-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605051745.R7BnZxjn-lkp@intel.com/

New smatch warnings:
arch/alpha/kernel/ptrace.c:252 alpha_elf_gregs_set() warn: inconsistent indenting
arch/alpha/kernel/ptrace.c:473 arch_ptrace() warn: inconsistent indenting

Old smatch warnings:
arch/alpha/kernel/ptrace.c:501 arch_ptrace() warn: inconsistent indenting
arch/alpha/kernel/ptrace.c:505 arch_ptrace() warn: inconsistent indenting

vim +252 arch/alpha/kernel/ptrace.c

   169	
   170	static void alpha_elf_gregs_set(struct task_struct *child,
   171				const elf_greg_t *src,
   172				size_t nwords)
   173	{
   174		struct pt_regs *pt = task_pt_regs(child);
   175		struct thread_info *ti = task_thread_info(child);
   176		struct switch_stack *sw = ((struct switch_stack *)pt) - 1;
   177	
   178		/* GPRs r0..r8 live in pt_regs */
   179		if (nwords > 0)
   180			pt->r0 = src[0];
   181		if (nwords > 1)
   182			pt->r1 = src[1];
   183		if (nwords > 2)
   184			pt->r2 = src[2];
   185		if (nwords > 3)
   186			pt->r3 = src[3];
   187		if (nwords > 4)
   188			pt->r4 = src[4];
   189		if (nwords > 5)
   190			pt->r5 = src[5];
   191		if (nwords > 6)
   192			pt->r6 = src[6];
   193		if (nwords > 7)
   194			pt->r7 = src[7];
   195		if (nwords > 8)
   196			pt->r8 = src[8];
   197	
   198		/* r9..r15 live in switch_stack */
   199		if (nwords > 9)
   200			sw->r9 = src[9];
   201		if (nwords > 10)
   202			sw->r10 = src[10];
   203		if (nwords > 11)
   204			sw->r11 = src[11];
   205		if (nwords > 12)
   206			sw->r12 = src[12];
   207		if (nwords > 13)
   208			sw->r13 = src[13];
   209		if (nwords > 14)
   210			sw->r14 = src[14];
   211		if (nwords > 15)
   212			sw->r15 = src[15];
   213	
   214		/* r16..r28 live in pt_regs */
   215		if (nwords > 16)
   216			pt->r16 = src[16];
   217		if (nwords > 17)
   218			pt->r17 = src[17];
   219		if (nwords > 18)
   220			pt->r18 = src[18];
   221		if (nwords > 19)
   222			pt->r19 = src[19];
   223		if (nwords > 20)
   224			pt->r20 = src[20];
   225		if (nwords > 21)
   226			pt->r21 = src[21];
   227		if (nwords > 22)
   228			pt->r22 = src[22];
   229		if (nwords > 23)
   230			pt->r23 = src[23];
   231		if (nwords > 24)
   232			pt->r24 = src[24];
   233		if (nwords > 25)
   234			pt->r25 = src[25];
   235		if (nwords > 26)
   236			pt->r26 = src[26];
   237		if (nwords > 27)
   238			pt->r27 = src[27];
   239		if (nwords > 28)
   240			pt->r28 = src[28];
   241	
   242		/* gp, usp, pc, unique */
   243		if (nwords > 29)
   244			pt->gp = src[29];
   245	
   246		if (nwords > 30) {
   247			ti->pcb.usp = src[30];
   248			/*
   249			 * If someone ever does this to current (rare), keep the
   250			 * hardware usp consistent.
   251			 */
 > 252		if (child == current)
   253			wrusp(src[30]);
   254		}
   255	
   256		if (nwords > 31)
   257			pt->pc = src[31];
   258	
   259		if (nwords > 32)
   260			ti->pcb.unique = src[32];
   261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
