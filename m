Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481901F463B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 09:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745399650; cv=none; b=oot57WL6BTpnUAXJWA8QPgJNlaZ/SyiFLEbOHyKKdLosK8m2xe9coF0+pNx9xjMO2MwbLzEsa8HXZtc5+ja4QCkGUZLgSCoYjFlqY0RJVLxzlA+hAUU8TyCvOHk0gXaS6tIG8blKe/37fsQiYCVZvWtUiS1oblhSnnxEueoyNpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745399650; c=relaxed/simple;
	bh=3OfTSbfCRJ33IW6lOxQ7xfydCHacaRmsqcrWVfvYeSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TQgELq5vxNatTNyX+dzB0tDGnjtTlEi1meKHsc76QwZGycot1mxmsR2DyN9TTd3yJa2bt1X5JqBKyvXhOFtH5o46h1tLpSJPaimTCao9oh02XlmZbvwBTwb6UW341Oe/cooG2qMAj4I8t3fVzWP6yDQS4bE/EAYDnVl6HLP3bcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJsTD/35; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJsTD/35"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745399648; x=1776935648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3OfTSbfCRJ33IW6lOxQ7xfydCHacaRmsqcrWVfvYeSE=;
  b=EJsTD/35Pr6Lz9Xf3InId7Eg8AF8IPqr0H+4CBxAxrt50LgLiki26aPj
   4hMiomZGP/OhqMl7X+cyiYeX0s+zez4p3/R7jluLxywj/K34zf2hKZHZt
   3XWYsrjAWlPByZBs3U0JiK3ik+N6WrooER3zWXi+iNRKmlPL0Q8hhoCZG
   Jn+V5GMhP/gpFuoS+sw3GkGRJJxDpV33IAqV62ClVHyjxFFHTyhqjFcZx
   eSOiTZbfSqIV7XiaF4RkMB5bBazTtXPfIP5OcFqFPGcs0AmZI/1gns6Az
   is2zbSF4WgkyX4PVEXGXlZ87bZPXtlXxGx0PT6hrJmYoZxSKGiIvqKaul
   w==;
X-CSE-ConnectionGUID: Zb21E1dYTQWucoqIPE2F9w==
X-CSE-MsgGUID: z+JzojJEQRS4CJzHHWwqjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="64511229"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="64511229"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 02:14:08 -0700
X-CSE-ConnectionGUID: 5muWZDPbT9CBAiNR4xdR0w==
X-CSE-MsgGUID: kWzdIeP9SC2H/WLvzNRXOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="136335520"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Apr 2025 02:14:06 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7WBA-0001nD-1Y;
	Wed, 23 Apr 2025 09:14:04 +0000
Date: Wed, 23 Apr 2025 17:13:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/1] ld:
 drivers/phy/realtek/phy-rtk-usb3.c:351: undefined reference to
 `usb_debug_root'
Message-ID: <202504231745.tg44KIXJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stanley,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   a82122465ce4d62df5e03929565369e22880a0d5
commit: 6e97af079d7960bc7b60265e233f04ec8e218f98 [0/1] FROMGIT: phy: realtek: usb: Add driver for the Realtek SoC USB 3.0 PHY
config: i386-randconfig-054-20250423 (https://download.01.org/0day-ci/archive/20250423/202504231745.tg44KIXJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250423/202504231745.tg44KIXJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504231745.tg44KIXJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/phy/realtek/phy-rtk-usb2.o: in function `create_phy_debug_root':
   drivers/phy/realtek/phy-rtk-usb2.c:715: undefined reference to `usb_debug_root'
   ld: drivers/phy/realtek/phy-rtk-usb2.c:717: undefined reference to `usb_debug_root'
   ld: drivers/phy/realtek/phy-rtk-usb3.o: in function `create_phy_debug_root':
   drivers/phy/realtek/phy-rtk-usb3.c:349: undefined reference to `usb_debug_root'
>> ld: drivers/phy/realtek/phy-rtk-usb3.c:351: undefined reference to `usb_debug_root'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
