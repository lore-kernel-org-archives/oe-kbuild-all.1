Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A32A1F92E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 11:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772192093; cv=none; b=dijuex2UzcCyHZ0o65UDMC13cFFlcR1LBK9tmI9E/sRVfv3Dm3erXhqkMqkPTGtxbxN7h4QMIrShoFZMqJz6v6hagQNJfcVHjW8OZicypceTCa1lbUjXEFgUEC0P/nrZVZZknRSc3epy/N737Q4Ee1UEsE3n1vX3XmYG88ZKcPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772192093; c=relaxed/simple;
	bh=OblGfzaF+VBpdnWcRHdn5EajEKgDxcJz5yAyDQkfJBY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L88e6Q//o1eAPoiWReki8F5bHEIU9bnK/45qCOfy07zvPoGD384C9lwCbpC2n3Ofal/pahaZ0mFoDAkMlLvcihCEce0DZ/yYGBVv/XJXuQNtiLkKKUw+/6H9IzyjM7CG5HBGibb6MKfEGtbosGm0aArm2mEMvtWB0EOT40m54PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AYYYqyQ6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AYYYqyQ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772192092; x=1803728092;
  h=date:from:to:cc:subject:message-id;
  bh=OblGfzaF+VBpdnWcRHdn5EajEKgDxcJz5yAyDQkfJBY=;
  b=AYYYqyQ6cFWfFnVoNH49JBvu8YNN/nXrDIhXPn3Y0RvPH+TwD2fLFoav
   FKivL9cc+fVtFDAkX0MDeo9WFlcUA2tLtgrA8VlxabLwlX0c5z4zEXcPH
   Q1h8VfxDGS4u7onkTUEMhGsnRqdRWV8fTEgXnGMUlKpO3E/z5cW7dvAtr
   GoXJJa3rkCJk6pUr+RCmdOobjueVPoE5w9GSaLZ+blp1vh6LcqgoGqnmG
   VWc/9MyrDOqGXpP2r/W9QGbRwMtQZ6tZhMhA9Xe+5wC2rgBQM/tPXTX5K
   So0lDC2m0ed1z2wS4aag5HEoZXWib0Xf8HKjQmh6eV8sMug3RfA6zz/aX
   g==;
X-CSE-ConnectionGUID: vrE1LQ/wTRuMEN2R8y8yvw==
X-CSE-MsgGUID: jjYvAtw7RiqC13/26+tn8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73144564"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="73144564"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 03:34:52 -0800
X-CSE-ConnectionGUID: +35i5BsoRxS3CezNFAiNag==
X-CSE-MsgGUID: 6Ys6QTrKTJOnrfwWDmDxKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="215048563"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 27 Feb 2026 03:34:50 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvw6S-00000000AW5-06PL;
	Fri, 27 Feb 2026 11:34:13 +0000
Date: Fri, 27 Feb 2026 19:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3] iommu.c:undefined
 reference to `iommu_free_pages'
Message-ID: <202602271917.wPzs6BMp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   71f2074b8c1e4e009b1e126ca1a2a9ce14201030
commit: 6ace5be5937cc205a98e4738d000581686a7c3d9 [3/3] ANDROID: KVM: arm64: iommu: Implement IOMMU subsystem accounting
config: arm64-randconfig-r071-20260226 (https://download.01.org/0day-ci/archive/20260227/202602271917.wPzs6BMp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602271917.wPzs6BMp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602271917.wPzs6BMp-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: arch/arm64/kvm/iommu.o: in function `hyp_mc_iommu_free_fn':
>> iommu.c:(.text+0x3d4): undefined reference to `iommu_free_pages'
   aarch64-linux-ld: arch/arm64/kvm/iommu.o: in function `hyp_mc_iommu_alloc_gfp_fn':
>> iommu.c:(.text+0x404): undefined reference to `iommu_alloc_pages_node_sz'
   aarch64-linux-ld: arch/arm64/kvm/iommu.o: in function `__free_hyp_memcache.constprop.0':
   iommu.c:(.text+0x5d0): undefined reference to `iommu_free_pages'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
