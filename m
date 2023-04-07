Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A834C79
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 13:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680873708; x=1712409708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qvqwJ4pwfKFRcPNBp/3PEct6mOmxCu1edlhgCN4sqhw=;
  b=A4LT1ahPn3EzsGdD5AuopvOC7lzQdS6UoXca/iRKsNXJ0IL0HatUWmBX
   AmjGTREwsdjGCdTvDWbTY2k9y3x6DBPKw1zJ4U3MOxxGnnZZlHZrP/ehH
   OGnNCZsibzLSpA9Axz+uqWjve79d20vzSQ9vQ6v0BIwJRUM2V3BlA+lrH
   EXw9oovkE6uIVYvTKt97BP3JP6cu9hTN2c4KosVpEc9ye/8VCblGxRR6C
   MqF+3tFsB1FL03ToIH3VK3Py6GjStJcR5HliWQagEzqgrQCQnzhBm91nf
   SLw7Piq1Gmqg97QVgfys0De8mW55kTN+YYj6z3Qbz0zrB81cBewt5455w
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="370819723"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="370819723"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 06:21:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="756708743"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="756708743"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Apr 2023 06:21:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkm2D-000SWj-2h;
	Fri, 07 Apr 2023 13:21:45 +0000
Date: Fri, 7 Apr 2023 21:21:37 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:linux-next 2/2] arch/csky/abiv2/cacheflush.c:15:9:
 error: implicit declaration of function 'flush_tlb_page'; did you mean
 'flush_anon_page'?
Message-ID: <202304072150.W4WrVyil-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux linux-next
head:   b65c17eec0cd943ac1bbab3e57f1b73c1432dcef
commit: b65c17eec0cd943ac1bbab3e57f1b73c1432dcef [2/2] csky: mmu: Prevent spurious page faults
config: csky-buildonly-randconfig-r003-20230403 (https://download.01.org/0day-ci/archive/20230407/202304072150.W4WrVyil-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/c-sky/csky-linux/commit/b65c17eec0cd943ac1bbab3e57f1b73c1432dcef
        git remote add csky-linux https://github.com/c-sky/csky-linux
        git fetch --no-tags csky-linux linux-next
        git checkout b65c17eec0cd943ac1bbab3e57f1b73c1432dcef
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304072150.W4WrVyil-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/csky/abiv2/cacheflush.c: In function 'update_mmu_cache':
>> arch/csky/abiv2/cacheflush.c:15:9: error: implicit declaration of function 'flush_tlb_page'; did you mean 'flush_anon_page'? [-Werror=implicit-function-declaration]
      15 |         flush_tlb_page(vma, address);
         |         ^~~~~~~~~~~~~~
         |         flush_anon_page
   cc1: some warnings being treated as errors


vim +15 arch/csky/abiv2/cacheflush.c

     8	
     9	void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
    10			      pte_t *pte)
    11	{
    12		unsigned long addr;
    13		struct page *page;
    14	
  > 15		flush_tlb_page(vma, address);
    16	
    17		if (!pfn_valid(pte_pfn(*pte)))
    18			return;
    19	
    20		page = pfn_to_page(pte_pfn(*pte));
    21		if (page == ZERO_PAGE(0))
    22			return;
    23	
    24		if (test_and_set_bit(PG_dcache_clean, &page->flags))
    25			return;
    26	
    27		addr = (unsigned long) kmap_atomic(page);
    28	
    29		dcache_wb_range(addr, addr + PAGE_SIZE);
    30	
    31		if (vma->vm_flags & VM_EXEC)
    32			icache_inv_range(addr, addr + PAGE_SIZE);
    33	
    34		kunmap_atomic((void *) addr);
    35	}
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
