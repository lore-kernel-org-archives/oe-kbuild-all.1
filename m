Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D33374E79
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Sep 2026 06:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789625765; cv=none; b=FB1O14k824S9yZ6vzRigUVeAuy8iP+gedO+6PGeTR3y6wg566YsTMmmyLCIBZgA/lyOkNKTd2vXAkf/BG0fL7H2+833piIJcQgTHaAjqAcoGebVtPZDrXTUChSjsuETQa5RYNx4uvmvCxHtFAutIJTosPJw7WBIkHqvIt5S0GwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789625765; c=relaxed/simple;
	bh=HWBu9D81rhvb2ouyf/uBJdOpjfH9nXZEkCS5YKcxT8c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l4sBSRxOdWkzXmW7avyCUExfTFBTZB2VmS8yJry1E4ki2B5kCNvAqQe9zQ/B5bUxXAKff6V5y9DhPwtDL9bM++/u/49jO56mx7mZlLUrIrCj+pCGBepZiejaaeukJIOcchlw9Wwm9ZGGtIsXaK9Yjq2ovl0E8ZhBB4b2LM+SDKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SoKqGnIO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SoKqGnIO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789625764; x=1821161764;
  h=date:from:to:cc:subject:message-id;
  bh=HWBu9D81rhvb2ouyf/uBJdOpjfH9nXZEkCS5YKcxT8c=;
  b=SoKqGnIOGxExX4RU6PSF8X+Vq8+lrkhDKcRywVYSbCkh8qTBv33WVXaz
   7SRoKlC2nzyvFPbj22nqjcRAprZImtcZtNJ1jzcmPYv3zpTHxJRG/sSCe
   SAnGsB4N4rWIYt/A0g64IvIM8O64OP3MiIhzlhIg+jNad6k0iNrJHaRZu
   AdIyLEAPygM+jdbu4z/fUig2gRNeFiZCeej8upl3jDWac751AEa9PzUb+
   tg+KKWzX3v6jB4p+pjNFDJ4F7kkGgE6bKF3qWcLwvV6B9gDRvI7oX23k+
   ZkRJ3vv9ZmUEhV3hxs5hWIskEhNGmS1nIcAgpvefQKCGG/KHfD/pd9wJg
   g==;
X-CSE-ConnectionGUID: JZVX8WlJQtmz8mq+f7fWHA==
X-CSE-MsgGUID: p/ZE594sTRa17D+bWKdfaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89150525"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89150525"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 23:15:51 -0700
X-CSE-ConnectionGUID: DkoDriBOQca1ZNj9XR5Rwg==
X-CSE-MsgGUID: wI+AM11zTTekB4ct6bipFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297086906"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Sep 2026 23:15:50 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x75PQ-000000007Bt-00kc;
	Thu, 17 Sep 2026 06:15:48 +0000
Date: Thu, 17 Sep 2026 14:14:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 1/1]
 arch/arm64/kvm/mmu.c:2012:5: sparse: sparse: symbol 'pkvm_mem_abort_prefault'
 was not declared. Should it be static?
Message-ID: <202609171439.CJ1Dk8mg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   57041e4a7e52342473871000827584f966d8cbd3
commit: 3fc1e219027721249a621d54449e0f3db624b655 [1/1] ANDROID: KVM: arm64: Introduce kvm-arm.protected_prefault parameter
config: arm64-randconfig-r123-20260910 (https://download.01.org/0day-ci/archive/20260917/202609171439.CJ1Dk8mg-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609171439.CJ1Dk8mg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609171439.CJ1Dk8mg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/mmu.c:313:1: sparse: sparse: symbol 'kvm_pinned_pages_insert' was not declared. Should it be static?
>> arch/arm64/kvm/mmu.c:2012:5: sparse: sparse: symbol 'pkvm_mem_abort_prefault' was not declared. Should it be static?

vim +/pkvm_mem_abort_prefault +2012 arch/arm64/kvm/mmu.c

  2011	
> 2012	int pkvm_mem_abort_prefault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
  2013				    struct kvm_memory_slot *memslot)
  2014	{
  2015		phys_addr_t memslot_start = memslot->base_gfn << PAGE_SHIFT;
  2016		size_t size = (1 << pkvm_prefault) << PAGE_SHIFT;
  2017	
  2018		fault_ipa = ALIGN_DOWN(fault_ipa, size);
  2019		if (fault_ipa < memslot_start) {
  2020			size -= memslot_start - fault_ipa;
  2021			fault_ipa = memslot_start;
  2022		}
  2023	
  2024		return pkvm_mem_abort(vcpu, fault_ipa, size, memslot);
  2025	}
  2026	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
