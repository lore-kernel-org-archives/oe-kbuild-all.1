Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDCD6BFAB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 09:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707385659; cv=none; b=pzwODoqNqOmly/i4KwX24/ttpRkje47TQlMi31Fzqa6cp5DkvYI2kOKAdou7KxQB5kvtjw9CGmhp5lLZNS0mb25HtHiOnRqDPlyFR1DvfT664XUFcqUWP03flARXOIeZJRFH3Ui/DyjB1BBOnOMgVIVOmPZmhKxNqQflaejK2PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707385659; c=relaxed/simple;
	bh=Qvf4u7kwrGYy31W3UBZG+A5qpBv/dPEopZJfVOFHd/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VIE4bk3ySS7/mA8bLZqi5K2O3wfj+eeNCZm1ocGMjUBqxOT1PKTGAlaDLshWQWBVuuLseZfpTBWPgR3+PuawHLkss3hOHjUhQw7DcneeKbkjoSNTJQ70ZuWI5mpmArYhCrgROD/MEkmKqS94bhqXMS2h+nRCiK+M2b5PCc5czWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BoZL/e30; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BoZL/e30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707385657; x=1738921657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qvf4u7kwrGYy31W3UBZG+A5qpBv/dPEopZJfVOFHd/I=;
  b=BoZL/e30XArZJwEjcWgjjzJusEEBwZuqPYE/Pe5QW6pup4OJTvuKgvDu
   CsM+NI4kYM5lUvXiyyHhUNsQg5pX/HgCw8Mk0pPJxzdVND/8Zuw0vZ4jh
   kgI/kymSfrw9RaZ56Zn4HOkBKTI2qQoE1NwIVXfbPRzkhCT2VLTM8wigg
   Ocml8NG0U/MOaY8la6kBPd6+0nUDB+DxRt0dcFRQh0S93lCFmcbhtL1l+
   3ydA3ZTNPHNhe/5LNfwXbd1iUkipUQs5QYiJqKpgCXLHiVuks/AULbdns
   218yw1/cES47gu+caQFZCzHDvO/tYlE3rg2FnOotO6BTvGCWgnyWJIGD5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="23663278"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="23663278"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 01:47:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1894967"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Feb 2024 01:47:34 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY10G-0003aK-0R;
	Thu, 08 Feb 2024 09:47:32 +0000
Date: Thu, 8 Feb 2024 17:47:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3012/3162]
 drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:134:6: warning: variable
 'value_back' set but not used
Message-ID: <202402081752.gAN0sn4t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   65bd617b2c522ab952dfa702c65f23bb39cccee6
commit: 996e18349e58a3ace519f9c0f32f4e62fc46ec2c [3012/3162] Add support Zhaoxin GPIO pinctrl
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240208/202402081752.gAN0sn4t-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402081752.gAN0sn4t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402081752.gAN0sn4t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:134:6: warning: variable 'value_back' set but not used [-Wunused-but-set-variable]
     134 |         u16 value_back = 0;
         |             ^
>> drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:257:6: warning: variable 'pin' set but not used [-Wunused-but-set-variable]
     257 |         int pin;
         |             ^
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:277:6: warning: variable 'pin' set but not used [-Wunused-but-set-variable]
     277 |         int pin;
         |             ^
>> drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:337:6: warning: variable 'base_offset' set but not used [-Wunused-but-set-variable]
     337 |         int base_offset = 0;
         |             ^
>> drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:340:6: warning: variable 'value_read' set but not used [-Wunused-but-set-variable]
     340 |         u16 value_read;
         |             ^
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:371:6: warning: variable 'base_offset' set but not used [-Wunused-but-set-variable]
     371 |         int base_offset = 0;
         |             ^
   6 warnings generated.


