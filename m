Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDA138C651
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 14:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765982694; cv=none; b=N/lhTPXBlkoFFI+7G5/HhpQmhfxZ1pH7UESGVVKTjQqAGhJKYjMJX3FXo0R/BihH1RidnV2KyzdL3fqZx+SXXH3h8iUKoMbCIzkdPbtTcF4GWiVSYIwJ6K4+R6dZN/q3gNYA5LdbbQnGxXorhxPRrgfJPuy1h839uzyq8aqf3ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765982694; c=relaxed/simple;
	bh=Zbo5B5B0tCSixEeAjnxbhdpYG+DgiLVrKjpPJn8eSHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TwcxiNYXrBIe+nqhW5xITJ+pWMX1BG37cTpy5MAOvGWWK4zP6HDJL2vVFdU0J/CwS4ZJfZyk1H0A29eMZ2lkqUY+2v6HOJnpnLme5oCh3fEJkD5SHOZdh+eDXHYOcUxj4Lgj1yOFmmqZIBzzx+Yov49MI9oHTPPI/cSZDN0Rmig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hsL4pNT1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsL4pNT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765982693; x=1797518693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zbo5B5B0tCSixEeAjnxbhdpYG+DgiLVrKjpPJn8eSHw=;
  b=hsL4pNT1FqvxS8qOn5uBqHc1fwCtBPPCBCTFcD+YRi1KtEMf2bI0V2fX
   eWNVuGT2JZYzXLwFIFOrUSI2QBOjv9QuBZx25rJMR9Wy83KExdJ9+o5uq
   4Fgvw3pMmKDsVyS5i2o2A5TSR+JxxKM2CdQ8ZTiQ9BjbfyMqC06eTmG4A
   zHnDaq9tQQocYs5WovvlGTu5MH74bkq2AXC/5AW0QnarjRW8xaCsbtbrQ
   ZMa11lht1ge3WQ2xuIg3oEIqCJLXlWGPUGdn4PN8zfHjH7J8BrNyR1C9v
   HjrJGxR55rKTzggKXIy6OCRFiLuwiQJi0ydLlfIbY4Cm6vE8wTcjH4P+D
   w==;
X-CSE-ConnectionGUID: 1EKec/ROScehUKKEJeB7RQ==
X-CSE-MsgGUID: k1bjSEhIQpay3k5Lrha0OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79289974"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="79289974"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 06:44:51 -0800
X-CSE-ConnectionGUID: ct/wRNjsTmGcYGOgYnoKzg==
X-CSE-MsgGUID: 6gf7PITrRhirowWT5C0/1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="235735533"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Dec 2025 06:44:50 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVslj-000000000nF-1WCB;
	Wed, 17 Dec 2025 14:44:47 +0000
Date: Wed, 17 Dec 2025 22:44:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-05 2/2]
 arch/arm64/kvm/hyp/nvhe/mem_protect.c:635:5: warning: no previous prototype
 for function '__pkvm_host_set_stage2_memattr'
Message-ID: <202512172205.YNlNSgnn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-05
head:   ba1ec287446a6073710b310cc18a37b90b5d2910
commit: d56ad709773a90012b44e87c0c233faebdcf5823 [2/2] ANDROID: arm64: Implement hypervisor workaround for SoCs with DMA beyond the PoC
config: arm64-randconfig-003-20251217 (https://download.01.org/0day-ci/archive/20251217/202512172205.YNlNSgnn-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512172205.YNlNSgnn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512172205.YNlNSgnn-lkp@intel.com/

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
