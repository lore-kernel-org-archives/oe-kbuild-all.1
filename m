Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2591415664D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 21:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712179457; cv=none; b=V4cpDh9ugV+yyrS4PJVTn4T9WHYwNTq4EWLB06MEXTBMuXPBBou55+55uXu+XF+smr1dQykLPFa2wHrbcsNtD22DofVictyflLyEEAqDptHHkamlmFrnpEgHh7wXip1y87db23ATwW2/yW940Q32LY/4bCN1u/JgBbQ+g739IvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712179457; c=relaxed/simple;
	bh=Ml7BefblKX+Tyya7ObJ31AID52bLVq3nIchoIvsnRys=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZK1TEcNM0VZBJupPpjrn3teCC9UmpcM/K3HNxVUwMn+u9bHHnz9z3n/P8LdJQ4jY46AhewQHxCkkH94yx0Rh1yg2gsI9CeOwqXn83+mUghzGCsi0VpzkYYlbycychd5V3PURxMqDEqyEyHs+Z0Eed7D0vXmMzA8GwKNqV+HT7ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLUsBMnh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLUsBMnh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712179455; x=1743715455;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Ml7BefblKX+Tyya7ObJ31AID52bLVq3nIchoIvsnRys=;
  b=KLUsBMnh8m5rac6bJv2s975QNJnoX7VH2GzfJx+ZFOXZVC1Yb9YotZtF
   7F8ePcTN/a6GBd0NZRm+TOhZMS1REOa81pv/960KcaRtHuXWVGmiobMLO
   CYtDeZ54oQm2euWwTWZrcWrjwOp2tG66rixmEnTuxuPcc5HHVi+hsb77R
   9kwCTXXXFzYR6k9ecPSZGniEf7siKcs622e9APye3558Ef4pJS8/lgIhL
   XHsjLJX8aUe6SYox6eNd6bOlXmy13opVfweRM1VS4s6BohxoWHhp9+nPA
   s5rv/K3j/NYNNhKdK3zaiilQnWFwsOt0IXyw4cVdVt9NsW1QiAbWfugKc
   w==;
X-CSE-ConnectionGUID: 2oPuIP18T5+S3djCr33xow==
X-CSE-MsgGUID: DRA1++tcQeutdXRGU8sAcw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7575728"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7575728"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 14:24:15 -0700
X-CSE-ConnectionGUID: AMWYAByxTJaaoY1TJfpUuw==
X-CSE-MsgGUID: 4W3J/62NTiKxLVBOhqCUrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="19173906"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Apr 2024 14:24:13 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rs85b-0000Fi-0h;
	Wed, 03 Apr 2024 21:24:11 +0000
Date: Thu, 4 Apr 2024 05:23:32 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 45/107] kismet: WARNING: unmet direct
 dependencies detected for GPIOLIB_IRQCHIP when selected by
 PINCTRL_IPROC_GPIO
Message-ID: <202404040510.EBaljRIV-lkp@intel.com>
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
commit: cf0136753f9892c69092d959eb86c8e06e706138 [45/107] media: i2c: add DS90UB960 driver
config: alpha-kismet-CONFIG_GPIOLIB_IRQCHIP-CONFIG_PINCTRL_IPROC_GPIO-0-0 (https://download.01.org/0day-ci/archive/20240404/202404040510.EBaljRIV-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240404/202404040510.EBaljRIV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040510.EBaljRIV-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_IPROC_GPIO
   
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=n] && OF [=y] && HAS_IOMEM [=y]
     Selected by [y]:
     - VIDEO_DS90UB960 [=y] && MEDIA_SUPPORT [=y] && OF [=y] && I2C [=y] && VIDEO_DEV [=y]
   
   WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - PINCTRL_IPROC_GPIO [=y] && PINCTRL [=y] && OF_GPIO [=y] && (ARCH_BCM_IPROC || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
