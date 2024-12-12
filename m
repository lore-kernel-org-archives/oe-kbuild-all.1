Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0372594B3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 01:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733966300; cv=none; b=gmxl7k6T0WaFXAFExKAh4rGq1REPYH92Lf1St7klwf920lzkTQMMLfSn/IvIqNf4UmyUbVOthsjff3UDAk5KgYBMe0pTbF0RU0BN7lWgB6UV+5BgD+1gk2L3C1bjW8H4nYPNvmeaCyCQDb6f5z1C5LmpS/bIw4j7zJol0DYWBz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733966300; c=relaxed/simple;
	bh=Mcos6yaunqcJHrsWmNdghPjHDqMo2go0+0qrzTvYUJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpUAgHs7OnfVlCD5iR9O+0vTiaXCkqRoIAavZ4DNDE4Ot+My14r87KZlKFbib5EripCkIit13HpqPzTSV+TyqQkAEHVlbmQej/+K4WTIyT4h0qjOKMg9ZiHqJMi0aZBZrZiy9+H90VW7PssOcKLshgYRKu+f+FQFOHhDsfdGLJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mth5NNQc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mth5NNQc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733966298; x=1765502298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mcos6yaunqcJHrsWmNdghPjHDqMo2go0+0qrzTvYUJg=;
  b=mth5NNQcxiqRFHAO1eebPQ6wOf5cMr6B4bKEqk4buPcGMBm9OECO6y4v
   r+7AwOK+Giuzn/ANXBPKXNTI4QxE7JkK5r2eVaxI4OOyN1wI3hXzqRO//
   /WhvUNs9IXbtlspN2Z3vQMKyf/mGeigCKPwV5VO2tBOKmVneflfGWGAr1
   cBP/DgWQaJ6m30PeyJ9RZ1F7irxebXTDidSi6FIlI15+tUI2HVCIr/qi6
   NhWwz5vzPHJsuQTt2QEQlCjetVjlgocRUVMXoM6K5iBKrtkk7hL+GQAry
   uV36tXUHkYl1FNM9t2XkWB0oBxQaX89gAIh1ube1knro6F7PF6kHdhY87
   A==;
X-CSE-ConnectionGUID: 55/152ARTfG/QN3NjM/3Hw==
X-CSE-MsgGUID: iNsStE3bRUSTO4nPUF7NNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="33698988"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="33698988"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 17:18:17 -0800
X-CSE-ConnectionGUID: MvYlKGgHTSqPFEPSGIcZIA==
X-CSE-MsgGUID: 4X+Q5kzUSkSAX/jEhktFuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="96450989"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Dec 2024 17:18:15 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLXqH-0007HZ-25;
	Thu, 12 Dec 2024 01:18:13 +0000
Date: Thu, 12 Dec 2024 09:18:05 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/3] pinctrl: Add driver support for Amlogic SoCs
Message-ID: <202412120953.MYiVQTqw-lkp@intel.com>
References: <20241211-amlogic-pinctrl-v1-2-410727335119@amlogic.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-amlogic-pinctrl-v1-2-410727335119@amlogic.com>

