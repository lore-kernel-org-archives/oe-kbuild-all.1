Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D8A1396
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 02:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvVOh6hR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698115720; x=1729651720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z0f1IlylB7+SscNjc1gnBRr78gaizZ2vo/6yZJVip1o=;
  b=TvVOh6hRC30/N5rg2AzoubMqjOzjdjvuyrnBKcDUmH1pYpa1+bEdmI9g
   0UiuPUSR6lQZoK5CLO/5IZnHMlcz/GTLpV4+/944IwDtotCcHAeucIs5R
   G88BMhZlReOxjTDmFHt5CwGhDZla1CMFIQeD+Zkhte+D0TQM+Y00wzARc
   P3+fyjXRYAxAouV96JrCdVD1C8aeBsQwBPB7m2PgueP87foONgDYg0pk4
   cAe9A7j2S/jbhi12woutVfRQEUd9YX+EjU3+0FSMV8x30b18eYb/rTTvN
   0XsQ5gEptixcbFLrUvRESfU0WJUCxOM87P4qix2/1SGNsFpjPLjjN3Eoa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="384172009"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="384172009"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 19:48:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="6020661"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Oct 2023 19:47:20 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv7T8-0007Uv-0U;
	Tue, 24 Oct 2023 02:48:34 +0000
Date: Tue, 24 Oct 2023 10:47:37 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Shych <michaelsh@mellanox.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Vadim Pasternak <vadimp@mellanox.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: drivers/watchdog/mlx_wdt.c:55: warning: Function parameter or member
 'regmap_val_sz' not described in 'mlxreg_wdt'
Message-ID: <202310241044.lvqeOGli-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e017769f4ce20dc0d3fa3220d4d359dcc4431274
commit: eee851143bca4422eeee3bb2e104b85537ba449d watchdog: mlx-wdt: support new watchdog type with longer timeout period
date:   3 years, 3 months ago
config: x86_64-randconfig-r013-20230824 (https://download.01.org/0day-ci/archive/20231024/202310241044.lvqeOGli-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231024/202310241044.lvqeOGli-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310241044.lvqeOGli-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/watchdog/mlx_wdt.c:55: warning: Function parameter or member 'regmap_val_sz' not described in 'mlxreg_wdt'
   drivers/watchdog/mlx_wdt.c:55: warning: Function parameter or member 'wdt_type' not described in 'mlxreg_wdt'


vim +55 drivers/watchdog/mlx_wdt.c

c60923dd5feedc Michael Shych 2019-02-20  20  
c60923dd5feedc Michael Shych 2019-02-20  21  #define MLXREG_WDT_CLOCK_SCALE		1000
c60923dd5feedc Michael Shych 2019-02-20  22  #define MLXREG_WDT_MAX_TIMEOUT_TYPE1	32
c60923dd5feedc Michael Shych 2019-02-20  23  #define MLXREG_WDT_MAX_TIMEOUT_TYPE2	255
eee851143bca44 Michael Shych 2020-05-04  24  #define MLXREG_WDT_MAX_TIMEOUT_TYPE3	65535
c60923dd5feedc Michael Shych 2019-02-20  25  #define MLXREG_WDT_MIN_TIMEOUT		1
c60923dd5feedc Michael Shych 2019-02-20  26  #define MLXREG_WDT_OPTIONS_BASE (WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | \
c60923dd5feedc Michael Shych 2019-02-20  27  				 WDIOF_SETTIMEOUT)
c60923dd5feedc Michael Shych 2019-02-20  28  
c60923dd5feedc Michael Shych 2019-02-20  29  /**
c60923dd5feedc Michael Shych 2019-02-20  30   * struct mlxreg_wdt - wd private data:
c60923dd5feedc Michael Shych 2019-02-20  31   *
c60923dd5feedc Michael Shych 2019-02-20  32   * @wdd:	watchdog device;
c60923dd5feedc Michael Shych 2019-02-20  33   * @device:	basic device;
c60923dd5feedc Michael Shych 2019-02-20  34   * @pdata:	data received from platform driver;
c60923dd5feedc Michael Shych 2019-02-20  35   * @regmap:	register map of parent device;
c60923dd5feedc Michael Shych 2019-02-20  36   * @timeout:	defined timeout in sec.;
c60923dd5feedc Michael Shych 2019-02-20  37   * @action_idx:	index for direct access to action register;
c60923dd5feedc Michael Shych 2019-02-20  38   * @timeout_idx:index for direct access to TO register;
c60923dd5feedc Michael Shych 2019-02-20  39   * @tleft_idx:	index for direct access to time left register;
c60923dd5feedc Michael Shych 2019-02-20  40   * @ping_idx:	index for direct access to ping register;
c60923dd5feedc Michael Shych 2019-02-20  41   * @reset_idx:	index for direct access to reset cause register;
c60923dd5feedc Michael Shych 2019-02-20  42   * @wd_type:	watchdog HW type;
c60923dd5feedc Michael Shych 2019-02-20  43   */
c60923dd5feedc Michael Shych 2019-02-20  44  struct mlxreg_wdt {
c60923dd5feedc Michael Shych 2019-02-20  45  	struct watchdog_device wdd;
c60923dd5feedc Michael Shych 2019-02-20  46  	struct mlxreg_core_platform_data *pdata;
c60923dd5feedc Michael Shych 2019-02-20  47  	void *regmap;
c60923dd5feedc Michael Shych 2019-02-20  48  	int action_idx;
c60923dd5feedc Michael Shych 2019-02-20  49  	int timeout_idx;
c60923dd5feedc Michael Shych 2019-02-20  50  	int tleft_idx;
c60923dd5feedc Michael Shych 2019-02-20  51  	int ping_idx;
c60923dd5feedc Michael Shych 2019-02-20  52  	int reset_idx;
eee851143bca44 Michael Shych 2020-05-04  53  	int regmap_val_sz;
c60923dd5feedc Michael Shych 2019-02-20  54  	enum mlxreg_wdt_type wdt_type;
c60923dd5feedc Michael Shych 2019-02-20 @55  };
c60923dd5feedc Michael Shych 2019-02-20  56  

:::::: The code at line 55 was first introduced by commit
:::::: c60923dd5feedc337b1450e3f4c6e19ffa305439 watchdog: mlx-wdt: introduce a watchdog driver for Mellanox systems.

:::::: TO: Michael Shych <michaelsh@mellanox.com>
:::::: CC: Wim Van Sebroeck <wim@linux-watchdog.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
