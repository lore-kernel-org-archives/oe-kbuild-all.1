Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDA4146D5A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 23:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728776427; cv=none; b=FJS6iZrQWj5msEexe+Q3QO142FdFKU7k3bWgy+3902zhL66WRe7yW2yKHywRLOSc282Txso4BN7/kMIZRl+JdMjIPF5D8TnUtm9Bf+CUdx8sM4BGU7RK2b4NXAj+pBkmWFARdVpk45P1d96gg3UJ7Ws8NAChLJvM43lX20cPcxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728776427; c=relaxed/simple;
	bh=6iLHxCBmVZUWmq3bX2dxlvgfac92uSNUQqhnmVC/aUY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ci0TAlK7hUkKUeRhi5ghxZrhKR+YCZNBEowGBhtGIOGHWRUiOTccvDyCceOuzYiA3G7zVQigMdB+140OvW2vj4ai1DaeWmkzSyyxC4SHA9IQulmx67XUxaZloJabvtfXPGS8dBFQRGC+V51HsuOaXnJUnOI4HBmutVVfvDd+HZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ynn3OtN9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ynn3OtN9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728776425; x=1760312425;
  h=date:from:cc:subject:message-id:mime-version;
  bh=6iLHxCBmVZUWmq3bX2dxlvgfac92uSNUQqhnmVC/aUY=;
  b=Ynn3OtN90C7kdYvF9dPOPPPeuWOSZcuPLMZdIvy6ayqxDx+rn8MGYorl
   sMYw250v21YR/5I6VtG3LmtA17afqNUqGIsBbFSFQXVJ3ALAeEydYN2l9
   PNfNbgtIfm+F79jLxvlTZjHOXlyNGe5DBgNlVxC+FSgIDUe8ciRqE0E62
   2kOqhaW/2ZBlpxq1on1XYp7Iq/bBGOJn7+Q2SKeQ5k40I5zwUHtCehSt+
   OD+Y+ETjV3xg10ZtpF4FekFH5kB4HpmPUB7PGFCxgR8iFOXdd9ufl5Mna
   eAEqPY7Y4nnhxT3by5kSUaX1bDazfljxmE+iJhKaAVW/lPDVbdPvz7tw9
   g==;
X-CSE-ConnectionGUID: DIeebei3QkirNeQ0lQVnNw==
X-CSE-MsgGUID: 7W3BRSVGS9q+BmsO05Pjug==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28281585"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28281585"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 16:40:25 -0700
X-CSE-ConnectionGUID: C6rm/yRRRWu6Q48HIR/yeg==
X-CSE-MsgGUID: gkOGHoYMRwymekyblpV+Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="77326704"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Oct 2024 16:40:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szlif-000Dr9-1o;
	Sat, 12 Oct 2024 23:40:21 +0000
Date: Sun, 13 Oct 2024 07:40:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 45/107] kismet: WARNING: unmet direct
 dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_STMFX
Message-ID: <202410130734.msHfpn3i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   451df8c0a2a3bcf0656b2f6fdc49d6fb4d05f186
commit: cf0136753f9892c69092d959eb86c8e06e706138 [45/107] media: i2c: add DS90UB960 driver
config: alpha-kismet-CONFIG_GPIOLIB_IRQCHIP-CONFIG_PINCTRL_STMFX-0-0 (https://download.01.org/0day-ci/archive/20241013/202410130734.msHfpn3i-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241013/202410130734.msHfpn3i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410130734.msHfpn3i-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_STMFX
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=n] && OF [=y] && HAS_IOMEM [=y]
     Selected by [y]:
     - VIDEO_DS90UB960 [=y] && MEDIA_SUPPORT [=y] && OF [=y] && I2C [=y] && VIDEO_DEV [=y]
   
   WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
