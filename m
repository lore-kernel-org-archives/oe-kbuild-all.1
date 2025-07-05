Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC24D2E3702
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 22:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751754225; cv=none; b=RLgTLVYXErJ4bIhp+aF+8Fra1OYhLdEAAurmJjXf+BnmdVB2uSjMTj613tCJgckjc325Pp0b9BClw4Q1iLZ90ncQV0P6nRaZcWLqlm00oaaITs7gPzw0Jtjaqu/Ls99fk7TYOUpCLRypvC1LbGkgfQ57/sb16WjJWS9rQLTqDI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751754225; c=relaxed/simple;
	bh=HfkjmbdMuT0fbo1D/l7xPxY1MPI+B+Z4RCBKJ84kLK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LWG6difaBuKkbC+6jYFaGM0aDBy1uXR0GB4I25YgnFy0/8XsDgYAbmaVzpgsbo37R0E1i7wqG9DMcdG1b2EiHipZdyvax9LNraXTZH12emk8kib8BvHlw1Uif0aluLvenX74g6zs3U6O1jNbvuQw0Ni2X2hQYnJZ4ia65VN3jKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SsBvrI4B; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SsBvrI4B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751754223; x=1783290223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HfkjmbdMuT0fbo1D/l7xPxY1MPI+B+Z4RCBKJ84kLK4=;
  b=SsBvrI4B9AC9mC7gokJ4+4KI8YP4X337aDY3TpIeQnBqRP7czhJv+hxG
   HONZqpQN65jGhhvXdT8lW11p5e79ntM6YSoZ3/jbzd44eht9YLelAESOi
   ceyiBEhpOLYUiCRh0XZ/PyX11GozISv5fRuClvvjpMBzhb4S5KuESkrlU
   W8Nk3OxdK9Dq9xRM4pgpdAQbG+Pf+GkUbxPN1wpiQhM9yJr9b+RHWK3Mx
   Z/xEfaDoLKdeVBTtDdEGkw7Pp68LUYoz2wLU2YhemMEkvNuefYlEnc9s3
   Mp3jtGX7xPnxAz6seyBMGsW1TyqXbR5gbvd/0dD9BpVONmnA+Aypb/FwK
   Q==;
X-CSE-ConnectionGUID: 19W6jlocTGGUhmMJyOO7+Q==
X-CSE-MsgGUID: 5WQ5FaQ4RbqnP5HXF9N8Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="64622720"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="64622720"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 15:23:43 -0700
X-CSE-ConnectionGUID: OwO1nFgXSfKMAX8nY/q+fA==
X-CSE-MsgGUID: S2o3FCrGQj6tkQcKJMM3Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="154628519"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Jul 2025 15:23:41 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYBIJ-0004kB-1n;
	Sat, 05 Jul 2025 22:23:39 +0000
Date: Sun, 6 Jul 2025 06:23:08 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: [linux-next:master 952/7381] ERROR: modpost:
 "devm_gpio_regmap_register" [drivers/regulator/rpi-panel-v2-regulator.ko]
 undefined!
Message-ID: <202507060637.LfSd4z0I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
commit: d49305862fdc4d9ff1b1093b4ed7d8e0cb9971b4 [952/7381] regulator: rpi-panel-v2: Add regulator for 7" Raspberry Pi 720x1280
config: alpha-randconfig-r113-20250705 (https://download.01.org/0day-ci/archive/20250706/202507060637.LfSd4z0I-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250706/202507060637.LfSd4z0I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507060637.LfSd4z0I-lkp@intel.com/

Note: the linux-next/master HEAD 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_gpio_regmap_register" [drivers/regulator/rpi-panel-v2-regulator.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GPIO_REGMAP
   Depends on [n]: GPIOLIB [=n]
   Selected by [m]:
   - REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2 [=m] && REGULATOR [=y] && I2C [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
