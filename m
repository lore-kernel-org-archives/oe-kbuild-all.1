Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF99B1E86C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 02:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707358886; cv=none; b=cnvGRVDuOd+KHwCs8RAhgvGT8dbRUiUb1ICDq5VmM7qO99IBRupf78/Zdzr4RsDMaVcajCfLdHdt9tDN2cR+oVpL2/hQzHBoYerw5NWbSPJaRD3nr/G1LJR+5SmsBYHWinlfCHcoPIDBmh5E6Nlq/nWK1JsREWNkvYurp2aMpH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707358886; c=relaxed/simple;
	bh=xkt9JsI8QQ+X8GJXGtDiG0G7mn1TexH8S+YX0+BeVpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KpFPiY6YfLO4TnsKNCX+07MgMANBe3I1FySMelwZHq/WHYoV5cvjO5H83+h2542I6YHCs8XT0eWqvvMrVaJauj1KN8fUZ+mAcfYf0YRMvE0LKlxIoUe86PE7sUQdqvt1xt8ldlHKu8TICSJH68pu817dt2dBiT40CzWNuI0jEv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GUz5ERkz; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GUz5ERkz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707358883; x=1738894883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xkt9JsI8QQ+X8GJXGtDiG0G7mn1TexH8S+YX0+BeVpI=;
  b=GUz5ERkzaaEvx1+y3cYZGbmY6tHGbAdcIrd/Cs8APe3PctuZl4ITvR0z
   jMTu0MvNwrHEF0JFPcnMyp4QNYts+EXi2cZZx47V8n+AYGtNU5cFzEDH0
   4g/eUp3a6vSq+AgQCMnKTgoJNpSMh35iiuncfWDyF9Oa1jC78BxEmK9gl
   uz8RTHiGd/RVAA0vmNgmXBfP2wDb82wdN5AoKpomFqjKSxAZSpXqKFBJw
   MzPyEB0IcKxeJpwVENzH7XTTXoK5UTHHR1WSmeZkjDFRH/KheXYY3ZQcn
   fXsgNxKf16UAHlCNlQI9rP6GIfNGPvkOubnc6tMPqaCe5trVPVgI62QOA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="436266511"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="436266511"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 18:21:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="1837259"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Feb 2024 18:21:21 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXu2Q-0003Fg-2G;
	Thu, 08 Feb 2024 02:21:18 +0000
Date: Thu, 8 Feb 2024 10:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:devel/overflow/signed-sanitizer 24/27]
 drivers/rtc/rtc-ds1307.c:1385:39: warning: format '%ld' expects argument of
 type 'long int', but argument 3 has type 'int'
