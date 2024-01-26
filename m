Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4E811709
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 06:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706251840; cv=none; b=HSS6S01z/tZ1xCtLKzA+XkqssYATyujgYMgNqLtolL+vuk/MYUUEo0yFR0YK8F129N7C+DvmnOeg51tmFjZ14GJoxtRrts3j9b/rIO5LLeFmxeXdYh8LV/09pxiBTxmffDO18wKzoaPDkHMLdWNqdj9Eukr/ZK4tQ3CiI/G+MzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706251840; c=relaxed/simple;
	bh=ilJmr6JizMGS86r9oNqEZZGNT3MjvnJrLpJjpB0rSco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dWjtvojr/JzeaHJkPGkTkNfvP8J5ZZsaO8QMIj4ko8RY5rkotxWdOorqLKCjAN9+lFiSS7GgN8h5cYOQPyhDLNVh4kJf4SQNsQBE9XFBZfw3hyX/9n8Co3DWKhRsfrQzTi7nkoCux6YeH2T31wE772mMLb8pzxC0fcMpR/WZ3uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZW26Kmem; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZW26Kmem"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706251838; x=1737787838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ilJmr6JizMGS86r9oNqEZZGNT3MjvnJrLpJjpB0rSco=;
  b=ZW26KmemcmWLyJ8qVk8I/C5GYaGV5hOAKzkxydujfMOLNoyCutvnCy1e
   qevG2syAcqD+bdbMCpoPjf0Lb8Tv96n/OLC7dmOJocEN3pknUTWQt2OOd
   fk3xMW6onY3YiGvHHfM8a1WCRfNxbTgr0G3N1OAomWXvPMkPFDhImnfVX
   IlksIldbBmD3x4cWurblh+aFULcmRxxeJQZCkoJdHQxj3gd4Pv2+AKUMJ
   /sDoR+EIceMCpMrNxAf8/6vDDaesW+OCEyXidN7i1E3awWTqanj6kknW0
   Fpdn0F1m0B2/tHuqnSJrtvXSQm2GBBdWs6qrBZ/WyEN+ckv9TqC3uj3RH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="15929443"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="15929443"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 22:50:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="736598442"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="736598442"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Jan 2024 22:50:36 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTG2r-0000mg-2R;
	Fri, 26 Jan 2024 06:50:33 +0000
Date: Fri, 26 Jan 2024 14:50:05 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/060-spi 2/2] drivers/spi/spi-apple.c:536:3-8: No
 need to set .owner here. The core will do it.
Message-ID: <202401261418.Qeh6Konz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/060-spi
head:   cb3e63c65d265833e5a6f2d5755af21770cd3368
commit: 48f560decd6df17a2b1ada83651b2e4e937e8d02 [2/2] spi: apple: Add driver for Apple SPI controller
config: powerpc64-randconfig-r052-20240126 (https://download.01.org/0day-ci/archive/20240126/202401261418.Qeh6Konz-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401261418.Qeh6Konz-lkp@intel.com/

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
