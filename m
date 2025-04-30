Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F0F1C8FB5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 19:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746042714; cv=none; b=hWOh8E7b/DCpicRo8VotNk//ruhXr61PiQ83ZINDf4iRVvKMlHqfT8061RIMhMXVRO1N6gXEgjnLYZZdb8f0OujsPYhd+buzgAel8EQFDNozlzupkffBLfjwNMA0GYPYgNbMxMyFbug9gFmVlMfD54inShQ4JPchftQ21JlEJM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746042714; c=relaxed/simple;
	bh=GGqm0DRB502BmUrxpZaRt4sv5FYSrTUkzoAvy+fdI4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZkIMFtoUk7aq9OyyMZ8nJoPFLbeXKEb1fkaRsqCiURdidZWuMMcvVsO7NpcModt2UdFx7lwLHuLlqU/GRvUTxVjOg4dpCvHzfE36vJNuqJ0KGQNq3J/KW3ePBpSPRMlv1LeETePzTOHutKsK8OZxREXXrIhlxEL4kjGupFbAyHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCvoLf8r; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCvoLf8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746042712; x=1777578712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GGqm0DRB502BmUrxpZaRt4sv5FYSrTUkzoAvy+fdI4Y=;
  b=YCvoLf8rnmCsZe6qgyf9GrHqSJ+E70GjaAhYOMZC6iA1ElaVDjWX4v+N
   1ZH0Lh5tKKzwSfOa/Ks3CsaDSHYC1rfjRvzees6DYbxT2fnaQAVImvXk9
   S+b+zSwSU0C9E/TxZlOIaNrEhyYGXFhrJfIrhI0BqQUoEwJeyEgG0YqBb
   ioY0e+4lY3Q6f5pf2FgSajzMHM4F12WcGgnOXtAlktm3IIvnSH69KJjM5
   LMDb4m6LqCeKpJAcS6N0U5XbzHcMrRdQRjnSWt5YJpqK1HJWtQgreBQxa
   XasYuaVMzN8ekBuhGnmYrH8tRN8I04jHrGvYj4vxMdFeuEVP6evJyJ4z5
   w==;
X-CSE-ConnectionGUID: t94xB0IZR2KGj+kWWoyi0w==
X-CSE-MsgGUID: fW1pADMWTGqQef1wBPxrHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47435613"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="47435613"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 12:51:51 -0700
X-CSE-ConnectionGUID: ufeGTpa7TAmtRU6lKuH3Zw==
X-CSE-MsgGUID: qfrAfS8hSQGHVmHv3x5lAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="139344309"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Apr 2025 12:51:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uADT9-0003jh-1R;
	Wed, 30 Apr 2025 19:51:47 +0000
Date: Thu, 1 May 2025 03:51:26 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:block-remove-bounce 7/7] drivers/base/node.c:490:8: error:
 extraneous ')' before ';'
Message-ID: <202505010349.9ZIvp3v1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git block-remove-bounce
head:   6f324e4ec5d5fb7c67689f2b48d978da0eb9cb96
commit: 6f324e4ec5d5fb7c67689f2b48d978da0eb9cb96 [7/7] mm: remove NR_BOUNCE zone stat
config: s390-randconfig-002-20250501 (https://download.01.org/0day-ci/archive/20250501/202505010349.9ZIvp3v1-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505010349.9ZIvp3v1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505010349.9ZIvp3v1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/base/node.c:442:16: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
     442 |                              "Node %d WritebackTmp:   %8lu kB\n"
         |                                    ~^
>> drivers/base/node.c:490:8: error: extraneous ')' before ';'
     490 |                             );
         |                             ^
