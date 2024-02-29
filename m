Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8867FE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 00:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709165486; cv=none; b=iBdnutu1w4motLqpKz7LzWxmY0KLpjR8WFII61arQ7zVxzCz9/6ZARifvgRhQTWyTA2lI1fZhvcXQi0PXa21I2KRNUWmfgYNEC9G1Ekxg6lH0DGCDd4CK2EjxILt9J3RwKN8Q72haH4KIPov/Yp6aWQwBD8gz2wPPt+t2e9kWZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709165486; c=relaxed/simple;
	bh=6eBtXn2H38CWfBQ2Y7dGjTgSk8tM7qNjKkk5eVAvYyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OTx5fmfUIbuFOxTtkzxJ2xFfJAFMIcTXW8Kz/91fFcd3SadD9Vn5bnFEQYtLwpYG7DKhkc76mxLOShXwBx2LODMnaK1scw8cIOPRq/f/tz48u8cEWYng+O4J/RZYBg1YEvSQu8aK1zD4U4Qz7OXO6W5XRicmDDnqa3O9KqCBUSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vqf9BEA7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vqf9BEA7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709165485; x=1740701485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6eBtXn2H38CWfBQ2Y7dGjTgSk8tM7qNjKkk5eVAvYyw=;
  b=Vqf9BEA7ug1LHC61njs2Q8AuxFWljkbAnsGQhzMPdVRWbu5Upbz9oxgM
   4ERZTIoQvwFYS2b/xCUNfwbk0C6rtTgXVury2UgTN3sWJBCM1M2Ogkm+K
   TgrJ3fq84wPpLgIDlGkLiTX3fjETAJEueFJff9ENntQT6zJtXo1zJPi2u
   QcRNiDEb7tj+jPpGxAHETKk4kL13nQbX4hnHxGyMCkDKe7u/OZTtBuxIo
   l1gggkYTr0Ayzb7O7i5eATfY6kIQQ+uM4LJy72s9fvWSnJbuOYzbb3ptj
   +cyDr8uiPWly9Jb3iPnvnAYsjeJ0+WJBtgVEFSOHm3qtua5Xo36fJ2kOL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3771449"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="3771449"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:11:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="8170761"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 28 Feb 2024 16:11:22 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfU16-000CV5-2V;
	Thu, 29 Feb 2024 00:11:18 +0000
Date: Thu, 29 Feb 2024 08:10:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 17032/19013]
 arch/arm64/kvm/arm.c:53:1: sparse: sparse: symbol
 '__pcpu_scope_kvm_arm_hyp_stack_base' was not declared. Should it be static?
Message-ID: <202402290801.kFXbf08Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   4289e1348ea3ba552b8bd401182b55dcb87d5be7
commit: 908a530787b8d09bfe9d237dda728753a2621599 [17032/19013] ANDROID: KVM: Update nVHE stack size to 8KB
config: arm64-randconfig-r113-20240228 (https://download.01.org/0day-ci/archive/20240229/202402290801.kFXbf08Z-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce: (https://download.01.org/0day-ci/archive/20240229/202402290801.kFXbf08Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402290801.kFXbf08Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/arm.c:53:1: sparse: sparse: symbol '__pcpu_scope_kvm_arm_hyp_stack_base' was not declared. Should it be static?

vim +/__pcpu_scope_kvm_arm_hyp_stack_base +53 arch/arm64/kvm/arm.c

    52	
  > 53	DEFINE_PER_CPU(unsigned long, kvm_arm_hyp_stack_base);
    54	DECLARE_KVM_NVHE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
    55	DECLARE_KVM_NVHE_PER_CPU(int, hyp_cpu_number);
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
