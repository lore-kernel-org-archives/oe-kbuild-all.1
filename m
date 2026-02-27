Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96621361DB5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 04:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772167723; cv=none; b=Qfdrso0qS9gfs99MGORqcxRc+tXDQwEFRtGu3jqALKKSABKG/muydq6vPic0HhxPQ93wXMVDdhoL2t6mmovdN9Loka67ZrCSV/3jpcbLwBmLzRvQHwJri74JGGv6tliW/ZuZiAMJNOtL2v5yknlHDylQYUeIFKvFIDoDHjfxFjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772167723; c=relaxed/simple;
	bh=WchuL7gYLfakKQNaEa4AO2naSk8iWcf9yLlIJgnmPRQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OX39nZPrDzntEBI9RLPZWk7oL27yX1nGW30DM+djdJRnm2W/FwJSkXtT45hC6EfDGmFnKUminpJGrGANj0dBydIkWyUXqn0oF8khK6xIJf5IXb2JVV2ZqaHalTuSZA93USW2QYpD+9HW+ZeR2peHIsx/O0KUBIo3qsevuEKAFck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=inqP1yow; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="inqP1yow"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772167721; x=1803703721;
  h=date:from:to:cc:subject:message-id;
  bh=WchuL7gYLfakKQNaEa4AO2naSk8iWcf9yLlIJgnmPRQ=;
  b=inqP1yowsHUmOJI/KWJ+jqcFoIZsfWvLfAksQjF/U3ymgqBjNz4KPyZU
   mNJQ/sK+qog4K33n8Sa55ke2Bk5p/H0aVDcrdQ89i8JSpo65GD+gcZa3+
   p9bU3MfXjuQuOSd6M8LubdAvMFhDrGcaJLzMlzUhRMGce/NeSN9ni+XVc
   MOqZYZwSnxwBDbuoY2/Sp0iZ5H84U4TeLkVlAAkBS+rduHJqzO5zDUkq2
   F1c1T3vHDqG4+yvPOk2KfRXScw/j6dvOw37S4No90+vqQA8ulQ+gYFaRL
   ymL6UqY5K1funcOq9/Q3vhLi4Q2aAdEncRTsSpTGTHDsJjXeCCMWQSw/f
   A==;
X-CSE-ConnectionGUID: fAnb3sQNQrOWra0nr11dRA==
X-CSE-MsgGUID: grpxBWseR/KECHErvXTweg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72277468"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="72277468"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 20:48:41 -0800
X-CSE-ConnectionGUID: HbIyTEH6QwWXt9Uo0nJzuA==
X-CSE-MsgGUID: R/yR6PZxSQqt7P9hteFtvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="214677825"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 26 Feb 2026 20:48:39 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvpmH-00000000ACZ-1YoF;
	Fri, 27 Feb 2026 04:48:37 +0000
Date: Fri, 27 Feb 2026 12:48:08 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-sme 3/31]
 arch/arm64/kernel/fpsimd.c:406:87: warning: suggest parentheses around '-' in
 operand of '&'
