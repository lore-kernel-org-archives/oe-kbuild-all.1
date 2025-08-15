Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C132BD028
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 02:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755223220; cv=none; b=oyT436G+MLUpLGQnWTb87vSanjQMGjAGNIC4rXWaWsUn7UHxbnI4/MUHtp/1QwS8zQlinpSx2C9ULXIZfWcMfAlFKrzXu2N+xQYp4XPrlTrEl1R6zBSSxKS5USfBgVM60I9cjRH22o7brn2VlQNX8lKvOut81gK0DuVCXk5CFnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755223220; c=relaxed/simple;
	bh=yHmnDYfn8PpmSQASc8q3BRQNYJFLGAps9b9ryipvVw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JO1dCZs9/Rh0qTeZKbM0QnZI137aYlu4GWwfFBMmU/R3HEu9o8jzibc4nd3+Z38Z+OHnliq4uCIniyFJ17X4UWcI58rla8vUObJJ8MmDq1G6nhXPPmKEM/4tb8clv3ApQSppsH69K2OXD0Y49/kExRTPBLxYKjt3BAicUEtgjGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GhHR1ABD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GhHR1ABD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755223218; x=1786759218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yHmnDYfn8PpmSQASc8q3BRQNYJFLGAps9b9ryipvVw8=;
  b=GhHR1ABDykxM8zA4TJrDjsAOB0h1R7sOMZbgCZYNvATemzi1xoi13F74
   HCRLUpEC+0TWIDPb/eeVeHqFrIfdCaLgWF+Ad2nsr/ahifl3xffWhl8qy
   I15/1z5unOnozdW1nV+vaGRLefN/c/PVGwu2IgmgEIVlWlDqmy98K+bgD
   gEebsaGtIyjDCAhh+gA6ucPjLsZQDFjONiV3QhEdxoAdkzU29/CNuA63l
   O/sj3k7oTziev69jkYWf5v/RvImhhjWQo5MgJrQrfCgFKAXg32DRWTsC2
   U7JbzLDtLyrieIVHNwjacI6tFOrjKIxc7lPy01Rw/3PLCOhYxAcZdDJhB
   A==;
X-CSE-ConnectionGUID: OuR3G5eVRd2lxRGFLg0tuw==
X-CSE-MsgGUID: ycoL0BjuR467GaJpRTfWNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57263754"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57263754"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 19:00:18 -0700
X-CSE-ConnectionGUID: qHQloCEeT0CgE2M+4YsLiQ==
X-CSE-MsgGUID: xf72RrIzSm6+3Blea4QYvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="197753067"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 14 Aug 2025 19:00:16 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umjjV-000BRU-2y;
	Fri, 15 Aug 2025 01:59:56 +0000
Date: Fri, 15 Aug 2025 09:59:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] fs/proc/stat.c:234:18: warning: no
 previous prototype for function 'bpf_show_all_irqs'
Message-ID: <202508150918.bmh8cyyk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   43d8c124ec4624389b14d42595e5f0195e3e5a1d
commit: 19895b9974c36318281e4e18131a2cfb43543ffd [2679/2679] bpf-rvi: Add stat-related misc kfuncs
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250815/202508150918.bmh8cyyk-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150918.bmh8cyyk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150918.bmh8cyyk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/proc/stat.c:224:17: warning: no previous prototype for function 'bpf_get_idle_time' [-Wmissing-prototypes]
     224 | __bpf_kfunc u64 bpf_get_idle_time(struct kernel_cpustat *kcs, int cpu)
         |                 ^
   fs/proc/stat.c:224:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     224 | __bpf_kfunc u64 bpf_get_idle_time(struct kernel_cpustat *kcs, int cpu)
         |             ^
         |             static 
   fs/proc/stat.c:229:17: warning: no previous prototype for function 'bpf_get_iowait_time' [-Wmissing-prototypes]
     229 | __bpf_kfunc u64 bpf_get_iowait_time(struct kernel_cpustat *kcs, int cpu)
         |                 ^
   fs/proc/stat.c:229:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     229 | __bpf_kfunc u64 bpf_get_iowait_time(struct kernel_cpustat *kcs, int cpu)
         |             ^
         |             static 
>> fs/proc/stat.c:234:18: warning: no previous prototype for function 'bpf_show_all_irqs' [-Wmissing-prototypes]
     234 | __bpf_kfunc void bpf_show_all_irqs(struct seq_file *p)
         |                  ^
   fs/proc/stat.c:234:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     234 | __bpf_kfunc void bpf_show_all_irqs(struct seq_file *p)
         |             ^
         |             static 
   3 warnings generated.
--
   kernel/bpf-rvi/common_kfuncs.c:24:32: warning: no previous prototype for function 'bpf_mem_cgroup_from_task' [-Wmissing-prototypes]
      24 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |                                ^
   kernel/bpf-rvi/common_kfuncs.c:24:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      24 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:33:35: warning: no previous prototype for function 'bpf_task_active_pid_ns' [-Wmissing-prototypes]
      33 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |                                   ^
   kernel/bpf-rvi/common_kfuncs.c:33:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      33 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:38:17: warning: no previous prototype for function 'bpf_pidns_nr_tasks' [-Wmissing-prototypes]
      38 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |                 ^
   kernel/bpf-rvi/common_kfuncs.c:38:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      38 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:52:17: warning: no previous prototype for function 'bpf_pidns_last_pid' [-Wmissing-prototypes]
      52 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |                 ^
   kernel/bpf-rvi/common_kfuncs.c:52:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      52 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:81:18: warning: no previous prototype for function 'bpf_si_memswinfo' [-Wmissing-prototypes]
      81 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |                  ^
   kernel/bpf-rvi/common_kfuncs.c:81:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      81 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:91:27: warning: no previous prototype for function 'bpf_page_counter_read' [-Wmissing-prototypes]
      91 | __bpf_kfunc unsigned long bpf_page_counter_read(struct page_counter *counter)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:91:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      91 | __bpf_kfunc unsigned long bpf_page_counter_read(struct page_counter *counter)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:101:18: warning: no previous prototype for function 'bpf_seq_file_append' [-Wmissing-prototypes]
     101 | __bpf_kfunc void bpf_seq_file_append(struct seq_file *dst, struct seq_file *src)
         |                  ^
   kernel/bpf-rvi/common_kfuncs.c:101:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     101 | __bpf_kfunc void bpf_seq_file_append(struct seq_file *dst, struct seq_file *src)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:115:18: warning: no previous prototype for function 'bpf_get_boottime_timens' [-Wmissing-prototypes]
     115 | __bpf_kfunc void bpf_get_boottime_timens(struct task_struct *tsk, struct timespec64 *boottime)
         |                  ^
   kernel/bpf-rvi/common_kfuncs.c:115:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     115 | __bpf_kfunc void bpf_get_boottime_timens(struct task_struct *tsk, struct timespec64 *boottime)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:121:27: warning: no previous prototype for function 'bpf_get_total_forks' [-Wmissing-prototypes]
     121 | __bpf_kfunc unsigned long bpf_get_total_forks(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:121:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     121 | __bpf_kfunc unsigned long bpf_get_total_forks(void)
         |             ^
         |             static 
   9 warnings generated.


vim +/bpf_show_all_irqs +234 fs/proc/stat.c

   233	
 > 234	__bpf_kfunc void bpf_show_all_irqs(struct seq_file *p)
   235	{
   236		show_all_irqs(p);
   237	}
   238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
