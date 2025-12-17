Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3606495E5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 16:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989123; cv=none; b=LXYsFIepOC9Mp3mk3Qi+bd9cOXeaXuUVdP2auQf2afwhGwdQYqvX3USQ4lcz25LQEttplgwds3cJL0KEPzrblgmXt/4Bf6soxcqguYUB3eRnttPLREYr7l5cCahjlvvVyI/ZlEtpTqDgyyPlbqoj3wMo0EYvrah6VhQu2MLeINs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989123; c=relaxed/simple;
	bh=Bw+vcX0AObiQhbghaKK4wIhCj8YhuH4bE5Ymm4lahuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PnbJ987SuxVXIbDWf+9cpPEWfxi7QI9hjF+KUgs5vQe0IhxXOng8GqGzwnNwTh1BR5IXLZ2SC3sgbN8p4yS4upwP8mqqRfUPhyXDpK8T2aDPF3AodKJEfnN/tzlRUhgxuvOORKaLLMi8cDYh46NGzptJXhLIu1wM461Kpm0mrA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HdIWQUf0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HdIWQUf0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765989121; x=1797525121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bw+vcX0AObiQhbghaKK4wIhCj8YhuH4bE5Ymm4lahuo=;
  b=HdIWQUf0CY6wyJu3ipFyCsbqX4WoyraQ8KAEK5ADrazgmlkgeOCHrxvv
   EfV+GiH0FRwIpRrz0Gw4E2fv+FNF6tm6pfn2/SZYidDL5f1IIGgTPKwv0
   Qwff12xqGUDbL2AWoZpfe8KnNGJgcnFCMJfBse/KQfApJa/lbRia2esjv
   Hsf7ZeJGoFIJbrYAa/+VSHMgxE750COuJemQiahlh329dw+KnnVxJvAnh
   hcrLYV92x0R/f2iTRCoel5XbLeFSNbbT7W6EsjGqlrtK1Lx7iyMX0q4zz
   zRWYTdXlxVX9xA4HSv3zdEjy7jgSFS1jNm/CUOnB0hiniHnRJOXn6KuwY
   w==;
X-CSE-ConnectionGUID: n+sIb6SbQpGFPBg82Qq7+g==
X-CSE-MsgGUID: 5zofmo5RT8GM0eH9BReBcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67971519"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="67971519"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 08:31:59 -0800
X-CSE-ConnectionGUID: p2reEJBbTwCQFrE2NqbBqQ==
X-CSE-MsgGUID: Vo8v1gNUQ9ybgYolAnpkQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198416930"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Dec 2025 08:31:58 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVuRP-000000000vb-1BvA;
	Wed, 17 Dec 2025 16:31:55 +0000
Date: Thu, 18 Dec 2025 00:31:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-09 0/1]
 arch/arm64/kvm/hyp/nvhe/mem_protect.c:635:5: warning: no previous prototype
 for '__pkvm_host_set_stage2_memattr'
Message-ID: <202512180010.zii3BuxO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-09
head:   b812b232b0959e0476d1809d64a4dda2fa4dc8e1
commit: d56ad709773a90012b44e87c0c233faebdcf5823 [0/1] ANDROID: arm64: Implement hypervisor workaround for SoCs with DMA beyond the PoC
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251218/202512180010.zii3BuxO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512180010.zii3BuxO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512180010.zii3BuxO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/mem_protect.c:635:5: warning: no previous prototype for '__pkvm_host_set_stage2_memattr' [-Wmissing-prototypes]
     635 | int __pkvm_host_set_stage2_memattr(phys_addr_t phys, bool force_nc)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