Message-ID: <202602271250.Pt4alO0j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-sme
head:   79741e868a2dc4a5ae221be3b068c42f951cc9c8
commit: 02cba6e60712a9aef2e91e2a27f6e8b1ff08be07 [3/31] arm64/fpsimd: Update FA64 and ZT0 enables when loading SME state
config: arm64-randconfig-002-20260227 (https://download.01.org/0day-ci/archive/20260227/202602271250.Pt4alO0j-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602271250.Pt4alO0j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602271250.Pt4alO0j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/processor.h:416,
                    from include/linux/sched.h:13,
                    from include/linux/percpu.h:12,
                    from arch/arm64/include/asm/arch_timer.h:18,
                    from arch/arm64/include/asm/timex.h:8,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10,
                    from arch/arm64/kernel/fpsimd.c:14:
   arch/arm64/kernel/fpsimd.c: In function 'task_fpsimd_load':
>> arch/arm64/kernel/fpsimd.c:406:87: warning: suggest parentheses around '-' in operand of '&' [-Wparentheses]
     406 |                         sme_cond_update_smcr(sve_vq_from_vl(task_get_sme_vl(current)) - 1,
   arch/arm64/include/asm/fpsimd.h:438:29: note: in definition of macro 'sme_cond_update_smcr'
     438 |                 u64 __new = vl & SMCR_ELx_LEN_MASK;             \
         |                             ^~
   arch/arm64/kernel/fpsimd.c: In function 'do_sme_acc':
   arch/arm64/kernel/fpsimd.c:1379:79: warning: suggest parentheses around '-' in operand of '&' [-Wparentheses]
    1379 |                 sme_cond_update_smcr(sve_vq_from_vl(task_get_sme_vl(current)) - 1,
   arch/arm64/include/asm/fpsimd.h:438:29: note: in definition of macro 'sme_cond_update_smcr'
     438 |                 u64 __new = vl & SMCR_ELx_LEN_MASK;             \
         |                             ^~


vim +406 arch/arm64/kernel/fpsimd.c

   277	
   278	/*
   279	 * TIF_SME controls whether a task can use SME without trapping while
   280	 * in userspace, when TIF_SME is set then we must have storage
   281	 * allocated in sve_state and sme_state to store the contents of both ZA
   282	 * and the SVE registers for both streaming and non-streaming modes.
   283	 *
   284	 * If both SVCR.ZA and SVCR.SM are disabled then at any point we
   285	 * may disable TIF_SME and reenable traps.
   286	 */
   287	
   288	
   289	/*
   290	 * TIF_SVE controls whether a task can use SVE without trapping while
   291	 * in userspace, and also (together with TIF_SME) the way a task's
   292	 * FPSIMD/SVE state is stored in thread_struct.
   293	 *
   294	 * The kernel uses this flag to track whether a user task is actively
   295	 * using SVE, and therefore whether full SVE register state needs to
   296	 * be tracked.  If not, the cheaper FPSIMD context handling code can
   297	 * be used instead of the more costly SVE equivalents.
   298	 *
   299	 *  * TIF_SVE or SVCR.SM set:
   300	 *
   301	 *    The task can execute SVE instructions while in userspace without
   302	 *    trapping to the kernel.
   303	 *
   304	 *    During any syscall, the kernel may optionally clear TIF_SVE and
   305	 *    discard the vector state except for the FPSIMD subset.
   306	 *
   307	 *  * TIF_SVE clear:
   308	 *
   309	 *    An attempt by the user task to execute an SVE instruction causes
   310	 *    do_sve_acc() to be called, which does some preparation and then
   311	 *    sets TIF_SVE.
   312	 *
   313	 * During any syscall, the kernel may optionally clear TIF_SVE and
   314	 * discard the vector state except for the FPSIMD subset.
   315	 *
   316	 * The data will be stored in one of two formats:
   317	 *
   318	 *  * FPSIMD only - FP_STATE_FPSIMD:
   319	 *
   320	 *    When the FPSIMD only state stored task->thread.fp_type is set to
   321	 *    FP_STATE_FPSIMD, the FPSIMD registers V0-V31 are encoded in
   322	 *    task->thread.uw.fpsimd_state; bits [max : 128] for each of Z0-Z31 are
   323	 *    logically zero but not stored anywhere; P0-P15 and FFR are not
   324	 *    stored and have unspecified values from userspace's point of
   325	 *    view.  For hygiene purposes, the kernel zeroes them on next use,
   326	 *    but userspace is discouraged from relying on this.
   327	 *
   328	 *    task->thread.sve_state does not need to be non-NULL, valid or any
   329	 *    particular size: it must not be dereferenced and any data stored
   330	 *    there should be considered stale and not referenced.
   331	 *
   332	 *  * SVE state - FP_STATE_SVE:
   333	 *
   334	 *    When the full SVE state is stored task->thread.fp_type is set to
   335	 *    FP_STATE_SVE and Z0-Z31 (incorporating Vn in bits[127:0] or the
   336	 *    corresponding Zn), P0-P15 and FFR are encoded in in
   337	 *    task->thread.sve_state, formatted appropriately for vector
   338	 *    length task->thread.sve_vl or, if SVCR.SM is set,
   339	 *    task->thread.sme_vl. The storage for the vector registers in
   340	 *    task->thread.uw.fpsimd_state should be ignored.
   341	 *
   342	 *    task->thread.sve_state must point to a valid buffer at least
   343	 *    sve_state_size(task) bytes in size. The data stored in
   344	 *    task->thread.uw.fpsimd_state.vregs should be considered stale
   345	 *    and not referenced.
   346	 *
   347	 *  * FPSR and FPCR are always stored in task->thread.uw.fpsimd_state
   348	 *    irrespective of whether TIF_SVE is clear or set, since these are
   349	 *    not vector length dependent.
   350	 */
   351	
   352	/*
   353	 * Update current's FPSIMD/SVE registers from thread_struct.
   354	 *
   355	 * This function should be called only when the FPSIMD/SVE state in
   356	 * thread_struct is known to be up to date, when preparing to enter
   357	 * userspace.
   358	 */
   359	static void task_fpsimd_load(void)
   360	{
   361		bool restore_sve_regs = false;
   362		bool restore_ffr;
   363	
   364		WARN_ON(!system_supports_fpsimd());
   365		WARN_ON(preemptible());
   366		WARN_ON(test_thread_flag(TIF_KERNEL_FPSTATE));
   367	
   368		if (system_supports_sve() || system_supports_sme()) {
   369			switch (current->thread.fp_type) {
   370			case FP_STATE_FPSIMD:
   371				/* Stop tracking SVE for this task until next use. */
   372				clear_thread_flag(TIF_SVE);
   373				break;
   374			case FP_STATE_SVE:
   375				if (!thread_sm_enabled(&current->thread))
   376					WARN_ON_ONCE(!test_and_set_thread_flag(TIF_SVE));
   377	
   378				if (test_thread_flag(TIF_SVE))
   379					sve_set_vq(sve_vq_from_vl(task_get_sve_vl(current)) - 1);
   380	
   381				restore_sve_regs = true;
   382				restore_ffr = true;
   383				break;
   384			default:
   385				/*
   386				 * This indicates either a bug in
   387				 * fpsimd_save_user_state() or memory corruption, we
   388				 * should always record an explicit format
   389				 * when we save. We always at least have the
   390				 * memory allocated for FPSIMD registers so
   391				 * try that and hope for the best.
   392				 */
   393				WARN_ON_ONCE(1);
   394				clear_thread_flag(TIF_SVE);
   395				break;
   396			}
   397		}
   398	
   399		/* Restore SME, override SVE register configuration if needed */
   400		if (system_supports_sme()) {
   401			/*
   402			 * Ensure VL is set up for restoring data.  KVM might
   403			 * disable subfeatures so we reset them each time.
   404			 */
   405			if (test_thread_flag(TIF_SME))
 > 406				sme_cond_update_smcr(sve_vq_from_vl(task_get_sme_vl(current)) - 1,
   407						     system_supports_fa64(),
   408						     system_supports_sme2(),
   409						     SYS_SMCR_EL1);
   410	
   411			write_sysreg_s(current->thread.svcr, SYS_SVCR);
   412	
   413			if (thread_za_enabled(&current->thread))
   414				sme_load_state(current->thread.sme_state,
   415					       system_supports_sme2());
   416	
   417			if (thread_sm_enabled(&current->thread))
   418				restore_ffr = system_supports_fa64();
   419		}
   420	
   421		if (system_supports_fpmr())
   422			write_sysreg_s(current->thread.uw.fpmr, SYS_FPMR);
   423	
   424		if (restore_sve_regs) {
   425			WARN_ON_ONCE(current->thread.fp_type != FP_STATE_SVE);
   426			sve_load_state(sve_pffr(&current->thread),
   427				       &current->thread.uw.fpsimd_state.fpsr,
   428				       restore_ffr);
   429		} else {
   430			WARN_ON_ONCE(current->thread.fp_type != FP_STATE_FPSIMD);
   431			fpsimd_load_state(&current->thread.uw.fpsimd_state);
   432		}
   433	}
   434	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
