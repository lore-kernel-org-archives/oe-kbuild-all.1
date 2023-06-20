Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2512B2AB42
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 23:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687304985; x=1718840985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X4nN5xbT3xV5EkZPfPJ6W9ZJf380gpj4h0bt84nyojo=;
  b=ETU5nXrIalU0Q8YZZT8cYvcfKaDYLWpq6INy8sdWLCj6baKnK9CidbIE
   CM9LaCaRCoiCYOxG5iSmdY9Gq7tgQf3o4GrUxzzmB6iFWQJqZHCkp2G5g
   esOmlXFAKj5rghbLafE9sUhwz6dfiru2YTsd3V9T/vxpJORvcvYLXZkqC
   oSQs5pOgsU0ZWsxZHb0h6seh1rtYPLlajmf6fFUtIBFE21Xd+w4eRzwSB
   ZajVJDFgJh9CgYyX2GVk2LQUMq47axXnhjfrySqNqf0m934Qn16w1rz5x
   Ot1RdItXc64+akHReyn2MiXIPko0MlBOHxWJcees2iLkJSbV9PnoQ5Svy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="339629836"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="339629836"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 16:49:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="858764030"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="858764030"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Jun 2023 16:49:44 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBl6W-0006Le-01;
	Tue, 20 Jun 2023 23:49:44 +0000
Date: Wed, 21 Jun 2023 07:49:01 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [esmil:jh7100-dmapool 29/39]
 drivers/soc/sifive/sifive_ccache.c:136:6: warning: no previous prototype for
 'ccache_flush_range'
Message-ID: <202306210728.KvxvNk48-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux jh7100-dmapool
head:   41d6f3f3b3698aab55a40592597677c448a7093a
commit: 80a36ded0af5c85fbd775b39b74f09f8348c7afb [29/39] soc: sifive: ccache: Support cache flushing operations
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20230621/202306210728.KvxvNk48-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210728.KvxvNk48-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306210728.KvxvNk48-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/sifive/sifive_ccache.c:136:6: warning: no previous prototype for 'ccache_flush_range' [-Wmissing-prototypes]
     136 | void ccache_flush_range(phys_addr_t start, size_t len)
         |      ^~~~~~~~~~~~~~~~~~


vim +/ccache_flush_range +136 drivers/soc/sifive/sifive_ccache.c

   134	
   135	#ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
 > 136	void ccache_flush_range(phys_addr_t start, size_t len)
   137	{
   138		phys_addr_t end = start + len;
   139		phys_addr_t line;
   140	
   141		if (!len)
   142			return;
   143	
   144		mb();
   145		for (line = ALIGN_DOWN(start, SIFIVE_CCACHE_LINE_SIZE); line < end;
   146				line += SIFIVE_CCACHE_LINE_SIZE) {
   147	#ifdef CONFIG_32BIT
   148			writel(line >> 4, ccache_base + SIFIVE_CCACHE_FLUSH32);
   149	#else
   150			writeq(line, ccache_base + SIFIVE_CCACHE_FLUSH64);
   151	#endif
   152			mb();
   153		}
   154	}
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
