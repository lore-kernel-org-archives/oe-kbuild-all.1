Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C062221FC7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 01:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757380308; cv=none; b=L6urI3TGXA0kIdkPjoqn+nTFTRas1uaRy6kCArPpMKWSsHRnlhsUsJ8TOBR7SiAen8dTp6cJ+foW5km1KXB1udDICz7+/4cZX00HixYa4uKQy0qB8AsBBDU7kiaZgndANLeJh5OT/U+zy2of5BxZfo9rcnQH2ec8QH9liAUf4P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757380308; c=relaxed/simple;
	bh=hFb6dqF6h31bAV9zo4gHs9FeiFt501sVn0q2lb0W2xg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=psXfPJWnhiKhf9F/SCae4aE4Ne+N38nM33YFUkfxoxzrS6M8H6Adpq1FMmxEotNNl+87ODes75YNXktDMSwN1Kph8cDu69wHBP+ePUnhfk/E3r4LdolmZyptL//KZFV/gYcLgDKBgvNX91szmDzoMAe/ZmIvfqFsDVRfqujJuh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UVcfec8N; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVcfec8N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757380306; x=1788916306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hFb6dqF6h31bAV9zo4gHs9FeiFt501sVn0q2lb0W2xg=;
  b=UVcfec8NYA3ZMKwMOI8gCnUaRRJk5rMF6iqwmNlvfBK2e5t93QvvIFv8
   S6K/evkdTdoeD3K0GQF7vLI1qWKkEJXEDQ0dRYfaXJnB+uleTkkB7k/6c
   JwJPRkOJVicrYnHR8AAZp2EfFJu6xmk5Cf+02uiaICLKs2YnOToP0ZcLw
   GMQ+qxkMbpAq7mk9NQjmvsgB26locoOa+1KuVEE4GSgYf4C4b5EvmA8kZ
   i9PCxJTa8avcPexHKursv9qP41vAGdfkYbEs15gg/bGKoI0/arb/pqf9A
   lcDReJlwXi2lvRLEpDHx964B2orfBU5Jn4iF59s+zqGdjyhaqihuIddgh
   g==;
X-CSE-ConnectionGUID: hncG8GYsQwiS8G+oaXrpxg==
X-CSE-MsgGUID: EU6jxvP+Qm6i5NToIynQzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59512859"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="59512859"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 18:11:42 -0700
X-CSE-ConnectionGUID: QqqjgR2RSzec4uR5QNh8Xg==
X-CSE-MsgGUID: 4ZPtCXQrTm2VRiyRCw2WwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="172119938"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Sep 2025 18:11:42 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvmtX-0004IZ-25;
	Tue, 09 Sep 2025 01:11:39 +0000
Date: Tue, 9 Sep 2025 09:11:21 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/slice 57/58] kernel/entry/common.c:40:30: error:
 implicit declaration of function 'rseq_grant_slice_extension'
Message-ID: <202509090929.1NyNNr3t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice
head:   a2e41ac0ef0218895394b1ac12abe5b67d6d62d0
commit: baa2d48fdb68032a01a6c1a02c8758e14ad7edf9 [57/58] entry: Hook up rseq time slice extension
config: i386-buildonly-randconfig-001-20250909 (https://download.01.org/0day-ci/archive/20250909/202509090929.1NyNNr3t-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509090929.1NyNNr3t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509090929.1NyNNr3t-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/entry/common.c: In function '__exit_to_user_mode_loop':
>> kernel/entry/common.c:40:30: error: implicit declaration of function 'rseq_grant_slice_extension' [-Werror=implicit-function-declaration]
      40 |                         if (!rseq_grant_slice_extension(ti_work & TIF_SLICE_EXT_DENY))
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/rseq_grant_slice_extension +40 kernel/entry/common.c

    27	
    28	static __always_inline unsigned long __exit_to_user_mode_loop(struct pt_regs *regs,
    29								      unsigned long ti_work)
    30	{
    31		/*
    32		 * Before returning to user space ensure that all pending work
    33		 * items have been completed.
    34		 */
    35		while (ti_work & EXIT_TO_USER_MODE_WORK_LOOP) {
    36	
    37			local_irq_enable_exit_to_user(ti_work);
    38	
    39			if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
  > 40				if (!rseq_grant_slice_extension(ti_work & TIF_SLICE_EXT_DENY))
    41					schedule();
    42			}
    43	
    44			if (ti_work & _TIF_UPROBE)
    45				uprobe_notify_resume(regs);
    46	
    47			if (ti_work & _TIF_PATCH_PENDING)
    48				klp_update_patch_state(current);
    49	
    50			if (ti_work & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
    51				arch_do_signal_or_restart(regs);
    52	
    53			if (ti_work & _TIF_NOTIFY_RESUME)
    54				resume_user_mode_work(regs);
    55	
    56			/* Architecture specific TIF work */
    57			arch_exit_to_user_mode_work(regs, ti_work);
    58	
    59			/*
    60			 * Disable interrupts and reevaluate the work flags as they
    61			 * might have changed while interrupts and preemption was
    62			 * enabled above.
    63			 */
    64			local_irq_disable_exit_to_user();
    65	
    66			/* Check if any of the above work has queued a deferred wakeup */
    67			tick_nohz_user_enter_prepare();
    68	
    69			ti_work = read_thread_flags();
    70		}
    71	
    72		/* Return the latest work state for arch_exit_to_user_mode() */
    73		return ti_work;
    74	}
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
