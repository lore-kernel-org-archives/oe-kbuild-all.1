Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC18137923
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 03:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790392177; cv=none; b=ON2MGwuuiZmMQqs3utPfv6DcYKfNs8ClDKz7pLFM6/NMm3j7LHYXCC0YNBajmdOPf+6Pr2Xsf715a9kPSLydBq9eBdU+DlxXJmsjpFBWGrsOLvrXer0RcHUCFvVVqGW42auYrJFxm1EKoFuIyT2g104WAH/jeNqIr2VHAY6W848=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790392177; c=relaxed/simple;
	bh=vOMGvE7ixCjNRgKIVL8vPMa1LigInIPDcLVjB6qZ6Ok=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiCmnjgkmlU0MUGwlotOk99sYQEtdsWKevR8TADU1X3YJusgPAdZ+ycanylPLIFXyAqXWQQIiIisrkiuRi38MPtqxCuYivvDI2mR2iko/eb5U7Ddi7R0vk4E17X1In/NRDzYu6Yh9mkzSJi3VX3qukDLoVS0um4SLYryE1yYU1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XSDk9f9a; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XSDk9f9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790392175; x=1821928175;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=vOMGvE7ixCjNRgKIVL8vPMa1LigInIPDcLVjB6qZ6Ok=;
  b=XSDk9f9aMga94dds/Dr645UEgT9/1k4Xj0/v/fsk1vHsqXZTnSG6y4A0
   p/5kTd2W9A0nRmEJ7Rd6XqZ+OWO5RevkKEwQcYkHHtnEOuPbIeHNfTQGo
   qplAufRxVDT1e9wJzDBJLn+bwQiT/+CmWM/3d5i4SQ+DqU21jMIBexIaB
   if7LVXfG3vmFUbDZ2wCQvEwaaIIwv04BmZ/7Q99eUJaVD6LuVyjaiYW6u
   PuIIpyKuLiSd9EIFBr/GO5+xY8DO0x65mODXIvM3RFCWH/DGrQFXVu6IE
   2Mva6V471/HXdlJ7Gu5m3+wMEvPNpV6WPv+9QOfsrTdcWh5E0tkO1XKQK
   w==;
X-CSE-ConnectionGUID: HOohlL/0S8WXqO9Nva0Asw==
X-CSE-MsgGUID: ZaEitMTYQQOM3602Op5RHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="101839756"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="101839756"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 20:09:35 -0700
X-CSE-ConnectionGUID: qeH7w+jnTdOuR3kQBNe/bw==
X-CSE-MsgGUID: k07HuijoTy+b5MAQezkrFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="303995182"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Sep 2026 20:09:35 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAIn6-00000000LSv-2LgY
	for oe-kbuild-all@lists.linux.dev;
	Sat, 26 Sep 2026 03:09:32 +0000
Date: Sat, 26 Sep 2026 11:09:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re:
Message-ID: <202609261134.DTgOFzJg-lkp@intel.com>
References: <202609261134.DTgOFzJg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609261134.DTgOFzJg-lkp@intel.com>

Hi Uwe,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/Add-TAINT_DRIVER_OVERRIDE-for-usage-of-driver_override/20260925-202040
base:   
patch link:    https://lore.kernel.org/r/202609261134.DTgOFzJg-lkp%40intel.com
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260926/202609261134.DTgOFzJg-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261134.DTgOFzJg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609261134.DTgOFzJg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/base/bus.c: In function 'driver_override_store':
>> drivers/base/bus.c:516:26: error: 'drv' undeclared (first use in this function); did you mean 'dev'?
     516 |         add_taint_module(drv->owner, TAINT_DRIVER_OVERRIDE, LOCKDEP_STILL_OK);
         |                          ^~~
         |                          dev
   drivers/base/bus.c:516:26: note: each undeclared identifier is reported only once for each function it appears in


vim +516 drivers/base/bus.c

   509	
   510	static ssize_t driver_override_store(struct device *dev,
   511					     struct device_attribute *attr,
   512					     const char *buf, size_t count)
   513	{
   514		int ret;
   515	
 > 516		add_taint_module(drv->owner, TAINT_DRIVER_OVERRIDE, LOCKDEP_STILL_OK);
   517		ret = __device_set_driver_override(dev, buf, count);
   518		if (ret)
   519			return ret;
   520	
   521		return count;
   522	}
   523	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
