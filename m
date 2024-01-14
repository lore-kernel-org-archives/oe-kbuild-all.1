Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE97212E6C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 23:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IpXykD6y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705274298; x=1736810298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4aiaZOYZ89Qwnh8MoAjkIM6qdeUCz0ys34b3dJe3kPs=;
  b=IpXykD6yOIRDdmnr5n9ImBhS2mrMEvNCK+vbkihqQ4I6sNBDyXHcfR5w
   n/t7fDFobxY/kzUNRNfYzXKnMUByFa1pdWl56IMfcafqQyUWig1/of410
   +WgBf9HmSdStaKDI9wgQpvl7uUfbDU/PhpSPyDLZxjxeRPMV9/JnhFIy/
   UxfTna207aFG4lhp8YzrOkD/dRhUETL3fajNmiXMNHZIt8hNTTeOVP/uG
   zlwetJtaV3UexKiobICqsAERdZesfCPGj4Qy6v+WtVj16V0LuV0hveMIP
   O4cp+rifbH6hqzRRV2K4+QfyiWwXOUSltWfnpMCxQ73q+c8YemqlhqB7e
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="463779857"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="463779857"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 15:18:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="786913371"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="786913371"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Jan 2024 15:18:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rP9k6-000Bv2-33;
	Sun, 14 Jan 2024 23:18:14 +0000
Date: Mon, 15 Jan 2024 07:17:22 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 4740/17888]
 drivers/staging/media/imx/gmsl-max9286.c:3115:9: warning: no previous
 prototype for function 'analog_test_pattern_show'
Message-ID: <202401150719.vKWCZbGQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   32a344619c750cdcbe31bed754adc1b30d362e45
commit: 919bae297df242cd66d5f0ad28a1aa8dde1e297f [4740/17888] Merge remote-tracking branch 'origin/capture/max9286' into capture/next
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240115/202401150719.vKWCZbGQ-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401150719.vKWCZbGQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401150719.vKWCZbGQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/media/imx/gmsl-max9286.c:3115:9: warning: no previous prototype for function 'analog_test_pattern_show' [-Wmissing-prototypes]
    3115 | ssize_t analog_test_pattern_show(struct device *dev,
         |         ^
   drivers/staging/media/imx/gmsl-max9286.c:3115:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3115 | ssize_t analog_test_pattern_show(struct device *dev,
         | ^
         | static 
   drivers/staging/media/imx/gmsl-max9286.c:2358:19: warning: unused function 'max9271_read_reg' [-Wunused-function]
    2358 | static inline int max9271_read_reg(struct sensor_data *max9286_data, int index, u8 reg)
         |                   ^~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/analog_test_pattern_show +3115 drivers/staging/media/imx/gmsl-max9286.c

d1c38e8c82c4d3 Guoniu.zhou 2019-05-05  3114  
d1c38e8c82c4d3 Guoniu.zhou 2019-05-05 @3115  ssize_t analog_test_pattern_show(struct device *dev,
d1c38e8c82c4d3 Guoniu.zhou 2019-05-05  3116  				 struct device_attribute *attr, char *buf)
d1c38e8c82c4d3 Guoniu.zhou 2019-05-05  3117  {
d1c38e8c82c4d3 Guoniu.zhou 2019-05-05  3118  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
d1c38e8c82c4d3 Guoniu.zhou 2019-05-05  3119  	struct sensor_data *max9286_data = subdev_to_sensor_data(sd);
d1c38e8c82c4d3 Guoniu.zhou 2019-05-05  3120  	u8 val = 0;
d1c38e8c82c4d3 Guoniu.zhou 2019-05-05  3121  
d1c38e8c82c4d3 Guoniu.zhou 2019-05-05  3122  	ov10635_read_reg(max9286_data, 0, 0x370A, &val);
d1c38e8c82c4d3 Guoniu.zhou 2019-05-05  3123  	return sprintf(buf, "%s\n", (val & 0x4) ? "enabled" : "disabled");
d1c38e8c82c4d3 Guoniu.zhou 2019-05-05  3124  }
d1c38e8c82c4d3 Guoniu.zhou 2019-05-05  3125  

:::::: The code at line 3115 was first introduced by commit
:::::: d1c38e8c82c4d3d280fe1344a53420c02dcea9fe media: staging: imx: add driver for GMSL MAX9286 device

:::::: TO: Guoniu.zhou <guoniu.zhou@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
