Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7511C6B8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 02:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712198746; cv=none; b=pFOGQJwO2HyC+gjUYRyNEEX9ty1Abpbz4f8Fb6eA8c1VKJPEmZIY+jD7nUctNk88jud69Se1p3EGNDvE0P0gZ+9zDc+vUNnu3kdnD/hgDZFC5OCCG/G1U8K4TPH05sAM50C+HneON1uG0Poko/Si5dQGmOcHNYhFPYP32uF0tTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712198746; c=relaxed/simple;
	bh=5BsX06TMfBSlmE/t7DnrJSITMRuR2CgzzZG8uiVQISw=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pUiQEfBfpAHu8lWluCIqlrfqHgTusCakHgg4aHa/YTPyhMeaaZxCSauB5EdzIWR17IwaRIzk6fNN9+4tmtJyPNPH4ezfj6XbPSFYeui+qkBLUlhx4p+BdPHU5fOt7lODWs+B3cFWlUV1Q5AAPBFAtlZgSAXjnTkQ4LqjiRT8ZcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TVj58v0X; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TVj58v0X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712198745; x=1743734745;
  h=date:from:cc:subject:message-id:mime-version;
  bh=5BsX06TMfBSlmE/t7DnrJSITMRuR2CgzzZG8uiVQISw=;
  b=TVj58v0XpN00j/nfSqpDtH8oHPf4kMeTG+HXQUsdrS3K5VLhL9x/RYac
   HDWndndVLeWPWBivTIesn3bxV+k8MlnUG7AbUj7h65r1o697/flem333V
   Pg4R44WhPy0kmJUZDVnPXr2Q1LAhb2gYdsZwo3CFnQldtIl6u7Anz1ORy
   4OIzO1EphWjUQ5vuEMMgT5IwlSpeQLoMp2kBeNE1iti9TXvb8YOJ1rf1Z
   E+Wef+GA6ECdpJoQTnhcDTRF5JSPUHiYHdD9vArHOYwZjG2gfPeS0usCX
   Fjx/Z2uSNhsf/IM7Dl3+vJAuoyz0qDzA+ODDZfHooDQDvLn2ruHmOX+jo
   Q==;
X-CSE-ConnectionGUID: 7viFvO3jQA+oHdUu0F6iiw==
X-CSE-MsgGUID: Pv/DNGNqR7qhPGj5+K9gQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11237560"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="11237560"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 19:45:25 -0700
X-CSE-ConnectionGUID: y+8ZsSA2Q7K/W4dZ5cYd6Q==
X-CSE-MsgGUID: WfuaKgDgQpix1h96GSjyPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="23390864"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Apr 2024 19:45:22 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsD6O-0000W0-18;
	Thu, 04 Apr 2024 02:45:20 +0000
Date: Thu, 4 Apr 2024 10:44:52 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 45/107] kismet: WARNING: unmet direct
 dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_STMFX
Message-ID: <202404041018.9FKNwuNB-lkp@intel.com>
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
config: alpha-kismet-CONFIG_GPIOLIB_IRQCHIP-CONFIG_PINCTRL_STMFX-0-0 (https://download.01.org/0day-ci/archive/20240404/202404041018.9FKNwuNB-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240404/202404041018.9FKNwuNB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041018.9FKNwuNB-lkp@intel.com/

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
