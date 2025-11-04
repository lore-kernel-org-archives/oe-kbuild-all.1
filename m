Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AAB34C812
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 23:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762300637; cv=none; b=mhgg+OeLw5/zCICHBJRllI5jbI/0M0s8OBL+deEQ5iUfSxmI/BjcnPSRG3n7HZm3Rs/5h+PqVNeO6ODWMwRP5mlFVQDk64e0Rs9cK1KKLr3Jw8VSvh4QqBvDzFuyp5drgQM0ThCykvVBL0tdPe2wICHo4VV9T9yWH3eiV8lrkPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762300637; c=relaxed/simple;
	bh=9/QFc5PMLDmVCzE+P4fESez98GANYgAmXLH1CMUAFfE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qaK2uSfuiZ76LbSXx9Eorv/Cy0t0tQpJXsasJZ7dxv3SxP8kr5EoAqXy4t4jZsbjyiCRIP99QQSmxcob9nZ3vHY5koRUx8xq5h8q+k+nfbhTJePdl4v8rr0yk2N1V97fCicHwIhvY4joKXe6qaNUqJ1Lx4qoKMcyPQwcu25aoTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QpVES9fn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QpVES9fn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762300635; x=1793836635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9/QFc5PMLDmVCzE+P4fESez98GANYgAmXLH1CMUAFfE=;
  b=QpVES9fnwceAOouuMYTw3wwqPvXybH9U7Q71Vl35GfZWS7KIN2EOfGPT
   YS0L9UMXasIk6ltnyKApi5sSvAtx2t29ooubL58NqXBx4sKdRn8E/KXAX
   Q7jcmQR6AfRcwD4i7g+SxTgbLmRcPdnUHN9Lfq5aOaO1bq/rFCAv42GAd
   KaonOYYYAB9FuUChvyVxfd2jm68hWWnXBJT0ZRQk3c9OZUpmfJiODTyj+
   dgdaDPTs571Gs/URX76VV1q8P/CdX2p0TtA+nem3RvkW1OWP9ENO1FaS9
   kMIGKwpm68L87UU6/Bs13zMHcoPGAGyWPnX6AXzRX80UerZt4OlyOISqd
   A==;
X-CSE-ConnectionGUID: EZD4iG8ORzuxamcalgbPvA==
X-CSE-MsgGUID: EkuVSzL6RYCdhoy/VN3J+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="89870730"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="89870730"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 15:57:14 -0800
X-CSE-ConnectionGUID: 5FfgXT3DRcKphLreo8XPVA==
X-CSE-MsgGUID: p1bZiQHZTt+S7OY/bWKK4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="188022063"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2025 15:57:13 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGQte-000RxE-2V;
	Tue, 04 Nov 2025 23:57:08 +0000
Date: Wed, 5 Nov 2025 07:56:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] kernel/bpf-rvi/common_kfuncs.c:127:26:
 warning: no previous prototype for 'bpf_nr_running'
Message-ID: <202511050754.SzG0bccj-lkp@intel.com>
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
commit: 34f90dce941b028e02a0336711907b220e3c5765 [3098/3098] bpf-rvi: Add cpu runqueue related kfuncs
config: x86_64-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251105/202511050754.SzG0bccj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511050754.SzG0bccj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511050754.SzG0bccj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf-rvi/common_kfuncs.c:25:32: warning: no previous prototype for 'bpf_mem_cgroup_from_task' [-Wmissing-prototypes]
      25 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:34:35: warning: no previous prototype for 'bpf_task_active_pid_ns' [-Wmissing-prototypes]
      34 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:39:17: warning: no previous prototype for 'bpf_pidns_nr_tasks' [-Wmissing-prototypes]
      39 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:53:17: warning: no previous prototype for 'bpf_pidns_last_pid' [-Wmissing-prototypes]
      53 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:82:18: warning: no previous prototype for 'bpf_si_memswinfo' [-Wmissing-prototypes]
      82 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |                  ^~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:92:27: warning: no previous prototype for 'bpf_page_counter_read' [-Wmissing-prototypes]
      92 | __bpf_kfunc unsigned long bpf_page_counter_read(struct page_counter *counter)
         |                           ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:102:18: warning: no previous prototype for 'bpf_seq_file_append' [-Wmissing-prototypes]
     102 | __bpf_kfunc void bpf_seq_file_append(struct seq_file *dst, struct seq_file *src)
         |                  ^~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:116:18: warning: no previous prototype for 'bpf_get_boottime_timens' [-Wmissing-prototypes]
     116 | __bpf_kfunc void bpf_get_boottime_timens(struct task_struct *tsk, struct timespec64 *boottime)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:122:27: warning: no previous prototype for 'bpf_get_total_forks' [-Wmissing-prototypes]
     122 | __bpf_kfunc unsigned long bpf_get_total_forks(void)
         |                           ^~~~~~~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:127:26: warning: no previous prototype for 'bpf_nr_running' [-Wmissing-prototypes]
     127 | __bpf_kfunc unsigned int bpf_nr_running(void)
         |                          ^~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:132:32: warning: no previous prototype for 'bpf_nr_context_switches' [-Wmissing-prototypes]
     132 | __bpf_kfunc unsigned long long bpf_nr_context_switches(void)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:137:26: warning: no previous prototype for 'bpf_nr_iowait' [-Wmissing-prototypes]
     137 | __bpf_kfunc unsigned int bpf_nr_iowait(void)
         |                          ^~~~~~~~~~~~~


vim +/bpf_nr_running +127 kernel/bpf-rvi/common_kfuncs.c

    96	
    97	/*
    98	 * Stat related kfuncs
    99	 */
   100	
   101	/* Moving src's content to the end of dst. Reference: seq_vprintf. */
 > 102	__bpf_kfunc void bpf_seq_file_append(struct seq_file *dst, struct seq_file *src)
   103	{
   104		/*
   105		 * ->count: length of content
   106		 * ->size: available buffer space
   107		 * i.e. seq_printf(dst, "%s", src->buf)
   108		 */
   109		if (dst->count < dst->size)
   110			if (src->count < dst->size - dst->count) {
   111				memmove(dst->buf + dst->count, src->buf, src->count);
   112				dst->count += src->count;
   113			}
   114	}
   115	
 > 116	__bpf_kfunc void bpf_get_boottime_timens(struct task_struct *tsk, struct timespec64 *boottime)
   117	{
   118		getboottime64(boottime);
   119		*boottime = timespec64_sub(*boottime, tsk->nsproxy->time_ns->offsets.boottime);
   120	}
   121	
 > 122	__bpf_kfunc unsigned long bpf_get_total_forks(void)
   123	{
   124		return total_forks;
   125	}
   126	
 > 127	__bpf_kfunc unsigned int bpf_nr_running(void)
   128	{
   129		return nr_running();
   130	}
   131	
 > 132	__bpf_kfunc unsigned long long bpf_nr_context_switches(void)
   133	{
   134		return nr_context_switches();
   135	}
   136	
 > 137	__bpf_kfunc unsigned int bpf_nr_iowait(void)
   138	{
   139		return nr_iowait();
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
