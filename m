Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168ED230BF1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 11:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593215; cv=none; b=VsYsSsYzHmrfbMRip76sRiCfdpSZtd5K7m2OFzvZyu7RyrUAXQdEKCk902EN60NjPPWWXsG09BYkXDIHZ9w6liIHCj2/rDoFq8LBibU7bV58CcHZ9shwbZa07nqqNWql5oc4GTxwYhwTZws2D/MxX8WYGKZFPKQlCDHm6cu0dAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593215; c=relaxed/simple;
	bh=fX6ph3owOtXAoNfcm0nwUzg5ir9KLLg3RBoyq0T4Mvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=inke5qsWIomd7USqwKPTsna7hrLJ854uX3SIAM52/feppLBxuu6RbdsDp8lw8wtxfuJfc/E121IgOKEjqFegd1mN+ASW1qg7mn2EZmWE8h/DVy2m4NnprBd8v2A6VoJnty+CYnXYHyDNNfqseu6R1obmKm/O57uEhI147xAkrMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPm8LyVU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPm8LyVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743593213; x=1775129213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fX6ph3owOtXAoNfcm0nwUzg5ir9KLLg3RBoyq0T4Mvc=;
  b=NPm8LyVUApj5n8akieoNzUwNzKhBhOdqTwR0t7EFvmP22ox2Lv2Bfhm/
   4WxmUosup3E2NC63Jnwjk9TTGrDSVB4s6IdOCTOKq9mYMae79+ftXwTx5
   lYkgAnPWwx8ZVLu00M19bOSnnMCOeW9pzg5rreR6WQojfC0SP0L53T3ik
   YE8hs4FsxMKKAvFfWzMU6DBxOQTqcqzwGa5uSdwqoUlEp+eHyzdSdUFRU
   1BPjOAIdwBjmJaqCjLlChpspoCZPd4kyFV+Vt0o8aZyeIRW7tRGFn17hk
   KdTJB62od9CnbLmT8+h0BJk9s0aElAQmWHB5TASyxzW7MJF9ZqMcegbGS
   g==;
X-CSE-ConnectionGUID: FrBiZU4KS+W+cT2qb0JLyw==
X-CSE-MsgGUID: q4XFTAEsScG5LBHqtK+OMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56321645"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; 
   d="scan'208";a="56321645"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 04:26:52 -0700
X-CSE-ConnectionGUID: xeotsdMcRtWAPsimgfViJQ==
X-CSE-MsgGUID: WmUb2kSPQCCEoJwqsSrd7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; 
   d="scan'208";a="126921796"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 02 Apr 2025 04:26:51 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzwF7-000Aec-0K;
	Wed, 02 Apr 2025 11:26:49 +0000
Date: Wed, 2 Apr 2025 19:26:23 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 7/7] drivers/crypto/ccp/vpsp.c:593:6:
 warning: no previous prototype for 'vpsp_set_default_vid_permission'
Message-ID: <202504021936.iQIWAwFb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   5bcfae793917ca097364501bd3ff69d749df729e
commit: c8cee0acc0683f57bf575e08a0509c5836301720 [7/7] anolis: crypto: ccp: move vpsp-related functions to vpsp.c
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250402/202504021936.iQIWAwFb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504021936.iQIWAwFb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504021936.iQIWAwFb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/vpsp.c:593:6: warning: no previous prototype for 'vpsp_set_default_vid_permission' [-Wmissing-prototypes]
     593 | void vpsp_set_default_vid_permission(uint32_t is_allow)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/crypto/ccp/vpsp.c:111: warning: Function parameter or member 'vpsp' not described in 'kvm_pv_psp_cmd_pre_op'
   drivers/crypto/ccp/vpsp.c:111: warning: Function parameter or member 'data_gpa' not described in 'kvm_pv_psp_cmd_pre_op'
   drivers/crypto/ccp/vpsp.c:111: warning: Function parameter or member 'hbuf' not described in 'kvm_pv_psp_cmd_pre_op'
   drivers/crypto/ccp/vpsp.c:355: warning: Cannot understand  * @brief Directly convert the gpa address into hpa and forward it to PSP,
    on line 355 - I thought it was a doc line
   drivers/crypto/ccp/vpsp.c:450: warning: Cannot understand  * @brief copy data in gpa to host memory and send it to psp for processing.
    on line 450 - I thought it was a doc line
