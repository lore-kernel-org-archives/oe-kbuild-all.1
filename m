Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399CC15B57F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 10:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727607510; cv=none; b=di/x4EXBuSTdQGzg964CeLWpy/BSmsd5q0bN6+ESMVbLW7n65fQ+N6d4JU+LC8Xn1CaBack4yNuaj9NwUseRUzAQgPSmJ7xkYytRUhLY7JnDWuwqbVKF+fQVZPKjoiPrI/FFVR0IzLpsgaVfgcUTMqFhRfamcLWteKLpJl9DwdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727607510; c=relaxed/simple;
	bh=zhRcND7c6rcAq43ltMpb3pE+87u8TP+L7UylLBx9IX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QDBRtF9c+8IOMVnif+A7mEUzPsHzBn1YKjnwPPKAlAMIPLsw+bVFMOAHkFHPedKlEHky+ZLRwI5yg4EJeyFhZn15WiXSLBfHF3m5aOMg5h+JsdPncPW4Wk2eS5kfdHNCIzFiGTVuCU6p7ulhnbYf/6XeIBvGplT3O79hTNo0YXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TVJHe27u; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TVJHe27u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727607508; x=1759143508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zhRcND7c6rcAq43ltMpb3pE+87u8TP+L7UylLBx9IX4=;
  b=TVJHe27uttxx6rx5R4VNWq/npETssBEubtYl451Eu9MEfeonroZR0JxH
   n3UAgTKG9Za0yUXKX9hd5qMYOHtZtuwD0LIgWr4sINdkQAfh9R3uX700u
   2cHrG6q9fO5S+b2ZK+HHpy3W7XoBdhWwsk/XX2nj+B7G/hYd6PNmVpFR7
   Zk/+wCG3I+YYBAxdT/3abP9xTIH1hMWmuhqKaMOituLotEw/ViZyRu0fo
   jb0JX02xILfyr0cOnY1771qn6Xl++o4z+zhOnynMTLqi1Ba1qvzOu+sKh
   WVYbOHUcLJN8D/aCenlrzak4ZOBT12sMrZ4x8S4Q0ZVvLvHaNrVVmK2q/
   g==;
X-CSE-ConnectionGUID: JhGwfu4YTmWrxbsOqIktAg==
X-CSE-MsgGUID: 5oRwib+cTJSR5LWLa2B6Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="38062415"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="38062415"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 03:58:26 -0700
X-CSE-ConnectionGUID: /BKbPNnOQFSH/v4Cr/ntSA==
X-CSE-MsgGUID: InRzS7YgSF6Z4u1WAYeYbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72581962"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 03:58:24 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1surd8-000ODZ-14;
	Sun, 29 Sep 2024 10:58:22 +0000
Date: Sun, 29 Sep 2024 18:57:39 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4960/16788]
 drivers/pinctrl/freescale/pinctrl-imx.c:83:5: warning: no previous prototype
 for 'imx_scmi_dt_node_to_map'
Message-ID: <202409291846.q8IDbqMu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peng,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 392ef0f507c7e245ba3a2f4e92caa82569818080 [4960/16788] LF-10523-16-2 pinctrl: imx: support i.MX9 SCMI
config: i386-buildonly-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240929/202409291846.q8IDbqMu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409291846.q8IDbqMu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291846.q8IDbqMu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/freescale/pinctrl-imx.c:83:5: warning: no previous prototype for 'imx_scmi_dt_node_to_map' [-Wmissing-prototypes]
      83 | int imx_scmi_dt_node_to_map(struct pinctrl_dev *pctldev, struct device_node *np,
         |     ^~~~~~~~~~~~~~~~~~~~~~~


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
