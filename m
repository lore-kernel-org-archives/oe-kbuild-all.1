Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B028D1C84D0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 14:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765549322; cv=none; b=XN56q4Y65sqtwsAyaL8zoKK4MsLvCKM3LtkCWXVt/Gio3yuXde+hjnE0RmlqJJexsb1Tzyd4cCf3KlQrzoZ47fpI55Km47v3QvWOtfMPQe3tcXQxDhuZYZl2PaQ650IPpIwxj93WdGMXqB71R+Es4MYs0x8AZTPOsX/C6Pms6gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765549322; c=relaxed/simple;
	bh=TnYV6xve5F4PnkzdmVL/I4bg+RE6Tv8WJfSkzAXae20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgJAhaUIdyK2/ezaZ4M29gCfjgzS4nLwpLmEqWkOZCR3GfOk498yrclJHz2pqkZwDd73LAmyY13UsgqwYL3PKK9bovOoDdMfd2ZkgGXqCQjeQUvDjEnPOxvIEt5Mdii4DCAKrQ0938dkdqBvKJmI/5eW0Zhw5AwNiK4m5Nk2vcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eL8YRBKi; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eL8YRBKi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765549321; x=1797085321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TnYV6xve5F4PnkzdmVL/I4bg+RE6Tv8WJfSkzAXae20=;
  b=eL8YRBKidH+LtC8ATiv1cv3Gkr6+DqfwC8R9LGrc/OxZE7ioHlkrAxKF
   FJb7Tt5f3Ow4dRCe0UK5FuWLZ9PgryQ9/nWloT6xPxunNG3y2J0LBue+s
   FAoOAs61BIwNKdOKwD0YJAUZHXDSN/uGzQoojz96yv6H7uxhuZQ8VgA95
   X6DG8J2ilplgoW/TZRSfimvQvZT+hOJd6vMEptiS79lDxezMO2ujuZ60z
   AuSh3ePklYJnyFaKqm4+YORHnDKKxXd+T8zDaR5vdrtpRIehK5fV+aNoX
   ply+aB+Xj48ejasjYbgsUrx1Kdo4ozg9dQAbQylpPLeQCRzjGn6sRWZzs
   w==;
X-CSE-ConnectionGUID: 3VcPXTRjThWT0/FPSBzDpw==
X-CSE-MsgGUID: nZuhUmtMRWaC6q4agxlWVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67493935"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67493935"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 06:22:00 -0800
X-CSE-ConnectionGUID: dwtbIdiwQiiMBeQPkfgvkg==
X-CSE-MsgGUID: 50g7zUE0Q9iV2zrL/Cm0iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="201280443"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Dec 2025 06:21:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU41t-0000000069R-1CKP;
	Fri, 12 Dec 2025 14:21:57 +0000
Date: Fri, 12 Dec 2025 22:21:06 +0800
From: kernel test robot <lkp@intel.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 4/4] clk: spacemit: k3: add the clock tree
Message-ID: <202512122146.ai6Tzgw1-lkp@intel.com>
References: <20251211-k3-clk-v1-4-8ee47c70c5bc@gentoo.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-k3-clk-v1-4-8ee47c70c5bc@gentoo.org>

Hi Yixun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 7d0a66e4bb9081d75c82ec4957c50034cb0ea449]

url:    https://github.com/intel-lab-lkp/linux/commits/Yixun-Lan/dt-bindings-soc-spacemit-add-k3-syscon-compatible/20251211-092723
base:   7d0a66e4bb9081d75c82ec4957c50034cb0ea449
patch link:    https://lore.kernel.org/r/20251211-k3-clk-v1-4-8ee47c70c5bc%40gentoo.org
patch subject: [PATCH RFC 4/4] clk: spacemit: k3: add the clock tree
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251212/202512122146.ai6Tzgw1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512122146.ai6Tzgw1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512122146.ai6Tzgw1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/spacemit/ccu-k3.c: In function 'spacemit_cadev_release':
>> drivers/clk/spacemit/ccu-k3.c:1513:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
    1513 |         kfree(to_spacemit_ccu_adev(adev));
         |         ^~~~~


vim +/kfree +1513 drivers/clk/spacemit/ccu-k3.c

  1508	
  1509	static void spacemit_cadev_release(struct device *dev)
  1510	{
  1511		struct auxiliary_device *adev = to_auxiliary_dev(dev);
  1512	
> 1513		kfree(to_spacemit_ccu_adev(adev));
  1514	}
  1515	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
