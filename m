Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71C91AF0B7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 23:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744675104; cv=none; b=uVnaPMhcCY9HmufgwA1JlpijjksZ/E6y1d4Tpcjn+ksgJQqvmj7xOShV9rkrSk0IxtWV0axg6UfCovb/ARTyTW7kuI4N8rFunaPPcu+xlb1ZgOUzWSjit0d0uOOnPNCFI6A3q61SnrscVIAL/qLLV2p59WLIcZKEm2xhlc1Mxj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744675104; c=relaxed/simple;
	bh=BW0PbT0sjPTfVUa4WDBSAxAwLwNML+vHejkTGyYgzlo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SDbChsEFasnqQESSdOxh3cTOePWOTeLKpvMSEIgSnWhFi8NriBLdaunjFr9lZeRjYrfXSS/UfgWtMW/w/HfpfdcKHnsZty5qN/Yi+akN0JUiN4zd/TD7RPrdUo0kMPEwwa8MAgqkxLO75azL1QwEQ6gb42FNpi8tvvDmHcsqBO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dsgf3rIA; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dsgf3rIA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744675102; x=1776211102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BW0PbT0sjPTfVUa4WDBSAxAwLwNML+vHejkTGyYgzlo=;
  b=Dsgf3rIAlPDB3kpA9+dMDPD9O2FM6nh3Pt66evxtT5/V/cIF2kDIFvSo
   FZPb5/7xPzexetIM1GHP0FtqzQkleIkN1BpMv1EP5i32nOe2IEjg/Am9T
   S6hGIpmKhl0sdqA4tAKYPo8tXVgVU6sIcIcnHEK2cxufW/Y5AB+coHYWn
   jysGgsGbaa2vj0ynat+JsdHOW1tN1yk/TE9NyBxivnYjs6S8ErOJ0edds
   7FXA6RtnjK0VgFzvtr5Y9LPvgUn+M3TaToBG3D9l8mrtSSa0oYhUWq1PR
   yg0lapYUHKNaWWm4S2uWHjwPU5UIndwSUfg9G8j0joYyGJJXwpjL+fQTi
   A==;
X-CSE-ConnectionGUID: hq88IqxBSXScEpTYbH19Jg==
X-CSE-MsgGUID: 0FILZPsUQcukHSryAMiiFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57527819"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="57527819"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 16:58:22 -0700
X-CSE-ConnectionGUID: JXe5mywlR/SEgUrVAv3Oyg==
X-CSE-MsgGUID: t4UI+0nMQQSGfmVYbkgnQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="129958598"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Apr 2025 16:58:21 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4Tgx-000EqI-0X;
	Mon, 14 Apr 2025 23:58:19 +0000
Date: Tue, 15 Apr 2025 07:57:35 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:gourry_vmscan_cpuset 2/2]
 include/linux/cpuset.h:287:13: error: static declaration of
 'cgroup_node_allowed' follows non-static declaration
Message-ID: <202504150727.hPWwfq2k-lkp@intel.com>
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
config: csky-randconfig-002-20250415 (https://download.01.org/0day-ci/archive/20250415/202504150727.hPWwfq2k-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504150727.hPWwfq2k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504150727.hPWwfq2k-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from init/main.c:52:
>> include/linux/cpuset.h:287:13: error: static declaration of 'cgroup_node_allowed' follows non-static declaration
     287 | static bool cgroup_node_allowed(struct cgroup *cgroup, int nid)
         |             ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/perf_event.h:60,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from init/main.c:21:
   include/linux/cgroup.h:636:13: note: previous declaration of 'cgroup_node_allowed' with type 'bool(struct cgroup *, int)' {aka '_Bool(struct cgroup *, int)'}
     636 | extern bool cgroup_node_allowed(struct cgroup *cgroup, int nid);
         |             ^~~~~~~~~~~~~~~~~~~
   include/linux/cpuset.h:287:13: warning: 'cgroup_node_allowed' defined but not used [-Wunused-function]
     287 | static bool cgroup_node_allowed(struct cgroup *cgroup, int nid)
         |             ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/sched/isolation.h:5,
                    from kernel/time/hrtimer.c:41:
>> include/linux/cpuset.h:287:13: error: static declaration of 'cgroup_node_allowed' follows non-static declaration
     287 | static bool cgroup_node_allowed(struct cgroup *cgroup, int nid)
         |             ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/perf_event.h:60,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from kernel/time/hrtimer.c:30:
   include/linux/cgroup.h:636:13: note: previous declaration of 'cgroup_node_allowed' with type 'bool(struct cgroup *, int)' {aka '_Bool(struct cgroup *, int)'}
     636 | extern bool cgroup_node_allowed(struct cgroup *cgroup, int nid);
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
