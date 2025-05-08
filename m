Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0999A256D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 09:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746697364; cv=none; b=UALE5l7YAUbGxzm/3nQEgA+gCO2yN9sA97wfOsZCx5ykKW3gvWZPD5+0ZMpBwAMxhowVwweXpq/D6kNVo6vvwkif06o+tilKg3/0zkG07mslMYnudeAuvaCVeEv7nt02/yLUpu5slBo1kR2VuObQ/Bo1mBK/lJQP3tbw0qCD2Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746697364; c=relaxed/simple;
	bh=0Jow5vwMKwKThpOZUKdX5oSjaXtLS2LgCrhKKIFSXgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tc2rHShWtbmLKQOjg8+hu7iogwTnaQWYFYl+3Be+gpRNuRcz6sDZPx39cr8NGKaADmqvIbeP4Pp7qoHa1P5uX7lF9BxZ13sm4G6vAbUuGz2WlAioTwAUqeJSJtUxcfDjkfeQWejeSVmZAtQBlyZj7m3IrYqrZBxDQJxtnf+MeN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=an+3Xa2e; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="an+3Xa2e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746697363; x=1778233363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Jow5vwMKwKThpOZUKdX5oSjaXtLS2LgCrhKKIFSXgU=;
  b=an+3Xa2eYuxQhscup2RA2NkYlGJ9g9MMQxAUUT5m0L5qN0h1VGjTgBgQ
   tnesLJBtghjI4p/pa5BzV3Bn6ULsVs/X4tfJQCcDcFNVRdFNEqR39Vt5R
   RONoyDXNlmdAyviA0CSerPmygfJxmTBDFGsqkus59qD0YJK7afKV+hEif
   /2I2Gt1JdQQ79dA6HPLKDE3/KP0NlmEIsmFc52aH/cqmeBLPKO3b4Temy
   EzqC7MqkSukkPqeX9oX/y4z0bW+3Md2/ZChrg1B/66jBIveSQ6O65Cptr
   CU26f6EYv1O06OaZczWVQMK3TDIhIPrGXoxSioZfWmZ0eCXrFIJixlmOQ
   Q==;
X-CSE-ConnectionGUID: +cw11NvfSr+E4Lz0lGkPcQ==
X-CSE-MsgGUID: SUviN6HRTFScT6yJ8DVAeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59820828"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="59820828"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 02:42:42 -0700
X-CSE-ConnectionGUID: gZef2gSrR9+3r1zZNCrBdA==
X-CSE-MsgGUID: EyXR2XTrQt+Hy6xDcWnMAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="136760132"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 May 2025 02:42:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCxm3-000Apx-0s;
	Thu, 08 May 2025 09:42:39 +0000
Date: Thu, 8 May 2025 17:42:10 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/fpsimd/sme-fixes 24/24]
 arch/arm64/kernel/fpsimd.c:346:6: warning: no previous prototype for
 'sanity_check_task_fpsimd_state'
Message-ID: <202505081751.2RkNFhuM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/fpsimd/sme-fixes
head:   b1227c74b2419828a44970414c7cd13b85c72765
commit: b1227c74b2419828a44970414c7cd13b85c72765 [24/24] HACK: sanity check
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250508/202505081751.2RkNFhuM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505081751.2RkNFhuM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505081751.2RkNFhuM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/fpsimd.c:346:6: warning: no previous prototype for 'sanity_check_task_fpsimd_state' [-Wmissing-prototypes]
     346 | void sanity_check_task_fpsimd_state(struct task_struct *task)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sanity_check_task_fpsimd_state +346 arch/arm64/kernel/fpsimd.c

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
 > 346	void sanity_check_task_fpsimd_state(struct task_struct *task)
   347	{
   348		WARN_ONCE(test_tsk_thread_flag(task, TIF_SVE) && !task->thread.sve_state,
   349			  "Task %p has TIF_SVE but no sve_state\n", task);
   350	
   351		WARN_ONCE(test_tsk_thread_flag(task, TIF_SME) && !task->thread.sve_state,
   352			  "Task %p has TIF_SME but no sve_state\n", task);
   353	
   354		WARN_ONCE(test_tsk_thread_flag(task, TIF_SME) && !task->thread.sme_state,
   355			  "Task %p has TIF_SME but no sme_state\n", task);
   356	
   357		WARN_ONCE(thread_sm_enabled(&task->thread) && task->thread.fp_type == FP_STATE_FPSIMD,
   358		          "Task %p has PSTATE.SM set in FPSIMD format\n", task);
   359	
   360		WARN_ONCE(thread_sm_enabled(&task->thread) && !test_tsk_thread_flag(task, TIF_SME),
   361		          "Task %p has PSTATE.SM set without TIF_SME\n", task);
   362	
   363		WARN_ONCE(thread_za_enabled(&task->thread) && !test_tsk_thread_flag(task, TIF_SME),
   364			  "Task %p has PSTATE.ZA set without TIF_SME\n", task);
   365	}
   366	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
