Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88CE819
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 08:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719478144; cv=none; b=USTUYxLXZ5Y5fp9Rb3eqcaAmpGXtvkQBEHALUrs9K/RvkFT3zZgXLdcOYmrYitIDztyO4YxKYkoJAWv6sdYi8NdfGcEace8oe0c9fMPTD110arQI4spvTQQmKWGHRHXA/G5MsO9qaYgW3pyY0D4Hop3bHu8iuHaoSkIaCxcJxGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719478144; c=relaxed/simple;
	bh=PUDjldmN0jCtlMUk3zQf20aolqA2vAkAaINeaga16Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0HdVgur4fED3OaFNwvd3LvgCE915xeDLu/BARfFlGNBbLc3iAj5XCOKLr5L6nUMG4+Sw/nxEhIg1DvKX2RhnlIlUZNA4rf60b9/fjQQoJcEIxAVqigiJeUHvCz4PDw5am1GDgpK9cVLYpcB0d1Pa9xjrtacn+KFLDtpSH5nMQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cqrfr7kz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cqrfr7kz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719478143; x=1751014143;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PUDjldmN0jCtlMUk3zQf20aolqA2vAkAaINeaga16Sk=;
  b=Cqrfr7kzOaMwCYdE3tjlKyre7zJ86vSTb7W5T0rN/oZqYGrmMNeFx+Mj
   o+ccCX/swIin5hQT/HEHIeMV6aaBw7X2vZTApM9e1L92O1t5U6qHM4mui
   dbKbRNq1FHSufG7e6mxB7X+0nP+jK0Fuit0pxJCDO4Nzr4/RMFb8R6Z7B
   uRQipCdQnaAe1iZcG+aerufPN4uw2gNMa//4pYh7NCFpqgPl1ajb8UpuK
   QMFeK7B34DZKWXsljY1oMa0TLa8dFwxrDDduIct+6bCeBfcq7V6Aei9B9
   GZddN0LQ12cVFvhM3MbP2on8p8agzG4yipxZi2u2W6ctiVHzcPE4Aa7gW
   g==;
X-CSE-ConnectionGUID: qAPInBL6T9mcOCP5n3aw4w==
X-CSE-MsgGUID: Ja6F9IaURvOfgt8Dhz2WjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="12276722"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="12276722"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 01:49:02 -0700
X-CSE-ConnectionGUID: RrKgwBr2TGuVTj++jcpXvw==
X-CSE-MsgGUID: 1Fca+Tl9TLmhk3JIuCMB4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="44213574"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Jun 2024 01:49:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMkoN-000G4a-0c;
	Thu, 27 Jun 2024 08:48:59 +0000
Date: Thu, 27 Jun 2024 16:48:27 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/3] reset: replace boolean parameters with flags
 parameter
Message-ID: <202406271601.6Ozf1B5k-lkp@intel.com>
References: <20240621-reset-get-deasserted-v1-1-94ee76fb7b7d@pengutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621-reset-get-deasserted-v1-1-94ee76fb7b7d@pengutronix.de>

