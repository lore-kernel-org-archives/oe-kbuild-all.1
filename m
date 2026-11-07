Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794088931;
	b=OPGd3uq2qnRp1RAa1T/FvWCsXY6+7+oxXZgbTAtEthjgOS3QCxBLGPmkDoPNBKyT3sUm
	 ttrzgBKGLTnr6r5tI89GlVw4IYewGevhgYZWB+2tksCQ/+OdSVEU/gHZOh7JKHN1HMxex
	 uNcweI4KdFacL9X+am8EuGzwJTebITILl82tyT3xtv0M+mU7bLBl8yO2sQnU91rK0dFFF
	 HymV1fl56HBUDjgEI3ZSdiclZStxuvtmuQ+5Usj6i7oGckIngr4fyK+yyuqTosdGnWmDS
	 u4l8+H59vUgce4k2wcEvNHe05iAXQz8HG2JltqGA7fd0kpINxIpvSkS/nuaqMLHv6Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794088931;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=TFBfymalczvPoTLtCnX9PXbAt/jocFUrRlBp0zCwc14=;
	b=hXkY/1OQjZFFRt6Gy2UedZ8AF2FUvi5v4mmi6CyUNvexDGlr9UJ36DSletzCWeJ3+moN
	 eX2o68hZhDZfpIgQt/9FPlcoLiA5hcYa/7THI9i/nba+2M36XBz2q2FHw4xMo1/SezPVz
	 qVTLpZYYxHdYTEiB5Vhg/+cTJOP4H4mTW0vzWzAcF7PDkEx2dVvZZq45cqCppzTyiBGEg
	 PyI13vc2zP/SNv43DNOXsrqyeWeRXNIiD2fAhU721OnrYdoZl41/o+ULbEUNc4Czok0Q8
	 x0cG5tF2kKwX2dyvZ+97W+gT9q1UNHa5WXngL54ojWwYN2Plr9JkeEZ4YQXswSePdFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="na/46taN";
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5381E606A326
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 22:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5381E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=na/46taN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794088929; x=1825624929;
  h=date:from:to:cc:subject:message-id;
  bh=qHeD9yJbSlHjrcKYzB+iim8iGmx0Pudbby/oiL9gemc=;
  b=na/46taNObTMoH18y2u35Te8ttBwqWdtmXN1QXdL2tOzSSRo1zcCQ7wL
   oaMK2gZEInK7GOWDAcpg5eS9JYhaWskChaf/5UCQvpHndRl1A9UHeZMys
   R860BTnCaL7ijPegUhNyUe1VaBV9kFQrmzdge0WtZtu3TPv0g2QkVVYZv
   cRP9G6t1fRdR7ScO8tHMxxSAis057Yn1rRNurUm5jnQknUCQNcq/9WSGr
   m8O7Tg4rWD3Fz9juOyWxMN/q8nn2o2W8xx+FHFqz0ir4wOHa1UsYsZ4d7
   pcg+Bx64hI95jj4TK0lJrKruyMEqDYHTVlJVtLIc/mdapq+ZbMvHvPWZk
   A==;
X-CSE-ConnectionGUID: 4kiFp73RS4WeZHG35D0eaw==
X-CSE-MsgGUID: 3ME+FyQ0Rvm3TTJThKbo+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2760232"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2760232"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 14:02:09 -0800
X-CSE-ConnectionGUID: ZcFjknhFQ56WeCupipTj+w==
X-CSE-MsgGUID: eeUF2BhXRVyHvGHmuijA5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7582182"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 07 Nov 2026 14:02:08 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPoU8-00000000Ann-2QSU;
	Sat, 07 Nov 2026 22:02:04 +0000
Date: Sat, 07 Nov 2026 23:01:42 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 91/154] Warning:
 drivers/net/dsa/mxl862xx/mxl862xx.c:2801 function parameter 'ds' not
 described in 'mxl862xx_fdb_add_per_fid'
Message-ID: <202611072218.Uk8bz8by-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/frank-w/BPI-R2-4.14 7.4-rc
head:   674a64f97be4d25967f31216ffe7eaefdabf827f
commit: fba64c5bff92869d5b2532a1a6ad56b34a15a2aa [91/154] net: dsa: add 802.1Q VLAN-based tag driver for MxL862xx
config: loongarch-randconfig-2200-20261107 (https://download.01.org/0day-ci/archive/20261107/202611072218.Uk8bz8by-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611072218.Uk8bz8by-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611072218.Uk8bz8by-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2801 function parameter 'ds' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2801 function parameter 'addr' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2801 function parameter 'vid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2801 function parameter 'fid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2801 function parameter 'port_id' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2820 function parameter 'ds' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2820 function parameter 'addr' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2820 function parameter 'vid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2820 function parameter 'fid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2801 function parameter 'ds' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2801 function parameter 'addr' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2801 function parameter 'vid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2801 function parameter 'fid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2801 function parameter 'port_id' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2820 function parameter 'ds' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2820 function parameter 'addr' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2820 function parameter 'vid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2820 function parameter 'fid' not described in 'mxl862xx_fdb_del_per_fid'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
