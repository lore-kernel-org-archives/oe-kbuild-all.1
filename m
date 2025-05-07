Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C157B211A28
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 06:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746600206; cv=none; b=WQwzzCsairtDPPa21y+3V0kgGjh3vHAUcSUA6CP9dUCZERYjuAo5UUopqSD4TXsTCz8vYdqtne8n+WEafCwMy1F8hfFWaheILX3VhY1g14fESLC68o+9646XSsGMQ/yHeccNGEPInFuW8KHSLlgEra2H6tfw6+qpZ+ZyG72TicU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746600206; c=relaxed/simple;
	bh=/Ec0mtJ5eFwCaLufm3iIqRcQjI5bQNenPfAq09fjJi8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q98DH/1v/kta39t/ThZJLFwJGPGXudi4+WoqUACk1HLBmqjLrLO0PeBxQZPfU+3A2z4QBJ+Wsq1w7mbNM31wSVBvdiZEGwNS14nBP8Nv9FDQzNPInHvFZornztHvsJJgf87cAVYam7VF0+62vwIa7ET/IJ+f9T7ubRyKkIwc620=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MA7PxqZl; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MA7PxqZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746600205; x=1778136205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Ec0mtJ5eFwCaLufm3iIqRcQjI5bQNenPfAq09fjJi8=;
  b=MA7PxqZl9ZcctkkW6GG+xtV/t0hueVS5LHHp+QIwZT5Ik8jfAyXY3wkl
   78KzDAdYWRHOG5bNQ5OVpE02ZA7LvWWk5mCZArHdA1Gwweag/6SdK8H2/
   UDUdm02XzHamkrZ3Kpbd0maUtrQsr3IQ6FAkKUvNHJxAKW1XkoPjk282U
   tjY4fR3UOFnLfXwWuPokxQfJuhit6WwerSKdc6rov+uH5yjrhtSZlICRw
   PsCvOSOs35g2DbbZCADbzg/mPhugRij5Oq6odj4T/5/P3NWBJJYzNi5k3
   gvhxuQQ8eMrIUvyAciZw4z5T7FuhUAAYS0XF2mqewxcm+2p/m2pV7rgJW
   g==;
X-CSE-ConnectionGUID: BA2lMPQUQdyHIbwxZXkfrA==
X-CSE-MsgGUID: tnKJitovR+qfRdGSSoxUxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48458742"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48458742"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:43:17 -0700
X-CSE-ConnectionGUID: HvGCkD9FSGmMCiUnFtmkZA==
X-CSE-MsgGUID: 3Kn5GyP3QayAiO9qSUQEHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136380769"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 May 2025 23:43:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCYUq-0007Dj-0V;
	Wed, 07 May 2025 06:43:12 +0000
Date: Wed, 7 May 2025 14:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 70/74] drivers/tty/serial/8250/8250_ioc3.c:68:16:
 error: 'struct uart_port' has no member named 'serial_in'
Message-ID: <202505071406.4eWSizgv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   6c308d0b04c8c17ab39fcf6d4ed9a9033efc363f
commit: 762487840da49161e29cf92e5cd4a86df4ab40ec [70/74] ops2
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250507/202505071406.4eWSizgv-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071406.4eWSizgv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071406.4eWSizgv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_ioc3.c: In function 'serial8250_ioc3_probe':
>> drivers/tty/serial/8250/8250_ioc3.c:68:16: error: 'struct uart_port' has no member named 'serial_in'
      68 |         up.port.serial_in = ioc3_serial_in;
         |                ^
>> drivers/tty/serial/8250/8250_ioc3.c:69:16: error: 'struct uart_port' has no member named 'serial_out'
      69 |         up.port.serial_out = ioc3_serial_out;
         |                ^


vim +68 drivers/tty/serial/8250/8250_ioc3.c

0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  33  
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  34  static int serial8250_ioc3_probe(struct platform_device *pdev)
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  35  {
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  36  	struct ioc3_8250_data *data;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  37  	struct uart_8250_port up;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  38  	struct resource *r;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  39  	void __iomem *membase;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  40  	int irq, line;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  41  
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  42  	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  43  	if (!r)
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  44  		return -ENODEV;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  45  
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  46  	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  47  	if (!data)
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  48  		return -ENOMEM;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  49  
b0ef7cda8d9be4 Linus Torvalds      2020-02-08  50  	membase = devm_ioremap(&pdev->dev, r->start, resource_size(r));
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  51  	if (!membase)
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  52  		return -ENOMEM;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  53  
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  54  	irq = platform_get_irq(pdev, 0);
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  55  	if (irq < 0)
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  56  		irq = 0; /* no interrupt -> use polling */
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  57  
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  58  	/* Register serial ports with 8250.c */
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  59  	memset(&up, 0, sizeof(struct uart_8250_port));
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  60  	up.port.iotype = UPIO_MEM;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  61  	up.port.uartclk = IOC3_UARTCLK;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  62  	up.port.type = PORT_16550A;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  63  	up.port.irq = irq;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  64  	up.port.flags = (UPF_BOOT_AUTOCONF | UPF_SHARE_IRQ);
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  65  	up.port.dev = &pdev->dev;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  66  	up.port.membase = membase;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  67  	up.port.mapbase = r->start;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09 @68  	up.port.serial_in = ioc3_serial_in;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09 @69  	up.port.serial_out = ioc3_serial_out;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  70  	line = serial8250_register_8250_port(&up);
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  71  	if (line < 0)
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  72  		return line;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  73  
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  74  	platform_set_drvdata(pdev, data);
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  75  	return 0;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  76  }
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  77  

:::::: The code at line 68 was first introduced by commit
:::::: 0ce5ebd24d25f02c73940f047b12733d84b125e8 mfd: ioc3: Add driver for SGI IOC3 chip

:::::: TO: Thomas Bogendoerfer <tbogendoerfer@suse.de>
:::::: CC: Paul Burton <paulburton@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
