Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B90D33B96C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 23:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761866019; cv=none; b=bIjvixFKVDLQ2vAq0CqV65cIG0wSZa9gkBM41TatxJGkMGx1LAN/YTsth8OleqL7K76JqESpFZtiovi3GR/1/EwNBlfqEA1PIh4nrgVZXuj7Sn3FsiItzLwFyuYSDQFyHdUEWkCAcZc7RvDwSAONfIbktuAbzR9zGbNqOb3xOcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761866019; c=relaxed/simple;
	bh=e8KQYXWP8oyWIEZBL5fnE122BuOb1hJtXET+NzPdXq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RbU5eGr9l6AAQg+CRyub5ef8VX9L+9ANQHkV0dllND3A6fYwvG5VvyGHK7QQlww8A3Tb1jVv2rW5aWUvBEVSFq0jZtbtRxxtMnP0HBRwzLnRVdCwfqkN9UTwcY25KAiYtr5DqzAy6gR2+fS6r9JqtA2fA9ae0piLceV0BcubEBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLvPI2n/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLvPI2n/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761866018; x=1793402018;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e8KQYXWP8oyWIEZBL5fnE122BuOb1hJtXET+NzPdXq0=;
  b=FLvPI2n/P9Vz4Nuzkvah49C+Qtkyuksbn8FH6BK4Ocu6EfyjNXFWq/Hi
   ovIiP1GF8z+6bCI4qxouGitmmF3/Qn37mvAWcUgi0y9DoDR81/Rx2tUQI
   3g2qFOFJrAD8gY/p6w2hSKEi5ReossbDjMsOUHwevqL0QzSGDeJ8xrcvt
   kEA+zHP4RNq4FMOKiSfk+ys/oUHxhyJm0jl/XyuPREwbrpHBjWS7fTlLX
   j5K/zdvdyKGegyNmn7pqcLZIfzb2XXcQpFpkRWCFQtl0S/tGUS4tK9s4s
   ONEa4VuEZqQ23Bm7Bo6P/CYkgW4nSopvE1a0evAnvwhMc5emjj32VkhqY
   A==;
X-CSE-ConnectionGUID: FiPBfYo7QdOfxeMLyNytnw==
X-CSE-MsgGUID: l3/9KvIyTAGIGDp6S9IMkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67857346"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67857346"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 16:13:37 -0700
X-CSE-ConnectionGUID: 8asRz2VwTNy8DKADF97QKw==
X-CSE-MsgGUID: V/W3T8a6QIaozlDd7bsCmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="190431875"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 30 Oct 2025 16:13:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEbpj-000MbQ-1i;
	Thu, 30 Oct 2025 23:13:31 +0000
Date: Fri, 31 Oct 2025 07:11:21 +0800
From: kernel test robot <lkp@intel.com>
To: cy_huang@richtek.com, Sebastian Reichel <sre@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	ChiYuan Huang <cy_huang@richtek.com>, devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] power: supply: rt9756: Add Richtek RT9756 smart
 cap divider charger
