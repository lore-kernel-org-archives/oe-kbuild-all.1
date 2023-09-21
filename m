Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E7F3D90
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 07:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695280034; x=1726816034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OodasPE9Fh/OSzYunDNZjGv9L14p+A7qgaon01aNnUc=;
  b=HzuK0usGI0k4QnfMsnYaWGTiEpl/32ssWRT+kce883mnbC/thCVlIQtj
   JtKxVyDlH4IR33TGrlMJsNK/4b2pLtWDd5aIU34U3QGwI/PJrXU1jfpZ5
   BiflHIhZTAlLTF8JXtArJQWqU7Qw1b7/sQzyS8ebXJOLMaGDyLwtpLOjT
   FuAKn4r+flPfmGZqDXCHZVxFAd4YsJIqMPKR6voOjwcpg2vfIkNe6Xy5g
   Wnw9izNXewMeOXUPDEs0Ef1/ZCg5BHpep3Jj4FElQaxWSf1GuVH7EZeuO
   M+lGUnJWY5j8yDJ/3TBFlNej3MmlrFt7jabDJTtjpZgSYdtdI1cZHf6et
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="383182656"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="383182656"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 00:07:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="776299989"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="776299989"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 21 Sep 2023 00:07:10 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjDmG-0009gG-2M;
	Thu, 21 Sep 2023 07:07:08 +0000
Date: Thu, 21 Sep 2023 15:06:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.5 25/166]
 drivers/regulator/max77857-regulator.c:312:16: error: initializer element is
 not constant
