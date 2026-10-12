Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FD12F0C7E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 06:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791785812; cv=none; b=WpnnR1dL3jb58+tnKtBhTg5CHulHqUqe4gueNku99kGnDH7D+zY1zEruzlTO21VPQWRz5HKFXkwD8BLuWAUqavDePFFObNiAVHjahY2aKA//i3nsiBJ1W6DcXml/edQ89CEf8GDk12Qp5LKBih7lJ7fUdIUhlNg9h6zOKkfAuLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791785812; c=relaxed/simple;
	bh=00TriKPwSHBSWSTRsTSlXWLhmVErLGMuHEag0kYhfXY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d00VaOGjmDSDy39QOxlU2unQBZhUW7XaZWOD8AEZr04HcEHIyShDN4MEr337KQonm4KgKf5JwBsZEHe6+2Xlwu1AJNuF1g0bZVw8B5TB84KdEj2BB+v5IMn9DGYoBTVgXj/1BTLEd8kzQV6vTshieVB8G2PpIokQAhmnaXQi9Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1bVgPlT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1bVgPlT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791785811; x=1823321811;
  h=date:from:to:cc:subject:message-id;
  bh=00TriKPwSHBSWSTRsTSlXWLhmVErLGMuHEag0kYhfXY=;
  b=l1bVgPlTiamVsVvpw3BQhY5Ry9o6+CYjTolpKS3BAg16MA18VtI53wfP
   gVregDwQBOQIv3feBKb1w8LC8JQkJY0jXCLX+VMpYKFWbbCrt9356TS7d
   S1OxpihrKYou4AXgege08w2nrVdpsI38dlbx797NHpVBXEJnOXxY8RKO+
   jYFzrT+5tIw7UTX1qAl3q/qMUwkOAzE5ybtYk9aeK3EXSmWH2LuPg2TI/
   6KvhYfujSn3iVCPwJLV9PehyMqcfcM0aXp14B/HOnUOLhgyhFRqNTNwPc
   a8gT+4LezI+0oTkCcSsYcccbXjdc5YzMRUn74Z1tE4Em3k6LLeGXnUT9B
   A==;
X-CSE-ConnectionGUID: +w+TeXFhRSeBRho0dH+Y1Q==
X-CSE-MsgGUID: 3SeAiXSCQ/yYdcsGu8kaHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="596209"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="596209"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 23:16:50 -0700
X-CSE-ConnectionGUID: e5r62aa7T2O5Cfpn6r8uuQ==
X-CSE-MsgGUID: QRXxJ0AKTUaCe9U8f6zJnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="898002"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Oct 2026 23:16:48 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xG9L4-00000000B5t-1G1d;
	Mon, 12 Oct 2026 06:16:46 +0000
Date: Mon, 12 Oct 2026 14:16:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 arch/arm64/kvm/pkvm.c:687:13: warning: variable 'pages' set but not used
Message-ID: <202610121406.FRqNff0k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sebastian,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   1fb290be45b214bf247b349562892f8278d7445c
commit: 312ab0333e80d95c4c1f17fa07ceb344cec5313d [1/1] ANDROID: KVM: On guest exit ask Trustzone to relinquish the borrowed pages
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261012/202610121406.FRqNff0k-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610121406.FRqNff0k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610121406.FRqNff0k-lkp@intel.com/

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
