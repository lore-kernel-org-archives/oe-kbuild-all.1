Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2478E18BBBA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 20:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726171943; cv=none; b=TtbSI9wO60IilrCRSpdwPrGXzCpMbvjPQEZ044K9OntRRgNd+GOgqbnW5oxo5QdTW/cM8TQ3XwuJnQv/cRF0eS2MtEZKD5DVdpY2WNjROWDoYg94ZYPmQzPtAo4d0LAg9Y/yvQu6yzxRm6JtDjtvsoTJxpypnWKBM6/FU7bJYPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726171943; c=relaxed/simple;
	bh=sJ21ScUbw18j2aqixetW4Lu9Jkgk1yroAWxOMzNk0FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RxyjOGwdWEUCsi8+B0OZK9hODJKdAIsH2vq21QZCUh2PuZoZyZULTeFaWaOCN45uJj+sQbawGgJxREh2+hE3aMUMYHhHK3PzKfG740ZK+AwfEa8c0KumVQwvoG6hFWBLHVE50pDEnyY/02qdnKCandYV568OWNL41/jpkKrDY3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ar6cG6LQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ar6cG6LQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726171943; x=1757707943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sJ21ScUbw18j2aqixetW4Lu9Jkgk1yroAWxOMzNk0FQ=;
  b=Ar6cG6LQ0aZyyYBoF6tIr6NU6kaxjt6CwbNIYQqXYdam4GlIF5AIrJ2M
   P8asiTrrYWLn3ijo82NkkTPHEKTATYR+ZVYu3lur4c8jGH6XtPLEikw3E
   8qqh+hGo8Vefpm18ICkJtqeCdmzPyEPa6kgjIr+ZMoaddI8YQ0yu0POmi
   vqrUdV8mXyGgFLoS8cuNn0A6dpXYd94CnZOcCTfkKQ8+gmkKmFSWek6qO
   vvBAJ2q3+Ra5SS+4Mi4lX/uwEerOb698gg27GKIG5MsPqKzS3GsysjyKG
   y1WHEMk9/c2Pl9BQLHCo5x/DBF7OJ+FWpsl5VNV5Gaunj4LDh3kHqPga+
   w==;
X-CSE-ConnectionGUID: 7FONXwmqRYWp1yPpC68I2g==
X-CSE-MsgGUID: Mz0M4aNuQ/CfHRkU4bZ4AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24877755"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="24877755"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 13:12:22 -0700
X-CSE-ConnectionGUID: oVf/gq6RQdGNgbzG+AtYTQ==
X-CSE-MsgGUID: qMJrg2IHTl6dA0vsH5GdDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="72174917"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Sep 2024 13:12:19 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soqAq-0005eo-2U;
	Thu, 12 Sep 2024 20:12:16 +0000
Date: Fri, 13 Sep 2024 04:11:41 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Kris Bahnsen <kris@embeddedts.com>, Andrew Lunn <andrew@lunn.ch>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [linux-next:master 11167/11623]
 drivers/pinctrl/pinctrl-ep93xx.c:683:27: warning: 'raster_on_sdram3_pins'
 defined but not used
Message-ID: <202409130426.1OzNAC9M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nikita,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   57f962b956f1d116cd64d5c406776c4975de549d
commit: 216bf914b7a36d7ca260b008cefd99c3eebc1a25 [11167/11623] ARM: ep93xx: DT for the Cirrus ep93xx SoC platforms
config: arm-randconfig-001-20240912 (https://download.01.org/0day-ci/archive/20240913/202409130426.1OzNAC9M-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409130426.1OzNAC9M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409130426.1OzNAC9M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-ep93xx.c:683:27: warning: 'raster_on_sdram3_pins' defined but not used [-Wunused-const-variable=]
     683 | static const unsigned int raster_on_sdram3_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~~


vim +/raster_on_sdram3_pins +683 drivers/pinctrl/pinctrl-ep93xx.c

d1661439f5a3f8 Nikita Shubin 2024-09-09  682  
d1661439f5a3f8 Nikita Shubin 2024-09-09 @683  static const unsigned int raster_on_sdram3_pins[] = {
d1661439f5a3f8 Nikita Shubin 2024-09-09  684  };
d1661439f5a3f8 Nikita Shubin 2024-09-09  685  

:::::: The code at line 683 was first introduced by commit
:::::: d1661439f5a3f8386d32b0732f5f1eef53a260bc pinctrl: add a Cirrus ep93xx SoC pin controller

:::::: TO: Nikita Shubin <nikita.shubin@maquefel.me>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
