Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D37B7C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 03:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682306922; x=1713842922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sxxi66B7IjH2oLwA5F7SOd1yyfGXAr5ZXrKITZL+JMM=;
  b=PqddIVibbYAv1lFcUgN7QB4zFQtTEpjLKuqwGcOp2VOIxrOYqlfAg11a
   qeP6WR5qCMqfDuu5TobpC07i4ziVQvJb01SYksBigDHm18WLp80VcyFNr
   vS3WWILDp1QMheMzJm5g7CEZUEhEHZrKGjtbjxyv5y2kn3nlDBIQvQmGM
   K7d7158lqkDPtigvOrXzNMaIpon6FDOvHgCZFjx2Tr+3PcmF2ePheR7Fz
   I9DdaLOUtBCzrQqk5KpA/YYrMC+NiqeFrIZbsmiOJCNCeHH+oRR+pcdpe
   lQrfe+kUyYH7b9mNFPB7tg+2hpe2adtPkyyEIy5hMnVceyHDdwISww0fr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="432621736"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
   d="scan'208";a="432621736"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 20:28:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="695591711"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
   d="scan'208";a="695591711"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Apr 2023 20:28:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqmsZ-000iFo-0b;
	Mon, 24 Apr 2023 03:28:39 +0000
Date: Mon, 24 Apr 2023 11:28:28 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [steev:c630-v6.3 6/11] drivers/power/supply/yoga-c630-ec.c:465:18:
 error: initialization of 'int (*)(struct i2c_client *)' from incompatible
 pointer type 'int (*)(struct i2c_client *, const struct i2c_device_id *)'
Message-ID: <202304241141.fKraXeXf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux c630-v6.3
head:   b4d83e68be9f1bb3539ea6b23f3f5a9f8cebc7df
commit: f8cff82b4956f2b243daa4c120b68f80c774d9cf [6/11] power: supply: Add Lenovo Yoga C630 EC driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230424/202304241141.fKraXeXf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/steev/linux/commit/f8cff82b4956f2b243daa4c120b68f80c774d9cf
        git remote add steev https://github.com/steev/linux
        git fetch --no-tags steev c630-v6.3
        git checkout f8cff82b4956f2b243daa4c120b68f80c774d9cf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304241141.fKraXeXf-lkp@intel.com/

Note: the steev/c630-v6.3 HEAD b4d83e68be9f1bb3539ea6b23f3f5a9f8cebc7df builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/power/supply/yoga-c630-ec.c:465:18: error: initialization of 'int (*)(struct i2c_client *)' from incompatible pointer type 'int (*)(struct i2c_client *, const struct i2c_device_id *)' [-Werror=incompatible-pointer-types]
     465 |         .probe = yoga_c630_ec_probe,
         |                  ^~~~~~~~~~~~~~~~~~
   drivers/power/supply/yoga-c630-ec.c:465:18: note: (near initialization for 'yoga_c630_ec_i2c_driver.<anonymous>.probe')
   cc1: some warnings being treated as errors


vim +465 drivers/power/supply/yoga-c630-ec.c

   459	
   460	static struct i2c_driver yoga_c630_ec_i2c_driver = {
   461		.driver = {
   462			.name = "yoga-c630-ec",
   463			.of_match_table = yoga_c630_ec_of_match,
   464		},
 > 465		.probe = yoga_c630_ec_probe,
   466		.id_table = yoga_c630_ec_i2c_id_table,
   467	};
   468	module_i2c_driver(yoga_c630_ec_i2c_driver);
   469	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