>> drivers/base/node.c:472:9: warning: left operand of comma operator has no effect [-Wunused-value]
     472 |                              nid, K(node_page_state(pgdat, NR_WRITEBACK_TEMP)),
         |                              ^~~
   drivers/base/node.c:472:14: warning: left operand of comma operator has no effect [-Wunused-value]
     472 |                              nid, K(node_page_state(pgdat, NR_WRITEBACK_TEMP)),
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/node.c:371:19: note: expanded from macro 'K'
     371 | #define K(x) ((x) << (PAGE_SHIFT - 10))
         |               ~~~ ^  ~~~~~~~~~~~~~~~~~
   drivers/base/node.c:473:9: warning: left operand of comma operator has no effect [-Wunused-value]
     473 |                              nid, K(sreclaimable +
         |                              ^~~
   drivers/base/node.c:473:14: warning: left operand of comma operator has no effect [-Wunused-value]
     473 |                              nid, K(sreclaimable +
         |                                   ^~~~~~~~~~~~~~~~
     474 |                                     node_page_state(pgdat, NR_KERNEL_MISC_RECLAIMABLE)),
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/node.c:371:19: note: expanded from macro 'K'
     371 | #define K(x) ((x) << (PAGE_SHIFT - 10))
         |               ~~~ ^  ~~~~~~~~~~~~~~~~~
   drivers/base/node.c:475:9: warning: left operand of comma operator has no effect [-Wunused-value]
     475 |                              nid, K(sreclaimable + sunreclaimable),
         |                              ^~~
   drivers/base/node.c:475:14: warning: left operand of comma operator has no effect [-Wunused-value]
     475 |                              nid, K(sreclaimable + sunreclaimable),
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/node.c:371:19: note: expanded from macro 'K'
     371 | #define K(x) ((x) << (PAGE_SHIFT - 10))
         |               ~~~ ^  ~~~~~~~~~~~~~~~~~
   drivers/base/node.c:476:9: warning: left operand of comma operator has no effect [-Wunused-value]
     476 |                              nid, K(sreclaimable),
         |                              ^~~
   drivers/base/node.c:476:14: warning: left operand of comma operator has no effect [-Wunused-value]
     476 |                              nid, K(sreclaimable),
         |                                   ^~~~~~~~~~~~~~~
   drivers/base/node.c:371:19: note: expanded from macro 'K'
     371 | #define K(x) ((x) << (PAGE_SHIFT - 10))
         |               ~~~ ^  ~~~~~~~~~~~~~~~~~
   drivers/base/node.c:477:9: warning: left operand of comma operator has no effect [-Wunused-value]
     477 |                              nid, K(sunreclaimable)
         |                              ^~~
   drivers/base/node.c:477:14: warning: left operand of comma operator has no effect [-Wunused-value]
     477 |                              nid, K(sunreclaimable)
         |                                   ^~~~~~~~~~~~~~~~~
   drivers/base/node.c:371:19: note: expanded from macro 'K'
     371 | #define K(x) ((x) << (PAGE_SHIFT - 10))
         |               ~~~ ^  ~~~~~~~~~~~~~~~~~
   drivers/base/node.c:480:9: warning: left operand of comma operator has no effect [-Wunused-value]
     480 |                              nid, K(node_page_state(pgdat, NR_ANON_THPS)),
         |                              ^~~
   drivers/base/node.c:480:14: warning: left operand of comma operator has no effect [-Wunused-value]
     480 |                              nid, K(node_page_state(pgdat, NR_ANON_THPS)),
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/node.c:371:19: note: expanded from macro 'K'
     371 | #define K(x) ((x) << (PAGE_SHIFT - 10))
         |               ~~~ ^  ~~~~~~~~~~~~~~~~~
   drivers/base/node.c:481:9: warning: left operand of comma operator has no effect [-Wunused-value]
     481 |                              nid, K(node_page_state(pgdat, NR_SHMEM_THPS)),
         |                              ^~~
   drivers/base/node.c:481:14: warning: left operand of comma operator has no effect [-Wunused-value]
     481 |                              nid, K(node_page_state(pgdat, NR_SHMEM_THPS)),
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/node.c:371:19: note: expanded from macro 'K'
     371 | #define K(x) ((x) << (PAGE_SHIFT - 10))
         |               ~~~ ^  ~~~~~~~~~~~~~~~~~
   drivers/base/node.c:482:9: warning: left operand of comma operator has no effect [-Wunused-value]
     482 |                              nid, K(node_page_state(pgdat, NR_SHMEM_PMDMAPPED)),
         |                              ^~~
   drivers/base/node.c:482:14: warning: left operand of comma operator has no effect [-Wunused-value]
     482 |                              nid, K(node_page_state(pgdat, NR_SHMEM_PMDMAPPED)),
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/node.c:371:19: note: expanded from macro 'K'
     371 | #define K(x) ((x) << (PAGE_SHIFT - 10))
         |               ~~~ ^  ~~~~~~~~~~~~~~~~~
   drivers/base/node.c:483:9: warning: left operand of comma operator has no effect [-Wunused-value]
     483 |                              nid, K(node_page_state(pgdat, NR_FILE_THPS)),
         |                              ^~~
   drivers/base/node.c:483:14: warning: left operand of comma operator has no effect [-Wunused-value]
     483 |                              nid, K(node_page_state(pgdat, NR_FILE_THPS)),
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/node.c:371:19: note: expanded from macro 'K'
     371 | #define K(x) ((x) << (PAGE_SHIFT - 10))
         |               ~~~ ^  ~~~~~~~~~~~~~~~~~
   drivers/base/node.c:484:9: warning: left operand of comma operator has no effect [-Wunused-value]
     484 |                              nid, K(node_page_state(pgdat, NR_FILE_PMDMAPPED))
         |                              ^~~
>> drivers/base/node.c:484:14: warning: expression result unused [-Wunused-value]
     484 |                              nid, K(node_page_state(pgdat, NR_FILE_PMDMAPPED))
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/node.c:371:19: note: expanded from macro 'K'
     371 | #define K(x) ((x) << (PAGE_SHIFT - 10))
         |               ~~~ ^  ~~~~~~~~~~~~~~~~~
   21 warnings and 1 error generated.


vim +490 drivers/base/node.c

e1cf33aafb8462 Keith Busch        2019-03-11  370  
^1da177e4c3f41 Linus Torvalds     2005-04-16  371  #define K(x) ((x) << (PAGE_SHIFT - 10))
10fbcf4c6cb122 Kay Sievers        2011-12-21  372  static ssize_t node_read_meminfo(struct device *dev,
10fbcf4c6cb122 Kay Sievers        2011-12-21  373  			struct device_attribute *attr, char *buf)
^1da177e4c3f41 Linus Torvalds     2005-04-16  374  {
948b3edba89883 Joe Perches        2020-09-16  375  	int len = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  376  	int nid = dev->id;
599d0c954f91d0 Mel Gorman         2016-07-28  377  	struct pglist_data *pgdat = NODE_DATA(nid);
^1da177e4c3f41 Linus Torvalds     2005-04-16  378  	struct sysinfo i;
61f94e18de94f7 Vlastimil Babka    2018-10-26  379  	unsigned long sreclaimable, sunreclaimable;
b6038942480e57 Shakeel Butt       2021-02-24  380  	unsigned long swapcached = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  381  
^1da177e4c3f41 Linus Torvalds     2005-04-16  382  	si_meminfo_node(&i, nid);
d42f3245c7e299 Roman Gushchin     2020-08-06  383  	sreclaimable = node_page_state_pages(pgdat, NR_SLAB_RECLAIMABLE_B);
d42f3245c7e299 Roman Gushchin     2020-08-06  384  	sunreclaimable = node_page_state_pages(pgdat, NR_SLAB_UNRECLAIMABLE_B);
b6038942480e57 Shakeel Butt       2021-02-24  385  #ifdef CONFIG_SWAP
b6038942480e57 Shakeel Butt       2021-02-24  386  	swapcached = node_page_state_pages(pgdat, NR_SWAPCACHE);
b6038942480e57 Shakeel Butt       2021-02-24  387  #endif
948b3edba89883 Joe Perches        2020-09-16  388  	len = sysfs_emit_at(buf, len,
^1da177e4c3f41 Linus Torvalds     2005-04-16  389  			    "Node %d MemTotal:       %8lu kB\n"
^1da177e4c3f41 Linus Torvalds     2005-04-16  390  			    "Node %d MemFree:        %8lu kB\n"
^1da177e4c3f41 Linus Torvalds     2005-04-16  391  			    "Node %d MemUsed:        %8lu kB\n"
b6038942480e57 Shakeel Butt       2021-02-24  392  			    "Node %d SwapCached:     %8lu kB\n"
^1da177e4c3f41 Linus Torvalds     2005-04-16  393  			    "Node %d Active:         %8lu kB\n"
^1da177e4c3f41 Linus Torvalds     2005-04-16  394  			    "Node %d Inactive:       %8lu kB\n"
4f98a2fee8acdb Rik van Riel       2008-10-18  395  			    "Node %d Active(anon):   %8lu kB\n"
4f98a2fee8acdb Rik van Riel       2008-10-18  396  			    "Node %d Inactive(anon): %8lu kB\n"
4f98a2fee8acdb Rik van Riel       2008-10-18  397  			    "Node %d Active(file):   %8lu kB\n"
4f98a2fee8acdb Rik van Riel       2008-10-18  398  			    "Node %d Inactive(file): %8lu kB\n"
5344b7e648980c Nicholas Piggin    2008-10-18  399  			    "Node %d Unevictable:    %8lu kB\n"
7ee92255470daa KOSAKI Motohiro    2010-08-09  400  			    "Node %d Mlocked:        %8lu kB\n",
7ee92255470daa KOSAKI Motohiro    2010-08-09  401  			    nid, K(i.totalram),
7ee92255470daa KOSAKI Motohiro    2010-08-09  402  			    nid, K(i.freeram),
7ee92255470daa KOSAKI Motohiro    2010-08-09  403  			    nid, K(i.totalram - i.freeram),
b6038942480e57 Shakeel Butt       2021-02-24  404  			    nid, K(swapcached),
599d0c954f91d0 Mel Gorman         2016-07-28  405  			    nid, K(node_page_state(pgdat, NR_ACTIVE_ANON) +
599d0c954f91d0 Mel Gorman         2016-07-28  406  				   node_page_state(pgdat, NR_ACTIVE_FILE)),
599d0c954f91d0 Mel Gorman         2016-07-28  407  			    nid, K(node_page_state(pgdat, NR_INACTIVE_ANON) +
599d0c954f91d0 Mel Gorman         2016-07-28  408  				   node_page_state(pgdat, NR_INACTIVE_FILE)),
599d0c954f91d0 Mel Gorman         2016-07-28  409  			    nid, K(node_page_state(pgdat, NR_ACTIVE_ANON)),
599d0c954f91d0 Mel Gorman         2016-07-28  410  			    nid, K(node_page_state(pgdat, NR_INACTIVE_ANON)),
599d0c954f91d0 Mel Gorman         2016-07-28  411  			    nid, K(node_page_state(pgdat, NR_ACTIVE_FILE)),
599d0c954f91d0 Mel Gorman         2016-07-28  412  			    nid, K(node_page_state(pgdat, NR_INACTIVE_FILE)),
599d0c954f91d0 Mel Gorman         2016-07-28  413  			    nid, K(node_page_state(pgdat, NR_UNEVICTABLE)),
75ef7184053989 Mel Gorman         2016-07-28  414  			    nid, K(sum_zone_node_page_state(nid, NR_MLOCK)));
7ee92255470daa KOSAKI Motohiro    2010-08-09  415  
182e8e237349e7 Christoph Lameter  2006-09-25  416  #ifdef CONFIG_HIGHMEM
948b3edba89883 Joe Perches        2020-09-16  417  	len += sysfs_emit_at(buf, len,
^1da177e4c3f41 Linus Torvalds     2005-04-16  418  			     "Node %d HighTotal:      %8lu kB\n"
^1da177e4c3f41 Linus Torvalds     2005-04-16  419  			     "Node %d HighFree:       %8lu kB\n"
^1da177e4c3f41 Linus Torvalds     2005-04-16  420  			     "Node %d LowTotal:       %8lu kB\n"
7ee92255470daa KOSAKI Motohiro    2010-08-09  421  			     "Node %d LowFree:        %8lu kB\n",
7ee92255470daa KOSAKI Motohiro    2010-08-09  422  			     nid, K(i.totalhigh),
7ee92255470daa KOSAKI Motohiro    2010-08-09  423  			     nid, K(i.freehigh),
7ee92255470daa KOSAKI Motohiro    2010-08-09  424  			     nid, K(i.totalram - i.totalhigh),
7ee92255470daa KOSAKI Motohiro    2010-08-09  425  			     nid, K(i.freeram - i.freehigh));
182e8e237349e7 Christoph Lameter  2006-09-25  426  #endif
948b3edba89883 Joe Perches        2020-09-16  427  	len += sysfs_emit_at(buf, len,
c07e02db76940c Martin Hicks       2005-09-03  428  			     "Node %d Dirty:          %8lu kB\n"
c07e02db76940c Martin Hicks       2005-09-03  429  			     "Node %d Writeback:      %8lu kB\n"
347ce434d57da8 Christoph Lameter  2006-06-30  430  			     "Node %d FilePages:      %8lu kB\n"
c07e02db76940c Martin Hicks       2005-09-03  431  			     "Node %d Mapped:         %8lu kB\n"
f3dbd34460ff54 Christoph Lameter  2006-06-30  432  			     "Node %d AnonPages:      %8lu kB\n"
4b02108ac1b335 KOSAKI Motohiro    2009-09-21  433  			     "Node %d Shmem:          %8lu kB\n"
c6a7f5728a1db4 KOSAKI Motohiro    2009-09-21  434  			     "Node %d KernelStack:    %8lu kB\n"
628d06a48f57c3 Sami Tolvanen      2020-04-27  435  #ifdef CONFIG_SHADOW_CALL_STACK
628d06a48f57c3 Sami Tolvanen      2020-04-27  436  			     "Node %d ShadowCallStack:%8lu kB\n"
628d06a48f57c3 Sami Tolvanen      2020-04-27  437  #endif
df849a1529c106 Christoph Lameter  2006-06-30  438  			     "Node %d PageTables:     %8lu kB\n"
ebc97a52b5d6cd Yosry Ahmed        2022-08-23  439  			     "Node %d SecPageTables:  %8lu kB\n"
f5ef68da5fda5e Andrew Morton      2006-08-27  440  			     "Node %d NFS_Unstable:   %8lu kB\n"
d2c5e30c9a1420 Christoph Lameter  2006-06-30  441  			     "Node %d Bounce:         %8lu kB\n"
fc3ba692a4d190 Miklos Szeredi     2008-04-30 @442  			     "Node %d WritebackTmp:   %8lu kB\n"
61f94e18de94f7 Vlastimil Babka    2018-10-26  443  			     "Node %d KReclaimable:   %8lu kB\n"
972d1a7b140569 Christoph Lameter  2006-09-25  444  			     "Node %d Slab:           %8lu kB\n"
972d1a7b140569 Christoph Lameter  2006-09-25  445  			     "Node %d SReclaimable:   %8lu kB\n"
05b258e9972511 David Rientjes     2011-01-13  446  			     "Node %d SUnreclaim:     %8lu kB\n"
05b258e9972511 David Rientjes     2011-01-13  447  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
05b258e9972511 David Rientjes     2011-01-13  448  			     "Node %d AnonHugePages:  %8lu kB\n"
65c453778aea37 Kirill A. Shutemov 2016-07-26  449  			     "Node %d ShmemHugePages: %8lu kB\n"
65c453778aea37 Kirill A. Shutemov 2016-07-26  450  			     "Node %d ShmemPmdMapped: %8lu kB\n"
60fbf0ab5da1c3 Song Liu           2019-09-23  451  			     "Node %d FileHugePages:  %8lu kB\n"
60fbf0ab5da1c3 Song Liu           2019-09-23  452  			     "Node %d FilePmdMapped:  %8lu kB\n"
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  453  #endif
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  454  #ifdef CONFIG_UNACCEPTED_MEMORY
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  455  			     "Node %d Unaccepted:     %8lu kB\n"
05b258e9972511 David Rientjes     2011-01-13  456  #endif
05b258e9972511 David Rientjes     2011-01-13  457  			     ,
11fb998986a72a Mel Gorman         2016-07-28  458  			     nid, K(node_page_state(pgdat, NR_FILE_DIRTY)),
11fb998986a72a Mel Gorman         2016-07-28  459  			     nid, K(node_page_state(pgdat, NR_WRITEBACK)),
11fb998986a72a Mel Gorman         2016-07-28  460  			     nid, K(node_page_state(pgdat, NR_FILE_PAGES)),
50658e2e04c12d Mel Gorman         2016-07-28  461  			     nid, K(node_page_state(pgdat, NR_FILE_MAPPED)),
4b9d0fab7166c9 Mel Gorman         2016-07-28  462  			     nid, K(node_page_state(pgdat, NR_ANON_MAPPED)),
cc7452b6dca384 Rafael Aquini      2014-08-06  463  			     nid, K(i.sharedram),
991e7673859ed4 Shakeel Butt       2020-08-06  464  			     nid, node_page_state(pgdat, NR_KERNEL_STACK_KB),
628d06a48f57c3 Sami Tolvanen      2020-04-27  465  #ifdef CONFIG_SHADOW_CALL_STACK
991e7673859ed4 Shakeel Butt       2020-08-06  466  			     nid, node_page_state(pgdat, NR_KERNEL_SCS_KB),
628d06a48f57c3 Sami Tolvanen      2020-04-27  467  #endif
f0c0c115fb8194 Shakeel Butt       2020-12-14  468  			     nid, K(node_page_state(pgdat, NR_PAGETABLE)),
ebc97a52b5d6cd Yosry Ahmed        2022-08-23  469  			     nid, K(node_page_state(pgdat, NR_SECONDARY_PAGETABLE)),
8d92890bd6b850 NeilBrown          2020-06-01  470  			     nid, 0UL,
6f324e4ec5d5fb Christoph Hellwig  2025-04-30  471  			     nid, 0UL),
11fb998986a72a Mel Gorman         2016-07-28 @472  			     nid, K(node_page_state(pgdat, NR_WRITEBACK_TEMP)),
61f94e18de94f7 Vlastimil Babka    2018-10-26  473  			     nid, K(sreclaimable +
61f94e18de94f7 Vlastimil Babka    2018-10-26  474  				    node_page_state(pgdat, NR_KERNEL_MISC_RECLAIMABLE)),
61f94e18de94f7 Vlastimil Babka    2018-10-26  475  			     nid, K(sreclaimable + sunreclaimable),
61f94e18de94f7 Vlastimil Babka    2018-10-26  476  			     nid, K(sreclaimable),
61f94e18de94f7 Vlastimil Babka    2018-10-26  477  			     nid, K(sunreclaimable)
05b258e9972511 David Rientjes     2011-01-13  478  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
61f94e18de94f7 Vlastimil Babka    2018-10-26  479  			     ,
69473e5de87389 Muchun Song        2021-02-24  480  			     nid, K(node_page_state(pgdat, NR_ANON_THPS)),
57b2847d3c1dc1 Muchun Song        2021-02-24  481  			     nid, K(node_page_state(pgdat, NR_SHMEM_THPS)),
a1528e21f8915e Muchun Song        2021-02-24  482  			     nid, K(node_page_state(pgdat, NR_SHMEM_PMDMAPPED)),
bf9ecead53c89d Muchun Song        2021-02-24  483  			     nid, K(node_page_state(pgdat, NR_FILE_THPS)),
380780e71895ae Muchun Song        2021-02-24 @484  			     nid, K(node_page_state(pgdat, NR_FILE_PMDMAPPED))
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  485  #endif
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  486  #ifdef CONFIG_UNACCEPTED_MEMORY
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  487  			     ,
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  488  			     nid, K(sum_zone_node_page_state(nid, NR_UNACCEPTED))
05b258e9972511 David Rientjes     2011-01-13  489  #endif
61f94e18de94f7 Vlastimil Babka    2018-10-26 @490  			    );
7981593bf08380 Joe Perches        2020-09-16  491  	len += hugetlb_report_node_meminfo(buf, len, nid);
948b3edba89883 Joe Perches        2020-09-16  492  	return len;
^1da177e4c3f41 Linus Torvalds     2005-04-16  493  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  494  

:::::: The code at line 490 was first introduced by commit
:::::: 61f94e18de94f79abaad3bb83549ff78923ac785 mm, proc: add KReclaimable to /proc/meminfo

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
