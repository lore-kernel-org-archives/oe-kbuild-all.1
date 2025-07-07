Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B5421770A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Jul 2025 17:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751910614; cv=none; b=VIhPJ2hbwG7ROs9sbre5pdlpdyrNHFr6uoT/lDL6ieTjWoZJRpwUjtdqNRUGVayp7I8djbucH9knn8fMU3tlQ8KD8ZdN5ZCs33RNqURac8mh8jf38AruBDmyp2VfnuGeWYfQBnWFrBsr7fs5tEdLtVtaSpxr5NkHSo9GQMWgLu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751910614; c=relaxed/simple;
	bh=0UeNg1XAhm6DslEs0P2zWZ+Y9IFj9o0WifyM3MPV9tM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uVX4YnkIjPwai1LhPPKETfnBRXmkEyTATj3UsW+CdT4sFFhDn02Cx8s8tkqKvElS+59TR0GESyEh7R8DbRgA9O3ZXQGHjw3Imitv6a+F/d6gfuDQheM9caY1JoeDfiiW1KuoroPfu2x+DVx2ikk0sH4WNwRdh3WM8FpiCsGZDYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqDECKxY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqDECKxY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751910612; x=1783446612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0UeNg1XAhm6DslEs0P2zWZ+Y9IFj9o0WifyM3MPV9tM=;
  b=VqDECKxY2Nc3A+H4b0CFJHmRPt9VTxVGpfC0mbsVKTkwQ9kpccdAqM+C
   rrDxGoeser0agaOVctbXBk7aozo3AU9hqmxJ73owH5RYJjWCcnez14VWn
   NXoZF+s/zVECITVU0eKhNHfSF3l7AuylOJUVSwFsuowsDj8kusCHUuWyB
   Cz8Ixw8Z2j1YcvwR8n8Okf2NdjGPOVPy7uOS2ZbWOexXEm/myVhiwd2vS
   VUNjT9pk+pFkxPEnGaZoPibIJKj99dAA7HgDdy89y7hSNBqBhF8UHB9Oz
   4Ysm5GVN5EaefuyBubrUod2TA8Fsz8ZPmJgMZE7IKA/lAIIPrakjch2o5
   g==;
X-CSE-ConnectionGUID: G2np1bpTSRC9886p2ubgdw==
X-CSE-MsgGUID: mArmjB5RTSKUTpNrtWkq+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="71719538"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="71719538"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 10:50:11 -0700
X-CSE-ConnectionGUID: e0HReMunRdmgpu95DpU0Lg==
X-CSE-MsgGUID: HJ7CeIhBQiWDUonLte/GLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="155013731"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Jul 2025 10:50:10 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYpyh-0000cN-0g;
	Mon, 07 Jul 2025 17:50:07 +0000
Date: Tue, 8 Jul 2025 01:49:46 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [bigeasy-staging:futex_percpu_ref 2/3] kernel/fork.c:1063:13: error:
 void value not ignored as it ought to be
Message-ID: <202507080103.ZnxNjVVa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git futex_percpu_ref
head:   68087bce4b1dfad7de82a55bcc27fec3a19df65e
commit: 059f406972f3667040329c749c456120d9e05542 [2/3] futex: Use RCU-based per-CPU reference counting instead of rcuref_t
config: i386-buildonly-randconfig-004-20250707 (https://download.01.org/0day-ci/archive/20250708/202507080103.ZnxNjVVa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507080103.ZnxNjVVa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507080103.ZnxNjVVa-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/fork.c: In function 'mm_init':
>> kernel/fork.c:1063:13: error: void value not ignored as it ought to be
    1063 |         if (futex_mm_init(mm))
         |             ^~~~~~~~~~~~~


vim +1063 kernel/fork.c

  1024	
  1025	static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
  1026		struct user_namespace *user_ns)
  1027	{
  1028		mt_init_flags(&mm->mm_mt, MM_MT_FLAGS);
  1029		mt_set_external_lock(&mm->mm_mt, &mm->mmap_lock);
  1030		atomic_set(&mm->mm_users, 1);
  1031		atomic_set(&mm->mm_count, 1);
  1032		seqcount_init(&mm->write_protect_seq);
  1033		mmap_init_lock(mm);
  1034		INIT_LIST_HEAD(&mm->mmlist);
  1035		mm_pgtables_bytes_init(mm);
  1036		mm->map_count = 0;
  1037		mm->locked_vm = 0;
  1038		atomic64_set(&mm->pinned_vm, 0);
  1039		memset(&mm->rss_stat, 0, sizeof(mm->rss_stat));
  1040		spin_lock_init(&mm->page_table_lock);
  1041		spin_lock_init(&mm->arg_lock);
  1042		mm_init_cpumask(mm);
  1043		mm_init_aio(mm);
  1044		mm_init_owner(mm, p);
  1045		mm_pasid_init(mm);
  1046		RCU_INIT_POINTER(mm->exe_file, NULL);
  1047		mmu_notifier_subscriptions_init(mm);
  1048		init_tlb_flush_pending(mm);
  1049	#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !defined(CONFIG_SPLIT_PMD_PTLOCKS)
  1050		mm->pmd_huge_pte = NULL;
  1051	#endif
  1052		mm_init_uprobes_state(mm);
  1053		hugetlb_count_init(mm);
  1054	
  1055		if (current->mm) {
  1056			mm->flags = mmf_init_flags(current->mm->flags);
  1057			mm->def_flags = current->mm->def_flags & VM_INIT_DEF_MASK;
  1058		} else {
  1059			mm->flags = default_dump_filter;
  1060			mm->def_flags = 0;
  1061		}
  1062	
> 1063		if (futex_mm_init(mm))
  1064			goto fail_mm_init;
  1065	
  1066		if (mm_alloc_pgd(mm))
  1067			goto fail_nopgd;
  1068	
  1069		if (mm_alloc_id(mm))
  1070			goto fail_noid;
  1071	
  1072		if (init_new_context(p, mm))
  1073			goto fail_nocontext;
  1074	
  1075		if (mm_alloc_cid(mm, p))
  1076			goto fail_cid;
  1077	
  1078		if (percpu_counter_init_many(mm->rss_stat, 0, GFP_KERNEL_ACCOUNT,
  1079					     NR_MM_COUNTERS))
  1080			goto fail_pcpu;
  1081	
  1082		mm->user_ns = get_user_ns(user_ns);
  1083		lru_gen_init_mm(mm);
  1084		return mm;
  1085	
  1086	fail_pcpu:
  1087		mm_destroy_cid(mm);
  1088	fail_cid:
  1089		destroy_context(mm);
  1090	fail_nocontext:
  1091		mm_free_id(mm);
  1092	fail_noid:
  1093		mm_free_pgd(mm);
  1094	fail_nopgd:
  1095		futex_hash_free(mm);
  1096	fail_mm_init:
  1097		free_mm(mm);
  1098		return NULL;
  1099	}
  1100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
