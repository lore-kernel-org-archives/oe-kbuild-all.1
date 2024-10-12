Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07E8C2C8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 21:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728767843; cv=none; b=PDHDvqBIJayspswECMlNkaDMngaRuE2oUe5ALobLyDqhzwNRbi+V5Eh4QsFhhYxLy5g2BRdMltiEWXhGFkpMjqbqGFjetUdjNLDJ2zF+acBhSJ7N/V6vhd+QpgwXDBN0utVRwhQ2OXpprUlm/7QtlE6lY5o0Rjx1A1Yk1QJou0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728767843; c=relaxed/simple;
	bh=lFUYYuR+hWj4VyjSLihuXW6nGirDbcD7rM76lQ2qfKw=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mpQDOiRtWKDsl1g+IHFHWOiO2h63NYoIQ9ATZ+hJDRVkPXD8p0wnUgfmW892OU/pcuYtu6zuB6pI4Zte/fZhdVhifzttJu9WWwnqH5tGJj8pitXac+UXQTmRfSuO6xkDFwC8fkZZJ1kqSfN59rp+9kLwfad4Vr88D8P69Lt3bkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F3Gvx0JS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F3Gvx0JS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728767841; x=1760303841;
  h=date:from:cc:subject:message-id:mime-version;
  bh=lFUYYuR+hWj4VyjSLihuXW6nGirDbcD7rM76lQ2qfKw=;
  b=F3Gvx0JSCa7uzqEUT5Cd5p7MRtTNjFUydDh2WRe8lgT4qmUe+qj8/Pd9
   sRXn3vTm+iWeOgKZkO9gAU3Fp3p8LsbLdprjJsex8etCcUI4w0oI0fPhF
   3baLiMPfSli5ddeWLtX/Y4SmKIWmEjPnuQgw1rRo4u8y2R0zfY57x9qP3
   TrCQakHxZpeRYLrqYL2BaHMO83RH+GYr1jJTQ2i/uRPI0g8Gd8ii+gpH1
   LMqf7ylkMVHxNp05P+GOcUOOIYRu9lKtddN4k7TOWo9dNIjRDvHxo6la5
   zZpD5NcNX6OIEFD4nHFjzy4m5ToOmwmtkcnpIWyJFcVb8FO5WZfqr9hJd
   w==;
X-CSE-ConnectionGUID: kpfZZWaiSK67AycGgtqeiw==
X-CSE-MsgGUID: OQ999PN3TxCyCxWdokh4fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28027818"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28027818"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 14:17:20 -0700
X-CSE-ConnectionGUID: EJwT96BWTaqO1g3dshaOxQ==
X-CSE-MsgGUID: o1edETRSRrivQ/nUCpqtNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="77227121"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Oct 2024 14:17:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szjUC-000Djz-38;
	Sat, 12 Oct 2024 21:17:16 +0000
Date: Sun, 13 Oct 2024 05:16:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 45/107] kismet: WARNING: unmet direct
 dependencies detected for GPIOLIB_IRQCHIP when selected by
 PINCTRL_IPROC_GPIO
Message-ID: <202410130501.8tbWOZ1z-lkp@intel.com>
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
config: alpha-kismet-CONFIG_GPIOLIB_IRQCHIP-CONFIG_PINCTRL_IPROC_GPIO-0-0 (https://download.01.org/0day-ci/archive/20241013/202410130501.8tbWOZ1z-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241013/202410130501.8tbWOZ1z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410130501.8tbWOZ1z-lkp@intel.com/

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
