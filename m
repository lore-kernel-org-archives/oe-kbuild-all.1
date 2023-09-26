Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8CF3C68A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 18:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695754113; x=1727290113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DkgJjSD+A5RfcbT/V6BftNQ971pR6hNIiSskm6brbxA=;
  b=kLBLYcAzlBGANuqDFLEOpjB2DrhAINZZczd3jwmcq2VRoeVfLzdaTNDp
   R7PMK00UmZ0PoSzUEwl5/GdoL5GEFGJoVpjUt8TUgq88mlo3LXu14npUn
   TZKXHnkNwkFhAe1So2ehYQTFLwMMX620ajdE2Kp56ZknujC3Z++p4j46P
   bHoTtf8EOYQZQt52U5Cdf1oWTsMX9HmvMANaD4/osr4MtOPs6E3NYN3WL
   4jIKTB2g3OCheuY4GgKKlJDxsg25z4t/9xbCe04L82+9hCHtLRsnZx6SL
   ZPmRmdXFfGvm4YnGjrDFeQPJltO/d0RxgAa1zbBkF7qiz6B0gNKf4v9Xo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361021901"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="361021901"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 11:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="892313007"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="892313007"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2023 11:47:20 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlD6d-0003Fu-2p;
	Tue, 26 Sep 2023 18:48:23 +0000
Date: Wed, 27 Sep 2023 02:47:56 +0800
From: kernel test robot <lkp@intel.com>
To: Tzuyi Chang <tychang@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-pinctrl:devel 15/25]
 drivers/pinctrl/realtek/pinctrl-rtd.c:180:29: warning: '%s' directive
 argument is null
