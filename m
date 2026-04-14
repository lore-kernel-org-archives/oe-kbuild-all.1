Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9373DCD94
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 23:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776210680; cv=none; b=h0oLxahbmEygTYhFFvpvz9rqIHv52aWIqieC5wYfLNU4ZuWoK7KFzsPM8Rf4p1l5q6/lvMcGzNR2Jn8SgMgbaUeV4Aj128NNC5Pvm38CDnRBmmemA29CfYM3TJpDHql8ZSjo1T5gXR6bGrH6tOWwqBNgaunRuiM4BYH8fJvKRfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776210680; c=relaxed/simple;
	bh=tp/mgvD3JO2WiPTxR13/4NtBkcaznBe//fObObOw5lo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZD0+kHg4EVi/fmsRmihote5AFE6kBjnGsnafrETgtCnLHEnaejtH3IgLgQ+M44vIO/Ve6YEpPXXxmA9Ji4Hx1pKLOqSJsT5SvdA65hCQZYG1SzllhjdLPLG0a5/bRToTvIxY0BjQ+OC6DZxAwr//dUOXNAbHvvR3h4d0OSjqj+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awD90jk6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awD90jk6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776210679; x=1807746679;
  h=date:from:to:cc:subject:message-id;
  bh=tp/mgvD3JO2WiPTxR13/4NtBkcaznBe//fObObOw5lo=;
  b=awD90jk6Gw850aIkfZ4hFcmf7+WASrJ7jMwmX2EkQoeoqtSJVpKdAXX8
   Vna2ZMk2UP9uAVG+1k2W8E1KtqYxeyzNRdLjTc26ypJ0mnyIreQXD8ogq
   j15acWXjrweIl81Y+3JQKU5JHieH3OC5UrzHVv7mmmzsHzg1Nt8kSnMh3
   UF71Rws6sq3tBtQOHy+hOkAp/0E2gue3Rv0OFJOPmGnMo3lNeG8gg0vOK
   9bKUXgyqsG8VEpxvf+zfx6P5RuwnDKYkFhrAMkhyRuEkk1CnyOjzZ93Fs
   J2DbI2XVxkWg2nZwASNyZ8X7MsMA4AvUMs+IdTREuFRuOcYMM4b12cevA
   Q==;
X-CSE-ConnectionGUID: ow2+6Wj0TTqS8JKpY4wc/A==
X-CSE-MsgGUID: 7jCwHQzFS5uoF8gCVEE2Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="88561820"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="88561820"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 16:51:18 -0700
X-CSE-ConnectionGUID: ZfVDutjIT1O3U9rcY01qPg==
X-CSE-MsgGUID: kXVz+kH/SAGQRMGW5KZ1mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="227593914"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Apr 2026 16:51:16 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCnXG-000000001xd-21md;
	Tue, 14 Apr 2026 23:51:14 +0000
Date: Wed, 15 Apr 2026 07:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-2024-11 8/8]
 mm/mmap.c:3323:3: error: implicit declaration of function 'vm_flags_clear'
Message-ID: <202604150729.QR57wesJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-5.15-2024-11
head:   442891d6dba0b845c288888a0d6ba3da6798b764
commit: 442891d6dba0b845c288888a0d6ba3da6798b764 [8/8] ANDROID: 16K: improve robustness of vma padding logic
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260415/202604150729.QR57wesJ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604150729.QR57wesJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604150729.QR57wesJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mmap.c:3323:3: error: implicit declaration of function 'vm_flags_clear' [-Werror,-Wimplicit-function-declaration]
    3323 |                 vm_flags_clear(new_vma, VM_PAD_MASK);
         |                 ^
   1 error generated.


vim +/vm_flags_clear +3323 mm/mmap.c

  3266	
  3267	/*
  3268	 * Copy the vma structure to a new location in the same mm,
  3269	 * prior to moving page table entries, to effect an mremap move.
  3270	 */
  3271	struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
  3272		unsigned long addr, unsigned long len, pgoff_t pgoff,
  3273		bool *need_rmap_locks)
  3274	{
  3275		struct vm_area_struct *vma = *vmap;
  3276		unsigned long vma_start = vma->vm_start;
  3277		struct mm_struct *mm = vma->vm_mm;
  3278		struct vm_area_struct *new_vma, *prev;
  3279		struct rb_node **rb_link, *rb_parent;
  3280		bool faulted_in_anon_vma = true;
  3281	
  3282		/*
  3283		 * If anonymous vma has not yet been faulted, update new pgoff
  3284		 * to match new location, to increase its chance of merging.
  3285		 */
  3286		if (unlikely(vma_is_anonymous(vma) && !vma->anon_vma)) {
  3287			pgoff = addr >> PAGE_SHIFT;
  3288			faulted_in_anon_vma = false;
  3289		}
  3290	
  3291		if (find_vma_links(mm, addr, addr + len, &prev, &rb_link, &rb_parent))
  3292			return NULL;	/* should never get here */
  3293		new_vma = vma_merge(mm, prev, addr, addr + len, vma->vm_flags,
  3294				    vma->anon_vma, vma->vm_file, pgoff, vma_policy(vma),
  3295				    vma->vm_userfaultfd_ctx, anon_vma_name(vma));
  3296		if (new_vma) {
  3297			/*
  3298			 * Source vma may have been merged into new_vma
  3299			 */
  3300			if (unlikely(vma_start >= new_vma->vm_start &&
  3301				     vma_start < new_vma->vm_end)) {
  3302				/*
  3303				 * The only way we can get a vma_merge with
  3304				 * self during an mremap is if the vma hasn't
  3305				 * been faulted in yet and we were allowed to
  3306				 * reset the dst vma->vm_pgoff to the
  3307				 * destination address of the mremap to allow
  3308				 * the merge to happen. mremap must change the
  3309				 * vm_pgoff linearity between src and dst vmas
  3310				 * (in turn preventing a vma_merge) to be
  3311				 * safe. It is only safe to keep the vm_pgoff
  3312				 * linear if there are no pages mapped yet.
  3313				 */
  3314				VM_BUG_ON_VMA(faulted_in_anon_vma, new_vma);
  3315				*vmap = vma = new_vma;
  3316			}
  3317			*need_rmap_locks = (new_vma->vm_pgoff <= vma->vm_pgoff);
  3318		} else {
  3319			new_vma = vm_area_dup(vma);
  3320			if (!new_vma)
  3321				goto out;
  3322			/* Do not preserve padding flags on the new VMA */
> 3323			vm_flags_clear(new_vma, VM_PAD_MASK);
  3324			new_vma->vm_start = addr;
  3325			new_vma->vm_end = addr + len;
  3326			new_vma->vm_pgoff = pgoff;
  3327			if (vma_dup_policy(vma, new_vma))
  3328				goto out_free_vma;
  3329			if (anon_vma_clone(new_vma, vma))
  3330				goto out_free_mempol;
  3331			if (new_vma->vm_file)
  3332				get_file(new_vma->vm_file);
  3333			if (new_vma->vm_ops && new_vma->vm_ops->open)
  3334				new_vma->vm_ops->open(new_vma);
  3335			vma_link(mm, new_vma, prev, rb_link, rb_parent);
  3336			*need_rmap_locks = false;
  3337		}
  3338		return new_vma;
  3339	
  3340	out_free_mempol:
  3341		mpol_put(vma_policy(new_vma));
  3342	out_free_vma:
  3343		new_vma->vm_file = NULL;	/* Prevent fput within vm_area_free */
  3344		vm_area_free(new_vma);
  3345	out:
  3346		return NULL;
  3347	}
  3348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
