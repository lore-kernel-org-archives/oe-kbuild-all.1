Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708A033B962
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 18:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762280206; cv=none; b=f23AvK/mGFSE6zk6vEY86QuC5lPRq3/w+UAzrsv2hKNxlU4u8afA6aHKbFGmJM27Jim3KfU4mwQIZzXZSQQHx7Kz09qWP3BXAJ/MQJYyscS+ypWL6GzOIIBgekqEKu7I6d2tnp3idWuaq7luQ4SVQkX8lLPuKI2JqNlt39d8HPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762280206; c=relaxed/simple;
	bh=+R61w70SwanqCnQZLcLvG5OA0oiYtCVDQPwO9ntwUu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FK+K89tMGkkZpwgwB183G/OSgvkNmtBhS09IUQEk/rdmzopkuU/139NQEuoEd1DyWmtleFzIiZozr6dXtSYKiiI6jduZQSD9EYSGVY4M+bGogwll7z9qGHq0O0y2zSVqnvkeV4SdwMSJ1PK7yTdPP6J9OXh7NyK42mjMP3C+Ylo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X7CIvtgS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X7CIvtgS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762280205; x=1793816205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+R61w70SwanqCnQZLcLvG5OA0oiYtCVDQPwO9ntwUu0=;
  b=X7CIvtgS8F+/NZTihiOUBBbLV4EnpVCCRVjNrCg251lLmBZqRqXAIygQ
   SEXlaTOj1iNmFfHkHu+cpEdTkPhk+thRQYoW7eo71+7osob7+1MDAg3Ul
   ynHQSxLX6TdzUXXFhE2/skN6p7rVjz+p6M6jjZu0nwMwIc8DxoDuOxR7H
   oQlFhtEh7pMqnKM8dXpmJTLLZkwG4IRDasX/IBual1BZpw6T5ek2B5cxM
   z7izhZMa6N/1L+3ux18ZJ0A1+rs334YApSDbwkGxRL00WKIjOXaPL5qHk
   qTNZ1gaV1GEnBZy71ILML7+OtOaN10FQONu5m21QADhjKdxAYrG/hjzDe
   A==;
X-CSE-ConnectionGUID: 2TC4SjGJQKCVGwp1W3JuRA==
X-CSE-MsgGUID: p0atpyAkSfebxhnqMkqTWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="74677444"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="74677444"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 10:16:44 -0800
X-CSE-ConnectionGUID: Pe9s3VRXSy+zUFOijBb5QA==
X-CSE-MsgGUID: j4Umd1jrRtqcP+tLli5qYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="191527152"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 04 Nov 2025 10:16:42 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGLaC-000RjK-1Y;
	Tue, 04 Nov 2025 18:16:40 +0000
Date: Wed, 5 Nov 2025 02:16:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] kernel/bpf-rvi/common_kfuncs.c:86:27:
 warning: no previous prototype for 'bpf_page_counter_read'
Message-ID: <202511050235.5PdxK5fh-lkp@intel.com>
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
commit: 5e4cec4acb12a17b26d4d2ae4c29eb29b017f854 [3098/3098] bpf-rvi: Add bpf_page_counter_read() kfunc
config: x86_64-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251105/202511050235.5PdxK5fh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511050235.5PdxK5fh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511050235.5PdxK5fh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf-rvi/common_kfuncs.c:19:32: warning: no previous prototype for 'bpf_mem_cgroup_from_task' [-Wmissing-prototypes]
      19 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:28:35: warning: no previous prototype for 'bpf_task_active_pid_ns' [-Wmissing-prototypes]
      28 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:33:17: warning: no previous prototype for 'bpf_pidns_nr_tasks' [-Wmissing-prototypes]
      33 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:47:17: warning: no previous prototype for 'bpf_pidns_last_pid' [-Wmissing-prototypes]
      47 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:76:18: warning: no previous prototype for 'bpf_si_memswinfo' [-Wmissing-prototypes]
      76 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |                  ^~~~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:86:27: warning: no previous prototype for 'bpf_page_counter_read' [-Wmissing-prototypes]
      86 | __bpf_kfunc unsigned long bpf_page_counter_read(struct page_counter *counter)
         |                           ^~~~~~~~~~~~~~~~~~~~~


vim +/bpf_page_counter_read +86 kernel/bpf-rvi/common_kfuncs.c

    32	
  > 33	__bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
    34	{
    35		struct pid_iter iter = {};
    36		u32 nr_running = 0, nr_threads = 0;
    37	
    38		for_each_task_in_pidns(iter, ns) {
    39			nr_threads++;
    40			if (task_is_running(iter.task))
    41				nr_running++;
    42		}
    43	
    44		return (u64)nr_running << 32 | nr_threads;
    45	}
    46	
    47	__bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
    48	{
    49		return idr_get_cursor(&ns->idr) - 1;
    50	}
    51	
    52	/*
    53	 * Swaps related kfuncs
    54	 */
    55	
    56	/*
    57	 * no padding member "_f" compared to struct sysinfo, because sizeof(_f)
    58	 * maybe zero and not supported by bpf_verifier.
    59	 */
    60	struct bpf_sysinfo {
    61		__kernel_long_t uptime;		/* Seconds since boot */
    62		__kernel_ulong_t loads[3];	/* 1, 5, and 15 minute load averages */
    63		__kernel_ulong_t totalram;	/* Total usable main memory size */
    64		__kernel_ulong_t freeram;	/* Available memory size */
    65		__kernel_ulong_t sharedram;	/* Amount of shared memory */
    66		__kernel_ulong_t bufferram;	/* Memory used by buffers */
    67		__kernel_ulong_t totalswap;	/* Total swap space size */
    68		__kernel_ulong_t freeswap;	/* swap space still available */
    69		__u16 procs;			/* Number of current processes */
    70		__u16 pad;			/* Explicit padding for m68k */
    71		__kernel_ulong_t totalhigh;	/* Total high memory size */
    72		__kernel_ulong_t freehigh;	/* Available high memory size */
    73		__u32 mem_unit;			/* Memory unit size in bytes */
    74	};
    75	
    76	__bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
    77	{
    78		struct sysinfo *si = (struct sysinfo *)bsi;
    79	
    80		if (si) {
    81			si_meminfo(si);
    82			si_swapinfo(si);
    83		}
    84	}
    85	
  > 86	__bpf_kfunc unsigned long bpf_page_counter_read(struct page_counter *counter)
    87	{
    88		return page_counter_read(counter);
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