Message-ID: <202309270234.aJGlDE0P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   caaeb8c551123e26e86270c8dec99a78f1f6fe0f
commit: e99ce78030db2fca9b296a1c4f4aaa87b008d97b [15/25] pinctrl: realtek: Add common pinctrl driver for Realtek DHC RTD SoCs
config: arm-randconfig-001-20230926 (https://download.01.org/0day-ci/archive/20230927/202309270234.aJGlDE0P-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309270234.aJGlDE0P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309270234.aJGlDE0P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/pinctrl/realtek/pinctrl-rtd.c:18:
   drivers/pinctrl/realtek/pinctrl-rtd.c: In function 'rtd_pinctrl_set_one_mux':
>> drivers/pinctrl/realtek/pinctrl-rtd.c:180:29: warning: '%s' directive argument is null [-Wformat-overflow=]
     180 |         dev_err(pcdev->dev, "No function %s available for pin %s\n", func_name, mux->name);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/pinctrl/realtek/pinctrl-rtd.c:180:9: note: in expansion of macro 'dev_err'
     180 |         dev_err(pcdev->dev, "No function %s available for pin %s\n", func_name, mux->name);
         |         ^~~~~~~
   drivers/pinctrl/realtek/pinctrl-rtd.c:180:63: note: format string is defined here
     180 |         dev_err(pcdev->dev, "No function %s available for pin %s\n", func_name, mux->name);
         |                                                               ^~
   drivers/pinctrl/realtek/pinctrl-rtd.c:168:37: warning: '%s' directive argument is null [-Wformat-overflow=]
     168 |                 dev_err(pcdev->dev, "No functions available for pin %s\n", mux->name);
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/pinctrl/realtek/pinctrl-rtd.c:168:17: note: in expansion of macro 'dev_err'
     168 |                 dev_err(pcdev->dev, "No functions available for pin %s\n", mux->name);
         |                 ^~~~~~~
   drivers/pinctrl/realtek/pinctrl-rtd.c:168:69: note: format string is defined here
     168 |                 dev_err(pcdev->dev, "No functions available for pin %s\n", mux->name);
         |                                                                     ^~


vim +180 drivers/pinctrl/realtek/pinctrl-rtd.c

  > 18	#include <linux/platform_device.h>
    19	#include <linux/seq_file.h>
    20	#include <linux/regmap.h>
    21	#include <linux/slab.h>
    22	#include "../core.h"
    23	#include "../pinctrl-utils.h"
    24	#include "pinctrl-rtd.h"
    25	
    26	struct rtd_pinctrl {
    27		struct device *dev;
    28		struct pinctrl_dev *pcdev;
    29		void __iomem *base;
    30		struct pinctrl_desc desc;
    31		const struct rtd_pinctrl_desc *info;
    32		struct regmap *regmap_pinctrl;
    33	};
    34	
    35	/* custom pinconf parameters */
    36	#define RTD_DRIVE_STRENGH_P (PIN_CONFIG_END + 1)
    37	#define RTD_DRIVE_STRENGH_N (PIN_CONFIG_END + 2)
    38	#define RTD_DUTY_CYCLE (PIN_CONFIG_END + 3)
    39	
    40	static const struct pinconf_generic_params rtd_custom_bindings[] = {
    41		{"realtek,drive-strength-p", RTD_DRIVE_STRENGH_P, 0},
    42		{"realtek,drive-strength-n", RTD_DRIVE_STRENGH_N, 0},
    43		{"realtek,duty-cycle", RTD_DUTY_CYCLE, 0},
    44	};
    45	
    46	static int rtd_pinctrl_get_groups_count(struct pinctrl_dev *pcdev)
    47	{
    48		struct rtd_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
    49	
    50		return data->info->num_groups;
    51	}
    52	
    53	static const char *rtd_pinctrl_get_group_name(struct pinctrl_dev *pcdev,
    54						      unsigned int selector)
    55	{
    56		struct rtd_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
    57	
    58		return data->info->groups[selector].name;
    59	}
    60	
    61	static int rtd_pinctrl_get_group_pins(struct pinctrl_dev *pcdev,
    62					      unsigned int selector,
    63					      const unsigned int **pins,
    64					      unsigned int *num_pins)
    65	{
    66		struct rtd_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
    67	
    68		*pins = data->info->groups[selector].pins;
    69		*num_pins = data->info->groups[selector].num_pins;
    70	
    71		return 0;
    72	}
    73	
    74	static void rtd_pinctrl_dbg_show(struct pinctrl_dev *pcdev,
    75					 struct seq_file *s,
    76					 unsigned int offset)
    77	{
    78		struct rtd_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
    79		const struct rtd_pin_desc *mux = &data->info->muxes[offset];
    80		const struct rtd_pin_mux_desc *func;
    81		u32 val;
    82		u32 mask;
    83		u32 pin_val;
    84		int is_map;
    85	
    86		if (!mux->name) {
    87			seq_puts(s, "[not defined]");
    88			return;
    89		}
    90		val = readl_relaxed(data->base + mux->mux_offset);
    91		mask = mux->mux_mask;
    92		pin_val = val & mask;
    93	
    94		is_map = 0;
    95		func = &mux->functions[0];
    96		seq_puts(s, "function: ");
    97		while (func->name) {
    98			if (func->mux_value == pin_val) {
    99				is_map = 1;
   100				seq_printf(s, "[%s] ", func->name);
   101			} else {
   102				seq_printf(s, "%s ", func->name);
   103			}
   104			func++;
   105		}
   106		if (!is_map)
   107			seq_puts(s, "[not defined]");
   108	}
   109	
   110	static const struct pinctrl_ops rtd_pinctrl_ops = {
   111		.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
   112		.dt_free_map = pinctrl_utils_free_map,
   113		.get_groups_count = rtd_pinctrl_get_groups_count,
   114		.get_group_name = rtd_pinctrl_get_group_name,
   115		.get_group_pins = rtd_pinctrl_get_group_pins,
   116		.pin_dbg_show = rtd_pinctrl_dbg_show,
   117	};
   118	
   119	static int rtd_pinctrl_get_functions_count(struct pinctrl_dev *pcdev)
   120	{
   121		struct rtd_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
   122	
   123		return data->info->num_functions;
   124	}
   125	
   126	static const char *rtd_pinctrl_get_function_name(struct pinctrl_dev *pcdev,
   127							 unsigned int selector)
   128	{
   129		struct rtd_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
   130	
   131		return data->info->functions[selector].name;
   132	}
   133	
   134	static int rtd_pinctrl_get_function_groups(struct pinctrl_dev *pcdev,
   135						   unsigned int selector,
   136						   const char * const **groups,
   137						   unsigned int * const num_groups)
   138	{
   139		struct rtd_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
   140	
   141		*groups = data->info->functions[selector].groups;
   142		*num_groups = data->info->functions[selector].num_groups;
   143	
   144		return 0;
   145	}
   146	
   147	static const struct rtd_pin_desc *rtd_pinctrl_find_mux(struct rtd_pinctrl *data, unsigned int pin)
   148	{
   149		if (!data->info->muxes[pin].name)
   150			return &data->info->muxes[pin];
   151	
   152		return NULL;
   153	}
   154	
   155	static int rtd_pinctrl_set_one_mux(struct pinctrl_dev *pcdev,
   156					   unsigned int pin, const char *func_name)
   157	{
   158		struct rtd_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
   159		const struct rtd_pin_desc *mux;
   160		int ret = 0;
   161		int i;
   162	
   163		mux = rtd_pinctrl_find_mux(data, pin);
   164		if (!mux)
   165			return 0;
   166	
   167		if (!mux->functions) {
   168			dev_err(pcdev->dev, "No functions available for pin %s\n", mux->name);
   169			return -ENOTSUPP;
   170		}
   171	
   172		for (i = 0; mux->functions[i].name; i++) {
   173			if (strcmp(mux->functions[i].name, func_name) != 0)
   174				continue;
   175			ret = regmap_update_bits(data->regmap_pinctrl, mux->mux_offset, mux->mux_mask,
   176						mux->functions[i].mux_value);
   177			return ret;
   178		}
   179	
 > 180		dev_err(pcdev->dev, "No function %s available for pin %s\n", func_name, mux->name);
   181	
   182		return -EINVAL;
   183	}
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
