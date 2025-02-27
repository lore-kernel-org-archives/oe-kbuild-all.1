Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA29723315A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 14:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740666811; cv=none; b=llHDUgJspxyfTHsZTRheJxWeCZjL0koG+ugYg5uwzaiq5rlvGdUNS0rI56czu5yIwDUX2A63TLcB5dAQbmPuPz+QzT8mMsyujiaex4x6Rw8fDiKibvNQpNZZFPXaVmphP4w5fSqEI2rH/0F0qb5/QhK5ncRA6MtNjvJMYotiuxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740666811; c=relaxed/simple;
	bh=/7TkpyI/3xJq4/KdGM0zlJYPHWAZBK9m2KiQsivk40g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kbXAogrt8UhrS07iloYSjHG34EU+e9Wcg4awDhlhp5Fogjotr+CjqHlL1leqEIj5nZYVRirnYV61fS1NHyZIJf91FwLxrQPZdXhW9yzvhDb0xEAcV2XWR6UUt4Ip9bkHvEcEGONRJ7QbaDDtfirNz4YpgemHGXT81OZd2Yh0eBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0XfCSEy; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0XfCSEy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740666810; x=1772202810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/7TkpyI/3xJq4/KdGM0zlJYPHWAZBK9m2KiQsivk40g=;
  b=T0XfCSEy9i0oFeB29wB6seddl+uSaOhTDs/zr/wVXdETjFqrdWXHButQ
   b8yf9OD1yc5lFlFqeJddlInEITJ2HsK3anJi/Go1jddzZ5jmL9g+7IOSk
   nyvR02GLC3Ia1ye/mfRQdOSKu4jm8yCiy01D/7q+IELWa03fbZI0ej9V2
   X0udravFQkRnLYiG56DkbxitNuAExGlQv26Xs6tDdYaOFbmf0YLe275MK
   BobwEPX5RggZdtCf0DMmf4rPflMPrnQ+On7sWG2a8aPF6cZypKnluURRG
   SnPcog+iX1OERlOI3F7Ot5TWhPl5MHo7i5ojxG70iz5nI3W/vFqPn9bPh
   Q==;
X-CSE-ConnectionGUID: laFvwIkoS6qOn972icLotA==
X-CSE-MsgGUID: TwbICwtATGudayTjU9SNcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45209775"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="45209775"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 06:33:29 -0800
X-CSE-ConnectionGUID: G3v7KnSIQEC/dmTT5Z7lFA==
X-CSE-MsgGUID: 4Ir4CB8fTfeMpV9AdEk7Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122281388"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 27 Feb 2025 06:33:28 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnex3-000DUU-2R;
	Thu, 27 Feb 2025 14:33:25 +0000
Date: Thu, 27 Feb 2025 22:30:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 2/2]
 kernel/sched/core.c:6861:4: error: call to undeclared function
 'stack_trace_save_tsk'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202502272242.HMnIRB86-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   1f36e6de55f3acb717f090d6aa7ab10240b9a2a2
commit: 45072073741a05cd16f4c1f65c647c90c1ed4446 [2/2] ANDROID: Fix invalid caller output in trace_sched_blocked_reason
config: arm-mps2_defconfig (https://download.01.org/0day-ci/archive/20250227/202502272242.HMnIRB86-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502272242.HMnIRB86-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502272242.HMnIRB86-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:6861:4: error: call to undeclared function 'stack_trace_save_tsk'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                           stack_trace_save_tsk(prev, &blocked_func, 1, 0);
                           ^
   1 error generated.


vim +/stack_trace_save_tsk +6861 kernel/sched/core.c

  6818	
  6819		trace_android_rvh_schedule(prev, next, rq);
  6820		if (likely(prev != next)) {
  6821			rq->nr_switches++;
  6822			/*
  6823			 * RCU users of rcu_dereference(rq->curr) may not see
  6824			 * changes to task_struct made by pick_next_task().
  6825			 */
  6826			RCU_INIT_POINTER(rq->curr, next);
  6827			/*
  6828			 * The membarrier system call requires each architecture
  6829			 * to have a full memory barrier after updating
  6830			 * rq->curr, before returning to user-space.
  6831			 *
  6832			 * Here are the schemes providing that barrier on the
  6833			 * various architectures:
  6834			 * - mm ? switch_mm() : mmdrop() for x86, s390, sparc, PowerPC,
  6835			 *   RISC-V.  switch_mm() relies on membarrier_arch_switch_mm()
  6836			 *   on PowerPC and on RISC-V.
  6837			 * - finish_lock_switch() for weakly-ordered
  6838			 *   architectures where spin_unlock is a full barrier,
  6839			 * - switch_to() for arm64 (weakly-ordered, spin_unlock
  6840			 *   is a RELEASE barrier),
  6841			 *
  6842			 * The barrier matches a full barrier in the proximity of
  6843			 * the membarrier system call entry.
  6844			 *
  6845			 * On RISC-V, this barrier pairing is also needed for the
  6846			 * SYNC_CORE command when switching between processes, cf.
  6847			 * the inline comments in membarrier_arch_switch_mm().
  6848			 */
  6849			++*switch_count;
  6850	
  6851			migrate_disable_switch(rq, prev);
  6852			psi_account_irqtime(rq, prev, next);
  6853			psi_sched_switch(prev, next, block);
  6854	
  6855			trace_sched_switch(preempt, prev, next, prev_state);
  6856	
  6857			if (block && (prev_state & TASK_UNINTERRUPTIBLE)
  6858				&& trace_sched_blocked_reason_enabled()) {
  6859				unsigned long blocked_func = 0;
  6860	
> 6861				stack_trace_save_tsk(prev, &blocked_func, 1, 0);
  6862				trace_sched_blocked_reason(prev, (void *)blocked_func);
  6863			}
  6864	
  6865			/* Also unlocks the rq: */
  6866			rq = context_switch(rq, prev, next, &rf);
  6867		} else {
  6868			rq_unpin_lock(rq, &rf);
  6869			__balance_callbacks(rq);
  6870			raw_spin_rq_unlock_irq(rq);
  6871		}
  6872	}
  6873	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
