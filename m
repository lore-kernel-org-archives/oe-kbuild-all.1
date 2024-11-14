Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AB6146013
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 16:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731603511; cv=none; b=QUQgGQjgafVs+o+hwCqucYFnoh3orRfyspgJIy64Q+HIqlD7qq3jReCBbUcGaxAVXflcsY0b3U37VvVS9DiJFMZA6MnrN+VlDShDlH3Yg3qcIAQURWgClsQDXxNzefqSJZGLiuS3LdFEoz9ZxDpXPF7wpnVhG4+h81EzmphFB88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731603511; c=relaxed/simple;
	bh=p5lX/+dmfPWE2ZFeGh10krtTca6CrUhgsRQc9BMQ4Vo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jUhYtF4B47BCRj4lc+kdfksQg9iX23tnOxQQnyF9tU6hx9U4i5ylbZ1XdhnfhcmQz0YsryNHM9O4W7S+gq98nv+ILCdjyxfTXQYZPpo/az5M7Wnjzr5Y9EXTrK9fYoVVXrutqKphF3KyDfTYa1SFkBcnQhzf+VSUFIhAj1ZbvKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gvISUR5v; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gvISUR5v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731603509; x=1763139509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p5lX/+dmfPWE2ZFeGh10krtTca6CrUhgsRQc9BMQ4Vo=;
  b=gvISUR5v/LNuPjUzG+iPhrHavPplH3BvSMD57XF18ehqjLjheVUA2NIC
   wSTcIRLLJcOVao5q1PJyjACCfe5lFgaEtuLtJnBBa56KUhDvQ5yRV26mF
   Yxue1XMdZWKJpiuLkaevfGIaso9OqRoTLtoPZzae/8L5BrJoMqn0SR3xC
   Hl63iubAlL0o5vsSkiQf9osfcRn0SM7PTSMzF7j5hbzSVJAUFvwuyCa2J
   E+X6hNm5K0qUUER6KIad8Gnj7/eOK4MQWxr45C2N1aOWctXcA+dB6Qo6f
   Y7XvGa4gEhs49BvIUxmsZWA9Vl2w9TIXgQbP++QkedeoBHcj7CZ23ewC6
   g==;
X-CSE-ConnectionGUID: 2rPTR+h3Q1C4nqFTfVdZeg==
X-CSE-MsgGUID: /o5PwRzkSsak8dWtjR4akw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42679105"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="42679105"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 08:58:18 -0800
X-CSE-ConnectionGUID: /RE1WqTwTsqRWueTdb0J6g==
X-CSE-MsgGUID: M6Lqsn8AQOWUU9FTG7Qssg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="111578692"
Received: from lkp-server01.sh.intel.com (HELO c7bc087bbc55) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Nov 2024 08:58:16 -0800
Received: from kbuild by c7bc087bbc55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBdAb-0000BV-1A;
	Thu, 14 Nov 2024 16:58:13 +0000
Date: Fri, 15 Nov 2024 00:57:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 260/1491]
 fs/proc/base.c:196:1: sparse: sparse: symbol
 'proc_mem_restrict_foll_force_all' was not declared. Should it be static?
