Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D668C125A9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 17:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727632005; cv=none; b=MiVhqduvnnboVVZb/5RMDXYDpmI34UCyVKri6FFnOiYc72GL7SJNvQhHunkL0EIJSwXOVgJrRjy0VcXMB0YROlLiUPJ7EThiQyHbXpmNKXcHsVf022a6JpKsFM1JX6LewCXoCC5T6Lp6x5qG+vLmnnFbpgBqwgjOJGchxs6WDRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727632005; c=relaxed/simple;
	bh=eHnmB6sJ8uk9281cMqeqho1IC8FM7/u1w1pBblbyniI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VTwidXsxnHKKsvKEjq07MqP9iYxJwjd9GhdwYAezf1VaCzAn04SP/OMwSNdG2vOOcULDRo/bIzBI/xsjZG/9WaSv92KATN2LoAXgnuXMIk3OG4wHogvjivVSVz+HGS/e6YW4TVq5L17EJCJ5ZLatv64+3iYM5fm1Z9ETZnWeVdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dPm/8hyq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPm/8hyq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727632003; x=1759168003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eHnmB6sJ8uk9281cMqeqho1IC8FM7/u1w1pBblbyniI=;
  b=dPm/8hyq3UvbjpY+x/rv+I3JsiUn0Y3yB6/aCXItsBCbTQKPI8cTDGJu
   ESLTUKYEjfMIXHxUehEqhxRVDvkb1psvGfff1Fh4IBkPUFLO+/Q5qzCGv
   nDK9yF9VxrBVu2jFryQzMbGIKX95gzC1Z0ct0T+fdDyu+HjTb5VXS0Thd
   x/8TvOH69vvUJvF5gHzVGvuaM6r7orb65beBD5FmGUDhPorHU8tAQvIxs
   eiOU60melbu8SeCbc5uVjJH1M/+vTYmPSLmiCuiO71JBu8REevoDRfrOI
   XPgQO3C8uQm/cHMTHlTxYQEpV6r/5yUlmfmEm2gLvJsIgk1XY8t0euNqB
   w==;
X-CSE-ConnectionGUID: MF1PNw6GQ4qWFzomB3oDcA==
X-CSE-MsgGUID: 7EAA+IGpRCaCYDBnv7cX9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="49239856"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="49239856"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 10:46:42 -0700
X-CSE-ConnectionGUID: L910jh8ZQ2OAhkfpzKmo9A==
X-CSE-MsgGUID: 1yO3TE3AQZaDlsQj4BuXTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="73391279"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Sep 2024 10:46:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suy0F-000OWl-0y;
	Sun, 29 Sep 2024 17:46:39 +0000
Date: Mon, 30 Sep 2024 01:46:21 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 5780/16788]
 drivers/staging/media/imx/gmsl-max9286.c:3115:9: warning: no previous
 prototype for 'analog_test_pattern_show'
Message-ID: <202409300107.8YJlkA7D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: a2c5cc52f21ee5a475d0cbbbb7b66cc8cf47e596 [5780/16788] Merge remote-tracking branch 'origin/capture/max9286' into capture/next
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20240930/202409300107.8YJlkA7D-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300107.8YJlkA7D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300107.8YJlkA7D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/media/imx/gmsl-max9286.c:3115:9: warning: no previous prototype for 'analog_test_pattern_show' [-Wmissing-prototypes]
    3115 | ssize_t analog_test_pattern_show(struct device *dev,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/analog_test_pattern_show +3115 drivers/staging/media/imx/gmsl-max9286.c

f40dc24036c503 Guoniu.zhou 2019-05-05  3114  
f40dc24036c503 Guoniu.zhou 2019-05-05 @3115  ssize_t analog_test_pattern_show(struct device *dev,
f40dc24036c503 Guoniu.zhou 2019-05-05  3116  				 struct device_attribute *attr, char *buf)
f40dc24036c503 Guoniu.zhou 2019-05-05  3117  {
f40dc24036c503 Guoniu.zhou 2019-05-05  3118  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
f40dc24036c503 Guoniu.zhou 2019-05-05  3119  	struct sensor_data *max9286_data = subdev_to_sensor_data(sd);
f40dc24036c503 Guoniu.zhou 2019-05-05  3120  	u8 val = 0;
f40dc24036c503 Guoniu.zhou 2019-05-05  3121  
f40dc24036c503 Guoniu.zhou 2019-05-05  3122  	ov10635_read_reg(max9286_data, 0, 0x370A, &val);
f40dc24036c503 Guoniu.zhou 2019-05-05  3123  	return sprintf(buf, "%s\n", (val & 0x4) ? "enabled" : "disabled");
f40dc24036c503 Guoniu.zhou 2019-05-05  3124  }
f40dc24036c503 Guoniu.zhou 2019-05-05  3125  

:::::: The code at line 3115 was first introduced by commit
:::::: f40dc24036c503f889d0d4e166dfedbb97131060 media: staging: imx: add driver for GMSL MAX9286 device

:::::: TO: Guoniu.zhou <guoniu.zhou@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
