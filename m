Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0933FF9EC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 22:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762294427; cv=none; b=AxD3JmDbj28lJOws3HRHRCwFELN4YlMgcAAW2fWDOQpri6j49y6+Xi4IDh24S3DNR+u+icwNmnCBy2yyQAhR2l54A7hbFHxIw/bU8G7V2e+fXHufA3ZRNnYFRwnWTEhN0pDnp/ybczm1xZCyWiDwdr+S8CZ8b3uO5Q7ghKOqZNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762294427; c=relaxed/simple;
	bh=uom/tbvyKmM1N2USgF9ZMLv2Zr7GNzLdQPwuh53YBx4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E2k0Xno0n7ZYCF7iVJs1r16MUXAEBEoVkAaYFQy8EhwInxhQO6yGEqj1jpO+L8E1AtZmiGG09JrfD97WAteNkk2fuzTYhkzXFs+t5kV5gN1EKHtbeOJXsIYhyzK0WwB0LgG5YYGBcwUKEidKNR2ZlJ5tgqABV17mXfGBGWsLRM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wj0BfVh4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wj0BfVh4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762294425; x=1793830425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uom/tbvyKmM1N2USgF9ZMLv2Zr7GNzLdQPwuh53YBx4=;
  b=Wj0BfVh4Nh1uOXhw2v08oAB6WEHiJpi89iV4GNuKUMFdOyiUCw6QwOHW
   uHao8/0iNpazWwdVSsNUnsk+QNGi7zMeRnkqnkcoLggAb+hJUTyZzBLHr
   hswAzMdPuI9g2K6nw6yg6Oaf5x1M1HfFgZ5SU6PRPQtCMYKM/lNdeV1w8
   r/IkEhfBt3aG4yQCVQr0vbpcaE5CpBSj1TZ8r8KBECrHluGv0eL0UeMUh
   kWe22iyJuMUA55VojcRqqUIHzlcluAS1yfCI7zigDdm3golbmDFPItMgf
   B2Y37flR4lWoC4OWSLwvRsnO5TjiV96vwr1mb6+282GdLHoEci2lBxL5j
   g==;
X-CSE-ConnectionGUID: 1W6TbJ04QtuGuzk/JuewzQ==
X-CSE-MsgGUID: YU+wIrC0QOmfD9od6g50PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64500012"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="64500012"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 14:13:44 -0800
X-CSE-ConnectionGUID: kPwXbXYiSy2D5TWMrq4DUw==
X-CSE-MsgGUID: aGfDz8gzRZiqzzoy+WY+6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="187431134"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Nov 2025 14:13:43 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGPHY-000Rrw-2o;
	Tue, 04 Nov 2025 22:13:40 +0000
Date: Wed, 5 Nov 2025 06:13:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] fs/proc/stat.c:234:18: warning: no
 previous prototype for 'bpf_show_all_irqs'
Message-ID: <202511050607.O3tCEeVJ-lkp@intel.com>
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
commit: 19895b9974c36318281e4e18131a2cfb43543ffd [3098/3098] bpf-rvi: Add stat-related misc kfuncs
config: x86_64-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251105/202511050607.O3tCEeVJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511050607.O3tCEeVJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511050607.O3tCEeVJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/proc/stat.c:224:17: warning: no previous prototype for 'bpf_get_idle_time' [-Wmissing-prototypes]
     224 | __bpf_kfunc u64 bpf_get_idle_time(struct kernel_cpustat *kcs, int cpu)
         |                 ^~~~~~~~~~~~~~~~~
   fs/proc/stat.c:229:17: warning: no previous prototype for 'bpf_get_iowait_time' [-Wmissing-prototypes]
     229 | __bpf_kfunc u64 bpf_get_iowait_time(struct kernel_cpustat *kcs, int cpu)
         |                 ^~~~~~~~~~~~~~~~~~~
>> fs/proc/stat.c:234:18: warning: no previous prototype for 'bpf_show_all_irqs' [-Wmissing-prototypes]
     234 | __bpf_kfunc void bpf_show_all_irqs(struct seq_file *p)
         |                  ^~~~~~~~~~~~~~~~~
--
   kernel/bpf-rvi/common_kfuncs.c:24:32: warning: no previous prototype for 'bpf_mem_cgroup_from_task' [-Wmissing-prototypes]
      24 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:33:35: warning: no previous prototype for 'bpf_task_active_pid_ns' [-Wmissing-prototypes]
      33 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:38:17: warning: no previous prototype for 'bpf_pidns_nr_tasks' [-Wmissing-prototypes]
      38 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:52:17: warning: no previous prototype for 'bpf_pidns_last_pid' [-Wmissing-prototypes]
      52 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:81:18: warning: no previous prototype for 'bpf_si_memswinfo' [-Wmissing-prototypes]
      81 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |                  ^~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:91:27: warning: no previous prototype for 'bpf_page_counter_read' [-Wmissing-prototypes]
      91 | __bpf_kfunc unsigned long bpf_page_counter_read(struct page_counter *counter)
         |                           ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:101:18: warning: no previous prototype for 'bpf_seq_file_append' [-Wmissing-prototypes]
     101 | __bpf_kfunc void bpf_seq_file_append(struct seq_file *dst, struct seq_file *src)
         |                  ^~~~~~~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:115:18: warning: no previous prototype for 'bpf_get_boottime_timens' [-Wmissing-prototypes]
     115 | __bpf_kfunc void bpf_get_boottime_timens(struct task_struct *tsk, struct timespec64 *boottime)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:121:27: warning: no previous prototype for 'bpf_get_total_forks' [-Wmissing-prototypes]
     121 | __bpf_kfunc unsigned long bpf_get_total_forks(void)
         |                           ^~~~~~~~~~~~~~~~~~~


vim +/bpf_show_all_irqs +234 fs/proc/stat.c

   222	
   223	#ifdef CONFIG_BPF_RVI
 > 224	__bpf_kfunc u64 bpf_get_idle_time(struct kernel_cpustat *kcs, int cpu)
   225	{
   226		return get_idle_time(kcs, cpu);
   227	}
   228	
   229	__bpf_kfunc u64 bpf_get_iowait_time(struct kernel_cpustat *kcs, int cpu)
   230	{
   231		return get_iowait_time(kcs, cpu);
   232	}
   233	
 > 234	__bpf_kfunc void bpf_show_all_irqs(struct seq_file *p)
   235	{
   236		show_all_irqs(p);
   237	}
   238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
