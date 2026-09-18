Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A362FABFB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 08:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719498; cv=none; b=H81e+Cxlf/U+FbLRK4gncE8Q1R71bCNsSmmtX+lPlvQfgvzmUzuQs1M/berqzpluc4A74gZTnumjlWHyRwSncTtyQOB77y9Lmf30/yPXDR4dz/leJIc/p2peiHtcrzfQe1gatl87RtTruJpA27yQebslk8aoPt2p/21WFKXdO5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719498; c=relaxed/simple;
	bh=95fsuTjsX6R4WLCBeCRLo0swubXKnut//KRv86a2HU0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NQ5cSzcsgP3VBI2rGeOg7ivIgTVNN6+6l+2oQ4VJ5Y0T01p2OrikiUy71k9SyxmEzoVjfzhJRPUMQmDfF3Y5CaMb1iouap9o3t8dc2QOnQo41kEFP+1wq9ulVSLTyNRv1F41IkQi62kcHve/QNvSiX7Ojmn5/0/LEC7hqRBRtKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGWhmgBu; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGWhmgBu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789719496; x=1821255496;
  h=date:from:to:cc:subject:message-id;
  bh=95fsuTjsX6R4WLCBeCRLo0swubXKnut//KRv86a2HU0=;
  b=CGWhmgBuNO6KvoBsA0yDbJN3RHv7b7QUgViGsB3fTVHInLdtqqMMFBb1
   BGrbcxFBP2YgCjWisEyth+J+tCPQVM50hQ5A1YtJDNRL9i/XuE8uG1n+P
   qX98RfL/ym8+dKag0g7kJRMRhgMjMtRZSY1QuxjZ80a0axwpFhjpRiCsH
   H1jHZLr67f5ESacqQ6UVvhDs/5WUEErgMagbTIzkj/2YYzMHY7TadZavH
   bpYJvZj7NhRLss5Y+C8UmNaYc8VizBlYZdqiq0LkyNsBvFax7m/6WcJ21
   qCGehaD1qNquoL8AwdvUd29jQU2geQ9wV3EJcgKGBrRaE9st07xe8Oy1A
   A==;
X-CSE-ConnectionGUID: wRUMZMO7Q9S2JN6bFDlspA==
X-CSE-MsgGUID: WGhxNIiESCGNQvbwh8A3lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90073911"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90073911"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 01:18:16 -0700
X-CSE-ConnectionGUID: x7JdNu2tQ3ih1zMtDMWp/w==
X-CSE-MsgGUID: weFTCyBET26dk8LuikyYgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2697196"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 18 Sep 2026 01:18:15 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7TnP-000000009RD-0U1a;
	Fri, 18 Sep 2026 08:18:11 +0000
Date: Fri, 18 Sep 2026 16:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 1/1]
 arch/arm64/kvm/iommu.c:153:58: sparse: sparse: Using plain integer as NULL
 pointer
Message-ID: <202609181647.ibpzYHY2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   57041e4a7e52342473871000827584f966d8cbd3
commit: 9dabecc2a2c31f11239b0853839bfc860de071e0 [1/1] ANDROID: KVM: arm64: iommu: Add memcache for guest pvIOMMU
config: arm64-randconfig-r123-20260910 (https://download.01.org/0day-ci/archive/20260918/202609181647.ibpzYHY2-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609181647.ibpzYHY2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609181647.ibpzYHY2-lkp@intel.com/

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
