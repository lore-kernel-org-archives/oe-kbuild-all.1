Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4F3386450
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 12:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993791; cv=none; b=jUFS8nZ9jXMRlqTjUwUl72uXK9yeEBkA/SdlQ6hilx9F/ACiX/PMgy3mOpDXy1+YxE7hBpE9ng2AzRfuflAAEJ2lsw1a7VEbS1jEUXNP9MI+bld2GnQ24nz9oPfgsEhxY3vNe6kjTYkQRtuKyv3z0uaXUh5CkJjFKNBQJ1ikDgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993791; c=relaxed/simple;
	bh=fdNWO6BTpLfhpg+bC+7T9lXZwg0M9K2ZyhUYQ+i7gns=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kog19kPu+NakcRghsDkU95dvA7/6vXoG/4TV6kcebygJvsM1SRPsDBcBf2/9U9DLIR6pMXtun0cqkng7msv6MOKP7LtlHKhSQCNfU9mXYHffzjiCpOGnzIM77N1iBoNEnZTp0OMdmxTlKDTIMxdykwl3f5rqG9Se5m3fVIVeDZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6BRT+Ip; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6BRT+Ip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782993790; x=1814529790;
  h=date:from:to:cc:subject:message-id;
  bh=fdNWO6BTpLfhpg+bC+7T9lXZwg0M9K2ZyhUYQ+i7gns=;
  b=P6BRT+IpgJLTFgQRtk7liJI+SsJFqjPYJqzIpNe9SMMrbefwv1A0ZBs8
   pSBkHFBJIDJqvTfXCalPIN02XVCzl8OEyzBYYq2O4LCnC6Mpw430AE/lm
   qZS8Yq6FJ/81UKktId/x/LoEFUbaXgYVh+3Xn45MYkHeX/VscHNYEX22m
   iFPcZdGYDxvFj1XFfufBwM8Wq8YMyUJaI7XKdbC0j+5fmGCKg6BVCmxh6
   vL2Iaz5oeg8fn24tRM3YWEob1wWsh3v8WDMxLULukONriYlZps9n7xRjr
   bxFWLCswWJoBWziHu7rdTEewkKhNgzSfFJC/YWiUdIoQzJjWtvuH2qHMU
   Q==;
X-CSE-ConnectionGUID: XjgL1tPgS8KJgqwGRTKLow==
X-CSE-MsgGUID: 7OB+/DIzRPy22ifuV9QI3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82857912"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="82857912"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 05:03:10 -0700
X-CSE-ConnectionGUID: Xraje/QqS4KaocDTkcwTOA==
X-CSE-MsgGUID: XwU1aqWDRgGqFlV18wCQhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="290967879"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Jul 2026 05:03:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfG8H-00000000Al9-3a2O;
	Thu, 02 Jul 2026 12:03:05 +0000
Date: Thu, 02 Jul 2026 20:02:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-04 10/10]
 arch/arm64/kvm/pkvm.c:687:13: warning: variable 'pages' set but not used
Message-ID: <202607021923.YF0tmrex-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sebastian,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-04
head:   edf956ebceeb7cdad6af1e86e3bc0f8ab20253ae
commit: 312ab0333e80d95c4c1f17fa07ceb344cec5313d [10/10] ANDROID: KVM: On guest exit ask Trustzone to relinquish the borrowed pages
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260702/202607021923.YF0tmrex-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021923.YF0tmrex-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021923.YF0tmrex-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/pkvm.c: In function '__pkvm_pgtable_stage2_unmap':
>> arch/arm64/kvm/pkvm.c:687:13: warning: variable 'pages' set but not used [-Wunused-but-set-variable=]
     687 |         u64 pages, nr_busy;
         |             ^~~~~


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