Message-ID: <202402081027.XZBkQbxi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/signed-sanitizer
head:   fdc16607cd55a37f5d4924c47f1642047c4ea1e1
commit: fdbd267624a365d8cc07337965dcc1aeedd35af3 [24/27] [WIP] PTR_ERR() is always asigned to int variables
config: i386-randconfig-001-20240208 (https://download.01.org/0day-ci/archive/20240208/202402081027.XZBkQbxi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402081027.XZBkQbxi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402081027.XZBkQbxi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from include/linux/i2c.h:13,
                    from drivers/rtc/rtc-ds1307.c:12:
   drivers/rtc/rtc-ds1307.c: In function 'ds1307_hwmon_register':
>> drivers/rtc/rtc-ds1307.c:1385:39: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'int' [-Wformat=]
    1385 |                 dev_warn(ds1307->dev, "unable to register hwmon device %ld\n",
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:146:61: note: in expansion of macro 'dev_fmt'
     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/rtc/rtc-ds1307.c:1385:17: note: in expansion of macro 'dev_warn'
    1385 |                 dev_warn(ds1307->dev, "unable to register hwmon device %ld\n",
         |                 ^~~~~~~~
   drivers/rtc/rtc-ds1307.c:1385:74: note: format string is defined here
    1385 |                 dev_warn(ds1307->dev, "unable to register hwmon device %ld\n",
         |                                                                        ~~^
         |                                                                          |
         |                                                                          long int
         |                                                                        %d
--
   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from include/linux/i2c.h:13,
                    from drivers/rtc/rtc-pcf2127.c:20:
   drivers/rtc/rtc-pcf2127.c: In function 'pcf2127_i2c_probe':
>> drivers/rtc/rtc-pcf2127.c:1391:39: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'int' [-Wformat=]
    1391 |                 dev_err(&client->dev, "%s: regmap allocation failed: %ld\n",
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/rtc/rtc-pcf2127.c:1391:17: note: in expansion of macro 'dev_err'
    1391 |                 dev_err(&client->dev, "%s: regmap allocation failed: %ld\n",
         |                 ^~~~~~~
   drivers/rtc/rtc-pcf2127.c:1391:72: note: format string is defined here
    1391 |                 dev_err(&client->dev, "%s: regmap allocation failed: %ld\n",
         |                                                                      ~~^
         |                                                                        |
         |                                                                        long int
         |                                                                      %d
--
   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from include/linux/i2c.h:13,
                    from drivers/rtc/rtc-rv3029c2.c:12:
   drivers/rtc/rtc-rv3029c2.c: In function 'rv3029_hwmon_register':
>> drivers/rtc/rtc-rv3029c2.c:684:31: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'int' [-Wformat=]
     684 |                 dev_warn(dev, "unable to register hwmon device %ld\n",
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:146:61: note: in expansion of macro 'dev_fmt'
     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/rtc/rtc-rv3029c2.c:684:17: note: in expansion of macro 'dev_warn'
     684 |                 dev_warn(dev, "unable to register hwmon device %ld\n",
         |                 ^~~~~~~~
   drivers/rtc/rtc-rv3029c2.c:684:66: note: format string is defined here
     684 |                 dev_warn(dev, "unable to register hwmon device %ld\n",
         |                                                                ~~^
         |                                                                  |
         |                                                                  long int
         |                                                                %d
--
   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:8,
                    from sound/soc/bcm/bcm63xx-i2s-whistler.c:8:
   sound/soc/bcm/bcm63xx-i2s-whistler.c: In function 'bcm63xx_i2s_dev_probe':
>> sound/soc/bcm/bcm63xx-i2s-whistler.c:238:37: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'int' [-Wformat=]
     238 |                 dev_err(&pdev->dev, "%s: cannot get a brcm clock: %ld\n",
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/bcm/bcm63xx-i2s-whistler.c:238:17: note: in expansion of macro 'dev_err'
     238 |                 dev_err(&pdev->dev, "%s: cannot get a brcm clock: %ld\n",
         |                 ^~~~~~~
   sound/soc/bcm/bcm63xx-i2s-whistler.c:238:69: note: format string is defined here
     238 |                 dev_err(&pdev->dev, "%s: cannot get a brcm clock: %ld\n",
         |                                                                   ~~^
         |                                                                     |
         |                                                                     long int
         |                                                                   %d
--
   In file included from include/linux/device.h:15,
                    from include/linux/pci.h:37,
                    from drivers/pci/doe.c:19:
   drivers/pci/doe.c: In function 'pci_doe_init':
>> drivers/pci/doe.c:13:22: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'int' [-Wformat=]
      13 | #define dev_fmt(fmt) "DOE: " fmt
         |                      ^~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   include/linux/pci.h:2691:41: note: in expansion of macro 'dev_err'
    2691 | #define pci_err(pdev, fmt, arg...)      dev_err(&(pdev)->dev, fmt, ##arg)
         |                                         ^~~~~~~
   drivers/pci/doe.c:692:25: note: in expansion of macro 'pci_err'
     692 |                         pci_err(pdev, "[%x] failed to create mailbox: %ld\n",
         |                         ^~~~~~~
--
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/cxl/core/port.c:3:
   drivers/cxl/core/port.c: In function 'devm_cxl_add_port':
>> drivers/cxl/core/port.c:883:36: warning: format '%ld' expects argument of type 'long int', but argument 7 has type 'int' [-Wformat=]
     883 |                 dev_dbg(uport_dev, "Failed to add%s%s%s: %ld\n",
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:129:41: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ^~~
   include/linux/dev_printk.h:163:45: note: in expansion of macro 'dev_fmt'
     163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                             ^~~~~~~
   drivers/cxl/core/port.c:883:17: note: in expansion of macro 'dev_dbg'
     883 |                 dev_dbg(uport_dev, "Failed to add%s%s%s: %ld\n",
         |                 ^~~~~~~
   drivers/cxl/core/port.c:883:60: note: format string is defined here
     883 |                 dev_dbg(uport_dev, "Failed to add%s%s%s: %ld\n",
         |                                                          ~~^
         |                                                            |
         |                                                            long int
         |                                                          %d
   drivers/cxl/core/port.c: In function 'devm_cxl_add_dport':
   drivers/cxl/core/port.c:1175:36: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'int' [-Wformat=]
    1175 |                 dev_dbg(dport_dev, "failed to add dport to %s: %ld\n",
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:129:41: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ^~~
   include/linux/dev_printk.h:163:45: note: in expansion of macro 'dev_fmt'
     163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                             ^~~~~~~
   drivers/cxl/core/port.c:1175:17: note: in expansion of macro 'dev_dbg'
    1175 |                 dev_dbg(dport_dev, "failed to add dport to %s: %ld\n",
         |                 ^~~~~~~
   drivers/cxl/core/port.c:1175:66: note: format string is defined here
    1175 |                 dev_dbg(dport_dev, "failed to add dport to %s: %ld\n",
         |                                                                ~~^
         |                                                                  |
         |                                                                  long int
         |                                                                %d
   drivers/cxl/core/port.c: In function 'devm_cxl_add_rch_dport':
   drivers/cxl/core/port.c:1209:36: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'int' [-Wformat=]
    1209 |                 dev_dbg(dport_dev, "failed to add RCH dport to %s: %ld\n",
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:129:41: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ^~~
   include/linux/dev_printk.h:163:45: note: in expansion of macro 'dev_fmt'
     163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                             ^~~~~~~
   drivers/cxl/core/port.c:1209:17: note: in expansion of macro 'dev_dbg'
    1209 |                 dev_dbg(dport_dev, "failed to add RCH dport to %s: %ld\n",
         |                 ^~~~~~~
   drivers/cxl/core/port.c:1209:70: note: format string is defined here
    1209 |                 dev_dbg(dport_dev, "failed to add RCH dport to %s: %ld\n",
         |                                                                    ~~^
         |                                                                      |
         |                                                                      long int
         |                                                                    %d
--
   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from include/linux/i2c.h:13,
                    from sound/soc/codecs/adau7118-i2c.c:7:
   sound/soc/codecs/adau7118-i2c.c: In function 'adau7118_probe_i2c':
>> sound/soc/codecs/adau7118-i2c.c:57:36: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'int' [-Wformat=]
      57 |                 dev_err(&i2c->dev, "Failed to init regmap %ld\n", PTR_ERR(map));
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/codecs/adau7118-i2c.c:57:17: note: in expansion of macro 'dev_err'
      57 |                 dev_err(&i2c->dev, "Failed to init regmap %ld\n", PTR_ERR(map));
         |                 ^~~~~~~
   sound/soc/codecs/adau7118-i2c.c:57:61: note: format string is defined here
      57 |                 dev_err(&i2c->dev, "Failed to init regmap %ld\n", PTR_ERR(map));
         |                                                           ~~^
         |                                                             |
         |                                                             long int
         |                                                           %d
--
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from include/sound/soc.h:15,
                    from sound/soc/intel/avs/topology.c:11:
   sound/soc/intel/avs/topology.c: In function 'avs_tplg_pipeline_create':
>> sound/soc/intel/avs/topology.c:1240:44: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'int' [-Wformat=]
    1240 |                         dev_err(comp->dev, "parse module failed: %ld\n",
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/intel/avs/topology.c:1240:25: note: in expansion of macro 'dev_err'
    1240 |                         dev_err(comp->dev, "parse module failed: %ld\n",
         |                         ^~~~~~~
   sound/soc/intel/avs/topology.c:1240:68: note: format string is defined here
    1240 |                         dev_err(comp->dev, "parse module failed: %ld\n",
         |                                                                  ~~^
         |                                                                    |
         |                                                                    long int
         |                                                                  %d
   sound/soc/intel/avs/topology.c: In function 'avs_tplg_path_create':
   sound/soc/intel/avs/topology.c:1327:44: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'int' [-Wformat=]
    1327 |                         dev_err(comp->dev, "parse pipeline failed: %ld\n",
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/intel/avs/topology.c:1327:25: note: in expansion of macro 'dev_err'
    1327 |                         dev_err(comp->dev, "parse pipeline failed: %ld\n",
         |                         ^~~~~~~
   sound/soc/intel/avs/topology.c:1327:70: note: format string is defined here
    1327 |                         dev_err(comp->dev, "parse pipeline failed: %ld\n",
         |                                                                    ~~^
         |                                                                      |
         |                                                                      long int
         |                                                                    %d
   sound/soc/intel/avs/topology.c: In function 'parse_path_template':
   sound/soc/intel/avs/topology.c:1383:44: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'int' [-Wformat=]
    1383 |                         dev_err(comp->dev, "parse path failed: %ld\n", PTR_ERR(path));
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/intel/avs/topology.c:1383:25: note: in expansion of macro 'dev_err'
    1383 |                         dev_err(comp->dev, "parse path failed: %ld\n", PTR_ERR(path));
         |                         ^~~~~~~
   sound/soc/intel/avs/topology.c:1383:66: note: format string is defined here
    1383 |                         dev_err(comp->dev, "parse path failed: %ld\n", PTR_ERR(path));
         |                                                                ~~^
         |                                                                  |
         |                                                                  long int
         |                                                                %d
   sound/soc/intel/avs/topology.c: In function 'avs_widget_load':
   sound/soc/intel/avs/topology.c:1493:36: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'int' [-Wformat=]
    1493 |                 dev_err(comp->dev, "widget %s load failed: %ld\n", dw->name,
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/intel/avs/topology.c:1493:17: note: in expansion of macro 'dev_err'
    1493 |                 dev_err(comp->dev, "widget %s load failed: %ld\n", dw->name,
         |                 ^~~~~~~
   sound/soc/intel/avs/topology.c:1493:62: note: format string is defined here
    1493 |                 dev_err(comp->dev, "widget %s load failed: %ld\n", dw->name,
         |                                                            ~~^
         |                                                              |
         |                                                              long int
         |                                                            %d
--
   In file included from include/linux/device.h:15,
                    from include/linux/pci.h:37,
                    from sound/soc/intel/avs/core.c:18:
   sound/soc/intel/avs/core.c: In function 'probe_codec':
>> sound/soc/intel/avs/core.c:134:35: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'int' [-Wformat=]
     134 |                 dev_err(bus->dev, "init codec failed: %ld\n", PTR_ERR(codec));
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/intel/avs/core.c:134:17: note: in expansion of macro 'dev_err'
     134 |                 dev_err(bus->dev, "init codec failed: %ld\n", PTR_ERR(codec));
         |                 ^~~~~~~
   sound/soc/intel/avs/core.c:134:57: note: format string is defined here
     134 |                 dev_err(bus->dev, "init codec failed: %ld\n", PTR_ERR(codec));
         |                                                       ~~^
         |                                                         |
         |                                                         long int
         |                                                       %d


vim +1385 drivers/rtc/rtc-ds1307.c

445c02076f1e60 Akinobu Mita      2016-01-25  1373  
445c02076f1e60 Akinobu Mita      2016-01-25  1374  static void ds1307_hwmon_register(struct ds1307 *ds1307)
445c02076f1e60 Akinobu Mita      2016-01-25  1375  {
445c02076f1e60 Akinobu Mita      2016-01-25  1376  	struct device *dev;
445c02076f1e60 Akinobu Mita      2016-01-25  1377  
445c02076f1e60 Akinobu Mita      2016-01-25  1378  	if (ds1307->type != ds_3231)
445c02076f1e60 Akinobu Mita      2016-01-25  1379  		return;
445c02076f1e60 Akinobu Mita      2016-01-25  1380  
11e5890b5342c8 Heiner Kallweit   2017-03-10  1381  	dev = devm_hwmon_device_register_with_groups(ds1307->dev, ds1307->name,
4057a66e5333bf Alexandre Belloni 2017-09-04  1382  						     ds1307,
4057a66e5333bf Alexandre Belloni 2017-09-04  1383  						     ds3231_hwmon_groups);
445c02076f1e60 Akinobu Mita      2016-01-25  1384  	if (IS_ERR(dev)) {
11e5890b5342c8 Heiner Kallweit   2017-03-10 @1385  		dev_warn(ds1307->dev, "unable to register hwmon device %ld\n",
11e5890b5342c8 Heiner Kallweit   2017-03-10  1386  			 PTR_ERR(dev));
445c02076f1e60 Akinobu Mita      2016-01-25  1387  	}
445c02076f1e60 Akinobu Mita      2016-01-25  1388  }
445c02076f1e60 Akinobu Mita      2016-01-25  1389  

:::::: The code at line 1385 was first introduced by commit
:::::: 11e5890b5342c82eefbaa39aec4767ae21ae8803 rtc: ds1307: convert driver to regmap

:::::: TO: Heiner Kallweit <hkallweit1@gmail.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@free-electrons.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
