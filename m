Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230B11A238F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 07:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765439869; cv=none; b=TpPirYtJ3zuqxtfCF/1melvA97YIYd9MredDp454p4Za308x608KokDo/+iqAM5YL8+NUxb+hfcPXbSlm+cDnOqIVxrMdGnoZ3wwjN9cKFnRpB4A0HuxBAiZMUgD+9aVgjq4iCzj0sZiHt9Md7wsfG19phrOeqpJrpyywlvIg0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765439869; c=relaxed/simple;
	bh=GlZpn+OPsKINOM6YpsjioTXmAV1VodqK5TUqrfvq8OE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DwWXKoXEaO391OovYG9DhRbfRxhZRRbPXjaZ+wYlVvfukpclnqDkCEji0NKEmWBMnFHepUSxh4+tEBpecd/jugBhTW9/6XeE3Ji/DSFYe47mXv+BWCXgKrn2yAd4HsIJNlc5vQSswi9ioobAkhGDSNWRR7q9+ldPTP4mNCNMO14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OUl7v8SV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OUl7v8SV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765439868; x=1796975868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GlZpn+OPsKINOM6YpsjioTXmAV1VodqK5TUqrfvq8OE=;
  b=OUl7v8SVYh5XM4unX8Cbm1HLPw/Urgmn7NCOGrn9ZDIh7ssTHUs7zm2J
   dDSXW+4okHC/F6qgFyypKpBtbKatjE3Fj1VnNBscgDJUsBmlh42zFrzOG
   gn1KqvbRnSMdgA1sRMyWwKg7sEFqU5I3xHxRDvkldPLIlRkXAmUWrGsLk
   7ADg6TTIa/qryfo6/ihnK/0obPoIEs5n16omsImIy00UNgVLufHGDWRgA
   siex04t5JUthCYv35P7Agup0nbDciXR1ypxJSLpxzFWdY5G6RUiAxNCqM
   Ak5+6TL60eW345AlYUCOCtdXb/sYSpaInkUXpqccgu6pagkWxeIFgrCRx
   w==;
X-CSE-ConnectionGUID: egELjyLHSs2fsvu2R4Z9Pg==
X-CSE-MsgGUID: YnUcFR8LTBSi7g6wArZN1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="54964837"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="54964837"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 23:57:48 -0800
X-CSE-ConnectionGUID: DJPjrG67T4GXPlKyZYhAvw==
X-CSE-MsgGUID: 8mX2DcEBR/a3aqiHef8MYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196342113"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Dec 2025 23:57:46 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTbYW-000000004Nd-1Ik3;
	Thu, 11 Dec 2025 07:57:44 +0000
Date: Thu, 11 Dec 2025 15:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Ingo Molnar <mingo@kernel.org>
Subject: [mingo-tip:WIP.sched/flat 21/26] kernel/entry/common.c:37:33: error:
 '_TIF_HRTIMER_REARM' undeclared
Message-ID: <202512111512.nQBIltDe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.sched/flat
head:   9d8a22c60fd08f2f4a82aa5d81885e0ab6ad52cd
commit: c1319d958d60e528bb18cea6b1b3bb7e9068e38b [21/26] entry,hrtimer: Push reprogramming timers into the interrupt return path
config: arm64-randconfig-003-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111512.nQBIltDe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111512.nQBIltDe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111512.nQBIltDe-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/entry/common.c: In function '__exit_to_user_mode_loop':
>> kernel/entry/common.c:37:33: error: '_TIF_HRTIMER_REARM' undeclared (first use in this function)
      37 |                                 _TIF_HRTIMER_REARM)) == _TIF_HRTIMER_REARM)
         |                                 ^~~~~~~~~~~~~~~~~~
   kernel/entry/common.c:37:33: note: each undeclared identifier is reported only once for each function it appears in


vim +/_TIF_HRTIMER_REARM +37 kernel/entry/common.c

    20	
    21	static __always_inline unsigned long __exit_to_user_mode_loop(struct pt_regs *regs,
    22								      unsigned long ti_work)
    23	{
    24		/*
    25		 * Before returning to user space ensure that all pending work
    26		 * items have been completed.
    27		 */
    28		while (ti_work & EXIT_TO_USER_MODE_WORK_LOOP) {
    29	
    30			/*
    31			 * If hrtimer need re-arming, do so before enabling IRQs,
    32			 * except when a reschedule is needed, in that case schedule()
    33			 * will do this.
    34			 */
    35			if ((ti_work & (_TIF_NEED_RESCHED |
    36					_TIF_NEED_RESCHED_LAZY |
  > 37					_TIF_HRTIMER_REARM)) == _TIF_HRTIMER_REARM)
    38				hrtimer_rearm();
    39	
    40			local_irq_enable_exit_to_user(ti_work);
    41	
    42			if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
    43				schedule();
    44	
    45			if (ti_work & _TIF_UPROBE)
    46				uprobe_notify_resume(regs);
    47	
    48			if (ti_work & _TIF_PATCH_PENDING)
    49				klp_update_patch_state(current);
    50	
    51			if (ti_work & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
    52				arch_do_signal_or_restart(regs);
    53	
    54			if (ti_work & _TIF_NOTIFY_RESUME)
    55				resume_user_mode_work(regs);
    56	
    57			/* Architecture specific TIF work */
    58			arch_exit_to_user_mode_work(regs, ti_work);
    59	
    60			/*
    61			 * Disable interrupts and reevaluate the work flags as they
    62			 * might have changed while interrupts and preemption was
    63			 * enabled above.
    64			 */
    65			local_irq_disable_exit_to_user();
    66	
    67			/* Check if any of the above work has queued a deferred wakeup */
    68			tick_nohz_user_enter_prepare();
    69	
    70			ti_work = read_thread_flags();
    71		}
    72	
    73		/* Return the latest work state for arch_exit_to_user_mode() */
    74		return ti_work;
    75	}
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
