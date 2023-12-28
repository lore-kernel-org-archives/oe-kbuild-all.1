Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF54CEAD1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Dec 2023 18:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGhO/Qvm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703789235; x=1735325235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6vD9G4noEHBS85fJSwSIP573blhxTenZXBqESuTRQoY=;
  b=oGhO/QvmToC1w/EbV9jfQ8oDOOihSZ8OCuc07amvlhnUq8jYtdzwjZpV
   acXjNxrLBpF9cQkS7jhkLRhympUOwZo0oS21ZriSX0HoKsvNTTKsKcgm4
   dxHBy3bjB4nOiaBNNvYkxrudNiwFcPpPZ2bc6cOITxDHrSnq/lVomplmL
   5zPUB+t1RTEuMNKXx5KZAFDPZZmoBciE5BdnIeu84PsOxYm4TcmWHb3ui
   WgxVH455uzX5q6+xtvLgZD6mnFnZq6jlHh78BVAkS8i2fjhWZsH9+1U4e
   ReXhop9v7MrEwjMOPC4t+PITF2dizF4QWTCveEy6b55l82bMn6mfKS6QF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="3411734"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; 
   d="scan'208";a="3411734"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 10:47:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="807501891"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; 
   d="scan'208";a="807501891"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 28 Dec 2023 10:47:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIvPQ-000GkH-0m;
	Thu, 28 Dec 2023 18:47:08 +0000
Date: Fri, 29 Dec 2023 02:46:30 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: drivers/mux/adg792a.c:134:34: warning: 'adg792a_of_match' defined
 but not used
Message-ID: <202312290237.ChqMrE6k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andy,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f5837722ffecbbedf1b1dbab072a063565f0dad1
commit: 879a52379704e479237d0b97822fd9302fed0675 iio: multiplexer: Make use of device properties
date:   1 year, 9 months ago
config: x86_64-randconfig-016-20230827 (https://download.01.org/0day-ci/archive/20231229/202312290237.ChqMrE6k-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231229/202312290237.ChqMrE6k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312290237.ChqMrE6k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mux/adg792a.c:134:34: warning: 'adg792a_of_match' defined but not used [-Wunused-const-variable=]
     134 | static const struct of_device_id adg792a_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~


vim +/adg792a_of_match +134 drivers/mux/adg792a.c

afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  133  
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14 @134  static const struct of_device_id adg792a_of_match[] = {
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  135  	{ .compatible = "adi,adg792a", },
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  136  	{ .compatible = "adi,adg792g", },
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  137  	{ }
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  138  };
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  139  MODULE_DEVICE_TABLE(of, adg792a_of_match);
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  140  

:::::: The code at line 134 was first introduced by commit
:::::: afda08c4caa9489511557def51e322a5f2142a2f mux: adg792a: add mux controller driver for ADG792A/G

:::::: TO: Peter Rosin <peda@axentia.se>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
