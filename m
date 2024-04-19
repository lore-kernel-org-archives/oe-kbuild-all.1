Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CEF3EA8C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 08:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713514985; cv=none; b=kGsYc6fCZl8mYNUsLTRqVbDLr1V8ZJX5bGLssmgG8jroT5D16/0Bmbjp0R/jWz6PB7nW/LgxSGVV0etJ+GCBWN2Mu9jNTXxN7kN37xerP7todh0RqXwP4UGgqu6FloEYA/9yom7E+SLt9gUlU44dR4WASSH2N87goWU0XWt+c8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713514985; c=relaxed/simple;
	bh=2tseSmuaMBcd9YmLQqpYUgoXA/iUc6ecEU2rhP3TBKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lNIjPDL0SBpacigG/D8AjvzQBE1PlLQcnU/weRCTTuTXFO/0NKcj3r/hZHamzNi1Wl1fnCToLfX8nhpNZRgjAEFuaDJdOkEv9viFNnCKXfNtqZHKahOE3+sfolHF7qL1M7qUjayWDlPtQekP3HRQED4+h96M+Kq4lQuclWY4BzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEG42pPJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEG42pPJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713514985; x=1745050985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2tseSmuaMBcd9YmLQqpYUgoXA/iUc6ecEU2rhP3TBKc=;
  b=YEG42pPJh7ZKk3o3sZq+Ux9IsRr4N9g2uLC2qfHw6HzXr3nuXle03PYN
   VepWO4ISywxWuc053cQuXUdttoAkNBzS0cm5hFG4pdPtCnQmtMBicAlFn
   L6nxBNDXEjlO1g3BVDQa6ahPBMkC6Jrxa2ACehscXVAHWJkbx3T+giEZJ
   Is8KSt/M0kEVm5S1h5B6ZLlBZ2fUMBk+op296SJrbuskpIjdJy6DRLBAB
   b4WbBB6aD1oNoX65WT96R+IevgTI4h+JYdtXSgduQ8GssPH8NYt6xQBnY
   fJgpaYIaneuV3JIePoPaEkiJIFfo2pgaonl8qmP6SlyJq2h6epR6l9c3H
   Q==;
X-CSE-ConnectionGUID: aSNvaorfT1OmprdrBAr+cg==
X-CSE-MsgGUID: qjOzXvHvT9iDXTbJf2uInw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="19802668"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="19802668"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 01:22:59 -0700
X-CSE-ConnectionGUID: gP8TAh7KS6aVe9WzGZX0Ug==
X-CSE-MsgGUID: zIwJzCniR0GbpFZL4B83Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23772137"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 19 Apr 2024 01:22:58 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxjWJ-0009sm-1L;
	Fri, 19 Apr 2024 08:22:55 +0000
Date: Fri, 19 Apr 2024 16:22:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/dlserver.update_h_nr 1/1] kernel/sched/fair.c:5830:13:
 warning: conflicting types for 'update_h_nr_running'
Message-ID: <202404191626.lIcJ0YDM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/dlserver.update_h_nr
head:   4e843586ff1b3b77e5244d0128facac6330490a4
commit: 4e843586ff1b3b77e5244d0128facac6330490a4 [1/1] Prototype: Update h_nr_running from single place to stop/start dl server
config: i386-buildonly-randconfig-002-20240419 (https://download.01.org/0day-ci/archive/20240419/202404191626.lIcJ0YDM-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404191626.lIcJ0YDM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404191626.lIcJ0YDM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'update_curr_se':
   kernel/sched/fair.c:845:28: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
     845 |   struct sched_statistics *stats;
         |                            ^~~~~
   kernel/sched/fair.c: In function 'update_stats_wait_start':
   kernel/sched/fair.c:922:27: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
     922 |  struct sched_statistics *stats;
         |                           ^~~~~
   kernel/sched/fair.c: In function 'update_stats_wait_end':
   kernel/sched/fair.c:942:27: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
     942 |  struct sched_statistics *stats;
         |                           ^~~~~
   kernel/sched/fair.c: In function 'update_stats_enqueue_sleeper':
   kernel/sched/fair.c:986:27: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
     986 |  struct sched_statistics *stats;
         |                           ^~~~~
   kernel/sched/fair.c: In function 'set_next_entity':
   kernel/sched/fair.c:4742:28: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
    4742 |   struct sched_statistics *stats;
         |                            ^~~~~
   kernel/sched/fair.c: In function 'throttle_cfs_rq':
   kernel/sched/fair.c:5119:3: error: implicit declaration of function 'update_h_nr_running' [-Werror=implicit-function-declaration]
    5119 |   update_h_nr_running(qcfs_rq, -1 * task_delta);
         |   ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: At top level:
>> kernel/sched/fair.c:5830:13: warning: conflicting types for 'update_h_nr_running'
    5830 | static void update_h_nr_running(struct cfs_rq *cfs_rq, int delta)
         |             ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5830:13: error: static declaration of 'update_h_nr_running' follows non-static declaration
   kernel/sched/fair.c:5119:3: note: previous implicit declaration of 'update_h_nr_running' was here
    5119 |   update_h_nr_running(qcfs_rq, -1 * task_delta);
         |   ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/update_h_nr_running +5830 kernel/sched/fair.c

  5829	
> 5830	static void update_h_nr_running(struct cfs_rq *cfs_rq, int delta)
  5831	{
  5832		int old_h_nr_running, new_h_nr_running;
  5833		bool root = (&rq_of(cfs_rq)->cfs == cfs_rq);
  5834		
  5835		if (root) {
  5836			old_h_nr_running = cfs_rq->h_nr_running;
  5837		}
  5838	
  5839		new_h_nr_running = cfs_rq->h_nr_running + delta;
  5840		cfs_rq->h_nr_running = new_h_nr_running;
  5841		
  5842		if (root && !!old_h_nr_running != !!new_h_nr_running) {
  5843			if (new_h_nr_running) {
  5844				dl_server_start(&rq_of(cfs_rq)->fair_server);
  5845			} else {
  5846				dl_server_stop(&rq_of(cfs_rq)->fair_server);
  5847			}
  5848		}
  5849	}
  5850	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
