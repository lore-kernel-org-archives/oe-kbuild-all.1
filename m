Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5226962D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 00:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ajc4JQ7M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701044793; x=1732580793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QnRtzoIrZsRXulbETwnxRfPI/Aq9Z5qUVIiHRcrOzE0=;
  b=ajc4JQ7MnVtm88kFSa9W+ZZLnv0R2U2l1WiOxkIFKK+3bWTaiimIAILL
   jvziS9oa2okvvaoido2RT2+ALpc2XYr7uwnpPk11y90vYELPmTDz7B6LJ
   iFi9qD5GRJU+JnSncnJeYo0vq64fFs+ZT4akMXbNtRxZKOmM6cSgeMV7/
   ul4rNkkRm7pencl69YOJSED+mYR855C1ThtWtmId2Uf2uD1i2gtpZ4SeU
   Gqceop8eStnzA5GoqnuEch8pAim9EHAhyBJ8JM5TQvtdgFKcHWY19+IAV
   dmMIhqu5ieYJ+kv0NETxXJU7woUpHGsQQ8rofvgXAfeJOJDpFbJ35DmPp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="389763178"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="389763178"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 16:26:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="891568232"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="891568232"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Nov 2023 16:26:30 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7PSF-0005f6-2p;
	Mon, 27 Nov 2023 00:26:27 +0000
Date: Mon, 27 Nov 2023 08:25:28 +0800
From: kernel test robot <lkp@intel.com>
To: Haibo Li <haibo.li@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrey Konovalov <andreyknvl@gmail.com>
Subject: mm/kasan/report.c:637 kasan_non_canonical_hook() warn: unsigned
 'addr' is never less than zero.
Message-ID: <202311270743.3oTCwYPd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2da77f431ac49b5763b88751a75f70daa46296c
commit: babddbfb7d7d70ae7f10fedd75a45d8ad75fdddf kasan: print the original fault addr when access invalid shadow
date:   6 weeks ago
config: loongarch-randconfig-r071-20231126 (https://download.01.org/0day-ci/archive/20231127/202311270743.3oTCwYPd-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311270743.3oTCwYPd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311270743.3oTCwYPd-lkp@intel.com/

smatch warnings:
mm/kasan/report.c:637 kasan_non_canonical_hook() warn: unsigned 'addr' is never less than zero.

vim +/addr +637 mm/kasan/report.c

bb2f967ce2130b Andrey Konovalov 2022-03-24  623  
2f004eea0fc8f8 Jann Horn        2019-12-19  624  /*
babddbfb7d7d70 Haibo Li         2023-10-09  625   * With CONFIG_KASAN, accesses to bogus pointers (outside the high
2f004eea0fc8f8 Jann Horn        2019-12-19  626   * canonical half of the address space) cause out-of-bounds shadow memory reads
2f004eea0fc8f8 Jann Horn        2019-12-19  627   * before the actual access. For addresses in the low canonical half of the
2f004eea0fc8f8 Jann Horn        2019-12-19  628   * address space, as well as most non-canonical addresses, that out-of-bounds
2f004eea0fc8f8 Jann Horn        2019-12-19  629   * shadow memory access lands in the non-canonical part of the address space.
2f004eea0fc8f8 Jann Horn        2019-12-19  630   * Help the user figure out what the original bogus pointer was.
2f004eea0fc8f8 Jann Horn        2019-12-19  631   */
2f004eea0fc8f8 Jann Horn        2019-12-19  632  void kasan_non_canonical_hook(unsigned long addr)
2f004eea0fc8f8 Jann Horn        2019-12-19  633  {
2f004eea0fc8f8 Jann Horn        2019-12-19  634  	unsigned long orig_addr;
2f004eea0fc8f8 Jann Horn        2019-12-19  635  	const char *bug_type;
2f004eea0fc8f8 Jann Horn        2019-12-19  636  
2f004eea0fc8f8 Jann Horn        2019-12-19 @637  	if (addr < KASAN_SHADOW_OFFSET)

:::::: The code at line 637 was first introduced by commit
:::::: 2f004eea0fc8f86b45dfc2007add2d4986de8d02 x86/kasan: Print original address on #GP

:::::: TO: Jann Horn <jannh@google.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
