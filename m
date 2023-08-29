Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C58E20FA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 07:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693293523; x=1724829523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7QCBtoujZCqcsFgXUpVDsigLCq4m/I5FbjE8ptLnrvk=;
  b=HarTyISZgi+Ib15/FGfFzxbeRpEcufBeZ+ogsZQ0I+37ou3jeWc0Bse4
   1n/NQjXPK7CDRnslCxra/Oazd0MF6mxHhdbsW3KEhp8yfmndPmTMQpDHK
   dRQi4ZwCR/VMDJellJg9mmLNeOXfH5nb1KfjBeTWp59kOqbM1wqO6WKTy
   ByP1Dn/MjAE1yHxCYsgdgdjKLCJqx58MlFpA9hI7BaeyURZigngGXdv7I
   i83X1GI+oJPAPhyYbdYiPGZm5dC4b8MGnU7nx/PjtQ7z/Gsqbu7xzkQUl
   Nso6dMJc1F0vtNMNx0LukDExIfqCyHB1yh2aOjQvd0HVZappp6fOi4ACD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="461660810"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="461660810"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 00:18:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="803986958"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="803986958"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Aug 2023 00:18:41 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaszl-0008Wl-36;
	Tue, 29 Aug 2023 07:18:38 +0000
Date: Tue, 29 Aug 2023 15:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:spb1-hacking 6948/9113] drivers/hwmon/pmbus/mp2975.c:708:19:
 warning: cast to smaller integer type 'enum chips' from 'const void *'
Message-ID: <202308291543.GxiqUd4i-lkp@intel.com>
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
commit: 0cd06c66566c3f0d44546de7fdf82de42dca2c6c [6948/9113] hwmon: (pmbus/mp2975) Prepare for MP2973 and MP2971
config: x86_64-randconfig-073-20230829 (https://download.01.org/0day-ci/archive/20230829/202308291543.GxiqUd4i-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291543.GxiqUd4i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291543.GxiqUd4i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/pmbus/mp2975.c:708:19: warning: cast to smaller integer type 'enum chips' from 'const void *' [-Wvoid-pointer-to-enum-cast]
                   data->chip_id = (enum chips)of_device_get_match_data(&client->dev);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +708 drivers/hwmon/pmbus/mp2975.c

   695	
   696	static int mp2975_probe(struct i2c_client *client)
   697	{
   698		struct pmbus_driver_info *info;
   699		struct mp2975_data *data;
   700		int ret;
   701	
   702		data = devm_kzalloc(&client->dev, sizeof(struct mp2975_data),
   703				    GFP_KERNEL);
   704		if (!data)
   705			return -ENOMEM;
   706	
   707		if (client->dev.of_node)
 > 708			data->chip_id = (enum chips)of_device_get_match_data(&client->dev);
   709		else
   710			data->chip_id = i2c_match_id(mp2975_id, client)->driver_data;
   711	
   712		memcpy(&data->info, &mp2975_info, sizeof(*info));
   713		info = &data->info;
   714	
   715		/* Identify multiphase configuration for rail 2. */
   716		ret = mp2975_identify_multiphase_rail2(client);
   717		if (ret < 0)
   718			return ret;
   719	
   720		if (ret) {
   721			/* Two rails are connected. */
   722			data->info.pages = MP2975_PAGE_NUM;
   723			data->info.phases[1] = ret;
   724			data->info.func[1] = MP2975_RAIL2_FUNC;
   725		}
   726	
   727		/* Identify multiphase configuration. */
   728		ret = mp2975_identify_multiphase(client, data, info);
   729		if (ret)
   730			return ret;
   731	
   732		/* Identify VID setting per rail. */
   733		ret = mp2975_identify_rails_vid(client, data, info);
   734		if (ret < 0)
   735			return ret;
   736	
   737		/* Obtain current sense gain of power stage. */
   738		ret = mp2975_current_sense_gain_get(client, data);
   739		if (ret)
   740			return ret;
   741	
   742		/* Obtain voltage reference values. */
   743		ret = mp2975_vref_get(client, data, info);
   744		if (ret)
   745			return ret;
   746	
   747		/* Obtain vout over-voltage scales. */
   748		ret = mp2975_vout_ov_scale_get(client, data, info);
   749		if (ret < 0)
   750			return ret;
   751	
   752		/* Obtain offsets, maximum and format for vout. */
   753		ret = mp2975_vout_per_rail_config_get(client, data, info);
   754		if (ret)
   755			return ret;
   756	
   757		return pmbus_do_probe(client, info);
   758	}
   759	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
