Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2D32F693E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 09:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765444787; cv=none; b=X1HIALHKOQaRPd6jxb7pzbzZZjqKOElXCtKGe1QSbXvVmR/MZuj4gUgDjX2HgWXTSpZcGt+mV0VtBp7+nQ0Z0/KfhrIOdRJbIlhu6vz09/OWdubMTJ29MOkW5ggld1s54d8GvG1iMdxgnJLJHe/nm8iYIw3pGtqZ1pxa8r+cu3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765444787; c=relaxed/simple;
	bh=N/NfKfXVYKTlD67VF9/8RxZSoS1ickwwl02PVkQAi14=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fZjKQIJBJdDJeDkLdtUaZ9Dse3EWFABkcGn3KCebOul7lM88B2Vv+PBqYViqOTBX/Vr1pvPm4gTbqpLkHyaBwvmU3+HSX28fr7NZFb9CVf+4aoq6L30EADn4rvg3CeNOt4ZlaNoxONdUSmNsmCbsBWRhrPvLqtAN4NsgLGmFrgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ah+oWh9U; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ah+oWh9U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765444784; x=1796980784;
  h=date:from:cc:subject:message-id:mime-version;
  bh=N/NfKfXVYKTlD67VF9/8RxZSoS1ickwwl02PVkQAi14=;
  b=Ah+oWh9UXxLtjFYtj0C8S6W3QL98iWTw3SINspE4WerFVgQEYgUjrHex
   QuG94hnQ0m5n3AJrYig6unEaZ+hbZ7J6TXVrjsHASh0qyPCTlY5ANBr7F
   9XhImZ1kU7CrWL9LJDKaVHWluQSZ4RLagpA0Q6RgIM6gDuQb+m3AmEn2U
   gl2a+mTzp5v0ea4h0/JtZ00hI/b4BWvDYavbHDD6uDWPK3svSD2p16rYd
   +QQ3wYhPug6yVdWQoHrDTVi3VHwpITF2NsvqWmdkeL5YGkHspqZkTmdNa
   mrTlaj9MapJMt8g8GDJbo6vuNAbMwMi8UjjiJPDgNn0kzxK1znc+qRLYg
   g==;
X-CSE-ConnectionGUID: JbpIF8RsRkOk4AbPSMrIIw==
X-CSE-MsgGUID: eh4PSjB/SUKS6q3N3LLiyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78535781"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78535781"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 01:19:43 -0800
X-CSE-ConnectionGUID: nXI1+H3pT5izFNNLbcrewg==
X-CSE-MsgGUID: ibEk+cczRGyL2UGy1ML7vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196363163"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 11 Dec 2025 01:19:42 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTcpn-000000000z2-40Ru
	for oe-kbuild-all@lists.linux.dev;
	Thu, 11 Dec 2025 09:19:39 +0000
Date: Thu, 11 Dec 2025 10:18:44 +0100
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.12/emt 9/9] kernel/time/tick-broadcast.c:1026: warning:
 Function parameter or struct member 'bc' not described in
 'tick_broadcast_setup_oneshot'
Message-ID: <202512111012.Ykb6CeMj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Palmer,

First bad commit (maybe != root cause):

tree:   https://github.com/intel/linux-intel-lts.git 6.12/emt
head:   aac28a88afc1d68448c7e5672fed4da83e10fe8b
commit: cfcde627f08c841f75c29019b2d0064e5bc0a895 [9/9] RISC-V: Remove unnecessary include from compat.h
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251211/202512111012.Ykb6CeMj-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111012.Ykb6CeMj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111012.Ykb6CeMj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/tick-broadcast.c:1026: warning: Function parameter or struct member 'bc' not described in 'tick_broadcast_setup_oneshot'
>> kernel/time/tick-broadcast.c:1026: warning: Function parameter or struct member 'from_periodic' not described in 'tick_broadcast_setup_oneshot'


