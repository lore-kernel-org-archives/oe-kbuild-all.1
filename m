Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ABA5CB8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jul 2023 07:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689580128; x=1721116128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3/SYZW1rrFQF7naNI+lQ6ClPsM8NCbMdXXhvwV4puF8=;
  b=g7PYgNlbQmwOyqnkm+0OH13jUeP4xQ95AVTgUaNnMG9ElbMquLJdFK7Q
   xSHzGK3xagR2VNSYxNL+5A6ZsGAK3ypqsoetYYoe5tOtwYf6huzcFERrb
   kBWZzhSjPWONP4aZt6elQmQEmIOr2fgu6ZlFzdmAlCpoGVaU0VwkWBasn
   qVKn8Boj2Ntvcw0EKSPZd5pfLTY8CuZ9Opx32yG5f/WGVJyg7Ah6kMSh5
   6LHrH/AdsZDj+tTQHnRNXaubGONLeKUb3Sruv12MUwYr/Zzagi6rkdMqc
   NIWJ0OSWIUAVTnSZpGNHBzUlUFXKraMepdBUjtlq4LxchlLMP/Fq+i7SJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="365910932"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="365910932"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 00:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="793150244"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="793150244"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Jul 2023 00:48:46 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLIyL-0009F2-2r;
	Mon, 17 Jul 2023 07:48:45 +0000
Date: Mon, 17 Jul 2023 15:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: Okan Sahin <okan.sahin@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v2_20230711_okan_sahin_add_max77857_59_max77831_regulator_support
 7/8] drivers/regulator/max77857-regulator.c:209:5: warning: no previous
 prototype for 'max77859_get_voltage_sel'
Message-ID: <202307171513.CL8WXQWA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v2_20230711_okan_sahin_add_max77857_59_max77831_regulator_support
head:   482ee6c83912ccc70646ac42e2d55431adea884d
commit: 59cf42614bcf30985d9ad58b0053396983bc3d33 [7/8] regulator: max77857: Add ADI MAX77857/59/MAX77831 Regulator Support
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230717/202307171513.CL8WXQWA-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307171513.CL8WXQWA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307171513.CL8WXQWA-lkp@intel.com/

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
