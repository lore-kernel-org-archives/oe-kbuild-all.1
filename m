Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AC77EC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 01:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695691967; x=1727227967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f7Yb9d4rYaf5wreBHQbr4AGyApdGFuKngTji53/TcdI=;
  b=YXBo7R+6/c94LFShO1zco2DNNGnaEDXJnpQdPv7Y6kvMTv5ta6x5roA5
   nXtMZJxBGNOYC8qRYjLQd8b5NbsmIpyjyzW5jpN5jVKQW8PMgLgX4o7CG
   ivDDNWY+YMg/w57znjWzlYq0r6LMMLC8GBH/VyhSy/21Bnl2WlIAd95qv
   0HpaarhPluFqSkVRjjMywgZ2sXjfIOzebCghd38A5L00mV/GRiT2arHa1
   bQSME5OVIZUJSpo4tgObF5BhYoz5vV7R+mBc794aoTTNJiblSI8I4jqNt
   AtogwiTTlDBDGO1iiHe5oSf3I70re8i3nHrhShaYbP7C4AGu9owVEYTtR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="385303757"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="385303757"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 18:32:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="783780287"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="783780287"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 25 Sep 2023 18:32:42 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkwwJ-0002EB-2S;
	Tue, 26 Sep 2023 01:32:39 +0000
Date: Tue, 26 Sep 2023 09:32:34 +0800
From: kernel test robot <lkp@intel.com>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Andrei Vagin <avagin@gmail.com>
Subject: [akpm-mm:mm-unstable 264/269] fs/proc/task_mmu.c:2018:13: warning:
 'pagemap_scan_backout_range' defined but not used
Message-ID: <202309260903.qzpqNFz3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   81fd55e0d6b6bd11a50070f7639c996a0e3aeea8
commit: 93538f467c0f64ef3fda61cd862115dca782faa4 [264/269] fs/proc/task_mmu: implement IOCTL to get and optionally clear info about PTEs
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230926/202309260903.qzpqNFz3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309260903.qzpqNFz3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260903.qzpqNFz3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/task_mmu.c:2018:13: warning: 'pagemap_scan_backout_range' defined but not used [-Wunused-function]
    2018 | static void pagemap_scan_backout_range(struct pagemap_scan_private *p,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pagemap_scan_backout_range +2018 fs/proc/task_mmu.c

  2017	
> 2018	static void pagemap_scan_backout_range(struct pagemap_scan_private *p,
  2019					       unsigned long addr, unsigned long end)
  2020	{
  2021		struct page_region *cur_buf = &p->vec_buf[p->vec_buf_index];
  2022	
  2023		if (cur_buf->start != addr)
  2024			cur_buf->end = addr;
  2025		else
  2026			cur_buf->start = cur_buf->end = 0;
  2027	
  2028		p->found_pages -= (end - addr) / PAGE_SIZE;
  2029	}
  2030	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
