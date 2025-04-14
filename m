Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21C81DE3BB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 23:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744673181; cv=none; b=ibUkV6FVKZEAHdiCZpNt6oJNnJdQrIMt7tC968vsgcWV9OuXtr5ZYjQk5MtuEj72W8OQ2AzLVVBx8pWFLAp8UUH0JEdhsIODJ+r2wUkO2BHcMqBFePorCTiBW7etreKpo+QzLR5oWYr/04PrP5C7/0TyI50XoANtV4NhB0QsBzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744673181; c=relaxed/simple;
	bh=rJkMB1mHAPJH5ZrE13Qop7OyA0LvAmMYK4SBz6cBUdU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VGgfNB1+XknEYB5HUnPhaHwysyUPKu8FNsgB5dfhy2AimorJR7c+0WKgHa7AM9KUwD9/PsHWYg/Z4Qpcw/H8V7cD/ZOty6gx8dqJMFFKcT6sQ//mEmNEen8dpcWDIyRUDZbBAwHQOHIPwuzNNZ3LiGjGuTyUNZ34LkWV80pnhlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=doEBQTaA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="doEBQTaA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744673180; x=1776209180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rJkMB1mHAPJH5ZrE13Qop7OyA0LvAmMYK4SBz6cBUdU=;
  b=doEBQTaACGq5Bi253OoDPL0fgzQjAQnZ1bvfzVNYsdgXSnR7r5T/l9+Z
   hTs23qKgwWSC8O+gcWc/r+mBjS+zAZ5njTWxgEupBzjR8qoRy21BnkcrK
   MjpQ1qnosZBkN8frP0F3Vn1SnoJ9xbZcXsCK3JubFdvXnm7Wn9ANZ4zLR
   Tw/fob9Znl0GopDpJLikXG/C2kgiGz4A7lMkC6F+Qm7t+oRyZNhMEGJGa
   E8dDfxIm70HM58lbUlesrHedkGTNuGzVaU61igZuQbNzvxUSJsg66h9DG
   bs2hCJeSBrMZarbRHQcnlOIKDW4EFfvZH6f99xLZuHZj6xEyITEK9eJoA
   A==;
X-CSE-ConnectionGUID: Z1Q0k3aLQUWlbBE9xM30+w==
X-CSE-MsgGUID: I5WadZKbRNSW4Lx+Y7/Dlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45294719"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="45294719"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 16:26:19 -0700
X-CSE-ConnectionGUID: KOVnyFfsQuOgyLu1EzfI9A==
X-CSE-MsgGUID: bV2GYFteQl+iPls3pr7D2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="134047961"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Apr 2025 16:26:18 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4TBw-000Eos-0Z;
	Mon, 14 Apr 2025 23:26:16 +0000
Date: Tue, 15 Apr 2025 07:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:gourry_vmscan_cpuset 2/2]
 include/linux/cpuset.h:287:13: error: redefinition of 'cgroup_node_allowed'
