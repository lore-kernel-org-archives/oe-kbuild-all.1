Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1700715250F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 12:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714737934; cv=none; b=EQfW3r/UxySVVg9oBcQvjUa6RIA60ipgkMAXMJ6vGY/Z5fa5/LvnG7EMc9stRW2e7aOus1OPkbWejRQsfRi0I0hGkvuGQ0S5sOEWKmcEzYJixMrLIrd4fncAfmBIhOAl7HIEZvMAcR06TzeU4uNRNJI573cyw0Uc0qYZFLxLB60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714737934; c=relaxed/simple;
	bh=YC6dUsIzScI2ArnGFQ+ImsH4WujoKX49JeRqm1T1vkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nLS//qrSs1cQjs1HmAL/Ofrtz7kokS8XljV+VcXxQcwG7hQ57vWePzicFyA1K1xZOTNb0Yy1AXb8ExsbYEN1yDfS4o3KvbJ67gs5RTrRFa1dhjgbuUhW9cl1T3D0x3/PRV+aEswfdysqGOMIZ4RHlsq1d7kRJWFK5/LAAe68bdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f5ZZCgqp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f5ZZCgqp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714737933; x=1746273933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YC6dUsIzScI2ArnGFQ+ImsH4WujoKX49JeRqm1T1vkw=;
  b=f5ZZCgqp7lAVkauY94br/CB9TZ8L/vGAJ4gcTu8kMWoIGqg7O8ig4l9A
   3Ah0iY1qjsWunBD1IjUQBRQe2sfwaMzommF79RV4PjuQi0aLEbOL/+M5T
   J/HfLqKuV89Zx+QU95xuD0c6ox0DTTFbrh3mZlJHgMU8O30oNVrHXCmIJ
   JJQKjau3N69C/QjlSaV6ZBngZDr1YekWYfgz0f2jqs3/+euwx+D+1tUP6
   +Y2mhFtY3t11ginDuHSd8tdEGtHm8JWu6zXdHP0nr+X+YtX8LhoFDqPHo
   ij8ahH5VwQxr+lBeNqcT+POLJOIkD3E5Xwh0m59DDAMqPOHh7+bGRFVOG
   Q==;
X-CSE-ConnectionGUID: q5vCCmbRQ8OtSgEe1LHfNQ==
X-CSE-MsgGUID: 67A5b61nTMGK6y2xyJJRHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="13493277"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="13493277"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 05:05:32 -0700
X-CSE-ConnectionGUID: mmHOj7CXS4CV2am7LsD5uQ==
X-CSE-MsgGUID: Nxq0rR7PQ8eZyIS8XIlj7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="32250582"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 May 2024 05:05:30 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2rfM-000BfC-0B;
	Fri, 03 May 2024 12:05:28 +0000
Date: Fri, 3 May 2024 20:04:40 +0800
From: kernel test robot <lkp@intel.com>
To: Alina Yu <alina_yu@richtek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 9961/10967]
 drivers/regulator/rtq2208-regulator.c:223:35: warning:
 'rtq2208_regulator_ldo_ops' defined but not used
Message-ID: <202405032019.mzGkGCsh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9221b2819b8a4196eecf5476d66201be60fbcf29
commit: 38bcec0e7cbbd6566c12ae4f2b7a48bd50cd215c [9961/10967] regulator: rtq2208: Fix LDO discharge register and add vsel setting
config: i386-buildonly-randconfig-003-20240503 (https://download.01.org/0day-ci/archive/20240503/202405032019.mzGkGCsh-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405032019.mzGkGCsh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405032019.mzGkGCsh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/rtq2208-regulator.c:223:35: warning: 'rtq2208_regulator_ldo_ops' defined but not used [-Wunused-const-variable=]
     223 | static const struct regulator_ops rtq2208_regulator_ldo_ops = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/rtq2208_regulator_ldo_ops +223 drivers/regulator/rtq2208-regulator.c

85a11f55621a0c Alina Yu 2023-08-07  222  
85a11f55621a0c Alina Yu 2023-08-07 @223  static const struct regulator_ops rtq2208_regulator_ldo_ops = {
85a11f55621a0c Alina Yu 2023-08-07  224  	.enable = regulator_enable_regmap,
85a11f55621a0c Alina Yu 2023-08-07  225  	.disable = regulator_disable_regmap,
85a11f55621a0c Alina Yu 2023-08-07  226  	.is_enabled = regulator_is_enabled_regmap,
85a11f55621a0c Alina Yu 2023-08-07  227  	.set_active_discharge = regulator_set_active_discharge_regmap,
85a11f55621a0c Alina Yu 2023-08-07  228  	.set_suspend_enable = rtq2208_set_suspend_enable,
85a11f55621a0c Alina Yu 2023-08-07  229  	.set_suspend_disable = rtq2208_set_suspend_disable,
85a11f55621a0c Alina Yu 2023-08-07  230  };
85a11f55621a0c Alina Yu 2023-08-07  231  

:::::: The code at line 223 was first introduced by commit
:::::: 85a11f55621a0c18b22b43ab4219450ac1d19386 regulator: rtq2208: Add Richtek RTQ2208 SubPMIC driver

:::::: TO: Alina Yu <alina_yu@richtek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
