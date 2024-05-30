Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD309FBE8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 May 2024 01:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717031861; cv=none; b=uxblIVvxrzbXvKSGmtY6TZmUOaqkCWGny/bbHMS6Eg8t2hNxsVYABdXKWk6sxbkIYO/JQkrXrs50g6KnrwUnDt2EmRiHnDGM3aljt7DHfaF+iwUdB4YH0e/F8y2PjNq+3GxP4dLYpnvItTDzSOWfcUYlEP6PeXL3TMug3ekZFvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717031861; c=relaxed/simple;
	bh=2cmyELSgXPlJzUFzjoxyTnAaiOHq2J4HHRkRJ2nEStY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMgNeZR0/JUluTiaOupojp8ZNVqfZCVNBFKgeVigLfHP/1+ZBoTGIXG3Xy72sl+R/PHMrWr5JCLUEOr1p1L6H90wHKjHKL9D0cbTPyV4Nn1O9IdJi9/qEcUjX3JhibCtFdPaYoCjnPXbqSFH1ZxFB2p1BwsxC1CSbO/0GUswAgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ljwm97+2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ljwm97+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717031860; x=1748567860;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2cmyELSgXPlJzUFzjoxyTnAaiOHq2J4HHRkRJ2nEStY=;
  b=Ljwm97+20m4OTH/XzwYmttxIj8k7xKUoYzXqyJHnO6NIVwTYW1tSK8IB
   Npn8vBRXsJlXUQN45PPOvLqo0oVHN5ReFf02TAJTA2EWRWa9HYtCR6IIV
   i0I/vV6jnRVAK0lhFwTz3azdkqTwn98JaAFwIvYRyGps6T1CVnGaP3SNG
   fjNpDdcpjCnMouve5YwHbMnUo1WtC+Xo6k8Q4H/DkysI3Os6Pn7afwMsA
   fmMZlo3mDGE4WEvwTx+C6kE3vIt2aRN7LLP0poq2A+SGuTQGdNSoYmoAX
   yIX1EsGvA1FhfNWNuaMOmSmbzunNh82w3NLJaEwS1lrVIhWZkr1Y/XplQ
   Q==;
X-CSE-ConnectionGUID: 2V61Bv4zSzOGWgzqHYrbHA==
X-CSE-MsgGUID: MvyMufnIQSOUChPGn8QVUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24896146"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="24896146"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 18:17:40 -0700
X-CSE-ConnectionGUID: oN9ZZNHQTNSrz7sLe8wIHQ==
X-CSE-MsgGUID: ZNnC/ecDSCmJP9XGZ5fK1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="36106486"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 May 2024 18:17:38 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCUQC-000EPF-0W;
	Thu, 30 May 2024 01:17:36 +0000
Date: Thu, 30 May 2024 09:17:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/9] pci: pcie: portdrv: Add a auxiliary_bus
Message-ID: <202405300823.eH4xCnqn-lkp@intel.com>
References: <20240529164103.31671-6-Jonathan.Cameron@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529164103.31671-6-Jonathan.Cameron@huawei.com>

Hi Jonathan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus cxl/next linus/master v6.10-rc1 next-20240529]
[cannot apply to cxl/pending]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cameron/pci-pcie-Drop-priv_data-from-struct-pcie_device-and-use-dev_get-set_drvdata-instead/20240530-004705
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20240529164103.31671-6-Jonathan.Cameron%40huawei.com
patch subject: [RFC PATCH 5/9] pci: pcie: portdrv: Add a auxiliary_bus
config: i386-randconfig-003-20240530 (https://download.01.org/0day-ci/archive/20240530/202405300823.eH4xCnqn-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405300823.eH4xCnqn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405300823.eH4xCnqn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/pcie/portdrv.c:493:12: warning: 'pcie_port_adev_suspend_iter' defined but not used [-Wunused-function]
     493 | static int pcie_port_adev_suspend_iter(struct device *dev, void *data)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/pcie/portdrv.c:481:12: warning: 'pcie_port_adev_resume_iter' defined but not used [-Wunused-function]
     481 | static int pcie_port_adev_resume_iter(struct device *dev, void *data)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pcie_port_adev_suspend_iter +493 drivers/pci/pcie/portdrv.c

   480	
 > 481	static int pcie_port_adev_resume_iter(struct device *dev, void *data)
   482	{
   483		if ((dev->bus == &auxiliary_bus_type) && dev->driver) {
   484			struct auxiliary_driver *adrv = to_auxiliary_drv(dev->driver);
   485			struct auxiliary_device *adev = to_auxiliary_dev(dev);
   486	
   487			if (adrv->resume)
   488				adrv->resume(adev);
   489		}
   490		return 0;
   491	}
   492	
 > 493	static int pcie_port_adev_suspend_iter(struct device *dev, void *data)
   494	{
   495		if ((dev->bus == &auxiliary_bus_type) && dev->driver) {
   496			struct auxiliary_driver *adrv = to_auxiliary_drv(dev->driver);
   497			struct auxiliary_device *adev = to_auxiliary_dev(dev);
   498			pm_message_t pm = {};
   499	
   500			if (adrv->suspend)
   501				adrv->suspend(adev, pm);
   502		}
   503		return 0;
   504	}
   505	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
