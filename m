Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D864571B27
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 09:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712222022; cv=none; b=TeDFlqilmtLYfkuw08Dr97T26VpHhkVMIASVkkQhzjrm4FelqFX9fEPsWSm1z0fSQQxjQsfwackqkB5b3etBwedFL7Ny9HBBJD25B6RjfPfsZAbcrBcBu9vJMZEu/idcXWpjDANB0/BuKW3xQp+kUROYeauv4LrtrRmgOvD0img=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712222022; c=relaxed/simple;
	bh=/hzYyEx4ma+WxkRNTPUUWoF3fjUqBeLVipW6614eIuY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=klXCRA1cdJ3rzg06lendiNdHY8L4+r9Jb00a7qOE12MQ43o1vMDjQ39C8p8reGgQVcv2wLg1VHsknKnJ5GNFX77TOoV0TM4iEccIFUp2wptiD6qULbavtaQ2EZs2w39+BaBjtVQgzR+CDmiMb5PRaqR5asjnR+izBw0tS1149Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTeWVurB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTeWVurB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712222020; x=1743758020;
  h=date:from:cc:subject:message-id:mime-version;
  bh=/hzYyEx4ma+WxkRNTPUUWoF3fjUqBeLVipW6614eIuY=;
  b=NTeWVurBmO+ylm065HdTGB3OO0QKPCmfDhkUj3DoS0avkJvwKECtXhwt
   YG4IvwZMvyj/KTx6JYM3mcDexydiTJbO5AM6vfKWN9X0JRdqgoQZUYHwH
   kNzz4s6QhI904K1UWmsTXzBypeAA0TypCBcmMSihxJWgamxA/xW/PQ7Zc
   3yn5LrXMhS0HVfMCHyCvaWen89I7AdUnq6gL4+L5RQHKwUWylsC1nA+uN
   fM9jddHw8+/0ymPqDlMYGPwN7DoEXdHyl4EXBhBpLP9ns9S/vs536NHVR
   g2REMSj+Vi2yqijp0UWIxwuJQfxPW3o1vaRDfJfBXJjR3CtdCZ+9FFQRu
   w==;
X-CSE-ConnectionGUID: OcFpueSLSjGnheVGhKpUdQ==
X-CSE-MsgGUID: pmuHrDVDSAa46BADS3qV7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7332641"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7332641"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 02:13:38 -0700
X-CSE-ConnectionGUID: pwUSTlohTGihf1Hl5Qhr1g==
X-CSE-MsgGUID: eaEYxl0cSNKcv6KWSTSyAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="23372618"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Apr 2024 02:13:37 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsJA7-0000p7-0u;
	Thu, 04 Apr 2024 09:13:35 +0000
Date: Thu, 4 Apr 2024 17:12:46 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 47/107] kismet: WARNING: unmet direct
 dependencies detected for OF_GPIO when selected by VIDEO_DS90UB953
Message-ID: <202404041730.vcdCGg0O-lkp@intel.com>
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
commit: d1a221d48b45bc73a80c3e86a028dfe60f8a34b2 [47/107] media: i2c: add DS90UB953 driver
config: alpha-kismet-CONFIG_OF_GPIO-CONFIG_VIDEO_DS90UB953-0-0 (https://download.01.org/0day-ci/archive/20240404/202404041730.vcdCGg0O-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240404/202404041730.vcdCGg0O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041730.vcdCGg0O-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_GPIO when selected by VIDEO_DS90UB953
   
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=n] && OF [=y] && HAS_IOMEM [=y]
     Selected by [y]:
     - VIDEO_DS90UB953 [=y] && MEDIA_SUPPORT [=y] && OF [=y] && I2C [=y] && VIDEO_DEV [=y]
   
   WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - PINCTRL_NSP_GPIO [=y] && PINCTRL [=y] && OF_GPIO [=y] && (ARCH_BCM_NSP || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
