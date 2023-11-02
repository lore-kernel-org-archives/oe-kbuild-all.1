Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4E021A09
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 21:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVYEMG/C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698959652; x=1730495652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f3mIAtreBN1Y+vhp8ds1JXbwYc/6aQyamPp9SGSQYSQ=;
  b=ZVYEMG/C/m1K+IJKcDChwng0ww4JV3KfxQ+VfZf4ugTQoS0b0AkTzUdA
   Z6/v9kSY+bF+IpprJZPnur6F5ubVVA/q9e0XaJqN3rlcQpSlN4lWZxYZi
   K+amqfQB/mR9WlzuMADWYGWE4n1CVUwZRfHruanBLAR3EnzGEGhueIyu0
   TDgJFTSA6qQumOz7Jju8GgV+SL59f7DkXuO2lMFcKhkCkjDC5ScNBTNXC
   iXXB4Et55BWcauHQBayLTdRZYqPJksPujLteoL8fY5e1Ah+OkantvwNwr
   NiY9dpXNpqFl0FwnYQsSOkmxGVONjqnl/8x+ImYSHLSra1Dj+883g3K96
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="379217824"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="379217824"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 14:14:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="2689329"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Nov 2023 14:14:09 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyf0x-0001rc-0M;
	Thu, 02 Nov 2023 21:14:07 +0000
Date: Fri, 3 Nov 2023 05:13:35 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bixuan Cui <cuibixuan@huawei.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: kernel/kallsyms.c:436:17: warning: 'strcpy' source argument is the
 same as destination
Message-ID: <202311030538.uBMcnne0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4652b8e4f3ffa48c706ec334f048c217a7d9750d
commit: 9294523e3768030ae8afb84110bcecc66425a647 module: add printk formats to add module build ID to stacktraces
date:   2 years, 4 months ago
config: x86_64-buildonly-randconfig-002-20231102 (https://download.01.org/0day-ci/archive/20231103/202311030538.uBMcnne0-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030538.uBMcnne0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030538.uBMcnne0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/kallsyms.c:566:12: warning: no previous prototype for 'arch_get_kallsym' [-Wmissing-prototypes]
     566 | int __weak arch_get_kallsym(unsigned int symnum, unsigned long *value,
         |            ^~~~~~~~~~~~~~~~
   kernel/kallsyms.c: In function '__sprint_symbol.constprop':
>> kernel/kallsyms.c:436:17: warning: 'strcpy' source argument is the same as destination [-Wrestrict]
     436 |                 strcpy(buffer, name);
         |                 ^~~~~~~~~~~~~~~~~~~~


vim +/strcpy +436 kernel/kallsyms.c

a5c43dae7ae38c Alexey Dobriyan 2007-05-08  418  
42e380832a6911 Robert Peterson 2007-04-30  419  /* Look up a kernel symbol and return it in a text buffer. */
0f77a8d378254f Namhyung Kim    2011-03-24  420  static int __sprint_symbol(char *buffer, unsigned long address,
9294523e376803 Stephen Boyd    2021-07-07  421  			   int symbol_offset, int add_offset, int add_buildid)
^1da177e4c3f41 Linus Torvalds  2005-04-16  422  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  423  	char *modname;
9294523e376803 Stephen Boyd    2021-07-07  424  	const unsigned char *buildid;
^1da177e4c3f41 Linus Torvalds  2005-04-16  425  	const char *name;
^1da177e4c3f41 Linus Torvalds  2005-04-16  426  	unsigned long offset, size;
966c8c12dc9e77 Hugh Dickins    2008-11-19  427  	int len;
^1da177e4c3f41 Linus Torvalds  2005-04-16  428  
0f77a8d378254f Namhyung Kim    2011-03-24  429  	address += symbol_offset;
9294523e376803 Stephen Boyd    2021-07-07  430  	name = kallsyms_lookup_buildid(address, &size, &offset, &modname, &buildid,
9294523e376803 Stephen Boyd    2021-07-07  431  				       buffer);
^1da177e4c3f41 Linus Torvalds  2005-04-16  432  	if (!name)
b86280aa48b67c Namhyung Kim    2014-08-08  433  		return sprintf(buffer, "0x%lx", address - symbol_offset);
19769b762607fe Andrew Morton   2007-07-15  434  
966c8c12dc9e77 Hugh Dickins    2008-11-19  435  	if (name != buffer)
966c8c12dc9e77 Hugh Dickins    2008-11-19 @436  		strcpy(buffer, name);
966c8c12dc9e77 Hugh Dickins    2008-11-19  437  	len = strlen(buffer);
0f77a8d378254f Namhyung Kim    2011-03-24  438  	offset -= symbol_offset;
966c8c12dc9e77 Hugh Dickins    2008-11-19  439  
4796dd200db943 Stephen Boyd    2012-05-29  440  	if (add_offset)
4796dd200db943 Stephen Boyd    2012-05-29  441  		len += sprintf(buffer + len, "+%#lx/%#lx", offset, size);
4796dd200db943 Stephen Boyd    2012-05-29  442  
9294523e376803 Stephen Boyd    2021-07-07  443  	if (modname) {
9294523e376803 Stephen Boyd    2021-07-07  444  		len += sprintf(buffer + len, " [%s", modname);
9294523e376803 Stephen Boyd    2021-07-07  445  #if IS_ENABLED(CONFIG_STACKTRACE_BUILD_ID)
9294523e376803 Stephen Boyd    2021-07-07  446  		if (add_buildid && buildid) {
9294523e376803 Stephen Boyd    2021-07-07  447  			/* build ID should match length of sprintf */
9294523e376803 Stephen Boyd    2021-07-07  448  #if IS_ENABLED(CONFIG_MODULES)
9294523e376803 Stephen Boyd    2021-07-07  449  			static_assert(sizeof(typeof_member(struct module, build_id)) == 20);
9294523e376803 Stephen Boyd    2021-07-07  450  #endif
9294523e376803 Stephen Boyd    2021-07-07  451  			len += sprintf(buffer + len, " %20phN", buildid);
9294523e376803 Stephen Boyd    2021-07-07  452  		}
9294523e376803 Stephen Boyd    2021-07-07  453  #endif
9294523e376803 Stephen Boyd    2021-07-07  454  		len += sprintf(buffer + len, "]");
9294523e376803 Stephen Boyd    2021-07-07  455  	}
966c8c12dc9e77 Hugh Dickins    2008-11-19  456  
966c8c12dc9e77 Hugh Dickins    2008-11-19  457  	return len;
^1da177e4c3f41 Linus Torvalds  2005-04-16  458  }
0f77a8d378254f Namhyung Kim    2011-03-24  459  

:::::: The code at line 436 was first introduced by commit
:::::: 966c8c12dc9e77f931e2281ba25d2f0244b06949 sprint_symbol(): use less stack

:::::: TO: Hugh Dickins <hugh@veritas.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
