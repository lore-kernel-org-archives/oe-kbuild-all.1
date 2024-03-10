Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4607939ACC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 18:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710094644; cv=none; b=FjngkaIvyFHDQ7yiId9gKhshnD17tHI56MobK6xtMe+FtqG06bST27yLLI0gKeHQLFkv/nvRgaOBBljp7DJwpJeczlyiWl0tY+NX4t5nRHV0RiQKEdWh2QqrVXlI3+M5sKVn+QOYVuKmAwqsZel6DlBqK+P266rzxdcfrGC72hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710094644; c=relaxed/simple;
	bh=LF6IVTL69+7BNqM/mqA8UG9ug7bCmVIjhGedt/Sonv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rb+p4/WEK613UgW8AzHbLTuXe6DB8nlQg02Wibj2gnESg/j6FRTKsxrIMLE6aWG4hEk1tX479XR4p27Ma7K0lH/GJ1mPSJvU/BU7QNP8CfOU5Kc2G5QLOHQIfqG+dlbbDKaCUOsw0m+TatDz18QQ8rspoIQHwKksqjm9B8GNf3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/pVRsb5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/pVRsb5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710094642; x=1741630642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LF6IVTL69+7BNqM/mqA8UG9ug7bCmVIjhGedt/Sonv0=;
  b=Y/pVRsb5AauCcekr4IJqzUAAbuUQSnT8wYu+wftKbVamY03XmSyKp2qG
   dOtZD3JbMGZ5QyfdmeVqFxzZ98eFnv0ni/dlSekUuSHH1eZrB5FS4lfYF
   KwT0bVdJKg8lO8JYrHQjlnSHx1ucCV8naucX22LLgzijPOyxnQceHtWgE
   Uk7Cy+yV5UmQkUUcx0VT3NlCFap56A5cfeg30mcJyweiJ32wMfhOzmUQE
   OGWdfLhsUdHF5pJdsPLRaw8WEcI8y1ebxoJ/WQdmviOdBlMzdntVnsmsE
   TA2K9g+mX/r0QqMYTDa9/6rZcxXZOx0wj1eMPup1d2y/yox3aMoDECLM4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4616771"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="4616771"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 11:17:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="15606959"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Mar 2024 11:17:21 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjNja-0008SZ-2S;
	Sun, 10 Mar 2024 18:17:18 +0000
Date: Mon, 11 Mar 2024 02:16:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 43/57]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:55:5: sparse: sparse: symbol
 'kvm_iommu_refill' was not declared. Should it be static?
Message-ID: <202403110218.fklUfgKF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   6b00f1b219465a71cb11664536629575c5312bd0
commit: be3195fe7b08b042aca453d795a8d0afede4d2a4 [43/57] ANDROID: KVM: arm64: iommu: Use unified allocator interface
config: arm64-randconfig-r122-20240307 (https://download.01.org/0day-ci/archive/20240311/202403110218.fklUfgKF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240311/202403110218.fklUfgKF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403110218.fklUfgKF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:55:5: sparse: sparse: symbol 'kvm_iommu_refill' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:60:6: sparse: sparse: symbol 'kvm_iommu_reclaim' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:65:5: sparse: sparse: symbol 'kvm_iommu_reclaimable' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:99:21: sparse: sparse: Using plain integer as NULL pointer

vim +/kvm_iommu_refill +55 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

    54	
  > 55	int kvm_iommu_refill(struct kvm_hyp_memcache *host_mc)
    56	{
    57		return refill_hyp_pool(&iommu_host_pool, host_mc);
    58	}
    59	
  > 60	void kvm_iommu_reclaim(struct kvm_hyp_memcache *host_mc, int target)
    61	{
    62		reclaim_hyp_pool(&iommu_host_pool, host_mc, target);
    63	}
    64	
  > 65	int kvm_iommu_reclaimable(void)
    66	{
    67		return hyp_pool_free_pages(&iommu_host_pool);
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
