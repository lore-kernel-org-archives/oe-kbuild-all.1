Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AFE3716D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 03:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729307603; cv=none; b=K6m7rGuQDQFdP7qF7Zvz8w01aTs5rL1yQ+Iezd+DOBl1uXfoXSU15I7Ldp51H3kdRmUk+BhCF2dK1SpOthacsRTTLWrerxGuyqYEk3wacRASfklBI9yMvxBODhVtoeVKzNORB+a3HFUfapSSWftrJGkMeGstgE40reN99eft+v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729307603; c=relaxed/simple;
	bh=J391a9ic4Smc2mXX38suk4F88UxKK+5RENyP5Mi0n3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=evPIgAZUl4UN/W/jUlOSbY1Xo4osF2j9vOYaNm8yxFqGpCSYU+JiE1WP9eC+nBXcWPT16Mj2E+WTvdwXAHr1D6EvqIVxY62FbOigWssmBqJD2LlMpi24VATuF0BtrYd7ipIGA12rzUNfLeui485qp+Km/24zvtT2jxU5RA/0f7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODq5629f; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODq5629f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729307602; x=1760843602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J391a9ic4Smc2mXX38suk4F88UxKK+5RENyP5Mi0n3I=;
  b=ODq5629fDCCaKyiMLu7eQ2ywn32olqqLOYtpIAg6DsxeVlcCSyTLr42I
   +wpBqbDsbcp4PoEd0rHv1ZEav9iK6aFJETyVIhVChkDNGmChHbpOoOFAv
   UtYf3ZvOFLUhaHgBUvTSK5Yfl1osVxchzlA3WGpjqvU4EpnFNl+0fegFX
   J6YGMAVK3MrY/4gvl0pD2HBoz6WIHL9ntqRVqCFQbX/hnkVfEGvS7Su0q
   4rzHnR5xZGAiYhP8HGa+n0Kij02k9KazQmWGhCrAOHFAMl6NqGThyMnP/
   /nxYb3QcB7WArAo10Yyn1LZNxq5OdcCxwKrudbAwMmQSNrR1b+GneGeIW
   g==;
X-CSE-ConnectionGUID: 4ePNSqDtS+6GVtcSAnvf+A==
X-CSE-MsgGUID: Awkbf88DQu6p6c1+flKASQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29012315"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29012315"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 20:13:21 -0700
X-CSE-ConnectionGUID: 92Lm1IqVQQCpdIauzc6XrA==
X-CSE-MsgGUID: AMLCLGKzSt2MYTZw428xOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="116490932"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Oct 2024 20:13:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1zu1-000Oda-1c;
	Sat, 19 Oct 2024 03:13:17 +0000
Date: Sat, 19 Oct 2024 11:12:22 +0800
From: kernel test robot <lkp@intel.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [namhyung-perf:bpf/slab-iter-v5 2/3] mm/slab_common.c:1334:7:
 warning: incompatible integer to pointer conversion passing 'typeof (addr)'
 (aka 'unsigned long long') to parameter of type 'const void *'
Message-ID: <202410191150.GY2QNbsx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/namhyung/linux-perf.git bpf/slab-iter-v5
head:   51211d24e3591d9fca2f4f7f4c0b86f9a158d99d
commit: 5526cfecf481020db6a97c20b44511f4a0cd7a7e [2/3] mm/bpf: Add bpf_get_kmem_cache() kfunc
config: arm64-randconfig-r061-20241019 (https://download.01.org/0day-ci/archive/20241019/202410191150.GY2QNbsx-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410191150.GY2QNbsx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191150.GY2QNbsx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/slab_common.c:1334:7: warning: incompatible integer to pointer conversion passing 'typeof (addr)' (aka 'unsigned long long') to parameter of type 'const void *' [-Wint-conversion]
           if (!virt_addr_valid(addr))
                ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:427:59: note: expanded from macro 'virt_addr_valid'
           __is_lm_address(__addr) && pfn_is_map_memory(virt_to_pfn(__addr));      \
                                                                    ^~~~~~
   arch/arm64/include/asm/memory.h:382:53: note: passing argument to parameter 'kaddr' here
   static inline unsigned long virt_to_pfn(const void *kaddr)
                                                       ^
   1 warning generated.


vim +1334 mm/slab_common.c

  1329	
  1330	__bpf_kfunc struct kmem_cache *bpf_get_kmem_cache(u64 addr)
  1331	{
  1332		struct slab *slab;
  1333	
> 1334		if (!virt_addr_valid(addr))
  1335			return NULL;
  1336	
  1337		slab = virt_to_slab((void *)(long)addr);
  1338		return slab ? slab->slab_cache : NULL;
  1339	}
  1340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
