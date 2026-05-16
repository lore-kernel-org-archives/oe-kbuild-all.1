Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B08D2F7F0F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 22:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778971148; cv=none; b=HhqQAau8KvteY4S53uWN3wUe71sKRKyw8du1qNJvbFwc+4O8pKFOtRLf4bSA6zDTMHJ4W4rbBO4PRWk6edcjQLmqSL3jfKAEtpvN/EroZOAf/BhE3Z/faMuxfqC2KOpuLBM4xHtmCJkEB6ciCrQwFK98vmq5SgkXhMWobfhpDIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778971148; c=relaxed/simple;
	bh=29rMrOd/UzIA08BnTHeV4XjBsOcGES75QMUkGXF2yx4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pz6HBFVL//YTqqKIM3LU5TAqG98FIBNZ2njiFsyCWd0pNhqaJkRhQvRbYjsiPHTAgGmYHwyJyfoBP01JePu72HvmDf1j2CgkiCbz21DQbda5EYOSLBtWQPf5PD4ogtpDUrAf2hEKh9lqfBi4ygAWwEZCYtJcsRTuE2+aNMMWzd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5yyXixs; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5yyXixs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778971145; x=1810507145;
  h=date:from:to:cc:subject:message-id;
  bh=29rMrOd/UzIA08BnTHeV4XjBsOcGES75QMUkGXF2yx4=;
  b=n5yyXixsHBxCTYrfV45zMaC5gwo55ErOvpZnSfbxABHhqZF3DMJTyoxQ
   xOf9FAIccBoN+PLkgXZaD+oqDVt6agvUpQhGo0td892LXHg/nv1g8/DKl
   1lKrhHI/IkmS4QiyoK7ccbSwcTU8QLVZQ69eAnpA5T/C4jRd65psz+A+8
   B+86XqLp8mFs52kWUVsUDHDlcY+oBArVQUNO2K43XcYFPred1wfqDFBWh
   MIzVlw1Ecm2Y9iWq+B0pt+HtiAzW//8TNHCvk/iU3tJX0jd4BINyeM/W4
   GntCQHhO6B2UAbi7j3FpVNGAT7phvPTZHBmvtdbIT385/y5S5Z/5xLFf2
   w==;
X-CSE-ConnectionGUID: t/Qgm4T3SQupISyP0E48Pg==
X-CSE-MsgGUID: FUUY2pEqRXmX6ImKdizZJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="78904506"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="78904506"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 15:39:04 -0700
X-CSE-ConnectionGUID: 6yd8L5MlRySEcejC8fmWag==
X-CSE-MsgGUID: KJNBSW/ASeWZB0QopMHZYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="244014547"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 May 2026 15:39:03 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wONev-000000001BW-0vdw;
	Sat, 16 May 2026 22:39:01 +0000
Date: Sun, 17 May 2026 06:38:24 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cbeznea:at91-next 6/8] drivers/clk/at91/sama5d3.c:25:68:
 warning: missing braces around initializer
Message-ID: <202605170638.kWfvNRbC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/claudiubeznea/linux.git at91-next
head:   f52da2147731872899626a0e61faa2b951049cc9
commit: 1d2563715880d5e865190b68f29fd98f93da717b [6/8] clk: at91: use kzalloc_flex
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260517/202605170638.kWfvNRbC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605170638.kWfvNRbC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605170638.kWfvNRbC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/at91/sama5d3.c:28:19: error: initialization of 'long unsigned int' from 'const struct clk_range *' makes integer from pointer without a cast [-Wint-conversion]
      28 |         .output = plla_outputs,
         |                   ^~~~~~~~~~~~
   drivers/clk/at91/sama5d3.c:28:19: note: (near initialization for 'plla_characteristics.output[0].min')
