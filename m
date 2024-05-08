Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E662F4501B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 09:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715159302; cv=none; b=UFgYEe70OZt+DACLnoPs0gpqfUPhiyttHRz4xU8CWxxnoU42Za2Paw5t1FSrS8j7z9+GEQ8+Zlx6qwMqH4VPIbl0/n5XaXPS2P789irGGW0yWo4yN4/l3JMjW63RjxUvhQWT7j8QvGee1j5zlYf/L0JHsU12XUjVobFqt5Xa+VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715159302; c=relaxed/simple;
	bh=5GYC+1XLROSlZhWjJcz4Av78PN6nS6l6epfzAqVxjBU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bdx5LCsbJX4TzlHfgBdWKsxPDkZ/YLoSdwEPy+BPT/knQtJVZgADyu2BN+gnxJYJUVQjH4eSfb7euvIJrCIYduP2bMQkwm9K5I6B0rGyAHdw/joarAWLYDvgrrjwCZACZnVR15WMZllfaKQjk/bOy+Fjj6mzsg0ihoZ/PhHXJQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aunEku3V; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aunEku3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715159300; x=1746695300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5GYC+1XLROSlZhWjJcz4Av78PN6nS6l6epfzAqVxjBU=;
  b=aunEku3V8sTJB7K/fX/feUEcEGnnQd1vlwKepW+uLbD5tRCVyzjusWP4
   ytKA3uCy624KJFrbF1V0zKh3TMbeURg+CKhBx9/3i21KzhkHrT2zx9MOx
   Hu74sg9wgrCkWJzvjlFTVF6YDPH33cR4RD/fMDDZcCShlkjCx0x+UQ1NY
   2/CReSCZ9oMBIJA/I6N4JVTzS+lPaIeunjiLdQCrtUiC1cmTC8ufwFRuI
   h+1vnN/OTpd+o2bc/DDtrPNm42wci1ENkYXqhURji24ozL07T/EUK6Xp3
   2MtgOZUNQZPG/nyotmRdiTypEPFx5gUtIxLvFYw6DRKDBYpC74W4dusc9
   w==;
X-CSE-ConnectionGUID: ELfWYn0RT4qekECkxJGQgw==
X-CSE-MsgGUID: 83RdLTIBRqmLRD2xfGo0Iw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11131496"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="11131496"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 02:08:18 -0700
X-CSE-ConnectionGUID: adp73MsTQKKV7GaBWqcAvA==
X-CSE-MsgGUID: bkH2Aw0iSYi/o68jsaYftQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="52030583"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 May 2024 02:08:16 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4dHZ-0003CG-2V;
	Wed, 08 May 2024 09:08:13 +0000
Date: Wed, 8 May 2024 17:07:40 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 576/1143]
 drivers/i2c/busses/i2c-ast2600.c:323:18: warning: variable 'divisor' is used
 uninitialized whenever 'for' loop exits because its condition is false
Message-ID: <202405081702.DRSBrIjn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: dfb62a5cbd1bd2e4a166b82a872abdb15ad35c15 [576/1143] i2c: ast2600 update checkpatch
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240508/202405081702.DRSBrIjn-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405081702.DRSBrIjn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405081702.DRSBrIjn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-ast2600.c:11:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-ast2600.c:326:20: warning: overlapping comparisons always evaluate to true [-Wtautological-overlap-compare]
     326 |                 else if ((i > 0) || (i < 5))
         |                          ~~~~~~~~^~~~~~~~~~
