Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574782D0298
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 03:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765425156; cv=none; b=IUlHRHbbiL4Tm7iRYFLjd9BZLaQqYmyIwnt6fclectelGCdFbdmJd+MxhwEy+8zhcXQWYebScZbJe83ux/pu3Zz+I4dhnmZqUTDePnxP4k+knvXlnLQI7wTbF8cXnOklj425+w9AlHwlWvWmG6kfaGMsRYDNqw6dHiNvoN0kP88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765425156; c=relaxed/simple;
	bh=B1YYpomLIVUH55exl6FhcAVOdv+51cV7raFFAlAQiDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SAr2JcRXgPn2gd+5U2s97fX29W8U1w6uZtDXeh4mC/8vbZRV2eqX8hI/bnLU09/2J3fyR64F0s7kddU8tzreEPzQiIGa+EvB6Unb88GrT/1nRVGTFVpQkSiR05yrevyBoodZV+Eg5fLia99wu7hMnx3hretYc45vPFYCYUzxHNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m94/n0HW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m94/n0HW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765425154; x=1796961154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B1YYpomLIVUH55exl6FhcAVOdv+51cV7raFFAlAQiDI=;
  b=m94/n0HWOgYGTTwExy1Y4klzER22nQN2a3f3DNv9BuxOUMu/jhg5m2gF
   b5ZoTvwLEwEQ+3cBWtzI/4DE9NcCj4jyLL9JbnXJLrV3EAlhL9sZ0aFzH
   RI6nhcn6Aqfi67oTH7iECA8MIPWX+dSogxDO3M7UkGBMHycINSfuM1zy8
   gmVldSCXu98JWbbv2NeSpq/rrVQiD21BmETFp9oIPkSM/eLS4EGP/ALOC
   Rfn0hiCsq1mg0HppQl6FFOS8Zm2A9eYeDXZMYS2IMQR+AD383ChuS5KGd
   zAKxlb1LmtX27pq9kHLzHddqGt61UmyuwOWL/0t41ry38VUWBxjuDYHbi
   w==;
X-CSE-ConnectionGUID: NiGXmtRTQ1i/Tbu/7G9b/Q==
X-CSE-MsgGUID: HotD8nFgQzOB907On1TNEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78769388"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78769388"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 19:52:32 -0800
X-CSE-ConnectionGUID: O/a7J1yIQnyhqfRCiJWmzQ==
X-CSE-MsgGUID: IAo7sGTsRaetY54h4Kx1lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201611982"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Dec 2025 19:52:31 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTXjB-0000000047T-09Oj;
	Thu, 11 Dec 2025 03:52:29 +0000
Date: Thu, 11 Dec 2025 11:51:34 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 5/5]
 kernel/sched/group_balancer.c:260:37: warning: no previous prototype for
 'group_balancer_kn_lock_live'
Message-ID: <202512111109.SBpP3oXx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   38743d2d77ee27e7fe97c7ef81b8643365903536
commit: 9def6b07bf6804eefbec09528637bc7151eacd44 [5/5] anolis: sched: introduce sysfs interface for group balancer sched domain
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251211/202512111109.SBpP3oXx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111109.SBpP3oXx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111109.SBpP3oXx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/group_balancer.c:104:23: warning: no previous prototype for 'cpu_llc_mask' [-Wmissing-prototypes]
     104 | const struct cpumask *cpu_llc_mask(int cpu)
         |                       ^~~~~~~~~~~~
   kernel/sched/group_balancer.c:111:23: warning: no previous prototype for 'cpu_die_mask' [-Wmissing-prototypes]
     111 | const struct cpumask *cpu_die_mask(int cpu)
         |                       ^~~~~~~~~~~~
   kernel/sched/group_balancer.c:116:23: warning: no previous prototype for 'cpu_core_mask' [-Wmissing-prototypes]
     116 | const struct cpumask *cpu_core_mask(int cpu)
         |                       ^~~~~~~~~~~~~
   kernel/sched/group_balancer.c:121:23: warning: no previous prototype for 'cpu_root_mask' [-Wmissing-prototypes]
     121 | const struct cpumask *cpu_root_mask(int cpu)
         |                       ^~~~~~~~~~~~~
   kernel/sched/group_balancer.c:252:37: warning: no previous prototype for 'kernfs_to_gb_sd' [-Wmissing-prototypes]
     252 | struct group_balancer_sched_domain *kernfs_to_gb_sd(struct kernfs_node *kn)
         |                                     ^~~~~~~~~~~~~~~
