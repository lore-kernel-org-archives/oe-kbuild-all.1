Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093722ED161
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 12:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762258295; cv=none; b=GDSOpoHFRMQ5sVfP87N5PpnhEF6ql2z200MY2Hm/ZCfssoPJNXZBSfsrskwnGa5wBDyleRaER4aWOhE+jFHFQGK+Ug4LDbPVCJELQ8ZdzpvYJNIMF60u1zxwkL9N/REOjrmEkUcdJF+iSWRnuLqVTvF7GIpcunVFfTyj5LtvZQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762258295; c=relaxed/simple;
	bh=JaaSNoaAbNSBYN7QTFacrygZ9xFjMNzqwp8i4/2uS/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CeviXY4qJDudMjMrIjfp5xkMOxsfUapgQDQo0KqCz4m1X0y4GyBM651IR0geuowFxrQKxzMGzNo1lZU/zCI8Ihkauyyfw71xgAyOI4WBzmJLat+v0al0wscKHskWhEM3AjtMXbXSaaT0G6fOasbpow54jCTtcsR0XpO7GJlv4i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/OkqJj1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/OkqJj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762258294; x=1793794294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JaaSNoaAbNSBYN7QTFacrygZ9xFjMNzqwp8i4/2uS/I=;
  b=i/OkqJj1XbV9xPywfCoLnXelhIs/7EtzrO3Hby1gUrXcVgff+NXI2jAO
   C/FOshGkvbVAISQetBod8O8hKDu4IEA8XPI/mP7zBN5iAJoFJxz4a5E5o
   NKIf2GVRfX2SOKqc+TwD64nre303SKI/P9iyVqWgfldCdsWPEuyd8w6KH
   TUOqgr165b1uZxulmmkiYp5WMA/zn1vIgHKfuWqOV4D+0zpT91qhb+T4g
   5Ny3RLrtPkVvnFCxSKNfaLaV8tpoPEfD1QzvxeHDQR4MjUSkeG5YboUUX
   Nch8KT+b7docmMa0wQScMPOays0nlKgI3AjZPX7T3BMu1PHkyOqyQnb8+
   w==;
X-CSE-ConnectionGUID: DYubcDvKSTinv7sx83deCA==
X-CSE-MsgGUID: GysJ5AJTTJmdfb8FHfK/+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64267075"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="64267075"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 04:11:32 -0800
X-CSE-ConnectionGUID: yXBhOsXMSuCsMy+9ce6urA==
X-CSE-MsgGUID: AWovDs2XTi65q/SzL4gWVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="186831459"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2025 04:11:31 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGFsm-000RNU-1l;
	Tue, 04 Nov 2025 12:11:28 +0000
Date: Tue, 4 Nov 2025 20:09:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] kernel/bpf-rvi/common_kfuncs.c:24:35:
 warning: no previous prototype for 'bpf_task_active_pid_ns'
Message-ID: <202511042031.XJbcBnUd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   25097b0e8b7a08363a1cba931a5762548a3b0e16
commit: ef015dbb4151c10d0415045f9d0fcf3dc85063d7 [3098/3098] bpf-rvi: pidns: Add for_each_task_in_pidns and loadavg-related kfuncs
config: x86_64-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251104/202511042031.XJbcBnUd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511042031.XJbcBnUd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511042031.XJbcBnUd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf-rvi/common_kfuncs.c:15:32: warning: no previous prototype for 'bpf_mem_cgroup_from_task' [-Wmissing-prototypes]
      15 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:24:35: warning: no previous prototype for 'bpf_task_active_pid_ns' [-Wmissing-prototypes]
      24 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:29:17: warning: no previous prototype for 'bpf_pidns_nr_tasks' [-Wmissing-prototypes]
      29 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:43:17: warning: no previous prototype for 'bpf_pidns_last_pid' [-Wmissing-prototypes]
      43 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~


vim +/bpf_task_active_pid_ns +24 kernel/bpf-rvi/common_kfuncs.c

    19	
    20	/*
    21	 * Loadavg related kfuncs
    22	 */
    23	
  > 24	__bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
    25	{
    26		return task_active_pid_ns(task);
    27	}
    28	
  > 29	__bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
    30	{
    31		struct pid_iter iter = {};
    32		u32 nr_running = 0, nr_threads = 0;
    33	
    34		for_each_task_in_pidns(iter, ns) {
    35			nr_threads++;
    36			if (task_is_running(iter.task))
    37				nr_running++;
    38		}
    39	
    40		return (u64)nr_running << 32 | nr_threads;
    41	}
    42	
  > 43	__bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
    44	{
    45		return idr_get_cursor(&ns->idr) - 1;
    46	}
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
