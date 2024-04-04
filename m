Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2DA3E498
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 06:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712211455; cv=none; b=Wpu1H+6+nOPp4EMv5sLBTfxCOUxfdXWBX6P8cjImLtLKpHk4ZndgJW0/ojls40L+HylPvJaLVTsAs+zSmMrMFsZmfP84TckDos4s62sb9fQ+96rmLjA+20Rp0gFPEfjOCLJ1NEqtVXbK5Osbgb591S12n7hBki9VG0feIq8bscg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712211455; c=relaxed/simple;
	bh=4hggkp8KQU8MfxGr3FqgMgxciQYte/98/hLnzNG2bqk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K8r5yIO5bhEJXmW1IP6AgbilZ0UVMTwXpTXyMr+6DiofL3SIN/cZAQn9ReGWRHE38bgxUytGn1tK5gm3Yld6dHZAzyQy8A9AdT1bQpaZpEsOsSLNJcbEcBS5rGEuCZqDo0gxsqUZRWs7uFJRLNDp9/3WD35VRpLIi5nrajk8PIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UWN+fJ7t; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWN+fJ7t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712211453; x=1743747453;
  h=date:from:cc:subject:message-id:mime-version;
  bh=4hggkp8KQU8MfxGr3FqgMgxciQYte/98/hLnzNG2bqk=;
  b=UWN+fJ7tATzt3zeqySFjEwhUmE3HyRBACHhOJrw0n4t0hntz36mUJ8v3
   3TEONzxBkIP55YDTbV73Vjo9xdMbV+gXZunj8su2Bt2FSl4yYhq6gg1+a
   cEcf2C4HEfZlr2jB0Z1Ju9W7935xOAetNWJrgzrZ1E2RE/Cq/A+MrFZFb
   L9GrDroRpEpS8+5ocC4oSk6JPmtnH0gmkO2gHPJcdIpPKdi1eZRp4NCD/
   fM2ZKXVwUv76433eVHl4A26Bf4/5jYnMaZroWyv8yfLFXktyzLl/2vNrb
   xLBvoDd/ZNZadwpBlSl+/f+3CFSX12qAe9o1ZUVuYg4uVTgqB44BWvOth
   Q==;
X-CSE-ConnectionGUID: xrlAv7BVSDahF8e+yVO2tA==
X-CSE-MsgGUID: 3basQy/SQd+y6jX/3ffbQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="24933837"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="24933837"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 23:17:33 -0700
X-CSE-ConnectionGUID: pJ6BveZ6T5OLt74CqcmDiQ==
X-CSE-MsgGUID: 212Z34Q6Rkq/6IMwdgBVDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="18706928"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Apr 2024 23:17:31 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsGPg-0000gK-31;
	Thu, 04 Apr 2024 06:17:28 +0000
Date: Thu, 4 Apr 2024 14:17:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 46/107] kismet: WARNING: unmet direct
 dependencies detected for OF_GPIO when selected by VIDEO_DS90UB913
Message-ID: <202404041424.0aWBIXwJ-lkp@intel.com>
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
commit: b18364151a13ff12dcf5655d4c13e734e824206c [46/107] media: i2c: add DS90UB913 driver
config: alpha-kismet-CONFIG_OF_GPIO-CONFIG_VIDEO_DS90UB913-0-0 (https://download.01.org/0day-ci/archive/20240404/202404041424.0aWBIXwJ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240404/202404041424.0aWBIXwJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041424.0aWBIXwJ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_GPIO when selected by VIDEO_DS90UB913
   
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=n] && OF [=y] && HAS_IOMEM [=y]
     Selected by [y]:
     - VIDEO_DS90UB913 [=y] && MEDIA_SUPPORT [=y] && OF [=y] && I2C [=y] && VIDEO_DEV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
