Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E171DFDE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 May 2026 04:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778990477; cv=none; b=H66yhI+FRLV3OHUz8o9J+JRCk5R+QQsd4o20EjXseYgfdr7tgaLxFWcoLfThOtr7FqZUj0+KhZRB6KZyuiZjyRrp4Qj0xfuf8iXVGTH5+MARusBd9ak93ZThUvxJFE8gvJYB4LMlPkRxnyZVUDgGLxSiG7KUkmBGIYaD47jo7OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778990477; c=relaxed/simple;
	bh=u+ToPrQDDWweEZZuheBxI4rRRzxjA04QShUdsUFbw8w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t40V7aTpQr5SZSgDNAth2D6ODI5ozc68Egzhy40K5dEQ7B011H6y2bsTfQhVrxH83y19NV+H1J5Z9gWGPtZzNtnDQ9v6mWOFGpo5x5QpKAekT+A1r0Q3soyL65AlFik75riX7z7wZUldBcyF0iAkPNDC29tO089wIGLB+Ww56x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jT9j7EDv; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jT9j7EDv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778990475; x=1810526475;
  h=date:from:to:cc:subject:message-id;
  bh=u+ToPrQDDWweEZZuheBxI4rRRzxjA04QShUdsUFbw8w=;
  b=jT9j7EDv+nvW9/zOUkLbcMKIWTg254u3u2p8S4uoDh7keJ7DoG42f1ib
   Yfvh8twpS9qj1Vl1+5hT5iGIRC51gJk9FDPwrAMHvdNZwAqmn50KWvyZj
   7yafgn6WhB6O7oJucp/ZHSVU1PvQiLKiQqFi5bl7VnvJNnzu8Kr7x6Pf/
   NZWDTzIDrBqOlKQfd2ZoTLjYArAcqP/Ed1YaHjV+Y+9cMTSVF+BTLXaLC
   5yDr4e3lTAZYjy9I3gj2sSMUGZehIeIpgXhA7TWlDRlga00ZXxfYDmdCc
   OHfNL+4vQT4Mopt0w63PzVoWo6y4bkbfLbPNPwwSgiO1nITfS3lKSVzBW
   A==;
X-CSE-ConnectionGUID: ULDPaOlWRY61W2GvEMpQ4A==
X-CSE-MsgGUID: vXUK6qJmRVKREn/QXRp94w==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="102560550"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="102560550"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 21:01:15 -0700
X-CSE-ConnectionGUID: zFvgNOq/QtKgW7b2C+BTDA==
X-CSE-MsgGUID: t6XJ2xynTiGYaJ9wtNAGsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="232698967"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 May 2026 21:01:12 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOSgg-000000001L6-2bvA;
	Sun, 17 May 2026 04:01:10 +0000
Date: Sun, 17 May 2026 12:00:40 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cbeznea:at91-next 6/8] drivers/clk/at91/sama5d3.c:28:19:
 error: initialization of 'long unsigned int' from 'const struct clk_range *'
 makes integer from pointer without a cast
