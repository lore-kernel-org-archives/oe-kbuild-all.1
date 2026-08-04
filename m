Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6597B468C3A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 13:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785851486; cv=none; b=rGYKiHl2FBNZQbLu08ZEDN8Nv/45MTkoueDUhly+fLPBU00+igrwuc8lweBYTS7GFSZyFMgT7lkCZtCL6qZhuk7ZJUAvwUHs8UOB8nPhFfo2wKjHANLXQYh+s9LYO2ySN1Q9wJ1gzkwETc2W2MUhJL9E5pq0o8Nn2VvR+SxJL0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785851486; c=relaxed/simple;
	bh=g/oeuzHJTp6p2Kg+TcyoIwTq+xGnpxb++S4vJxv6Mro=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mbWhgPMEL9KOvOSVo4XYZEi61taS/LirogqZ14tIUg6fyv28zP02G63jyDtqCS8M1GmVK0Lsdq2qxFr29lgY8C+0tBa32pXzAG1tABvqvUOPlb1gHMA8LE80fQcNhzrH7sZKjkW14dUAadkN0+yutLhbtDb0SXxJMaBJVE1UF80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kdz//khR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kdz//khR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785851485; x=1817387485;
  h=date:from:to:cc:subject:message-id;
  bh=g/oeuzHJTp6p2Kg+TcyoIwTq+xGnpxb++S4vJxv6Mro=;
  b=Kdz//khRZb+2Ho8Da0T1Etg6Iyk4yho+8cjNUOB9nz9OQTdzDn0tjBR2
   2VZ9TQQPJggXX1NAtNaoMdDEnJqzVYU8fZ9YDR6jcW+75MiZ0PrAjq8sF
   RGvCpXqNfTQCfm18IqxbPBYtL9qupY1XV9INgV8kTX5bTVudz1jSRVY3S
   OoUF/qwdXwdKFKWOs2VG81w6KyHKHNVgy5kENFqdSm9kT1aUcrtYK04XZ
   KI3xjqsNXzZUARtMNHEfvDAr1j7le7nbajTf/dcf8HxirXFsUih1Pdjpa
   orloEpenNmHi0PLWg1Jha/eMiYIg99U79rtzewOjFSwCx0cRriYzobTLc
   g==;
X-CSE-ConnectionGUID: ZRcysIhpT/yl5HkPWDyAWQ==
X-CSE-MsgGUID: 5RkLicYyRhyblCcYMSBR+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="97908591"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="97908591"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 06:51:23 -0700
X-CSE-ConnectionGUID: Pmt003YtQOqcba0mzcXQjg==
X-CSE-MsgGUID: CPd4NCNkSQ6GGfieK1KbbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="257185785"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Aug 2026 06:51:06 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrFXr-000000009zz-3pv8;
	Tue, 04 Aug 2026 13:51:03 +0000
Date: Tue, 04 Aug 2026 21:50:08 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/percpu-fixup 11/18]
 arch/arm64/kernel/entry.S:1064: Error: operand 1 must be an integer register
 -- `ldrh w,[,#320]'
Message-ID: <202608042017.clUz6dYs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/percpu-fixup
head:   9e0b9ccad924850288def352da05df0b54fb8aa8
commit: 636f49109b313ff05fac31d2d369c535b399d9a1 [11/18] arm64: percpu: Add infrastructure for preemptible this_cpu_*() ops
config: arm64-randconfig-004-20260804 (https://download.01.org/0day-ci/archive/20260804/202608042017.clUz6dYs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608042017.clUz6dYs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608042017.clUz6dYs-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/entry.S: Assembler messages:
>> arch/arm64/kernel/entry.S:1064: Error: operand 1 must be an integer register -- `ldrh w,[,#320]'
>> arch/arm64/kernel/entry.S:1064: Error: operand 1 must be an integer register -- `strh w,[tsk,#28]'


vim +1064 arch/arm64/kernel/entry.S

  1040	
  1041		/*
  1042		 * We may have interrupted userspace, or a guest, or exit-from or
  1043		 * return-to either of these. Preserve the interrupted sp_el0, and
  1044		 * initialize sp_el0 to the current task.
  1045		 */
  1046		mrs	x20, sp_el0
  1047		ldr_this_cpu    dst=tsk, sym=__entry_task, tmp=x1
  1048		msr	sp_el0, tsk
  1049	
  1050		/* If we interrupted the kernel point to the previous stack/frame. */
  1051		and     x0, x3, #0xc
  1052		mrs     x1, CurrentEL
  1053		cmp     x0, x1
  1054		csel	x29, x29, xzr, eq	// fp, or zero
  1055		csel	x4, x2, xzr, eq		// elr, or zero
  1056	
  1057		stp	x29, x4, [sp, #-16]!
  1058		mov	x29, sp
  1059	
  1060		add	x0, x19, #SDEI_EVENT_INTREGS
  1061		mov	x1, x19
  1062		pcpu_gprs_entry tsk, x0, x2
  1063		bl	__sdei_handler
> 1064		pcpu_gprs_exit tsk
  1065	
  1066		msr	sp_el0, x20
  1067		/* restore regs >x17 that firmware won't restore */
  1068		mov	x4, x19         // keep x4 for __sdei_asm_exit_trampoline
  1069		ldp	x18, x19, [x4, #SDEI_EVENT_INTREGS + 16 * 9]
  1070		ldp	x20, x21, [x4, #SDEI_EVENT_INTREGS + 16 * 10]
  1071		ldp	x22, x23, [x4, #SDEI_EVENT_INTREGS + 16 * 11]
  1072		ldp	x24, x25, [x4, #SDEI_EVENT_INTREGS + 16 * 12]
  1073		ldp	x22, x27, [x4, #SDEI_EVENT_INTREGS + 16 * 13]
  1074		ldp	x28, x29, [x4, #SDEI_EVENT_INTREGS + 16 * 14]
  1075		ldp	lr, x1, [x4, #SDEI_EVENT_INTREGS + S_LR]
  1076		mov	sp, x1
  1077	
  1078		mov	x1, x0			// address to complete_and_resume
  1079		/* x0 = (x0 <= SDEI_EV_FAILED) ?
  1080		 * EVENT_COMPLETE:EVENT_COMPLETE_AND_RESUME
  1081		 */
  1082		cmp	x0, #SDEI_EV_FAILED
  1083		mov_q	x2, SDEI_1_0_FN_SDEI_EVENT_COMPLETE
  1084		mov_q	x3, SDEI_1_0_FN_SDEI_EVENT_COMPLETE_AND_RESUME
  1085		csel	x0, x2, x3, ls
  1086	
  1087		ldr_l	x2, sdei_exit_mode
  1088	
  1089		/* Clear the registered-event seen by crash_smp_send_stop() */
  1090		ldrb	w3, [x4, #SDEI_EVENT_PRIORITY]
  1091		cbnz	w3, 1f
  1092		adr_this_cpu dst=x5, sym=sdei_active_normal_event, tmp=x6
  1093		b	2f
  1094	1:	adr_this_cpu dst=x5, sym=sdei_active_critical_event, tmp=x6
  1095	2:	str	xzr, [x5]
  1096	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
