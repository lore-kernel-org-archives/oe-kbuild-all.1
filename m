Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D908511CB3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 21:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692652053; x=1724188053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oU5p9PEl6aDI5ksuYMe5ZApkuQoNn6dta1THhY+xYqw=;
  b=V2nrlgDjUe6ObzI48nRjSw+GqcV5kXR+0Y2Cvk39gz3MLqF4qnalk4jJ
   LKGKZwpcUdisioL6tf714X/hWO1HIyJ4rFBANh6BjAuGtFbCDj0LWW/OZ
   Vx6smQD9dVvMn0VmszeRsnbaURqnhWXu5g39L+lvVQNlUZT3QNZM1Qsh2
   sCC5+y3oIF+Dxl/pOUM1egh/ojqbTSP/eqstMEOSH//y8FudsZX2Omgeo
   eBPAgCrfntNbUtect5omYNgeWSWsLTy1LdSvdgY20qPQ0om9qdOWP8ooP
   qVpI34Zbr+psR7k+AQXfW2V/LMJwFawPPbo9bzfFHjfBGJfSzaSAqTqoA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="353275414"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="353275414"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 14:07:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="909846005"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="909846005"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Aug 2023 14:07:27 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYC7S-0000vU-2G;
	Mon, 21 Aug 2023 21:07:26 +0000
Date: Tue, 22 Aug 2023 05:07:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 10115/10848]
 arch/microblaze/include/asm/cacheflush.h:77:13: warning:
 'flush_dcache_folio' defined but not used
Message-ID: <202308220517.9ZeSFZc3-lkp@intel.com>
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
commit: de462526918b9c8d840cae797e9a8ff425c55c83 [10115/10848] microblaze: implement the new page table range API
config: microblaze-randconfig-r032-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220517.9ZeSFZc3-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220517.9ZeSFZc3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220517.9ZeSFZc3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/signal.c:57:
>> arch/microblaze/include/asm/cacheflush.h:77:13: warning: 'flush_dcache_folio' defined but not used [-Wunused-function]
      77 | static void flush_dcache_folio(struct folio *folio)
         |             ^~~~~~~~~~~~~~~~~~
--
   arch/microblaze/kernel/ftrace.c:22:6: warning: no previous prototype for 'prepare_ftrace_return' [-Wmissing-prototypes]
      22 | void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr)
         |      ^~~~~~~~~~~~~~~~~~~~~
   In file included from arch/microblaze/kernel/ftrace.c:14:
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
