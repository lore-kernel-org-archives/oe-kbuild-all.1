Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FF63D561
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 08:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746865077; cv=none; b=L/s8aAhOvY+OUreFh6Xne+MLfnCVrW9Sk4bfNhzm/q04H8IUti2LWDpQiz4r0tk7qy3FuU3WFhAPEd1Lt5c6K7qgkuw4vRuK6+1TNAgU9bQKpkGfEYe7DgStK5IwP7UHbQ8Bg//umNcRH+9nnd9i446D5vFWG3wF9+SscATP09Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746865077; c=relaxed/simple;
	bh=DQJ+y8N0SgM9LyRU4SbsT3Ur3qRAAgouTHCUEAACvVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L4na4DvGskIaUAGpFlcgH2HJMKG8t4fpqQbDsWmEqOavLFDpuOo4aAq+YqO1iC1/Il7p5sLu/Vr3AlQimbVWgvW5AqvJXZsAMTXFSK6d/d1lP5lvCEDkjnNPVGv4xRarUSGgzcWZ8QeOgNfKmSSq0ozHir++7i5EelFqjseP/G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eaj94i0o; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eaj94i0o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746865075; x=1778401075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DQJ+y8N0SgM9LyRU4SbsT3Ur3qRAAgouTHCUEAACvVk=;
  b=Eaj94i0oRnr+AYoODVDw1+EubDFO0t+eXnaecYThkqCNcy/41LoFF/el
   vXctaOLON1GSt0Q2jTp37vgAYgr3yYs6AVCoPOOiJ2w93HFzcPKsRfSvy
   o+Wir/tB7ORP+LsAMeZ0+GymiL0f9sGot0lXhIZQaOp4HAxITNapQciNd
   N6a1FONo1U5zKPrpIZAlzz2QePk5t4oU1rBvl0crczdtYEi395jGjehwQ
   Szt+XQ0aWyC+GKiIlgWmUSOl/2jZm/DDzGVVLh3lOdUscnyPqaPO32J5h
   90p1fpHLuvifU9yRde9YFn4Sg7lQL/JGRsGcXB476aF8PjiPoEicsHZhr
   A==;
X-CSE-ConnectionGUID: 5wgoBhkvQoyPOmyaBRKSLg==
X-CSE-MsgGUID: rV28SdeTSlWQZRg9TBbm7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48853792"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="48853792"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 01:17:54 -0700
X-CSE-ConnectionGUID: J52t0WsNRvKslzzbLf3R9A==
X-CSE-MsgGUID: eo/HzuMtTa6Qmug2BDtuSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="136785258"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 May 2025 01:17:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDfP4-000CuJ-1Y;
	Sat, 10 May 2025 08:17:50 +0000
Date: Sat, 10 May 2025 16:17:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 arch/arm64/kvm/iommu.c:153:58: sparse: sparse: Using plain integer as NULL
 pointer
Message-ID: <202505101648.NDMOBdKr-lkp@intel.com>
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
commit: 9dabecc2a2c31f11239b0853839bfc860de071e0 [1/1] ANDROID: KVM: arm64: iommu: Add memcache for guest pvIOMMU
config: arm64-randconfig-r133-20250510 (https://download.01.org/0day-ci/archive/20250510/202505101648.NDMOBdKr-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250510/202505101648.NDMOBdKr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505101648.NDMOBdKr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/iommu.c:153:58: sparse: sparse: Using plain integer as NULL pointer
   arch/arm64/kvm/iommu.c:162:50: sparse: sparse: Using plain integer as NULL pointer

vim +153 arch/arm64/kvm/iommu.c

   145	
   146	int kvm_iommu_guest_alloc_mc(struct kvm_hyp_memcache *mc, u32 pgsize, u32 nr_pages)
   147	{
   148		u8 order = get_order(pgsize);
   149	
   150		/* Driver might have dedicated allocator especially if it needs large pages. */
   151		if (iommu_driver && iommu_driver->guest_alloc && iommu_driver->guest_free)
   152			return __topup_hyp_memcache(mc, nr_pages, iommu_driver->guest_alloc,
 > 153						    kvm_host_pa, 0, order);
   154	
   155		return topup_hyp_memcache(mc, nr_pages, order);
   156	}
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
