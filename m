Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E195D179A2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 08:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="db++Bv4s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701074183; x=1732610183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OMiaSPz2lvh6rMJ9002RnlhoTiuoF3QujEVFdhr1e2Y=;
  b=db++Bv4s22sRIpsvO4hzsoQ77e4dTY5i0CBrKvt98tu6q0T/TC7EOYQo
   nROG3RT3kJOK6NnCd3iYJdCv0KmM8zjoDAmjSklEptcQ6lFgSpdaEEGFI
   1UHDSWBZTT8gQf9a2MAi0Io4c43MC9HWlPmFkkYN2kNLGbkA5kfq/Z9yx
   PPO5PYhRDlYBHQytDFdY42aWzSWK0N4KdMeUXQbvzEZcKq6tQkV2N1jfx
   b8zsM6tSw7/ni2wEVGzyDjsDk67xnT5qo36gOAn/wrhwuTGAt1CaO+zQZ
   nHdwHll/AgRsDiJwfQGaBc2ZucN1Z6MY6sua6wcrVpz3EMcRrBioCKred
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="396568151"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="396568151"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 00:36:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="9564110"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Nov 2023 00:36:21 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7X6H-00063z-2s;
	Mon, 27 Nov 2023 08:36:17 +0000
Date: Mon, 27 Nov 2023 16:35:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: mm: still create swiotlb buffer for kmalloc()
 bouncing if required
Message-ID: <202311271323.n71NKhJ5-lkp@intel.com>
References: <20231126162528.2411-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126162528.2411-1-jszhang@kernel.org>

Hi Jisheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7-rc3 next-20231127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/riscv-mm-still-create-swiotlb-buffer-for-kmalloc-bouncing-if-required/20231127-014531
base:   linus/master
patch link:    https://lore.kernel.org/r/20231126162528.2411-1-jszhang%40kernel.org
patch subject: [PATCH] riscv: mm: still create swiotlb buffer for kmalloc() bouncing if required
config: riscv-randconfig-002-20231127 (https://download.01.org/0day-ci/archive/20231127/202311271323.n71NKhJ5-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311271323.n71NKhJ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311271323.n71NKhJ5-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/mm/init.c: In function 'mem_init':
>> arch/riscv/mm/init.c:171:13: error: 'dma_cache_alignment' undeclared (first use in this function); did you mean 'dma_get_cache_alignment'?
     171 |             dma_cache_alignment != 1) {
         |             ^~~~~~~~~~~~~~~~~~~
         |             dma_get_cache_alignment
   arch/riscv/mm/init.c:171:13: note: each undeclared identifier is reported only once for each function it appears in


vim +171 arch/riscv/mm/init.c

   169	
   170		if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb &&
 > 171		    dma_cache_alignment != 1) {
   172			/*
   173			 * If no bouncing needed for ZONE_DMA, allocate 1MB swiotlb
   174			 * buffer per 1GB of RAM for kmalloc() bouncing on
   175			 * non-coherent platforms.
   176			 */
   177			unsigned long size =
   178				DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
   179			swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
   180			swiotlb = true;
   181		}
   182	
   183		swiotlb_init(swiotlb, SWIOTLB_VERBOSE);
   184		memblock_free_all();
   185	
   186		print_vm_layout();
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
