Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65634204F92
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 17:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734369575; cv=none; b=KcxEEJlpXt9hUucxIdD+ckzu5l0x6zol4cKkAYNjNYdvBreq8yo/AtOGsNiKgzv8hpuPL4gaTdChKsp4AeZQaEw1xSiNCJ2UZ/ntDU4tPOZ04jdFlEQ+w9lGsh6G2p6A+5/OvMU+Jcxw2UjPPkZyOJDY/z7up+vCCMWHQxUjrzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734369575; c=relaxed/simple;
	bh=HV9SaoF7MeciFmu3a6ZOuN6h41xujmvYxJtXtUapBGI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rPP6oNifwyiOhTPeRMrWPiR8XM0um5AHIX1FGNEFqulL1xqGrTr72KDvHl1ZlgYYmuxpGpU/OdAIbazKX6NzlqX+UI8yy4ykvOD4T/OK49SH/NP96xPZGlNxqbeXRBWO1YskBk56iidAAmfcA1NZ6y+2yE1L30HTl44Km0lSBfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qm7cr4J6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qm7cr4J6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734369572; x=1765905572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HV9SaoF7MeciFmu3a6ZOuN6h41xujmvYxJtXtUapBGI=;
  b=Qm7cr4J6r5EXlQyliIQkGj+F+iVoVpT2dwPFBzlBPwcf/8y6/ls4BMiO
   eHSZwlA89XasWrBW7K2YsCuwmMpjWIYth1CzV4RbLkhG3CfgGwGflKbg8
   bPitu2Lp9lgeLdL8RELRxwJgt1Ev+wFq8Frh3I8OCxk2Sd/QHPowurXhG
   mLB3BuTA8aT+4ErXmJdb9kh7mHOzZuqsjLOSNLq4ouaXu72FaGuOpa0Hc
   4t1jwAOldMPFXvLoX7ykEMlwxHW1+6wlS4PUDe5rCO75aQwP+QcAIHdeu
   /wNLUIcnKzZeG6W/svrr9ErLybTa/GfEwNXwDU0bAMwGQX2PZ2ZdK+NKi
   Q==;
X-CSE-ConnectionGUID: I863MB5CTDy+p0mzPJ8nZA==
X-CSE-MsgGUID: umhV1wxPTHaL4SUzAO8Tjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38694447"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38694447"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 09:19:31 -0800
X-CSE-ConnectionGUID: IJ7XgZlPT/CpnDb/2QFZWA==
X-CSE-MsgGUID: hmzoBXogRyWcRToX80xO7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98052161"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Dec 2024 09:19:32 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNEkj-000EMW-1n;
	Mon, 16 Dec 2024 17:19:29 +0000
Date: Tue, 17 Dec 2024 01:18:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 1/2]
 drivers/iommu/kvm-iommu-stub.c:30:13: error: expected parameter declarator
Message-ID: <202412170137.Ok8uRBcF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   98ff3bc59bceffab0548962510f0cdc3394f0c87
commit: f4152a93345467ac1fa8de7b48c5d90dfc63b019 [1/2] ANDROID: iommu: Add KVM IOMMU stub driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241217/202412170137.Ok8uRBcF-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412170137.Ok8uRBcF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412170137.Ok8uRBcF-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/iommu/kvm-iommu-stub.c:30:13: error: expected parameter declarator
      30 | early_param("kvm-arm.unsafe_iommu", early_enabled_cfg);
         |             ^
>> drivers/iommu/kvm-iommu-stub.c:30:13: error: expected ')'
   drivers/iommu/kvm-iommu-stub.c:30:12: note: to match this '('
      30 | early_param("kvm-arm.unsafe_iommu", early_enabled_cfg);
         |            ^
>> drivers/iommu/kvm-iommu-stub.c:30:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      30 | early_param("kvm-arm.unsafe_iommu", early_enabled_cfg);
         | ^
         | int
>> drivers/iommu/kvm-iommu-stub.c:30:12: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      30 | early_param("kvm-arm.unsafe_iommu", early_enabled_cfg);
         |            ^                                         
         |                                                      void
>> drivers/iommu/kvm-iommu-stub.c:41:15: warning: no previous prototype for function 'get_iommu_id' [-Wmissing-prototypes]
      41 | pkvm_handle_t get_iommu_id(struct device *dev)
         |               ^
   drivers/iommu/kvm-iommu-stub.c:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | pkvm_handle_t get_iommu_id(struct device *dev)
         | ^
         | static 
   1 warning and 4 errors generated.


vim +30 drivers/iommu/kvm-iommu-stub.c

    29	
  > 30	early_param("kvm-arm.unsafe_iommu", early_enabled_cfg);
    31	
    32	static int init_driver(void)
    33	{
    34		return 0;
    35	}
    36	
    37	static void remove_driver(void)
    38	{
    39	}
    40	
  > 41	pkvm_handle_t get_iommu_id(struct device *dev)
    42	{
    43		return CONSTANT_IOMMU_ID;
    44	}
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
