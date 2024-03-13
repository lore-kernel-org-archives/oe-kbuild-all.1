Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21324446A2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 14:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710340915; cv=none; b=Gh2yu3UoAWgsngefvUEk8CId0P1oCMlg5acBHUbTl3bkAyDI4o0JaJqi7aCBvn05bogsGn3iICatmLX+kmZcZoHSU0uNnHefcnWwJgnRowGsihx+oQKO+YgsIWY8fX5QGoEVdUgk2FpIdDwfKObLDdeS8CKE8ywsYOTA5D+fyYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710340915; c=relaxed/simple;
	bh=qJdqnUPCOqJ6Nku5BCqwtgYGi1Hni1rNMWdl2EZFKZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sTycXrmfh2BmuHqpFlwUAs/MJtQ+KKULGDTVYNAxeoAADxID2+vCzZLkycJ4rzLvFaYTxJlXVY5aJnEDiA1sREVksaNmlqs9U4U+dfXDs8MqeDeuy6u6Sxm5WiOnzz4hxCR41JcXQ/xhuj7Kmuinmj8RFb/BmlsfR0qtu6f+hlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XnQNB6rN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XnQNB6rN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710340913; x=1741876913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qJdqnUPCOqJ6Nku5BCqwtgYGi1Hni1rNMWdl2EZFKZI=;
  b=XnQNB6rNOP4Oj00yFzbZDXOmALg20Q/a+iZgKCQkAVnuzgqQAHmOco0Y
   NJnX8D3wUivrmAfeMPDU73FJnelIdZ1w5fGQ92qQNrCG2LY9FRtnlNuut
   FZiWB0nxHDKQUQko3qg+ZgDPi2zH70acNSGPBYksCFD4Z8PlfZ8JPYuNb
   N9AtWnjsS4rTITF0IPVBJnUWt0mqe2frv59jDvEkecWx17h6G4K6e3DHC
   3MleVw37cZlm/3eNtdZZYG8+RtyYdiUZ1H5Z66m9H6j8YriP1dQL94EfJ
   0yJ8lJp8yM2HdutYiJ4PXb2Td9lNmyFon0Z5qddvTGAcsOPAaBU/+Z2TU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="30547537"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="30547537"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 07:41:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="35068606"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Mar 2024 07:41:51 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkPnh-000CRn-0r;
	Wed, 13 Mar 2024 14:41:49 +0000
Date: Wed, 13 Mar 2024 22:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.8/prjc 430/437] kernel/sched/alt_core.c:3677: warning:
 Function parameter or struct member 'prev' not described in
 'prepare_task_switch'
Message-ID: <202403132231.dHxHkq3o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.8/prjc
head:   8b12bef41c21a484fe111f5b19be0db54a6c03a5
commit: 006d2f6e8901cb12e15031f4c85cd512890ac058 [430/437] sched/alt: [Sync] 932562a6045e rseq: Split out rseq.h from sched.h
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240313/202403132231.dHxHkq3o-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403132231.dHxHkq3o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403132231.dHxHkq3o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:120: warning: cannot understand function prototype: 'int sched_yield_type __read_mostly = 1; '
>> kernel/sched/alt_core.c:3677: warning: Function parameter or struct member 'prev' not described in 'prepare_task_switch'
   kernel/sched/alt_core.c:3710: warning: Excess function parameter 'rq' description in 'finish_task_switch'
>> kernel/sched/alt_core.c:6005: warning: Function parameter or struct member 'flags' not described in 'sys_sched_setattr'
   kernel/sched/alt_core.c:6065: warning: expecting prototype for sys_sched_getscheduler(). Prototype was for sys_sched_getparam() instead


vim +3677 kernel/sched/alt_core.c

939dd28d6ee04a Alfred Chen 2021-02-04  3661  
ed2223e92daaf9 Alfred Chen 2019-08-19  3662  /**
ed2223e92daaf9 Alfred Chen 2019-08-19  3663   * prepare_task_switch - prepare to switch tasks
ed2223e92daaf9 Alfred Chen 2019-08-19  3664   * @rq: the runqueue preparing to switch
ed2223e92daaf9 Alfred Chen 2019-08-19  3665   * @next: the task we are going to switch to.
ed2223e92daaf9 Alfred Chen 2019-08-19  3666   *
ed2223e92daaf9 Alfred Chen 2019-08-19  3667   * This is called with the rq lock held and interrupts off. It must
ed2223e92daaf9 Alfred Chen 2019-08-19  3668   * be paired with a subsequent finish_task_switch after the context
ed2223e92daaf9 Alfred Chen 2019-08-19  3669   * switch.
ed2223e92daaf9 Alfred Chen 2019-08-19  3670   *
ed2223e92daaf9 Alfred Chen 2019-08-19  3671   * prepare_task_switch sets up locking and calls architecture specific
ed2223e92daaf9 Alfred Chen 2019-08-19  3672   * hooks.
ed2223e92daaf9 Alfred Chen 2019-08-19  3673   */
ed2223e92daaf9 Alfred Chen 2019-08-19  3674  static inline void
ed2223e92daaf9 Alfred Chen 2019-08-19  3675  prepare_task_switch(struct rq *rq, struct task_struct *prev,
ed2223e92daaf9 Alfred Chen 2019-08-19  3676  		    struct task_struct *next)
ed2223e92daaf9 Alfred Chen 2019-08-19 @3677  {
ed2223e92daaf9 Alfred Chen 2019-08-19  3678  	kcov_prepare_switch(prev);
ed2223e92daaf9 Alfred Chen 2019-08-19  3679  	sched_info_switch(rq, prev, next);
ed2223e92daaf9 Alfred Chen 2019-08-19  3680  	perf_event_task_sched_out(prev, next);
ed2223e92daaf9 Alfred Chen 2019-08-19  3681  	rseq_preempt(prev);
ed2223e92daaf9 Alfred Chen 2019-08-19  3682  	fire_sched_out_preempt_notifiers(prev, next);
939dd28d6ee04a Alfred Chen 2021-02-04  3683  	kmap_local_sched_out();
ed2223e92daaf9 Alfred Chen 2019-08-19  3684  	prepare_task(next);
ed2223e92daaf9 Alfred Chen 2019-08-19  3685  	prepare_arch_switch(next);
ed2223e92daaf9 Alfred Chen 2019-08-19  3686  }
ed2223e92daaf9 Alfred Chen 2019-08-19  3687  

:::::: The code at line 3677 was first introduced by commit
:::::: ed2223e92daaf9860b48206a01c6dde92f542ca6 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
