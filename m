Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C81024B31
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 19:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707073425; cv=none; b=ED/OroO5wsMv8F2o5qPpkOf2BBh/hCchYxZb+WQjwp+IZkyHyKBjbxYu4UBOCAUax7rdEKGCIDV4HQlHLN3aJAg9Dn195zapnARbeQTwRkhTTKgGesqBD4sg9fuXyNsMGYLhytZ9l3ixzN8dY+mFMf3AbJDYdfXC8wda76kJ36Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707073425; c=relaxed/simple;
	bh=htjEB7/ES7IBOtXr9pkw8ucXzYHQnv3iASlBsn+ZRfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DDC7dxnRRUxbCgkDOlha3FQKgaahCymBn7djmjlUh3F2kb1PvG0p85fuSFy4lI4oj0EbwQegwNoz+v8Ogb8qVmhdxUrlr0q0lwH22WaLY9eB3m0IRY4P305PmHL22rMo4gIDmG1Xpe22HPe30tWcne94SK98wBhciqKK+zikTe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URsjnGsK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URsjnGsK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707073423; x=1738609423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=htjEB7/ES7IBOtXr9pkw8ucXzYHQnv3iASlBsn+ZRfA=;
  b=URsjnGsKpFryrvZ4WfkNHy+4WdF4WNkHVzQPYThfoP9yf518V9zbrRIb
   Rrfb22aGiZlMtuFtm9U+wgWijqEnjyE0cBJWWEj8eWbTXSmBj907pN18S
   n1eKt3egrMau5XkPYegxK+NcS0MVI/4cyZvPn4uHVXZwvv0lb0Gwc3DOF
   WG9nLtpAHcuTddq2nFHpe6oH+kB1RTObRO/Q0GnYAuXYxM6rdP7HkoTVX
   ZS+EfBs/arWQgqAIC6gogSl2P1GWiOl4IY7bsfj07fOGhIs/r03qhJ6sv
   mTrYnhKAEf6ZXowIO8mkWEx+cSdSNMVSN3/MPVVz2fp8FfsPlfiJbojBh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="17936151"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="17936151"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 11:03:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5168638"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 04 Feb 2024 11:03:40 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWhmE-0006dg-1K;
	Sun, 04 Feb 2024 19:03:38 +0000
Date: Mon, 5 Feb 2024 03:03:26 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-misc:arm64-sve-trap-mitigation 2/2]
 arch/arm64/kernel/fpsimd.c:441 task_fpsimd_load() error: uninitialized
 symbol 'sve_vq_minus_one'.
