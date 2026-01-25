Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F66B224B0E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 17:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769363193; cv=none; b=eEBEpNicE9NxR2ZHBPETUSJiqVpi8vVqAP6lbbApL45o7r1l/sTAEW3vop9Z0r0Bk1TzpF8Mus6enzfxZGHny9ZG2wgTM8wmtZ0PvR6jEGZ4WmKkRA6raySTd3jRClQPRWvEOYZYjdfsVhsqBYvxJhqN2Qlj5pCXvwjEPcpFR78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769363193; c=relaxed/simple;
	bh=eHHsH4yt16aJelqVS20YoyHqrNHSpJIiCOunl5LZizI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=njBSqvhC/JLhYpAETYZwbPkRqOW7YSgL6kdOZ3aU4AJsuCO/SoLP0NwvKFtFNJA9A9Im6oYTSVsEHcvuuWkHiDfvV973Ua0fK36cFWAxZ3Omg5tU01+1AVKjyiJyX2FGEPsxQ6Iy8qND1QFZ2d8ikVY9lNRK6srO6S51xvHaaH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VwtPjZiX; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VwtPjZiX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769363191; x=1800899191;
  h=date:from:to:cc:subject:message-id;
  bh=eHHsH4yt16aJelqVS20YoyHqrNHSpJIiCOunl5LZizI=;
  b=VwtPjZiXP5/TkQq2ofNoLwMrvd4CEUjHzrQZ056S7/mQp+Wmx4apKDy4
   bimt9AzIgJhAgRd9Dnjvu3h5sUtLkDltY4Z4TOAQ1dXiZYboY6feIx0R5
   H83CMYvS7VrXOI4VKUBo8BuM7KqRJHdui/gb6rC3yxf5+9fbPjW605ckA
   xQ7qOIcQ4RoyloRYQOxI2coamTpTuoMSAPZVyLhaBF8p/PTQhUUODqztM
   nVFSiR1fsLmYvj9a+xTcAAYNKHAsUS3aiySIPRQigcpRvS3cuyRTAZTPn
   /tUz0ORWElE4rE9jFBciidxgZxCZdq7bEl1MOwoRN0Q45RQMA63IHUNya
   g==;
X-CSE-ConnectionGUID: WeqhR2WDTvSmeSRwJEMEBQ==
X-CSE-MsgGUID: MFnJ2SACQZWkb+4C57vqug==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70609868"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="70609868"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 09:46:31 -0800
X-CSE-ConnectionGUID: By/I076mTOak+2+E82WO4w==
X-CSE-MsgGUID: FbDzf9LGSOe1Eh/1MTRNhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="207391811"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Jan 2026 09:46:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk4Bv-00000000WJO-1HG7;
	Sun, 25 Jan 2026 17:46:27 +0000
Date: Mon, 26 Jan 2026 01:46:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1]
 arch/x86/xen/enlighten_pv.c:650:24: warning: no previous prototype for
 'xen_pv_evtchn_do_upcall'
Message-ID: <202601260110.sQgi67oi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Brian,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   5b3c238664a9e4ff294071a48ce7292e325e2be2
commit: 67d749f3e3516c7343ea6c7fdd38fd3dbfa05936 [1/1] x86/xen: Move Xen upcall handler
config: x86_64-randconfig-072-20260125 (https://download.01.org/0day-ci/archive/20260126/202601260110.sQgi67oi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601260110.sQgi67oi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601260110.sQgi67oi-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/x86/xen/enlighten_pv.c:650:24: warning: no previous prototype for 'xen_pv_evtchn_do_upcall' [-Wmissing-prototypes]
     650 | __visible noinstr void xen_pv_evtchn_do_upcall(struct pt_regs *regs)
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/xen/enlighten_pv.c:1301:34: warning: no previous prototype for 'xen_start_kernel' [-Wmissing-prototypes]
    1301 | asmlinkage __visible void __init xen_start_kernel(struct start_info *si)
         |                                  ^~~~~~~~~~~~~~~~


vim +/xen_pv_evtchn_do_upcall +650 arch/x86/xen/enlighten_pv.c

   649	
 > 650	__visible noinstr void xen_pv_evtchn_do_upcall(struct pt_regs *regs)
   651	{
   652		irqentry_state_t state = irqentry_enter(regs);
   653		bool inhcall;
   654	
   655		instrumentation_begin();
   656		run_sysvec_on_irqstack_cond(__xen_pv_evtchn_do_upcall, regs);
   657	
   658		inhcall = get_and_clear_inhcall();
   659		if (inhcall && !WARN_ON_ONCE(state.exit_rcu)) {
   660			irqentry_exit_cond_resched();
   661			instrumentation_end();
   662			restore_inhcall(inhcall);
   663		} else {
   664			instrumentation_end();
   665			irqentry_exit(regs, state);
   666		}
   667	}
   668	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
