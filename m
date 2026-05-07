Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED067302753
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778170520; cv=none; b=SNRtBMQHtC5f0MC31I8ejvxK29DyhrqJWk8eurmPax7JUMFzvihR2R6LKlBBcosep7wF9ebq+x4roz4CJ9YnmBC42dEq7gDBmUSOC9MY8uuGJEKqMSEQ7oWX6SUZ/CZcMhxjBczZdgpv67wjdCIf+UqBgjA7F+DJB27p0L3ki6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778170520; c=relaxed/simple;
	bh=ew5jNwEoZKG0q45tyW+7gEz5UWRIyVEcYiD6omVNneg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IXcTy0sc7jI8AP5YMIvFwpBwwK73FcLAV9iL6fUzNaQu7/jCVGSyiANf/xnN8tBWyxa5kEUCnukf4gOIkkJmr7xr6r+zG4wWAuHTu8YwOz6GpB90SXuMG9p+8fEqhJ+S83ZVsVOrLotgJDcWEON27B6heifbB20wcPKUQVGQ2cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UpeOeq1S; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UpeOeq1S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778170519; x=1809706519;
  h=date:from:to:cc:subject:message-id;
  bh=ew5jNwEoZKG0q45tyW+7gEz5UWRIyVEcYiD6omVNneg=;
  b=UpeOeq1SO+GaHJjAqWzStu8iIwaYHA6DZ1RX4DHWNWhkZNA5MKxSgnc+
   GW9mMQO4V6b2eIg+qh+MQ0fIzHslaET+nhHaKgYB2SlHt0dq0fcWsAQFC
   i4Ad15PLlxvlQlHTfLXtEvmjWoGV4KLCEzNV3+IvaLmmKCqnJcvcdDXun
   Ikz8y19tGOlsuAqU2/MU+zVCOwBlci/ZKZ5usk9rO6sPIorL/tnTgpXli
   m7Vw6l0ShHG9mgjCVE4IhOWscMynZyrdGn86Zq3gH6cWVFCSNxKAunVHS
   i++PSgEMNbwh4CG6+FnUD/mC0hRPve9OYxyg2wuD4aJb71NCA3Z78Ufgd
   Q==;
X-CSE-ConnectionGUID: k1GoOGenQ4GWLauDraNUiA==
X-CSE-MsgGUID: zMt7HuRDSTOSsRXdj+nDnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="82970376"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="82970376"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 09:15:18 -0700
X-CSE-ConnectionGUID: OVJ+9nVrR8y9EHbhOf4ToA==
X-CSE-MsgGUID: xDftUPkqSYW9AM2xNTQfrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="230110992"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 May 2026 09:15:17 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL1Na-000000000H7-3v1m;
	Thu, 07 May 2026 16:15:14 +0000
Date: Fri, 08 May 2026 00:14:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 102/102]
 arch/x86/xen/enlighten_pv.c:650:24: warning: no previous prototype for
 'xen_pv_evtchn_do_upcall'
Message-ID: <202605080053.o0vnoc3u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Brian,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   c494c8d0bcc1fb4a67f4e1a2c8d4c6cb0967a86d
commit: 67d749f3e3516c7343ea6c7fdd38fd3dbfa05936 [102/102] x86/xen: Move Xen upcall handler
config: x86_64-randconfig-072-20260507 (https://download.01.org/0day-ci/archive/20260508/202605080053.o0vnoc3u-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080053.o0vnoc3u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605080053.o0vnoc3u-lkp@intel.com/

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
