Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6212722AE45
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 10:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752026; cv=none; b=aX6G0guKmgczBGATGvG0NLOZAvOk6kY81U8DO0u/uJxOL3nKuUETxmQ2CA/edGVg53MQWmygs8uQw41Ezyh6OcEyN60xfG6P4Gh7toW9QxEhWZc/RmllP8BY5S87h0x6hRyS0dXrMOQjMe8TKFiKkSWCL8nJbL8tTRu1wS+eFBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752026; c=relaxed/simple;
	bh=eIR0rSzsEQ7h8khVdTBZ3fMrMgHVUNECfWOEi5PuKRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BQR2bj6ZYxswGE8cciSZfy/o0r8RztnZJQVkVFuqiW6EPQO2h0ZRvvFi3IR3Zp/uhG5FJ6AgRqmhz8JxnkSnq47/6WbXmfQ5rGluWBcAKYCwpx7UfVD1iQLYqxD3PN2z71cb8SnhaH09nVUPJOeysuWUIZv2jk/d+DN5/49X3no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZOEn3XuR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOEn3XuR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738752024; x=1770288024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eIR0rSzsEQ7h8khVdTBZ3fMrMgHVUNECfWOEi5PuKRA=;
  b=ZOEn3XuRkgJBAbLDCfX+I0BY5lKuIxH3juV+Dp4pZlz3OYgDqGNfDK1V
   ThO4k1yicxFl5v/7Wpzkx/PHlIex621DjIn1gO7fmUqGIWEjWE7UGrVV9
   ZsgpiZSHQXdLt+2E7deSqNX7E1GHgptqT/iF3JHM5LfSnJmocEgiP/yRp
   j7rkYq++Spm+NAOqVdGH33aChganQTAmMKRmaWq92D5Cfm18UglE2nxLT
   5vg1HjZQ3dyRVDF47exhUKYRGkW9uxE7za0KD2WEEsMyzJ35xt/DYk4Ik
   UEsB0mpauLstHZh25XqSgvDniC8y+GyMW0aWgm/y+ohKs0vlz1cuRyi0N
   g==;
X-CSE-ConnectionGUID: MVQy+xjnTgOE1b9kW/oVmA==
X-CSE-MsgGUID: XwWD5lxoSli+k2fRr5OALg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39207745"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39207745"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 02:40:23 -0800
X-CSE-ConnectionGUID: TANaz3j3Q46gDy4WmCJlQQ==
X-CSE-MsgGUID: MaUvixYPSXO8bPa7jxJU3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="110849491"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Feb 2025 02:40:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfcpQ-000tmz-0s;
	Wed, 05 Feb 2025 10:40:20 +0000
Date: Wed, 5 Feb 2025 18:39:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 192/192]
 drivers/thermal/mediatek/thermal_interface.c:59:5: warning: no previous
 prototype for 'set_reboot_temperature'
Message-ID: <202502051852.yR737kZF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1b7d37693f7bd7e9f37c02d15753e16b5bac8c79
commit: f92d27911c80f765803e64a146e7fd2ffad1c707 [192/192] CHROMIUM: thermal/mediatek: add thermal interface driver
config: arm64-randconfig-003-20250205 (https://download.01.org/0day-ci/archive/20250205/202502051852.yR737kZF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051852.yR737kZF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051852.yR737kZF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thermal/mediatek/thermal_interface.c:59:5: warning: no previous prototype for 'set_reboot_temperature' [-Wmissing-prototypes]
      59 | int set_reboot_temperature(int temp)
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/set_reboot_temperature +59 drivers/thermal/mediatek/thermal_interface.c

    58	
  > 59	int set_reboot_temperature(int temp)
    60	{
    61		if (!tm_data.sw_ready)
    62			return -ENODEV;
    63	
    64		therm_intf_write_csram(temp, REBOOT_TEMPERATURE_ADDR_OFFSET);
    65	
    66		return 0;
    67	}
    68	EXPORT_SYMBOL(set_reboot_temperature);
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
