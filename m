Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B7C8C05
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 17:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692638560; x=1724174560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=frYcrT0VYewuf+Iuo+wYkvHZlmpJHI8nNw5unX5CaWU=;
  b=RmrZIFfdZ/JKN7UPiURlTtAfvqIDn/pUAX1AEXzFE6NA3CvnsYSckeu+
   c1cAZC63xbDqbTtsiBvQYGrzlEkifm7rfN6x0qZLjIL1AswLz5c9XYV4P
   7HEke8684Jpq9W9pf6LjTOnAWCPMZqJmDFlnM61uXlBxG3kipsntuEIX/
   UT1mf+x7fnK2w0Ifw9OKrzBlt6xOaO9iZ6U7agdXIzgBkpy/tl56dzcUk
   R/PNca3YmP6uQvXIuscjO2IrglLndt91/ZbToFUtAjL3msO00dOtGrF/1
   ZwjIDXBvrUfUDV2KqIR7SRcWTDwet5M+te14HNf8uqxrYV2XEsJwAfDIQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="404658666"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="404658666"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 10:22:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="909781729"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="909781729"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Aug 2023 10:22:37 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY8bs-0000jM-0Z;
	Mon, 21 Aug 2023 17:22:36 +0000
Date: Tue, 22 Aug 2023 01:21:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 10448/11214]
 arch/microblaze/include/asm/cacheflush.h:77:13: warning:
 'flush_dcache_folio' defined but not used
Message-ID: <202308220106.VDWkCsdG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47d9bb711707d15b19fad18c8e2b4b027a264a3a
commit: 2fcc20defd8a07415f6b346d941c22c50bbdada5 [10448/11214] microblaze: implement the new page table range API
config: microblaze-allnoconfig (https://download.01.org/0day-ci/archive/20230822/202308220106.VDWkCsdG-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220106.VDWkCsdG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220106.VDWkCsdG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/signal.c:57:
>> arch/microblaze/include/asm/cacheflush.h:77:13: warning: 'flush_dcache_folio' defined but not used [-Wunused-function]
      77 | static void flush_dcache_folio(struct folio *folio)
         |             ^~~~~~~~~~~~~~~~~~


vim +/flush_dcache_folio +77 arch/microblaze/include/asm/cacheflush.h

    76	
  > 77	static void flush_dcache_folio(struct folio *folio)
    78	{
    79		unsigned long addr = folio_pfn(folio) << PAGE_SHIFT;
    80	
    81		flush_dcache_range(addr, addr + folio_size(folio));
    82	}
    83	#define flush_dcache_folio flush_dcache_folio
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
