Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387C533086
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 17:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746898062; cv=none; b=DutIUXMi3aupERcr42X6VXIk1dtHRD/n0YoetzmWQKgQ0Yj4mO6WQVTVOYs2x/ORoIP0kWTUQ3NA6w9/9PNg6bP6WpEOfYIxHJu1JtrRq2V0gP+umCySscrhnSHkJfA7HzMfAmpGUB1+z3sV3Kmg1t7wjWC7X294e/kUXNQlIfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746898062; c=relaxed/simple;
	bh=6b7Q7l4lMd3piiZXhBkFfs1Su3ofPYtOyoGQpVx8HDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z22kzU/VrFY4lCgMDO2nY5V9+8NN2GLJfGEKof67BOeHxXcwfGSfEH8TdtcP31G62J63GwQ6n52qRralBlgkKGFc52VO34/4Y9DsHyCuzGFUT17bq08V0MC7ZbDMRaP3sz5z2bmi8HAS2YnQJK/0KSPdIOayIrBm/pTiBlnvnNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJVzDiij; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJVzDiij"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746898061; x=1778434061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6b7Q7l4lMd3piiZXhBkFfs1Su3ofPYtOyoGQpVx8HDw=;
  b=JJVzDiijnsKe+HvtI1u492mWVfksdlVVO+6MTxXpkJ5aV9C/7PlQ0Us7
   Ihw2i+EE485trDQMIl2r1TsTPXTPTp22dwWz+klG6ZJEcRLoFF1aJwekS
   qWCkd+HROooP58h9uFDWwcEyWXDNr9oGdlA9ag7K2skP9DG8LW2coZd0V
   mqTslvnJd6NwCo9rDEKyU7P/yoa8mON7YUapNFI7jatVbAYgvKyTustWh
   Yy0gMDgGqyk3120L79UYg4KxZY2mNc3OjQ+B7HHVxlwVEQ1mlP31uVyDg
   sMdLOW/dgn5MqtqWT2LNqzcTi3M1Bea7N6e2qS39srAa+rFaECjQ7GOfV
   A==;
X-CSE-ConnectionGUID: DtaaXC2hSuOcY8HxTOlqXg==
X-CSE-MsgGUID: BV3G1zvYQQ+kCB6HGuzEMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="48727225"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="48727225"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 10:27:41 -0700
X-CSE-ConnectionGUID: kluBKKDbQmqKB9U0TRsZng==
X-CSE-MsgGUID: xCg8o03vSaCH7ZJN1c1F7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="167993512"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 May 2025 10:27:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDnz7-000DF3-2V;
	Sat, 10 May 2025 17:27:37 +0000
Date: Sun, 11 May 2025 01:26:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:77:22: sparse: sparse: symbol
 '__get_vcpu' was not declared. Should it be static?
Message-ID: <202505110134.tDE2HpWU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   54fe54966861b5352dfb0a9559b9afcda7d0c52d
commit: 41148bbeb73900a1fe8c5d7c64bbec5207d84c06 [1/1] ANDROID: KVM: arm64: iommu: Make allocation guest aware
config: arm64-randconfig-r133-20250510 (https://download.01.org/0day-ci/archive/20250511/202505110134.tDE2HpWU-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250511/202505110134.tDE2HpWU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505110134.tDE2HpWU-lkp@intel.com/

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
