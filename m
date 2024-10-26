Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C2529CE5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 02:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729910267; cv=none; b=trxrh0R5Bu1pbY7rE4lJp0MpNvwljU+6DF6Cy3I/JHG3It4TyvOcLT427sYgCK6ExjkqBHuoz+i4GLAPiBP7tUv0+R8z4gvsgSlYZAR6PXbTVBMK+hpsV/SYeQ9Mkg8Zd6Uc0v/D+fVE9ktYs6n3LHuKnxPbmgvvP8MMHx21VYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729910267; c=relaxed/simple;
	bh=CEnSGTfL226bbCvPnLpniHzPh9re6/1oax/q9ID6qvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OOZZjJX1HuYfC/OOV8J4Nw8V3RzQQYBsrB5Tu6lw1eKKp0lzQv7G48GElKR8nwTMDc5UUDzzxnC0tf0l9wUeacFiNJZSvDYxtqy+97eFoN/b2OhvfZWHlts9zlC7ZUTZR8XAHPyKmcjnq2lRBzeFV727e89hvGhrqcFveRAGyto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdmpgjZh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hdmpgjZh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729910265; x=1761446265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CEnSGTfL226bbCvPnLpniHzPh9re6/1oax/q9ID6qvY=;
  b=hdmpgjZh6Lx+xBlHCUJJYfD/UrLlnACgXW1+fZXVy4AT0oDdM7PCkzZE
   Et25lkHpDPWdttYV8b5zMRJY7T1PV2uPJAA/lGTXl94F46NkOjG9kmI6V
   xY7SstJ7obmEFxP2qmrVzOhN545KlKYNd5X891eLpsQs8PPhvS6nfX3zC
   YmISp6e2kKrVA9JIp7gDGaji5AQZUogs4i/PPzdhBfINzU5bHuSTHS2S0
   xjaZl4nDB/5r2ggyWh/HXuKeMWRH4XLxUVuQnofhNsq2jutGng5/aU18J
   +LEYlZsB2OL0VYZ93MSHXfUCmQ0xD86Shf+prmmHjf+MZyJ0nUuLfbRFr
   w==;
X-CSE-ConnectionGUID: E8+qc6JgRw+1XAKVAum3pA==
X-CSE-MsgGUID: Y0e81WZ9SkWWditOPAOVgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40692968"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40692968"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 19:37:44 -0700
X-CSE-ConnectionGUID: ZsdYULnCTQmjcGlWjkRW1g==
X-CSE-MsgGUID: caczYtxxSJyNhKaJfB3tSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="104410127"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Oct 2024 19:37:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4WgO-000ZBC-1s;
	Sat, 26 Oct 2024 02:37:40 +0000
Date: Sat, 26 Oct 2024 10:37:12 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
	Algea Cao <algea.cao@rock-chips.com>
Subject: [linux-next:master 4481/7183] ERROR: modpost: "__udivdi3"
 [drivers/gpu/drm/rockchip/rockchipdrm.ko] undefined!
Message-ID: <202410261024.izEWMQGE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Cristian,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a39230ecf6b3057f5897bc4744a790070cfbe7a8
commit: 128a9bf8ace290d86d2805c06f3b0e4cfab75de0 [4481/7183] drm/rockchip: Add basic RK3588 HDMI output support
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20241026/202410261024.izEWMQGE-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410261024.izEWMQGE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261024.izEWMQGE-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/imx/imx-legacy-bridge.o
>> ERROR: modpost: "__udivdi3" [drivers/gpu/drm/rockchip/rockchipdrm.ko] undefined!
ERROR: modpost: "xmb_manager_register" [drivers/misc/xilinx_tmr_manager.ko] undefined!
ERROR: modpost: "xmb_inject_err" [drivers/misc/xilinx_tmr_inject.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