Message-ID: <202309211431.NpjhNCPC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.5
head:   fd1a1970676435366dd0f58cb455292d92d7ecce
commit: bfce6add9cad1ff9ce759219a58b7ea892fb9535 [25/166] regulator: max77857: Add ADI MAX77857/59/MAX77831 Regulator Support
config: i386-randconfig-006-20230921 (https://download.01.org/0day-ci/archive/20230921/202309211431.NpjhNCPC-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309211431.NpjhNCPC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309211431.NpjhNCPC-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/regulator/max77857-regulator.c:209:5: warning: no previous declaration for 'max77859_get_voltage_sel' [-Wmissing-declarations]
    int max77859_get_voltage_sel(struct regulator_dev *rdev)
        ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/regulator/max77857-regulator.c:221:5: warning: no previous declaration for 'max77859_set_current_limit' [-Wmissing-declarations]
    int max77859_set_current_limit(struct regulator_dev *rdev, int min_uA, int max_uA)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/regulator/max77857-regulator.c:235:5: warning: no previous declaration for 'max77859_get_current_limit' [-Wmissing-declarations]
    int max77859_get_current_limit(struct regulator_dev *rdev)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/regulator/max77857-regulator.c:312:16: error: initializer element is not constant
     .ramp_delay = max77857_ramp_table[0][0],
                   ^~~~~~~~~~~~~~~~~~~
   drivers/regulator/max77857-regulator.c:312:16: note: (near initialization for 'max77857_regulator_desc.ramp_delay')


vim +312 drivers/regulator/max77857-regulator.c

   208	
 > 209	int max77859_get_voltage_sel(struct regulator_dev *rdev)
   210	{
   211		__be16 reg;
   212		int ret;
   213	
   214		ret = regmap_bulk_read(rdev->regmap, MAX77859_REG_CONT3, &reg, 2);
   215		if (ret)
   216			return ret;
   217	
   218		return FIELD_GET(MAX77859_VOLTAGE_SEL_MASK, __be16_to_cpu(reg));
   219	}
   220	
 > 221	int max77859_set_current_limit(struct regulator_dev *rdev, int min_uA, int max_uA)
   222	{
   223		u32 selector;
   224	
   225		if (max_uA < MAX77859_CURRENT_MIN)
   226			return -EINVAL;
   227	
   228		selector = 0x12 + (max_uA - MAX77859_CURRENT_MIN) / MAX77859_CURRENT_STEP;
   229	
   230		selector = clamp_val(selector, 0x00, 0x7F);
   231	
   232		return regmap_write(rdev->regmap, MAX77859_REG_CONT5, selector);
   233	}
   234	
 > 235	int max77859_get_current_limit(struct regulator_dev *rdev)
   236	{
   237		u32 selector;
   238		int ret;
   239	
   240		ret = regmap_read(rdev->regmap, MAX77859_REG_CONT5, &selector);
   241		if (ret)
   242			return ret;
   243	
   244		if (selector <= 0x12)
   245			return MAX77859_CURRENT_MIN;
   246	
   247		if (selector >= 0x64)
   248			return MAX77859_CURRENT_MAX;
   249	
   250		return MAX77859_CURRENT_MIN + (selector - 0x12) * MAX77859_CURRENT_STEP;
   251	}
   252	
   253	static const struct regulator_ops max77859_regulator_ops = {
   254		.list_voltage = regulator_list_voltage_linear_range,
   255		.set_voltage_sel = max77859_set_voltage_sel,
   256		.get_voltage_sel = max77859_get_voltage_sel,
   257		.set_ramp_delay = regulator_set_ramp_delay_regmap,
   258		.get_status = max77857_get_status,
   259		.set_mode = max77857_set_mode,
   260		.get_mode = max77857_get_mode,
   261		.get_error_flags = max77857_get_error_flags,
   262	};
   263	
   264	static const struct regulator_ops max77859a_regulator_ops = {
   265		.list_voltage = regulator_list_voltage_linear_range,
   266		.set_voltage_sel = max77859_set_voltage_sel,
   267		.get_voltage_sel = max77859_get_voltage_sel,
   268		.set_current_limit = max77859_set_current_limit,
   269		.get_current_limit = max77859_get_current_limit,
   270		.set_ramp_delay = regulator_set_ramp_delay_regmap,
   271		.get_status = max77857_get_status,
   272		.set_mode = max77857_set_mode,
   273		.get_mode = max77857_get_mode,
   274		.get_error_flags = max77857_get_error_flags,
   275	};
   276	
   277	static const struct regulator_ops max77857_regulator_ops = {
   278		.list_voltage = regulator_list_voltage_linear_range,
   279		.set_voltage_sel = regulator_set_voltage_sel_regmap,
   280		.get_voltage_sel = regulator_get_voltage_sel_regmap,
   281		.set_ramp_delay = regulator_set_ramp_delay_regmap,
   282		.get_status = max77857_get_status,
   283		.set_mode = max77857_set_mode,
   284		.get_mode = max77857_get_mode,
   285		.get_error_flags = max77857_get_error_flags,
   286	};
   287	
   288	static struct linear_range max77857_lin_ranges[] = {
   289		REGULATOR_LINEAR_RANGE(4485000, 0x3D, 0xCC, 73500)
   290	};
   291	
   292	static const unsigned int max77857_switch_freq[] = {
   293		1200000, 1500000, 1800000, 2100000
   294	};
   295	
   296	static const unsigned int max77857_ramp_table[2][4] = {
   297		{ 1333, 667, 333, 227 }, /* when switch freq is 1.8MHz or 2.1MHz */
   298		{ 1166, 667, 333, 167 }, /* when switch freq is 1.2MHz or 1.5MHz */
   299	};
   300	
   301	static struct regulator_desc max77857_regulator_desc = {
   302		.ops = &max77857_regulator_ops,
   303		.name = "max77857",
   304		.linear_ranges = max77857_lin_ranges,
   305		.n_linear_ranges = ARRAY_SIZE(max77857_lin_ranges),
   306		.vsel_mask = 0xFF,
   307		.vsel_reg = MAX77857_REG_CONT2,
   308		.ramp_delay_table = max77857_ramp_table[0],
   309		.n_ramp_values = ARRAY_SIZE(max77857_ramp_table[0]),
   310		.ramp_reg = MAX77857_REG_CONT3,
   311		.ramp_mask = GENMASK(1, 0),
 > 312		.ramp_delay = max77857_ramp_table[0][0],
   313		.owner = THIS_MODULE,
   314	};
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
