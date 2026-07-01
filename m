Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC89939C631
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 20:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782938662; cv=none; b=k50YZlcyUXrDp19m1Bv7Wdli/Xm/rzu2d9JVcoIEf7/bIilvEkRCXMJb7EY8TyXB2lUe05/8fBJO+cYu1Z10Zip4a0pc9ClLaS63yasv2Pk0DebVaVJw6asNatP9B6zkElw8eXx6LELgoV3lCr5DZT3EVP6mYxkT1zJpY2DiWwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782938662; c=relaxed/simple;
	bh=nuPqGFqaqxUiK3FZRUUw/dgFa8pOr7hUjUxcHKWPTbs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mZw7L5TxTEwGsKZ+mPFBxZcU4NWo4yasnDxnJXSclQLhxppYS/ZTVYvPoDoUbN5YXk2gjXFaRqbqF21DsmZrkTtG6LUD6+Wv64Aq/HSq5RAqoBP0npkdQAKUBaB+WSbifQzee2XrfL70cEwJubJuFNuR47mG/Cxx0mfdT7NTimg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PBmGuFV8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PBmGuFV8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782938660; x=1814474660;
  h=date:from:to:cc:subject:message-id;
  bh=nuPqGFqaqxUiK3FZRUUw/dgFa8pOr7hUjUxcHKWPTbs=;
  b=PBmGuFV8wIdEI5Q+hAhYnQ+vQKSygtUmjg7QlgM4B+QsxYfDkn2QIKW6
   CeIHkUKvqKYisOyBKZ4sOwULNkmdEOtw6V/Pt/K655Q9dWx+WCGuyjxNw
   GQAqFV/I2LiZKz9Kw4AY5ssBsmwOVvVj1ru1LsqG5UdhKYvuRZ+KIidVt
   lKGi7hpBpwy4U9HDv4UVYOAmIIVxaRTMfVbSIVuQfQogo0BzUyLaBvW01
   6nrJhlTJap14J444yb6kFx57Nog9DY5qzBXTFJlQKVKYcXkoy4AutgDL+
   Z7P1lDC7zZO3zyg1Uli/ziPoxs2KekJ5GzRWGQI8BxHW0Oj94i4RaobXJ
   A==;
X-CSE-ConnectionGUID: ZU5qT1XrRmKUntLKzXibbw==
X-CSE-MsgGUID: b5Kdt8OVQyWFpVd6Y0oVOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83555220"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="83555220"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 13:44:20 -0700
X-CSE-ConnectionGUID: DncZCDgsTIm2BXM9MET5Vw==
X-CSE-MsgGUID: daWWcj0oSCmjDYcQWLUKBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="290789741"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 01 Jul 2026 13:44:18 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf1n6-000000000sv-04je;
	Wed, 01 Jul 2026 20:44:16 +0000
Date: Wed, 01 Jul 2026 22:43:57 +0200
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-sve-trap-mitigation 2/3]
 arch/arm64/kernel/fpsimd.c:365:23: warning: unused variable
 'sve_vq_minus_one'
Message-ID: <202607012252.7JnbghOZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-sve-trap-mitigation
head:   00a72da058c10512a992dd75733d08daed8437fc
commit: 2927097df60b0ee11007db0ac60ffec3830e8bd3 [2/3] arm64/fpsimd: Suppress SVE access traps when loading FPSIMD state
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260701/202607012252.7JnbghOZ-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607012252.7JnbghOZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607012252.7JnbghOZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/fpsimd.c: In function 'task_fpsimd_load':
>> arch/arm64/kernel/fpsimd.c:365:23: warning: unused variable 'sve_vq_minus_one' [-Wunused-variable]
     365 |         unsigned long sve_vq_minus_one;
         |                       ^~~~~~~~~~~~~~~~


