Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737601FA4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 02:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733280882; cv=none; b=Gjosyi7Hg+4uTf8oP34oigzaVyBSerj09mk06IIrAEKNLYfG/O1lUZo3JBHo8g6L2wDvHlg9qnQmwmRXX5TiK+HuvGOXEp5YJptOalPn/iu6r7/jHBRmLVA1X4ZnLZKXGIV+p5jHK6wXXFRwYZZ4UFh8W6oTwWPMvlFz/qvdzgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733280882; c=relaxed/simple;
	bh=LRl4G7TRCgTgw9JuMVqSS6aRE0lJZDpNIwgoAsJWTw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=datqwdB5dLhkRRJu4mWE8CmHwMtewPDEvVY2aQ8/vs7xX/tXKs0KoKB+WQR4zsD2DC6Hb7GPe/xk7KHLUi1XLquIV8JSIPWLoG8EohPX3juLSaqt0q9lCihFtD8z4e2ZRnCs/v4CTUs9cVtfByMYaT8o3EEpojYrtqtF9PFwpJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGLfM+MW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGLfM+MW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733280880; x=1764816880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LRl4G7TRCgTgw9JuMVqSS6aRE0lJZDpNIwgoAsJWTw8=;
  b=TGLfM+MW8aTvdKgWYMHVpnHtDMB/d7DEgO/GAnhL8ImPoQHNNJxfRaJM
   4n/Y+y0l/wPcRfvcNrFjSG1hT/P9Bo4eI0XjJd1D8KtW0NR3XlIh6nUxD
   sI6xSrq2iAbbHDD0INwOJdwPbtH3wf9LDvIvJHiQyNLc6kcC6sxs4wRml
   mnMtIeV3yI52sol0ExksUPZSL3P5F7p+Dtdx4WGupbMcNFRAHHLdHCXFz
   f4f0eToBxcQoQS6Um3IVHsQfuj377qNf8ZBQRH4oawAGGHFbLQ1BpEwq7
   4+O7GLlxdYGDPY3ImGZ+W329zSPZsaLDwUev0waMr1Wc9YC76Z+Tfk4If
   A==;
X-CSE-ConnectionGUID: KtgbGsJFR/uA9fEHEufw6Q==
X-CSE-MsgGUID: 0KvCItfHREChUQJ4Ni1Z1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="21112759"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="21112759"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 18:54:40 -0800
X-CSE-ConnectionGUID: idjb7xKMRGunldP2znDRDw==
X-CSE-MsgGUID: 4Bh04r5/Ruy62uNcg/3W7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="93517764"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 03 Dec 2024 18:54:36 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIfX8-0000cK-0x;
	Wed, 04 Dec 2024 02:54:34 +0000
Date: Wed, 4 Dec 2024 10:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1] kismet: WARNING:
 unmet direct dependencies detected for GPIO_PHYTIUM_PCI when selected by
 SND_SOC_ES8336
Message-ID: <202412041021.kAtohtWa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   f1811f6442501fe34d2339158aed4f85a64f0398
commit: 39a3bb7fe802a8ed7a0d1bc0f6c10c1d6a80fd42 [1/1] I2S driver support for Phytium CPUs
config: arm64-kismet-CONFIG_GPIO_PHYTIUM_PCI-CONFIG_SND_SOC_ES8336-0-0 (https://download.01.org/0day-ci/archive/20241204/202412041021.kAtohtWa-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241204/202412041021.kAtohtWa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041021.kAtohtWa-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIO_PHYTIUM_PCI when selected by SND_SOC_ES8336
   WARNING: unmet direct dependencies detected for GPIO_PHYTIUM_PCI
     Depends on [n]: GPIOLIB [=n] && PCI [=y]
     Selected by [y]:
     - SND_SOC_ES8336 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y]
   
   WARNING: unmet direct dependencies detected for PINCTRL_EXYNOS
     Depends on [n]: PINCTRL [=y] && OF [=y] && GPIOLIB [=n] && (ARCH_EXYNOS [=y] || ARCH_S5PV210)
     Selected by [y]:
     - ARCH_EXYNOS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
