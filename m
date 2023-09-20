Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFB91381
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 04:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695185104; x=1726721104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WxFrhb0VpBH5JPputEeuqrFfTF5T1+W9QkXuN4PKB1o=;
  b=L+QG5HcxpQHmByEN5dnUX2UwOym2eGDG0Y9yT1Kutb3wfzuQwCg9KbKl
   R8JECY3xBtZUOmZMH7AGDkxB1U/mMRLcv42MBeVUviDXjya3jtbJ083yJ
   r65Ma6Z+rXR/F20EUrUWlJ2Fv7t85+shIhK+WrB7DlY7Dw8JAizxcL8gR
   LaVZblioYp9IoHnnjtUMS/EPbRoakyFxXUkVE+SZKIqo/u2RMGsK8pqtF
   OoJnzifzXkM0z2JlhS5x8gxuAktRBQLRJWOOMcWJpkA1Sy8PMF/Q07Pe8
   kd2MCQr6IdtWbFvS1fZhWb2uhxHp7uV7kwh7p/yxwgYUtnujhigevT2ka
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="380022062"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="380022062"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 21:45:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="836698256"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="836698256"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Sep 2023 21:45:02 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qip5A-0008IG-1o;
	Wed, 20 Sep 2023 04:45:00 +0000
Date: Wed, 20 Sep 2023 12:44:14 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/2] media: i2c: Add driver for onsemi MT9M114 camera
 sensor
Message-ID: <202309201259.CoDIK0SO-lkp@intel.com>
References: <20230919232636.19755-3-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919232636.19755-3-laurent.pinchart@ideasonboard.com>

Hi Laurent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0bb80ecc33a8fb5a682236443c1e740d5c917d1d]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurent-Pinchart/media-dt-bindings-media-i2c-Add-MT9M114-camera-sensor-binding/20230920-072719
base:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
patch link:    https://lore.kernel.org/r/20230919232636.19755-3-laurent.pinchart%40ideasonboard.com
patch subject: [PATCH v3 2/2] media: i2c: Add driver for onsemi MT9M114 camera sensor
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20230920/202309201259.CoDIK0SO-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201259.CoDIK0SO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201259.CoDIK0SO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/mt9m114.c:2201:12: warning: 'mt9m114_runtime_suspend' defined but not used [-Wunused-function]
    2201 | static int mt9m114_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/mt9m114.c:2182:12: warning: 'mt9m114_runtime_resume' defined but not used [-Wunused-function]
    2182 | static int mt9m114_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/mt9m114.c: In function 'mt9m114_ifp_init_cfg':
   drivers/media/i2c/mt9m114.c:1635:9: warning: 'memset' offset [0, 27] is out of the bounds [0, 0] [-Warray-bounds=]
    1635 |         memset(format, 0, sizeof(*format));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mt9m114_runtime_suspend +2201 drivers/media/i2c/mt9m114.c

  2181	
> 2182	static int mt9m114_runtime_resume(struct device *dev)
  2183	{
  2184		struct v4l2_subdev *sd = dev_get_drvdata(dev);
  2185		struct mt9m114 *sensor = ifp_to_mt9m114(sd);
  2186		int ret;
  2187	
  2188		ret = mt9m114_power_on(sensor);
  2189		if (ret)
  2190			return ret;
  2191	
  2192		ret = mt9m114_initialize(sensor);
  2193		if (ret) {
  2194			mt9m114_power_off(sensor);
  2195			return ret;
  2196		}
  2197	
  2198		return 0;
  2199	}
  2200	
> 2201	static int mt9m114_runtime_suspend(struct device *dev)
  2202	{
  2203		struct v4l2_subdev *sd = dev_get_drvdata(dev);
  2204		struct mt9m114 *sensor = ifp_to_mt9m114(sd);
  2205	
  2206		mt9m114_power_off(sensor);
  2207	
  2208		return 0;
  2209	}
  2210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