Hi Philipp,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Zabel/reset-replace-boolean-parameters-with-flags-parameter/20240625-211644
base:   1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
patch link:    https://lore.kernel.org/r/20240621-reset-get-deasserted-v1-1-94ee76fb7b7d%40pengutronix.de
patch subject: [PATCH RFC 1/3] reset: replace boolean parameters with flags parameter
config: i386-buildonly-randconfig-002-20240627 (https://download.01.org/0day-ci/archive/20240627/202406271601.6Ozf1B5k-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271601.6Ozf1B5k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271601.6Ozf1B5k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/reset/core.c:1427: warning: Function parameter or struct member 'flags' not described in 'devm_reset_control_array_get'
>> drivers/reset/core.c:1427: warning: Excess function parameter 'shared' description in 'devm_reset_control_array_get'
>> drivers/reset/core.c:1427: warning: Excess function parameter 'optional' description in 'devm_reset_control_array_get'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REGMAP_SPI
   Depends on [n]: SPI [=n]
   Selected by [y]:
   - AD9739A [=y] && IIO [=y] && (SPI [=n] || COMPILE_TEST [=y])


vim +1427 drivers/reset/core.c

17c82e206d2a3c Vivek Gautam       2017-05-22  1411  
17c82e206d2a3c Vivek Gautam       2017-05-22  1412  /**
17c82e206d2a3c Vivek Gautam       2017-05-22  1413   * devm_reset_control_array_get - Resource managed reset control array get
17c82e206d2a3c Vivek Gautam       2017-05-22  1414   *
17c82e206d2a3c Vivek Gautam       2017-05-22  1415   * @dev: device that requests the list of reset controls
17c82e206d2a3c Vivek Gautam       2017-05-22  1416   * @shared: whether reset controls are shared or not
17c82e206d2a3c Vivek Gautam       2017-05-22  1417   * @optional: whether it is optional to get the reset controls
17c82e206d2a3c Vivek Gautam       2017-05-22  1418   *
17c82e206d2a3c Vivek Gautam       2017-05-22  1419   * The reset control array APIs are intended for a list of resets
17c82e206d2a3c Vivek Gautam       2017-05-22  1420   * that just have to be asserted or deasserted, without any
17c82e206d2a3c Vivek Gautam       2017-05-22  1421   * requirements on the order.
17c82e206d2a3c Vivek Gautam       2017-05-22  1422   *
723c0011c7f699 Geert Uytterhoeven 2019-11-20  1423   * Returns pointer to allocated reset_control on success or error on failure
17c82e206d2a3c Vivek Gautam       2017-05-22  1424   */
17c82e206d2a3c Vivek Gautam       2017-05-22  1425  struct reset_control *
0477e2c4b77c5f Philipp Zabel      2024-06-21  1426  devm_reset_control_array_get(struct device *dev, enum reset_control_flags flags)
17c82e206d2a3c Vivek Gautam       2017-05-22 @1427  {
a9457ed2ebd772 Geert Uytterhoeven 2019-11-20  1428  	struct reset_control **ptr, *rstc;
17c82e206d2a3c Vivek Gautam       2017-05-22  1429  
a9457ed2ebd772 Geert Uytterhoeven 2019-11-20  1430  	ptr = devres_alloc(devm_reset_control_release, sizeof(*ptr),
17c82e206d2a3c Vivek Gautam       2017-05-22  1431  			   GFP_KERNEL);
a9457ed2ebd772 Geert Uytterhoeven 2019-11-20  1432  	if (!ptr)
17c82e206d2a3c Vivek Gautam       2017-05-22  1433  		return ERR_PTR(-ENOMEM);
17c82e206d2a3c Vivek Gautam       2017-05-22  1434  
0477e2c4b77c5f Philipp Zabel      2024-06-21  1435  	rstc = of_reset_control_array_get(dev->of_node, flags);
db23808615e29d Geert Uytterhoeven 2019-11-20  1436  	if (IS_ERR_OR_NULL(rstc)) {
a9457ed2ebd772 Geert Uytterhoeven 2019-11-20  1437  		devres_free(ptr);
17c82e206d2a3c Vivek Gautam       2017-05-22  1438  		return rstc;
17c82e206d2a3c Vivek Gautam       2017-05-22  1439  	}
17c82e206d2a3c Vivek Gautam       2017-05-22  1440  
a9457ed2ebd772 Geert Uytterhoeven 2019-11-20  1441  	*ptr = rstc;
a9457ed2ebd772 Geert Uytterhoeven 2019-11-20  1442  	devres_add(dev, ptr);
17c82e206d2a3c Vivek Gautam       2017-05-22  1443  
17c82e206d2a3c Vivek Gautam       2017-05-22  1444  	return rstc;
17c82e206d2a3c Vivek Gautam       2017-05-22  1445  }
17c82e206d2a3c Vivek Gautam       2017-05-22  1446  EXPORT_SYMBOL_GPL(devm_reset_control_array_get);
eaf91db0ab22dc Geert Uytterhoeven 2018-11-13  1447  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
