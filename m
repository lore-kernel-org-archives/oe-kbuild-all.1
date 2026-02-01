Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC98219E8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 17:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769967063; cv=none; b=AbRNylbiGKPVBALLcy/iumqtGNhA517UIhpgNyhF95Vo6Es5+OVgg5uo2RpTaBI6T3VllrCGpNX9tVkNlLxl7lI+rkjI7b5KPoZ+hIWFmmUDfeEm53HGTscJb0hnOmIrNdvi5RELOnMigj3+eHMwnZ1pwf1MQlzyQrIWfES+hCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769967063; c=relaxed/simple;
	bh=6Gu2XRIpxuqXZGljNd5Xs6EthEzwNJ1PFwsWmps9cV4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gecLfYq4sY5CgTni+tAc1riDxxRKXlzJdOe/avLi6sg66KJ7eVMw66jdlJNGJSBQws0dzM2pdOaW9a0wM1MPC9TJ4iklRxuYUSkyBTdd4oOgx/b8YZdK8Gg2clmbfneTU/X0SySxX0Og+reS0VIub5G3tAVakBkfKrwbFXffq/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPr5mZRZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPr5mZRZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769967060; x=1801503060;
  h=date:from:to:cc:subject:message-id;
  bh=6Gu2XRIpxuqXZGljNd5Xs6EthEzwNJ1PFwsWmps9cV4=;
  b=lPr5mZRZQef22zeDlBSvAs7ORyEPpW53vVCVQ3ZO7fRwd5tFzTBe7Kig
   scWD51gB7uujnx30AeHg2G8BJX+OnKv+/eeQxrWVTUVwrRbevygg3nGu8
   TtLCsFHX8AagqLi+oT2agtPKnvw4c+q0Q5CF5IMJgAvFNpiODdcCEPsET
   Ea5u/vGWkVkN/oVfuMuuAf1wfvj7KJ1z0eWd7w0cODAE3Ia+QeCnQCaJG
   rg47vlYozrYdRogf1w9LE2OK57KeADAYBpq0NPHQZ5608xs6NXZp4a9yl
   DUdpOmXwT9VeGHHsJWmzIBwGgUt5WNAwYCIuIrWW2+0t6CSmKjL2ZSFKV
   Q==;
X-CSE-ConnectionGUID: 8wptX/vpQQa0fXzODcjw2g==
X-CSE-MsgGUID: Bz78qH1ERyG0gXUkN8aESQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="73744119"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="73744119"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 09:30:59 -0800
X-CSE-ConnectionGUID: 6hWVKUx7SOm266NJMSpQYw==
X-CSE-MsgGUID: tRSEuNLOS6CHQm685jTB3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="209101661"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Feb 2026 09:30:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmbHj-00000000eto-2Lw7;
	Sun, 01 Feb 2026 17:30:55 +0000
Date: Mon, 02 Feb 2026 01:30:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: 
 [koverstreet-bcachefs:bcachefs-blocked-with-btree-locks-held-tracepoint
 275/275] kernel/sched/core.c:7068:undefined reference to
 `bch2_account_sched_blocked'
Message-ID: <202602020127.UlTTuw9Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-blocked-with-btree-locks-held-tracepoint
head:   94ba7c5d7e09077951eecaa667e9a9307337a7c7
commit: 94ba7c5d7e09077951eecaa667e9a9307337a7c7 [275/275] BCH_SB_COUNTER_blocked_with_btree_locks_held
config: sh-randconfig-001-20260201 (https://download.01.org/0day-ci/archive/20260202/202602020127.UlTTuw9Y-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602020127.UlTTuw9Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602020127.UlTTuw9Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: kernel/sched/core.o: in function `schedule':
>> kernel/sched/core.c:7068:(.sched.text+0xa5c): undefined reference to `bch2_account_sched_blocked'


vim +7068 kernel/sched/core.c

6b596e62ed9f90 kernel/sched/core.c Peter Zijlstra  2023-09-08  7057  
94ba7c5d7e0907 kernel/sched/core.c Kent Overstreet 2026-01-19  7058  	bool running = task_is_running(tsk);
94ba7c5d7e0907 kernel/sched/core.c Kent Overstreet 2026-01-19  7059  	u64 start_time;
94ba7c5d7e0907 kernel/sched/core.c Kent Overstreet 2026-01-19  7060  	if (!running) {
de1474b46d889e kernel/sched/core.c Thomas Gleixner 2023-09-08  7061  		sched_submit_work(tsk);
94ba7c5d7e0907 kernel/sched/core.c Kent Overstreet 2026-01-19  7062  		start_time = ktime_get_ns();
94ba7c5d7e0907 kernel/sched/core.c Kent Overstreet 2026-01-19  7063  	}
de1474b46d889e kernel/sched/core.c Thomas Gleixner 2023-09-08  7064  	__schedule_loop(SM_NONE);
6d25be5782e482 kernel/sched/core.c Thomas Gleixner 2019-03-13  7065  	sched_update_worker(tsk);
94ba7c5d7e0907 kernel/sched/core.c Kent Overstreet 2026-01-19  7066  	if (!running)
94ba7c5d7e0907 kernel/sched/core.c Kent Overstreet 2026-01-19  7067  		bch2_account_sched_blocked(start_time);
c259e01a1ec900 kernel/sched.c      Thomas Gleixner 2011-06-22 @7068  }
^1da177e4c3f41 kernel/sched.c      Linus Torvalds  2005-04-16  7069  EXPORT_SYMBOL(schedule);
^1da177e4c3f41 kernel/sched.c      Linus Torvalds  2005-04-16  7070  

:::::: The code at line 7068 was first introduced by commit
:::::: c259e01a1ec90063042f758e409cd26b2a0963c8 sched: Separate the scheduler entry for preemption

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
