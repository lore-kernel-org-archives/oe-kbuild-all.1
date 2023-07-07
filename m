Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B947174DF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 22:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688769494; x=1720305494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B1Ci6l1aW3PSXlAj/58pPIsDTg5RzzGfwr17Tcf0Knw=;
  b=kYGEM0NFww/6IdY0wyjZGZeznz+rLakB7mosKqJvGNqYcl3itcoEHdzj
   ZDZcRegbbgNXPNuZ6vedS5gONq4yIxrPgsDTa0wER/Du34zTSszDy1eIj
   k600Cx5Tt64UjB7ClmIRMc2b2WvvDkkWmoGPRglJLDeOgLMxL/SnZnThv
   EvPHosCJY6xBcItmqpeq/YLMqulfuFYS51yvKrbkQLWLP/hHZ3uM7XGbj
   t2rI6tlv7Z8pp9bgre/L5C5SYUcE0A/CNdBZDhD1/Sq6c/Z1YHPVN0Vi0
   /ppaSihajDQokcUzevQ6+fRT5ZUEPRdk5krbR9ef7piqdQVRMa7SOuiO2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="361463575"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="361463575"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 15:38:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="864699831"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="864699831"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2023 15:38:12 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHu5b-0002Lm-22;
	Fri, 07 Jul 2023 22:38:11 +0000
Date: Sat, 8 Jul 2023 06:38:00 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 8/37] filemap.c:undefined reference to
 `flush_dcache_folio'
Message-ID: <202307080633.DcGVpq3d-lkp@intel.com>
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
commit: 6a318c90f141321a62598894caba1bdacf01eb9b [8/37] arm: Implement the new page table range API
config: arm-imxrt_defconfig (https://download.01.org/0day-ci/archive/20230708/202307080633.DcGVpq3d-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080633.DcGVpq3d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080633.DcGVpq3d-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: mm/filemap.o: in function `filemap_read':
>> filemap.c:(.text+0x2e5a): undefined reference to `flush_dcache_folio'
   arm-linux-gnueabi-ld: mm/filemap.o: in function `filemap_splice_read':
   filemap.c:(.text+0x32d6): undefined reference to `flush_dcache_folio'
   arm-linux-gnueabi-ld: fs/libfs.o: in function `simple_read_folio':
>> libfs.c:(.text+0x81c): undefined reference to `flush_dcache_folio'
   arm-linux-gnueabi-ld: fs/remap_range.o: in function `vfs_dedupe_file_range_compare.constprop.0':
>> remap_range.c:(.text+0x430): undefined reference to `flush_dcache_folio'
>> arm-linux-gnueabi-ld: remap_range.c:(.text+0x436): undefined reference to `flush_dcache_folio'
   arm-linux-gnueabi-ld: fs/buffer.o:buffer.c:(.text+0x158e): more undefined references to `flush_dcache_folio' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
