Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F81C2F7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 12:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693052006; x=1724588006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=seu5FaNvo0+ym3lSczalsnLya6YCFcEqx+fC4uvg5SU=;
  b=ftiXMxBVsDd3UKiZW4u1WPAsgO0Ver30jVNe5hz71f9YlfRrF0pZo62D
   tW/TthZoCyBjappOmqQhwRSeXecai4lWchLG+cgxJ/UQZBPo3sV9h3NFo
   4IJb4RnIoewoJdP5IVNLur5KPB4jw5nsMtN4zqy8hDXwWrheyOdl6XPhM
   dUTE9J6wFu152bHeaqyDY/hudvzXQtV4Zg/zieO1qVsnVBW+aJxPxAi1M
   p8SByBSZelHDawSZ7aNv4LLmV8oteuUF84Dnl90j8p+Od6fZtfYyrzfSt
   FtmlhCUvZM2UGmAPuGhg9EcoXSj51rxcILkAdpxG0EAsLygmcSJ34zHyi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="365072748"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="365072748"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 05:13:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="687601223"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="687601223"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 26 Aug 2023 05:13:24 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZsAN-0004fP-1n;
	Sat, 26 Aug 2023 12:13:23 +0000
Date: Sat, 26 Aug 2023 20:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y 71/107] drivers/media/i2c/ov2312.c:474:12:
 warning: 'ov2312_suspend' defined but not used
Message-ID: <202308262027.46WX1nf7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   dd944f14304d2ce6d26c9cdc3d2d2d6d373a322c
commit: 639983d43644aa713e6801bceb972ae5d526fd22 [71/107] media: i2c: ov2312: add Omnivison OV2312 driver
config: i386-randconfig-r036-20230714 (https://download.01.org/0day-ci/archive/20230826/202308262027.46WX1nf7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308262027.46WX1nf7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308262027.46WX1nf7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/ov2312.c:474:12: warning: 'ov2312_suspend' defined but not used [-Wunused-function]
     474 | static int ov2312_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~
>> drivers/media/i2c/ov2312.c:465:12: warning: 'ov2312_resume' defined but not used [-Wunused-function]
     465 | static int ov2312_resume(struct device *dev)
         |            ^~~~~~~~~~~~~


vim +/ov2312_suspend +474 drivers/media/i2c/ov2312.c

   464	
 > 465	static int ov2312_resume(struct device *dev)
   466	{
   467		struct i2c_client *client = to_i2c_client(dev);
   468		struct v4l2_subdev *sd = i2c_get_clientdata(client);
   469		struct ov2312 *ov2312 = to_ov2312(sd);
   470	
   471		return ov2312_power_on(ov2312);
   472	}
   473	
 > 474	static int ov2312_suspend(struct device *dev)
   475	{
   476		struct i2c_client *client = to_i2c_client(dev);
   477		struct v4l2_subdev *sd = i2c_get_clientdata(client);
   478		struct ov2312 *ov2312 = to_ov2312(sd);
   479	
   480		return ov2312_power_off(ov2312);
   481	}
   482	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
