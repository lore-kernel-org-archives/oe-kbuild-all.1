Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C85D2701CF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 15:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766502087; cv=none; b=aZrvoavJudrTrJT/yehHCemHu2b+EvjPN6eQImP8ISj48+I8/mtgCJVZRH1bpYmYb699mf1su6WbW6ntfqbJGXBnKTV8w8nCE9KZ9ouLJAxbX7ggVwcG6rKYpxGm+ZCmPhPOyCpYEcv1s97TzHoEvHd9J8BY8KNWEfE5TCGKPpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766502087; c=relaxed/simple;
	bh=PD+EpiJAe+4y48SySV6x4ZLXwe0npMinN8kKjCDtMcI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DjB7YqhPmH5EcQS3yNlIkshGT8EARfZyySNK0lJpDdC/upvWc/JNxYi9c4F7wYYoC6/anlrQID06vyrO3SEJWhnXpnMuSsZTEnqkUHgwg2nmkXsrjAZjmuAbHY7ZKppk1+OVxdUWm4PH4ekONHn29Y2IyyEXdi61I6AnJawkZ4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dzu1Hv1u; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dzu1Hv1u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766502085; x=1798038085;
  h=date:from:to:cc:subject:message-id;
  bh=PD+EpiJAe+4y48SySV6x4ZLXwe0npMinN8kKjCDtMcI=;
  b=dzu1Hv1u9fbzYKk0cObDz3fr4vlASor2kJe1Fm/6JYd0O0vG1zF/tXw/
   /DizB8JVPJ4iCKAPOaIj7AFhPg8u7BBlU4EevC10sAGG1bPJ0pvZo2Yo9
   uneXlt2+clbu7w6GYJGL2dAtUuQpsGx2VkDqggVh9/gHp/1p3Crh05++N
   Xme1Go94SV+ZplLnRO0brUGLb9SikL8gwinp8C1AOp/pbFsXEPJ+hr4tG
   1vaFjT59eZB8YNAxULZobbkfi+CudOehl/4a433iOy8tYTnCQhiy+JR4W
   Vxrk1JX6kdKXGzZ9ZV0haebvBgTc6L9y9NbpRWJDfCSDZlxrHEC+PZ5NV
   A==;
X-CSE-ConnectionGUID: SedwL6faSuWr9Jbr6iSubA==
X-CSE-MsgGUID: 7iv0007GSTuFYo3C2s2ryQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79069886"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="79069886"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 07:01:22 -0800
X-CSE-ConnectionGUID: V8LaIdSUS3qo8FnD7P6H0Q==
X-CSE-MsgGUID: STYWOYhtQ86ilR2TaFAXHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="199559862"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 Dec 2025 07:01:21 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY3sp-0000000022T-3gBP;
	Tue, 23 Dec 2025 15:01:10 +0000
Date: Tue, 23 Dec 2025 23:00:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1] mm/memory.c:5148:
 warning: Function parameter or member 'mm' not described in
 'mm_account_fault'
