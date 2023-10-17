Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348BA5380
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 16:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJu11hJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697560146; x=1729096146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fffv9JcX3HWOlgPXM1B5GKC1F9Z+fNY8JkgQux7Za6I=;
  b=iJu11hJbyfpxl7jRXLtwP+4wVePLMYbXMLDnDumuiMVseC3YIt2t1ydG
   wExTjzHn9me8WDIMO0lgfb9VZ8rCOjfMbDXdIiqscPj3qUOy/k4qyWKV4
   7+XP7Yf0DshtZOfGapVh/ciDs4E54yJNJ+5VEb4h1ULV0t5n78nFrqbJ3
   iM7UztHRxWwKzJnWeiUVcICk35Xa7aZk5go92a7Q0p3IBb6RBh4w76STZ
   wBfw1cf6/lb7N2bLzKvFxIoDLpO2qBj2b+CtcNF+TMlOmcI0yRijFM2XU
   YSgXbYLPdnTqwsXOPM8Hp4qUJBLqHHh+0KBCnOtNaaOCpr1USJaxQfFI/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="389691862"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="389691862"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 09:29:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="879867288"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="879867288"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Oct 2023 09:29:04 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsmwG-0009or-14;
	Tue, 17 Oct 2023 16:29:01 +0000
Date: Wed, 18 Oct 2023 00:28:18 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linexp.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/thermal/max77620_thermal.c:48: warning: Function parameter
 or member 'tz' not described in 'max77620_thermal_read_temp'
Message-ID: <202310180035.lUYXgBol-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   213f891525c222e8ed145ce1ce7ae1f47921cb9c
commit: f59ac19b7f44cab23df84810e2da5f57bdd3a7e7 thermal/of: Remove old OF code
date:   1 year, 2 months ago
config: x86_64-randconfig-r014-20230809 (https://download.01.org/0day-ci/archive/20231018/202310180035.lUYXgBol-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180035.lUYXgBol-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180035.lUYXgBol-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thermal/max77620_thermal.c:48: warning: Function parameter or member 'tz' not described in 'max77620_thermal_read_temp'
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
