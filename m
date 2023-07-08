Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E8479FA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jul 2023 16:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688832091; x=1720368091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+vJWjgSc4ZaOqtJjVoLMtv7ArbIWpapLs+nK78yhrz8=;
  b=kalZeFyKDpjT0Ubk4EuoVgvciYQxRSxs2Eoe6LHhWH/FMsQcaUD3IbLf
   vuPGWov2bq7L3G0203wB+22gXNdvOCC6PyWKbG41xqRL4CTJBBGS6VQTI
   BAl9qY4lLjQPhUHoK/on/VNIRAI0LkKo0Rb729lZ9vjiYBMN/1tuFl8cP
   qRUkztQybmmnD0gr9lK29pDqu2UVxHk7FGm646LZRHzmZQhShlIYacQvx
   rA1LG257tHPbuvNn62wuiyV1dpxQzSkwXiHBCVPwFF7YHQW74avNCNwD5
   vf+Y5pC75zTD4g0XdyPh8Qv3YI+oArchiOwZjnvpON+8h3yhNzw0v/sde
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10765"; a="364112715"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="364112715"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2023 09:01:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10765"; a="755512946"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="755512946"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Jul 2023 09:01:29 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIANE-0002m2-2S;
	Sat, 08 Jul 2023 16:01:28 +0000
Date: Sun, 9 Jul 2023 00:00:40 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 17/38]
 arch/mips/include/asm/pgtable.h:227:30: error: lvalue required as left
 operand of assignment
Message-ID: <202307082311.dSEvqgZu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   7060937be3a5f61655bba15cf777da99cacc3081
commit: af2a84d6a76e3a436c45a2c083557970781ca371 [17/38] mips: Implement the new page table range API
config: mips-gpr_defconfig (https://download.01.org/0day-ci/archive/20230708/202307082311.dSEvqgZu-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307082311.dSEvqgZu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307082311.dSEvqgZu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from arch/mips/kernel/asm-offsets.c:15:
   arch/mips/include/asm/pgtable.h: In function 'set_ptes':
>> arch/mips/include/asm/pgtable.h:227:30: error: lvalue required as left operand of assignment
     227 |                 pte_val(pte) += 1 << PFN_PTE_SHIFT;
         |                              ^~
   make[3]: *** [scripts/Makefile.build:116: arch/mips/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +227 arch/mips/include/asm/pgtable.h

   203	
   204	static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
   205			pte_t *ptep, pte_t pte, unsigned int nr)
   206	{
   207		unsigned int i;
   208		bool do_sync = false;
   209	
   210		for (i = 0; i < nr; i++) {
   211			if (!pte_present(pte))
   212				continue;
   213			if (pte_present(ptep[i]) &&
   214			    (pte_pfn(ptep[i]) == pte_pfn(pte)))
   215				continue;
   216			do_sync = true;
   217		}
   218	
   219		if (do_sync)
   220			__update_cache(addr, pte);
   221	
   222		for (;;) {
   223			set_pte(ptep, pte);
   224			if (--nr == 0)
   225				break;
   226			ptep++;
 > 227			pte_val(pte) += 1 << PFN_PTE_SHIFT;
   228		}
   229	}
   230	#define set_ptes set_ptes
   231	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
