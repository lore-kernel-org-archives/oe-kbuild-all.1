Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E316F449B2E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 06:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751565; cv=none; b=qrTveb8+rzWhsa5XmRxcv9Yb2e6RYKMI4a1DOwZeYFTnBLWySLMoBdjpHH1KPRydMBJeI/e20cMgDbTTpaUJqtKQLFgUpnfMRtlRFG5NHdJcDvroyz8OM7CYvnDTsa7wrM57j8JQENIzncmYmBJPR2ak/34T4UlLtxUT9hmP4IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751565; c=relaxed/simple;
	bh=kZvLo1FFKFWhBb97k6AHUNURCQMklbQDZScdxPucT2Y=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFs5YGsX41bsvDSnUJeVyG9gWm8F8cz71KuuJ1U+oddqEM84Fj2RCG4vqWpxq5pc7ShDIXu5o1HOOhYF9MU+38wgmqC7HYwKPEWfySp7xnzXGJYzE1AhL1XP9ETIpajYXgsk8HmIBgbVa6sTmT0NtF6mthCyVbDCAINT2wqWjOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gxh+FF/I; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gxh+FF/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790751537; x=1822287537;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=kZvLo1FFKFWhBb97k6AHUNURCQMklbQDZScdxPucT2Y=;
  b=Gxh+FF/ITi6X5pLkhEFhYDNWIfLQtXBVbzmOSapbi6C1w3WJLnJrIweg
   4k3n75mmOIVoHqXYUFcAfzU2cM+ej1AzmWzaOHDpWX/kXks+/ZxuhZyYg
   9ChcBzWkm0O4Aj8CRwNf3greY8k3mZogBfx5IlQ1DIUP25qnTryVn5ycn
   kQggo80mBoblCzePZQrbjV5feyZZ6KoazTaYl3jvQYP2kjDFblY+vRoxp
   W3ygcjCQphl09p325sczrLKe/ByEXLgQbKQ1Ap12gi6u4Q1sePra6fTrx
   3mH7SBKFomFZLemBKXV5Y4ZGs0LniU/q36bSwpS0T9ITGcNDCxpEE3uhu
   w==;
X-CSE-ConnectionGUID: dmdgf7ngTbOGHCLb3Ghm9g==
X-CSE-MsgGUID: SvsU/CmYQwWXtri6dwEHFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="79047062"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="79047062"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 23:58:54 -0700
X-CSE-ConnectionGUID: fRWXIVAqTuC+9aWwn18eLA==
X-CSE-MsgGUID: muiX+IS/TkKKcOyfMXK/lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="274803651"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Sep 2026 23:58:53 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBoHC-00000000QFM-3Z9R
	for oe-kbuild-all@lists.linux.dev;
	Wed, 30 Sep 2026 06:58:50 +0000
Date: Wed, 30 Sep 2026 14:58:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: futex: Fix mm reuse handling for FUT_OFF_MMSHARED
Message-ID: <202609301426.SAWrhIfj-lkp@intel.com>
References: <202609301426.SAWrhIfj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609301426.SAWrhIfj-lkp@intel.com>