Hi Xianwei,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 171aa289a6fe65faffeb92a1fda283c055435a62]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-pinctrl-Add-support-for-Amlogic-SoCs/20241211-144931
base:   171aa289a6fe65faffeb92a1fda283c055435a62
patch link:    https://lore.kernel.org/r/20241211-amlogic-pinctrl-v1-2-410727335119%40amlogic.com
patch subject: [PATCH RFC 2/3] pinctrl: Add driver support for Amlogic SoCs
config: x86_64-buildonly-randconfig-005-20241212 (https://download.01.org/0day-ci/archive/20241212/202412120953.MYiVQTqw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120953.MYiVQTqw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412120953.MYiVQTqw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bitops.h:428,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from include/linux/spinlock.h:60,
                    from include/linux/irq.h:14,
                    from include/linux/irqchip/chained_irq.h:10,
                    from include/linux/gpio/driver.h:8,
                    from drivers/pinctrl/pinctrl-amlogic.c:8:
>> arch/x86/include/asm/arch_hweight.h:9:17: error: expected identifier before string constant
       9 | #define REG_OUT "a"
         |                 ^~~
   drivers/pinctrl/pinctrl-amlogic.c:38:9: note: in expansion of macro 'REG_OUT'
      38 |         REG_OUT,
         |         ^~~~~~~
>> drivers/pinctrl/pinctrl-amlogic.c:44:43: error: 'NUM_REG' undeclared here (not in a function)
      44 | static const unsigned int aml_bit_strides[NUM_REG] = {
         |                                           ^~~~~~~
   drivers/pinctrl/pinctrl-amlogic.c: In function 'aml_calc_reg_and_bit':
>> drivers/pinctrl/pinctrl-amlogic.c:203:51: warning: parameter 'reg_type' set but not used [-Wunused-but-set-parameter]
     203 |                                 enum aml_reg_type reg_type,
         |                                 ~~~~~~~~~~~~~~~~~~^~~~~~~~
   drivers/pinctrl/pinctrl-amlogic.c: In function 'aml_pinconf_get_drive_strength':
>> drivers/pinctrl/pinctrl-amlogic.c:257:47: error: 'REG_DS' undeclared (first use in this function); did you mean 'REG_DIR'?
     257 |         aml_calc_reg_and_bit(info->pctl, pin, REG_DS, &reg, &bit);
         |                                               ^~~~~~
         |                                               REG_DIR
   drivers/pinctrl/pinctrl-amlogic.c:257:47: note: each undeclared identifier is reported only once for each function it appears in
   In file included from arch/x86/include/asm/bitops.h:428,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from include/linux/spinlock.h:60,
                    from include/linux/irq.h:14,
                    from include/linux/irqchip/chained_irq.h:10,
                    from include/linux/gpio/driver.h:8,
                    from drivers/pinctrl/pinctrl-amlogic.c:8:
   drivers/pinctrl/pinctrl-amlogic.c: In function 'aml_pinconf_get_drive':
>> arch/x86/include/asm/arch_hweight.h:9:17: warning: passing argument 3 of 'aml_pinconf_get_gpio_bit' makes integer from pointer without a cast [-Wint-conversion]
       9 | #define REG_OUT "a"
         |                 ^~~
         |                 |
         |                 char *
   drivers/pinctrl/pinctrl-amlogic.c:311:52: note: in expansion of macro 'REG_OUT'
     311 |         return aml_pinconf_get_gpio_bit(info, pin, REG_OUT);
         |                                                    ^~~~~~~
   drivers/pinctrl/pinctrl-amlogic.c:284:50: note: expected 'unsigned int' but argument is of type 'char *'
     284 |                                     unsigned int reg_type)
         |                                     ~~~~~~~~~~~~~^~~~~~~~
   drivers/pinctrl/pinctrl-amlogic.c: In function 'aml_pinconf_set_drive_strength':
   drivers/pinctrl/pinctrl-amlogic.c:403:47: error: 'REG_DS' undeclared (first use in this function); did you mean 'REG_DIR'?
     403 |         aml_calc_reg_and_bit(info->pctl, pin, REG_DS, &reg, &bit);
         |                                               ^~~~~~
         |                                               REG_DIR
   In file included from arch/x86/include/asm/bitops.h:428,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from include/linux/spinlock.h:60,
                    from include/linux/irq.h:14,
                    from include/linux/irqchip/chained_irq.h:10,
                    from include/linux/gpio/driver.h:8,
                    from drivers/pinctrl/pinctrl-amlogic.c:8:
   drivers/pinctrl/pinctrl-amlogic.c: In function 'aml_pinconf_set_drive':
>> arch/x86/include/asm/arch_hweight.h:9:17: warning: passing argument 3 of 'aml_pinconf_set_gpio_bit' makes integer from pointer without a cast [-Wint-conversion]
       9 | #define REG_OUT "a"
         |                 ^~~
         |                 |
         |                 char *
   drivers/pinctrl/pinctrl-amlogic.c:446:52: note: in expansion of macro 'REG_OUT'
     446 |         return aml_pinconf_set_gpio_bit(info, pin, REG_OUT, high);
         |                                                    ^~~~~~~
   drivers/pinctrl/pinctrl-amlogic.c:425:50: note: expected 'unsigned int' but argument is of type 'char *'
     425 |                                     unsigned int reg_type,
         |                                     ~~~~~~~~~~~~~^~~~~~~~
   drivers/pinctrl/pinctrl-amlogic.c: In function 'aml_gpio_calc_reg_and_bit':
   drivers/pinctrl/pinctrl-amlogic.c:884:63: warning: parameter 'reg_type' set but not used [-Wunused-but-set-parameter]
     884 |                                             enum aml_reg_type reg_type,
         |                                             ~~~~~~~~~~~~~~~~~~^~~~~~~~
   In file included from arch/x86/include/asm/bitops.h:428,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from include/linux/spinlock.h:60,
                    from include/linux/irq.h:14,
                    from include/linux/irqchip/chained_irq.h:10,
                    from include/linux/gpio/driver.h:8,
                    from drivers/pinctrl/pinctrl-amlogic.c:8:
   drivers/pinctrl/pinctrl-amlogic.c: In function 'aml_gpio_direction_output':
>> arch/x86/include/asm/arch_hweight.h:9:17: error: incompatible type for argument 2 of 'aml_gpio_calc_reg_and_bit'
       9 | #define REG_OUT "a"
         |                 ^~~
         |                 |
         |                 char *
   drivers/pinctrl/pinctrl-amlogic.c:936:41: note: in expansion of macro 'REG_OUT'
     936 |         aml_gpio_calc_reg_and_bit(bank, REG_OUT, gpio, &reg, &bit);
         |                                         ^~~~~~~
   drivers/pinctrl/pinctrl-amlogic.c:884:63: note: expected 'enum aml_reg_type' but argument is of type 'char *'
     884 |                                             enum aml_reg_type reg_type,
         |                                             ~~~~~~~~~~~~~~~~~~^~~~~~~~
   In file included from arch/x86/include/asm/bitops.h:428,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from include/linux/spinlock.h:60,
                    from include/linux/irq.h:14,
                    from include/linux/irqchip/chained_irq.h:10,
                    from include/linux/gpio/driver.h:8,
                    from drivers/pinctrl/pinctrl-amlogic.c:8:
   drivers/pinctrl/pinctrl-amlogic.c: In function 'aml_gpio_set':
>> arch/x86/include/asm/arch_hweight.h:9:17: error: incompatible type for argument 2 of 'aml_gpio_calc_reg_and_bit'
       9 | #define REG_OUT "a"
         |                 ^~~
         |                 |
         |                 char *
   drivers/pinctrl/pinctrl-amlogic.c:948:41: note: in expansion of macro 'REG_OUT'
     948 |         aml_gpio_calc_reg_and_bit(bank, REG_OUT, gpio, &reg, &bit);
         |                                         ^~~~~~~
   drivers/pinctrl/pinctrl-amlogic.c:884:63: note: expected 'enum aml_reg_type' but argument is of type 'char *'
     884 |                                             enum aml_reg_type reg_type,
         |                                             ~~~~~~~~~~~~~~~~~~^~~~~~~~
   In file included from arch/x86/include/asm/bitops.h:428,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from include/linux/spinlock.h:60,
                    from include/linux/irq.h:14,
                    from include/linux/irqchip/chained_irq.h:10,
                    from include/linux/gpio/driver.h:8,
                    from drivers/pinctrl/pinctrl-amlogic.c:8:
   drivers/pinctrl/pinctrl-amlogic.c: In function 'aml_gpio_get':
   arch/x86/include/asm/arch_hweight.h:8:16: error: incompatible type for argument 2 of 'aml_gpio_calc_reg_and_bit'
       8 | #define REG_IN "D"
         |                ^~~
         |                |
         |                char *
   drivers/pinctrl/pinctrl-amlogic.c:960:41: note: in expansion of macro 'REG_IN'
     960 |         aml_gpio_calc_reg_and_bit(bank, REG_IN, gpio, &reg, &bit);
         |                                         ^~~~~~
   drivers/pinctrl/pinctrl-amlogic.c:884:63: note: expected 'enum aml_reg_type' but argument is of type 'char *'
     884 |                                             enum aml_reg_type reg_type,
         |                                             ~~~~~~~~~~~~~~~~~~^~~~~~~~
   At top level:
>> drivers/pinctrl/pinctrl-amlogic.c:48:27: warning: 'aml_reg_type_offset' defined but not used [-Wunused-variable]
      48 | static const unsigned int aml_reg_type_offset[NUM_REG] = {
         |                           ^~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/pinctrl-amlogic.c:44:27: warning: 'aml_bit_strides' defined but not used [-Wunused-variable]
      44 | static const unsigned int aml_bit_strides[NUM_REG] = {
         |                           ^~~~~~~~~~~~~~~


vim +/NUM_REG +44 drivers/pinctrl/pinctrl-amlogic.c

   > 8	#include <linux/gpio/driver.h>
     9	#include <linux/init.h>
    10	#include <linux/io.h>
    11	#include <linux/module.h>
    12	#include <linux/of.h>
    13	#include <linux/of_address.h>
    14	#include <linux/platform_device.h>
    15	#include <linux/regmap.h>
    16	#include <linux/seq_file.h>
    17	#include <linux/slab.h>
    18	#include <linux/string_helpers.h>
    19	
    20	#include <linux/pinctrl/consumer.h>
    21	#include <linux/pinctrl/pinconf.h>
    22	#include <linux/pinctrl/pinctrl.h>
    23	#include <linux/pinctrl/pinmux.h>
    24	#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
    25	
    26	#include "core.h"
    27	#include "pinconf.h"
    28	
    29	#define gpio_chip_to_bank(chip) \
    30			container_of(chip, struct aml_gpio_bank, gpio_chip)
    31	/**
    32	 * enum aml_reg_type - type of registers encoded in @aml_reg_desc
    33	 */
    34	enum aml_reg_type {
    35		REG_PULLEN,
    36		REG_PULL,
    37		REG_DIR,
  > 38		REG_OUT,
    39		REG_IN,
    40		REG_DS,
    41		NUM_REG,
    42	};
    43	
  > 44	static const unsigned int aml_bit_strides[NUM_REG] = {
    45		1, 1, 1, 1, 1, 2
    46	};
    47	
  > 48	static const unsigned int aml_reg_type_offset[NUM_REG] = {
    49		3, 4, 2, 1, 0, 7
    50	};
    51	
    52	enum aml_pinconf_drv {
    53		PINCONF_DRV_500UA,
    54		PINCONF_DRV_2500UA,
    55		PINCONF_DRV_3000UA,
    56		PINCONF_DRV_4000UA,
    57	};
    58	
    59	struct aml_pio_control {
    60		int reg_mux_offset;
    61		int bit_mux_offset;
    62		int reg_gpio_offset;
    63		int reg_offset[NUM_REG];
    64	};
    65	
    66	struct aml_pctl_data {
    67	};
    68	
    69	struct aml_pinconf {
    70		int		pin;
    71		int		altfunc;
    72	};
    73	
    74	struct aml_pmx_func {
    75		const char	*name;
    76		const char	**groups;
    77		unsigned int	ngroups;
    78	};
    79	
    80	struct aml_pctl_group {
    81		const char		*name;
    82		unsigned short		npins;
    83		unsigned int		*pins;
    84		struct aml_pinconf	*pin_conf;
    85		unsigned long           *configs;
    86		unsigned int            num_configs;
    87	};
    88	
    89	struct aml_gpio_bank {
    90		struct gpio_chip		gpio_chip;
    91		struct aml_pio_control		pc;
    92		unsigned int                    bank_idx;
    93		unsigned int			pin_base;
    94	};
    95	
    96	struct aml_pinctrl {
    97		struct device			*dev;
    98		struct pinctrl_dev		*pctl;
    99		struct aml_gpio_bank		*banks;
   100		int				nbanks;
   101		struct aml_pmx_func		*functions;
   102		int				nfunctions;
   103		struct aml_pctl_group		*groups;
   104		int				ngroups;
   105	
   106		struct regmap			*reg_mux;
   107		struct regmap			*reg_gpio;
   108		struct regmap			*reg_pullen;
   109		struct regmap			*reg_pull;
   110		struct regmap			*reg_ds;
   111		const struct aml_pctl_data	*data;
   112	};
   113	
   114	static int aml_pmx_calc_reg_and_offset(struct pinctrl_gpio_range *range,
   115					       unsigned int pin, unsigned int *reg,
   116					       unsigned int *offset)
   117	{
   118		struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
   119		unsigned int shift;
   120	
   121		shift = ((pin - range->pin_base) << 2) + bank->pc.bit_mux_offset;
   122		*reg = (bank->pc.reg_mux_offset + (shift / 32)) * 4;
   123		*offset = shift % 32;
   124	
   125		return 0;
   126	}
   127	
   128	static int aml_pctl_set_function(struct aml_pinctrl *info,
   129					 struct pinctrl_gpio_range *range,
   130					 int pin_id, int func)
   131	{
   132		int reg;
   133		int offset;
   134	
   135		aml_pmx_calc_reg_and_offset(range, pin_id, &reg, &offset);
   136		return regmap_update_bits(info->reg_mux, reg,
   137				0xf << offset, (func & 0xf) << offset);
   138	}
   139	
   140	static int aml_pmx_get_funcs_count(struct pinctrl_dev *pctldev)
   141	{
   142		struct aml_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
   143	
   144		return info->nfunctions;
   145	}
   146	
   147	static const char *aml_pmx_get_fname(struct pinctrl_dev *pctldev,
   148					     unsigned int selector)
   149	{
   150		struct aml_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
   151	
   152		return info->functions[selector].name;
   153	}
   154	
   155	static int aml_pmx_get_groups(struct pinctrl_dev *pctldev,
   156				      unsigned int selector,
   157				      const char * const **grps,
   158				      unsigned * const ngrps)
   159	{
   160		struct aml_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
   161	
   162		*grps = info->functions[selector].groups;
   163		*ngrps = info->functions[selector].ngroups;
   164	
   165		return 0;
   166	}
   167	
   168	static int aml_pmx_set_mux(struct pinctrl_dev *pctldev, unsigned int fselector,
   169				   unsigned int group)
   170	{
   171		struct aml_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
   172		struct aml_pinconf *conf = info->groups[group].pin_conf;
   173		struct pinctrl_gpio_range *range;
   174		int i;
   175	
   176		for (i = 0; i < info->groups[group].npins; i++) {
   177			range =  pinctrl_find_gpio_range_from_pin(pctldev, conf[i].pin);
   178			aml_pctl_set_function(info, range, conf[i].pin, conf[i].altfunc);
   179		}
   180	
   181		return 0;
   182	}
   183	
   184	static int aml_pmx_request_gpio(struct pinctrl_dev *pctldev,
   185					struct pinctrl_gpio_range *range,
   186					unsigned int pin)
   187	{
   188		struct aml_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
   189	
   190		return aml_pctl_set_function(info, range, pin, 0);
   191	}
   192	
   193	static const struct pinmux_ops aml_pmx_ops = {
   194		.set_mux		= aml_pmx_set_mux,
   195		.get_functions_count	= aml_pmx_get_funcs_count,
   196		.get_function_name	= aml_pmx_get_fname,
   197		.get_function_groups	= aml_pmx_get_groups,
   198		.gpio_request_enable	= aml_pmx_request_gpio,
   199	};
   200	
   201	static int aml_calc_reg_and_bit(struct pinctrl_dev *pctldev,
   202					unsigned int pin,
 > 203					enum aml_reg_type reg_type,
   204					unsigned int *reg, unsigned int *bit)
   205	{
   206		struct pinctrl_gpio_range *range =
   207				 pinctrl_find_gpio_range_from_pin(pctldev, pin);
   208		struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
   209	
   210		*bit = (pin - range->pin_base) * aml_bit_strides[reg_type];
   211		*reg = (bank->pc.reg_offset[reg_type] + (*bit / 32)) * 4;
   212		*bit &= 0x1f;
   213	
   214		return 0;
   215	}
   216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
