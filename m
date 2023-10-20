Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2211E530
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 20:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JhVSPuUs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697832825; x=1729368825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/5ASynRQh1FzU6sBdfdEKC4aiFccL2OVYaX+cK4eltc=;
  b=JhVSPuUsCmtFQW0SYfNX4wkGRUzhT1HCDvz3w/EpvzyCnRpNthJOQU5g
   rFXiU1i6OsAC1zQIUI0xnusUXV4LqmAwwFIc2i4rQkBY9W+MDACmRCfOw
   Ki7s06510Lm9zsCqd2BhCItXFMAhBQuvaq60pss0kboGuat77e0ioR6my
   9LK85rKCuIP4ae5F7Jv3+ytFRHbqklGBfyj6fXtxg58yhpx0kgH5ScR6C
   jViENrYVg6eVrO+JBBj5MrWUhufsDbs5UFADyLfEYxhqvbOUoSfLHwXSc
   6ddW3h/O6R8rFMglh8XFSA/APB027DBwdVzBwzDO5TUY5aomWW0GuyK6F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="386380716"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="386380716"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 13:13:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="823373115"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="823373115"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Oct 2023 13:13:29 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtvs7-0003xS-05;
	Fri, 20 Oct 2023 20:13:27 +0000
Date: Sat, 21 Oct 2023 04:13:12 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [pinchartl:mtk/v6.6/thp7312/v4 3/3]
 drivers/media/i2c/thp7312.c:677:12: warning: 'thp7312_pm_runtime_resume'
 defined but not used
Message-ID: <202310210305.lkkiiULZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git mtk/v6.6/thp7312/v4
head:   13c5e15c5329497328f204f7cb051772814bbdc2
commit: 13c5e15c5329497328f204f7cb051772814bbdc2 [3/3] media: i2c: Add driver for THine THP7312
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231021/202310210305.lkkiiULZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310210305.lkkiiULZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210305.lkkiiULZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/thp7312.c:677:12: warning: 'thp7312_pm_runtime_resume' defined but not used [-Wunused-function]
     677 | static int thp7312_pm_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/thp7312.c:669:12: warning: 'thp7312_pm_runtime_suspend' defined but not used [-Wunused-function]
     669 | static int thp7312_pm_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/thp7312_pm_runtime_resume +677 drivers/media/i2c/thp7312.c

   668	
 > 669	static int thp7312_pm_runtime_suspend(struct device *dev)
   670	{
   671		struct v4l2_subdev *sd = dev_get_drvdata(dev);
   672		struct thp7312_device *thp7312 = to_thp7312_dev(sd);
   673	
   674		return thp7312_power_off(thp7312);
   675	}
   676	
 > 677	static int thp7312_pm_runtime_resume(struct device *dev)
   678	{
   679		struct v4l2_subdev *sd = dev_get_drvdata(dev);
   680		struct thp7312_device *thp7312 = to_thp7312_dev(sd);
   681	
   682		return thp7312_power_on(thp7312);
   683	}
   684	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
