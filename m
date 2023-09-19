Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C69333D5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 22:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695163250; x=1726699250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+xnLVIUpcpTP2Z1lP020OrDQJPoWj0qXoGR4h8mQBg0=;
  b=Lc26zG1Uc2Fv7nmFLTV7jbdUFtTjxBCDpoXzoHZawjCe+auqhKiE+3N3
   pJ7+Th1yJ7FJJVCbJsZp10I0P4/Sg9c72MCEiraptMyfMCxDKMFX99FoM
   3EhE3daU7Z7I336L+dlTWe+pp74rAcqYkU/sskrppZt0E/2OLnpASQC2C
   oNyD9uyeDATdcs6Xq++gWU4XQnVQHW2B9VVpcaw0o3UoTdPnJhd5QVcYn
   FXZ1CD1MMWvYF0G5HIlUDSiqzij7mnoURx938S9j1ntH3H8/D1HkVNCjp
   qpLIx2Pb4mOugi05P9713GSFrqke72CFNxQTPrO8XHCb9he2EOu5Yb/mw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="378958408"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="378958408"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 15:40:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="889666333"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="889666333"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Sep 2023 15:40:01 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qijOf-00080Q-1C;
	Tue, 19 Sep 2023 22:40:45 +0000
Date: Wed, 20 Sep 2023 06:38:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.5 25/166]
 drivers/regulator/max77857-regulator.c:209:5: warning: no previous prototype
 for 'max77859_get_voltage_sel'
Message-ID: <202309200638.YmaVRIAl-lkp@intel.com>
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
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230920/202309200638.YmaVRIAl-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200638.YmaVRIAl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200638.YmaVRIAl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/max77857-regulator.c:209:5: warning: no previous prototype for 'max77859_get_voltage_sel' [-Wmissing-prototypes]
     209 | int max77859_get_voltage_sel(struct regulator_dev *rdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/regulator/max77857-regulator.c:221:5: warning: no previous prototype for 'max77859_set_current_limit' [-Wmissing-prototypes]
     221 | int max77859_set_current_limit(struct regulator_dev *rdev, int min_uA, int max_uA)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/regulator/max77857-regulator.c:235:5: warning: no previous prototype for 'max77859_get_current_limit' [-Wmissing-prototypes]
     235 | int max77859_get_current_limit(struct regulator_dev *rdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/max77859_get_voltage_sel +209 drivers/regulator/max77857-regulator.c

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
