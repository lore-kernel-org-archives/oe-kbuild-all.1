Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103729;
	b=sni6EgH0NSvJDKKZoOUhSwDIT09T3O3JyA7taP8mWpt3oJ9VoQ1W+hGi7zGkJ7+4FIL2
	 VP/yEm4hz4LuXCIDLS9kHEm+Q2aZPWJpbDRuvCCc6VWga4xHQQA3n9AwhMG+ftrlvI2OG
	 eSVHD5R4EMOJweH1asUOswLjQG4+YKsP39RPDcPpJgcgW4NTM0F/bUwShJywchKgEB4Qh
	 d8V1hV3SHS7hzhoprqCjJsx77q34rIeZSLsU6uTSMyHpiufWvpT7xCJWBlUbgNIlYc5ru
	 qce9kTpZg1OisaLx0zDOMYYwtPt4P9OjerOy96QrbrBM5p8Q8QzScXPRatk6OwmJlAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103729;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=OHD1xd3oMRjS5hl/voaYzujUMEQGcY/W1wj9dYU5WWU=;
	b=DUlIj99V74pIbxzI/B33TYe5M1pJAfEj8QqmOeYwSJIM4FqNCDa7x2Liiso1H1OHyGtw
	 xMB94U1BkELIMWquYRWj5363KFLTzvMrPtbDOremhrDQ1bEkUmRVzB6mZlVP6ceCzl+eS
	 OGRVVnQqjWUtam1HQM5Yq7i+qpizq6QD0Cr7vobYpSAJ1QPV4VMgF7s4wPkVr/1VyRjd2
	 WR1UpLjjqJvD7UznND81qTdh0oajfXTzTG1kfVfOuyLTlOXy/6aMef85KIvhBNdJfI3At
	 RVWmATA/uG4ETj/FdGHkxwRvP1vBXEGx4FlZAXd/XDYPM+/QcHF1lr/E8lg1bpynKMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QFKjrXFN;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FE0606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 12:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17FE0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QFKjrXFN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793103727; x=1824639727;
  h=date:from:to:cc:subject:message-id;
  bh=x6opcbUtgOySxspT80Hm96n7paxENupOg4wNuN6wKgE=;
  b=QFKjrXFNfL88ygGm80zn6wek/C0asDglss7rMysayei1/N41RK7eKkpE
   ohzgeX9DsbcGcfcUEbgNZH9eZcjLcuGpdyK60X2ts6RwDc0iD9xerElqV
   34z8IDcMr5KqQhHop7MefiuZwyH8b2ROQI1wvD5SV/SSBfm8dJ7QBK8e8
   Haz2yRHqWT7p9r2wTKZSW/KqTjWvPu77OLm5NXgxZh5tE7mIvrySVGFzw
   9QDxNufl6JhxUKb7DQtnNZP9NRsb0hk5Lc/EBzSbfmw9ZaBWTJjwNH6z0
   Sh4gL7Hr0q3GH017VLzzSQhJUskaJ0KGu6bUfW0JtJ1VwNlZ9G/67lTbG
   w==;
X-CSE-ConnectionGUID: 5vNt7Q/FRly8NEia9vCbPQ==
X-CSE-MsgGUID: O8vT7B7USLauFMS7Ya9vHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1696932"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1696932"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 05:22:07 -0700
X-CSE-ConnectionGUID: KZVwg6kLRlah072VP3bk/w==
X-CSE-MsgGUID: 9OQrG+ncRZaWmazY4qPytg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6286272"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 27 Oct 2026 05:22:05 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLgBn-000000004Vb-1Zzg;
	Tue, 27 Oct 2026 12:22:03 +0000
Date: Tue, 27 Oct 2026 13:21:19 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 353/353]
 mm/memory.c:5148: warning: Function parameter or member 'mm' not described in
 'mm_account_fault'
