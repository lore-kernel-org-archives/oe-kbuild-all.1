Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F933093B8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 13:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758549220; cv=none; b=j8QzBlnropPF4O6nEFon78wyH+y3b8yg53tHYgUTDbs4lWNIl6yGpGAyti1Ur5iFWYltDh1f5riEatSwoOl5Be9sEsetib+/46/8qgbkdJ30GJOW2fKufQ4DJ50ZhegXO8iP1WDy0f6yCqvwznRPeRKmK4VGje3DOaLVhtVAHJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758549220; c=relaxed/simple;
	bh=+Rpk84wjMRUhfW4ry+4rWETHd28YCPUFIZIFtt1fMxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u2ZfwKbRtVflOOv+p6ddeSqFhTQJAKcCh+7VXBX0g4t9k4lDH0BJInGq7GCgGPmOjrUh6Ugz+qrViuAudbDsXEdRwLYkoLn83Bvi10A0kJhnR7kuBPkhmMJZWjXeHxtb6L6ly0kdV8AY8MiHqTaY6gMLmbvfgKuUuEOPwADbZLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/5BvdzO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/5BvdzO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758549220; x=1790085220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Rpk84wjMRUhfW4ry+4rWETHd28YCPUFIZIFtt1fMxM=;
  b=I/5BvdzODMbV3GhqwYHjRIUYLm+dNoBbSCObT/zgBOkC4XbOxgQEttYO
   XWgWPRwk7NreWvBZ1WccYqU7f+3U6OR2Xc/igZoAQ1zAImGSENbs4acU1
   QAhZ9lIBdG/ZC6F9gk1MWY5WR3k9z4AY9cDRn7LKxSc3y1x8p2+vUmePP
   NUXEOoR7Zg5P26qr9ungHmUC3F75TtMQVPD2yC09Alm3gOvT5ryj9ech0
   HQ3LrJIlJuT5+Hq/z/oZsC2+Lmvqz+dh47juUU0G8JOqm7+e6B+lERVmV
   BP2PbqfTLHIJ5Pn7Hf3VuqonPq3v4I+6IHTFy46w4ZMo380UG/y+POwzY
   Q==;
X-CSE-ConnectionGUID: R6cu9WjSQAGjlctnpiRV6w==
X-CSE-MsgGUID: 0Xys3imOQkmyw2d3T78gaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60724463"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60724463"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 06:53:39 -0700
X-CSE-ConnectionGUID: PAzUdO30QkaqYg7lwzA//A==
X-CSE-MsgGUID: 5dxPciGfT8ORSCUbJwPRFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="176402959"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Sep 2025 06:53:37 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0gz0-0001j3-2U;
	Mon, 22 Sep 2025 13:53:34 +0000
Date: Mon, 22 Sep 2025 21:53:31 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 11417/11516]
 drivers/gpu/drm/xe/xe_device_sysfs.c:300:25: error: label 'cleanup' used but
 not defined
Message-ID: <202509222153.rYXgFTKA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bf2602a3cb2381fb1a04bf1c39a290518d2538d1
commit: 648416842fefa3f53b4061945c5f26794ac249c0 [11417/11516] Merge branch 'drm-next' of https://gitlab.freedesktop.org/drm/kernel.git
config: i386-buildonly-randconfig-002-20250922 (https://download.01.org/0day-ci/archive/20250922/202509222153.rYXgFTKA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509222153.rYXgFTKA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509222153.rYXgFTKA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_device_sysfs.c: In function 'xe_device_sysfs_init':
>> drivers/gpu/drm/xe/xe_device_sysfs.c:300:25: error: label 'cleanup' used but not defined
     300 |                         goto cleanup;
         |                         ^~~~


vim +/cleanup +300 drivers/gpu/drm/xe/xe_device_sysfs.c

b2d756199be822 Anshuman Gupta        2023-07-18  281  
c086bfc6ff4db7 Himal Prasad Ghimiray 2024-04-12  282  int xe_device_sysfs_init(struct xe_device *xe)
b2d756199be822 Anshuman Gupta        2023-07-18  283  {
b2d756199be822 Anshuman Gupta        2023-07-18  284  	struct device *dev = xe->drm.dev;
b2d756199be822 Anshuman Gupta        2023-07-18  285  	int ret;
b2d756199be822 Anshuman Gupta        2023-07-18  286  
f3e875b3c05ce0 Raag Jadav            2025-05-06  287  	if (xe->d3cold.capable) {
fb3c27a69c4736 Michal Wajdeczko      2025-09-16  288  		ret = devm_device_add_group(dev, &vram_attr_group);
b2d756199be822 Anshuman Gupta        2023-07-18  289  		if (ret)
c086bfc6ff4db7 Himal Prasad Ghimiray 2024-04-12  290  			return ret;
f3e875b3c05ce0 Raag Jadav            2025-05-06  291  	}
c086bfc6ff4db7 Himal Prasad Ghimiray 2024-04-12  292  
a2d6223d224f33 Michal Wajdeczko      2025-09-16  293  	if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
fb3c27a69c4736 Michal Wajdeczko      2025-09-16  294  		ret = devm_device_add_group(dev, &auto_link_downgrade_attr_group);
0e414bf7ad012e Raag Jadav            2025-05-06  295  		if (ret)
ff89a4d285c828 Zongyao Bai           2025-09-16  296  			goto cleanup;
cdc36b66cd41d0 Raag Jadav            2025-07-09  297  
fb3c27a69c4736 Michal Wajdeczko      2025-09-16  298  		ret = devm_device_add_group(dev, &late_bind_attr_group);
cdc36b66cd41d0 Raag Jadav            2025-07-09  299  		if (ret)
ff89a4d285c828 Zongyao Bai           2025-09-16 @300  			goto cleanup;

:::::: The code at line 300 was first introduced by commit
:::::: ff89a4d285c82813faa0e2e386d07120ae1f9c85 drm/xe/sysfs: Add cleanup action in xe_device_sysfs_init

:::::: TO: Zongyao Bai <zongyao.bai@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
