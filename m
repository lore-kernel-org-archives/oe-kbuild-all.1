Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36EC1991B9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 11:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729597599; cv=none; b=DuyecqGTz7fbiyBbX7VXN/fn8o9KtoT4VWdl42MMQpPRm7c9vybkas2IOGw9UL18wHfHWzk52nCouR0ToVqCRzK8KHOih3k7LQSdMU7ypmqCXFDCDW3fOeL5Duwl1MVYX3kO87AFAFfBeKLE4Iyo8rsFwWPeU3sUGEInxhHgW+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729597599; c=relaxed/simple;
	bh=e8ZZUQ8KLrQWoianBGdgJ5KYKP0kTI7Eh++WiePNvJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d9uQ5nBKRdZckAMJ/rz4ojpQ6YlVjArbvzrgtdEHti5+NbvtrxTmNLSOsD8qZiSbYbUg0kUyP7mTcAcKXKMXj/9bHepy2FF1AE6b2RZ+GYErhqOAr5ffTiiIDyW6GpT8Kult9rlyYhYJqX3UuuCGuao3BPM/2X25O2LOVKZwv/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBrhDGpt; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBrhDGpt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729597598; x=1761133598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e8ZZUQ8KLrQWoianBGdgJ5KYKP0kTI7Eh++WiePNvJc=;
  b=QBrhDGpt+Jmoqwk629CVVonQbOI4G0PH7IrS17rvFkxvJ8aMVWsCUYbE
   5NqCATHlhn50ssPsBz3/I3Hrkb6YHyrl6iiaueiFyyFGo4F4tu4tRb5xP
   SpYF2mXyi8OoimNNlTKoHL/Nd6V1Z/P9KKLJWZAr/WAuhMvm/5x3yZG47
   7TfhJlEhlvVf99xVabpe4BkwUsr8GdFr1dum7lCPkWl8d1gQ4MjiY3U/Y
   8tGFALOe8gRbZZigWfLXPmxf3whCbsvNJQ0E0DOS6ZigMOnqmnCoKJCHm
   Of/xHTAVqeMcjnm7TTUC3xPWGEQrAeYvRQf5xOF0wJal0EhztJwE1UDbP
   Q==;
X-CSE-ConnectionGUID: uHaw6IMNQVyFTh+D0BU8BQ==
X-CSE-MsgGUID: OgroeifXRy2dN02ONp4Niw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29283699"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29283699"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 04:46:37 -0700
X-CSE-ConnectionGUID: 7raepmxVRVOkm69QLaS3nA==
X-CSE-MsgGUID: m8PHlqqzQmm2eansxKM6Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79404753"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Oct 2024 04:46:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3DLL-000TVe-36;
	Tue, 22 Oct 2024 11:46:31 +0000
Date: Tue, 22 Oct 2024 19:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2205/2444] kismet:
 WARNING: unmet direct dependencies detected for GPIO_PHYTIUM_PCI when
 selected by SND_SOC_ES8336
Message-ID: <202410221939.XVTbQQTG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: 39a3bb7fe802a8ed7a0d1bc0f6c10c1d6a80fd42 [2205/2444] I2S driver support for Phytium CPUs
config: x86_64-kismet-CONFIG_GPIO_PHYTIUM_PCI-CONFIG_SND_SOC_ES8336-0-0 (https://download.01.org/0day-ci/archive/20241022/202410221939.XVTbQQTG-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241022/202410221939.XVTbQQTG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410221939.XVTbQQTG-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIO_PHYTIUM_PCI when selected by SND_SOC_ES8336
   WARNING: unmet direct dependencies detected for GPIO_PHYTIUM_PCI
     Depends on [n]: GPIOLIB [=y] && PCI [=n]
     Selected by [y]:
     - SND_SOC_ES8336 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y]
   
   WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY
     Depends on [n]: PCI [=n]
     Selected by [y]:
     - VFIO_MDEV_IDXD [=y] && VFIO [=y] && VFIO_MDEV [=y] && X86_64 [=y]
   
   WARNING: unmet direct dependencies detected for SPI_PHYTIUM
     Depends on [n]: SPI [=y] && SPI_MASTER [=y] && (ARCH_PHYTIUM || COMPILE_TEST [=n])
     Selected by [y]:
     - SPI_PHYTIUM_PLAT [=y] && SPI [=y] && SPI_MASTER [=y]
   
   WARNING: unmet direct dependencies detected for PCI_MSI_ARCH_FALLBACKS
     Depends on [n]: PCI [=n]
     Selected by [y]:
     - X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
