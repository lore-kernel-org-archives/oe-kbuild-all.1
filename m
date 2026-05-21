Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734E2335BA8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 02:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779332058; cv=none; b=Qwr/CZU1TGtZLOYVsCXpNZyblR+kaeM8TR3WjR3RaeHk+U7y4Dr2BHRSdFCwPPyziq4ydAV62lALqr6kxuHYRkIpVfkRxNlHm7oxjdZGH0A5yzsnWwolAbUdReVZfl1E8Pwe0ivWSKpLuExwExD0NwrzG4/mYQ9RAfFaeN600p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779332058; c=relaxed/simple;
	bh=yTJAZ4bfJAa86PXUV8OAevL3D9E2OdC4DNVKs2FWusA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QgFMLT83QzGVh6cPp7oYbxeHy6bru0q85IoxC0bwsjoFwrQYd2PNCaGh1B5m/PYDtOvN7veTXwJc0sA9jcp73EWGw/qjRphe2jZ1pNT0BUkcMTqm1LWeeQbTggo7Jpquc9CKd/6zVasKwbmD+HcoP7w9IcUn0bA9NDXoluI7Fbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=accJ4cxe; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="accJ4cxe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779332056; x=1810868056;
  h=date:from:to:cc:subject:message-id;
  bh=yTJAZ4bfJAa86PXUV8OAevL3D9E2OdC4DNVKs2FWusA=;
  b=accJ4cxeXio6XKSQQpDZW9EyW5mQNzDKPW7scBDAbuY/9JCx1K2tIrq3
   mnjejQmJuMW5KScGPjtGsh0MwB17zczZxNt9du6yYSoHa6CXMMmusniXA
   6GZz4CZa8+H7+fFKgW67+bm8rHqRgWzViAsawvKa5T+XZ3CM1cFypTVka
   7DnHaeos0Z1f1pvp/AbE5Vakyki1zPqXevz+7SoCmVFOZ7o00nO633OIZ
   eqdy1Q0OEGwiGzDLdUX9syxgTsvcLcXyN3978hVrAZ6Fd+jEgn3jJdWqu
   ot3VDXT7w9Dl0WOA95zEYRgUXu60ObQX5eeysKiaI3VQ0r6izddZB09ie
   g==;
X-CSE-ConnectionGUID: VsX/sqr0QCaFgYfhs1ntYw==
X-CSE-MsgGUID: qPm48IyGT96cyCi4beFndw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="102919438"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="102919438"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 19:54:15 -0700
X-CSE-ConnectionGUID: S2qdOa6FTmuKDl9N59vaVQ==
X-CSE-MsgGUID: F8wDVapMTeetehrdZKc2iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="263912531"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 May 2026 19:54:13 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPtXa-000000004Fn-1a11;
	Thu, 21 May 2026 02:53:48 +0000
Date: Thu, 21 May 2026 10:50:47 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 615/1130]
 arch/riscv/kernel/traps_misaligned.c:229:19: warning: variable 'cap' set but
 not used
Message-ID: <202605211043.qRLjrMRt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: a5df903b119e701e2c0f683bbefb3951d206159e [615/1130] riscv: cheri: Implement unaligned traps for CHERI
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20260521/202605211043.qRLjrMRt-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211043.qRLjrMRt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211043.qRLjrMRt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kernel/traps_misaligned.c: In function 'handle_scalar_misaligned_load':
>> arch/riscv/kernel/traps_misaligned.c:229:19: warning: variable 'cap' set but not used [-Wunused-but-set-variable]
     229 |         uintptr_t cap = 0;
         |                   ^~~
   arch/riscv/kernel/traps_misaligned.c: In function 'handle_scalar_misaligned_store':
   arch/riscv/kernel/traps_misaligned.c:361:19: warning: variable 'cap' set but not used [-Wunused-but-set-variable]
     361 |         uintptr_t cap = 0;
         |                   ^~~


