Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA8E9478
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 00:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747183527; cv=none; b=hFj7ZGS6g9aFvueSxROQoGvJ3ffF0DQFml7aaGoUOoxgMV8bhbpP/SkEQV/CTOj2/oeMAlr40YOEZdrwG2gYZxz1vJrvS1hxFsFwnxmWQdw8l7teirHs9UDmFeS4o41wCrn/pJ8wi6iRfJH+kSvmedUUxykc6iY+/jOBz/MnKaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747183527; c=relaxed/simple;
	bh=O88L+dsQWL9yk1m9q5/xF4ZqsWQ2FOiiA7YmPEmyVhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mzQFJLrEUt/A8p/rRkB4VYwT6hxuDKBJC/6hATN+aatKQA00tYQ+K+KiYEYW15XzXAn7h6TLQDeqnhcAxDcSt0Q7IVb0mJR1DltgnsGMc5ZNjuvYNPHhTKKeOgqmPLeK5Gwb+Alat9ZLRBY1olvFb4bBu32UkTYi32b2X9EzEpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=chzi0vJ/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="chzi0vJ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747183525; x=1778719525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O88L+dsQWL9yk1m9q5/xF4ZqsWQ2FOiiA7YmPEmyVhA=;
  b=chzi0vJ/Xh59GHhgZX4n/t/dLvG3SLhuhy6kHZuZyZ85S5kw+4DerpQA
   N3gXwyhfsRuPSxHyPNhZ8llb2ZPXNMzOg7m7DMkZC9hf5HtM9tqBtIug1
   2ttGfolrvNWZQxwRFJc8YEn4S4dNoBXwZBny4Nm7v3bC2WPZR6lc5cAgS
   v37U4J/tlp6R4jklU/Hwm0HX2aTwkqOXB6+e2DkESz1l6SUJBjM1qsFOL
   0/07SSHESkxwsFSKLxmzhgUEi0lyoU1JW+6EBy+HbBXDQQzL8rx62ZjwX
   EFrpgqwTzXoKQpgE3Br73j354qxiKIeq0CGCJNpViZQT3kHF4HSUoaQn4
   Q==;
X-CSE-ConnectionGUID: WponbGBzSha8AOrILSRZNw==
X-CSE-MsgGUID: E25oYwZOQueE4UHmJ/jABg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48989320"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="48989320"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 17:45:24 -0700
X-CSE-ConnectionGUID: Ngdyp3mmSQGDnJBHi/8uPg==
X-CSE-MsgGUID: pUl4zBYJTHygH9KmHaYAMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="161171920"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 May 2025 17:45:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF0FM-000GXX-38;
	Wed, 14 May 2025 00:45:20 +0000
Date: Wed, 14 May 2025 08:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 22/66] drivers/tty/serial/8250/8250_ioc3.c:68:20:
 error: assignment to 'u32 (*)(struct uart_port *, unsigned int)' {aka
 'unsigned int (*)(struct uart_port *, unsigned int)'} from incompatible
 pointer type 'unsigned int (*)(struct uart_port *, int)'
Message-ID: <202505140854.rBQU8Yzd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   0c07400b8a875059691f501d6465c08e59aa0e05
commit: a40c82bee70c6e1c8e4e3cfd90e78d81c4338079 [22/66] serial: sanitize uart_port::serial_{in,out}() types
config: arm64-randconfig-003-20250514 (https://download.01.org/0day-ci/archive/20250514/202505140854.rBQU8Yzd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505140854.rBQU8Yzd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505140854.rBQU8Yzd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_ioc3.c: In function 'serial8250_ioc3_probe':
>> drivers/tty/serial/8250/8250_ioc3.c:68:20: error: assignment to 'u32 (*)(struct uart_port *, unsigned int)' {aka 'unsigned int (*)(struct uart_port *, unsigned int)'} from incompatible pointer type 'unsigned int (*)(struct uart_port *, int)' [-Werror=incompatible-pointer-types]
     up.port.serial_in = ioc3_serial_in;
                       ^
>> drivers/tty/serial/8250/8250_ioc3.c:69:21: error: assignment to 'void (*)(struct uart_port *, unsigned int,  u32)' {aka 'void (*)(struct uart_port *, unsigned int,  unsigned int)'} from incompatible pointer type 'void (*)(struct uart_port *, int,  int)' [-Werror=incompatible-pointer-types]
     up.port.serial_out = ioc3_serial_out;
                        ^
   cc1: some warnings being treated as errors


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
