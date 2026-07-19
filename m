Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABBB23D281
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jul 2026 00:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784420399; cv=none; b=C5Qnuj61uVJQbsHlVeFkpXEl9pNRVC6V6hrhNpR0Gjg9fW/hgrxrw7V3/kk98TRM9EdY22A3XLRrhzTEPiU6kjukt1LNLwTepQ/a6HR6t5g5bjyWigTNDrQKjjwyDTqTyXP12ARd7CQrkT8CrG7dqadClzp2pebfrf9s+1kzNAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784420399; c=relaxed/simple;
	bh=5+jO+Bs0V+6WoVxiQj/+kmNy8c50YzpPgYdqGqdVqng=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jMLDipZo7nn79Vp0CVJQSswfqZ+emvheVf5NfHuxWtD0Z/4JkAE7S/yCeUll9CWio+yULywpsbKtk5d69tghkFZIGyCUFZ6wIRzbGOVEUSBs4VQXjVvEaUgiAdBIvfDxWA9VBoCN/HJSDkn9hsSevBaG4/Obdcequ9rULlxnxew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HUBMZJr1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUBMZJr1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784420395; x=1815956395;
  h=date:from:to:cc:subject:message-id;
  bh=5+jO+Bs0V+6WoVxiQj/+kmNy8c50YzpPgYdqGqdVqng=;
  b=HUBMZJr11VjzYEI/7vcbw+vF0AGLnM7PYKk4ngnYmuBnX8307TbKta+T
   icGbZ4lCJg32T1Yu/oBDMv18sCQaUnkACIHMWERDrV1U7JbgW5K+ALaYN
   Q2S3DVJsa+moxO9jU0KrvNmN2vErdRtP6uq2H+H5HTCwWDnOozlRFtivr
   c2KgCJCqH3EEAWWevrJJtxnwrXMpgJWy58C+XzDjnvguPlhxjOcWZAKq8
   TL6zc2STPpqjpZ1DtBdLiFsJpfZkT1Z7ybAkl4nkvU6TyN84Rekt3Ga2w
   rQeXvVg+geYTKFjYg36E66CO7nbQM9BM5z7EJgcgxoIn23zo50htFp2QD
   Q==;
X-CSE-ConnectionGUID: 4/ajIoR+Sq2KiC+QS+Uffw==
X-CSE-MsgGUID: rJMHS9g8QcKWZnQkGnLhhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="84816507"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="84816507"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 17:19:54 -0700
X-CSE-ConnectionGUID: Ny7/fNO3Rh21wUswWFRCjQ==
X-CSE-MsgGUID: sNekNs9NRaSa3JibLvRQ4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="295301780"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Jul 2026 17:19:54 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlFG2-00000000VCy-3kPV;
	Sun, 19 Jul 2026 00:19:50 +0000
Date: Sun, 19 Jul 2026 08:19:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 192/192]
 arch/arm64/kvm/hyp/nvhe/mem_protect.c:635:5: warning: no previous prototype
 for function '__pkvm_host_set_stage2_memattr'
Message-ID: <202607190841.8HdfABl6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   15bdff0dd01eed4ffc4ae138c5a611d8b102a4b6
commit: d56ad709773a90012b44e87c0c233faebdcf5823 [192/192] ANDROID: arm64: Implement hypervisor workaround for SoCs with DMA beyond the PoC
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260719/202607190841.8HdfABl6-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260719/202607190841.8HdfABl6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607190841.8HdfABl6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/mem_protect.c:635:5: warning: no previous prototype for function '__pkvm_host_set_stage2_memattr' [-Wmissing-prototypes]
     635 | int __pkvm_host_set_stage2_memattr(phys_addr_t phys, bool force_nc)
         |     ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:635:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     635 | int __pkvm_host_set_stage2_memattr(phys_addr_t phys, bool force_nc)
         | ^
         | static 
   1 warning generated.


vim +/__pkvm_host_set_stage2_memattr +635 arch/arm64/kvm/hyp/nvhe/mem_protect.c

   634	
 > 635	int __pkvm_host_set_stage2_memattr(phys_addr_t phys, bool force_nc)
   636	{
   637		kvm_pte_t pte;
   638		int ret = 0;
   639	
   640		if (!static_branch_unlikely(&pkvm_force_nc))
   641			return -ENOENT;
   642	
   643		phys = ALIGN_DOWN(phys, PAGE_SIZE);
   644		hyp_spin_lock(&host_mmu.lock);
   645	
   646		ret = kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, NULL);
   647		if (ret)
   648			goto unlock;
   649	
   650		if (!addr_is_memory(phys)) {
   651			ret = -EIO;
   652			goto unlock;
   653		}
   654	
   655		if (!kvm_pte_valid(pte) && pte) {
   656			switch (pte) {
   657			case DEFERRED_MEMATTR_NOTE:
   658				break;
   659			default:
   660				ret = -EPERM;
   661			}
   662		} else if (host_get_page_state(pte, phys) != PKVM_PAGE_OWNED) {
   663			ret = -EPERM;
   664		}
   665	
   666		if (ret)
   667			goto unlock;
   668	
   669		if (force_nc) {
   670			ret = host_stage2_idmap_locked(phys, PAGE_SIZE,
   671						       PKVM_HOST_MEM_PROT |
   672						       KVM_PGTABLE_PROT_NC,
   673						       false);
   674			if (ret)
   675				goto unlock;
   676	
   677			kvm_flush_dcache_to_poc(hyp_fixmap_map_nc(phys), PAGE_SIZE);
   678			hyp_fixmap_unmap();
   679		} else {
   680			ret = kvm_pgtable_stage2_annotate(&host_mmu.pgt, phys,
   681							  PAGE_SIZE, &host_s2_pool,
   682							  DEFERRED_MEMATTR_NOTE);
   683		}
   684	unlock:
   685		hyp_spin_unlock(&host_mmu.lock);
   686		return ret;
   687	}
   688	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
