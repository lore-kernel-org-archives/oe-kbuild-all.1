Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6AD145350
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 May 2024 14:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715696632; cv=none; b=fsE+xKcRyki/oXyV9+n2NwLp0Z2Ob5Hvvbdlw4FiuW/M8GvKa0gAKtDiEhQUsGsndLNGqL+fD0qAmcBPUmG3m5h8yHkQ+AMWdbAD9Gf7Kj6Ci65zv2LUm5h4m3NbiwKU9ht4i9HtuClkBtEsYtQaZxqBRISVhZxmKN8RGpB0ft4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715696632; c=relaxed/simple;
	bh=oBXcOW7KeOZBiK6tHMtXvTl/BB7AuvNpsTEXHv/fbJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t90Ej49gIwQXNe1lUo9jCw3jMVOrbPvsauDTLZVJ3ur8McxZO+l5Q6S0zAuwfyFSR5jhbkz7fQEkxsnUu7d33ym51Lf7gtVkZR06zIRKcUqz0E4DpGSMhQIFd2IcqBsDD40yU6pWqprHRmb6OupzBZsK4OBStzbjOQhp+UEXLL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i0PeG9u6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i0PeG9u6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715696631; x=1747232631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oBXcOW7KeOZBiK6tHMtXvTl/BB7AuvNpsTEXHv/fbJE=;
  b=i0PeG9u6OKbHNcNaFyFif+mwUEa/ysJGYtzpOP/DwkUnnVME3847J2tH
   rwrHgOnUSAqIgLUB8MNe9+tQuvskF5c9QKM9PSE7URJrAHnGQ5fuTHh+m
   qCfZ0mE8yt1BjWvqoKXhos2BAMPQGf3jFShXOXohIJ3bVrPuw18oFDncC
   6JVJeg+IZYOQuSCunPthYPdQ9wJI5kUPGEhy77BbY7hdDma2DhsnKZ4fG
   +Fk7MPT8XzCO0gGyu4/cpidOJ5jWrYCcNLJUTgvBHoHJmQSx7CRMqo30E
   /gT9+Uz0fLbQ+gT8S7OLiiEg0H+96PNNvvuYTqJyQ/68+hyRSqdONaav+
   Q==;
X-CSE-ConnectionGUID: 2eMgUw8qT/2q9T3APHU21g==
X-CSE-MsgGUID: EYqKsOLcTlG7rHTXL49kCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="34196764"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="34196764"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 07:23:50 -0700
X-CSE-ConnectionGUID: 4fNLjXEsRqOxQ7xse5f/vg==
X-CSE-MsgGUID: 888ezxt+QoKOTIy6JKzFYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="35460115"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 May 2024 07:23:49 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6t4E-000BWd-2L;
	Tue, 14 May 2024 14:23:46 +0000
Date: Tue, 14 May 2024 22:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] power: supply: sbs-manager: Remove class argument from
 i2c_mux_add_adapter()
Message-ID: <202405142135.RneBfIx8-lkp@intel.com>
References: <20240513201400.16589-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240513201400.16589-2-wsa+renesas@sang-engineering.com>

Hi Wolfram,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.9]
[also build test ERROR on linus/master]
[cannot apply to next-20240514]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wolfram-Sang/power-supply-sbs-manager-Remove-class-argument-from-i2c_mux_add_adapter/20240514-041536
base:   v6.9
patch link:    https://lore.kernel.org/r/20240513201400.16589-2-wsa%2Brenesas%40sang-engineering.com
patch subject: [PATCH] power: supply: sbs-manager: Remove class argument from i2c_mux_add_adapter()
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240514/202405142135.RneBfIx8-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405142135.RneBfIx8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405142135.RneBfIx8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/power/supply/sbs-manager.c: In function 'sbsm_probe':
>> drivers/power/supply/sbs-manager.c:361:31: error: too few arguments to function 'i2c_mux_add_adapter'
     361 |                         ret = i2c_mux_add_adapter(data->muxc, 0, i + 1);
         |                               ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/power/supply/sbs-manager.c:19:
   include/linux/i2c-mux.h:58:5: note: declared here
      58 | int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
         |     ^~~~~~~~~~~~~~~~~~~


vim +/i2c_mux_add_adapter +361 drivers/power/supply/sbs-manager.c

   317	
   318	static int sbsm_probe(struct i2c_client *client)
   319	{
   320		const struct i2c_device_id *id = i2c_client_get_device_id(client);
   321		struct i2c_adapter *adapter = client->adapter;
   322		struct sbsm_data *data;
   323		struct device *dev = &client->dev;
   324		struct power_supply_desc *psy_desc;
   325		struct power_supply_config psy_cfg = {};
   326		int ret = 0, i;
   327	
   328		/* Device listens only at address 0x0a */
   329		if (client->addr != 0x0a)
   330			return -EINVAL;
   331	
   332		if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA))
   333			return -EPFNOSUPPORT;
   334	
   335		data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
   336		if (!data)
   337			return -ENOMEM;
   338	
   339		i2c_set_clientdata(client, data);
   340	
   341		data->client = client;
   342		data->is_ltc1760 = !!strstr(id->name, "ltc1760");
   343	
   344		ret  = sbsm_read_word(client, SBSM_CMD_BATSYSINFO);
   345		if (ret < 0)
   346			return ret;
   347		data->supported_bats = ret & SBSM_MASK_BAT_SUPPORTED;
   348		data->muxc = i2c_mux_alloc(adapter, dev, SBSM_MAX_BATS, 0,
   349					   I2C_MUX_LOCKED, &sbsm_select, NULL);
   350		if (!data->muxc)
   351			return dev_err_probe(dev, -ENOMEM, "failed to alloc i2c mux\n");
   352		data->muxc->priv = data;
   353	
   354		ret = devm_add_action_or_reset(dev, sbsm_del_mux_adapter, data);
   355		if (ret)
   356			return ret;
   357	
   358		/* register muxed i2c channels. One for each supported battery */
   359		for (i = 0; i < SBSM_MAX_BATS; ++i) {
   360			if (data->supported_bats & BIT(i)) {
 > 361				ret = i2c_mux_add_adapter(data->muxc, 0, i + 1);
   362				if (ret)
   363					break;
   364			}
   365		}
   366		if (ret)
   367			return dev_err_probe(dev, ret, "failed to register i2c mux channel %d\n", i + 1);
   368	
   369		psy_desc = devm_kmemdup(dev, &sbsm_default_psy_desc, sizeof(*psy_desc), GFP_KERNEL);
   370		if (!psy_desc)
   371			return -ENOMEM;
   372	
   373		psy_desc->name = devm_kasprintf(dev, GFP_KERNEL, "sbsm-%s", dev_name(&client->dev));
   374		if (!psy_desc->name)
   375			return -ENOMEM;
   376	
   377		ret = sbsm_gpio_setup(data);
   378		if (ret < 0)
   379			return ret;
   380	
   381		psy_cfg.drv_data = data;
   382		psy_cfg.of_node = dev->of_node;
   383		data->psy = devm_power_supply_register(dev, psy_desc, &psy_cfg);
   384		if (IS_ERR(data->psy))
   385			return dev_err_probe(dev, PTR_ERR(data->psy),
   386					     "failed to register power supply %s\n", psy_desc->name);
   387	
   388		return 0;
   389	}
   390	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
