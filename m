Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DEA69D3C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 12:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714306475; cv=none; b=UJm0vTm8NJlMdDjMtBzy6n1rlpXJiW7IYbNcEavcLQUWwfynmqVxmwSmdFMELLvTYBzsJLGbijPEHWHUMCrN1NPHh/QQEYgRXwEP1oZOMvmkQkqVo4i4nToUA/xZavqlAYPpHC+v30z9JE1ggm4x73ahsDX+EjypiPsSvUcCqd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714306475; c=relaxed/simple;
	bh=rLbP5oRPJw+i/udTCvwLgunbfh6mcJUI4XhRQcw428s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ES1fjIMbKq3DSrtXf5xiFP1vtT6K6QQSn2GXlaNZ76FGDJ1nPd78FISA5VMZUVE3ZHm/62DUiNZA8BjLxhsQeHH/KyvFcNR0+F81fE4cIuq1QOWbliH63zEOeq52SUV3XYrY7MKVwsDzCykH9D85OHLSA9RdKVO4QwEM4uAZ6b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GbdSxQSd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GbdSxQSd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714306473; x=1745842473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rLbP5oRPJw+i/udTCvwLgunbfh6mcJUI4XhRQcw428s=;
  b=GbdSxQSd2SI6OLW9nzciVcusEo5T1FsvMrGnw1zrB3Z2n4WXhU4okQqe
   aVigmR/Hy47c99/aCpLSUd+eGhqPMRP0GbHm9sxHHUJPl6+9QElqLfOZj
   b5XKUPXFYfEvMJK5gxOxsDVOVc50GROH95/6tQ/S0MImM9YYHWwceIij8
   1L0N3hstaSqgMly+6xRsgaVFBopeEcsjzCen++TRCnZwZe2E91ll4GXMa
   hQtitijc520XeLpKcShlWA3plr7EXbqA9ifT4mpsrcuyXRJiBHKbIaXrY
   KXKpcwmVzdvynGKOW2/TYIv+8FkquIiNzWbngfeXUCbljClA3cqP+BX0d
   g==;
X-CSE-ConnectionGUID: jG+YOoCeSEG0WL5OOhBhew==
X-CSE-MsgGUID: ufFb6/9BTYOXIaAW9zyj/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="20595879"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="20595879"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 05:14:33 -0700
X-CSE-ConnectionGUID: ri9JZCF1RUyuinj3LYeN9w==
X-CSE-MsgGUID: J0C5mG8kTpGue6kY2dwElQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="30512049"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Apr 2024 05:14:31 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s13QL-0006M6-1a;
	Sun, 28 Apr 2024 12:14:29 +0000
Date: Sun, 28 Apr 2024 20:13:38 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 4960/11728]
 drivers/pinctrl/freescale/pinctrl-imx.c:83:5: warning: no previous prototype
 for function 'imx_scmi_dt_node_to_map'
