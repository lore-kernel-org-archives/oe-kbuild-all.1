Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AF921D59B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 20:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765656984; cv=none; b=YLmN0l6HStSnnDOmUAd6N2lCEbDXGOF2Wvsb3Bria7J6cLcdVf0Xf1j9t0IWSoCteCL3qWw23AkP2l+fSQWGgwp5M5TASW3Oq9fDC7fkXqt0C5YDOw7DKEOvp2pEICIaP+0+pJQPzTbrfyYroO6j317habyREdy0hyJ+IyNsIsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765656984; c=relaxed/simple;
	bh=+ZwtqlPYj1SMYFBGe8YU+gV6orFk6jgwi8xxkjJgml8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s/1yHo/OZNhCp2WPpBr/xFaZ/qR1VGNjzdcfiAsHDw1TkBnNNEkpVHjgCVu96EuRfIzdMcJRl6Cs7pVUFS3qkzP7O4ouuHZzmqeCbCyZ57kjDYxiqZ/foLyiMuNjvmKk0Wyao5z5fN5ijT1Qtl/6QRIi7mKW6gvYAExOQz6DhF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+FkW7Zk; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+FkW7Zk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765656982; x=1797192982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ZwtqlPYj1SMYFBGe8YU+gV6orFk6jgwi8xxkjJgml8=;
  b=D+FkW7ZkFGCnaTt+nESJ82bIdElKX/UdPh2eKxAR+Xfs0y2bMu/e7CEF
   gUwHGXHXw0AXl1OO+uC9xxxvqugHUJj0gMGWkP0qRO9jieA/pT7wlo/o/
   1Pcwvxr/86s5hZOehypj7zjANKLcJOOVWEDP1gIyOcuRMYr98SW+douuA
   Ojg4eqQymdGPvtndgqQSeCqzNmCs0C4ZiRGUL+ZoTUnvxNskGSvdLTQWX
   21HH0JbkZxCZQwSyCWj825uIpYj47lk8zvKo6T7VhQJoIjZVBc/N9kBw1
   +I1eNt3TMBjXTMHEKaSZbokAGCJxIZhCfgkJCD0CXQTpASRip8QPsOZ4X
   w==;
X-CSE-ConnectionGUID: BaLsJGaFTz+ueF3JI7/Kzw==
X-CSE-MsgGUID: F65rhOo9QMSXBTFDWXtCwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78992081"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="78992081"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 12:16:19 -0800
X-CSE-ConnectionGUID: 8f2D9herTPGHyg8RjWRL+g==
X-CSE-MsgGUID: ANEXtZeETcyummrHSOolUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="196647520"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 12:16:20 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUW2K-0000000089y-2BYY;
	Sat, 13 Dec 2025 20:16:16 +0000
Date: Sun, 14 Dec 2025 04:15:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:252:6: warning: variable
 'ret' set but not used
Message-ID: <202512140425.zQqLuSR8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mostafa,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   17fd67ddf0cddeb7325b49d3ca2f7db7824dfccd
commit: e0abda8b771ca9dd97fd815b4be3bc9711fa3a5c [3/3] ANDROID: drivers/arm-smmu-v3-kvm: Modularize driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251214/202512140425.zQqLuSR8-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140425.zQqLuSR8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140425.zQqLuSR8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:252:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     252 |         int ret;
         |             ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/ret +252 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c

6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  249  
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  250  static void kvm_arm_smmu_domain_free(struct iommu_domain *domain)
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  251  {
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12 @252  	int ret;
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  253  	struct kvm_arm_smmu_domain *kvm_smmu_domain = to_kvm_smmu_domain(domain);
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  254  	struct arm_smmu_device *smmu = kvm_smmu_domain->smmu;
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  255  
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  256  	if (smmu) {
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  257  		ret = kvm_call_hyp_nvhe(__pkvm_host_iommu_free_domain, kvm_smmu_domain->id);
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  258  		ida_free(&kvm_arm_smmu_domain_ida, kvm_smmu_domain->id);
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  259  	}
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  260  	kfree(kvm_smmu_domain);
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  261  }
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  262  

:::::: The code at line 252 was first introduced by commit
:::::: 6cb3ecc7be2f6315e496f59b1966a2b515dfc776 BACKPORT: FROMLIST: iommu/arm-smmu-v3-kvm: Add IOMMU ops

:::::: TO: Mostafa Saleh <smostafa@google.com>
:::::: CC: Mostafa Saleh <smostafa@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