>> drivers/clk/at91/sama5d3.c:25:68: warning: missing braces around initializer [-Wmissing-braces]
      25 | static const struct clk_pll_characteristics plla_characteristics = {
         |                                                                    ^
   ......
      28 |         .output = plla_outputs,
         |                   {{          }}
--
   drivers/clk/at91/sama5d4.c:28:19: error: initialization of 'long unsigned int' from 'const struct clk_range *' makes integer from pointer without a cast [-Wint-conversion]
      28 |         .output = plla_outputs,
         |                   ^~~~~~~~~~~~
   drivers/clk/at91/sama5d4.c:28:19: note: (near initialization for 'plla_characteristics.output[0].min')
>> drivers/clk/at91/sama5d4.c:25:68: warning: missing braces around initializer [-Wmissing-braces]
      25 | static const struct clk_pll_characteristics plla_characteristics = {
         |                                                                    ^
   ......
      28 |         .output = plla_outputs,
         |                   {{          }}
--
   drivers/clk/at91/sama5d2.c:28:19: error: initialization of 'long unsigned int' from 'const struct clk_range *' makes integer from pointer without a cast [-Wint-conversion]
      28 |         .output = plla_outputs,
         |                   ^~~~~~~~~~~~
   drivers/clk/at91/sama5d2.c:28:19: note: (near initialization for 'plla_characteristics.output[0].min')
>> drivers/clk/at91/sama5d2.c:25:68: warning: missing braces around initializer [-Wmissing-braces]
      25 | static const struct clk_pll_characteristics plla_characteristics = {
         |                                                                    ^
   ......
      28 |         .output = plla_outputs,
         |                   {{          }}
--
   drivers/clk/at91/sama7d65.c:139:19: error: initialization of 'long unsigned int' from 'const struct clk_range *' makes integer from pointer without a cast [-Wint-conversion]
     139 |         .output = cpu_pll_outputs,
         |                   ^~~~~~~~~~~~~~~
   drivers/clk/at91/sama7d65.c:139:19: note: (near initialization for 'cpu_pll_characteristics.output[0].min')
>> drivers/clk/at91/sama7d65.c:136:71: warning: missing braces around initializer [-Wmissing-braces]
     136 | static const struct clk_pll_characteristics cpu_pll_characteristics = {
         |                                                                       ^
   ......
     139 |         .output = cpu_pll_outputs,
         |                   {{             }}
   drivers/clk/at91/sama7d65.c:148:19: error: initialization of 'long unsigned int' from 'const struct clk_range *' makes integer from pointer without a cast [-Wint-conversion]
     148 |         .output = pll_outputs,
         |                   ^~~~~~~~~~~
   drivers/clk/at91/sama7d65.c:148:19: note: (near initialization for 'pll_characteristics.output[0].min')
   drivers/clk/at91/sama7d65.c:145:67: warning: missing braces around initializer [-Wmissing-braces]
     145 | static const struct clk_pll_characteristics pll_characteristics = {
         |                                                                   ^
   ......
     148 |         .output = pll_outputs,
         |                   {{         }}
   drivers/clk/at91/sama7d65.c:156:19: error: initialization of 'long unsigned int' from 'const struct clk_range *' makes integer from pointer without a cast [-Wint-conversion]
     156 |         .output = lvdspll_outputs,
         |                   ^~~~~~~~~~~~~~~
   drivers/clk/at91/sama7d65.c:156:19: note: (near initialization for 'lvdspll_characteristics.output[0].min')
   drivers/clk/at91/sama7d65.c:153:71: warning: missing braces around initializer [-Wmissing-braces]
     153 | static const struct clk_pll_characteristics lvdspll_characteristics = {
         |                                                                       ^
   ......
     156 |         .output = lvdspll_outputs,
         |                   {{             }}
   drivers/clk/at91/sama7d65.c:164:19: error: initialization of 'long unsigned int' from 'const struct clk_range *' makes integer from pointer without a cast [-Wint-conversion]
     164 |         .output = upll_outputs,
         |                   ^~~~~~~~~~~~
   drivers/clk/at91/sama7d65.c:164:19: note: (near initialization for 'upll_characteristics.output[0].min')
   drivers/clk/at91/sama7d65.c:161:68: warning: missing braces around initializer [-Wmissing-braces]
     161 | static const struct clk_pll_characteristics upll_characteristics = {
         |                                                                    ^
   ......
     164 |         .output = upll_outputs,
         |                   {{          }}
--
   drivers/clk/at91/sama7g5.c:114:19: error: initialization of 'long unsigned int' from 'const struct clk_range *' makes integer from pointer without a cast [-Wint-conversion]
     114 |         .output = cpu_pll_outputs,
         |                   ^~~~~~~~~~~~~~~
   drivers/clk/at91/sama7g5.c:114:19: note: (near initialization for 'cpu_pll_characteristics.output[0].min')
>> drivers/clk/at91/sama7g5.c:111:71: warning: missing braces around initializer [-Wmissing-braces]
     111 | static const struct clk_pll_characteristics cpu_pll_characteristics = {
         |                                                                       ^
   ......
     114 |         .output = cpu_pll_outputs,
         |                   {{             }}
   drivers/clk/at91/sama7g5.c:123:19: error: initialization of 'long unsigned int' from 'const struct clk_range *' makes integer from pointer without a cast [-Wint-conversion]
     123 |         .output = pll_outputs,
         |                   ^~~~~~~~~~~
   drivers/clk/at91/sama7g5.c:123:19: note: (near initialization for 'pll_characteristics.output[0].min')
   drivers/clk/at91/sama7g5.c:120:67: warning: missing braces around initializer [-Wmissing-braces]
     120 | static const struct clk_pll_characteristics pll_characteristics = {
         |                                                                   ^
   ......
     123 |         .output = pll_outputs,
         |                   {{         }}


vim +25 drivers/clk/at91/sama5d3.c

0969b242f7b8e5 Alexandre Belloni 2020-01-10  24  
0969b242f7b8e5 Alexandre Belloni 2020-01-10 @25  static const struct clk_pll_characteristics plla_characteristics = {
0969b242f7b8e5 Alexandre Belloni 2020-01-10  26  	.input = { .min = 8000000, .max = 50000000 },
0969b242f7b8e5 Alexandre Belloni 2020-01-10  27  	.num_output = ARRAY_SIZE(plla_outputs),
0969b242f7b8e5 Alexandre Belloni 2020-01-10  28  	.output = plla_outputs,
0969b242f7b8e5 Alexandre Belloni 2020-01-10  29  	.icpll = plla_icpll,
0969b242f7b8e5 Alexandre Belloni 2020-01-10  30  	.out = plla_out,
0969b242f7b8e5 Alexandre Belloni 2020-01-10  31  };
0969b242f7b8e5 Alexandre Belloni 2020-01-10  32  

:::::: The code at line 25 was first introduced by commit
:::::: 0969b242f7b8e5de0a1c28f81d8558fd678c066d clk: at91: add sama5d3 pmc driver

:::::: TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