Message-ID: <202610271351.bxqnXgqU-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Suren,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   6ca4787fdbe204dba4600d14ca6fc75484ddccf2
commit: a264d8efcb8f7231898dc4cb306ef8e20e6e285e [353/353] BACKPORT: mm: do not increment pgfault stats when page fault handler retries
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261027/202610271351.bxqnXgqU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271351.bxqnXgqU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271351.bxqnXgqU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory.c:1714: warning: Function parameter or member 'start_t' not described in 'unmap_vmas'
   mm/memory.c:1714: warning: Function parameter or member 'end_t' not described in 'unmap_vmas'
   mm/memory.c:1714: warning: Function parameter or member 'mm_wr_locked' not described in 'unmap_vmas'
>> mm/memory.c:5148: warning: Function parameter or member 'mm' not described in 'mm_account_fault'


vim +5148 mm/memory.c

^1da177e4c3f415 Linus Torvalds     2005-04-16  5129  
bce617edecada00 Peter Xu           2020-08-11  5130  /**
f0953a1bbaca71e Ingo Molnar        2021-05-06  5131   * mm_account_fault - Do page fault accounting
bce617edecada00 Peter Xu           2020-08-11  5132   *
bce617edecada00 Peter Xu           2020-08-11  5133   * @regs: the pt_regs struct pointer.  When set to NULL, will skip accounting
bce617edecada00 Peter Xu           2020-08-11  5134   *        of perf event counters, but we'll still do the per-task accounting to
bce617edecada00 Peter Xu           2020-08-11  5135   *        the task who triggered this page fault.
bce617edecada00 Peter Xu           2020-08-11  5136   * @address: the faulted address.
bce617edecada00 Peter Xu           2020-08-11  5137   * @flags: the fault flags.
bce617edecada00 Peter Xu           2020-08-11  5138   * @ret: the fault retcode.
bce617edecada00 Peter Xu           2020-08-11  5139   *
f0953a1bbaca71e Ingo Molnar        2021-05-06  5140   * This will take care of most of the page fault accounting.  Meanwhile, it
bce617edecada00 Peter Xu           2020-08-11  5141   * will also include the PERF_COUNT_SW_PAGE_FAULTS_[MAJ|MIN] perf counter
f0953a1bbaca71e Ingo Molnar        2021-05-06  5142   * updates.  However, note that the handling of PERF_COUNT_SW_PAGE_FAULTS should
bce617edecada00 Peter Xu           2020-08-11  5143   * still be in per-arch page fault handlers at the entry of page fault.
bce617edecada00 Peter Xu           2020-08-11  5144   */
a264d8efcb8f723 Suren Baghdasaryan 2023-04-19  5145  static inline void mm_account_fault(struct mm_struct *mm, struct pt_regs *regs,
bce617edecada00 Peter Xu           2020-08-11  5146  				    unsigned long address, unsigned int flags,
bce617edecada00 Peter Xu           2020-08-11  5147  				    vm_fault_t ret)
bce617edecada00 Peter Xu           2020-08-11 @5148  {
bce617edecada00 Peter Xu           2020-08-11  5149  	bool major;
bce617edecada00 Peter Xu           2020-08-11  5150  
a264d8efcb8f723 Suren Baghdasaryan 2023-04-19  5151  	/* Incomplete faults will be accounted upon completion. */
a264d8efcb8f723 Suren Baghdasaryan 2023-04-19  5152  	if (ret & VM_FAULT_RETRY)
a264d8efcb8f723 Suren Baghdasaryan 2023-04-19  5153  		return;
a264d8efcb8f723 Suren Baghdasaryan 2023-04-19  5154  
bce617edecada00 Peter Xu           2020-08-11  5155  	/*
a264d8efcb8f723 Suren Baghdasaryan 2023-04-19  5156  	 * To preserve the behavior of older kernels, PGFAULT counters record
a264d8efcb8f723 Suren Baghdasaryan 2023-04-19  5157  	 * both successful and failed faults, as opposed to perf counters,
a264d8efcb8f723 Suren Baghdasaryan 2023-04-19  5158  	 * which ignore failed cases.
a264d8efcb8f723 Suren Baghdasaryan 2023-04-19  5159  	 */
a264d8efcb8f723 Suren Baghdasaryan 2023-04-19  5160  	count_vm_event(PGFAULT);
a264d8efcb8f723 Suren Baghdasaryan 2023-04-19  5161  	count_memcg_event_mm(mm, PGFAULT);
a264d8efcb8f723 Suren Baghdasaryan 2023-04-19  5162  
a264d8efcb8f723 Suren Baghdasaryan 2023-04-19  5163  	/*
a264d8efcb8f723 Suren Baghdasaryan 2023-04-19  5164  	 * Do not account for unsuccessful faults (e.g. when the address wasn't
a264d8efcb8f723 Suren Baghdasaryan 2023-04-19  5165  	 * valid).  That includes arch_vma_access_permitted() failing before
a264d8efcb8f723 Suren Baghdasaryan 2023-04-19  5166  	 * reaching here. So this is not a "this many hardware page faults"
a264d8efcb8f723 Suren Baghdasaryan 2023-04-19  5167  	 * counter.  We should use the hw profiling for that.
bce617edecada00 Peter Xu           2020-08-11  5168  	 */
a264d8efcb8f723 Suren Baghdasaryan 2023-04-19  5169  	if (ret & VM_FAULT_ERROR)
bce617edecada00 Peter Xu           2020-08-11  5170  		return;
bce617edecada00 Peter Xu           2020-08-11  5171  
bce617edecada00 Peter Xu           2020-08-11  5172  	/*
bce617edecada00 Peter Xu           2020-08-11  5173  	 * We define the fault as a major fault when the final successful fault
bce617edecada00 Peter Xu           2020-08-11  5174  	 * is VM_FAULT_MAJOR, or if it retried (which implies that we couldn't
bce617edecada00 Peter Xu           2020-08-11  5175  	 * handle it immediately previously).
bce617edecada00 Peter Xu           2020-08-11  5176  	 */
bce617edecada00 Peter Xu           2020-08-11  5177  	major = (ret & VM_FAULT_MAJOR) || (flags & FAULT_FLAG_TRIED);
bce617edecada00 Peter Xu           2020-08-11  5178  
a2beb5f1efede69 Peter Xu           2020-08-11  5179  	if (major)
a2beb5f1efede69 Peter Xu           2020-08-11  5180  		current->maj_flt++;
a2beb5f1efede69 Peter Xu           2020-08-11  5181  	else
a2beb5f1efede69 Peter Xu           2020-08-11  5182  		current->min_flt++;
a2beb5f1efede69 Peter Xu           2020-08-11  5183  
bce617edecada00 Peter Xu           2020-08-11  5184  	/*
a2beb5f1efede69 Peter Xu           2020-08-11  5185  	 * If the fault is done for GUP, regs will be NULL.  We only do the
a2beb5f1efede69 Peter Xu           2020-08-11  5186  	 * accounting for the per thread fault counters who triggered the
a2beb5f1efede69 Peter Xu           2020-08-11  5187  	 * fault, and we skip the perf event updates.
bce617edecada00 Peter Xu           2020-08-11  5188  	 */
bce617edecada00 Peter Xu           2020-08-11  5189  	if (!regs)
bce617edecada00 Peter Xu           2020-08-11  5190  		return;
bce617edecada00 Peter Xu           2020-08-11  5191  
a2beb5f1efede69 Peter Xu           2020-08-11  5192  	if (major)
bce617edecada00 Peter Xu           2020-08-11  5193  		perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MAJ, 1, regs, address);
a2beb5f1efede69 Peter Xu           2020-08-11  5194  	else
bce617edecada00 Peter Xu           2020-08-11  5195  		perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MIN, 1, regs, address);
bce617edecada00 Peter Xu           2020-08-11  5196  }
bce617edecada00 Peter Xu           2020-08-11  5197  

:::::: The code at line 5148 was first introduced by commit
:::::: bce617edecada007aee8610fbe2c14d10b8de2f6 mm: do page fault accounting in handle_mm_fault

:::::: TO: Peter Xu <peterx@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