>> drivers/i2c/busses/i2c-ast2600.c:323:18: warning: variable 'divisor' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
     323 |         for (int i = 0; i < 16; i++) {
         |                         ^~~~~~
   drivers/i2c/busses/i2c-ast2600.c:339:16: note: uninitialized use occurs here
     339 |         divisor = min(divisor, 32);
         |                       ^~~~~~~
   include/linux/minmax.h:85:38: note: expanded from macro 'min'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                                            ^
   include/linux/minmax.h:58:18: note: expanded from macro '__careful_cmp'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                                ^
   include/linux/minmax.h:49:24: note: expanded from macro '__cmp_once'
      49 |         typeof(x) unique_x = (x);                       \
         |                               ^
   drivers/i2c/busses/i2c-ast2600.c:323:18: note: remove the condition if it is always true
     323 |         for (int i = 0; i < 16; i++) {
         |                         ^~~~~~
   drivers/i2c/busses/i2c-ast2600.c:318:13: note: initialize the variable 'divisor' to silence this warning
     318 |         int divisor;
         |                    ^
         |                     = 0
   drivers/i2c/busses/i2c-ast2600.c:323:18: warning: variable 'baseclk_idx' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
     323 |         for (int i = 0; i < 16; i++) {
         |                         ^~~~~~
   drivers/i2c/busses/i2c-ast2600.c:338:20: note: uninitialized use occurs here
     338 |         baseclk_idx = min(baseclk_idx, 15);
         |                           ^~~~~~~~~~~
   include/linux/minmax.h:85:38: note: expanded from macro 'min'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                                            ^
   include/linux/minmax.h:58:18: note: expanded from macro '__careful_cmp'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                                ^
   include/linux/minmax.h:49:24: note: expanded from macro '__cmp_once'
      49 |         typeof(x) unique_x = (x);                       \
         |                               ^
   drivers/i2c/busses/i2c-ast2600.c:323:18: note: remove the condition if it is always true
     323 |         for (int i = 0; i < 16; i++) {
         |                         ^~~~~~
   drivers/i2c/busses/i2c-ast2600.c:314:17: note: initialize the variable 'baseclk_idx' to silence this warning
     314 |         int baseclk_idx;
         |                        ^
         |                         = 0
   8 warnings generated.


vim +323 drivers/i2c/busses/i2c-ast2600.c

ad7c1cc2021c96 Ryan Chen 2023-03-31  310  
ad7c1cc2021c96 Ryan Chen 2023-03-31  311  static u32 ast2600_select_i2c_clock(struct ast2600_i2c_bus *i2c_bus)
ad7c1cc2021c96 Ryan Chen 2023-03-31  312  {
c12bf580f6b97c Ryan Chen 2023-10-12  313  	unsigned long base_clk[16];
ad7c1cc2021c96 Ryan Chen 2023-03-31  314  	int baseclk_idx;
ad7c1cc2021c96 Ryan Chen 2023-03-31  315  	u32 clk_div_reg;
ad7c1cc2021c96 Ryan Chen 2023-03-31  316  	u32 scl_low;
ad7c1cc2021c96 Ryan Chen 2023-03-31  317  	u32 scl_high;
dfb62a5cbd1bd2 Ryan Chen 2023-10-17  318  	int divisor;
ad7c1cc2021c96 Ryan Chen 2023-03-31  319  	u32 data;
ad7c1cc2021c96 Ryan Chen 2023-03-31  320  
ad7c1cc2021c96 Ryan Chen 2023-03-31  321  	regmap_read(i2c_bus->global_regs, AST2600_I2CG_CLK_DIV_CTRL, &clk_div_reg);
c12bf580f6b97c Ryan Chen 2023-10-12  322  
c12bf580f6b97c Ryan Chen 2023-10-12 @323  	for (int i = 0; i < 16; i++) {
c12bf580f6b97c Ryan Chen 2023-10-12  324  		if (i == 0)
c12bf580f6b97c Ryan Chen 2023-10-12  325  			base_clk[i] = i2c_bus->apb_clk;
c12bf580f6b97c Ryan Chen 2023-10-12 @326  		else if ((i > 0) || (i < 5))
c12bf580f6b97c Ryan Chen 2023-10-12  327  			base_clk[i] = (i2c_bus->apb_clk * 2) /
c12bf580f6b97c Ryan Chen 2023-10-12  328  				(((clk_div_reg >> ((i - 1) * 8)) & GENMASK(7, 0)) + 2);
c12bf580f6b97c Ryan Chen 2023-10-12  329  		else
c12bf580f6b97c Ryan Chen 2023-10-12  330  			base_clk[i] = base_clk[4] / (1 << (i - 5));
c12bf580f6b97c Ryan Chen 2023-10-12  331  
c12bf580f6b97c Ryan Chen 2023-10-12  332  		if ((base_clk[i] / i2c_bus->timing_info.bus_freq_hz) <= 32) {
c12bf580f6b97c Ryan Chen 2023-10-12  333  			baseclk_idx = i;
c12bf580f6b97c Ryan Chen 2023-10-12  334  			divisor = DIV_ROUND_UP(base_clk[i], i2c_bus->timing_info.bus_freq_hz);
c12bf580f6b97c Ryan Chen 2023-10-12  335  			break;
ad7c1cc2021c96 Ryan Chen 2023-03-31  336  		}
ad7c1cc2021c96 Ryan Chen 2023-03-31  337  	}
c12bf580f6b97c Ryan Chen 2023-10-12  338  	baseclk_idx = min(baseclk_idx, 15);
dedbcc91218c30 Ryan Chen 2023-10-05  339  	divisor = min(divisor, 32);
c12bf580f6b97c Ryan Chen 2023-10-12  340  	scl_low = min(divisor * 9 / 16 - 1, 15);
dedbcc91218c30 Ryan Chen 2023-10-05  341  	scl_high = (divisor - scl_low - 2) & GENMASK(3, 0);
dedbcc91218c30 Ryan Chen 2023-10-05  342  	data = (scl_high - 1) << 20 | scl_high << 16 | scl_low << 12 | baseclk_idx;
ad7c1cc2021c96 Ryan Chen 2023-03-31  343  	if (i2c_bus->timeout) {
ad7c1cc2021c96 Ryan Chen 2023-03-31  344  		data |= AST2600_I2CC_TOUTBASECLK(AST_I2C_TIMEOUT_CLK);
ad7c1cc2021c96 Ryan Chen 2023-03-31  345  		data |= AST2600_I2CC_TTIMEOUT(i2c_bus->timeout);
ad7c1cc2021c96 Ryan Chen 2023-03-31  346  	}
ad7c1cc2021c96 Ryan Chen 2023-03-31  347  
ad7c1cc2021c96 Ryan Chen 2023-03-31  348  	return data;
ad7c1cc2021c96 Ryan Chen 2023-03-31  349  }
ad7c1cc2021c96 Ryan Chen 2023-03-31  350  

:::::: The code at line 323 was first introduced by commit
:::::: c12bf580f6b97c976fd39e32a377464f8c9a005b i2c: ast2600 i2c clock refine

:::::: TO: Ryan Chen <ryan_chen@aspeedtech.com>
:::::: CC: Joel Stanley <joel@jms.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