>> drivers/crypto/ccp/vpsp.c:592: warning: cannot understand function prototype: 'uint32_t allow_default_vid = 1; '
   drivers/crypto/ccp/vpsp.c:607: warning: Function parameter or member 'ctx' not described in 'vpsp_get_context'
   drivers/crypto/ccp/vpsp.c:607: warning: Function parameter or member 'pid' not described in 'vpsp_get_context'
>> drivers/crypto/ccp/vpsp.c:633: warning: Function parameter or member 'vid' not described in 'vpsp_add_vid'


vim +/vpsp_set_default_vid_permission +593 drivers/crypto/ccp/vpsp.c

   586	
   587	/**
   588	 * When 'allow_default_vid' is set to 1,
   589	 * QEMU is allowed to use 'vid 0' by default
   590	 * in the absence of a valid 'vid' setting.
   591	 */
 > 592	uint32_t allow_default_vid = 1;
 > 593	void vpsp_set_default_vid_permission(uint32_t is_allow)
   594	{
   595		allow_default_vid = is_allow;
   596	}
   597	
   598	int vpsp_get_default_vid_permission(void)
   599	{
   600		return allow_default_vid;
   601	}
   602	
   603	/**
   604	 * get a vpsp context from pid
   605	 */
   606	int vpsp_get_context(struct vpsp_context **ctx, pid_t pid)
   607	{
   608		struct vpsp_context new_entry = {.pid = pid};
   609		struct vpsp_context *existing_entry = NULL;
   610	
   611		read_lock(&vpsp_rwlock);
   612		existing_entry = bsearch(&new_entry, g_vpsp_context_array, g_vpsp_vid_num,
   613					sizeof(struct vpsp_context), compare_vid_entries);
   614		read_unlock(&vpsp_rwlock);
   615	
   616		if (!existing_entry)
   617			return -ENOENT;
   618	
   619		if (ctx)
   620			*ctx = existing_entry;
   621	
   622		return 0;
   623	}
   624	
   625	/**
   626	 * Upon qemu startup, this section checks whether
   627	 * the '-device psp,vid' parameter is specified.
   628	 * If set, it utilizes the 'vpsp_add_vid' function
   629	 * to insert the 'vid' and 'pid' values into the 'g_vpsp_context_array'.
   630	 * The insertion is done in ascending order of 'pid'.
   631	 */
   632	static int vpsp_add_vid(uint32_t vid)
 > 633	{
   634		pid_t cur_pid = task_pid_nr(current);
   635		struct vpsp_context new_entry = {.vid = vid, .pid = cur_pid};
   636	
   637		if (vpsp_get_context(NULL, cur_pid) == 0)
   638			return -EEXIST;
   639		if (g_vpsp_vid_num == VPSP_VID_MAX_ENTRIES)
   640			return -ENOMEM;
   641		if (vid >= VPSP_VID_NUM_MAX)
   642			return -EINVAL;
   643	
   644		write_lock(&vpsp_rwlock);
   645		memcpy(&g_vpsp_context_array[g_vpsp_vid_num++], &new_entry, sizeof(struct vpsp_context));
   646		sort(g_vpsp_context_array, g_vpsp_vid_num, sizeof(struct vpsp_context),
   647					compare_vid_entries, swap_vid_entries);
   648		pr_info("PSP: add vid %d, by pid %d, total vid num is %d\n", vid, cur_pid, g_vpsp_vid_num);
   649		write_unlock(&vpsp_rwlock);
   650		return 0;
   651	}
   652	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
