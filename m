Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D1918635
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 10:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YyIHVKEB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701080518; x=1732616518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=86hFuj6sQ78pS/+iC9ttJF7SiU4kZk8A7rOHXSRQ5Lc=;
  b=YyIHVKEBlpJgxxmVCSRPMRgkCUxlkhvTicuz5TgcelbIrkLwY//6lJES
   OS/GagBWufFjvBVPOalrQbBWhBrMXoiomAHfTZkX1iwrdxJqGH/7irT6d
   ysv6oa8PdjrqH8ln9lWTxp0mbPMuRGr1cLEZmjgSxXi2rUwY+C/UfwtJa
   9V//TipUzT3QYRPVlHLCCO6ReUiB/mJ0OOoROhhLW7KMpFp4h8DqvdWYS
   cBXW32YJlcoffbgUVw6Lof35UgMfwnr4hKUWx1Ammu2yiNRwde95Mkk6k
   xIlUlUHQdjDtAZTSxHf4SfMm8MnF9CFfMWhNLnqsWpAc/aqrB0SnD7u0Z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="392425333"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="392425333"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 02:21:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="941518276"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="941518276"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Nov 2023 02:21:55 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7YkT-00069P-22;
	Mon, 27 Nov 2023 10:21:53 +0000
Date: Mon, 27 Nov 2023 18:20:43 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3550/3551] arch/sparc/mm/srmmu.c:1082:32:
 warning: variable 'clear' set but not used
Message-ID: <202311271753.9HEOvyqm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   48bbaf8b793e0770798519f8ee1ea2908ff0943a
commit: 233d97f67e6525aff8a621735926a8acbd980ca1 [3550/3551] sparc: turn off Werror for now
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20231127/202311271753.9HEOvyqm-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311271753.9HEOvyqm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311271753.9HEOvyqm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/sparc/mm/srmmu.c: In function 'poke_hypersparc':
>> arch/sparc/mm/srmmu.c:1082:32: warning: variable 'clear' set but not used [-Wunused-but-set-variable]
    1082 |         volatile unsigned long clear;
         |                                ^~~~~
--
   arch/sparc/mm/leon_mm.c: In function 'leon_swprobe':
>> arch/sparc/mm/leon_mm.c:42:32: warning: variable 'paddrbase' set but not used [-Wunused-but-set-variable]
      42 |         unsigned int lvl, pte, paddrbase;
         |                                ^~~~~~~~~


vim +/clear +1082 arch/sparc/mm/srmmu.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  1079  
2066aadd53c563 Paul Gortmaker 2013-06-17  1080  static void poke_hypersparc(void)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1081  {
^1da177e4c3f41 Linus Torvalds 2005-04-16 @1082  	volatile unsigned long clear;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1083  	unsigned long mreg = srmmu_get_mmureg();
^1da177e4c3f41 Linus Torvalds 2005-04-16  1084  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1085  	hyper_flush_unconditional_combined();
^1da177e4c3f41 Linus Torvalds 2005-04-16  1086  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1087  	mreg &= ~(HYPERSPARC_CWENABLE);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1088  	mreg |= (HYPERSPARC_CENABLE | HYPERSPARC_WBENABLE);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1089  	mreg |= (HYPERSPARC_CMODE);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1090  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1091  	srmmu_set_mmureg(mreg);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1092  

:::::: The code at line 1082 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