Message-ID: <202504150758.iyp02ENg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux gourry_vmscan_cpuset
head:   ab956ee2656aac6dedd7e2a834a77683dab7b686
commit: ab956ee2656aac6dedd7e2a834a77683dab7b686 [2/2] vmscan,cgroup: apply mems_effective to reclaim
config: csky-randconfig-001-20250415 (https://download.01.org/0day-ci/archive/20250415/202504150758.iyp02ENg-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504150758.iyp02ENg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504150758.iyp02ENg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/memcontrol.h:13,
                    from include/linux/resume_user_mode.h:8,
                    from kernel/task_work.c:5:
>> include/linux/cgroup.h:687:13: warning: 'cgroup_node_allowed' defined but not used [-Wunused-function]
     687 | static bool cgroup_node_allowed(struct cgroup *cgroup, int nid) { return true; }
         |             ^~~~~~~~~~~~~~~~~~~
--
   In file included from kernel/kthread.c:20:
>> include/linux/cpuset.h:287:13: error: redefinition of 'cgroup_node_allowed'
     287 | static bool cgroup_node_allowed(struct cgroup *cgroup, int nid)
         |             ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/kthread.c:19:
   include/linux/cgroup.h:687:13: note: previous definition of 'cgroup_node_allowed' with type 'bool(struct cgroup *, int)' {aka '_Bool(struct cgroup *, int)'}
     687 | static bool cgroup_node_allowed(struct cgroup *cgroup, int nid) { return true; }
         |             ^~~~~~~~~~~~~~~~~~~
   include/linux/cpuset.h:287:13: warning: 'cgroup_node_allowed' defined but not used [-Wunused-function]
     287 | static bool cgroup_node_allowed(struct cgroup *cgroup, int nid)
         |             ^~~~~~~~~~~~~~~~~~~
>> include/linux/cgroup.h:687:13: warning: 'cgroup_node_allowed' defined but not used [-Wunused-function]
     687 | static bool cgroup_node_allowed(struct cgroup *cgroup, int nid) { return true; }
         |             ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from kernel/cpu.c:27:
>> include/linux/cgroup.h:687:13: error: redefinition of 'cgroup_node_allowed'
     687 | static bool cgroup_node_allowed(struct cgroup *cgroup, int nid) { return true; }
         |             ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/sched/isolation.h:5,
                    from kernel/cpu.c:13:
   include/linux/cpuset.h:287:13: note: previous definition of 'cgroup_node_allowed' with type 'bool(struct cgroup *, int)' {aka '_Bool(struct cgroup *, int)'}
     287 | static bool cgroup_node_allowed(struct cgroup *cgroup, int nid)
         |             ^~~~~~~~~~~~~~~~~~~
>> include/linux/cgroup.h:687:13: warning: 'cgroup_node_allowed' defined but not used [-Wunused-function]
     687 | static bool cgroup_node_allowed(struct cgroup *cgroup, int nid) { return true; }
         |             ^~~~~~~~~~~~~~~~~~~
   include/linux/cpuset.h:287:13: warning: 'cgroup_node_allowed' defined but not used [-Wunused-function]
     287 | static bool cgroup_node_allowed(struct cgroup *cgroup, int nid)
         |             ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/sched/isolation.h:5,
                    from kernel/time/hrtimer.c:41:
>> include/linux/cpuset.h:287:13: error: redefinition of 'cgroup_node_allowed'
     287 | static bool cgroup_node_allowed(struct cgroup *cgroup, int nid)
         |             ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/perf_event.h:60,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from kernel/time/hrtimer.c:30:
   include/linux/cgroup.h:687:13: note: previous definition of 'cgroup_node_allowed' with type 'bool(struct cgroup *, int)' {aka '_Bool(struct cgroup *, int)'}
     687 | static bool cgroup_node_allowed(struct cgroup *cgroup, int nid) { return true; }
         |             ^~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:124:35: warning: initialized field overwritten [-Woverride-init]
     124 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:124:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:125:35: warning: initialized field overwritten [-Woverride-init]
     125 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:125:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:126:35: warning: initialized field overwritten [-Woverride-init]
     126 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:126:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:127:35: warning: initialized field overwritten [-Woverride-init]
     127 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:127:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')
   include/linux/cpuset.h:287:13: warning: 'cgroup_node_allowed' defined but not used [-Wunused-function]
     287 | static bool cgroup_node_allowed(struct cgroup *cgroup, int nid)
         |             ^~~~~~~~~~~~~~~~~~~
>> include/linux/cgroup.h:687:13: warning: 'cgroup_node_allowed' defined but not used [-Wunused-function]
     687 | static bool cgroup_node_allowed(struct cgroup *cgroup, int nid) { return true; }
         |             ^~~~~~~~~~~~~~~~~~~


vim +/cgroup_node_allowed +287 include/linux/cpuset.h

   286	
 > 287	static bool cgroup_node_allowed(struct cgroup *cgroup, int nid)
   288	{
   289		return true;
   290	}
   291	#endif /* !CONFIG_CPUSETS */
   292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
