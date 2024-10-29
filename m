Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AAE1863F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 02:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730167287; cv=none; b=XjLUM1OUvmohWidYkeGwOCM4Hxm/b0Jk+nq+ICCdQkn1AlCUnskkMosfbM18CBQTqMIBPimUX/FnDnaCwjPqpU8iBSHeX2+68I7hjfFUWkFURQZ9y6I/zTfSnUpri6jMl/3lTDEpxDXorVUDEK2/5XzvZu4sKHKdgyO00hXJhTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730167287; c=relaxed/simple;
	bh=BiiLUyj9t9Yas5MJU5WFh4TMJF+H7/x/UH/JQiZOAzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V9GCOPiL/T5MuyFt4VWd1TnJlO3yujfFjBoGE/rreCj0tloz9C98Sb1++CEFvaucVmyZsjMI4DhRnbHFxugdD36J1IvnYTQm+0O2rhgMQ8EEtJ5c/DDkQyZ9bB440ZtiYzREgJB/SUGiTP74NYHgWp9uA19tXo6DfNjta7rXdjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBCG7Lh3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBCG7Lh3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730167285; x=1761703285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BiiLUyj9t9Yas5MJU5WFh4TMJF+H7/x/UH/JQiZOAzk=;
  b=VBCG7Lh3qCTPRV5xXCj1Ww9XJdvG/ZCx2jEyCevFj4UK8JVMT7rWjcCE
   oYWzZR0IhfpykRCdXTtnbum2ORK9EBhvoLVjmo3Se+36r356ZHQAG6StW
   YDsU9DBUdH8N0WUgRnxDwr3G0eAB/Ve31P0+5E/zDdWGUyWKIXcUdQREa
   PStaEtxeZ5nQeCF2T1eDoSMNfePAhzUKSnbWqGs/4Ymnoi1fQPUzahaMf
   kmNskONrzvDADRo6WMeTvFCzGHKwNHH8K5kv07VGe33MuWm+lAxXZXFh2
   neUPTYZEGu3qeplgCfs1e3InpQhPWA296qWteHY8TWdkGnRLfVRn4yLwZ
   Q==;
X-CSE-ConnectionGUID: l87u8x4cRfOChZPLD9QTCQ==
X-CSE-MsgGUID: x0e7TjE3QZ6+OO7Q3+loiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="33709342"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="33709342"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 19:01:24 -0700
X-CSE-ConnectionGUID: dCUByb0kR4eOoJK8S9RvUA==
X-CSE-MsgGUID: 4ArS2Hj2T9apDvNzCKeMpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="82615229"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Oct 2024 18:56:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5bTG-000d8G-2j;
	Tue, 29 Oct 2024 01:56:34 +0000
Date: Tue, 29 Oct 2024 09:56:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 5435/23883]
 drivers/tty/serial/sc16is7xx.c:1501:1: warning: label 'err_i2c' defined but
 not used
Message-ID: <202410290956.flJi6dhy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mao,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   27399521743732e65e7635fa93bd0cca53981c9e
commit: 1c30433d9fa5c5b48039990ba214c0e8e199a22d [5435/23883] sc16is7xx: missing unregister/delete driver on error in sc16is7xx_init()
config: x86_64-randconfig-071-20241029 (https://download.01.org/0day-ci/archive/20241029/202410290956.flJi6dhy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410290956.flJi6dhy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410290956.flJi6dhy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_init':
>> drivers/tty/serial/sc16is7xx.c:1501:1: warning: label 'err_i2c' defined but not used [-Wunused-label]
    1501 | err_i2c:
         | ^~~~~~~
   drivers/tty/serial/sc16is7xx.o: warning: objtool: sc16is7xx_gpio_get()+0x104: sibling call from callable instruction with modified stack frame
   drivers/tty/serial/sc16is7xx.o: warning: objtool: sc16is7xx_gpio_direction_input()+0x13: sibling call from callable instruction with modified stack frame
   drivers/tty/serial/sc16is7xx.o: warning: objtool: sc16is7xx_gpio_set()+0x105: sibling call from callable instruction with modified stack frame
   drivers/tty/serial/sc16is7xx.o: warning: objtool: sc16is7xx_gpio_direction_output()+0x2ba: sibling call from callable instruction with modified stack frame
   drivers/tty/serial/sc16is7xx.o: warning: objtool: sc16is7xx_set_baud()+0xdf: sibling call from callable instruction with modified stack frame


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
