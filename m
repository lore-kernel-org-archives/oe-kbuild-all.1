Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ED62BDC13
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 16:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764694425; cv=none; b=qUD5Dy3GTfYllu98023MYZUEun1pZT8DH7R4meiG7Zf5x3y1n0Ulrg1VdqJX5zMBA0e1z8+yuvQVRIyDa3zjVqUlzbG4Nc/PCQCsih5nWSykr8ElenI/z35LAfY0PbigfiAHiQhikctiNstLPu45AoNG6B/R2RBZ3LLE5kfqaqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764694425; c=relaxed/simple;
	bh=KR8SLmXxaR3IBGFGNG/MNbKNClcGA48y8P0HZlcilhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PeBZ6Z71f6J4VLgJdcqfM4ZzRGlga7nHkxaP/dmMk+vtbhei5xORZNw519vISdpWexPsbgUdLBylJ/XmZuf7Z+RVEiNhEJU+EchnfEXAS2MTj0sh/1EM/vy6P/adrZKX7DQJgGNgbkUWgzvOOyN6/QQOKHZiVq9x5ezPeoPkPG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGYJUvzB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGYJUvzB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764694424; x=1796230424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KR8SLmXxaR3IBGFGNG/MNbKNClcGA48y8P0HZlcilhY=;
  b=OGYJUvzBn92D/jzXEqY7bR2sy4UEhMmmAuaYn6dmt0xhT3mjntsxf8tK
   uWpbD6dC8Tf9DPZ2G51y67RgO/lRk5O8vuG+KRTP6uk478Ov5Qkuof6DR
   BWUiD0IhanmqpQD6BGSzq/Er9coMtW0MArqKXtxGxFJO/QmXeYY0nFc2K
   sax4KXjgogZwTRGmaogpuj8cGDa/go8bFInFm5FlX/FN8yyRzgUEXudvX
   ZWV0FecXo0ye6omMNigDN9zFV6ESmEJnsQmeIJ5H//7QbLNveK7wwMgji
   3/023snU9yuxB/8LjJZDc/DeiNg/ukq30zA5DNsPOV2saHkC6SYodIB1y
   Q==;
X-CSE-ConnectionGUID: 4nFwjZGTSV6In1tIm9c38Q==
X-CSE-MsgGUID: v9gFAYSQQ8mhL20cCwDxQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="92148712"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="92148712"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 08:53:41 -0800
X-CSE-ConnectionGUID: ft2qzoZMRZSlPqrU0WgtsQ==
X-CSE-MsgGUID: R8T4oQUyQi6AqUP7EAs6Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="194302310"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Dec 2025 08:53:40 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQTdC-00000000A1X-1VuN;
	Tue, 02 Dec 2025 16:53:38 +0000
Date: Wed, 3 Dec 2025 00:52:46 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl 24/26]
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c:675:5: warning: no previous
 prototype for 'aml_dt_node_to_map_pinmux'
Message-ID: <202512030037.0k2cP7Ie-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   3844b9420d3e0f27718cb9d54196e2bfa37344dd
commit: ab05ac0f88ba427bbeeba708c439ed07dea683fd [24/26] move dt_node_to_map_pinmux
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251203/202512030037.0k2cP7Ie-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030037.0k2cP7Ie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030037.0k2cP7Ie-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/meson/pinctrl-amlogic-a4.c:675:5: warning: no previous prototype for 'aml_dt_node_to_map_pinmux' [-Wmissing-prototypes]
     675 | int aml_dt_node_to_map_pinmux(struct pinctrl_dev *pctldev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c: In function 'aml_dt_node_to_map_pinmux':
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c:715:15: error: implicit declaration of function 'pinctrl_utils_reserve_map' [-Wimplicit-function-declaration]
     715 |         ret = pinctrl_utils_reserve_map(pctldev, map, &reserved_maps,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c:720:15: error: implicit declaration of function 'pinctrl_utils_add_map_mux' [-Wimplicit-function-declaration]
     720 |         ret = pinctrl_utils_add_map_mux(pctldev, map,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c:727:23: error: implicit declaration of function 'pinctrl_utils_add_map_configs' [-Wimplicit-function-declaration]
     727 |                 ret = pinctrl_utils_add_map_configs(pctldev, map, &reserved_maps,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c:737:17: error: implicit declaration of function 'pinctrl_utils_free_map'; did you mean 'pinctrl_gpio_free'? [-Wimplicit-function-declaration]
     737 |                 pinctrl_utils_free_map(pctldev, *map, *num_maps);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 pinctrl_gpio_free


vim +/aml_dt_node_to_map_pinmux +675 drivers/pinctrl/meson/pinctrl-amlogic-a4.c

   674	
 > 675	int aml_dt_node_to_map_pinmux(struct pinctrl_dev *pctldev,
   676				      struct device_node *np, struct pinctrl_map **map,
   677				      unsigned int *num_maps)
   678	{
   679		struct device *dev = pctldev->dev;
   680		struct device_node *pnode;
   681		unsigned long *configs = NULL;
   682		unsigned int num_configs = 0;
   683		struct property *prop;
   684		unsigned int reserved_maps;
   685		int reserve;
   686		int ret;
   687	
   688		prop = of_find_property(np, "pinmux", NULL);
   689		if (!prop) {
   690			dev_info(dev, "Missing pinmux property\n");
   691			return -ENOENT;
   692		}
   693	
   694		pnode = of_get_parent(np);
   695		if (!pnode) {
   696			dev_info(dev, "Missing function node\n");
   697			return -EINVAL;
   698		}
   699	
   700		reserved_maps = 0;
   701		*map = NULL;
   702		*num_maps = 0;
   703	
   704		ret = pinconf_generic_parse_dt_config(np, pctldev, &configs,
   705						      &num_configs);
   706		if (ret < 0) {
   707			dev_err(dev, "%pOF: could not parse node property\n", np);
   708			return ret;
   709		}
   710	
   711		reserve = 1;
   712		if (num_configs)
   713			reserve++;
   714	
   715		ret = pinctrl_utils_reserve_map(pctldev, map, &reserved_maps,
   716						num_maps, reserve);
   717		if (ret < 0)
   718			goto exit;
   719	
   720		ret = pinctrl_utils_add_map_mux(pctldev, map,
   721						&reserved_maps, num_maps, np->name,
   722						pnode->name);
   723		if (ret < 0)
   724			goto exit;
   725	
   726		if (num_configs) {
   727			ret = pinctrl_utils_add_map_configs(pctldev, map, &reserved_maps,
   728							    num_maps, np->name, configs,
   729							    num_configs, PIN_MAP_TYPE_CONFIGS_GROUP);
   730			if (ret < 0)
   731				goto exit;
   732		}
   733	
   734	exit:
   735		kfree(configs);
   736		if (ret)
   737			pinctrl_utils_free_map(pctldev, *map, *num_maps);
   738	
   739		return ret;
   740	}
   741	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