Hi Jann,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Jann-Horn/futex-Fix-mm-reuse-handling-for-FUT_OFF_MMSHARED/20260929-183132
base:   
patch link:    https://lore.kernel.org/r/202609301426.SAWrhIfj-lkp%40intel.com
config: arm-randconfig-1001-20260930 (https://download.01.org/0day-ci/archive/20260930/202609301426.SAWrhIfj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301426.SAWrhIfj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301426.SAWrhIfj-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/fork.o: in function `mm_init':
>> kernel/fork.c:1119: undefined reference to `futex_mm_init'


vim +1119 kernel/fork.c

ce0853966085dd8 Suren Baghdasaryan           2025-02-13  1090  
6b1c66c9cca99bf Christian Brauner (Amutable  2026-05-20  1091) static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p)
^1da177e4c3f415 Linus Torvalds               2005-04-16  1092  {
d4af56c5c7c6781 Liam R. Howlett              2022-09-06  1093  	mt_init_flags(&mm->mm_mt, MM_MT_FLAGS);
d4af56c5c7c6781 Liam R. Howlett              2022-09-06  1094  	mt_set_external_lock(&mm->mm_mt, &mm->mmap_lock);
^1da177e4c3f415 Linus Torvalds               2005-04-16  1095  	atomic_set(&mm->mm_users, 1);
^1da177e4c3f415 Linus Torvalds               2005-04-16  1096  	atomic_set(&mm->mm_count, 1);
57efa1fe5957694 Jason Gunthorpe              2020-12-14  1097  	seqcount_init(&mm->write_protect_seq);
d8ed45c5dcd455f Michel Lespinasse            2020-06-08  1098  	mmap_init_lock(mm);
^1da177e4c3f415 Linus Torvalds               2005-04-16  1099  	INIT_LIST_HEAD(&mm->mmlist);
af5b0f6a09e42c9 Kiryl Shutsemau              2017-11-15  1100  	mm_pgtables_bytes_init(mm);
41f727fde1fe40e Vladimir Davydov             2014-08-08  1101  	mm->map_count = 0;
41f727fde1fe40e Vladimir Davydov             2014-08-08  1102  	mm->locked_vm = 0;
70f8a3ca68d3e1f Davidlohr Bueso              2019-02-06  1103  	atomic64_set(&mm->pinned_vm, 0);
d559db086ff5be9 KAMEZAWA Hiroyuki            2010-03-05  1104  	memset(&mm->rss_stat, 0, sizeof(mm->rss_stat));
^1da177e4c3f415 Linus Torvalds               2005-04-16  1105  	spin_lock_init(&mm->page_table_lock);
88aa7cc688d48dd Yang Shi                     2018-06-07  1106  	spin_lock_init(&mm->arg_lock);
41f727fde1fe40e Vladimir Davydov             2014-08-08  1107  	mm_init_cpumask(mm);
858f09930b32c11 Alexey Dobriyan              2009-09-23  1108  	mm_init_aio(mm);
cf475ad28ac35cc Balbir Singh                 2008-04-29  1109  	mm_init_owner(mm, p);
a6cbd44093ef305 Fenghua Yu                   2022-02-07  1110  	mm_pasid_init(mm);
2b7e8665b4ff51c Eric Biggers                 2017-08-25  1111  	RCU_INIT_POINTER(mm->exe_file, NULL);
984cfe4e252681d Jason Gunthorpe              2019-12-18  1112  	mmu_notifier_subscriptions_init(mm);
16af97dc5a89753 Nadav Amit                   2017-08-10  1113  	init_tlb_flush_pending(mm);
394290cba9664ed David Hildenbrand            2024-07-26  1114  #if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !defined(CONFIG_SPLIT_PMD_PTLOCKS)
41f727fde1fe40e Vladimir Davydov             2014-08-08  1115  	mm->pmd_huge_pte = NULL;
41f727fde1fe40e Vladimir Davydov             2014-08-08  1116  #endif
355627f518978b5 Eric Biggers                 2017-08-31  1117  	mm_init_uprobes_state(mm);
13db8c50477d83a Liu Zixian                   2021-09-08  1118  	hugetlb_count_init(mm);
d7b3f52c861f54b Thomas Gleixner              2026-06-02 @1119  	futex_mm_init(mm);
^1da177e4c3f415 Linus Torvalds               2005-04-16  1120  
19148a19da86f1b Lorenzo Stoakes              2025-08-12  1121  	mm_flags_clear_all(mm);
a0715cc22601e88 Alex Thorlton                2014-04-07  1122  	if (current->mm) {
19148a19da86f1b Lorenzo Stoakes              2025-08-12  1123  		unsigned long flags = __mm_flags_get_word(current->mm);
19148a19da86f1b Lorenzo Stoakes              2025-08-12  1124  
58eac97a8ba0bcf Lorenzo Stoakes              2025-11-25  1125  		__mm_flags_overwrite_word(mm, mmf_init_legacy_flags(flags));
a0715cc22601e88 Alex Thorlton                2014-04-07  1126  		mm->def_flags = current->mm->def_flags & VM_INIT_DEF_MASK;
a0715cc22601e88 Alex Thorlton                2014-04-07  1127  	} else {
380369ea2e9d3c4 Thorsten Blum                2025-12-15  1128  		__mm_flags_overwrite_word(mm, coredump_filter);
^1da177e4c3f415 Linus Torvalds               2005-04-16  1129  		mm->def_flags = 0;
a0715cc22601e88 Alex Thorlton                2014-04-07  1130  	}
a0715cc22601e88 Alex Thorlton                2014-04-07  1131  
41f727fde1fe40e Vladimir Davydov             2014-08-08  1132  	if (mm_alloc_pgd(mm))
d7b3f52c861f54b Thomas Gleixner              2026-06-02  1133  		goto fail_mm_init;
41f727fde1fe40e Vladimir Davydov             2014-08-08  1134  
6af8cb80d3a9a6b David Hildenbrand            2025-03-03  1135  	if (mm_alloc_id(mm))
6af8cb80d3a9a6b David Hildenbrand            2025-03-03  1136  		goto fail_noid;
6af8cb80d3a9a6b David Hildenbrand            2025-03-03  1137  
41f727fde1fe40e Vladimir Davydov             2014-08-08  1138  	if (init_new_context(p, mm))
41f727fde1fe40e Vladimir Davydov             2014-08-08  1139  		goto fail_nocontext;
41f727fde1fe40e Vladimir Davydov             2014-08-08  1140  
7e019dcc470f270 Mathieu Desnoyers            2024-10-09  1141  	if (mm_alloc_cid(mm, p))
223baf9d17f25e2 Mathieu Desnoyers            2023-04-20  1142  		goto fail_cid;
223baf9d17f25e2 Mathieu Desnoyers            2023-04-20  1143  
df0d98475954d65 Peter Zijlstra (Intel        2026-04-01  1144) 	if (mm_alloc_sched(mm))
df0d98475954d65 Peter Zijlstra (Intel        2026-04-01  1145) 		goto fail_sched;
df0d98475954d65 Peter Zijlstra (Intel        2026-04-01  1146) 
14ef95be6f5558f Mateusz Guzik                2023-08-23  1147  	if (percpu_counter_init_many(mm->rss_stat, 0, GFP_KERNEL_ACCOUNT,
14ef95be6f5558f Mateusz Guzik                2023-08-23  1148  				     NR_MM_COUNTERS))
f1a7941243c102a Shakeel Butt                 2022-10-24  1149  		goto fail_pcpu;
f1a7941243c102a Shakeel Butt                 2022-10-24  1150  
bd74fdaea146029 Yu Zhao                      2022-09-18  1151  	lru_gen_init_mm(mm);
^1da177e4c3f415 Linus Torvalds               2005-04-16  1152  	return mm;
78fb74669e80883 Pavel Emelianov              2008-02-07  1153  
f1a7941243c102a Shakeel Butt                 2022-10-24  1154  fail_pcpu:
df0d98475954d65 Peter Zijlstra (Intel        2026-04-01  1155) 	mm_destroy_sched(mm);
df0d98475954d65 Peter Zijlstra (Intel        2026-04-01  1156) fail_sched:
223baf9d17f25e2 Mathieu Desnoyers            2023-04-20  1157  	mm_destroy_cid(mm);
223baf9d17f25e2 Mathieu Desnoyers            2023-04-20  1158  fail_cid:
b20b0368c614c60 Mathieu Desnoyers            2023-03-30  1159  	destroy_context(mm);
41f727fde1fe40e Vladimir Davydov             2014-08-08  1160  fail_nocontext:
6af8cb80d3a9a6b David Hildenbrand            2025-03-03  1161  	mm_free_id(mm);
6af8cb80d3a9a6b David Hildenbrand            2025-03-03  1162  fail_noid:
41f727fde1fe40e Vladimir Davydov             2014-08-08  1163  	mm_free_pgd(mm);
56180dd20c19e5b Peter Zijlstra               2025-07-10  1164  fail_mm_init:
^1da177e4c3f415 Linus Torvalds               2005-04-16  1165  	free_mm(mm);
^1da177e4c3f415 Linus Torvalds               2005-04-16  1166  	return NULL;
^1da177e4c3f415 Linus Torvalds               2005-04-16  1167  }
^1da177e4c3f415 Linus Torvalds               2005-04-16  1168  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