Message-ID: <202411150016.kndD7SzF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-f9d942cf7d57
head:   ef2c757e09b49fa8c905e77b7c1e55ccf2be08ee
commit: 330b9811d1da0797d4502c311d4fa783db3b3771 [260/1491] FROMGIT: proc: restrict /proc/pid/mem
config: i386-randconfig-061-20241114 (https://download.01.org/0day-ci/archive/20241115/202411150016.kndD7SzF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241115/202411150016.kndD7SzF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411150016.kndD7SzF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/proc/base.c:163:1: sparse: sparse: symbol 'proc_mem_restrict_open_read_all' was not declared. Should it be static?
   fs/proc/base.c:164:1: sparse: sparse: symbol 'proc_mem_restrict_open_read_ptracer' was not declared. Should it be static?
   fs/proc/base.c:174:1: sparse: sparse: symbol 'proc_mem_restrict_open_write_all' was not declared. Should it be static?
   fs/proc/base.c:175:1: sparse: sparse: symbol 'proc_mem_restrict_open_write_ptracer' was not declared. Should it be static?
   fs/proc/base.c:185:1: sparse: sparse: symbol 'proc_mem_restrict_write_all' was not declared. Should it be static?
   fs/proc/base.c:186:1: sparse: sparse: symbol 'proc_mem_restrict_write_ptracer' was not declared. Should it be static?
>> fs/proc/base.c:196:1: sparse: sparse: symbol 'proc_mem_restrict_foll_force_all' was not declared. Should it be static?
>> fs/proc/base.c:197:1: sparse: sparse: symbol 'proc_mem_restrict_foll_force_ptracer' was not declared. Should it be static?
   fs/proc/base.c:2474:25: sparse: sparse: cast to restricted fmode_t
   fs/proc/base.c:2531:42: sparse: sparse: cast from restricted fmode_t
   fs/proc/base.c:2631:48: sparse: sparse: cast from restricted fmode_t
   fs/proc/base.c: note: in included file (through include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs.h, ...):
   include/linux/sched/signal.h:757:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:757:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:757:37: sparse:     got struct spinlock [noderef] __rcu *
   fs/proc/base.c:1313:36: sparse: sparse: context imbalance in '__set_oom_adj' - unexpected unlock

vim +/proc_mem_restrict_foll_force_all +196 fs/proc/base.c

   138	
   139	#define DIR(NAME, MODE, iops, fops)	\
   140		NOD(NAME, (S_IFDIR|(MODE)), &iops, &fops, {} )
   141	#define LNK(NAME, get_link)					\
   142		NOD(NAME, (S_IFLNK|S_IRWXUGO),				\
   143			&proc_pid_link_inode_operations, NULL,		\
   144			{ .proc_get_link = get_link } )
   145	#define REG(NAME, MODE, fops)				\
   146		NOD(NAME, (S_IFREG|(MODE)), NULL, &fops, {})
   147	#define ONE(NAME, MODE, show)				\
   148		NOD(NAME, (S_IFREG|(MODE)),			\
   149			NULL, &proc_single_file_operations,	\
   150			{ .proc_show = show } )
   151	#define ATTR(LSM, NAME, MODE)				\
   152		NOD(NAME, (S_IFREG|(MODE)),			\
   153			NULL, &proc_pid_attr_operations,	\
   154			{ .lsm = LSM })
   155	
   156	#if IS_ENABLED(CONFIG_PROC_MEM_RESTRICT_OPEN_READ_ALL)
   157	DEFINE_STATIC_KEY_TRUE_RO(proc_mem_restrict_open_read_all);
   158	DEFINE_STATIC_KEY_FALSE_RO(proc_mem_restrict_open_read_ptracer);
   159	#elif IS_ENABLED(CONFIG_PROC_MEM_RESTRICT_OPEN_READ_PTRACE)
   160	DEFINE_STATIC_KEY_FALSE_RO(proc_mem_restrict_open_read_all);
   161	DEFINE_STATIC_KEY_TRUE_RO(proc_mem_restrict_open_read_ptracer);
   162	#else
 > 163	DEFINE_STATIC_KEY_FALSE_RO(proc_mem_restrict_open_read_all);
   164	DEFINE_STATIC_KEY_FALSE_RO(proc_mem_restrict_open_read_ptracer);
   165	#endif
   166	
   167	#if IS_ENABLED(CONFIG_PROC_MEM_RESTRICT_OPEN_WRITE_ALL)
   168	DEFINE_STATIC_KEY_TRUE_RO(proc_mem_restrict_open_write_all);
   169	DEFINE_STATIC_KEY_FALSE_RO(proc_mem_restrict_open_write_ptracer);
   170	#elif IS_ENABLED(CONFIG_PROC_MEM_RESTRICT_OPEN_WRITE_PTRACE)
   171	DEFINE_STATIC_KEY_FALSE_RO(proc_mem_restrict_open_write_all);
   172	DEFINE_STATIC_KEY_TRUE_RO(proc_mem_restrict_open_write_ptracer);
   173	#else
   174	DEFINE_STATIC_KEY_FALSE_RO(proc_mem_restrict_open_write_all);
   175	DEFINE_STATIC_KEY_FALSE_RO(proc_mem_restrict_open_write_ptracer);
   176	#endif
   177	
   178	#if IS_ENABLED(CONFIG_PROC_MEM_RESTRICT_WRITE_ALL)
   179	DEFINE_STATIC_KEY_TRUE_RO(proc_mem_restrict_write_all);
   180	DEFINE_STATIC_KEY_FALSE_RO(proc_mem_restrict_write_ptracer);
   181	#elif IS_ENABLED(CONFIG_PROC_MEM_RESTRICT_WRITE_PTRACE)
   182	DEFINE_STATIC_KEY_FALSE_RO(proc_mem_restrict_write_all);
   183	DEFINE_STATIC_KEY_TRUE_RO(proc_mem_restrict_write_ptracer);
   184	#else
   185	DEFINE_STATIC_KEY_FALSE_RO(proc_mem_restrict_write_all);
   186	DEFINE_STATIC_KEY_FALSE_RO(proc_mem_restrict_write_ptracer);
   187	#endif
   188	
   189	#if IS_ENABLED(CONFIG_PROC_MEM_RESTRICT_FOLL_FORCE_ALL)
   190	DEFINE_STATIC_KEY_TRUE_RO(proc_mem_restrict_foll_force_all);
   191	DEFINE_STATIC_KEY_FALSE_RO(proc_mem_restrict_foll_force_ptracer);
   192	#elif IS_ENABLED(CONFIG_PROC_MEM_RESTRICT_FOLL_FORCE_PTRACE)
   193	DEFINE_STATIC_KEY_FALSE_RO(proc_mem_restrict_foll_force_all);
   194	DEFINE_STATIC_KEY_TRUE_RO(proc_mem_restrict_foll_force_ptracer);
   195	#else
 > 196	DEFINE_STATIC_KEY_FALSE_RO(proc_mem_restrict_foll_force_all);
 > 197	DEFINE_STATIC_KEY_FALSE_RO(proc_mem_restrict_foll_force_ptracer);
   198	#endif
   199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
