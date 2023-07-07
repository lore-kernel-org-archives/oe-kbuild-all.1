Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2721775B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 21:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688765112; x=1720301112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pnb6+AKwyQzsqsLO8UDozLYN18pIF+BT90gG2YKCcUk=;
  b=lCyYQhIOHPiHnG8BbCdwV4nJPMc2ywTwfqEoFf75s0OGDb3nYM5WN1Fs
   OvzmnIW/PHP6oRMCa+t3gj8pDhpA0vJ0H7Ztl6J16YtThXvGPM/jLQXsT
   5kZXmuSthetvDdLbtnCq2C3q2+BWJRe2v+wHzovL2F19EEuHxisjwo/WM
   08ymn46EwgbR3z95zKzZr8RkOaW16Zm5QUMV/Wua2L6JqywUX6bJ8sP/L
   /zrs9WMIDXbRW0nfcn9CJ1dJwPRcYVkOxzavBVUaLuDt799L742IKcEg2
   O8OQ5wEstGeYrTXeO578TupZ7A71wxKkOtT5Dw/kQGqU31wlGsFqFYn9A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="348781532"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="348781532"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 14:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="894122169"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="894122169"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Jul 2023 14:25:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHsww-0002JU-1A;
	Fri, 07 Jul 2023 21:25:10 +0000
Date: Sat, 8 Jul 2023 05:24:23 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 17/37] {standard input}:10: Error: symbol
 `__export_symbol_flush_dcache_folio' is already defined
Message-ID: <202307080520.UuCkfBJd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   a357c8502e070a8a7aa2fa94492fd040ae053b78
commit: 125fcada3cb2a5fa5f9d8b48f95d730935552948 [17/37] nios2: Implement the new page table range API
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20230708/202307080520.UuCkfBJd-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080520.UuCkfBJd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080520.UuCkfBJd-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/nios2/mm/cacheflush.c:162:6: warning: no previous prototype for '__flush_dcache_folio' [-Wmissing-prototypes]
     162 | void __flush_dcache_folio(struct address_space *mapping, struct folio *folio)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/nios2/mm/cacheflush.c: In function 'flush_dcache_folio':
   arch/nios2/mm/cacheflush.c:194:48: error: passing argument 2 of 'flush_aliases' from incompatible pointer type [-Werror=incompatible-pointer-types]
     194 |                         flush_aliases(mapping, folio);
         |                                                ^~~~~
         |                                                |
         |                                                struct folio *
   arch/nios2/mm/cacheflush.c:74:71: note: expected 'struct page *' but argument is of type 'struct folio *'
      74 | static void flush_aliases(struct address_space *mapping, struct page *page)
         |                                                          ~~~~~~~~~~~~~^~~~
   arch/nios2/mm/cacheflush.c: In function 'update_mmu_cache_range':
   arch/nios2/mm/cacheflush.c:234:40: error: passing argument 2 of 'flush_aliases' from incompatible pointer type [-Werror=incompatible-pointer-types]
     234 |                 flush_aliases(mapping, folio);
         |                                        ^~~~~
         |                                        |
         |                                        struct folio *
   arch/nios2/mm/cacheflush.c:74:71: note: expected 'struct page *' but argument is of type 'struct folio *'
      74 | static void flush_aliases(struct address_space *mapping, struct page *page)
         |                                                          ~~~~~~~~~~~~~^~~~
   {standard input}: Assembler messages:
>> {standard input}:10: Error: symbol `__export_symbol_flush_dcache_folio' is already defined
   cc1: some warnings being treated as errors

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
