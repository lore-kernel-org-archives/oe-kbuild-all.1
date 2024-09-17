Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD584683
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 01:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726535264; cv=none; b=RtJ5EjBFqJAkuaHI0ewohgFxlQXfX6jWlqUyEt6LjoBNUFj65HDIO8/VfzUkhgBL+zcp+6GbOoav1DZcMZJYM0uiev/tdXnyvq0tSSX1miE631eNrgxkLpMaSLaFI57oQliQxTMolyaqh25pJ+FbM6C3im+I8npqDf7r2z+6I3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726535264; c=relaxed/simple;
	bh=zX+MWp8vCQeytABFfRX8nbKfsjt0/wUIxSveeMZ+rF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FP26OU2NKC9NfWlhE5Bexkf8iGad4DLglwFbIalx+Y1+shaPr9/rqj/2M0AAe1nhSHXCP7+KtKaFtr5nLbnFfQ6TIY8K9OY4E80DQM+LPce98yKjTQQ6+3BV6Sv8GOvIEuMkhvRTgR3NFRdJo0nJfxrWcx7EcE8adf8DqDIBXJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mqMTCCdQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mqMTCCdQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726535262; x=1758071262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zX+MWp8vCQeytABFfRX8nbKfsjt0/wUIxSveeMZ+rF4=;
  b=mqMTCCdQPXOPCYlHBhGs5i15AhVieg9fhT1hxi7TRVfyr+31uStLXNj6
   Q0RVIBGqr9NiotChNycEOOFPavDgmNnlzWMcuSGdQP8FA1ysujZU9cEAj
   Eh4OpoAc1AET+gOPuz8P6lJjnj+MuCOkBTz1Bq56K+QR/hmsTkYJX8PvZ
   7ZmEOtJXVHDLdWIKl5PhN8d9feB8LN6CcdkDj7bTL73J6aNMaKwEcVC1+
   lF9BCNBBeADWVX4wxN8CKSjpcntE4sWXA0ezzQ4+hWPciL8KWjvbBUGSX
   P/56VmQYq9RWVj/CmOpEQIop/CbLVqO0x5sMY+XGb+pKCcI+aYaOoYcMl
   g==;
X-CSE-ConnectionGUID: IK29XzTBT4CQdJr/NXheYg==
X-CSE-MsgGUID: WW/JO/CQSGiV0+zcat0uUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="24864245"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="24864245"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 18:07:41 -0700
X-CSE-ConnectionGUID: Fzkv94vRRcK3Dd+0TV9+vQ==
X-CSE-MsgGUID: v7b2KDAyRsa/OpHoXuZFFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="69025405"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Sep 2024 18:07:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqMgr-000Afe-2C;
	Tue, 17 Sep 2024 01:07:37 +0000
Date: Tue, 17 Sep 2024 09:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.10-main 15/28756]
 drivers/thermal/mtk_thermal.c:988:13: warning: 'mtk_thermal_hwmon_action'
 defined but not used
Message-ID: <202409170957.WHIL4sLA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 5.10-main
head:   4d13745abe4629d6e29e9ccdac56e071a6f630f8
commit: 5036602823ce2d4ad8b7122b19afa16f7f5f0742 [15/28756] thermal: mediatek: execute hwmon-code only if hwmon_thermal is set
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240917/202409170957.WHIL4sLA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409170957.WHIL4sLA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409170957.WHIL4sLA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thermal/mtk_thermal.c:988:13: warning: 'mtk_thermal_hwmon_action' defined but not used [-Wunused-function]
     988 | static void mtk_thermal_hwmon_action(void *data)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/mtk_thermal_hwmon_action +988 drivers/thermal/mtk_thermal.c

89945047b1666c Henry Yen        2020-04-30  987  
eb9921de603c7b Frank Wunderlich 2020-01-31 @988  static void mtk_thermal_hwmon_action(void *data)
eb9921de603c7b Frank Wunderlich 2020-01-31  989  {
eb9921de603c7b Frank Wunderlich 2020-01-31  990  	struct thermal_zone_device *zone = data;
eb9921de603c7b Frank Wunderlich 2020-01-31  991  
eb9921de603c7b Frank Wunderlich 2020-01-31  992  	thermal_remove_hwmon_sysfs(zone);
eb9921de603c7b Frank Wunderlich 2020-01-31  993  }
eb9921de603c7b Frank Wunderlich 2020-01-31  994  

:::::: The code at line 988 was first introduced by commit
:::::: eb9921de603c7b48591d2bcadaad662d762a72ad thermal: mediatek: add sensors-support

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
