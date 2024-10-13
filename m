Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23BF1DDEA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 04:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728793358; cv=none; b=Kf+x7ZQhlrY+RIoaXK287/BTR8urXsudeclrePFatvx/FNwgBYb/d9kuLv/Fa5HhIY3RS3VlkLY1fdBV161BOyJ43hl5MdAackzbQ54hheF09HmN2oeb1zUnUrj0oj+q7wQLB/gPUZlwZvx1oreLSnVdK49JbofPPl4NoOZF198=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728793358; c=relaxed/simple;
	bh=ZoNJ7K1wVWdtxY5amI+TQGDBaXqq08OEDq+NsSePHwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aBO/6/Ogn6STc8aLg8ZyTxwBJN9YvP+hr9Mo+xAwThCwsn7BaRnYf9B16mkrweqGz8ydld5h1jWMRXH8s9Xa4CjujhjKm2NUDdUY5X167pKcpY++sPX0x9hqW7Po8OJn/w9P7sCfvhnY6XJoFjo7QLnLLdUPjH1ossL/0kjqPMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TbmGWzZC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TbmGWzZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728793357; x=1760329357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZoNJ7K1wVWdtxY5amI+TQGDBaXqq08OEDq+NsSePHwc=;
  b=TbmGWzZCU1LY2dTQufhgqr2YdAK0PO4psqG15FzcNbFMvFNsM1SHa5Fi
   Klj+2KLnvjFKX6ccAxg+cVyai38muJdnKwdySSs3HfhFAwE110myEqt4k
   xQ2i2AdCwLBhbKvjQDyF6uAQ3ht8wTkCRcEYnuTfASqg0oAeJ7WNDThWV
   DB9zxqMTpcUWL8JLQrafb7gYnC/lj0z+9E2tL+D7Wd7Z0wa5/y9Hdjstz
   XUdV1Ceyiiwv4inPX65doWkRXhelMgC+O3CUgonKRHXn60VxmkSqnaISx
   QjmZIaJ7G8cdsOfKvh1+MO5gEeiammyMSJQMMt2c8RSNhCyl6NMxaqB4k
   Q==;
X-CSE-ConnectionGUID: RhMt9FIFReSoF0XsIA8B8Q==
X-CSE-MsgGUID: pGP/f4ZyS0eG/u0QLw/E6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38719164"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="38719164"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 21:22:36 -0700
X-CSE-ConnectionGUID: ++YwDSmcT1+9ZbMFAnPQqQ==
X-CSE-MsgGUID: 0c5GSO6EQIaC0Dfa1qRM9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="81822235"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Oct 2024 21:22:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szq7l-000E59-0R;
	Sun, 13 Oct 2024 04:22:33 +0000
Date: Sun, 13 Oct 2024 12:22:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 3/10]
 drivers/hid/hid-playstation.c:816: undefined reference to
 `led_mc_calc_color_components'
Message-ID: <202410131234.bsD8ZZaX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   171355878e09938c06396498f584662e3eddcdbc
commit: f91c45c176477d51b800f6ba88ccbd7c8600e0a3 [3/10] UPSTREAM: HID: playstation: expose DualSense lightbar through a multi-color LED.
config: i386-randconfig-141-20241013 (https://download.01.org/0day-ci/archive/20241013/202410131234.bsD8ZZaX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410131234.bsD8ZZaX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410131234.bsD8ZZaX-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/hid/hid-playstation.o: in function `dualsense_lightbar_set_brightness':
>> drivers/hid/hid-playstation.c:816: undefined reference to `led_mc_calc_color_components'
   ld: drivers/hid/hid-playstation.o: in function `devm_led_classdev_multicolor_register':
>> include/linux/led-class-multicolor.h:105: undefined reference to `devm_led_classdev_multicolor_register_ext'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DMA_VIRTUAL_CHANNELS
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


vim +816 drivers/hid/hid-playstation.c

   808	
   809	static int dualsense_lightbar_set_brightness(struct led_classdev *cdev,
   810		enum led_brightness brightness)
   811	{
   812		struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
   813		struct dualsense *ds = container_of(mc_cdev, struct dualsense, lightbar);
   814		uint8_t red, green, blue;
   815	
 > 816		led_mc_calc_color_components(mc_cdev, brightness);
   817		red = mc_cdev->subled_info[0].brightness;
   818		green = mc_cdev->subled_info[1].brightness;
   819		blue = mc_cdev->subled_info[2].brightness;
   820	
   821		dualsense_set_lightbar(ds, red, green, blue);
   822		return 0;
   823	}
   824	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
