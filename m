Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2178337A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 00:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675817332; x=1707353332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iSU/wJUqxAA+x/6aRi8yZrp5knPufGQYsub+omXRCR8=;
  b=ggd1GcdxaRRuQDW5jALJyNZpQzxO8ftwv9sTQ4077hHRG9TP+J4ldBjr
   5KiNY+4UsgwqrisQPDhTiPV4zvTO8LadIcUE3cOHiDKd0Mux7THDORS27
   +z/GrLBl7MBfRyY2gOKdapvHiLlhBBTMysLI00DPADU7edhKP8GYjY+ZR
   xAkgMhIPCTcyRvZb+KwtG0l8dz76bsE0dXqCyv3tC4ziMy5gHcj9az+jW
   YfdRItMDyxhA/cb98VtkKV3hJONKpG3uk3DHXneTqeP1HyGb7wH4Ws4Bq
   9ZlJxpfaUJL9DrDuN5TtuaAHh7lJ12+h6lm+/ATW/6G9AngFcOoMBpq24
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="392066876"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="392066876"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 16:48:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="660458010"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="660458010"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 Feb 2023 16:48:41 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPYdc-000412-2l;
	Wed, 08 Feb 2023 00:48:40 +0000
Date: Wed, 8 Feb 2023 08:48:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Yin Fengwei <fengwei.yin@intel.com>, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, david@redhat.com,
	dave.hansen@intel.com, tim.c.chen@intel.com, ying.huang@intel.com
Subject: Re: [PATCH v5 2/5] mm: Add generic set_ptes()
Message-ID: <202302080851.OXQ3usg2-lkp@intel.com>
References: <20230207194937.122543-3-willy@infradead.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230207194937.122543-3-willy@infradead.org>

Hi Matthew,

I love your patch! Yet something to improve:

[auto build test ERROR on next-20230207]
[also build test ERROR on v6.2-rc7]
[cannot apply to linus/master v6.2-rc7 v6.2-rc6 v6.2-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/filemap-Add-filemap_map_folio_range/20230208-041404
patch link:    https://lore.kernel.org/r/20230207194937.122543-3-willy%40infradead.org
patch subject: [PATCH v5 2/5] mm: Add generic set_ptes()
config: arm-randconfig-r016-20230205 (https://download.01.org/0day-ci/archive/20230208/202302080851.OXQ3usg2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1549aed85e99407fbf2600da432b84c0660d2029
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matthew-Wilcox-Oracle/filemap-Add-filemap_map_folio_range/20230208-041404
        git checkout 1549aed85e99407fbf2600da432b84c0660d2029
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:29,
                    from arch/arm/kernel/asm-offsets.c:12:
   include/linux/pgtable.h: In function 'set_ptes':
>> include/linux/pgtable.h:1458:17: error: implicit declaration of function 'set_pte_at'; did you mean 'set_ptes'? [-Werror=implicit-function-declaration]
    1458 |                 set_pte_at(mm, addr, ptep, pte);
         |                 ^~~~~~~~~~
         |                 set_ptes
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: arch/arm/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1458 include/linux/pgtable.h

  1441	
  1442	#ifndef set_ptes
  1443	/**
  1444	 * set_ptes - Map consecutive pages to a contiguous range of addresses.
  1445	 * @mm: Address space to map the pages into.
  1446	 * @addr: Address to map the first page at.
  1447	 * @ptep: Page table pointer for the first entry.
  1448	 * @pte: Page table entry for the first page.
  1449	 * @nr: Number of pages to map.
  1450	 *
  1451	 * Context: The caller holds the page table lock.  The PTEs all lie
  1452	 * within a single PMD (and VMA, and folio).
  1453	 */
  1454	static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
  1455			pte_t *ptep, pte_t pte, unsigned int nr)
  1456	{
  1457		for (;;) {
> 1458			set_pte_at(mm, addr, ptep, pte);
  1459			if (--nr == 0)
  1460				break;
  1461			ptep++;
  1462			addr += PAGE_SIZE;
  1463			/* This works for x86.  Check how PTEs are encoded */
  1464			pte = __pte(pte_val(pte) + PAGE_SIZE);
  1465		}
  1466	}
  1467	#endif
  1468	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
