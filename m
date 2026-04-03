Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE691383C81
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205906; cv=none; b=PYkw9jqgibla1NBl110s1FCqTFBtlu2KkQ+zSwXcEH0qeJGW38K4Sfbf5pfc7CBGcGm6JC0d6Cgkn+kEOrXTjc+II0tBIkedDUaR6nDdPqM3+ZhSfHuEzjce4QZDSKoayNJ2t3vod5S/Mmq24FEJ+AoK/g/eKSnN5rjwFlIXdPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205906; c=relaxed/simple;
	bh=hycPBMSz9vB7ws+6IlGEgpNfOEw0AtXPj0ic1qK+2ss=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cfKeLqQcfw97VDjPE4RX39rgrYSQVGnf8AAiEoH7BtKCnQ/Z5DiDcCsTx+S5jQQ1OCKQPr5lr9dTYPuGjKn9LEfIGJkhD7lK7Y2ArUoODQYPuTpojldtpssc2W0ClV44lZ7eGrGlqLCB+OdXw+O/FKz8/2WAqBlA1jieyJFSSds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e80YR1tR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e80YR1tR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205905; x=1806741905;
  h=date:from:to:cc:subject:message-id;
  bh=hycPBMSz9vB7ws+6IlGEgpNfOEw0AtXPj0ic1qK+2ss=;
  b=e80YR1tRHMFZDpdcpDIcd6ev6VM70kjBpsQJH32PXTUCkmllPYLAJWsZ
   AQndJy1KACbSCj/l5WsaROFCvKT6tK1zEuJ7f2jMEg4FxQWF3NHVKaPu+
   L/4upROdEADXM20trSpVoFwyqdRcHA/8kwDEuxlXCMIiu7KuN5S4tPRvC
   6MTPdMM0gjBWwMvu5pLOdwWBiPovJQAtPA5IHBii8iKL599NWx74Ig2M8
   YlFRojBQbUYgnRXG3C0OC+ZjS7OW7t7TI2rZ+ToN1qqFrZBfuPcx+bcPy
   ytVe4KCLxCpzqMNqyR8jTvC5ZeIyEWgWJMV3A2Qxk2udvLVXbGrlwAGq+
   g==;
X-CSE-ConnectionGUID: 0vZja7U/RuazWpni/Pw8pQ==
X-CSE-MsgGUID: 7nIBsosxRFCK+F/kxxQgbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86888903"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86888903"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:45:01 -0700
X-CSE-ConnectionGUID: mY4ickvSQfy185wtkKz64Q==
X-CSE-MsgGUID: vb3V3wL/SU6P8J+/CvOGbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="226368673"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Apr 2026 01:44:58 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a9A-0000000015F-0wHN;
	Fri, 03 Apr 2026 08:44:56 +0000
Date: Fri, 03 Apr 2026 16:44:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Linus Walleij <linusw@kernel.org>
Subject: ERROR: modpost: "devm_gpiochip_add_data_with_key"
 [drivers/iio/adc/ad4062.ko] undefined!
Message-ID: <202604030843.yYsJWEOz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5619b098e2fbf3a23bf13d91897056a1fe238c6d
commit: da1d3596b1e456b5d5d5f719bbf5ce562f4fe22d iio: adc: ad4062: Add GPIO Controller support
date:   3 months ago
config: s390-randconfig-r133-20260402 (https://download.01.org/0day-ci/archive/20260403/202604030843.yYsJWEOz-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 585e2a015b29c1a53c4acddeda1b64b3fb3aac39)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030843.yYsJWEOz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: da1d3596b1e4 ("iio: adc: ad4062: Add GPIO Controller support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030843.yYsJWEOz-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_gpiochip_add_data_with_key" [drivers/iio/adc/ad4062.ko] undefined!
>> ERROR: modpost: "gpiochip_get_data" [drivers/iio/adc/ad4062.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
