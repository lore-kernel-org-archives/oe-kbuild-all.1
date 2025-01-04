Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B329B14A0A4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 06:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735972149; cv=none; b=JauikbV+cjAqKhm/gCMKCdcAn+5GuLbLTlsAqPvsDJ+xJIjAWf4+A0H89y7IBruYOGtGL4YASyBU4AKWScgPJC5dumSMc4rPMsleFL+N+ehx5tqYLJjsva5YwXe9bZkM3YkvicPljzX8X+OEVX0qq4EZJR43IkTbShlDj2f6zKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735972149; c=relaxed/simple;
	bh=/UbUTM6q1uBtMoFesrut1AImlBGKwio6740rueDhcuQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MQJe7TJNteY/hW3geR2vkmAeFn+QtFQjvfON58T3w64AJPHgylyrSYYAcFLyss/dnIdxFkjqrP106LAK7XlxTgNQPNI0Wq/HwuWzgUrl/x+IlR9jy+sdoUaebkhCWSUgH6rzT7WdjQZD8F3RRpzlIBhzgrSwmQgqFH037fFaCWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7XSgRww; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7XSgRww"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735972148; x=1767508148;
  h=date:from:cc:subject:message-id:mime-version;
  bh=/UbUTM6q1uBtMoFesrut1AImlBGKwio6740rueDhcuQ=;
  b=k7XSgRwwO3HiwQtpzgrl1YW0KSbWQECQGSih0Up10rFu6Y1Z+zEBtgrE
   Uss2nGc0yvAiqlGJ4MbLh9ew0LT8yjVYY/14lwKAEC2s9ELSmPuPHiyOA
   KKBlqfXqdNGYZW2n5OqdXld/e1Gs+n/52PmAwrHQjDxljoO2YxT0nk8YO
   Rxm3gF3tKrHxlSEGwwYakrUP5P1+9NKR93n01yV+2Vmalt3P9nC+sIn3h
   LNCyIGZCSJPMrTTx8eMKEhJmaFjx6fPLIAr6LagzGzchH63z7h/aasVYK
   s6VmBEQbLoiFCo6BrwJTfsO+ZoFcysB5OQAmdcYTOrq3HaVvATmRA87XK
   A==;
X-CSE-ConnectionGUID: 20MPCR0bQMC/xDRdNpyO8w==
X-CSE-MsgGUID: D+p6aiIHTfq+AAa1tJdVrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="47191716"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="47191716"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 22:29:08 -0800
X-CSE-ConnectionGUID: huyzRWjlSkmUZ3bkAsDtxg==
X-CSE-MsgGUID: I2biKUHdR/22Ua9qLQ2/+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132879355"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Jan 2025 22:29:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTxei-000Agp-15;
	Sat, 04 Jan 2025 06:29:04 +0000
Date: Sat, 4 Jan 2025 14:28:29 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/comedi/drivers/ni_atmio.c:210:35: warning: 'device_ids'
 defined but not used
Message-ID: <202501041400.RwJiM5Yz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   63676eefb7a026d04b51dcb7aaf54f358517a2ec
commit: 8ffdff6a8cfbdc174a3a390b6f825a277b5bb895 staging: comedi: move out of staging directory
date:   3 years, 9 months ago
config: parisc-randconfig-c44-20220907 (https://download.01.org/0day-ci/archive/20250104/202501041400.RwJiM5Yz-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501041400.RwJiM5Yz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501041400.RwJiM5Yz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/comedi/drivers/ni_atmio.c:210:35: warning: 'device_ids' defined but not used [-Wunused-const-variable=]
     210 | static const struct pnp_device_id device_ids[] = {
         |                                   ^~~~~~~~~~


vim +/device_ids +210 drivers/comedi/drivers/ni_atmio.c

a8b774308dd803 drivers/staging/comedi/drivers/ni_atmio.c David Schleef 2009-02-12  209  
08680307eb876e drivers/staging/comedi/drivers/ni_atmio.c Ian Abbott    2017-03-08 @210  static const struct pnp_device_id device_ids[] = {
a8b774308dd803 drivers/staging/comedi/drivers/ni_atmio.c David Schleef 2009-02-12  211  	{.id = "NIC1900", .driver_data = 0},
a8b774308dd803 drivers/staging/comedi/drivers/ni_atmio.c David Schleef 2009-02-12  212  	{.id = "NIC2400", .driver_data = 0},
a8b774308dd803 drivers/staging/comedi/drivers/ni_atmio.c David Schleef 2009-02-12  213  	{.id = "NIC2500", .driver_data = 0},
a8b774308dd803 drivers/staging/comedi/drivers/ni_atmio.c David Schleef 2009-02-12  214  	{.id = "NIC2600", .driver_data = 0},
a8b774308dd803 drivers/staging/comedi/drivers/ni_atmio.c David Schleef 2009-02-12  215  	{.id = "NIC2700", .driver_data = 0},
a8b774308dd803 drivers/staging/comedi/drivers/ni_atmio.c David Schleef 2009-02-12  216  	{.id = ""}
a8b774308dd803 drivers/staging/comedi/drivers/ni_atmio.c David Schleef 2009-02-12  217  };
a8b774308dd803 drivers/staging/comedi/drivers/ni_atmio.c David Schleef 2009-02-12  218  

:::::: The code at line 210 was first introduced by commit
:::::: 08680307eb876e389e068ae75f6f6a84248e2263 staging: comedi: ni_atmio: make device_ids const

:::::: TO: Ian Abbott <abbotti@mev.co.uk>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