vim +/cap +229 arch/riscv/kernel/traps_misaligned.c

   222	
   223	static int handle_scalar_misaligned_load(struct pt_regs *regs)
   224	{
   225		union reg_data val;
   226		uintptr_t epc = regs->epc;
   227		unsigned long insn;
   228		unsigned long addr = regs->badaddr;
 > 229		uintptr_t cap = 0;
   230		int fp = 0, shift = 0, len = 0;
   231	
   232		perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
   233	
   234		*this_cpu_ptr(&misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED;
   235	
   236		if (!unaligned_enabled)
   237			return -1;
   238	
   239		if (user_mode(regs) && (current->thread.align_ctl & PR_UNALIGN_SIGBUS))
   240			return -1;
   241	
   242		if (get_insn(regs, epc, &insn))
   243			return -1;
   244	
   245		regs->epc = 0;
   246	
   247		if ((insn & INSN_MASK_LW) == INSN_MATCH_LW) {
   248			len = 4;
   249			shift = 8 * (sizeof(unsigned long) - len);
   250			cap = GET_RS1(insn, regs);
   251	#if defined(CONFIG_64BIT)
   252		} else if ((insn & INSN_MASK_LD) == INSN_MATCH_LD) {
   253			len = 8;
   254			shift = 8 * (sizeof(unsigned long) - len);
   255			cap = GET_RS1(insn, regs);
   256		} else if ((insn & INSN_MASK_LWU) == INSN_MATCH_LWU) {
   257			len = 4;
   258			cap = GET_RS1(insn, regs);
   259	#endif
   260		} else if ((insn & INSN_MASK_FLD) == INSN_MATCH_FLD) {
   261			fp = 1;
   262			len = 8;
   263			cap = GET_RS1(insn, regs);
   264		} else if ((insn & INSN_MASK_FLW) == INSN_MATCH_FLW) {
   265			fp = 1;
   266			len = 4;
   267			cap = GET_RS1(insn, regs);
   268		} else if ((insn & INSN_MASK_LH) == INSN_MATCH_LH) {
   269			len = 2;
   270			shift = 8 * (sizeof(unsigned long) - len);
   271			cap = GET_RS1(insn, regs);
   272		} else if ((insn & INSN_MASK_LHU) == INSN_MATCH_LHU) {
   273			len = 2;
   274			cap = GET_RS1(insn, regs);
   275	#if defined(CONFIG_64BIT)
   276		} else if ((insn & INSN_MASK_C_LD) == INSN_MATCH_C_LD) {
   277			len = 8;
   278			shift = 8 * (sizeof(unsigned long) - len);
   279			insn = RVC_RS2S(insn) << SH_RD;
   280			cap = GET_RS1S(insn, regs);
   281		} else if ((insn & INSN_MASK_C_LDSP) == INSN_MATCH_C_LDSP &&
   282			   ((insn >> SH_RD) & 0x1f)) {
   283			len = 8;
   284			shift = 8 * (sizeof(unsigned long) - len);
   285			cap = regs->sp;
   286	#endif
   287		} else if ((insn & INSN_MASK_C_LW) == INSN_MATCH_C_LW) {
   288			len = 4;
   289			shift = 8 * (sizeof(unsigned long) - len);
   290			insn = RVC_RS2S(insn) << SH_RD;
   291			cap = GET_RS1S(insn, regs);
   292		} else if ((insn & INSN_MASK_C_LWSP) == INSN_MATCH_C_LWSP &&
   293			   ((insn >> SH_RD) & 0x1f)) {
   294			len = 4;
   295			shift = 8 * (sizeof(unsigned long) - len);
   296			cap = regs->sp;
   297		} else if ((insn & INSN_MASK_C_FLD) == INSN_MATCH_C_FLD) {
   298			fp = 1;
   299			len = 8;
   300			insn = RVC_RS2S(insn) << SH_RD;
   301			cap = GET_RS1S(insn, regs);
   302		} else if ((insn & INSN_MASK_C_FLDSP) == INSN_MATCH_C_FLDSP) {
   303			fp = 1;
   304			len = 8;
   305			cap = regs->sp;
   306	#if defined(CONFIG_32BIT)
   307		} else if ((insn & INSN_MASK_C_FLW) == INSN_MATCH_C_FLW) {
   308			fp = 1;
   309			len = 4;
   310			insn = RVC_RS2S(insn) << SH_RD;
   311			cap = GET_RS1S(insn, regs);
   312		} else if ((insn & INSN_MASK_C_FLWSP) == INSN_MATCH_C_FLWSP) {
   313			fp = 1;
   314			len = 4;
   315			cap = regs->sp;
   316	#endif
   317		} else if ((insn & INSN_MASK_C_LHU) == INSN_MATCH_C_LHU) {
   318			len = 2;
   319			insn = RVC_RS2S(insn) << SH_RD;
   320		} else if ((insn & INSN_MASK_C_LH) == INSN_MATCH_C_LH) {
   321			len = 2;
   322			shift = 8 * (sizeof(ulong) - len);
   323			insn = RVC_RS2S(insn) << SH_RD;
   324		} else {
   325			regs->epc = epc;
   326			return -1;
   327		}
   328	
   329		if (!IS_ENABLED(CONFIG_FPU) && fp)
   330			return -EOPNOTSUPP;
   331	
   332		val.data_u64 = 0;
   333		if (user_mode(regs)) {
   334			u8 __user * uptr = (u8 __user *)cheri_address_set(cap, addr);
   335			if (copy_from_user(&val, uptr, len))
   336				return -1;
   337		} else {
   338			u8 * ptr = (u8 *)cheri_address_set(cap, addr);
   339			memcpy(&val, ptr, len);
   340		}
   341	
   342		if (!fp)
   343			SET_RD(insn, regs, __c_fakeu((long)(val.data_ulong << shift) >> shift));
   344		else if (len == 8)
   345			set_f64_rd(insn, regs, val.data_u64);
   346		else
   347			set_f32_rd(insn, regs, val.data_ulong);
   348	
   349		regs->epc = epc + INSN_LEN(insn);
   350	
   351		return 0;
   352	}
   353	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
