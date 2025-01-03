Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6319187FE0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 10:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735901033; cv=none; b=sKwD4gZNfVoZd7twCnAmbTtnAUuE6XcV3bRZ9gQ8pkXe0chKXguw1I/4Vra4SlhzLKJ72gwOuJGDqU9RJ9BjsDV7C71YFpMRb7ZPUz0o85u8yv7dFrFvVCdGp3Oh3FkU5lJkG6LcOU6QNV/vlKPcfCfL1xpqoow0mUNEHT3su9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735901033; c=relaxed/simple;
	bh=dIU/Oza7WrU4/LzT+XHqCjufq1R7ssk0qmw9yW4N2sU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iqzDEHmtiG0m6aB32Yni8nfLoIX81Te4zr63lXDNYxobocfZZoq2GZ7zKXNBmYNuRJOg6sE1bkB11rMxI4GCJosX5AoQnz7FKKNauoE74wGHSSf931UI/EoO5W1EAcwKqZDwx38dh1sEB2rZ/X/6vz8KCaqOgvGedUJDEuAmmx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJVfK8GD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJVfK8GD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735901032; x=1767437032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dIU/Oza7WrU4/LzT+XHqCjufq1R7ssk0qmw9yW4N2sU=;
  b=VJVfK8GDwU65JXYM7HXwwcDfb5ma++47loVQ/XgFkRaxjLKqn+vI2PfO
   z0hpqZ7jRlC7zPYS4OhFDHG1ierlKgC8hI+KTNKRgqvhrBXtZyTJ0FCRm
   KX/K7xwhD3jKCEzn5SuZc/xp3nj/rm29V6M4MXiOVPPuCpP28hhfpLsXu
   oLTFCMy3WNtjf3bNuUCwRd+DVfLH7qiF5yRRPiazv+zIuB5D4DanLAcn2
   I3Kw6ftLCni+gNUoYkxuBzWyK3fZjWTuA2dab6fBFkHWtiGafkRyCZEBG
   AY2UyCuydCzcuh9HUI4d/uH3difXUV5nqeZxh7OlnmLtek8m/duK3QuX9
   w==;
X-CSE-ConnectionGUID: dC7tS+TBQHyllLV1sVnsxQ==
X-CSE-MsgGUID: s2yrm6rfQKKRls0qDk6FaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="46727695"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="46727695"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 02:43:51 -0800
X-CSE-ConnectionGUID: iiP/+vWhQeeVLjH4twQk5g==
X-CSE-MsgGUID: U/Mw6tqRTK2pfVsjqzmWbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102265313"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Jan 2025 02:43:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTf9f-0009bl-3B;
	Fri, 03 Jan 2025 10:43:47 +0000
Date: Fri, 3 Jan 2025 18:43:26 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linexp.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/thermal/max77620_thermal.c:48: warning: Function parameter
 or struct member 'tz' not described in 'max77620_thermal_read_temp'
Message-ID: <202501031856.Qo5Q6axp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: f59ac19b7f44cab23df84810e2da5f57bdd3a7e7 thermal/of: Remove old OF code
date:   2 years, 5 months ago
config: csky-randconfig-r022-20230522 (https://download.01.org/0day-ci/archive/20250103/202501031856.Qo5Q6axp-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031856.Qo5Q6axp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031856.Qo5Q6axp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thermal/max77620_thermal.c:48: warning: Function parameter or struct member 'tz' not described in 'max77620_thermal_read_temp'
>> drivers/thermal/max77620_thermal.c:48: warning: Excess function parameter 'data' description in 'max77620_thermal_read_temp'


vim +48 drivers/thermal/max77620_thermal.c

ec4664b3fd6d56 Laxman Dewangan 2016-08-23  32  
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  33  /**
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  34   * max77620_thermal_read_temp: Read PMIC die temperatue.
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  35   * @data:	Device specific data.
0f43e646dddd60 Amit Kucheria   2019-11-20  36   * @temp:	Temperature in millidegrees Celsius
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  37   *
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  38   * The actual temperature of PMIC die is not available from PMIC.
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  39   * PMIC only tells the status if it has crossed or not the threshold level
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  40   * of 120degC or 140degC.
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  41   * If threshold has not been crossed then assume die temperature as 100degC
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  42   * else 120degC or 140deG based on the PMIC die temp threshold status.
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  43   *
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  44   * Return 0 on success otherwise error number to show reason of failure.
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  45   */
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  46  
ae11d6a87c3e74 Daniel Lezcano  2022-08-05  47  static int max77620_thermal_read_temp(struct thermal_zone_device *tz, int *temp)
ec4664b3fd6d56 Laxman Dewangan 2016-08-23 @48  {
ae11d6a87c3e74 Daniel Lezcano  2022-08-05  49  	struct max77620_therm_info *mtherm = tz->devdata;
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  50  	unsigned int val;
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  51  	int ret;
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  52  
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  53  	ret = regmap_read(mtherm->rmap, MAX77620_REG_STATLBT, &val);
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  54  	if (ret < 0) {
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  55  		dev_err(mtherm->dev, "Failed to read STATLBT: %d\n", ret);
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  56  		return ret;
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  57  	}
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  58  
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  59  	if (val & MAX77620_IRQ_TJALRM2_MASK)
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  60  		*temp = MAX77620_TJALARM2_TEMP;
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  61  	else if (val & MAX77620_IRQ_TJALRM1_MASK)
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  62  		*temp = MAX77620_TJALARM1_TEMP;
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  63  	else
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  64  		*temp = MAX77620_NORMAL_OPERATING_TEMP;
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  65  
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  66  	return 0;
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  67  }
ec4664b3fd6d56 Laxman Dewangan 2016-08-23  68  

:::::: The code at line 48 was first introduced by commit
:::::: ec4664b3fd6d565a79eb562e4339528f74eb1cca thermal: max77620: Add thermal driver for reporting junction temp

:::::: TO: Laxman Dewangan <ldewangan@nvidia.com>
:::::: CC: Zhang Rui <rui.zhang@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
