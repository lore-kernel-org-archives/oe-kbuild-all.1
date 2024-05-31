Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D675381A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 15:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717170582; cv=none; b=rjCZt309mvA+cCVmgTDGAEkOUzLeJcNFZ3R2qmpPd/y3E9/CmLA4x/egZ7FGsMIxhr6S4Yp2zq9al8u5/wG2e339zN7JhkBnQH84+FBfu44yBki4qogSGEcjiRxWqsRWvCYoTgBA3jC88MmMWIYpbXWqHeKlRY4uyGKctP2p12Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717170582; c=relaxed/simple;
	bh=Vuh+SycE1w/bUKUJLSoE1fpjlzZtjVsV0+Dx4H+csDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KuKhRp0SP71KgFQiIcor2fOEiDTM+s3s/ER/MAERvHJNEvJ7hE/uFA00pm/DUzKDtY7aRW0UVkzuhhEAuZ2YWcfa8+ApRUqA3pU2uHShx3V70Txp3G/MhNMXMtU2l2aXPKx7izyguz/VHmoavlE7Miu/PPxhrCyLVRIMDcdG6zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nH2gzUu/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nH2gzUu/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717170580; x=1748706580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vuh+SycE1w/bUKUJLSoE1fpjlzZtjVsV0+Dx4H+csDc=;
  b=nH2gzUu/O5UCtWh3E6HdfDs+67w7ayrwJcSe1kg9uv2+hXGo9xKKMhqB
   OLdTQT2iP5LNk04VecfLLade2KIv/DNCbY9gOLL0GdUnWNZTo7jWN322O
   6CYTV1h8sUZOez8hit5gQkTeH/BTvhdAuMAmwTpQQchf+akxghPtqm1ts
   BdMP3FMi6GEO+envrfzuIR4ZfOZqcYpgtVYDHUUuG3CtbZx1W2pXGMxVC
   1EvcTN3gdQPxc4ZNynDmeLEV+jCzcjOtlhIZDpgzyYsGDqNzoparNJpv+
   AiqA8z94EpkEDL7rMhJOpwYl6hlFBPxrRXHTocScpxLm1I4QDs2oETfTE
   A==;
X-CSE-ConnectionGUID: 8esTAmqhQ96pcEK3MpIqBA==
X-CSE-MsgGUID: c7WOnYjCQXePKoD3YD1fIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="17565724"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="17565724"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 08:49:39 -0700
X-CSE-ConnectionGUID: KfwHFBCNRAKDKX4sMAU7Rg==
X-CSE-MsgGUID: Y1JAHzgfRsyfhH4NVoabDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="36143168"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 31 May 2024 08:49:38 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD4VY-000HIT-2R;
	Fri, 31 May 2024 15:49:34 +0000
Date: Fri, 31 May 2024 23:49:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_b2_v6_610_rc1_full 54/56]
 drivers/tty/serial/8250/8250_platform.c:202:21: warning: assignment makes
 pointer from integer without a cast
Message-ID: <202405312330.VGizZ0aj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v6_610_rc1_full
head:   3b4a1bf48c18783296534eb56333e82405b29df7
commit: 6cf4d904859b744e410d58c0ca3ffe6e56d37b6c [54/56] serial: 8250_platform: Enable generic 16550A platform devices
config: i386-buildonly-randconfig-002-20240531 (https://download.01.org/0day-ci/archive/20240531/202405312330.VGizZ0aj-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405312330.VGizZ0aj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405312330.VGizZ0aj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_platform.c: In function 'serial8250_platform_probe':
   drivers/tty/serial/8250/8250_platform.c:202:23: error: implicit declaration of function 'devm_ioremap'; did you mean 'ioremap'? [-Werror=implicit-function-declaration]
      uart.port.membase = devm_ioremap(dev, uart.port.mapbase, uart.port.mapsize);
                          ^~~~~~~~~~~~
                          ioremap
>> drivers/tty/serial/8250/8250_platform.c:202:21: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
      uart.port.membase = devm_ioremap(dev, uart.port.mapbase, uart.port.mapsize);
                        ^
   cc1: some warnings being treated as errors


vim +202 drivers/tty/serial/8250/8250_platform.c

   160	
   161	/*
   162	 * Generic 16550A platform devices
   163	 */
   164	static int serial8250_platform_probe(struct platform_device *pdev)
   165	{
   166		struct device *dev = &pdev->dev;
   167		struct uart_8250_port uart;
   168		struct resource *regs;
   169		unsigned char iotype;
   170		int ret, line;
   171	
   172		memset(&uart, 0, sizeof(uart));
   173		regs = platform_get_resource(pdev, IORESOURCE_IO, 0);
   174		if (regs) {
   175			uart.port.iobase = regs->start;
   176			iotype = UPIO_PORT;
   177		} else {
   178			regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   179			if (!regs) {
   180				dev_err(dev, "no registers defined\n");
   181				return -EINVAL;
   182			}
   183	
   184			uart.port.mapbase = regs->start;
   185			uart.port.mapsize = resource_size(regs);
   186			uart.port.flags = UPF_IOREMAP;
   187			iotype = UPIO_MEM;
   188		}
   189	
   190		uart.port.uartclk = 1843200; // default
   191		uart.port.type = PORT_16550A;
   192		uart.port.dev = &pdev->dev;
   193		uart.port.flags |= UPF_SKIP_TEST | UPF_BOOT_AUTOCONF;
   194		ret = uart_read_and_validate_port_properties(&uart.port);
   195		/* no interrupt -> fall back to polling */
   196		if (ret == -ENXIO)
   197			ret = 0;
   198		if (ret)
   199			return ret;
   200	
   201		if (uart.port.mapbase) {
 > 202			uart.port.membase = devm_ioremap(dev, uart.port.mapbase, uart.port.mapsize);
   203			if (!uart.port.membase)
   204				return -ENOMEM;
   205		}
   206	
   207		/*
   208		 * The previous call may not set iotype correctly when reg-io-width
   209		 * property is absent and it doesn't support IO port resource.
   210		 */
   211		uart.port.iotype = iotype;
   212	
   213		line = serial8250_register_8250_port(&uart);
   214		if (line < 0)
   215			return -ENODEV;
   216	
   217		platform_set_drvdata(pdev, (void *)((long)line + 1));
   218		return 0;
   219	}
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
