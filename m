Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1BE2B9B7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 00:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773880905; cv=none; b=REcAvYO34Pe58QrdNqEG2dTWXsMCGotfAu5xLwOp8p/rOtkNVRoOtWhN6TzfNQ7sinTnABU6KGwihEAcK5QGIErJp105d5Ab3fyxWlS4sPcRXZFz8JIEopLzNkZotoYmO3ipAYZm7TW4jXW8Vis0GIZyllK+DeJpYiQuQMVCwqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773880905; c=relaxed/simple;
	bh=YtmJGkXHQVnSgkLol9+GIAOOY39j9IUlCvX6sllwAls=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ufMQiPHrz0sD92NZjRXsfB0RWYipf9C6uq5kofKe3IBepHU+KkwoagVb1LzynAHo5GXWDGI82JDw+8LuyqBFFfEDmJ/pGOmH4Tax2cnSABqhur11M3X1V0/FfjDKsUuT5k2BbF+4xSB6TVqCyNuknC35fiZeTkoWCTh/2ZC1eKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rjya9TAE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rjya9TAE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773880905; x=1805416905;
  h=date:from:to:cc:subject:message-id;
  bh=YtmJGkXHQVnSgkLol9+GIAOOY39j9IUlCvX6sllwAls=;
  b=Rjya9TAEYEKc/cRSu91RxFdaLz3z8usVgqwGHXRp+M90zDfK4ihs0GHZ
   ESl8kmq2jleb5BWveiq02iHmIod47Wjng3hf3BGBn+hJOeq4nf51VzPBm
   R9tddg2zv2lNVb9Xp64A62QNmntW9I1RofwmwmgfggFt8N4VluHqkKWOH
   GLZm51gKWJP3iEJEHT8WClV9m+hWEUFMxKcPaR2WworsjyDoKWJjzSR8w
   3oJ0rckfK3w7IGLa65nx/yConkXfRTvPb5RcoLH+m+/horcjJibCdoosM
   HCeea1h7nzSDJ/zM7OZrbxWQmOpqE/Vw7dJ90Wu3xka2GR2yP/RHCbIjL
   w==;
X-CSE-ConnectionGUID: YGJPpwl9Rly87tmLlX/Fmg==
X-CSE-MsgGUID: OHHSbYtlRT+GcoADL9akNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="97560459"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="97560459"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 17:41:15 -0700
X-CSE-ConnectionGUID: Cwe/N7NYR9WC1LIy7gmumA==
X-CSE-MsgGUID: 4ahP/ZNbSxKz3LQfwVAflw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="220215582"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 18 Mar 2026 17:41:13 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w31Rn-0000000008Z-0FR0;
	Thu, 19 Mar 2026 00:41:11 +0000
Date: Thu, 19 Mar 2026 08:31:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 arch/arm64/kvm/pkvm.c:687:6: warning: variable 'pages' set but not used
Message-ID: <202603190830.HKCfgT9O-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sebastian,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   6eb497d3c55586eb46b43a2f0b0c5ec20a678c03
commit: 312ab0333e80d95c4c1f17fa07ceb344cec5313d [2/2] ANDROID: KVM: On guest exit ask Trustzone to relinquish the borrowed pages
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260319/202603190830.HKCfgT9O-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603190830.HKCfgT9O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603190830.HKCfgT9O-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/pkvm.c:687:6: warning: variable 'pages' set but not used [-Wunused-but-set-variable]
     687 |         u64 pages, nr_busy;
         |             ^
   1 warning generated.


vim +/pages +687 arch/arm64/kvm/pkvm.c

   679	
   680	static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 end)
   681	{
   682		struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
   683		pkvm_handle_t handle = kvm->arch.pkvm.handle;
   684		struct mm_struct *mm = current->mm;
   685		struct kvm_pinned_page *ppage;
   686		struct pkvm_mapping *mapping;
 > 687		u64 pages, nr_busy;
   688		int ret;
   689	
   690		if (!handle)
   691			return 0;
   692	
   693		for_each_mapping_in_range_safe(pgt, start, end, mapping) {
   694			int ret;
   695	
   696			WARN_ON(kvm_vm_is_protected(kvm));
   697	
   698			ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle,
   699							mapping->gfn, mapping->nr_pages);
   700	
   701			if (WARN_ON(ret))
   702				return ret;
   703	
   704			pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
   705			kfree(mapping);
   706		}
   707	
   708	retry:
   709		pages = 0;
   710		nr_busy = 0;
   711		ppage = kvm_pinned_pages_iter_first(&kvm->arch.pkvm.pinned_pages, start, end);
   712		while (ppage) {
   713			struct kvm_pinned_page *next = kvm_pinned_pages_iter_next(ppage, start, end);
   714	
   715			WARN_ON(!kvm_vm_is_protected(kvm));
   716			ret = __reclaim_dying_page(ppage, handle);
   717			cond_resched();
   718			if (ret == -EBUSY) {
   719				nr_busy++;
   720				ppage = next;
   721				continue;
   722			}
   723			WARN_ON(ret);
   724			unpin_user_pages_dirty_lock(&ppage->page, 1, true);
   725			account_locked_vm(mm, 1 << ppage->order, false);
   726			kvm_pinned_pages_remove(ppage, &kvm->arch.pkvm.pinned_pages);
   727			kfree(ppage);
   728			ppage = next;
   729		}
   730	
   731		if (nr_busy) {
   732			do {
   733				ret = kvm_call_hyp_nvhe(__pkvm_reclaim_dying_guest_ffa_resources,
   734							kvm->arch.pkvm.handle);
   735				WARN_ON(ret && ret != -EAGAIN);
   736				cond_resched();
   737			} while (ret == -EAGAIN);
   738			goto retry;
   739		}
   740	
   741		return 0;
   742	}
   743	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
