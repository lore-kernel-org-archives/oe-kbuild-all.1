Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F9D313538
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 16:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762272777; cv=none; b=g7nsCHb3Cn83Y+KPUXH8YIlZHlfJveLuBFNbblqzFbHooNCzPQZaHWT9k1W2tqB9I2gPkP20vt4on/HLqRyCIqUjhd07FpzXYh6G/4gtA/f0qyZoJSkt9f7zyWxrWpJ+bGyl8Jb/K/jexlaHYK3Z6T5vS1O1rQ+I65xl+SAnhRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762272777; c=relaxed/simple;
	bh=zCLNzgBimCUhwZCNh+EvXUIOv+H+ChmgBGXOaf+Nu0I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VffU0/TI6sfFB/D969T4KMe02VeJ1j4c1kiAB8/s5PjoLfDgofLrYwY2gZUOWuIEBPIoIzT5e3yiOS3iZChF/+rczkjbWK37nlc6uMzjwHurysUkVDIB4nFb/GzlhzUneK6P1SDX7f1xIjc4W0kCyiThMygI63rZ36Zc1U+yIFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WHgyLD7D; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WHgyLD7D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762272776; x=1793808776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zCLNzgBimCUhwZCNh+EvXUIOv+H+ChmgBGXOaf+Nu0I=;
  b=WHgyLD7DUXVv3SSs9Cxtsx1zl9dnmNewPDF+c8mgJ3p6Y2AKk3tc+a+i
   RJAefYPkGw/KebvvhJqEZUxmBcEjIQmxfREKpM2uyMbSr9FLXMtNU5OTE
   Gj3kcV1yOa86pDGUG5hINFeBqk4cK8sKjwywBjreQ1s6t5GJhGdOW8b6H
   hstL/nNC/FD/6xJySnVZwYemu24DOdc1HmRyEs48b+k54SWnTqfFMXB4W
   1TxS40RjxY3eHgRqDCjnNBwPqb2N+BbIIqjjtmzKbKjPEK+xNiTX6k8oL
   NU5gPAVvwb/KCz3DgW/1ZajKtYUoDkC0TucsZI8BGRc7WJgLCalAiLSgN
   w==;
X-CSE-ConnectionGUID: mhx/4NKpQB6oVTBKpq+vYA==
X-CSE-MsgGUID: iIPcYpnZRyqnncj+sugPig==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="87001470"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="87001470"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 08:12:55 -0800
X-CSE-ConnectionGUID: DT79ySJSQ2ao0un6uL9lPw==
X-CSE-MsgGUID: al1OePpVRyim/q01PvCAmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="192362113"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Nov 2025 08:12:54 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGJe9-000RaM-0y;
	Tue, 04 Nov 2025 16:12:38 +0000
Date: Wed, 5 Nov 2025 00:11:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] kernel/bpf-rvi/common_kfuncs.c:75:18:
 warning: no previous prototype for 'bpf_si_memswinfo'
Message-ID: <202511050050.0VfB10bw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   faa195bad3afed3c326917fb4cd36e0bd311220c
commit: b3aa368c1f9f8f3acee4703cfebb30e7a909df9f [3098/3098] bpf-rvi: Add bpf_si_memswinfo() kfunc
config: x86_64-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251105/202511050050.0VfB10bw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511050050.0VfB10bw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511050050.0VfB10bw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf-rvi/common_kfuncs.c:18:32: warning: no previous prototype for 'bpf_mem_cgroup_from_task' [-Wmissing-prototypes]
      18 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:27:35: warning: no previous prototype for 'bpf_task_active_pid_ns' [-Wmissing-prototypes]
      27 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:32:17: warning: no previous prototype for 'bpf_pidns_nr_tasks' [-Wmissing-prototypes]
      32 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:46:17: warning: no previous prototype for 'bpf_pidns_last_pid' [-Wmissing-prototypes]
      46 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:75:18: warning: no previous prototype for 'bpf_si_memswinfo' [-Wmissing-prototypes]
      75 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |                  ^~~~~~~~~~~~~~~~


vim +/bpf_si_memswinfo +75 kernel/bpf-rvi/common_kfuncs.c

    22	
    23	/*
    24	 * Loadavg related kfuncs
    25	 */
    26	
  > 27	__bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
    28	{
    29		return task_active_pid_ns(task);
    30	}
    31	
    32	__bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
    33	{
    34		struct pid_iter iter = {};
    35		u32 nr_running = 0, nr_threads = 0;
    36	
    37		for_each_task_in_pidns(iter, ns) {
    38			nr_threads++;
    39			if (task_is_running(iter.task))
    40				nr_running++;
    41		}
    42	
    43		return (u64)nr_running << 32 | nr_threads;
    44	}
    45	
    46	__bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
    47	{
    48		return idr_get_cursor(&ns->idr) - 1;
    49	}
    50	
    51	/*
    52	 * Swaps related kfuncs
    53	 */
    54	
    55	/*
    56	 * no padding member "_f" compared to struct sysinfo, because sizeof(_f)
    57	 * maybe zero and not supported by bpf_verifier.
    58	 */
    59	struct bpf_sysinfo {
    60		__kernel_long_t uptime;		/* Seconds since boot */
    61		__kernel_ulong_t loads[3];	/* 1, 5, and 15 minute load averages */
    62		__kernel_ulong_t totalram;	/* Total usable main memory size */
    63		__kernel_ulong_t freeram;	/* Available memory size */
    64		__kernel_ulong_t sharedram;	/* Amount of shared memory */
    65		__kernel_ulong_t bufferram;	/* Memory used by buffers */
    66		__kernel_ulong_t totalswap;	/* Total swap space size */
    67		__kernel_ulong_t freeswap;	/* swap space still available */
    68		__u16 procs;			/* Number of current processes */
    69		__u16 pad;			/* Explicit padding for m68k */
    70		__kernel_ulong_t totalhigh;	/* Total high memory size */
    71		__kernel_ulong_t freehigh;	/* Available high memory size */
    72		__u32 mem_unit;			/* Memory unit size in bytes */
    73	};
    74	
  > 75	__bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
    76	{
    77		struct sysinfo *si = (struct sysinfo *)bsi;
    78	
    79		if (si) {
    80			si_meminfo(si);
    81			si_swapinfo(si);
    82		}
    83	}
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
