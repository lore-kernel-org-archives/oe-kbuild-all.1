Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D553E47B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 14:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774620823; cv=none; b=pwQjBnwEgQicN0sJOErg9lYKq1NiPF/AYEOxCxBpwQm44cWx2VRowyFJQGMcpj7bhHiDDUPorrnhRXKznuZYpHENQaLby5AxVQIs3YRHneBvkge5GBbPaU5pP+30gnU7cDDsNJaMALadK1twxaECDQQZ0/62SzySA2lCSf78qXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774620823; c=relaxed/simple;
	bh=eW/JcX2ugPus+OlAMzwAKlGijaUbhW/Av2YZLKDyCog=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FOdTIP8rdyfQJuUOb3S4fyhP6+2esD/dgIjmpvXtAEJ2FAlBCND1pzu7X2OFU9EoZZTglOSPTYyRVnRuoahDiJg8yT/LqCvtfMf0wltqPAJGLq96WvOObhC9HF7uhmjO7PZ1cL7MpQPovHL3BiVwY7+81zoOBJ4W5zB18XIypZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HsSCGdyK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HsSCGdyK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774620822; x=1806156822;
  h=date:from:to:cc:subject:message-id;
  bh=eW/JcX2ugPus+OlAMzwAKlGijaUbhW/Av2YZLKDyCog=;
  b=HsSCGdyK5bJmbUmbFtvZ/by+UD+9wnsFZNOJOEPLuoXB3HKYid/UqO/g
   NJlfm7kdMsItKvGMwMBo5+l+HGZPsPBLrn1eKzKS6orqwNtdSAfl/poG8
   qLEMlPV48zYl9eJlgPq0MMuPvJ6Hujf6ah1x0Owi5CdUDb16a8eGx9IJd
   Zlyi5HcMylS/Nr8jsfvVEGez0upL+bJh+MGJjz6BuRcbloJeF8Btf3T54
   9q6uJbZet0cnqxyC82XVX3XwW+eaU1xSF2Tm6kOl6MXrgefdE/lon76GR
   ntTeLIE5YW2h+NirgnFWB4FPGvkCqn/crhb4IazE6sJqOvmQz81p57K1w
   A==;
X-CSE-ConnectionGUID: yRJ6YSDfREONOz8rQ6Q/OA==
X-CSE-MsgGUID: /NSzXAurQQy2L035M15lvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75892044"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="75892044"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 07:13:42 -0700
X-CSE-ConnectionGUID: xtfHdsIZTy2WRWxQ9ciOZA==
X-CSE-MsgGUID: 9Gf0IFYtRzGBMWgwnmGsQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="229809667"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Mar 2026 07:13:41 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w67wP-00000000ALj-33W1;
	Fri, 27 Mar 2026 14:13:37 +0000
Date: Fri, 27 Mar 2026 22:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 drivers/iommu/arm/arm-smmu-v3/pkvm/pv/arm-smmu-v3-pv.c:1085:6: warning:
 variable 'ret' set but not used
Message-ID: <202603272215.bRKdK7e2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   453cb76c605cfc3405a95bee4888782c7218b92a
commit: 454abc918f65815dd63b8564051ce358364e1f2d [2/2] ANDROID: iommu/arm-smmu-v3-kvm-pv: Support power management
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260327/202603272215.bRKdK7e2-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603272215.bRKdK7e2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603272215.bRKdK7e2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/pkvm/pv/arm-smmu-v3-pv.c:1085:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1085 |         int ret;
         |             ^
   1 warning generated.


vim +/ret +1085 drivers/iommu/arm/arm-smmu-v3/pkvm/pv/arm-smmu-v3-pv.c

  1082	
  1083	static int smmu_power_off(struct kvm_power_domain *pd)
  1084	{
> 1085		int ret;
  1086		struct hyp_arm_smmu_v3_device_pv *smmu = container_of(pd,
  1087								      struct hyp_arm_smmu_v3_device_pv,
  1088								      power_domain);
  1089	
  1090		kvm_smmu_lock(&smmu->common);
  1091		smmu->power_is_off = true;
  1092		/*
  1093		 * Disable translation, GBPA is validated at probe to be set, so all translation
  1094		 * would be aborted when SMMU is disabled.
  1095		 */
  1096		ret = smmu_write_cr0(&smmu->common, 0);
  1097		kvm_smmu_unlock(&smmu->common);
  1098		return 0;
  1099	}
  1100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
