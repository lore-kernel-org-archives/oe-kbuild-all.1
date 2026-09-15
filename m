Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBAE48EC8A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 11:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789472922; cv=none; b=oHxm0nyKttrMHfW0rWv6J8gm7K/yVSnrrLRJ5re+0mHx6JMDqXKQsIQCdC3w1yrO/TSBLFadj8U6oMBLnP4rs8184+T5TNKelEHW6BYsW7ZOkvP5RvFM/XfrrzeSse/wET5qglWFgomWlg0JuW14+meDFWNdHOQIkfrWf6DX4T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789472922; c=relaxed/simple;
	bh=SdQxhrkFRbv/pghUznS9t4VntD4OKaYP0RyYTqyCA0Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UB0uEoCyqLlregzSY/qvgcD2tLYWq4RKlgB03qd3jqTXj7AURMvG8aVey+fYKiI2mVEzVo9ghvsuomMmpXX0FnJmH8eY2K4n5FHhAjkAF/lgu5PkVi2DPlX5REww49QaQ36L5bXyyzhYdCJjrhK3pse788RhDLbzvQY525gyhvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EKH7mKV4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EKH7mKV4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789472921; x=1821008921;
  h=date:from:to:cc:subject:message-id;
  bh=SdQxhrkFRbv/pghUznS9t4VntD4OKaYP0RyYTqyCA0Q=;
  b=EKH7mKV45wmthIIL9xryIIE1DRrbHNrPtGP6yUx7DYeAAX8AIo0dDw3W
   33pdqN1MmS1f9wPhacTDcCeaI7mvuaylAq/9sxH4xoxPAZ9QgLtJUW/ST
   UsaHoAr5lSHD7my7mOXL4lBObtNKJPeZ9a1IY1s0eITi9d5XGQQQHprur
   hwRGk0aJaMwG4d0JGmNYDqBX4+dn+41OglBDfPGLdxDanV4WY6CsPWu45
   9ludUoehF90yYC0YCA35VilsPXDHSm0wlU/5Ky8KRylptL0xcTr9UV/Ul
   2I0BLzNz/08Y6DawjvmIvU105hJkyVmkCkD6Iwllwdm2ZYVsMqY0VP+/y
   Q==;
X-CSE-ConnectionGUID: HD/+78AvTS25Lo3HxBl7LQ==
X-CSE-MsgGUID: 2HoLK0CNQgirylHI5ZgXMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89848446"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89848446"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 04:48:40 -0700
X-CSE-ConnectionGUID: ElKLj8UQR8ahBeygAK2qMw==
X-CSE-MsgGUID: TjyXpt+jQEy7GGWxzdb4aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="274933399"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Sep 2026 04:48:39 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6ReO-000000004UX-2wiV;
	Tue, 15 Sep 2026 11:48:36 +0000
Date: Tue, 15 Sep 2026 19:48:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 1/1]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:77:22: sparse: sparse: symbol
 '__get_vcpu' was not declared. Should it be static?
Message-ID: <202609151948.UyiN7MTT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   57041e4a7e52342473871000827584f966d8cbd3
commit: 41148bbeb73900a1fe8c5d7c64bbec5207d84c06 [1/1] ANDROID: KVM: arm64: iommu: Make allocation guest aware
config: arm64-randconfig-r123-20260910 (https://download.01.org/0day-ci/archive/20260915/202609151948.UyiN7MTT-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609151948.UyiN7MTT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609151948.UyiN7MTT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:77:22: sparse: sparse: symbol '__get_vcpu' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:199:21: sparse: sparse: Using plain integer as NULL pointer

vim +/__get_vcpu +77 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

    75	
    76	/* Return current vcpu or NULL for host. */
  > 77	struct pkvm_hyp_vcpu *__get_vcpu(void)
    78	{
    79		struct kvm_vcpu *vcpu = this_cpu_ptr(&kvm_host_data)->host_ctxt.__hyp_running_vcpu;
    80	
    81		if (vcpu)
    82			return container_of(vcpu, struct pkvm_hyp_vcpu, vcpu);
    83		return NULL;
    84	}
    85	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
