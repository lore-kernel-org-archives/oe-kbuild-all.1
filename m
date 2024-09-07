Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475D732C8E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 04:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725683539; cv=none; b=LXQKdkJSrh2jRGKwuuwo98HMOnBV93jWt7CVwkrSzdfnjW3KljVcTfPVst/xkQ0mKdmW7yNQpRfPjFaliBtqYHh7GD2xtK6FT54yOCK0ISnA8YcEnaB7OMT/m2M2WjjTkNqsLZMBe6w5Wh4SkxN1WjYQwdZ4rg+OygbrpqsExbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725683539; c=relaxed/simple;
	bh=OEjJ3X/8TNZF0MAjBvNiaPIOPt5WHx/Vzr6bfXEq1jU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aNyq08wzHVFMQw88VIbfeRBd6O/NUfydf2X2YzW8cXqiUHceyoTbHprem3dEuE+tlvTivjdBaKh1aD4FRHf9RgWib2n4EYCJ1g8UnYUsWs5SkwxSheJVsOdjVksWyrPBB8D8I58tyw3ihOGcFqziiomHYbmrlk4RJss7u0IqwS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dvTGTtSy; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvTGTtSy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725683537; x=1757219537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OEjJ3X/8TNZF0MAjBvNiaPIOPt5WHx/Vzr6bfXEq1jU=;
  b=dvTGTtSyEHE7SA4gm9WIGbmRvICz7DVC/+o2WZOFaJ5qFtJnJ2D/Haa4
   i/+DfDW0Oqou0RQOtBIlsnycBHduFIe5LZs4nJIyWn9h5drqTYbdiaYJw
   VY7NXjwXv56afsu3gPSk1Tn1+n8xSXgBGD71SAedjPQ2knhMHoPNP2h0h
   Q3bY5NlYW/g6RSecf9rizsCcas22EfSOfk14FTLA9N/QJ5Datep2s852D
   klfvVhGnUU8RCJFDLlEI4pU0gRhsYT6JANiM0swYB46Qii3R41a9uZ2On
   OdbmvgqSAa1vQHDlyconB+Qip1SuiqReQ1KOXkCIHxCukr/vkug4I2m7J
   Q==;
X-CSE-ConnectionGUID: II3cKdIWQ3aCHvUtmbTrzQ==
X-CSE-MsgGUID: 5Eay/aTARyuvQHiSgkZjEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35026505"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="35026505"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 21:32:16 -0700
X-CSE-ConnectionGUID: i/48+5JnR2GVYyJIirvZpg==
X-CSE-MsgGUID: 8kjql8JhTwmT9wszVlr8hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="89417848"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Sep 2024 21:32:14 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smn7M-000C7T-1j;
	Sat, 07 Sep 2024 04:32:12 +0000
Date: Sat, 7 Sep 2024 12:31:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 5435/23701]
 drivers/tty/serial/sc16is7xx.c:1501:1: warning: label 'err_i2c' defined but
 not used
Message-ID: <202409071206.ARybrxJe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   13b424f97ef548612c760cfd0892f96de96707e0
commit: 1c30433d9fa5c5b48039990ba214c0e8e199a22d [5435/23701] sc16is7xx: missing unregister/delete driver on error in sc16is7xx_init()
config: x86_64-randconfig-121-20240906 (https://download.01.org/0day-ci/archive/20240907/202409071206.ARybrxJe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071206.ARybrxJe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071206.ARybrxJe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/sc16is7xx.c:1501:1: sparse: sparse: unused label 'err_i2c'
   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_init':
>> drivers/tty/serial/sc16is7xx.c:1501:1: warning: label 'err_i2c' defined but not used [-Wunused-label]
    1501 | err_i2c:
         | ^~~~~~~


vim +/err_i2c +1501 drivers/tty/serial/sc16is7xx.c

  1487	
  1488	#ifdef CONFIG_SERIAL_SC16IS7XX_SPI
  1489		ret = spi_register_driver(&sc16is7xx_spi_uart_driver);
  1490		if (ret < 0) {
  1491			pr_err("failed to init sc16is7xx spi --> %d\n", ret);
  1492			goto err_spi;
  1493		}
  1494	#endif
  1495		return ret;
  1496	
  1497	err_spi:
  1498	#ifdef CONFIG_SERIAL_SC16IS7XX_I2C
  1499		i2c_del_driver(&sc16is7xx_i2c_uart_driver);
  1500	#endif
> 1501	err_i2c:
  1502		uart_unregister_driver(&sc16is7xx_uart);
  1503		return ret;
  1504	}
  1505	module_init(sc16is7xx_init);
  1506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