Message-ID: <202512232224.xSAyjfv3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Suren,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b952cc514e6f0e92951693f5131909bb1264ded3
commit: a264d8efcb8f7231898dc4cb306ef8e20e6e285e [1/1] BACKPORT: mm: do not increment pgfault stats when page fault handler retries
config: x86_64-randconfig-r071-20251223 (https://download.01.org/0day-ci/archive/20251223/202512232224.xSAyjfv3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512232224.xSAyjfv3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512232224.xSAyjfv3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory.c:1714: warning: Function parameter or member 'start_t' not described in 'unmap_vmas'
   mm/memory.c:1714: warning: Function parameter or member 'end_t' not described in 'unmap_vmas'
   mm/memory.c:1714: warning: Function parameter or member 'mm_wr_locked' not described in 'unmap_vmas'
>> mm/memory.c:5148: warning: Function parameter or member 'mm' not described in 'mm_account_fault'


vim +5148 mm/memory.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  5129  
bce617edecada0 Peter Xu           2020-08-11  5130  /**
f0953a1bbaca71 Ingo Molnar        2021-05-06  5131   * mm_account_fault - Do page fault accounting
bce617edecada0 Peter Xu           2020-08-11  5132   *
bce617edecada0 Peter Xu           2020-08-11  5133   * @regs: the pt_regs struct pointer.  When set to NULL, will skip accounting
bce617edecada0 Peter Xu           2020-08-11  5134   *        of perf event counters, but we'll still do the per-task accounting to
bce617edecada0 Peter Xu           2020-08-11  5135   *        the task who triggered this page fault.
bce617edecada0 Peter Xu           2020-08-11  5136   * @address: the faulted address.
bce617edecada0 Peter Xu           2020-08-11  5137   * @flags: the fault flags.
bce617edecada0 Peter Xu           2020-08-11  5138   * @ret: the fault retcode.
bce617edecada0 Peter Xu           2020-08-11  5139   *
f0953a1bbaca71 Ingo Molnar        2021-05-06  5140   * This will take care of most of the page fault accounting.  Meanwhile, it
bce617edecada0 Peter Xu           2020-08-11  5141   * will also include the PERF_COUNT_SW_PAGE_FAULTS_[MAJ|MIN] perf counter
f0953a1bbaca71 Ingo Molnar        2021-05-06  5142   * updates.  However, note that the handling of PERF_COUNT_SW_PAGE_FAULTS should
bce617edecada0 Peter Xu           2020-08-11  5143   * still be in per-arch page fault handlers at the entry of page fault.
bce617edecada0 Peter Xu           2020-08-11  5144   */
a264d8efcb8f72 Suren Baghdasaryan 2023-04-19  5145  static inline void mm_account_fault(struct mm_struct *mm, struct pt_regs *regs,
bce617edecada0 Peter Xu           2020-08-11  5146  				    unsigned long address, unsigned int flags,
bce617edecada0 Peter Xu           2020-08-11  5147  				    vm_fault_t ret)
bce617edecada0 Peter Xu           2020-08-11 @5148  {
bce617edecada0 Peter Xu           2020-08-11  5149  	bool major;
bce617edecada0 Peter Xu           2020-08-11  5150  
a264d8efcb8f72 Suren Baghdasaryan 2023-04-19  5151  	/* Incomplete faults will be accounted upon completion. */
a264d8efcb8f72 Suren Baghdasaryan 2023-04-19  5152  	if (ret & VM_FAULT_RETRY)
a264d8efcb8f72 Suren Baghdasaryan 2023-04-19  5153  		return;
a264d8efcb8f72 Suren Baghdasaryan 2023-04-19  5154  
bce617edecada0 Peter Xu           2020-08-11  5155  	/*
a264d8efcb8f72 Suren Baghdasaryan 2023-04-19  5156  	 * To preserve the behavior of older kernels, PGFAULT counters record
a264d8efcb8f72 Suren Baghdasaryan 2023-04-19  5157  	 * both successful and failed faults, as opposed to perf counters,
a264d8efcb8f72 Suren Baghdasaryan 2023-04-19  5158  	 * which ignore failed cases.
a264d8efcb8f72 Suren Baghdasaryan 2023-04-19  5159  	 */
a264d8efcb8f72 Suren Baghdasaryan 2023-04-19  5160  	count_vm_event(PGFAULT);
a264d8efcb8f72 Suren Baghdasaryan 2023-04-19  5161  	count_memcg_event_mm(mm, PGFAULT);
a264d8efcb8f72 Suren Baghdasaryan 2023-04-19  5162  
a264d8efcb8f72 Suren Baghdasaryan 2023-04-19  5163  	/*
a264d8efcb8f72 Suren Baghdasaryan 2023-04-19  5164  	 * Do not account for unsuccessful faults (e.g. when the address wasn't
a264d8efcb8f72 Suren Baghdasaryan 2023-04-19  5165  	 * valid).  That includes arch_vma_access_permitted() failing before
a264d8efcb8f72 Suren Baghdasaryan 2023-04-19  5166  	 * reaching here. So this is not a "this many hardware page faults"
a264d8efcb8f72 Suren Baghdasaryan 2023-04-19  5167  	 * counter.  We should use the hw profiling for that.
bce617edecada0 Peter Xu           2020-08-11  5168  	 */
a264d8efcb8f72 Suren Baghdasaryan 2023-04-19  5169  	if (ret & VM_FAULT_ERROR)
bce617edecada0 Peter Xu           2020-08-11  5170  		return;
bce617edecada0 Peter Xu           2020-08-11  5171  
bce617edecada0 Peter Xu           2020-08-11  5172  	/*
bce617edecada0 Peter Xu           2020-08-11  5173  	 * We define the fault as a major fault when the final successful fault
bce617edecada0 Peter Xu           2020-08-11  5174  	 * is VM_FAULT_MAJOR, or if it retried (which implies that we couldn't
bce617edecada0 Peter Xu           2020-08-11  5175  	 * handle it immediately previously).
bce617edecada0 Peter Xu           2020-08-11  5176  	 */
bce617edecada0 Peter Xu           2020-08-11  5177  	major = (ret & VM_FAULT_MAJOR) || (flags & FAULT_FLAG_TRIED);
bce617edecada0 Peter Xu           2020-08-11  5178  
a2beb5f1efede6 Peter Xu           2020-08-11  5179  	if (major)
a2beb5f1efede6 Peter Xu           2020-08-11  5180  		current->maj_flt++;
a2beb5f1efede6 Peter Xu           2020-08-11  5181  	else
a2beb5f1efede6 Peter Xu           2020-08-11  5182  		current->min_flt++;
a2beb5f1efede6 Peter Xu           2020-08-11  5183  
bce617edecada0 Peter Xu           2020-08-11  5184  	/*
a2beb5f1efede6 Peter Xu           2020-08-11  5185  	 * If the fault is done for GUP, regs will be NULL.  We only do the
a2beb5f1efede6 Peter Xu           2020-08-11  5186  	 * accounting for the per thread fault counters who triggered the
a2beb5f1efede6 Peter Xu           2020-08-11  5187  	 * fault, and we skip the perf event updates.
bce617edecada0 Peter Xu           2020-08-11  5188  	 */
bce617edecada0 Peter Xu           2020-08-11  5189  	if (!regs)
bce617edecada0 Peter Xu           2020-08-11  5190  		return;
bce617edecada0 Peter Xu           2020-08-11  5191  
a2beb5f1efede6 Peter Xu           2020-08-11  5192  	if (major)
bce617edecada0 Peter Xu           2020-08-11  5193  		perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MAJ, 1, regs, address);
a2beb5f1efede6 Peter Xu           2020-08-11  5194  	else
bce617edecada0 Peter Xu           2020-08-11  5195  		perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MIN, 1, regs, address);
bce617edecada0 Peter Xu           2020-08-11  5196  }
bce617edecada0 Peter Xu           2020-08-11  5197  

:::::: The code at line 5148 was first introduced by commit
:::::: bce617edecada007aee8610fbe2c14d10b8de2f6 mm: do page fault accounting in handle_mm_fault

:::::: TO: Peter Xu <peterx@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
