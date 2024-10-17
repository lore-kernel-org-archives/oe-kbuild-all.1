Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C50770E2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 12:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729169487; cv=none; b=VKYJu03sBBCKFry1p3UVo48LK01dioPclOalZA6oqQjIO+HN5T2lNAY+iNJLAcwRulomTtI5RVLBrtIEcdlYwIaaEQGRYsYDzEYwnN66L4chttsY6ZGDWqJ5pGwOTzZ0pPeX4v7fNiXRqrGI6heEHQ+/OHPhxdNwMTWXgmlg8xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729169487; c=relaxed/simple;
	bh=XUkIInyVJ6qdDK5bfom9ZUq7pSmBYtba/l+P8SMUmy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=By0khboKLq3wMZ9e/LMewV6ffRwhr05t1O8NeVKBIVy0jAWvp6Wjom/i5k79rLYVB2Etn0ZQg7cVBwYUKPI/qG6bah/G/CB+ww56fFsq/GN3hLidZivBNFqrWmDuL7VOmRBCqwRSadvHWksyd5JpHIA2fNILh94JbvN5QPK/6Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d8i3rdQ+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d8i3rdQ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729169484; x=1760705484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XUkIInyVJ6qdDK5bfom9ZUq7pSmBYtba/l+P8SMUmy0=;
  b=d8i3rdQ+wD38HM1E18uzhD9fervdusK9W9bw2K/ehb1BOU/PQfBBTX49
   qyHeC0s8fHzA4PRVHWGZpkGinhyFNduYI8ABh4kr2K5/Xm7LYJrEnc/cU
   S8u5uYAVwVPezhfeBOqItUIPs+i1HM6FBputL8mObdfIoFY4XhX3V7Ir6
   rw6z+2OyZseUUN1l8AceC70AQLmSDz6IMv58iBWteYT3ugKalyveTttAK
   V7DJYg15H91Y62XCGxu03Q9N0u8IXXBJAZHYnsA96UER+ZAj0WHG4HpEu
   lZaOY7lf6+bwH5i579czAI6H8bbvaej4l5g/wixVD6uEC7I0ms81CgA03
   Q==;
X-CSE-ConnectionGUID: 5kl5tsbATq+6FEIpnbWfaw==
X-CSE-MsgGUID: EO+WpxQjTCyRnnnhCwvP9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="16269609"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="16269609"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 05:51:24 -0700
X-CSE-ConnectionGUID: 0aNNOCj/Qom57q7eHydmIg==
X-CSE-MsgGUID: YgP7GRY+SxeejE2pLhbdzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="78200978"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Oct 2024 05:51:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1PyK-000MKR-2Q;
	Thu, 17 Oct 2024 12:51:20 +0000
Date: Thu, 17 Oct 2024 20:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2024-08 2664/30000]
 arch/arm64/kvm/perf.c:58:43: error: implicit declaration of function
 'perf_num_counters'; did you mean 'dec_mm_counter'?
Message-ID: <202410172045.iABtY97Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marc,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10-2024-08
head:   bd674d735f838f966d3a1aff5e3eb8a9ef2ad915
commit: 13dbdc0759fd4b89417f64d399ffa6a86fdc7caf [2664/30000] FROMGIT: KVM: arm64: Turn kvm_arm_support_pmu_v3() into a static key
config: arm64-randconfig-004-20241017 (https://download.01.org/0day-ci/archive/20241017/202410172045.iABtY97Z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410172045.iABtY97Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410172045.iABtY97Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/perf.c: In function 'kvm_perf_init':
>> arch/arm64/kvm/perf.c:58:43: error: implicit declaration of function 'perf_num_counters'; did you mean 'dec_mm_counter'? [-Werror=implicit-function-declaration]
      58 |         if (IS_ENABLED(CONFIG_ARM_PMU) && perf_num_counters() > 0)
         |                                           ^~~~~~~~~~~~~~~~~
         |                                           dec_mm_counter
   cc1: some warnings being treated as errors


vim +58 arch/arm64/kvm/perf.c

    50	
    51	int kvm_perf_init(void)
    52	{
    53		/*
    54		 * Check if HW_PERF_EVENTS are supported by checking the number of
    55		 * hardware performance counters. This could ensure the presence of
    56		 * a physical PMU and CONFIG_PERF_EVENT is selected.
    57		 */
  > 58		if (IS_ENABLED(CONFIG_ARM_PMU) && perf_num_counters() > 0)
    59			static_branch_enable(&kvm_arm_pmu_available);
    60	
    61		return perf_register_guest_info_callbacks(&kvm_guest_cbs);
    62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