vim +/value_back +134 drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c

   128	
   129	static void zhaoxin_gpio_set_gpio_mode_and_pull(struct zhaoxin_pinctrl *pctrl, unsigned int pin,
   130			bool isup)
   131	{
   132		u16 tmp = 0;
   133		u16 value;
 > 134		u16 value_back = 0;
   135	
   136		if (isup)
   137			tmp = ZHAOXIN_PULL_UP_10K|1;
   138		else
   139			tmp = ZHAOXIN_PULL_DOWN|1;
   140		value = zx_pad_read16(pctrl, pin);
   141	
   142		//for gpio
   143		if (pin <= 0x32 && pin >= 0x29) {
   144			if (isup) {
   145				value &= (~(ZHAOXIN_PULL_DOWN));
   146				value |= tmp;
   147			} else {
   148				value &= (~(ZHAOXIN_PULL_UP));
   149				value |= tmp;
   150			}
   151			value &= ~(0x1);
   152			zx_pad_write16(pctrl, pin, value);
   153			value_back = zx_pad_read16(pctrl, pin);
   154		} else {// for pgpio
   155			if (isup) {
   156				value &= (~(ZHAOXIN_PULL_DOWN));
   157				value |= tmp;
   158			} else {
   159				value &= (~(ZHAOXIN_PULL_UP));
   160				value |= tmp;
   161			}
   162			value |= 0x1;
   163			zx_pad_write16(pctrl, pin, value);
   164			value_back = zx_pad_read16(pctrl, pin);
   165		}
   166	}
   167	
   168	
   169	static int zhaoxin_gpio_request_enable(struct pinctrl_dev *pctldev,
   170			struct pinctrl_gpio_range *range, unsigned int pin)
   171	{
   172		struct zhaoxin_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
   173		int hwgpio = pin_to_hwgpio(range, pin);
   174	
   175		dev_dbg(pctrl->dev, "%s, hwgpio=%d, pin=%d\n", __func__, hwgpio, pin);
   176		zhaoxin_gpio_set_gpio_mode_and_pull(pctrl, pin, true);
   177		return 0;
   178	}
   179	
   180	static const struct pinmux_ops zhaoxin_pinmux_ops = {
   181		.get_functions_count = zhaoxin_get_functions_count,
   182		.get_function_name = zhaoxin_get_function_name,
   183		.get_function_groups = zhaoxin_get_function_groups,
   184		.set_mux = zhaoxin_pinmux_set_mux,
   185		.gpio_request_enable = zhaoxin_gpio_request_enable,
   186	};
   187	
   188	static int zhaoxin_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
   189				    unsigned long *config)
   190	{
   191		return 0;
   192	}
   193	
   194	static int zhaoxin_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
   195					unsigned long *configs, unsigned int nconfigs)
   196	{
   197		return 0;
   198	}
   199	
   200	static const struct pinconf_ops zhaoxin_pinconf_ops = {
   201		.is_generic = true,
   202		.pin_config_get = zhaoxin_config_get,
   203		.pin_config_set = zhaoxin_config_set,
   204	};
   205	
   206	static const struct pinctrl_desc zhaoxin_pinctrl_desc = {
   207		.pctlops = &zhaoxin_pinctrl_ops,
   208		.pmxops = &zhaoxin_pinmux_ops,
   209		.confops = &zhaoxin_pinconf_ops,
   210		.owner = THIS_MODULE,
   211	};
   212	
   213	static int zhaoxin_gpio_to_pin(struct zhaoxin_pinctrl *pctrl,
   214		unsigned int offset,
   215		const struct zhaoxin_pin_topology **community,
   216		const struct zhaoxin_pin_map2_gpio **padgrp)
   217	{
   218		int i;
   219	
   220		for (i = 0; i < pctrl->pin_map_size; i++) {
   221			const struct zhaoxin_pin_map2_gpio *map = &pctrl->pin_maps[i];
   222	
   223			if (map->zhaoxin_range_gpio_base == ZHAOXIN_GPIO_BASE_NOMAP)
   224				continue;
   225			if (offset >= map->zhaoxin_range_gpio_base &&
   226				offset < map->zhaoxin_range_gpio_base + map->zhaoxin_range_pin_size) {
   227				int pin;
   228	
   229				pin = map->zhaoxin_range_pin_base + offset - map->zhaoxin_range_gpio_base;
   230				if (padgrp)
   231					*padgrp = map;
   232				return pin;
   233			}
   234		}
   235		return -EINVAL;
   236	}
   237	
   238	static __maybe_unused int zhaoxin_pin_to_gpio(
   239		struct zhaoxin_pinctrl *pctrl, int pin)
   240	{
   241		const struct zhaoxin_pin_map2_gpio *pin_maps;
   242	
   243		pin_maps = pctrl->pin_maps;
   244		if (!pin_maps)
   245			return -EINVAL;
   246	
   247		return pin - pin_maps->zhaoxin_range_pin_base + pin_maps->zhaoxin_range_gpio_base;
   248	}
   249	
   250	static int zhaoxin_gpio_get(struct gpio_chip *chip,
   251		unsigned int offset)
   252	{
   253		struct zhaoxin_pinctrl *pctrl = gpiochip_get_data(chip);
   254		const struct index_cal_array *gpio_in_cal;
   255		int gap = offset/16;
   256		int bit = offset%16;
 > 257		int pin;
   258		int value;
   259	
   260		gpio_in_cal = pctrl->pin_topologys->gpio_in_cal;
   261		pin = zhaoxin_gpio_to_pin(pctrl, offset, NULL, NULL);
   262		value = zx_pad_read16(pctrl, gpio_in_cal->index+gap);
   263	
   264		value &= (1<<bit);
   265		return !!value;
   266	}
   267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