Message-ID: <202605171114.NFw4IZRg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/claudiubeznea/linux.git at91-next
head:   f52da2147731872899626a0e61faa2b951049cc9
commit: 1d2563715880d5e865190b68f29fd98f93da717b [6/8] clk: at91: use kzalloc_flex
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260517/202605171114.NFw4IZRg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605171114.NFw4IZRg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605171114.NFw4IZRg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/at91/sama5d3.c:28:19: error: initialization of 'long unsigned int' from 'const struct clk_range *' makes integer from pointer without a cast [-Wint-conversion]
      28 |         .output = plla_outputs,
         |                   ^~~~~~~~~~~~
   drivers/clk/at91/sama5d3.c:28:19: note: (near initialization for 'plla_characteristics.output[0].min')
   drivers/clk/at91/sama5d3.c:25:68: warning: missing braces around initializer [-Wmissing-braces]
      25 | static const struct clk_pll_characteristics plla_characteristics = {
         |                                                                    ^
   ......
      28 |         .output = plla_outputs,
         |                   {{          }}
--
   drivers/clk/at91/dt-compat.c: In function 'of_at91_clk_pll_get_characteristics':
>> drivers/clk/at91/dt-compat.c:594:17: error: 'charecteristics' undeclared (first use in this function); did you mean 'characteristics'?
     594 |                 charecteristics->output[i].min = tmp;
         |                 ^~~~~~~~~~~~~~~
         |                 characteristics
   drivers/clk/at91/dt-compat.c:594:17: note: each undeclared identifier is reported only once for each function it appears in
--
>> drivers/clk/at91/sama5d4.c:28:19: error: initialization of 'long unsigned int' from 'const struct clk_range *' makes integer from pointer without a cast [-Wint-conversion]
      28 |         .output = plla_outputs,
         |                   ^~~~~~~~~~~~
   drivers/clk/at91/sama5d4.c:28:19: note: (near initialization for 'plla_characteristics.output[0].min')
   drivers/clk/at91/sama5d4.c:25:68: warning: missing braces around initializer [-Wmissing-braces]
      25 | static const struct clk_pll_characteristics plla_characteristics = {
         |                                                                    ^
   ......
      28 |         .output = plla_outputs,
         |                   {{          }}
--
>> drivers/clk/at91/sama5d2.c:28:19: error: initialization of 'long unsigned int' from 'const struct clk_range *' makes integer from pointer without a cast [-Wint-conversion]
      28 |         .output = plla_outputs,
         |                   ^~~~~~~~~~~~
   drivers/clk/at91/sama5d2.c:28:19: note: (near initialization for 'plla_characteristics.output[0].min')
   drivers/clk/at91/sama5d2.c:25:68: warning: missing braces around initializer [-Wmissing-braces]
      25 | static const struct clk_pll_characteristics plla_characteristics = {
         |                                                                    ^
   ......
      28 |         .output = plla_outputs,
         |                   {{          }}
--
>> drivers/clk/at91/sama7d65.c:139:19: error: initialization of 'long unsigned int' from 'const struct clk_range *' makes integer from pointer without a cast [-Wint-conversion]
     139 |         .output = cpu_pll_outputs,
         |                   ^~~~~~~~~~~~~~~
   drivers/clk/at91/sama7d65.c:139:19: note: (near initialization for 'cpu_pll_characteristics.output[0].min')
   drivers/clk/at91/sama7d65.c:136:71: warning: missing braces around initializer [-Wmissing-braces]
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
>> drivers/clk/at91/sama7g5.c:114:19: error: initialization of 'long unsigned int' from 'const struct clk_range *' makes integer from pointer without a cast [-Wint-conversion]
     114 |         .output = cpu_pll_outputs,
         |                   ^~~~~~~~~~~~~~~
   drivers/clk/at91/sama7g5.c:114:19: note: (near initialization for 'cpu_pll_characteristics.output[0].min')
   drivers/clk/at91/sama7g5.c:111:71: warning: missing braces around initializer [-Wmissing-braces]
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


vim +28 drivers/clk/at91/sama5d3.c

0969b242f7b8e5 Alexandre Belloni 2020-01-10  24  
0969b242f7b8e5 Alexandre Belloni 2020-01-10  25  static const struct clk_pll_characteristics plla_characteristics = {
0969b242f7b8e5 Alexandre Belloni 2020-01-10  26  	.input = { .min = 8000000, .max = 50000000 },
0969b242f7b8e5 Alexandre Belloni 2020-01-10  27  	.num_output = ARRAY_SIZE(plla_outputs),
0969b242f7b8e5 Alexandre Belloni 2020-01-10 @28  	.output = plla_outputs,
0969b242f7b8e5 Alexandre Belloni 2020-01-10  29  	.icpll = plla_icpll,
0969b242f7b8e5 Alexandre Belloni 2020-01-10  30  	.out = plla_out,
0969b242f7b8e5 Alexandre Belloni 2020-01-10  31  };
0969b242f7b8e5 Alexandre Belloni 2020-01-10  32  

:::::: The code at line 28 was first introduced by commit
:::::: 0969b242f7b8e5de0a1c28f81d8558fd678c066d clk: at91: add sama5d3 pmc driver

:::::: TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
