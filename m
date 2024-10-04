Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C1C8249F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 18:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728065376; cv=none; b=HTtm1biXsb5xmpcyEU2VT/GQ/d1L4RZkWDH6Dx6QfCzOpoloAxeihjHLFYRvlQYFQoV6AXs9SHFgkw6S9GTYZeihODqY5vA9jKpez0Ikffru2hF6eMlgETNrUWQLQ0ZY4aKxFQCpw9zusJtVYCTLXakmrmxNudkrxLmDZ6nq/7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728065376; c=relaxed/simple;
	bh=FOx3TiolOs7NwWGdsvQFeFqcAOzq8vY0oKisYJtmAgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTi9jTxhOCpfq3VhWy/dIwGWdOIrZZ+Cyb8WNsTdxUjjQAECz/icT0EF+x4Md8CqwKe0gVI6mG8KsDdhQzeRLTaBs0S9r1TzrZLNCjykVgb6PtsV5wSTBhtyb0E9LQLtNRZSyrZUURc+oWhS1DDrCtDZHC3FKUD6hV0b5bGzf6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LnluVA0z; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LnluVA0z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728065375; x=1759601375;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FOx3TiolOs7NwWGdsvQFeFqcAOzq8vY0oKisYJtmAgk=;
  b=LnluVA0zjuSsKhjLBep5Pl7qok7h36IB3UmFdiEHhxJNet41YxbgWtI+
   lOFq6l13D0RFCqgNgqqx7ql/gxJjrJxlMR2C/a7rQr+J7AmxA7JclBG+Q
   fMcTsVfw7p93DmgoHNSBQ3wxisERl4J293U3u33fz3MzF6oAI1lQ8bnMK
   nCeOtrS03nJ2OxyTTuZnnHwGvazWdtTcgAOkJpeb9xVO0yTu1grsTdTzH
   CoIHyi9BJJZRIPUHfLAMIjD0lexAHYl4DHHBOUyPzNUPe4ILa8bZYxXkU
   5HeXhDAoWOvxUhcB1HyKt2uS5DVTkKpxjUwmwpCVqbOMDBKHAgAg55gE1
   g==;
X-CSE-ConnectionGUID: /ItGLQmTSq2JkIxZ5dN7zg==
X-CSE-MsgGUID: 0Nk0xUCYQxeRW1UIjhb8OA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="44763320"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="44763320"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 11:09:35 -0700
X-CSE-ConnectionGUID: 6LSlR4SlRxO/FY8Nwe/Brg==
X-CSE-MsgGUID: PzUIQZwJQPOUhaSEG0xviw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="105530445"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Oct 2024 11:09:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swmk7-00023I-1i;
	Fri, 04 Oct 2024 18:09:31 +0000
Date: Sat, 5 Oct 2024 02:08:33 +0800
From: kernel test robot <lkp@intel.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 bpf-next 2/3] mm/bpf: Add bpf_get_kmem_cache() kfunc
Message-ID: <202410050149.QCPhh01T-lkp@intel.com>
References: <20241002180956.1781008-3-namhyung@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002180956.1781008-3-namhyung@kernel.org>

Hi Namhyung,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9502a7de5a61bec3bda841a830560c5d6d40ecac]

url:    https://github.com/intel-lab-lkp/linux/commits/Namhyung-Kim/bpf-Add-kmem_cache-iterator/20241003-021144
base:   9502a7de5a61bec3bda841a830560c5d6d40ecac
patch link:    https://lore.kernel.org/r/20241002180956.1781008-3-namhyung%40kernel.org
patch subject: [PATCH v4 bpf-next 2/3] mm/bpf: Add bpf_get_kmem_cache() kfunc
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241005/202410050149.QCPhh01T-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410050149.QCPhh01T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050149.QCPhh01T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/thread_info.h:17,
                    from include/linux/thread_info.h:60,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from mm/slab_common.c:7:
   mm/slab_common.c: In function 'bpf_get_kmem_cache':
>> arch/arm64/include/asm/memory.h:427:66: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     427 |         __is_lm_address(__addr) && pfn_is_map_memory(virt_to_pfn(__addr));      \
         |                                                                  ^~~~~~
         |                                                                  |
         |                                                                  u64 {aka long long unsigned int}
   mm/slab_common.c:1334:14: note: in expansion of macro 'virt_addr_valid'
    1334 |         if (!virt_addr_valid(addr))
         |              ^~~~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:382:53: note: expected 'const void *' but argument is of type 'u64' {aka 'long long unsigned int'}
     382 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~


vim +/virt_to_pfn +427 arch/arm64/include/asm/memory.h

4f04d8f0054511 Catalin Marinas 2012-03-05  424  
68dd8ef321626f Will Deacon     2019-08-13  425  #define virt_addr_valid(addr)	({					\
91cb2c8b072e00 Catalin Marinas 2021-02-01  426  	__typeof__(addr) __addr = __tag_reset(addr);			\
873ba463914cf4 Mike Rapoport   2021-06-30 @427  	__is_lm_address(__addr) && pfn_is_map_memory(virt_to_pfn(__addr));	\
68dd8ef321626f Will Deacon     2019-08-13  428  })
4f04d8f0054511 Catalin Marinas 2012-03-05  429  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
