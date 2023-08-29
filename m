Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81953368
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 00:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693268308; x=1724804308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A3aaegrWb8WD2TOj3EDohKaxU/yyhU1DPruisaUv2VM=;
  b=hDCMZkTQMGYaHmXWRIpavbhhCZhYkTKCOuj0GUb+xbi0OxS/VxvYmyn6
   FweUSVpwaNwE/V5n06qc4vQIAanrBIrk9vpdogMl7nv3/QhVlAhXfGIsA
   YNVgTtrFQt+QreCOSLMKIw8gjZxW3eX6c5zaoTebguyuWCkgPLeniKz6o
   jkYIyHEtrpINRaL/W6XULs8qJ4UKCm2YSu7cSAs6J/cnWrS6pPKaqyJlM
   ToI7BwX5xWC04dHVtsvCDO9CMWDt8kyT7ff69j/h+YbO6k3020WG2v29c
   WaHXExAWEKMY01itAgkJsZ5bBWam6A6JPUvk4wANqrbA6aq2zXPpGZ2lb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="379012060"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="379012060"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 17:18:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="715326969"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="715326969"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 28 Aug 2023 17:18:26 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qamR7-0008Dv-30;
	Tue, 29 Aug 2023 00:18:25 +0000
Date: Tue, 29 Aug 2023 08:18:25 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:spb1-hacking 6952/9113] drivers/hwmon/pmbus/mp2975.c:878:21:
 error: 'CONFIG_SENSORS_MP2975_REGULATOR' undeclared; did you mean
 'CONFIG_SENSORS_LTC2978_REGULATOR'?
Message-ID: <202308290830.8COUWWcf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux spb1-hacking
head:   b3de99e1aeeeae3e96ffc4c34afae3d2ef4c8175
commit: 8301c92a0180503b1eabf8921845160d118c326a [6952/9113] hwmon: (pmbus/mp2975) Add regulator support
config: microblaze-randconfig-r013-20230829 (https://download.01.org/0day-ci/archive/20230829/202308290830.8COUWWcf-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308290830.8COUWWcf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308290830.8COUWWcf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/pmbus/mp2975.c: In function 'mp2975_probe':
>> drivers/hwmon/pmbus/mp2975.c:878:21: error: 'CONFIG_SENSORS_MP2975_REGULATOR' undeclared (first use in this function); did you mean 'CONFIG_SENSORS_LTC2978_REGULATOR'?
     878 |                 if (CONFIG_SENSORS_MP2975_REGULATOR)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                     CONFIG_SENSORS_LTC2978_REGULATOR
   drivers/hwmon/pmbus/mp2975.c:878:21: note: each undeclared identifier is reported only once for each function it appears in


vim +878 drivers/hwmon/pmbus/mp2975.c

   841	
   842	static int mp2975_probe(struct i2c_client *client)
   843	{
   844		struct pmbus_driver_info *info;
   845		struct mp2975_data *data;
   846		int ret;
   847	
   848		data = devm_kzalloc(&client->dev, sizeof(struct mp2975_data),
   849				    GFP_KERNEL);
   850		if (!data)
   851			return -ENOMEM;
   852	
   853		if (client->dev.of_node)
   854			data->chip_id = (enum chips)of_device_get_match_data(&client->dev);
   855		else
   856			data->chip_id = i2c_match_id(mp2975_id, client)->driver_data;
   857	
   858		memcpy(data->max_phases, mp2975_max_phases[data->chip_id],
   859		       sizeof(data->max_phases));
   860	
   861		if (data->chip_id == mp2975)
   862			memcpy(&data->info, &mp2975_info, sizeof(*info));
   863		else
   864			memcpy(&data->info, &mp2973_info, sizeof(*info));
   865	
   866		info = &data->info;
   867	
   868		/* Identify multiphase configuration for rail 2. */
   869		ret = mp2975_identify_multiphase_rail2(client, data);
   870		if (ret < 0)
   871			return ret;
   872	
   873		if (ret) {
   874			/* Two rails are connected. */
   875			data->info.pages = MP2975_PAGE_NUM;
   876			data->info.phases[1] = ret;
   877			data->info.func[1] = MP2975_RAIL2_FUNC;
 > 878			if (CONFIG_SENSORS_MP2975_REGULATOR)
   879				data->info.num_regulators = MP2975_PAGE_NUM;
   880		}
   881	
   882		if (data->chip_id == mp2975) {
   883			/* Identify multiphase configuration. */
   884			ret = mp2975_identify_multiphase(client, data, info);
   885			if (ret)
   886				return ret;
   887	
   888			/* Identify VID setting per rail. */
   889			ret = mp2975_identify_rails_vid(client, data, info);
   890			if (ret < 0)
   891				return ret;
   892	
   893			/* Obtain current sense gain of power stage. */
   894			ret = mp2975_current_sense_gain_get(client, data);
   895			if (ret)
   896				return ret;
   897	
   898			/* Obtain voltage reference values. */
   899			ret = mp2975_vref_get(client, data, info);
   900			if (ret)
   901				return ret;
   902	
   903			/* Obtain vout over-voltage scales. */
   904			ret = mp2975_vout_ov_scale_get(client, data, info);
   905			if (ret < 0)
   906				return ret;
   907		} else {
   908			/* Identify VID setting per rail. */
   909			ret = mp2973_identify_rails_vid(client, data, info);
   910			if (ret < 0)
   911				return ret;
   912		}
   913	
   914		/* Obtain offsets, maximum and format for vout. */
   915		ret = mp2975_vout_per_rail_config_get(client, data, info);
   916		if (ret)
   917			return ret;
   918	
   919		return pmbus_do_probe(client, info);
   920	}
   921	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
