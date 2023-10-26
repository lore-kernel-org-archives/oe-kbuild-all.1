Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0101D52B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 14:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nWDyWR3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698332066; x=1729868066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K8i7nIe3F3eOgkvcLjBqLb7GMwgT2aYRLtO1WqgzgeI=;
  b=nWDyWR3V/8NHKIOcKQZte0rznvfpU0OtAXGHN1mSUvHCUGFo4ra7vVkv
   J3SVqpUtgVL0bqF/DNaHF6nsgmGAhhNaFHfYANcNnIuYB9r5GY79jAzGb
   jcrLgwcqMPOuo1qdShGQn4gqJHgj/otNz2Hr2q9uYfMZ4Z5+JtSczkB6C
   Fpx5GaqgTqoGmIUzcU0tdfrFNytOwBiYsjNQKjaXB5qifGJjiNNv6Td2E
   b3HzIY+39rFq+b+LZc6ypwi9NvRwP/Pv089+qwtPXBJOJK3YHIDa5MdH7
   H1CUj+SkVqne5DmJfw9ESlvGTkXfqEDAs/Fl9VM0xfd8WnMa201c9O6Ri
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="454032883"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="454032883"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 07:54:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="788518392"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="788518392"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 26 Oct 2023 07:54:25 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qw1kc-0009rP-1d;
	Thu, 26 Oct 2023 14:54:22 +0000
Date: Thu, 26 Oct 2023 22:53:24 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and_clear_tmp 27/47]
 arch/powerpc/platforms/pasemi/dma_lib.c:105:20: error: variable 'limit' set
 but not used
Message-ID: <202310262223.en6HF0ip-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and_clear_tmp
head:   8ff28bdbe8eb42074ec3920a5b1d49e18332aad1
commit: fa98624ff045979d246c0f0fc554c92178345c5f [27/47] powerpc: fix opencoded find_and_{set,clear}_bit()
config: powerpc64-randconfig-003-20231026 (https://download.01.org/0day-ci/archive/20231026/202310262223.en6HF0ip-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310262223.en6HF0ip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310262223.en6HF0ip-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/platforms/pasemi/dma_lib.c: In function 'pasemi_alloc_tx_chan':
   arch/powerpc/platforms/pasemi/dma_lib.c:122:66: error: expected ';' before 'return'
     122 |         bit = find_and_clear_next_bit(txch_free, MAX_TXCH, start)
         |                                                                  ^
         |                                                                  ;
     123 |         return bit < limit ? bit : -ENOSPC;
         |         ~~~~~~                                                    
>> arch/powerpc/platforms/pasemi/dma_lib.c:105:20: error: variable 'limit' set but not used [-Werror=unused-but-set-variable]
     105 |         int start, limit;
         |                    ^~~~~
>> arch/powerpc/platforms/pasemi/dma_lib.c:104:13: error: variable 'bit' set but not used [-Werror=unused-but-set-variable]
     104 |         int bit;
         |             ^~~
   arch/powerpc/platforms/pasemi/dma_lib.c:124:1: error: no return statement in function returning non-void [-Werror=return-type]
     124 | }
         | ^
   cc1: all warnings being treated as errors


vim +/limit +105 arch/powerpc/platforms/pasemi/dma_lib.c

8ee9d85779356c Olof Johansson 2007-11-28  101  
8ee9d85779356c Olof Johansson 2007-11-28  102  static int pasemi_alloc_tx_chan(enum pasemi_dmachan_type type)
8ee9d85779356c Olof Johansson 2007-11-28  103  {
8ee9d85779356c Olof Johansson 2007-11-28 @104  	int bit;
8ee9d85779356c Olof Johansson 2007-11-28 @105  	int start, limit;
8ee9d85779356c Olof Johansson 2007-11-28  106  
8ee9d85779356c Olof Johansson 2007-11-28  107  	switch (type & (TXCHAN_EVT0|TXCHAN_EVT1)) {
8ee9d85779356c Olof Johansson 2007-11-28  108  	case TXCHAN_EVT0:
8ee9d85779356c Olof Johansson 2007-11-28  109  		start = 0;
8ee9d85779356c Olof Johansson 2007-11-28  110  		limit = 10;
8ee9d85779356c Olof Johansson 2007-11-28  111  		break;
8ee9d85779356c Olof Johansson 2007-11-28  112  	case TXCHAN_EVT1:
8ee9d85779356c Olof Johansson 2007-11-28  113  		start = 10;
8ee9d85779356c Olof Johansson 2007-11-28  114  		limit = MAX_TXCH;
8ee9d85779356c Olof Johansson 2007-11-28  115  		break;
8ee9d85779356c Olof Johansson 2007-11-28  116  	default:
8ee9d85779356c Olof Johansson 2007-11-28  117  		start = 0;
8ee9d85779356c Olof Johansson 2007-11-28  118  		limit = MAX_TXCH;
8ee9d85779356c Olof Johansson 2007-11-28  119  		break;
8ee9d85779356c Olof Johansson 2007-11-28  120  	}
fa98624ff04597 Yury Norov     2023-10-21  121  
fa98624ff04597 Yury Norov     2023-10-21  122  	bit = find_and_clear_next_bit(txch_free, MAX_TXCH, start)
fa98624ff04597 Yury Norov     2023-10-21  123  	return bit < limit ? bit : -ENOSPC;
8ee9d85779356c Olof Johansson 2007-11-28  124  }
8ee9d85779356c Olof Johansson 2007-11-28  125  

:::::: The code at line 105 was first introduced by commit
:::::: 8ee9d85779356c1dc2ba87aca27fbf9414f2d82b pasemi: DMA engine management library

:::::: TO: Olof Johansson <olof@lixom.net>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
