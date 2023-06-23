Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991BBA41
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 05:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687499161; x=1719035161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ECHBR8oLu3XWbvE9PPbnj+fkeTCveAGvl2kyY64lvY=;
  b=lS/t6HVE00VMj1dvkRo4TumaOIjWgS1ou+y9hP8yhBixB4sMwg7xc1WD
   0BriztLM6opxnSoH6NbNlqwXrLqGUjqkxqg4JmSbsueeFBqOovfMDl5II
   TD20AKGUxc8Ccy3k8XgRwy+qoO1k/K2PMGT/dKZrKU10ffKNKgQhmc/ph
   21A35xWVJDmnVm85IojSjM7Pmq0oUS5N2dcAB1a6mwuVh70Zdz55Nmqth
   +yTCC4x2vf6IAARkivD1xDqu7jym6ASIjRjxfezgoZyVNZBJUPVPnoc5r
   R0qtWG4jQdN4W/aVzdTYfvD04AXXnAS10wXDMLVCc5yZLy2KU2JJ8cgMP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="359561815"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="359561815"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 22:46:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="709339660"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="709339660"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 22 Jun 2023 22:45:58 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCZcM-000813-0p;
	Fri, 23 Jun 2023 05:45:58 +0000
Date: Fri, 23 Jun 2023 13:45:45 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [daniel-lezcano:timers/drivers/next 6/9]
 drivers/clk/imx/clk-imx31.c:14:10: fatal error: soc/imx/timer.h: No such
 file or directory
Message-ID: <202306231333.gPkThiXk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   http://git.linaro.org/people/daniel.lezcano/linux timers/drivers/next
head:   6d0eb9759ac71fb5d008c90c0810d142f5a3ce99
commit: 9e9d7570485d724838322714cd413eb90d9459f4 [6/9] clocksource/drivers/imx-gpt: Fold <soc/imx/timer.h> into its only user
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230623/202306231333.gPkThiXk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306231333.gPkThiXk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306231333.gPkThiXk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/imx/clk-imx31.c:14:10: fatal error: soc/imx/timer.h: No such file or directory
      14 | #include <soc/imx/timer.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.
--
>> drivers/clk/imx/clk-imx35.c:13:10: fatal error: soc/imx/timer.h: No such file or directory
      13 | #include <soc/imx/timer.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.


vim +14 drivers/clk/imx/clk-imx31.c

0931aff7226abb drivers/clk/imx/clk-imx31.c   Shawn Guo    2015-05-15 @14  #include <soc/imx/timer.h>
0c831317e77b55 arch/arm/mach-imx/clk-imx31.c Shawn Guo    2015-04-25  15  #include <asm/irq.h>
95878cbed89504 arch/arm/mach-imx/clk-imx31.c Sascha Hauer 2012-03-18  16  

:::::: The code at line 14 was first introduced by commit
:::::: 0931aff7226abb7e1dab018488e363294385fa66 ARM: imx: define an enum for gpt timer device type

:::::: TO: Shawn Guo <shawn.guo@linaro.org>
:::::: CC: Shawn Guo <shawn.guo@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