vim +/sve_vq_minus_one +365 arch/arm64/kernel/fpsimd.c

   279	
   280	/*
   281	 * TIF_SME controls whether a task can use SME without trapping while
   282	 * in userspace, when TIF_SME is set then we must have storage
   283	 * allocated in sve_state and sme_state to store the contents of both ZA
   284	 * and the SVE registers for both streaming and non-streaming modes.
   285	 *
   286	 * If both SVCR.ZA and SVCR.SM are disabled then at any point we
   287	 * may disable TIF_SME and reenable traps.
   288	 */
   289	
   290	
   291	/*
   292	 * TIF_SVE controls whether a task can use SVE without trapping while
   293	 * in userspace, and also (together with TIF_SME) the way a task's
   294	 * FPSIMD/SVE state is stored in thread_struct.
   295	 *
   296	 * The kernel uses this flag to track whether a user task is actively
   297	 * using SVE, and therefore whether full SVE register state needs to
   298	 * be tracked.  If not, the cheaper FPSIMD context handling code can
   299	 * be used instead of the more costly SVE equivalents.
   300	 *
   301	 *  * TIF_SVE or SVCR.SM set:
   302	 *
   303	 *    The task can execute SVE instructions while in userspace without
   304	 *    trapping to the kernel.
   305	 *
   306	 *    During any syscall, the kernel may optionally clear TIF_SVE and
   307	 *    discard the vector state except for the FPSIMD subset.
   308	 *
   309	 *  * TIF_SVE clear:
   310	 *
   311	 *    An attempt by the user task to execute an SVE instruction causes
   312	 *    do_sve_acc() to be called, which does some preparation and then
   313	 *    sets TIF_SVE.
   314	 *
   315	 * During any syscall, the kernel may optionally clear TIF_SVE and
   316	 * discard the vector state except for the FPSIMD subset.
   317	 *
   318	 * The data will be stored in one of two formats:
   319	 *
   320	 *  * FPSIMD only - FP_STATE_FPSIMD:
   321	 *
   322	 *    When the FPSIMD only state stored task->thread.fp_type is set to
   323	 *    FP_STATE_FPSIMD, the FPSIMD registers V0-V31 are encoded in
   324	 *    task->thread.uw.fpsimd_state; bits [max : 128] for each of Z0-Z31 are
   325	 *    logically zero but not stored anywhere; P0-P15 and FFR are not
   326	 *    stored and have unspecified values from userspace's point of
   327	 *    view.  For hygiene purposes, the kernel zeroes them on next use,
   328	 *    but userspace is discouraged from relying on this.
   329	 *
   330	 *    task->thread.sve_state does not need to be non-NULL, valid or any
   331	 *    particular size: it must not be dereferenced and any data stored
   332	 *    there should be considered stale and not referenced.
   333	 *
   334	 *  * SVE state - FP_STATE_SVE:
   335	 *
   336	 *    When the full SVE state is stored task->thread.fp_type is set to
   337	 *    FP_STATE_SVE and Z0-Z31 (incorporating Vn in bits[127:0] or the
   338	 *    corresponding Zn), P0-P15 and FFR are encoded in in
   339	 *    task->thread.sve_state, formatted appropriately for vector
   340	 *    length task->thread.sve_vl or, if SVCR.SM is set,
   341	 *    task->thread.sme_vl. The storage for the vector registers in
   342	 *    task->thread.uw.fpsimd_state should be ignored.
   343	 *
   344	 *    task->thread.sve_state must point to a valid buffer at least
   345	 *    sve_state_size(task) bytes in size. The data stored in
   346	 *    task->thread.uw.fpsimd_state.vregs should be considered stale
   347	 *    and not referenced.
   348	 *
   349	 *  * FPSR and FPCR are always stored in task->thread.uw.fpsimd_state
   350	 *    irrespective of whether TIF_SVE is clear or set, since these are
   351	 *    not vector length dependent.
   352	 */
   353	
   354	/*
   355	 * Update current's FPSIMD/SVE registers from thread_struct.
   356	 *
   357	 * This function should be called only when the FPSIMD/SVE state in
   358	 * thread_struct is known to be up to date, when preparing to enter
   359	 * userspace.
   360	 */
   361	static void task_fpsimd_load(void)
   362	{
   363		bool restore_sve_regs = false;
   364		bool restore_ffr;
 > 365		unsigned long sve_vq_minus_one;
   366	
   367		WARN_ON(!system_supports_fpsimd());
   368		WARN_ON(preemptible());
   369		WARN_ON(test_thread_flag(TIF_KERNEL_FPSTATE));
   370	
   371		if (system_supports_sve() || system_supports_sme()) {
   372			switch (current->thread.fp_type) {
   373			case FP_STATE_FPSIMD:
   374				break;
   375			case FP_STATE_SVE:
   376				if (!thread_sm_enabled(&current->thread))
   377					WARN_ON_ONCE(!test_and_set_thread_flag(TIF_SVE));
   378	
   379				restore_sve_regs = true;
   380				restore_ffr = true;
   381				break;
   382			default:
   383				/*
   384				 * This indicates either a bug in
   385				 * fpsimd_save_user_state() or memory corruption, we
   386				 * should always record an explicit format
   387				 * when we save. We always at least have the
   388				 * memory allocated for FPSIMD registers so
   389				 * try that and hope for the best.
   390				 */
   391				WARN_ON_ONCE(1);
   392				clear_thread_flag(TIF_SVE);
   393				break;
   394			}
   395		}
   396	
   397		/*
   398		 * If SVE has been enabled we may keep it enabled even if
   399		 * loading only FPSIMD state, so always set the VL.
   400		 */
   401		if (system_supports_sve() && test_thread_flag(TIF_SVE)) {
   402			unsigned long vq = sve_vq_from_vl(task_get_sve_vl(current));
   403			sysreg_clear_set_s(SYS_ZCR_EL1, ZCR_ELx_LEN, vq - 1);
   404		}
   405	
   406		/* Restore SME, override SVE register configuration if needed */
   407		if (system_supports_sme()) {
   408			unsigned long sme_vl = task_get_sme_vl(current);
   409	
   410			/* Ensure VL is set up for restoring data */
   411			if (test_thread_flag(TIF_SME)) {
   412				unsigned long vq = sve_vq_from_vl(sme_vl);
   413				sysreg_clear_set_s(SYS_SMCR_EL1, SMCR_ELx_LEN, vq - 1);
   414			}
   415	
   416			write_sysreg_s(current->thread.svcr, SYS_SVCR);
   417	
   418			if (thread_za_enabled(&current->thread))
   419				sme_load_state(current->thread.sme_state,
   420					       system_supports_sme2());
   421	
   422			if (thread_sm_enabled(&current->thread))
   423				restore_ffr = system_supports_fa64();
   424		}
   425	
   426		if (system_supports_fpmr())
   427			write_sysreg_s(current->thread.uw.fpmr, SYS_FPMR);
   428	
   429		if (restore_sve_regs) {
   430			WARN_ON_ONCE(current->thread.fp_type != FP_STATE_SVE);
   431			sve_load_state(current->thread.sve_state, restore_ffr);
   432			fpsimd_load_common(&current->thread.uw.fpsimd_state);
   433		} else {
   434			WARN_ON_ONCE(current->thread.fp_type != FP_STATE_FPSIMD);
   435			fpsimd_load_state(&current->thread.uw.fpsimd_state);
   436	
   437			/*
   438			 * If the task had been using SVE we keep it enabled
   439			 * when loading FPSIMD only state for a period to
   440			 * minimise overhead for tasks actively using SVE,
   441			 * disabling it periodicaly to ensure that tasks that
   442			 * use SVE intermittently do eventually avoid the
   443			 * overhead of carrying SVE state.  The timeout is
   444			 * initialised when we take a SVE trap in do_sve_acc().
   445			 */
   446			if (system_supports_sve() && test_thread_flag(TIF_SVE)) {
   447				if (time_after(jiffies, current->thread.sve_timeout)) {
   448					clear_thread_flag(TIF_SVE);
   449					sve_user_disable();
   450				} else {
   451					/*
   452					 * Loading V will have flushed the
   453					 * rest of the Z register, SVE is
   454					 * enabled at EL1 and VL was set
   455					 * above.
   456					 */
   457					sve_flush_p();
   458				}
   459			}
   460		}
   461	}
   462	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
