Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF13125170
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 19:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690919862; x=1722455862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L6TVwEOn4tdPUsiNGSAK++c3gIAyXgI8eDlHfQzHq8A=;
  b=iRNMSLPb1rwwmiNuHkn//mXg4kkIPjp9I3n7JBlpeHHCr1U5WB4Ac8Ss
   ZDxDZmTAtSvTWkzXIYSjGCPriSM7Ihpo+XpqZ/CTwF2menSo49fS7WbdU
   h2B+YkbzxhysgBzsqofEhVHnvVr9FFi7cji9hm+kvhkDxac268VEA1rLs
   Bmppy+N1qZSwbm72GF9hlPZ0BJqCf2DBD0NbskSmp9uwfjhNcnCE35iD/
   MuCi1BhqwED+xpjW3YTq87EHeC81qCo2FWTmi1azj+/yC0HEytPK7VMZP
   p2unEvKD7GLsh2EukVe2YYnc5SFs2HCSl9fCzUl11Q0aVgV+v2bNsEnp1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="372129088"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="372129088"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 12:57:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="758466291"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="758466291"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Aug 2023 12:57:40 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQvUy-0000Z9-08;
	Tue, 01 Aug 2023 19:57:40 +0000
Date: Wed, 2 Aug 2023 03:56:55 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [hansg:media-ov2680 9/29] drivers/media/i2c/ov2680.c:791:26: error:
 implicit declaration of function 'devm_cci_regmap_init_i2c'; did you mean
 'devm_regmap_init_i2c'?
Message-ID: <202308020353.V0Y3MIys-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git media-ov2680
head:   55385c64ad747564cdf53f878ad6736126642723
commit: 4f958f169903a41c8bce695d7cf2fd2711f070f7 [9/29] media: ov2680: Convert to new CCI register access helpers
config: x86_64-buildonly-randconfig-r001-20230731 (https://download.01.org/0day-ci/archive/20230802/202308020353.V0Y3MIys-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020353.V0Y3MIys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308020353.V0Y3MIys-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/media/i2c/ov2680.c: In function 'ov2680_probe':
>> drivers/media/i2c/ov2680.c:791:26: error: implicit declaration of function 'devm_cci_regmap_init_i2c'; did you mean 'devm_regmap_init_i2c'? [-Werror=implicit-function-declaration]
     791 |         sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
         |                          devm_regmap_init_i2c
>> drivers/media/i2c/ov2680.c:791:24: warning: assignment to 'struct regmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     791 |         sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
         |                        ^
   cc1: some warnings being treated as errors


vim +791 drivers/media/i2c/ov2680.c

   778	
   779	static int ov2680_probe(struct i2c_client *client)
   780	{
   781		struct device *dev = &client->dev;
   782		struct ov2680_dev *sensor;
   783		int ret;
   784	
   785		sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
   786		if (!sensor)
   787			return -ENOMEM;
   788	
   789		sensor->i2c_client = client;
   790	
 > 791		sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
   792		if (IS_ERR(sensor->regmap))
   793			return PTR_ERR(sensor->regmap);
   794	
   795		ret = ov2680_parse_dt(sensor);
   796		if (ret < 0)
   797			return -EINVAL;
   798	
   799		ret = ov2680_mode_init(sensor);
   800		if (ret < 0)
   801			return ret;
   802	
   803		ret = ov2680_get_regulators(sensor);
   804		if (ret < 0) {
   805			dev_err(dev, "failed to get regulators\n");
   806			return ret;
   807		}
   808	
   809		mutex_init(&sensor->lock);
   810	
   811		ret = ov2680_check_id(sensor);
   812		if (ret < 0)
   813			goto lock_destroy;
   814	
   815		ret = ov2680_v4l2_register(sensor);
   816		if (ret < 0)
   817			goto lock_destroy;
   818	
   819		dev_info(dev, "ov2680 init correctly\n");
   820	
   821		return 0;
   822	
   823	lock_destroy:
   824		dev_err(dev, "ov2680 init fail: %d\n", ret);
   825		mutex_destroy(&sensor->lock);
   826	
   827		return ret;
   828	}
   829	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
