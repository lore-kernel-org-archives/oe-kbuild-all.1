Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A721CCEFF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 06:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726297012; cv=none; b=JSyhj6i+M5i7WvxT7GmeHeuP5Dke02Nis5FTGYDX3k65CC/oGKvYsvnAQS2UReL3WGn4Ff6GreXxdz9T+Cm6jftj71FJBnz0EDc0W4oeCOi3T1Gvj6Aot3oxpue1sKf9ybQsl0CXT7raQ5SH3bbzOwjPfFcQ/Qn5u26nuMtNeUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726297012; c=relaxed/simple;
	bh=26MJ6rf1hoM3Hz2MXFTOd76LXRC4To46ehhLIYWNco4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WYp6uqwr5CjL6x1IWcYAkfULyMYDXV7hV/ZMuRqJYzNE75mHmaeWIHP/Z2kohSrC0RBqCjslhMFiJ+mii310hKCn9jBzBUKhqer3TszuCP/iHkoXND8xWdCTQs2JHDaQ2Ps3QFqT35h9BWPIImjgNHWe/fbfcnpBwKUEC1IUjJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kzi9TaME; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kzi9TaME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726297010; x=1757833010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=26MJ6rf1hoM3Hz2MXFTOd76LXRC4To46ehhLIYWNco4=;
  b=Kzi9TaMESrGCk1h+SQAa0fYUrdxaXP05YhBtaCnnUAb6bmMOUcSkZEik
   ViWSyo0ODODKZH1Hy7EusHAyytHLaEg5JrihpZxlJP7sS60xIlHAcZDFI
   8FwAlYtxTNx4EhVzUssHWZjsydlJRj2eejl90yXrKbR5XJPn4sbIszeEK
   4n509BYgMKakcIKPlXt9I73+ZFCB1vypic9KgnYdZg3cNdQ+2QFgAJaK3
   vdA1l8IENo+z2/T7LDd6i231We7BlRHzc/WEpKJ++NbeIEdA0WG2v/loE
   6do7OGu2WaMb+Hz/gXbCkZmhh6mZq6AjQ5f7+MEwEFuqBK62e8EDW16RJ
   A==;
X-CSE-ConnectionGUID: /b4pVI4ZQA6FwvKDpUelFg==
X-CSE-MsgGUID: uQ20GNmkQWGYz+6JDLOTJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35878465"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="35878465"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 23:56:49 -0700
X-CSE-ConnectionGUID: dExEuJhmQ6axh4ZmFn6/wg==
X-CSE-MsgGUID: pk+LwcvuQCKp7foBMr829w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="68320764"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Sep 2024 23:56:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spMi5-0007Ta-10;
	Sat, 14 Sep 2024 06:56:45 +0000
Date: Sat, 14 Sep 2024 14:56:19 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v1 04/12] i2c: isch: Switch to memory mapped IO accessors
Message-ID: <202409141436.QFCDQrRF-lkp@intel.com>
References: <20240911154820.2846187-5-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911154820.2846187-5-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.11-rc7]
[cannot apply to next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/i2c-isch-Add-missed-else/20240912-002224
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240911154820.2846187-5-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 04/12] i2c: isch: Switch to memory mapped IO accessors
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240914/202409141436.QFCDQrRF-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141436.QFCDQrRF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141436.QFCDQrRF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-isch.c: In function 'smbus_sch_probe':
>> drivers/i2c/busses/i2c-isch.c:296:42: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t' {aka 'long long unsigned int'} [-Wformat=]
     296 |                 "SMBus SCH adapter at %04x", res->start);
         |                                       ~~~^   ~~~~~~~~~~
         |                                          |      |
         |                                          |      resource_size_t {aka long long unsigned int}
         |                                          unsigned int
         |                                       %04llx


vim +296 drivers/i2c/busses/i2c-isch.c

   276	
   277	static int smbus_sch_probe(struct platform_device *dev)
   278	{
   279		struct resource *res;
   280		int retval;
   281	
   282		res = platform_get_resource(dev, IORESOURCE_IO, 0);
   283		if (!res)
   284			return -EBUSY;
   285	
   286		sch_smba = devm_ioport_map(&dev->dev, res->start, resource_size(res));
   287		if (!sch_smba) {
   288			dev_err(&dev->dev, "SMBus region %pR already in use!\n", res);
   289			return -EBUSY;
   290		}
   291	
   292		/* set up the sysfs linkage to our parent device */
   293		sch_adapter.dev.parent = &dev->dev;
   294	
   295		snprintf(sch_adapter.name, sizeof(sch_adapter.name),
 > 296			"SMBus SCH adapter at %04x", res->start);
   297	
   298		retval = i2c_add_adapter(&sch_adapter);
   299		if (retval)
   300			sch_smba = NULL;
   301	
   302		return retval;
   303	}
   304	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