Message-ID: <202510310620.GXuWxbZt-lkp@intel.com>
References: <5eab51e111b092329519dd2c200858a522780626.1761699952.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5eab51e111b092329519dd2c200858a522780626.1761699952.git.cy_huang@richtek.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sre-power-supply/for-next]
[also build test WARNING on krzk-dt/for-next robh/for-next linus/master v6.18-rc3 next-20251030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/cy_huang-richtek-com/dt-bindings-power-supply-Add-Richtek-RT9756-smart-cap-divider-charger/20251029-091554
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git for-next
patch link:    https://lore.kernel.org/r/5eab51e111b092329519dd2c200858a522780626.1761699952.git.cy_huang%40richtek.com
patch subject: [PATCH v3 2/3] power: supply: rt9756: Add Richtek RT9756 smart cap divider charger
config: alpha-randconfig-r122-20251031 (https://download.01.org/0day-ci/archive/20251031/202510310620.GXuWxbZt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510310620.GXuWxbZt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510310620.GXuWxbZt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/power/supply/rt9756.c:645:41: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] size @@     got restricted gfp_t @@
   drivers/power/supply/rt9756.c:645:41: sparse:     expected unsigned long [usertype] size
   drivers/power/supply/rt9756.c:645:41: sparse:     got restricted gfp_t
>> drivers/power/supply/rt9756.c:645:53: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned long @@
   drivers/power/supply/rt9756.c:645:53: sparse:     expected restricted gfp_t [usertype] gfp
   drivers/power/supply/rt9756.c:645:53: sparse:     got unsigned long

vim +645 drivers/power/supply/rt9756.c

   619	
   620	static int rt9756_register_psy(struct rt9756_data *data)
   621	{
   622		struct power_supply_desc *desc = &data->psy_desc;
   623		struct power_supply_desc *bat_desc = &data->bat_psy_desc;
   624		struct power_supply_config cfg = {}, bat_cfg = {};
   625		struct device *dev = data->dev;
   626		char *psy_name, *bat_psy_name, **supplied_to;
   627	
   628		bat_cfg.drv_data = data;
   629		bat_cfg.fwnode = dev_fwnode(dev);
   630	
   631		bat_psy_name = devm_kasprintf(dev, GFP_KERNEL, "rt9756-%s-battery", dev_name(dev));
   632		if (!bat_psy_name)
   633			return -ENOMEM;
   634	
   635		bat_desc->name = bat_psy_name;
   636		bat_desc->type = POWER_SUPPLY_TYPE_BATTERY;
   637		bat_desc->properties = rt9756_bat_psy_properties;
   638		bat_desc->num_properties = ARRAY_SIZE(rt9756_bat_psy_properties);
   639		bat_desc->get_property = rt9756_bat_psy_get_property;
   640	
   641		data->bat_psy = devm_power_supply_register(dev, bat_desc, &bat_cfg);
   642		if (IS_ERR(data->bat_psy))
   643			return dev_err_probe(dev, PTR_ERR(data->bat_psy), "Failed to register battery\n");
   644	
 > 645		supplied_to = devm_kzalloc(dev, GFP_KERNEL, sizeof(*supplied_to));
   646		if (!supplied_to)
   647			return -ENOMEM;
   648	
   649		/* Link charger psy to battery psy */
   650		supplied_to[0] = bat_psy_name;
   651	
   652		cfg.drv_data = data;
   653		cfg.fwnode = dev_fwnode(dev);
   654		cfg.attr_grp = rt9756_sysfs_groups;
   655		cfg.supplied_to = supplied_to;
   656		cfg.num_supplicants = 1;
   657	
   658		psy_name = devm_kasprintf(dev, GFP_KERNEL, "rt9756-%s", dev_name(dev));
   659		if (!psy_name)
   660			return -ENOMEM;
   661	
   662		desc->name = psy_name;
   663		desc->type = POWER_SUPPLY_TYPE_USB;
   664		desc->usb_types = BIT(POWER_SUPPLY_USB_TYPE_UNKNOWN) | BIT(POWER_SUPPLY_USB_TYPE_SDP) |
   665				  BIT(POWER_SUPPLY_USB_TYPE_DCP) | BIT(POWER_SUPPLY_USB_TYPE_CDP);
   666		desc->properties = rt9756_psy_properties;
   667		desc->num_properties = ARRAY_SIZE(rt9756_psy_properties);
   668		desc->property_is_writeable = rt9756_psy_property_is_writeable;
   669		desc->get_property = rt9756_psy_get_property;
   670		desc->set_property = rt9756_psy_set_property;
   671	
   672		data->psy = devm_power_supply_register(dev, desc, &cfg);
   673	
   674		return PTR_ERR_OR_ZERO(data->psy);
   675	}
   676	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
