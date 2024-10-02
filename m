Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84D017C96
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 05:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727845495; cv=none; b=gy/QEXe7Tw1awEMtZNig8oTGC9oqTD8WPrBBbDWLrWJhC3zOld3g0RdxNeGN7lsGbQNJvPj77S247KFPwx4SSBv1SyXaflBbnSiFvxNZi9ZJM8Omw4ZuSOWhZcvt/oNKVC4EoAaNUYrW7dl5sPfQil51mUryz99kx4lYDX0Ezgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727845495; c=relaxed/simple;
	bh=nbkSVul/VSsOce4hF8kPzebkmj1O2r9H9hNBu3uVtgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kMX+KgI/oLHYmtq37DOp5+0zXVYVTp6gLK4LwBaRkevRDlNjhbvS770RHOrc0qJM3EsXz4LcA/ivatPrqtP77Sz1MVaOxjAJKL1xWj/eEm3cTtTjfx2hgIu1pTMAbtY7MS0jtywkogc7ApBXm4c7q4GKn84oNn3odYA3DdqRPx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/C4f7Xh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/C4f7Xh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727845494; x=1759381494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nbkSVul/VSsOce4hF8kPzebkmj1O2r9H9hNBu3uVtgU=;
  b=G/C4f7XhD3H4XX0tZ55VurjweRFfonfrdh9vi4cTf96LQGDd3zjWk0aY
   LvLxGDZx8+Q9s4Je4kri2PS8R3Mg+2V/jJis/BCHZL0HXw769xy0eo/o3
   lePRriyr3GaxE3PhGePiaN5c2V/bmdHeRHc3dq3T0JHjKc2cSRNP0enAd
   /iVL+nEVzHZlWsmOVVFw5sYW03rcrovfruGlwcT7KDApnu9FrQZTTe6Hz
   y/V6qwTt1i51ILLioIqNeeuinycmytINBHfdZXDxKDR2YZzgoX++s23Jt
   QgKUVMjYdd9Y9lv96+51xiF1+wdZv4DvovuehgNIHTHew2eth0P5CupPS
   w==;
X-CSE-ConnectionGUID: iM2PGE8qQMGNNuIv6PpKGQ==
X-CSE-MsgGUID: HVnkOU3bSRWooplAPi0iAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27137272"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="27137272"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 22:04:52 -0700
X-CSE-ConnectionGUID: RS/Vign1TLuCy7J2hOsSxA==
X-CSE-MsgGUID: zH3uQn1QS9WYv20h9Atuzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="78758833"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Oct 2024 22:04:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svrXc-000RYt-0R;
	Wed, 02 Oct 2024 05:04:48 +0000
Date: Wed, 2 Oct 2024 13:04:03 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/060-spi 2/2] drivers/spi/spi-apple.c:536:3-8: No
 need to set .owner here. The core will do it.
Message-ID: <202410021205.nzN4OS4q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/060-spi
head:   4b8e6943df49c1fa24ce62dccbb4849390c986a8
commit: 4b8e6943df49c1fa24ce62dccbb4849390c986a8 [2/2] spi: apple: Add driver for Apple SPI controller
config: alpha-randconfig-r053-20241002 (https://download.01.org/0day-ci/archive/20241002/202410021205.nzN4OS4q-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021205.nzN4OS4q-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-apple.c:536:3-8: No need to set .owner here. The core will do it.

vim +536 drivers/spi/spi-apple.c

   531	
   532	static struct platform_driver apple_spi_driver = {
   533		.probe = apple_spi_probe,
   534		.driver = {
   535			.name = "apple-spi",
 > 536			.owner = THIS_MODULE,
   537			.of_match_table = apple_spi_of_match,
   538		},
   539	};
   540	module_platform_driver(apple_spi_driver);
   541	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
