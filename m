Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717482D8391
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 23:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765495137; cv=none; b=B+77cTCJkErc4FkeqXIte80lytahwRctRbWviWxoTylNHnHuUJmNQhizA7TSxK8jdZxHgrmEVZbrWb2oVQSZeIrBioJGzkawek+xrh1PJDS6YML9NkOeFReinxbMvbboEipoQUM/RBJfwd/sLd6LbSfCNcSjcksZ4DOrbCAsy4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765495137; c=relaxed/simple;
	bh=NaxgCTNniyKga404rI0eBCafZnQlaEMV7A4MC8S0Rbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FyRFx11k+ER9yF5rKMNCFPqD8zQiBU78GYqA7yuz1TaS8n4T564c+3Cqlbf7wWgU12i+tVNp/V6WhyeT/tp3jy4H8iEEBKP8GmFumtL97S2SK7KWce4TZ+h4UJ4IRsbZsDRbF4gykM0IasSfb4UyWvAFXDFwm8BnYLBxD8Y0tZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y0F4of7f; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y0F4of7f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765495135; x=1797031135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NaxgCTNniyKga404rI0eBCafZnQlaEMV7A4MC8S0Rbo=;
  b=Y0F4of7fwO3VNxBicsm/sK9ocnf7HumhfPF71V05vd9P5qEnGNmm/Mwc
   eTnxpdzeplHSnvJvG+C6P9cRxApiFr/JcSQA22326WC8HvZaWM5oyO3/e
   YPhUUnp768bTpWYrUBrVri8C4E1Cv3GNGsb90oRmXIxWGd+RQ199+mAq1
   z8GgcVzLXcvz+NSVD4PyNeDF81ONJPlUSvqcPaugPMkIRoUTQpWApvt1e
   J+D6g0zw031bqbIprzvBB4XL0VG0WJajv1FRDfGD4jFvcPyizTU1EC95K
   i2Dtgf2OLH5DWCm/l8HIdsYiaQ7ImPxtE+47IPM7xBFDomcgyMfTzkNMS
   w==;
X-CSE-ConnectionGUID: F/TdfdL8QQuT01P493YT6Q==
X-CSE-MsgGUID: i3GZZBCqTZa8havPSEhfSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71111162"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="71111162"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 15:18:55 -0800
X-CSE-ConnectionGUID: JMOc2h7ASYiLP8rGx31Jxw==
X-CSE-MsgGUID: hAP9976YQ+m28gU3y/FsVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201399472"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Dec 2025 15:18:54 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTpvv-000000005Bp-2c3Z;
	Thu, 11 Dec 2025 23:18:51 +0000
Date: Fri, 12 Dec 2025 07:18:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Vecera <ivecera@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH RFC net-next 10/13] dpll: Add reference
 count tracking support
Message-ID: <202512120712.PIlx0U2J-lkp@intel.com>
References: <20251211194756.234043-11-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211194756.234043-11-ivecera@redhat.com>

Hi Ivan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Vecera/dt-bindings-net-ethernet-controller-Add-DPLL-pin-properties/20251212-035305
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251211194756.234043-11-ivecera%40redhat.com
patch subject: [Intel-wired-lan] [PATCH RFC net-next 10/13] dpll: Add reference count tracking support
config: m68k-randconfig-r072-20251212 (https://download.01.org/0day-ci/archive/20251212/202512120712.PIlx0U2J-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120712.PIlx0U2J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120712.PIlx0U2J-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/dpll/dpll_core.c:399 function parameter 'tracker' not described in 'dpll_device_get'
>> Warning: drivers/dpll/dpll_core.c:434 function parameter 'tracker' not described in 'dpll_device_put'
>> Warning: drivers/dpll/dpll_core.c:746 function parameter 'tracker' not described in 'dpll_pin_get'
>> Warning: drivers/dpll/dpll_core.c:781 function parameter 'tracker' not described in 'dpll_pin_put'
>> Warning: drivers/dpll/dpll_core.c:802 function parameter 'tracker' not described in 'fwnode_dpll_pin_find'
>> Warning: drivers/dpll/dpll_core.c:399 function parameter 'tracker' not described in 'dpll_device_get'
>> Warning: drivers/dpll/dpll_core.c:434 function parameter 'tracker' not described in 'dpll_device_put'
>> Warning: drivers/dpll/dpll_core.c:746 function parameter 'tracker' not described in 'dpll_pin_get'
>> Warning: drivers/dpll/dpll_core.c:781 function parameter 'tracker' not described in 'dpll_pin_put'
>> Warning: drivers/dpll/dpll_core.c:802 function parameter 'tracker' not described in 'fwnode_dpll_pin_find'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=m]
   Selected by [m]:
   - CAN [=m] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
