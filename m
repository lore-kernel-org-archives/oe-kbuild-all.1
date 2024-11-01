Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBFD1DA53
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 12:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730465982; cv=none; b=N//BgMk7ktrD1o9yp6mgQWSeDxnlRZy2I1/ZwV4ftBgNuHXggb4Lypy4ARE5aboZLSLZvuOms9Mp7TwqgYzgAku0zFh49s7MxIxqDPV4oFWSqGBMIAwZkIyEFGCADO6Z1EwimgeWT6O3wT6EJxUmZ0XK5CBjlPevkINGSkFuG2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730465982; c=relaxed/simple;
	bh=jdBR/JTRU3EJ7P5DfZRqPs2mVg7+sPErx1xS7gamJZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y3yEKzAfxSosV2QVJYol4nY4l+Sgxa5fFBgDpXF9PTMD+Kf3Kw77wHZaH7i0rm2IN9wSrwgkItMpZXk0ceuML8TxSHJ/bl0XbDje225NyRytJ1w0yKyR2PdMxTVM4h7jsyaf1gPbOilWf4Ug+4g7pEkDhSggPyiPmWkzaJYiTIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMmVdzWN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMmVdzWN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730465980; x=1762001980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jdBR/JTRU3EJ7P5DfZRqPs2mVg7+sPErx1xS7gamJZU=;
  b=eMmVdzWN/tdYerunVyytGh9z7Uz6RhjPmqPGe5UtpTiwZafkLTg7beKV
   UYz38reLxGioSTb+PwwkdM/IK/CNFz05oeuxGm81vatWR99qkNhr9w8zQ
   ruwd8+lgXwxVaGdd2AzDpxPoePMyrsy/67x9NSvHOo/a/ZWG0bLYWO8Nh
   TPPmZOEjhEcpEK4ZGtT4GohacbUnjg7lDIAErHDInfZZbknZ8tCY5AxkV
   325ZmXt87m8ArZ2fsHxG1QJ3/TUJSrcQOlfxC1UPLTG6vGfM8waO4gXh4
   c0TLabaRMWXzOEoG22uDsJAKmUhlqN8ZsLTJiowVRpPeJdyuRJwoyNEfv
   w==;
X-CSE-ConnectionGUID: FjzdOolOSEO2CMJuGai9CA==
X-CSE-MsgGUID: MlUtZh7jSaWoyNelwptg+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52797080"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52797080"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 05:59:39 -0700
X-CSE-ConnectionGUID: 0WCWtst6TaC7ZcGfV3G3Uw==
X-CSE-MsgGUID: BmYv48tVRxG49Ne5PlpiYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="83097118"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Nov 2024 05:59:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6rFY-000hYv-0N;
	Fri, 01 Nov 2024 12:59:36 +0000
Date: Fri, 1 Nov 2024 20:58:49 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/must_check-devm_mutex_init 2/2]
 include/linux/mutex.h:152:37: warning: ignoring return value of
 '__devm_mutex_init' declared with attribute 'warn_unused_result'
Message-ID: <202411012055.cxXPYag2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/must_check-devm_mutex_init
head:   1806244ad4c894932db80d79aceae7a9fb262153
commit: 1806244ad4c894932db80d79aceae7a9fb262153 [2/2] locking/mutex: Mark devm_mutex_init() as __must_check
config: i386-buildonly-randconfig-002-20241101 (https://download.01.org/0day-ci/archive/20241101/202411012055.cxXPYag2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411012055.cxXPYag2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411012055.cxXPYag2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/seqlock.h:19,
                    from include/linux/mmzone.h:17,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from drivers/iio/adc/pac1921.c:10:
   drivers/iio/adc/pac1921.c: In function 'pac1921_probe':
>> include/linux/mutex.h:152:37: warning: ignoring return value of '__devm_mutex_init' declared with attribute 'warn_unused_result' [-Wunused-result]
     152 | #define devm_mutex_init(dev, mutex) __devm_mutex_init(dev, ___devm_mutex_init(mutex))
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/pac1921.c:1174:9: note: in expansion of macro 'devm_mutex_init'
    1174 |         devm_mutex_init(dev, &priv->lock);
         |         ^~~~~~~~~~~~~~~
--
   In file included from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from drivers/iio/adc/ad4000.c:11:
   drivers/iio/adc/ad4000.c: In function 'ad4000_probe':
>> include/linux/mutex.h:152:37: warning: ignoring return value of '__devm_mutex_init' declared with attribute 'warn_unused_result' [-Wunused-result]
     152 | #define devm_mutex_init(dev, mutex) __devm_mutex_init(dev, ___devm_mutex_init(mutex))
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ad4000.c:640:9: note: in expansion of macro 'devm_mutex_init'
     640 |         devm_mutex_init(dev, &st->lock);
         |         ^~~~~~~~~~~~~~~


vim +152 include/linux/mutex.h

   151	
 > 152	#define devm_mutex_init(dev, mutex) __devm_mutex_init(dev, ___devm_mutex_init(mutex))
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
