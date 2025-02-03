Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EA0211A06
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 22:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738622559; cv=none; b=qGjn04jr9t77oyULs6L4FfObqWu/Svo16qJJicEqWcI9mqIZgWxLmdNUUvykOrxWi7UfUTxzrgTIR+4FVo0WWz0Mcyz0sal19Y82lftVqtB8W4yL+2g+XUFXP2+i2lzIY6Oqip2U2MUpcXv2jPqmMljU9OnhvyTiTPNgtPHDRkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738622559; c=relaxed/simple;
	bh=3WvfBwyzZHNb1SU3k2IkxMWpeX6YrAml5v0XAc9JGVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GaZ+EkQpIAxTCxY0ETdp9p5yKnkJFTKDC1nx6HBzTyK52jXdeiCpEOw7wtLI9f7DhuYtLhW8qG7xmlt+XsmGZEJtRIMBCwSdZE7NA1w6YS4Fp4dvkjGXwG7gF3yRxcumew+6NunrN4cYEmetd2UV8YfD02cgpbHXkFOqb9a3SEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bsKh97JG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bsKh97JG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738622558; x=1770158558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3WvfBwyzZHNb1SU3k2IkxMWpeX6YrAml5v0XAc9JGVU=;
  b=bsKh97JGDIoyTcrjRes0Dp/IQ3vYD/nRZN2/cl/F3IIwaiNsHsPf9846
   xyWAZvm4EUsIre7PLnQNh3oJCVrb0rVKB+r2W5KOKZ6ZPTuFvhbuXMGLM
   LtP+2+Qpu9di6WCZMJgqN0rWTLQUTFjcSsgbzPPyLbphjgGRD/l0Xj3gv
   1Ed5OETFpJr7ROI09us+kTa1FoXNRj4M+ffkD1Cn1aTUb9iswdN7KE3RS
   +hHzM94o1xOjdTWf4tM0uFEvRox1+9BW5FfdF6L1OBuZNevLtv+b3tcv5
   IRBSCgU0zYXRj1jlniXltc40nfvNQqFU+WFMN5hfmcdd6S+t1CqV13qA3
   g==;
X-CSE-ConnectionGUID: ioJ/sp5JTI69fNOcjhfZEg==
X-CSE-MsgGUID: JlhQI/FVT+GArVW+BrbHOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="61604881"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="61604881"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 14:42:34 -0800
X-CSE-ConnectionGUID: QmFNJVqNS7OsLEkURAkaAA==
X-CSE-MsgGUID: dra9XLxYTOScv7p8C+I+uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="110308042"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Feb 2025 14:42:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf59D-000rch-0g;
	Mon, 03 Feb 2025 22:42:31 +0000
Date: Tue, 4 Feb 2025 06:41:44 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:simple_bus 1/1] drivers/base/simple.c:151: warning:
 Function parameter or struct member 'simple_dev' not described in
 'simple_device_put'
Message-ID: <202502040651.LajlgIDT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git simple_bus
head:   2aa9af21ca6842da988fabdacbb2fa8278182c7a
commit: 2aa9af21ca6842da988fabdacbb2fa8278182c7a [1/1] driver core: Create a simple bus for anyone to use
config: i386-buildonly-randconfig-001-20250204 (https://download.01.org/0day-ci/archive/20250204/202502040651.LajlgIDT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040651.LajlgIDT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040651.LajlgIDT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/simple.c:151: warning: Function parameter or struct member 'simple_dev' not described in 'simple_device_put'
>> drivers/base/simple.c:151: warning: Excess function parameter 'simple' description in 'simple_device_put'
>> drivers/base/simple.c:189: warning: Function parameter or struct member 'simple_drv' not described in 'simple_driver_unregister'
>> drivers/base/simple.c:189: warning: Excess function parameter 'drv' description in 'simple_driver_unregister'


vim +151 drivers/base/simple.c

   142	
   143	/**
   144	 * simple_device_put - destroy a simple device
   145	 * @simple: simple device to free
   146	 *
   147	 * Free all memory associated with a simple device.  This function must
   148	 * _only_ be externally called in error cases.  All other usage is a bug.
   149	 */
   150	void simple_device_put(struct simple_device *simple_dev)
 > 151	{
   152		if (IS_ERR_OR_NULL(simple_dev))
   153			return;
   154	
   155		put_device(&simple_dev->dev);
   156	}
   157	EXPORT_SYMBOL_GPL(simple_device_put);
   158	
   159	void simple_device_unregister(struct simple_device *simple_dev)
   160	{
   161		simple_device_del(simple_dev);
   162		simple_device_put(simple_dev);
   163	}
   164	EXPORT_SYMBOL_GPL(simple_device_unregister);
   165	
   166	/**
   167	 * __simple_driver_register - register a driver for simple devices
   168	 * @simple_drv: simple driver structure
   169	 * @owner: owning module/driver
   170	 */
   171	int __simple_driver_register(struct simple_driver *simple_drv, struct module *owner)
   172	{
   173		struct device_driver *drv = &simple_drv->driver;
   174	
   175		drv->owner = owner;
   176		drv->name = simple_drv->name;
   177		drv->bus = &simple_bus_type;
   178		drv->probe_type = PROBE_PREFER_ASYNCHRONOUS;
   179	
   180		return driver_register(&simple_drv->driver);
   181	}
   182	EXPORT_SYMBOL_GPL(__simple_driver_register);
   183	
   184	/**
   185	 * simple_driver_unregister - unregister a driver for simple devices
   186	 * @drv: simple driver structure
   187	 */
   188	void simple_driver_unregister(struct simple_driver *simple_drv)
 > 189	{
   190		driver_unregister(&simple_drv->driver);
   191	}
   192	EXPORT_SYMBOL_GPL(simple_driver_unregister);
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
