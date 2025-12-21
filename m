Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450D231D739
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 23:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766360549; cv=none; b=g11Mt8tBqfyXQNJ2rcbR9+39/e1lsZkr+Eni29IxZdTvtSCI51E/lQim85EPNHAe47Z4sUf1Gg+Wzt+AxEJCaQMghY+HOIkFaAd+zYFJtgJ3D83zdpDW+y9V5RY7h/FhAV2cDIPlVs54D8aE6hdVoFbxH0Vih4fc1CyeNhuEFfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766360549; c=relaxed/simple;
	bh=gGxGbnasspaVRRI7by5dOPE84jKe4QonzMZG00rj0ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BxhwhRFMKmjUbgrIf/3jZxbNi6cI1nTt3570F5RlXwRj/qUo/iFRdckGEf2hGP97B+l9Cz/OOFxBzfj61lnaylgbwAZ6xMLmqhLKLyeLbkiAcq7kjxcpQBP4/a8rQnVdlwZKNn88TkzHAUGUvqi8mrp5j5nj25HeMVSNEzZ0mhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zsk4KVzh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zsk4KVzh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766360547; x=1797896547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gGxGbnasspaVRRI7by5dOPE84jKe4QonzMZG00rj0ik=;
  b=Zsk4KVzhrJ22uKxgGB/U5pz3GMpTZex1My9Q97G7t3LtM6RvmV9zEOzP
   vA9OCY8DBnELCdDPJIAU2581jjlKCiJQNfGze1UUygLJE4SUmzks7hFqh
   ZoFbR0z+YfpIJmFAsuQnHfHiKjEpcg67YLU3SNALyYtmZ8CNOXtWWhaNM
   V8ChzBsATtQU4zIMCFQHHViO6FpocBqZwlDytHJudHAyBnjTNkMx2kpjL
   3DPI2L2AahvTWcKUz/TnDbKOGVzq666ofnYKsZuwSEpbdngHdfqluXi8T
   A0kO/jpTIhAWS91m4xwmz1HLdk7/+Y0rynuifzrLnKcyXYcZGomhl3BWQ
   A==;
X-CSE-ConnectionGUID: F6oP7SjpQyWfKN23fijKfg==
X-CSE-MsgGUID: eW+EQvlpTF2POzE+QJQm6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="79588027"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="79588027"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 15:42:26 -0800
X-CSE-ConnectionGUID: r93/8ivDRxKA/B+8tTPRGA==
X-CSE-MsgGUID: 0Kw/AbA4S4SkWxcQYJvWJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199403859"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Dec 2025 15:42:24 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXT49-000000000It-2tdX;
	Sun, 21 Dec 2025 23:42:21 +0000
Date: Mon, 22 Dec 2025 07:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, Ryan Roberts <ryan.roberts@arm.com>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	Kevin Brodsky <kevin.brodsky@arm.com>
Subject: Re: [PATCH] powerpc/mm: export symbols for lazy_mmu_mode KUnit tests
Message-ID: <202512220735.UL4ukFLo-lkp@intel.com>
References: <20251217163812.2633648-1-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217163812.2633648-1-kevin.brodsky@arm.com>

Hi Kevin,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20251218-003955/Kevin-Brodsky/powerpc-64s-Do-not-re-activate-batched-TLB-flush/20251215-230757
base:   the 14th patch of https://lore.kernel.org/r/20251215150323.2218608-15-kevin.brodsky%40arm.com
patch link:    https://lore.kernel.org/r/20251217163812.2633648-1-kevin.brodsky%40arm.com
patch subject: [PATCH] powerpc/mm: export symbols for lazy_mmu_mode KUnit tests
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20251222/202512220735.UL4ukFLo-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220735.UL4ukFLo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220735.UL4ukFLo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/mm/book3s64/hash_tlb.c:33:1: warning: data definition has no type or storage class
      33 | EXPORT_SYMBOL_IF_KUNIT(ppc64_tlb_batch); /* For lazy_mmu_mode KUnit tests */
         | ^~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/mm/book3s64/hash_tlb.c:33:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_IF_KUNIT' [-Wimplicit-int]
   arch/powerpc/mm/book3s64/hash_tlb.c:33:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   arch/powerpc/mm/book3s64/hash_tlb.c:158:1: warning: data definition has no type or storage class
     158 | EXPORT_SYMBOL_IF_KUNIT(__flush_tlb_pending); /* For lazy_mmu_mode KUnit tests */
         | ^~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/mm/book3s64/hash_tlb.c:158:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_IF_KUNIT' [-Wimplicit-int]
   arch/powerpc/mm/book3s64/hash_tlb.c:158:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]


vim +33 arch/powerpc/mm/book3s64/hash_tlb.c

    31	
    32	DEFINE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
  > 33	EXPORT_SYMBOL_IF_KUNIT(ppc64_tlb_batch); /* For lazy_mmu_mode KUnit tests */
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