Message-ID: <202402050231.mmQMnRLE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git arm64-sve-trap-mitigation
head:   10e172f00d0f81c7fee6a8c9ff7d38e68ffb5f10
commit: 10e172f00d0f81c7fee6a8c9ff7d38e68ffb5f10 [2/2] arm64/fpsimd: Suppress SVE access traps when loading FPSIMD state
config: arm64-randconfig-r081-20240129 (https://download.01.org/0day-ci/archive/20240205/202402050231.mmQMnRLE-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4a39d08908942b2d415db405844cbe4af73e75d4)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402050231.mmQMnRLE-lkp@intel.com/

smatch warnings:
arch/arm64/kernel/fpsimd.c:441 task_fpsimd_load() error: uninitialized symbol 'sve_vq_minus_one'.

vim +/sve_vq_minus_one +441 arch/arm64/kernel/fpsimd.c

   271	
   272	/*
   273	 * TIF_SME controls whether a task can use SME without trapping while
   274	 * in userspace, when TIF_SME is set then we must have storage
   275	 * allocated in sve_state and sme_state to store the contents of both ZA
   276	 * and the SVE registers for both streaming and non-streaming modes.
   277	 *
   278	 * If both SVCR.ZA and SVCR.SM are disabled then at any point we
   279	 * may disable TIF_SME and reenable traps.
   280	 */
   281	
   282	
   283	/*
   284	 * TIF_SVE controls whether a task can use SVE without trapping while
   285	 * in userspace, and also (together with TIF_SME) the way a task's
   286	 * FPSIMD/SVE state is stored in thread_struct.
   287	 *
   288	 * The kernel uses this flag to track whether a user task is actively
   289	 * using SVE, and therefore whether full SVE register state needs to
   290	 * be tracked.  If not, the cheaper FPSIMD context handling code can
   291	 * be used instead of the more costly SVE equivalents.
   292	 *
   293	 *  * TIF_SVE or SVCR.SM set:
   294	 *
   295	 *    The task can execute SVE instructions while in userspace without
   296	 *    trapping to the kernel.
   297	 *
   298	 *    During any syscall, the kernel may optionally clear TIF_SVE and
   299	 *    discard the vector state except for the FPSIMD subset.
   300	 *
   301	 *  * TIF_SVE clear:
   302	 *
   303	 *    An attempt by the user task to execute an SVE instruction causes
   304	 *    do_sve_acc() to be called, which does some preparation and then
   305	 *    sets TIF_SVE.
   306	 *
   307	 * During any syscall, the kernel may optionally clear TIF_SVE and
   308	 * discard the vector state except for the FPSIMD subset.
   309	 *
   310	 * The data will be stored in one of two formats:
   311	 *
   312	 *  * FPSIMD only - FP_STATE_FPSIMD:
   313	 *
   314	 *    When the FPSIMD only state stored task->thread.fp_type is set to
   315	 *    FP_STATE_FPSIMD, the FPSIMD registers V0-V31 are encoded in
   316	 *    task->thread.uw.fpsimd_state; bits [max : 128] for each of Z0-Z31 are
   317	 *    logically zero but not stored anywhere; P0-P15 and FFR are not
   318	 *    stored and have unspecified values from userspace's point of
   319	 *    view.  For hygiene purposes, the kernel zeroes them on next use,
   320	 *    but userspace is discouraged from relying on this.
   321	 *
   322	 *    task->thread.sve_state does not need to be non-NULL, valid or any
   323	 *    particular size: it must not be dereferenced and any data stored
   324	 *    there should be considered stale and not referenced.
   325	 *
   326	 *  * SVE state - FP_STATE_SVE:
   327	 *
   328	 *    When the full SVE state is stored task->thread.fp_type is set to
   329	 *    FP_STATE_SVE and Z0-Z31 (incorporating Vn in bits[127:0] or the
   330	 *    corresponding Zn), P0-P15 and FFR are encoded in in
   331	 *    task->thread.sve_state, formatted appropriately for vector
   332	 *    length task->thread.sve_vl or, if SVCR.SM is set,
   333	 *    task->thread.sme_vl. The storage for the vector registers in
   334	 *    task->thread.uw.fpsimd_state should be ignored.
   335	 *
   336	 *    task->thread.sve_state must point to a valid buffer at least
   337	 *    sve_state_size(task) bytes in size. The data stored in
   338	 *    task->thread.uw.fpsimd_state.vregs should be considered stale
   339	 *    and not referenced.
   340	 *
   341	 *  * FPSR and FPCR are always stored in task->thread.uw.fpsimd_state
   342	 *    irrespective of whether TIF_SVE is clear or set, since these are
   343	 *    not vector length dependent.
   344	 */
   345	
   346	/*
   347	 * Update current's FPSIMD/SVE registers from thread_struct.
   348	 *
   349	 * This function should be called only when the FPSIMD/SVE state in
   350	 * thread_struct is known to be up to date, when preparing to enter
   351	 * userspace.
   352	 */
   353	static void task_fpsimd_load(void)
   354	{
   355		bool restore_sve_regs = false;
   356		bool restore_ffr;
   357		unsigned long sve_vq_minus_one;
   358	
   359		WARN_ON(!system_supports_fpsimd());
   360		WARN_ON(preemptible());
   361		WARN_ON(test_thread_flag(TIF_KERNEL_FPSTATE));
   362	
   363		if (system_supports_sve() || system_supports_sme()) {
   364			switch (current->thread.fp_type) {
   365			case FP_STATE_FPSIMD:
   366				break;
   367			case FP_STATE_SVE:
   368				if (!thread_sm_enabled(&current->thread) &&
   369				    !WARN_ON_ONCE(!test_and_set_thread_flag(TIF_SVE)))
   370					sve_user_enable();
   371	
   372				restore_sve_regs = true;
   373				restore_ffr = true;
   374				break;
   375			default:
   376				/*
   377				 * This indicates either a bug in
   378				 * fpsimd_save_user_state() or memory corruption, we
   379				 * should always record an explicit format
   380				 * when we save. We always at least have the
   381				 * memory allocated for FPSMID registers so
   382				 * try that and hope for the best.
   383				 */
   384				WARN_ON_ONCE(1);
   385				clear_thread_flag(TIF_SVE);
   386				break;
   387			}
   388		}
   389	
   390		/*
   391		 * If SVE has been enabled we may keep it enabled even if
   392		 * loading only FPSIMD state, so always set the VL.
   393		 */
   394		if (system_supports_sve() && test_thread_flag(TIF_SVE)) {
   395			sve_vq_minus_one = sve_vq_from_vl(task_get_sve_vl(current)) - 1;
   396			sve_set_vq(sve_vq_minus_one);
   397		}
   398	
   399		/* Restore SME, override SVE register configuration if needed */
   400		if (system_supports_sme()) {
   401			unsigned long sme_vl = task_get_sme_vl(current);
   402	
   403			/* Ensure VL is set up for restoring data */
   404			if (test_thread_flag(TIF_SME))
   405				sme_set_vq(sve_vq_from_vl(sme_vl) - 1);
   406	
   407			write_sysreg_s(current->thread.svcr, SYS_SVCR);
   408	
   409			if (thread_za_enabled(&current->thread))
   410				sme_load_state(current->thread.sme_state,
   411					       system_supports_sme2());
   412	
   413			if (thread_sm_enabled(&current->thread))
   414				restore_ffr = system_supports_fa64();
   415		}
   416	
   417		if (restore_sve_regs) {
   418			WARN_ON_ONCE(current->thread.fp_type != FP_STATE_SVE);
   419			sve_load_state(sve_pffr(&current->thread),
   420				       &current->thread.uw.fpsimd_state.fpsr,
   421				       restore_ffr);
   422		} else {
   423			WARN_ON_ONCE(current->thread.fp_type != FP_STATE_FPSIMD);
   424			fpsimd_load_state(&current->thread.uw.fpsimd_state);
   425	
   426			/*
   427			 * If the task had been using SVE we keep it enabled
   428			 * when loading FPSIMD only state for a number of
   429			 * times to minimise overhead for tasks actively using
   430			 * SVE, disabling it periodicaly to enusre that tasks
   431			 * that use SVE intermittently do eventually avoid the
   432			 * overhead of carrying SVE state.  The timeout is
   433			 * initialised when we take a SVE trap in in do_sve_acc().
   434			 */
   435			if (system_supports_sve() && test_thread_flag(TIF_SVE)) {
   436				if (!current->thread.sve_timeout) {
   437					clear_thread_flag(TIF_SVE);
   438					sve_user_disable();
   439				} else {
   440					current->thread.sve_timeout--;
 > 441					sve_flush_live(true, sve_vq_minus_one);
   442				}
   443			}
   444		}
   445	}
   446	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
