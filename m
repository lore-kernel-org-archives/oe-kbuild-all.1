Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A52242D66
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 21:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768165763; cv=none; b=hwxB5JWgbp2Wzf1mrwswvMEkvrpGgIoJgMbEZxZZocJQcePiXjTzrhI7qz+D0KtDIZO/4JjTZlAz6JM11VXSbEgiJed6uKai+5hH0otmSyyDXyiAfUVWhYMAbvZT36+rm3NUtr13JDgLUEi20SgqJZk/jI95MbFHFhHka5uqRL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768165763; c=relaxed/simple;
	bh=hPVV64FL6eMQY7SEz8pEwpEFr/VwTjJMGE3hvD0Fg/o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GN0QzAnVXuOu8l2vE/8BGCW20FwNyqHQW5mS0t9AFqvsGLLlZOzwdJuui/kHUb1AY8jUPwFajvzd9+Ib5li39vWn3mHdZ7C22i/EEEZc98Uqlkm38IAw8ZA7ZcYlVECoT+wFluckSSDcl6xjiVPVgs2ZxUpEANK1P0Xc8Vu99Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kp4cUKw2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kp4cUKw2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768165762; x=1799701762;
  h=date:from:to:cc:subject:message-id;
  bh=hPVV64FL6eMQY7SEz8pEwpEFr/VwTjJMGE3hvD0Fg/o=;
  b=Kp4cUKw2W4oYQfONPYcxbSRVKNX1qBILAb6uinIA7dM8zqAaMqWTf4+Z
   BQ8CKICVOsT7tlk8absuZ0HC48x7IvFfnB6+lGWm3SQbxvI5nCdO+2sRQ
   ylJW3rvkpEeJPpP25PcemgaQVmA4BdL+PjNS1O9wUs7Xa0vOE/7nCyl7p
   fJcL3MDkcmOwuUTAdFXhU8XJ6bLpdfpaihpd5fF8SCARJrm4GqJI6Pf8x
   OCmBSzaTvGzBqjHjVWZSU7WiatYYhrC5bR8dpfXU3zW1GqaEYXbL7M/Nx
   lVO9dSQBcQmHy1w6NQ9S5uRsYFbTBInEBMsPYpOuWEB7pHOhpkiDDBLE/
   Q==;
X-CSE-ConnectionGUID: rWWQlGlwS06D3zVWxPafLQ==
X-CSE-MsgGUID: hPrrgMkfRum/CUVw8ijZqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80170885"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="80170885"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 13:09:21 -0800
X-CSE-ConnectionGUID: v+ZdJ+r0Q4qCGau2wRJGvw==
X-CSE-MsgGUID: F7fo/N1DT56bZAuyOVQvGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234633703"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 11 Jan 2026 13:09:19 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf2gW-000000000UN-2yc1;
	Sun, 11 Jan 2026 21:09:16 +0000
Date: Sun, 11 Jan 2026 22:08:43 +0100
From: kernel test robot <lkp@intel.com>
To: Jeff Chang <jeff_chang@richtek.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 OF_GPIO when selected by REGULATOR_RT5133
Message-ID: <202601112216.V7BtW3E9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9c7ef209cd0f7c1a92ed61eed3e835d6e4abc66c
commit: 714165e1c4b0d5b8c6d095fe07f65e6e7047aaeb regulator: rt5133: Add RT5133 PMIC regulator Support
date:   5 months ago
config: um-kismet-CONFIG_OF_GPIO-CONFIG_REGULATOR_RT5133-0-0 (https://download.01.org/0day-ci/archive/20260111/202601112216.V7BtW3E9-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260111/202601112216.V7BtW3E9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601112216.V7BtW3E9-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_GPIO when selected by REGULATOR_RT5133
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=y] && OF [=y] && HAS_IOMEM [=n]
     Selected by [y]:
     - REGULATOR_RT5133 [=y] && REGULATOR [=y] && I2C [=y] && GPIOLIB [=y] && OF [=y]
   
   WARNING: unmet direct dependencies detected for MFD_STMFX
     Depends on [n]: HAS_IOMEM [=n] && I2C [=y] && OF [=y]
     Selected by [y]:
     - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
