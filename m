Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C143C289E06
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 23:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768519165; cv=none; b=Eux/FyEGxh+TufKSUpvcmTJRSiB4KbwgWeN2dpRcE29I3oXxvINmw85rpv3WoRA3wSGWbYlnVZP7uBJC4Yhd53HbMQVXf23Qmv0u9dmsaa3E1rxz4Lg+Vx42F0kf954ZyZT0Gv1M5beQGaQhgQ59Ch1ecaa0gXWnsrkSwTzf41g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768519165; c=relaxed/simple;
	bh=PgjNnsQYyElgGDyLRwQL3U1Osm7PoVZaZIHa4gMCiYE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nmGqTzJAdUWqhUvRqefud2kaf+et9nB223JmvTXvxPury54MKHpmbc12fL+tGeGsVaxyR+CMWkc9SwhjiLRXCrXK78RmUFawlqXm3SF7xEGNjofeqRqja1m/JytIZQmWQuTWL9ZHOACR7Ts1qRLXKEsatLithpBW4QqUTrDHrUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRRy8Bh2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRRy8Bh2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768519164; x=1800055164;
  h=date:from:to:cc:subject:message-id;
  bh=PgjNnsQYyElgGDyLRwQL3U1Osm7PoVZaZIHa4gMCiYE=;
  b=MRRy8Bh2QgrQnHAm+wIVSLa7Mvr/bAeUT35Lsvkj8TF53d6BQhKabjqQ
   8QtXMhb41YuJqOp32Tq49xqD9GK6NOrAvREAi2BDqYHXHqrlgqhoMAfQJ
   xNvB10en9sAg5tG1nJCcrcBANkdJ7y1haDg97EpafDTbeIR/EO+SlOLgp
   rZKM+a7i9AskJns0VHWvfbcRggR42lMfJe6oirQRxr2OOwn9yQ11D7XAM
   S4EK30d4qrui3EeXL45Y0aB0g/S+zLqXNGCj+m7n3HT+Yd587Uw4BLuzX
   86i8VsTeTv6rEQE4znyX18kHfWhXrx1grbf3HijKhZlo+FnsYBBDocxwa
   Q==;
X-CSE-ConnectionGUID: uP3en8gETnC+ddDbdQn8mw==
X-CSE-MsgGUID: Lm9uqJMdRF+ALgk5+D2OAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80947672"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="80947672"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 15:19:23 -0800
X-CSE-ConnectionGUID: KyT7bkqXTzy7dr9TzHv+dw==
X-CSE-MsgGUID: 8x5lz4fzQLGxo58szt6nPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="210114791"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Jan 2026 15:19:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgWcZ-00000000K6O-0s3z;
	Thu, 15 Jan 2026 23:19:19 +0000
Date: Fri, 16 Jan 2026 07:18:31 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [masneyb:b4/mips-pic32-header-move 17/17]
 drivers/clk/microchip/clk-core.c:350:2-8: WARNING: do_div() does a 64-by-32
 division, please consider using div64_ul instead.
