Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A48D370
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 01:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718069274; cv=none; b=HCmdrO0LnPrEoWS2moIkavegwF6PXt0vAvVJUFwvGXnrXPXH1rB0p/YLlgi1ub7zI9Lr4/jljcyny84iu/M7BJ+fTaglr7Tg02QdeAWPG6ZyfhXPdGOQZzq5VjqtXBRqqg8ZSfa22v+ntwvVq5my4RLwbEs62pWvA0E6Vyuau54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718069274; c=relaxed/simple;
	bh=2ETh3NC/DkG+jrTOrr3qcrplgx2QmQV4sxWjYbxTadU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=twYn+RJyYmvDnZSQ1jLg7Xna/EhqSgZp42IDHkLPbkflG+tlqpIKxSY8uX6SlYMSkZm5E3CbufN/KT4DiWpqy8NF5t0+k4c1SQn5C5lk0rUQ15DvUZV4jY1jPENUFVfiOVFl3Kqs74+9mWYCWhqXHBKQHXm9cmpRMJVCAZ+2LZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2d0Eszx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2d0Eszx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718069272; x=1749605272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ETh3NC/DkG+jrTOrr3qcrplgx2QmQV4sxWjYbxTadU=;
  b=b2d0EszxphKxDyk20LtY0WcBO8vOjl2h0yxeXqSJmLMLm/7YlwS6kOQ5
   J0v4XtkJv3l2Rz64MhkKeku6QEU4qECp6QOJi/K7Hwx3eWFNSYG9w/BkB
   Rf1RUEX1+miglmBv09U+av+9UyWs+x0vQ+VIm27m2IKijk1B0FugqqxoM
   Jcsi5TmtHctSiiBrQsnv37Z1CiYOzRt7Jnx6vp/c3isCCdjx0MlrwJG//
   w3C1vebSaR3EMqJCLppiTaLGdTm62lrZJsIJvgn+49vjpBZhbOLB1cAOK
   f1L2QeMSjRb/fPqwKc/5RL6tXTk5L40xl6PBHUBvc0yj9u63wrqO00F1d
   Q==;
X-CSE-ConnectionGUID: Sn0nkpSxTq+AEfsInXQJNw==
X-CSE-MsgGUID: pBVJJK2+SPSYhXlyYyAFLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="40157780"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="40157780"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 18:27:51 -0700
X-CSE-ConnectionGUID: Y37eTKgOR/KJYbLkQ+6hGg==
X-CSE-MsgGUID: zRo9tkT+Rme85seGF0XF5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="44200252"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jun 2024 18:27:50 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGqIe-0002eL-0X;
	Tue, 11 Jun 2024 01:27:48 +0000
Date: Tue, 11 Jun 2024 09:27:08 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:const_driver 8/8] arch/parisc/kernel/drivers.c:623:18:
 error: initialization of 'int (*)(struct device *, const struct
 device_driver *)' from incompatible pointer type 'int (*)(struct device *,
 struct device_driver *)'
Message-ID: <202406110956.JsSMEcMO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git const_driver
head:   6f0f76bd99e259ff0aee9f2e6aed360e258c1077
commit: 6f0f76bd99e259ff0aee9f2e6aed360e258c1077 [8/8] driver core: have match() callback in struct bus_type take a const *
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240611/202406110956.JsSMEcMO-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406110956.JsSMEcMO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406110956.JsSMEcMO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/parisc/kernel/drivers.c:623:18: error: initialization of 'int (*)(struct device *, const struct device_driver *)' from incompatible pointer type 'int (*)(struct device *, struct device_driver *)' [-Werror=incompatible-pointer-types]
     623 |         .match = parisc_generic_match,
         |                  ^~~~~~~~~~~~~~~~~~~~
   arch/parisc/kernel/drivers.c:623:18: note: (near initialization for 'parisc_bus_type.match')
   cc1: some warnings being treated as errors


vim +623 arch/parisc/kernel/drivers.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  620  
0b9ec151b9b45f Ricardo B. Marliere 2024-02-13  621  const struct bus_type parisc_bus_type = {
^1da177e4c3f41 Linus Torvalds      2005-04-16  622  	.name = "parisc",
^1da177e4c3f41 Linus Torvalds      2005-04-16 @623  	.match = parisc_generic_match,
7246c31e45021b Helge Deller        2008-12-25  624  	.uevent = parisc_uevent,
9b7c6682270043 Greg Kroah-Hartman  2017-06-06  625  	.dev_groups = parisc_device_groups,
ad3ed31c682d95 Russell King        2006-01-05  626  	.probe = parisc_driver_probe,
b86db40e1ecc91 Helge Deller        2018-03-04  627  	.remove = __exit_p(parisc_driver_remove),
^1da177e4c3f41 Linus Torvalds      2005-04-16  628  };
^1da177e4c3f41 Linus Torvalds      2005-04-16  629  

:::::: The code at line 623 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