vim +1026 kernel/time/tick-broadcast.c

f73f64d5687192 Thomas Gleixner 2020-11-17  1020  
79bf2bb335b85d Thomas Gleixner 2007-02-16  1021  /**
8dce39c231af55 Li Zefan        2007-11-05  1022   * tick_broadcast_setup_oneshot - setup the broadcast device
79bf2bb335b85d Thomas Gleixner 2007-02-16  1023   */
f9d36cf445ffff Thomas Gleixner 2023-05-06  1024  static void tick_broadcast_setup_oneshot(struct clock_event_device *bc,
f9d36cf445ffff Thomas Gleixner 2023-05-06  1025  					 bool from_periodic)
79bf2bb335b85d Thomas Gleixner 2007-02-16 @1026  {
07f4beb0b5bbfa Thomas Gleixner 2011-05-16  1027  	int cpu = smp_processor_id();
f9d36cf445ffff Thomas Gleixner 2023-05-06  1028  	ktime_t nexttick = 0;
07f4beb0b5bbfa Thomas Gleixner 2011-05-16  1029  
c1a9eeb938b543 Thomas Gleixner 2016-12-15  1030  	if (!bc)
c1a9eeb938b543 Thomas Gleixner 2016-12-15  1031  		return;
c1a9eeb938b543 Thomas Gleixner 2016-12-15  1032  
f9d36cf445ffff Thomas Gleixner 2023-05-06  1033  	/*
f9d36cf445ffff Thomas Gleixner 2023-05-06  1034  	 * When the broadcast device was switched to oneshot by the first
f9d36cf445ffff Thomas Gleixner 2023-05-06  1035  	 * CPU handling the NOHZ change, the other CPUs will reach this
f9d36cf445ffff Thomas Gleixner 2023-05-06  1036  	 * code via hrtimer_run_queues() -> tick_check_oneshot_change()
f9d36cf445ffff Thomas Gleixner 2023-05-06  1037  	 * too. Set up the broadcast device only once!
f9d36cf445ffff Thomas Gleixner 2023-05-06  1038  	 */
f9d36cf445ffff Thomas Gleixner 2023-05-06  1039  	if (bc->event_handler == tick_handle_oneshot_broadcast) {
f9d36cf445ffff Thomas Gleixner 2023-05-06  1040  		/*
f9d36cf445ffff Thomas Gleixner 2023-05-06  1041  		 * The CPU which switched from periodic to oneshot mode
f9d36cf445ffff Thomas Gleixner 2023-05-06  1042  		 * set the broadcast oneshot bit for all other CPUs which
f9d36cf445ffff Thomas Gleixner 2023-05-06  1043  		 * are in the general (periodic) broadcast mask to ensure
f9d36cf445ffff Thomas Gleixner 2023-05-06  1044  		 * that CPUs which wait for the periodic broadcast are
f9d36cf445ffff Thomas Gleixner 2023-05-06  1045  		 * woken up.
f9d36cf445ffff Thomas Gleixner 2023-05-06  1046  		 *
f9d36cf445ffff Thomas Gleixner 2023-05-06  1047  		 * Clear the bit for the local CPU as the set bit would
f9d36cf445ffff Thomas Gleixner 2023-05-06  1048  		 * prevent the first tick_broadcast_enter() after this CPU
f9d36cf445ffff Thomas Gleixner 2023-05-06  1049  		 * switched to oneshot state to program the broadcast
f9d36cf445ffff Thomas Gleixner 2023-05-06  1050  		 * device.
f9d36cf445ffff Thomas Gleixner 2023-05-06  1051  		 *
f9d36cf445ffff Thomas Gleixner 2023-05-06  1052  		 * This code can also be reached via tick_broadcast_control(),
f9d36cf445ffff Thomas Gleixner 2023-05-06  1053  		 * but this cannot avoid the tick_broadcast_clear_oneshot()
f9d36cf445ffff Thomas Gleixner 2023-05-06  1054  		 * as that would break the periodic to oneshot transition of
f9d36cf445ffff Thomas Gleixner 2023-05-06  1055  		 * secondary CPUs. But that's harmless as the below only
f9d36cf445ffff Thomas Gleixner 2023-05-06  1056  		 * clears already cleared bits.
f9d36cf445ffff Thomas Gleixner 2023-05-06  1057  		 */
f9d36cf445ffff Thomas Gleixner 2023-05-06  1058  		tick_broadcast_clear_oneshot(cpu);
f9d36cf445ffff Thomas Gleixner 2023-05-06  1059  		return;
f9d36cf445ffff Thomas Gleixner 2023-05-06  1060  	}
f9d36cf445ffff Thomas Gleixner 2023-05-06  1061  
7300711e8c6824 Thomas Gleixner 2008-09-06  1062  
79bf2bb335b85d Thomas Gleixner 2007-02-16  1063  	bc->event_handler = tick_handle_oneshot_broadcast;
f9d36cf445ffff Thomas Gleixner 2023-05-06  1064  	bc->next_event = KTIME_MAX;
7300711e8c6824 Thomas Gleixner 2008-09-06  1065  
7300711e8c6824 Thomas Gleixner 2008-09-06  1066  	/*
f9d36cf445ffff Thomas Gleixner 2023-05-06  1067  	 * When the tick mode is switched from periodic to oneshot it must
f9d36cf445ffff Thomas Gleixner 2023-05-06  1068  	 * be ensured that CPUs which are waiting for periodic broadcast
f9d36cf445ffff Thomas Gleixner 2023-05-06  1069  	 * get their wake-up at the next tick.  This is achieved by ORing
f9d36cf445ffff Thomas Gleixner 2023-05-06  1070  	 * tick_broadcast_mask into tick_broadcast_oneshot_mask.
f9d36cf445ffff Thomas Gleixner 2023-05-06  1071  	 *
f9d36cf445ffff Thomas Gleixner 2023-05-06  1072  	 * For other callers, e.g. broadcast device replacement,
f9d36cf445ffff Thomas Gleixner 2023-05-06  1073  	 * tick_broadcast_oneshot_mask must not be touched as this would
f9d36cf445ffff Thomas Gleixner 2023-05-06  1074  	 * set bits for CPUs which are already NOHZ, but not idle. Their
f9d36cf445ffff Thomas Gleixner 2023-05-06  1075  	 * next tick_broadcast_enter() would observe the bit set and fail
f9d36cf445ffff Thomas Gleixner 2023-05-06  1076  	 * to update the expiry time and the broadcast event device.
7300711e8c6824 Thomas Gleixner 2008-09-06  1077  	 */
f9d36cf445ffff Thomas Gleixner 2023-05-06  1078  	if (from_periodic) {
b352bc1cbc2913 Thomas Gleixner 2013-03-05  1079  		cpumask_copy(tmpmask, tick_broadcast_mask);
f9d36cf445ffff Thomas Gleixner 2023-05-06  1080  		/* Remove the local CPU as it is obviously not idle */
b352bc1cbc2913 Thomas Gleixner 2013-03-05  1081  		cpumask_clear_cpu(cpu, tmpmask);
f9d36cf445ffff Thomas Gleixner 2023-05-06  1082  		cpumask_or(tick_broadcast_oneshot_mask, tick_broadcast_oneshot_mask, tmpmask);
7300711e8c6824 Thomas Gleixner 2008-09-06  1083  
f9d36cf445ffff Thomas Gleixner 2023-05-06  1084  		/*
f9d36cf445ffff Thomas Gleixner 2023-05-06  1085  		 * Ensure that the oneshot broadcast handler will wake the
f9d36cf445ffff Thomas Gleixner 2023-05-06  1086  		 * CPUs which are still waiting for periodic broadcast.
f9d36cf445ffff Thomas Gleixner 2023-05-06  1087  		 */
f9d36cf445ffff Thomas Gleixner 2023-05-06  1088  		nexttick = tick_get_next_period();
f9d36cf445ffff Thomas Gleixner 2023-05-06  1089  		tick_broadcast_init_next_event(tmpmask, nexttick);
f73f64d5687192 Thomas Gleixner 2020-11-17  1090  
07f4beb0b5bbfa Thomas Gleixner 2011-05-16  1091  		/*
f9d36cf445ffff Thomas Gleixner 2023-05-06  1092  		 * If the underlying broadcast clock event device is
f9d36cf445ffff Thomas Gleixner 2023-05-06  1093  		 * already in oneshot state, then there is nothing to do.
f9d36cf445ffff Thomas Gleixner 2023-05-06  1094  		 * The device was already armed for the next tick
f9d36cf445ffff Thomas Gleixner 2023-05-06  1095  		 * in tick_handle_broadcast_periodic()
07f4beb0b5bbfa Thomas Gleixner 2011-05-16  1096  		 */
f9d36cf445ffff Thomas Gleixner 2023-05-06  1097  		if (clockevent_state_oneshot(bc))
f9d36cf445ffff Thomas Gleixner 2023-05-06  1098  			return;
79bf2bb335b85d Thomas Gleixner 2007-02-16  1099  	}
f9d36cf445ffff Thomas Gleixner 2023-05-06  1100  
f9d36cf445ffff Thomas Gleixner 2023-05-06  1101  	/*
f9d36cf445ffff Thomas Gleixner 2023-05-06  1102  	 * When switching from periodic to oneshot mode arm the broadcast
f9d36cf445ffff Thomas Gleixner 2023-05-06  1103  	 * device for the next tick.
f9d36cf445ffff Thomas Gleixner 2023-05-06  1104  	 *
f9d36cf445ffff Thomas Gleixner 2023-05-06  1105  	 * If the broadcast device has been replaced in oneshot mode and
f9d36cf445ffff Thomas Gleixner 2023-05-06  1106  	 * the oneshot broadcast mask is not empty, then arm it to expire
f9d36cf445ffff Thomas Gleixner 2023-05-06  1107  	 * immediately in order to reevaluate the next expiring timer.
f9d36cf445ffff Thomas Gleixner 2023-05-06  1108  	 * @nexttick is 0 and therefore in the past which will cause the
f9d36cf445ffff Thomas Gleixner 2023-05-06  1109  	 * clockevent code to force an event.
f9d36cf445ffff Thomas Gleixner 2023-05-06  1110  	 *
f9d36cf445ffff Thomas Gleixner 2023-05-06  1111  	 * For both cases the programming can be avoided when the oneshot
f9d36cf445ffff Thomas Gleixner 2023-05-06  1112  	 * broadcast mask is empty.
f9d36cf445ffff Thomas Gleixner 2023-05-06  1113  	 *
f9d36cf445ffff Thomas Gleixner 2023-05-06  1114  	 * tick_broadcast_set_event() implicitly switches the broadcast
f9d36cf445ffff Thomas Gleixner 2023-05-06  1115  	 * device to oneshot state.
f9d36cf445ffff Thomas Gleixner 2023-05-06  1116  	 */
f9d36cf445ffff Thomas Gleixner 2023-05-06  1117  	if (!cpumask_empty(tick_broadcast_oneshot_mask))
f9d36cf445ffff Thomas Gleixner 2023-05-06  1118  		tick_broadcast_set_event(bc, cpu, nexttick);
9c17bcda991000 Thomas Gleixner 2008-09-03  1119  }
79bf2bb335b85d Thomas Gleixner 2007-02-16  1120  

:::::: The code at line 1026 was first introduced by commit
:::::: 79bf2bb335b85db25d27421c798595a2fa2a0e82 [PATCH] tick-management: dyntick / highres functionality

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
