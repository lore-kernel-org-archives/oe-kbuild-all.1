Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793150113;
	b=PUuixXY6JwytpK0o8U/DpqpY8xddvHJrHQGcN/j2s0ZRDUGg/FYzD/MczVRWSZQTQzZR
	 ejsnUuNDpz5PVkgujFtR5pgOwP416VQ1vkXHCx2kxi60ypCm3t7mRXV3/faPG3HKKmEfM
	 XkuhuCbosVjJxB1jz5AuElOKBL250ObRRBDQrzMCMDrefCmOWNY4dRhKwgDyFN5D4WY+Q
	 E9U6oAN6HoqSLk03vyKnaMG0+Iz1JBiCxNjzOOnbdpXWW6uYUMqwrWMNBekRbMH+ptnbO
	 VjzA24fJmXWapzzYSSHXhMrSgMnm6rGdDVf6pr9b3vA2Zq9zSxC348z9ZC3InxUe8/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793150113;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=1d+mHYognJw5Dhvrhc8RTE6OTUlncx8gogW/6rsyEdA=;
	b=pEjIt/C6FJxGxIFmNyzF2XgAkm2CCRpq5JqCeEMZweDRKb59ETP5YVWGxxr/AfLRJB+K
	 ChtmSpxqKpd+eAB185B6r0E0gUR+bYMsjzgyiIFztkFnIbpV24jakJZGRCNZMuUSdxSMD
	 5DiDqv4nJj2jOjo61SxEV39F32TxyWT1X+wFO3ZryVG7IOgVizyNjWQq+fqtGovJO43GN
	 imodUSlY5c8x6MaF4bWeasc5kWHxey8ZbuFlybh77DrjWnUJg/kA7ChzOlHmW+UYaHv3M
	 KZa3h4tgChr9uj3F23imrkpZDS+TnBfBftPVLzEq/4pbqpwjv6vfrhW6/Yl5sjKNDNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CSLDWa3A;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34805606A31E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 01:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34805606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CSLDWa3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793150113; x=1824686113;
  h=date:from:to:cc:subject:message-id;
  bh=0C6tAVolTPxTA7rUw1tOBbT0G/Q9d7xcE29D0W716uU=;
  b=CSLDWa3Am4UDgCOZb7vnWXLJxr+aUM8E/i0jAVQogQ+qfljfunMT9Y5Z
   ZA8iYDq0oHVi/DdnTUf36qSKVJHMf3urrDD1jT6iTpzk59xAPqs66aqig
   OnxFEEj3ALKEFoXYrY45GreNgZYch+N2q9qOfUaJcM2S9MsMRtnXrbC6b
   F3YMkXHbnJHyFdiYOm9slamopCm4nne1BpdTJup3rQJYIbGBVixlGlnlP
   wTcuoOUQ+eYD3n5OC/n0kL7WNKpf2w1GxMAXBceRgK2hixVgdxYybyroK
   37tv9CmYGU3VgCvaIe5vtWIxdB3MnYB3vtkXDgv5ymwn7MDyJ8v4czUAe
   A==;
X-CSE-ConnectionGUID: SUq+f6m8RfqtmqoHm2fj0g==
X-CSE-MsgGUID: Sz9GHSmsSoK7ksO9iUNEPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1754608"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1754608"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 18:15:12 -0700
X-CSE-ConnectionGUID: mjAW+tDBRjGnVRbjoUoBPQ==
X-CSE-MsgGUID: lulKtmhSS+yxnHV1Zy/4pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4566319"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 27 Oct 2026 18:15:11 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLsFw-000000004id-1HSN;
	Wed, 28 Oct 2026 01:15:08 +0000
Date: Wed, 28 Oct 2026 02:14:33 +0100
From: kernel test robot <lkp@intel.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [superm1:superm1/lockdown-iommu 3/3]
 security/lockdown/lockdown.c:217:22: error: implicit declaration of function
 'iommu_is_available'; did you mean 'slab_is_available'?
Message-ID: <202610280255.TUeB5M0I-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git superm1/lockdown-iommu
head:   74b0183524154e17897a7789da06a937eaf8b2b7
commit: 74b0183524154e17897a7789da06a937eaf8b2b7 [3/3] security: lockdown: Prevent boot with lockdown but no IOMMU
config: openrisc-randconfig-r2300-20261027 (https://download.01.org/0day-ci/archive/20261028/202610280255.TUeB5M0I-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610280255.TUeB5M0I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610280255.TUeB5M0I-lkp@intel.com/

All errors (new ones prefixed by >>):

   security/lockdown/lockdown.c: In function 'lockdown_check_iommu':
>> security/lockdown/lockdown.c:217:22: error: implicit declaration of function 'iommu_is_available'; did you mean 'slab_is_available'? [-Werror=implicit-function-declaration]
     217 |                 if (!iommu_is_available()) {
         |                      ^~~~~~~~~~~~~~~~~~
         |                      slab_is_available
   cc1: some warnings being treated as errors


vim +217 security/lockdown/lockdown.c

   197	
   198	/*
   199	 * Late init call to verify IOMMU availability when lockdown is active.
   200	 * This catches cases where:
   201	 *  - IOMMU hardware is absent on the platform
   202	 *  - IOMMU was disabled by driver initialization failure
   203	 *  - IOMMU was not detected (e.g. broken firmware, missing ACPI tables)
   204	 *
   205	 * On x86, we also check no_iommu here as a double-check. The early check
   206	 * in lockdown_lsm_init() catches 'iommu=off' from the cmdline before
   207	 * lockdown_lsm_init() runs, but this late check covers any missed cases.
   208	 */
   209	static int __init lockdown_check_iommu(void)
   210	{
   211		if (kernel_locked_down > LOCKDOWN_NONE) {
   212			/*
   213			 * Check generic IOMMU availability (all architectures).
   214			 * iommu_is_available() returns true if any IOMMU driver
   215			 * registered successfully.
   216			 */
 > 217			if (!iommu_is_available()) {

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