Message-ID: <202404282021.HXbX5ZIB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 392ef0f507c7e245ba3a2f4e92caa82569818080 [4960/11728] LF-10523-16-2 pinctrl: imx: support i.MX9 SCMI
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240428/202404282021.HXbX5ZIB-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404282021.HXbX5ZIB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404282021.HXbX5ZIB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/freescale/pinctrl-imx.c:83:5: warning: no previous prototype for function 'imx_scmi_dt_node_to_map' [-Wmissing-prototypes]
   int imx_scmi_dt_node_to_map(struct pinctrl_dev *pctldev, struct device_node *np,
       ^
   drivers/pinctrl/freescale/pinctrl-imx.c:83:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int imx_scmi_dt_node_to_map(struct pinctrl_dev *pctldev, struct device_node *np,
   ^
   static 
   1 warning generated.


vim +/imx_scmi_dt_node_to_map +83 drivers/pinctrl/freescale/pinctrl-imx.c

    81	
    82	#define IMX_SCMI_NUM_CFG 4
  > 83	int imx_scmi_dt_node_to_map(struct pinctrl_dev *pctldev, struct device_node *np,
    84				    struct pinctrl_map **map, unsigned int *num_maps)
    85	{
    86		struct pinctrl_map *new_map;
    87		const __be32 *list;
    88		unsigned long *configs = NULL;
    89		unsigned long cfg[IMX_SCMI_NUM_CFG];
    90		int map_num, size, pin_size, pin_id, num_pins;
    91		int mux_reg, conf_reg, input_reg, mux_val, conf_val, input_val;
    92		int i, j;
    93		uint32_t ncfg;
    94		static uint32_t daisy_off;
    95	
    96		if (!daisy_off) {
    97			if (of_machine_is_compatible("fsl,imx93"))
    98				daisy_off = 0x360;
    99			else if (of_machine_is_compatible("fsl,imx95"))
   100				daisy_off = 0x408;
   101			else
   102				dev_err(pctldev->dev, "platform not support scmi pinctrl\n");
   103		}
   104	
   105		list = of_get_property(np, "fsl,pins", &size);
   106		if (!list) {
   107			dev_err(pctldev->dev, "no fsl,pins property in node %pOF\n", np);
   108			return -EINVAL;
   109		}
   110	
   111		pin_size = FSL_PIN_SIZE;
   112	
   113		if (!size || size % pin_size) {
   114			dev_err(pctldev->dev, "Invalid fsl,pins or pins property in node %pOF\n", np);
   115			return -EINVAL;
   116		}
   117	
   118		num_pins = size / pin_size;
   119		map_num = num_pins;
   120	
   121		new_map = kmalloc_array(map_num, sizeof(struct pinctrl_map),
   122					GFP_KERNEL);
   123		if (!new_map)
   124			return -ENOMEM;
   125	
   126		*map = new_map;
   127		*num_maps = map_num;
   128	
   129		/* create config map */
   130		for (i = 0; i < num_pins; i++) {
   131			j = 0;
   132			ncfg = IMX_SCMI_NUM_CFG;
   133			mux_reg = be32_to_cpu(*list++);
   134			conf_reg = be32_to_cpu(*list++);
   135			input_reg = be32_to_cpu(*list++);
   136			mux_val = be32_to_cpu(*list++);
   137			input_val = be32_to_cpu(*list++);
   138			conf_val = be32_to_cpu(*list++);
   139			if (conf_val & IMX_PAD_SION)
   140				mux_val |= IOMUXC_CONFIG_SION;
   141	
   142			pin_id = mux_reg / 4;
   143	
   144			cfg[j++] = pinconf_to_config_packed(IMX_PIN_TYPE_MUX, mux_val);
   145	
   146			if (!conf_reg || (conf_val & IMX_NO_PAD_CTL))
   147				ncfg--;
   148			else
   149				cfg[j++] = pinconf_to_config_packed(IMX_PIN_TYPE_CONFIG, conf_val);
   150	
   151			if (!input_reg) {
   152				ncfg -= 2;
   153			} else {
   154				cfg[j++] = pinconf_to_config_packed(IMX_PIN_TYPE_DAISY_ID,
   155								    (input_reg - daisy_off) / 4);
   156				cfg[j++] = pinconf_to_config_packed(IMX_PIN_TYPE_DAISY_CFG, input_val);
   157			}
   158	
   159			configs = kmemdup(cfg, ncfg * sizeof(unsigned long), GFP_KERNEL);
   160	
   161			new_map[i].type = PIN_MAP_TYPE_CONFIGS_PIN;
   162			new_map[i].data.configs.group_or_pin = pin_get_name(pctldev, pin_id);
   163			new_map[i].data.configs.configs = configs;
   164			new_map[i].data.configs.num_configs = ncfg;
   165		}
   166	
   167		return 0;
   168	}
   169	EXPORT_SYMBOL_GPL(imx_scmi_dt_node_to_map);
   170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
