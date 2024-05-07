Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64B914E2EC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 May 2024 12:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715084017; cv=none; b=CxypH8gxorL54qw7uShzhL6YNA6Yggk4fcuWnV05dXfoAWTXBieEPG6c7iX1JoGiYMquBp32Y8Z3B77fNIvDp0ud+RiuQr4fvL/EPq9FS5I9/zEN66XjFHm7gBYc0xTFNBkOedCUt5pdrVWsQ1c/rL0KnDCF9R8HRPlOu2Mjv6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715084017; c=relaxed/simple;
	bh=cg6SSLHI8ESXhjh09McpWQZWXEFjIDuNlZUn4oMGNd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fbeuART8N9UNXfCwLethbIbGKgcrVR7HpnZamK0wtaQuwUI1gotuBx4sv2qc4qzctoO/7Cf4JXgG1xBQ0JPgTvLxX6ebQUXFoYWH6JVSMtIQLSeMYUqZtzCHyCw4C9/69DI67SsuvrY4Kgah6W09zLAwL73MWAM2Le5g1s1DCvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yt3czQAZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yt3czQAZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715084015; x=1746620015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cg6SSLHI8ESXhjh09McpWQZWXEFjIDuNlZUn4oMGNd8=;
  b=Yt3czQAZW5dHmgwVErYxKOz9yVcUOykiQ09/S8RP8l7/g4t2LFotrw2Y
   jIs8YH8kh7VtctXNTb+UINciQ3x/SPRQYzm+RxDXzgGdC+3Qc/AGphcoJ
   Muq840ZoD27f4UD5Q6tS8zTale1agLkk2RpF0qdPvvqJQOttCs4nsw1mY
   2QmbmIn/O9Vbeqq0Rnr3rjS03YmvEf/t7yPoMe23ViG6wPDkx3la4Yv6S
   WS08Dk11FKIGv6x9u5aWEC2pnMH7jttBVA85tOvs2kOBmwSSv5q56wrQ3
   y2jV81jIorV6EbDy2YMSNNVwdYYBMGUJlr7jXP2Qs5nKVwImx5wA3Qub7
   A==;
X-CSE-ConnectionGUID: Jr/EBH/vSTGKbSFrsNSgsA==
X-CSE-MsgGUID: GgPdT2MjR/+upPfyEDqybg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="11030608"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="11030608"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 05:13:35 -0700
X-CSE-ConnectionGUID: ogLVUFXYTPyWZs9B+jodmA==
X-CSE-MsgGUID: nsdrTuAFRFWLshruYTSZwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="28582419"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 May 2024 05:13:34 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4JhK-0001tO-2d;
	Tue, 07 May 2024 12:13:30 +0000
Date: Tue, 7 May 2024 20:12:50 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 573/1143]
 drivers/i2c/busses/i2c-ast2600.c:323:18: warning: variable 'baseclk_idx' is
 used uninitialized whenever 'for' loop exits because its condition is false
Message-ID: <202405072034.EWXB4OeL-lkp@intel.com>
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
commit: c12bf580f6b97c976fd39e32a377464f8c9a005b [573/1143] i2c: ast2600 i2c clock refine
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240507/202405072034.EWXB4OeL-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240507/202405072034.EWXB4OeL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405072034.EWXB4OeL-lkp@intel.com/

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
>> drivers/i2c/busses/i2c-ast2600.c:323:18: warning: variable 'baseclk_idx' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
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
   7 warnings generated.


vim +323 drivers/i2c/busses/i2c-ast2600.c

   310	
   311	static u32 ast2600_select_i2c_clock(struct ast2600_i2c_bus *i2c_bus)
   312	{
   313		unsigned long base_clk[16];
   314		int baseclk_idx;
   315		u32 clk_div_reg;
   316		u32 scl_low;
   317		u32 scl_high;
   318		int divisor = 0;
   319		u32 data;
   320	
   321		regmap_read(i2c_bus->global_regs, AST2600_I2CG_CLK_DIV_CTRL, &clk_div_reg);
   322	
 > 323		for (int i = 0; i < 16; i++) {
   324			if (i == 0)
   325				base_clk[i] = i2c_bus->apb_clk;
 > 326			else if ((i > 0) || (i < 5))
   327				base_clk[i] = (i2c_bus->apb_clk * 2) /
   328					(((clk_div_reg >> ((i - 1) * 8)) & GENMASK(7, 0)) + 2);
   329			else
   330				base_clk[i] = base_clk[4] / (1 << (i - 5));
   331	
   332			if ((base_clk[i] / i2c_bus->timing_info.bus_freq_hz) <= 32) {
   333				baseclk_idx = i;
   334				divisor = DIV_ROUND_UP(base_clk[i], i2c_bus->timing_info.bus_freq_hz);
   335				break;
   336			}
   337		}
   338		baseclk_idx = min(baseclk_idx, 15);
   339		divisor = min(divisor, 32);
   340		scl_low = min(divisor * 9 / 16 - 1, 15);
   341		scl_high = (divisor - scl_low - 2) & GENMASK(3, 0);
   342		data = (scl_high - 1) << 20 | scl_high << 16 | scl_low << 12 | baseclk_idx;
   343		if (i2c_bus->timeout) {
   344			data |= AST2600_I2CC_TOUTBASECLK(AST_I2C_TIMEOUT_CLK);
   345			data |= AST2600_I2CC_TTIMEOUT(i2c_bus->timeout);
   346		}
   347	
   348		return data;
   349	}
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