>> kernel/sched/group_balancer.c:260:37: warning: no previous prototype for 'group_balancer_kn_lock_live' [-Wmissing-prototypes]
     260 | struct group_balancer_sched_domain *group_balancer_kn_lock_live(struct kernfs_node *kn)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/group_balancer.c:274:6: warning: no previous prototype for 'group_balancer_kn_unlock' [-Wmissing-prototypes]
     274 | void group_balancer_kn_unlock(struct kernfs_node *kn)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/group_balancer.c:1013:6: warning: no previous prototype for 'sched_init_group_balancer_levels' [-Wmissing-prototypes]
    1013 | void sched_init_group_balancer_levels(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/group_balancer_kn_lock_live +260 kernel/sched/group_balancer.c

   115	
 > 116	const struct cpumask *cpu_core_mask(int cpu)
   117	{
   118		return topology_core_cpumask(cpu);
   119	}
   120	
 > 121	const struct cpumask *cpu_root_mask(int cpu)
   122	{
   123		return (const struct cpumask *)&root_cpumask;
   124	}
   125	
   126	#define GB_SD_INIT(type) \
   127		.gb_flags = GROUP_BALANCER_##type##_FLAG, \
   128		.topology_name = #type
   129	/*
   130	 * Group Balancer build group_balancer_sched_domains after kernel init,
   131	 * so the following cpumask can be got safely.
   132	 *
   133	 * smt mask:		cpu_smt_mask
   134	 * cluster mask:	cpu_clustergroup_mask
   135	 * mc mask:		cpu_coregroup_mask
   136	 * llc mask:		cpu_llc_mask
   137	 * die mask:		cpu_die_mask
   138	 * numa mask:		cpu_cpu_mask
   139	 * socket mask:		cpu_core_mask
   140	 * all mask:		cpu_root_mask
   141	 */
   142	static struct group_balancer_topology_level default_topology[] = {
   143		{ cpu_root_mask, GB_SD_INIT(ROOT) },
   144		{ cpu_core_mask, GB_SD_INIT(SOCKET) },
   145	#ifdef CONFIG_NUMA
   146		{ cpu_cpu_mask, GB_SD_INIT(NUMA) },
   147	#endif
   148		{ cpu_die_mask, GB_SD_INIT(DIE) },
   149		{ cpu_llc_mask, GB_SD_INIT(LLC) },
   150	#ifdef CONFIG_SCHED_MC
   151		{ cpu_coregroup_mask, cpu_core_flags, GB_SD_INIT(MC) },
   152	#endif
   153	#ifdef CONFIG_SCHED_CLUSTER
   154		{ cpu_clustergroup_mask, cpu_cluster_flags, GB_SD_INIT(CLUSTER) },
   155	#endif
   156	#ifdef CONFIG_SCHED_SMT
   157		{ cpu_smt_mask, cpu_smt_flags, GB_SD_INIT(SMT) },
   158	#endif
   159		{ NULL, },
   160	};
   161	
   162	#define for_each_gb_topology_level(tl)			\
   163		for (tl = default_topology; tl->mask; tl++)
   164	
   165	#define for_each_topology_level_sibling(pos, gb_tl)	\
   166		list_for_each_entry(pos, &gb_tl->domains, topology_level_sibling)
   167	
   168	#define for_each_topology_level_sibling_safe(pos, n, gb_tl)	\
   169		list_for_each_entry_safe(pos, n, &gb_tl->domains, topology_level_sibling)
   170	
   171	/* NR_CPUS is 1024 now, we set log(1024) + 1 = 11 levels. */
   172	#define NR_SIZE_LEVELS 11
   173	struct group_balancer_size_level default_size[NR_SIZE_LEVELS];
   174	
   175	#define for_each_gb_size_level(sl, i)			\
   176		for (sl = default_size, i = 0; i < NR_SIZE_LEVELS; sl++, i++)
   177	
   178	#define for_each_gb_sd_child(pos, gb_sd)			\
   179		list_for_each_entry(pos, &gb_sd->child, sibling)
   180	
   181	#define for_each_gb_sd_child_safe(pos, n, gb_sd)			\
   182		list_for_each_entry_safe(pos, n, &gb_sd->child, sibling)
   183	
   184	#define group_balancer_sched_domain_first_child(gb_sd)		\
   185		list_first_entry(&gb_sd->child, struct group_balancer_sched_domain, sibling)
   186	
   187	struct group_balancer_sched_domain *group_balancer_root_domain;
   188	
   189	#define MAX_NAME_LEN		128
   190	
   191	static inline struct cpumask *gb_sd_span(struct group_balancer_sched_domain *gb_sd)
   192	{
   193		return to_cpumask(gb_sd->span);
   194	}
   195	
   196	static unsigned int get_size_level(struct group_balancer_sched_domain *gb_sd)
   197	{
   198		int size_level = ilog2(gb_sd->span_weight);
   199	
   200		/* Prevent out-of-bound array access. */
   201		if (unlikely(size_level < 0))
   202			size_level = 0;
   203		else if (unlikely(size_level >= NR_SIZE_LEVELS))
   204			size_level = NR_SIZE_LEVELS - 1;
   205	
   206		return (unsigned int)size_level;
   207	}
   208	
   209	static void __add_to_size_level(struct group_balancer_sched_domain *gb_sd,
   210					unsigned int size_level)
   211	{
   212		struct group_balancer_size_level *gb_sl;
   213	
   214		gb_sl = &default_size[size_level];
   215		list_add_tail(&gb_sd->size_level_sibling, &gb_sl->domains);
   216	}
   217	
   218	static void add_to_size_level(struct group_balancer_sched_domain *gb_sd)
   219	{
   220		unsigned int size_level = get_size_level(gb_sd);
   221	
   222		__add_to_size_level(gb_sd, size_level);
   223	}
   224	
   225	static int group_balancer_seqfile_show(struct seq_file *m, void *arg)
   226	{
   227		struct kernfs_open_file *of = m->private;
   228		struct gftype *gft = of->kn->priv;
   229	
   230		if (gft->seq_show)
   231			return gft->seq_show(of, m, arg);
   232		return 0;
   233	}
   234	
   235	static ssize_t group_balancer_file_write(struct kernfs_open_file *of, char *buf,
   236						 size_t nbytes, loff_t off)
   237	{
   238		struct gftype *gft = of->kn->priv;
   239	
   240		if (gft->write)
   241			return gft->write(of, buf, nbytes, off);
   242	
   243		return -EINVAL;
   244	}
   245	
   246	static const struct kernfs_ops group_balancer_kf_single_ops = {
   247		.atomic_write_len	= PAGE_SIZE,
   248		.write			= group_balancer_file_write,
   249		.seq_show		= group_balancer_seqfile_show,
   250	};
   251	
   252	struct group_balancer_sched_domain *kernfs_to_gb_sd(struct kernfs_node *kn)
   253	{
   254		if (kernfs_type(kn) == KERNFS_DIR)
   255			return kn->priv;
   256		else
   257			return kn->parent->priv;
   258	}
   259	
 > 260	struct group_balancer_sched_domain *group_balancer_kn_lock_live(struct kernfs_node *kn)
   261	{
   262		struct group_balancer_sched_domain *gb_sd = kernfs_to_gb_sd(kn);
   263	
   264		if (!gb_sd)
   265			return NULL;
   266	
   267		kernfs_break_active_protection(kn);
   268		cpus_read_lock();
   269		write_lock(&group_balancer_sched_domain_lock);
   270	
   271		return gb_sd;
   272	}
   273	
 > 274	void group_balancer_kn_unlock(struct kernfs_node *kn)
   275	{
   276		struct group_balancer_sched_domain *gb_sd = kernfs_to_gb_sd(kn);
   277	
   278		if (!gb_sd)
   279			return;
   280	
   281		write_unlock(&group_balancer_sched_domain_lock);
   282		cpus_read_unlock();
   283		kernfs_unbreak_active_protection(kn);
   284	}
   285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
