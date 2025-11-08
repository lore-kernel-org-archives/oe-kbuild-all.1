Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEB84A1E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 13:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762609552; cv=none; b=WlwzIFHrjq9/6SmbiFQjwBXx8MSd+a2yLnkMNo+G2gCXuohed4vDdSJNpQO1tO57J6/EcQnbUE4YAyNLx9y9HRUOBFBC4ADtioXyw4VK79cm68eKvOnR2fh+Nt8v2bfDsQkHQ/7LiGOw8+9vndklOQDh1MHYVfek/ToRfLkcg98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762609552; c=relaxed/simple;
	bh=hofz2So3BwMm/0i57UEuzy0CplZn5nFMvSkzIKRgcJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G0Ix4qchBSB50BCGdvZ3783Bfh8ix2d8xRaleOSyNIyd6zFzV2Osg2ireP4r/V44Xp31nZdgnXhRd1ld7vbrMNPoyzZRI2NKDhnHCHCcONLzXD5z1O0PbZylQuHFrVJd62w6YXscxHb/Dn3T3FFn5axODfnYL9hU64/gi0NHJtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lbM0df6W; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lbM0df6W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762609550; x=1794145550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hofz2So3BwMm/0i57UEuzy0CplZn5nFMvSkzIKRgcJk=;
  b=lbM0df6Wrxhw51Xx6EBAjyf4rzUwXN7RztDel4kP9uj4aR1/Wiw+j4iy
   xe+vrdyN1IZBCQuT3ZF+13XV+ZFPnucK8Y9f60urNIVYnd/w4fzv65NIv
   sjbz7vbAX28kl1trIIc+00kJ3UvMNoUs8T84hBsjYd8gnRyVamhOBLFtN
   Cmm8QB8hGK1EKNVAPzGufnLNQtabr6iFxFKP/ygHT5iy/SBcffiiOscIL
   cNWc4H0x533soag8G4Jme0injJERmjk0fgCie2Bw7M2cHeaSR7uzcdI0T
   zTdMFjmHQ2T4JN5pTxJYWJ6tmHmMs+7KToJwR8pICmdvg42uAIK9EDYzd
   A==;
X-CSE-ConnectionGUID: +Vobk6RMSC+h3KMCpdTcRw==
X-CSE-MsgGUID: /4c9/MlgQIW2RTPkechINw==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="68594617"
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="68594617"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 05:45:49 -0800
X-CSE-ConnectionGUID: 7gqCDwPgTOymi3cBtW9d1g==
X-CSE-MsgGUID: sf+lwRcsQkWFM/UkxnvXaw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Nov 2025 05:45:49 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHjGE-0000vT-2U;
	Sat, 08 Nov 2025 13:45:46 +0000
Date: Sat, 8 Nov 2025 21:45:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 arch/arm64/kvm/hyp/nvhe/modules.c:276:5: sparse: sparse: symbol
 'module_map_module_page' was not declared. Should it be static?
Message-ID: <202511082118.z52ReoHc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   a18e78fb97835ae81a1f8474b96d20a7319f0132
commit: db8bad4a59d2609e1ec4c6da947554ab51901f4a [1/1] ANDROID: KVM: arm64: Expose unmap_module_page to modules
config: arm64-randconfig-r111-20251108 (https://download.01.org/0day-ci/archive/20251108/202511082118.z52ReoHc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511082118.z52ReoHc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511082118.z52ReoHc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/modules.c:276:5: sparse: sparse: symbol 'module_map_module_page' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/modules.c:282:5: sparse: sparse: symbol 'module_map_module_pages' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/modules.c:288:5: sparse: sparse: symbol 'module_unmap_module_pages' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/modules.c:392:10: sparse: sparse: symbol 'num_dynamic_hcalls' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/modules.c:393:1: sparse: sparse: symbol 'dyn_hcall_lock' was not declared. Should it be static?

vim +/module_map_module_page +276 arch/arm64/kvm/hyp/nvhe/modules.c

   275	
 > 276	int module_map_module_page(u64 pfn, void *va, enum kvm_pgtable_prot prot,
   277				   bool is_protected)
   278	{
   279		return __pkvm_map_module_pages(pfn, va, 1, prot, is_protected);
   280	}
   281	
 > 282	int module_map_module_pages(u64 pfn, void *va, u64 nr_pages, enum kvm_pgtable_prot prot,
   283				   bool is_protected)
   284	{
   285		return __pkvm_map_module_pages(pfn, va, nr_pages, prot, is_protected);
   286	}
   287	
 > 288	int module_unmap_module_pages(u64 pfn, void *va, u64 nr_pages)
   289	{
   290		return __pkvm_unmap_module_pages(pfn, va, nr_pages);
   291	}
   292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
