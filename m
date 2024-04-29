Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1C6376F1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 09:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714384120; cv=none; b=QAxE60hgKp7yQeoIah9MtybypQzdtyxCWPI8aARugEWcP1AbJY3DgNtUNT6vChn1GL7+RZouN9+brtbd/lTdh5bVy9GpwKZ7utBbdWPdT6Dyx80EsN1hA90Mdra7YygeeLAFnKYhxzo9G4eKcuzlGYS6eG0hEQQSRnKoxIeg348=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714384120; c=relaxed/simple;
	bh=SHOTpd3mJ76G3MeNlIkybFk2cSyd79lNzUK89faXY0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hj4bUq/zH2e75zlbdOcAwDyzI2RbUSTPXZPq598fXrindUW9jlgm1y68oMUhuTagEEQnHRORMeTRsejr2uwBVqlSkeCkkbRYGnMZLQxRfI69KIfuCuoJylzM2f8R2KXGbO4x/UG8CYQYdtOfbUNaRX5p8ythDmdsx0DBpAS6Wqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BffKQCsr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BffKQCsr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714384119; x=1745920119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SHOTpd3mJ76G3MeNlIkybFk2cSyd79lNzUK89faXY0Q=;
  b=BffKQCsrmfBnH3fSAnLmLa80T7pJQOKvzSHvt+SRDRVzZJFVKznTOIUE
   WqL8gepkT6oHFPtCB0WySg4Qv+lpGRA2uylYhAKlP5FX0FICoZP+gkApu
   8HdeKr6kmcgiKNpyx3Rgyt+dRPCna/w+dG9agAPA8vp09mB+vrW9bUJH1
   Pi3eu4HX5sBdYyWEvM9TAyMSYc9PoYsSZJsqcSUJCzD3yW73BSVtq5DYy
   raHXfHw8iKB/+EEs7JB3669XVmlB8yG0RG40BLFLeEdmqHhX77qPLfvkJ
   Qsg3BgDF53q8md6w59x0c9SzAkQNW+Oyb35Mo2eifzJoUvaBaGreSr5Qg
   g==;
X-CSE-ConnectionGUID: O//ztkcFTXiPi1q0Obpl3A==
X-CSE-MsgGUID: fwflFdRTSFKEbGYq4UdVVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13866262"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="13866262"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 02:48:39 -0700
X-CSE-ConnectionGUID: ZTUWOCQJQmGkn0EQFzSTPA==
X-CSE-MsgGUID: v9u6DkWWSyuldxc+p2LC2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26066361"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Apr 2024 02:48:37 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1Ncg-00076E-0d;
	Mon, 29 Apr 2024 09:48:34 +0000
Date: Mon, 29 Apr 2024 17:47:54 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3225/29983]
 drivers/gpio/gpio-scu.c:99:11: error: 'struct gpio_chip' has no member named
 'of_node'
Message-ID: <202404291717.Sp3gkRKd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shenwei,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   5134e031114e613cb04858e248af5e65fe1e112f
commit: cdb7bf80f99743df8c3375d3191d3b96661c4b65 [3225/29983] MLK-25166-1 gpio: gpio-scu: gpio driver over scu fw misc api
config: parisc-randconfig-001-20240429 (https://download.01.org/0day-ci/archive/20240429/202404291717.Sp3gkRKd-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404291717.Sp3gkRKd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404291717.Sp3gkRKd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-scu.c: In function 'imx_scu_gpio_probe':
>> drivers/gpio/gpio-scu.c:99:11: error: 'struct gpio_chip' has no member named 'of_node'
      99 |         gc->of_node = np;
         |           ^~


vim +99 drivers/gpio/gpio-scu.c

    80	
    81	static int imx_scu_gpio_probe(struct platform_device *pdev)
    82	{
    83		struct device *dev = &pdev->dev;
    84		struct device_node *np = dev->of_node;
    85		struct imxscfw *port;
    86		struct gpio_chip *gc;
    87		int ret;
    88	
    89		port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
    90		if (!port)
    91			return -ENOMEM;
    92	
    93		ret = imx_scu_get_handle(&port->handle);
    94		if (ret)
    95			return ret;
    96	
    97		mutex_init(&port->lock);
    98		gc = &port->chip;
  > 99		gc->of_node = np;
   100		gc->parent = dev;
   101		gc->label = "imx-scu-gpio";
   102		gc->ngpio = PIN_NUMBER;
   103		gc->base = of_alias_get_id(np, "gpio") * 32;
   104	
   105		gc->get = imxscfw_get;
   106		gc->set = imxscfw_set;
   107	
   108		platform_set_drvdata(pdev, port);
   109	
   110		ret = devm_gpiochip_add_data(dev, gc, port);
   111	
   112		return ret;
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
