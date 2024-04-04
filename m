Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDF083A09
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 12:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712232249; cv=none; b=nREaY00wiO3NeHafVITwtrhWRhHlk9F/NfPzbInoezvEf1+PwCit63dP88HHPN9USh3cx8X0eBRoOuXzV+GiYJaLjWegPNIZYwcpuyCcqt56xyXwa26YHa8tf4SKDiZ2R87ROkAKmopR1hI5loIlbeS25aV8o1vlGZ7Cy+oJM64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712232249; c=relaxed/simple;
	bh=7aspQQkteb4rkfaDBOyT11FsyHgy8SJvYiJuQX5DBtQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tT2NwzSzc6kjDlnzWsJgAt9dVoyPUnfqBoMnEeP7cksTIJdAA4PqAHPMXbEiKv733PRsAm1naul/G5a11eWBJgaWHeHlW/mlHqvtKoo5W3aGZgyeUSqniwfs6wtHqvQC8d9iPdfeu+HhEoVrAq1ZCLsDFblxN6qqo+o73XTV3QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=afHDJrrp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="afHDJrrp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712232245; x=1743768245;
  h=date:from:cc:subject:message-id:mime-version;
  bh=7aspQQkteb4rkfaDBOyT11FsyHgy8SJvYiJuQX5DBtQ=;
  b=afHDJrrp6g6M2+ZR9fZuSXYCo3swreLZCitu7zyZZtHcBU544HPEoW24
   fHioYAC0FeHdZTBy5Uv0ATSiyRlIRaseFlQ1RZHULvWRFp6FFLfGN5cKY
   LVPazlT80EJXYlEtBPxTEoVkXsJVnhlU0PrQewnIW/vlP6n481Tayou30
   HsmF4NTlJ0Ng9NJRf/a0K77N7oVizCqF8mbeU5Ch37oFCMtR2nJNxrQNq
   mNLbO6p9LahHky65ASh1J5+laiF6XadoXjcW5n3XnJbQVk2To0TORDb8I
   w0HPqDTxwx9OZ8JtQMr5U842UKVc98oUQxW76Fv+GpyOAvi4tk+cKRZvU
   w==;
X-CSE-ConnectionGUID: 2GKKmsc/T2GelXSM1i+Hng==
X-CSE-MsgGUID: sYXgW8qvSeO0L5F/RC5ZNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7674179"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7674179"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 05:03:49 -0700
X-CSE-ConnectionGUID: qZx5rz+lQ06h95bhJyABLg==
X-CSE-MsgGUID: s8H87vbsQ6O97esRel9Iow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="23454398"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Apr 2024 05:03:48 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsLon-00010u-0e;
	Thu, 04 Apr 2024 12:03:45 +0000
Date: Thu, 4 Apr 2024 20:02:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 45/107] kismet: WARNING: unmet direct
 dependencies detected for OF_GPIO when selected by VIDEO_DS90UB960
Message-ID: <202404041905.Lzvalz1r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   01dbe4e64bacaa4c891c1997f2724c320698d61f
commit: cf0136753f9892c69092d959eb86c8e06e706138 [45/107] media: i2c: add DS90UB960 driver
config: alpha-kismet-CONFIG_OF_GPIO-CONFIG_VIDEO_DS90UB960-0-0 (https://download.01.org/0day-ci/archive/20240404/202404041905.Lzvalz1r-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240404/202404041905.Lzvalz1r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041905.Lzvalz1r-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_GPIO when selected by VIDEO_DS90UB960
   
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=n] && OF [=y] && HAS_IOMEM [=y]
     Selected by [y]:
     - VIDEO_DS90UB960 [=y] && MEDIA_SUPPORT [=y] && OF [=y] && I2C [=y] && VIDEO_DEV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
