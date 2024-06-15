Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A924414
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 07:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718437552; cv=none; b=HKFNed/4OYDBicG37O5oTxH1DwlWYHrjQNrZKhSKlOdo6N0acAcuFHAIfESZMwLh82xuvXPLEg4LmvGw4q86DBH8trVrHE7EDWPL0LGjeVkUVWtGJL+0Xmr3KFbx+jyTun/LJyo4mQzlCqHKScU6bLCIXWUuZPxzEa+8kce1qRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718437552; c=relaxed/simple;
	bh=u0GQ+7LYv4pVK7fxR2M76vSDueK171BGQGp4VYK0nhU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mBbWMVTh20CK8P4NRFBFfbtF7C/lrZ8OfTQHdDEPduaM7Q+v3+iIuNrK7wK5T8B6GKnQhnSNPNTi6Gy0dKwYuMz3wQTn/Sxbf53EuEsqXDiU2sPRK7m+wQFjfKB7sRYzv12hKmyKBHU1+nU6DyyeIW8K3q9amt0DU6KyG2vSBUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBrMHhHR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBrMHhHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718437550; x=1749973550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u0GQ+7LYv4pVK7fxR2M76vSDueK171BGQGp4VYK0nhU=;
  b=mBrMHhHRTqCqzP3jkofXsXS3ds4gVXpq4QY5IxFJwJRs2oYpg3Kw9Sj2
   dUC6qxnil9pbkxj//b6KzjffAxOgWASwNDXOjmmIiNHyAxbKDOXNddHb1
   mbjYUE0pE1knLJ/8QzAOCiAaedKHAoB5pvHHrMV7oOsNAhWvR7X1q+ciB
   Tzv669djCU2BMav4v9nX2f1NlAPyjDmi8je7iPf2lbAhjq56KchRRNPXM
   KOxhok2UPNPVwm5FoFwL5SQ7hd7GRC3yjywfdI89Csx85gV137NMxyQyk
   d9dZ0BLfq8u7mWVAJ0B7XHhsXAeHlvNqXXzqi4v9uLxOmx1qwm3CYfBkp
   w==;
X-CSE-ConnectionGUID: VqPRGAsrSoahz341GQYpcQ==
X-CSE-MsgGUID: +kj3nLhpSPOhANvfzm2baw==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="12087973"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="12087973"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 00:45:50 -0700
X-CSE-ConnectionGUID: cd/a4JoqTg6rjOCzntKI0A==
X-CSE-MsgGUID: Qmyps+vWT56emz9ACz/NlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="41405371"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jun 2024 00:45:49 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIO6c-0002Kj-11;
	Sat, 15 Jun 2024 07:45:46 +0000
Date: Sat, 15 Jun 2024 15:45:18 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:const_driver 16/23] drivers/sh/maple/maple.c:779:18:
 error: initialization of 'int (*)(struct device *, const struct
 device_driver *)' from incompatible pointer type 'int (*)(struct device *,
 struct device_driver *)'
Message-ID: <202406151553.p4VrrmH9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git const_driver
head:   158a3753cd10fdbb78a7abe66a8b70d5408ba7ca
commit: f17ab078e7c67e5579df87737875f784f98b4bce [16/23] driver core: have match() callback in struct bus_type take a const *
config: sh-dreamcast_defconfig (https://download.01.org/0day-ci/archive/20240615/202406151553.p4VrrmH9-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151553.p4VrrmH9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406151553.p4VrrmH9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/sh/maple/maple.c:779:18: error: initialization of 'int (*)(struct device *, const struct device_driver *)' from incompatible pointer type 'int (*)(struct device *, struct device_driver *)' [-Werror=incompatible-pointer-types]
     779 |         .match = maple_match_bus_driver,
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/sh/maple/maple.c:779:18: note: (near initialization for 'maple_bus_type.match')
   cc1: some warnings being treated as errors


vim +779 drivers/sh/maple/maple.c

17be2d2b1c333e Adrian McMenamin   2007-09-21  767  
b233b28eac0cc3 Adrian McMenamin   2009-02-27  768  static struct maple_driver maple_unsupported_device = {
17be2d2b1c333e Adrian McMenamin   2007-09-21  769  	.drv = {
b233b28eac0cc3 Adrian McMenamin   2009-02-27  770  		.name = "maple_unsupported_device",
17be2d2b1c333e Adrian McMenamin   2007-09-21  771  		.bus = &maple_bus_type,
17be2d2b1c333e Adrian McMenamin   2007-09-21  772  	},
17be2d2b1c333e Adrian McMenamin   2007-09-21  773  };
ee665ecca6d677 Randy Dunlap       2009-03-28  774  /*
b233b28eac0cc3 Adrian McMenamin   2009-02-27  775   * maple_bus_type - core maple bus structure
b233b28eac0cc3 Adrian McMenamin   2009-02-27  776   */
e76933a9bfa9b7 Greg Kroah-Hartman 2023-12-19  777  static const struct bus_type maple_bus_type = {
17be2d2b1c333e Adrian McMenamin   2007-09-21  778  	.name = "maple",
b233b28eac0cc3 Adrian McMenamin   2009-02-27 @779  	.match = maple_match_bus_driver,
17be2d2b1c333e Adrian McMenamin   2007-09-21  780  };
17be2d2b1c333e Adrian McMenamin   2007-09-21  781  

:::::: The code at line 779 was first introduced by commit
:::::: b233b28eac0cc37d07c2d007ea08c86c778c5af4 sh: maple: Support block reads and writes.

:::::: TO: Adrian McMenamin <adrian@mcmen.demon.co.uk>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
