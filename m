Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FD122370D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 06:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738822402; cv=none; b=FwtMKfuoGfpsWKHC9MEWvJ/R+riyjWampPZNoLahBGFgj1SLwXR8+MtFkN/BRCEA4z6UL+lZj9UbZLz+ysuL32Cwa0kk7ocdiA95J808gGrf/wDgJ+p7B1FIcqlq4+am3fwIDokVuYZ//o5cZRf0GBxaU//PnOMwmtSmgUcyg2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738822402; c=relaxed/simple;
	bh=G/uXESj2JGAsl3H6oUiYOmRWk8xQHzLvrNq4aQWgpTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKDUhj+m4fhAf6aKSgqUHn67pGACMGLKMMQZHGu9iTaRVQM2brWZdpsRrcb0sPoKNZJGM+rDDvc2AWkZfKv+ABJRMwGH/uJQXqZYeOSrEIUmC4SxeGE6aGFUkrq44WRSbEr0E1PNvqRLGgUzsSQLmwORDnfvaFc02k79AGrYUWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z3miBtWu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3miBtWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738822401; x=1770358401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G/uXESj2JGAsl3H6oUiYOmRWk8xQHzLvrNq4aQWgpTc=;
  b=Z3miBtWuGFUkNhVXT4H32dUp32y6rG0fzbDs14Ryrjd1mKWdaIub/n7h
   b+HnqTo6VB0hTfjPYenv63iR5Ar3FI5nJv96dBRwgSIlSXXK9QSmMEkz/
   2+QfmybDXh3WsyXOO0wrUpiu5k2/YQshazOwysuk/TSDNwIfcP0Om+oFj
   zey13Sw/H5FpNfCx9B1yXvxDxf6QwGTXD3fcGDNGME4uoJtKOW6dG2o4J
   +RnbtoVvTezqTjM3LqRQhu//ywRFpR0TAGNr63xXHVtNKy3EWPp/w5IRW
   QazsDoqqGgOwxy1txKJzWP7fIUh0SK3YXB2/AdDoqZeO77nRLu8ZAY/xT
   Q==;
X-CSE-ConnectionGUID: AZIbO3e3Q36EeOFG90W/cg==
X-CSE-MsgGUID: pt2pdpgvQbGM77PMbiuglA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43072689"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="43072689"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 22:13:20 -0800
X-CSE-ConnectionGUID: 73IRZEykTVCpRWvAzcgH3g==
X-CSE-MsgGUID: dam6islsRUyXPtS40V2PVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="110897994"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 22:13:15 -0800
Date: Thu, 6 Feb 2025 08:13:12 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: kernel test robot <lkp@intel.com>, andriy.shevchenko@linux.intel.com
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, linus.walleij@linaro.org,
	mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, sre@kernel.org,
	jic23@kernel.org, przemyslaw.kitszel@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: Re: [PATCH v3 01/20] driver core: Split devres APIs to
 device/devres.h
Message-ID: <Z6RS-A2FFjYuPoyn@black.fi.intel.com>
References: <20250203080902.1864382-2-raag.jadav@intel.com>
 <202502060025.XJwUub6I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502060025.XJwUub6I-lkp@intel.com>

On Thu, Feb 06, 2025 at 12:27:03AM +0800, kernel test robot wrote:
> Hi Raag,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 2014c95afecee3e76ca4a56956a936e23283f05b]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Raag-Jadav/driver-core-Split-devres-APIs-to-device-devres-h/20250203-161554
> base:   2014c95afecee3e76ca4a56956a936e23283f05b
> patch link:    https://lore.kernel.org/r/20250203080902.1864382-2-raag.jadav%40intel.com
> patch subject: [PATCH v3 01/20] driver core: Split devres APIs to device/devres.h
> config: um-randconfig-r112-20250205 (https://download.01.org/0day-ci/archive/20250206/202502060025.XJwUub6I-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060025.XJwUub6I-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502060025.XJwUub6I-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>    drivers/net/pcs/pcs-xpcs-plat.c: note: in included file (through include/linux/device.h):
> >> include/linux/device/devres.h:106:23: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
>    include/linux/device/devres.h:106:23: sparse:     expected void [noderef] __iomem *
>    include/linux/device/devres.h:106:23: sparse:     got void *
> 
> vim +106 include/linux/device/devres.h
> 
>    102	
>    103	static inline
>    104	void __iomem *devm_ioremap_resource(struct device *dev, const struct resource *res)
>    105	{
>  > 106		return ERR_PTR(-EINVAL);
>    107	}
>    108	

Andy, are we expecting this?

Raag
