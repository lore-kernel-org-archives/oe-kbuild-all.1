Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA63F847B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 15:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SR00WPg/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702222537; x=1733758537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gFbx6xzUXM1eZfjbY7RukjNbO2y8jdVKx5iTIVT56/s=;
  b=SR00WPg/hoLMGVnALgqxIOrZ21oNB7w5868QMWqDWVzTp+th6c0uNXuH
   k2xlhkX+Fy+ccfVYooU/de7BJlhoCbc5IEWCqgiK3UWzsIAxhb7adNBTg
   IjSDlP8lQ97zzwlA9U6UKv7BeUyjmXcOXzRAyE+44asSLeQa5ZvdNkVDF
   9MSgaGkz5ilF/DF0dr57Z+F46lmLc3atvgOj8l1W5zTUAXE6cD42OlcDS
   I07XqG3Bf+JBW2PRflFr2+y2GrWZ0Jec1bsiQ9ItVj/t9UmGvsxr875u7
   MQ5szfn1nn3j4QKGcpuq7JsJJO6rtI1RBEkt7ELMLLb3ZLZiHGy2Du5TI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="374718860"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="374718860"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 07:35:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="748956943"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="748956943"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 10 Dec 2023 07:35:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCLq8-000Gym-1X;
	Sun, 10 Dec 2023 15:35:32 +0000
Date: Sun, 10 Dec 2023 23:35:24 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Pargmann <mpa@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: drivers/iio/gyro/bmg160_i2c.c:41:36: warning: 'bmg160_acpi_match'
 defined but not used
Message-ID: <202312102310.LXEzAWcy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c527f5606aa545233a4d2c6d5c636ed82b8633ef
commit: 13426454b6493a847cebe276fb1ec3a7f1d48d0e iio: bmg160: Separate i2c and core driver
date:   8 years ago
config: m68k-randconfig-c031-20230421 (https://download.01.org/0day-ci/archive/20231210/202312102310.LXEzAWcy-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312102310.LXEzAWcy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312102310.LXEzAWcy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:11,
                    from include/linux/list.h:8,
                    from include/linux/kobject.h:20,
                    from include/linux/device.h:17,
                    from include/linux/i2c.h:30,
                    from drivers/iio/gyro/bmg160_i2c.c:1:
   include/linux/log2.h:22:1: warning: ignoring attribute 'noreturn' because it conflicts with attribute 'const' [-Wattributes]
      22 | int ____ilog2_NaN(void);
         | ^~~
>> drivers/iio/gyro/bmg160_i2c.c:41:36: warning: 'bmg160_acpi_match' defined but not used [-Wunused-const-variable=]
      41 | static const struct acpi_device_id bmg160_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~


vim +/bmg160_acpi_match +41 drivers/iio/gyro/bmg160_i2c.c

    40	
  > 41	static const struct acpi_device_id bmg160_acpi_match[] = {
    42		{"BMG0160", 0},
    43		{"BMI055B", 0},
    44		{},
    45	};
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
