Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FC53009E2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Sep 2026 23:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789256451; cv=none; b=geYm83ip/ZOolggru1asy64O27oBEqO+x+cB0zPOR23RTSVRxX3v0ktl7eaNKejf5fyIfzuE4flcXFAuKeBYOcpUxfEp28EqoOM2mLeu8G8wJGF8wwRodHcRvvKB9TkediSUIPVOcznYDG7qcMEo+j7E+9dvzTMVIXK2INJdEAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789256451; c=relaxed/simple;
	bh=z24sxkeB/PIqGn75aumPlr0ZOr2b0uuwED8o5g54I2A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AVkD8bE2tIUcJWesmw3FaxOQ5IOgfxIQo5HMQeYoG07K8EnuC9ckN1TB87g4Qm/XtONAxuu/7jiKzbrp+BC/FteQF2hgCwAO7sER9ZuNk1VB8E8BE08APtepI6plOFEENKn0nXtBW1p/fwl1RjCENd+or30Rf600THI0F3TiuxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dnSimbTk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dnSimbTk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789256448; x=1820792448;
  h=date:from:to:cc:subject:message-id;
  bh=z24sxkeB/PIqGn75aumPlr0ZOr2b0uuwED8o5g54I2A=;
  b=dnSimbTkRzMGL/KmkdBZKb0yJS4qdt3NWzx/U8Puk0nfmOnoMAvQQE7b
   axdWKi1Rr6PmeJ1ZLZpkOXRVFrsQKjjnC++bX1KiLkV7UoOpatQNe5W2r
   olpH0fWe1VBFj348d/Vn8IP1+eVj1iLYhxwQvW05RODIWGtr7rF1T3Lqs
   3WECUEXv3OyHh3Gn6Ha5qcP0VByZS657AqzZy0ewhSejArZXvwoAnSqDa
   S6FK8Exh0iAK4qWPOfYjDcq62rPx1TAiXLbbYADUMQ7Ikqnh0d9zyyzjn
   KssGG+MdCAdvZshahjugfGiRSd+c5wegRNdaWnuOcHvwokrSGOAm0raoZ
   g==;
X-CSE-ConnectionGUID: MN+9hkSDQyG4b6KJcjFbzA==
X-CSE-MsgGUID: zgngsqikR+qGQRvlgif9Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="115209282"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="115209282"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 16:40:48 -0700
X-CSE-ConnectionGUID: lQ/bS117SR63jKjTQeIsLQ==
X-CSE-MsgGUID: WKiwuOIMTsSVIs2e8F+NAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="509270"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa012.fm.intel.com with ESMTP; 12 Sep 2026 16:40:46 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5XKq-000000003PL-46oA;
	Sat, 12 Sep 2026 23:40:42 +0000
Date: Sun, 13 Sep 2026 07:39:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 1/1]
 arch/arm64/kvm/hyp/nvhe/power/scmi.c:215:36: sparse: sparse: incorrect type
 in assignment (different address spaces)
Message-ID: <202609130732.bzOBwGXY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   57041e4a7e52342473871000827584f966d8cbd3
commit: 220be807706d350ba6a1f17f0a3586269d844eda [1/1] BACKPORT: FROMLIST: KVM: arm64: pkvm: Support SCMI power domain
config: arm64-randconfig-r123-20260910 (https://download.01.org/0day-ci/archive/20260913/202609130732.bzOBwGXY-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260913/202609130732.bzOBwGXY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609130732.bzOBwGXY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/power/scmi.c:215:36: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *static [assigned] [toplevel] shmem @@     got void * @@
   arch/arm64/kvm/hyp/nvhe/power/scmi.c:215:36: sparse:     expected void [noderef] __iomem *static [assigned] [toplevel] shmem
   arch/arm64/kvm/hyp/nvhe/power/scmi.c:215:36: sparse:     got void *

vim +215 arch/arm64/kvm/hyp/nvhe/power/scmi.c

   191	
   192	int pkvm_init_scmi_pd(struct kvm_power_domain *pd,
   193			      const struct kvm_power_domain_ops *ops)
   194	{
   195		int ret;
   196	
   197		if (!IS_ALIGNED(pd->arm_scmi.shmem_base, PAGE_SIZE) ||
   198		    pd->arm_scmi.shmem_size < PAGE_SIZE) {
   199			return -EINVAL;
   200		}
   201	
   202		if (!scmi_channel.shmem) {
   203			unsigned long shmem;
   204	
   205			/* FIXME: Do we need to mark those pages shared in the host s2? */
   206			ret = __pkvm_create_private_mapping(pd->arm_scmi.shmem_base,
   207							    pd->arm_scmi.shmem_size,
   208							    PAGE_HYP_DEVICE,
   209							    &shmem);
   210			if (ret)
   211				return ret;
   212	
   213			scmi_channel.smc_id = pd->arm_scmi.smc_id;
   214			scmi_channel.shmem_pfn = hyp_phys_to_pfn(pd->arm_scmi.shmem_base);
 > 215			scmi_channel.shmem = (void *)shmem;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