Message-ID: <202601160758.bpkN4546-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/masneyb/linux b4/mips-pic32-header-move
head:   0ffbdd0bc2954abd9c91cddb0b0d5030e87f68d5
commit: 0ffbdd0bc2954abd9c91cddb0b0d5030e87f68d5 [17/17] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
config: sparc-randconfig-r051-20260116 (https://download.01.org/0day-ci/archive/20260116/202601160758.bpkN4546-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160758.bpkN4546-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/microchip/clk-core.c:350:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.
--
>> drivers/clk/microchip/clk-core.c:916:36-37: determine_rate: first occurrence line 919, second occurrence line 923

vim +350 drivers/clk/microchip/clk-core.c

ce6e1188465998 Purna Chandra Mandal 2016-05-13  322  
ce6e1188465998 Purna Chandra Mandal 2016-05-13  323  static void roclk_calc_div_trim(unsigned long rate,
ce6e1188465998 Purna Chandra Mandal 2016-05-13  324  				unsigned long parent_rate,
ce6e1188465998 Purna Chandra Mandal 2016-05-13  325  				u32 *rodiv_p, u32 *rotrim_p)
ce6e1188465998 Purna Chandra Mandal 2016-05-13  326  {
ce6e1188465998 Purna Chandra Mandal 2016-05-13  327  	u32 div, rotrim, rodiv;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  328  	u64 frac;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  329  
ce6e1188465998 Purna Chandra Mandal 2016-05-13  330  	/* Find integer approximation of floating-point arithmetic.
ce6e1188465998 Purna Chandra Mandal 2016-05-13  331  	 *      fout = fin / [2 * {rodiv + (rotrim / 512)}] ... (1)
ce6e1188465998 Purna Chandra Mandal 2016-05-13  332  	 * i.e. fout = fin / 2 * DIV
ce6e1188465998 Purna Chandra Mandal 2016-05-13  333  	 *      whereas DIV = rodiv + (rotrim / 512)
ce6e1188465998 Purna Chandra Mandal 2016-05-13  334  	 *
264200cc3a87d5 Bjorn Helgaas        2025-07-23  335  	 * Since kernel does not perform floating-point arithmetic so
ce6e1188465998 Purna Chandra Mandal 2016-05-13  336  	 * (rotrim/512) will be zero. And DIV & rodiv will result same.
ce6e1188465998 Purna Chandra Mandal 2016-05-13  337  	 *
ce6e1188465998 Purna Chandra Mandal 2016-05-13  338  	 * ie. fout = (fin * 256) / [(512 * rodiv) + rotrim]  ... from (1)
ce6e1188465998 Purna Chandra Mandal 2016-05-13  339  	 * ie. rotrim = ((fin * 256) / fout) - (512 * DIV)
ce6e1188465998 Purna Chandra Mandal 2016-05-13  340  	 */
ce6e1188465998 Purna Chandra Mandal 2016-05-13  341  	if (parent_rate <= rate) {
ce6e1188465998 Purna Chandra Mandal 2016-05-13  342  		div = 0;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  343  		frac = 0;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  344  		rodiv = 0;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  345  		rotrim = 0;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  346  	} else {
ce6e1188465998 Purna Chandra Mandal 2016-05-13  347  		div = parent_rate / (rate << 1);
ce6e1188465998 Purna Chandra Mandal 2016-05-13  348  		frac = parent_rate;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  349  		frac <<= 8;
ce6e1188465998 Purna Chandra Mandal 2016-05-13 @350  		do_div(frac, rate);
ce6e1188465998 Purna Chandra Mandal 2016-05-13  351  		frac -= (u64)(div << 9);
ce6e1188465998 Purna Chandra Mandal 2016-05-13  352  
ce6e1188465998 Purna Chandra Mandal 2016-05-13  353  		rodiv = (div > REFO_DIV_MASK) ? REFO_DIV_MASK : div;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  354  		rotrim = (frac >= REFO_TRIM_MAX) ? REFO_TRIM_MAX : frac;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  355  	}
ce6e1188465998 Purna Chandra Mandal 2016-05-13  356  
ce6e1188465998 Purna Chandra Mandal 2016-05-13  357  	if (rodiv_p)
ce6e1188465998 Purna Chandra Mandal 2016-05-13  358  		*rodiv_p = rodiv;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  359  
ce6e1188465998 Purna Chandra Mandal 2016-05-13  360  	if (rotrim_p)
ce6e1188465998 Purna Chandra Mandal 2016-05-13  361  		*rotrim_p = rotrim;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  362  }
ce6e1188465998 Purna Chandra Mandal 2016-05-13  363  

:::::: The code at line 350 was first introduced by commit
:::::: ce6e1188465998820e7182455261b1f5d508ca17 CLK: microchip: Add Microchip PIC32 clock driver.

:::::: TO: Purna Chandra Mandal <purna.mandal@microchip.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
