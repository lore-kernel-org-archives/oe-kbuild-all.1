Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201875;
	b=t7rMPy+a5IEa30CDBM8VvIyA2yZ+eYlMbU1VUSNp1foNAO08us94jpJwS+uDh/b4S9i9
	 0du38OUWc1yF/+98eM8+Zv5+I5+JE1lCcA6GII/mg6ebMpxg9Ba3SsJIXHPlLxL4EpJJ4
	 7G/2qW+uOBsMcFsZEU+SvJuF9qnjmwW3HqLlmyCvOmdl+0Bwq5v8cd1wQowUu/wMo/S2u
	 WPnxCf3FFQT6tx05/t8OorL1NVg7heOxqcD1qk8U4CaxyjGHOXTbgSRMK2TjZQH9xBZd/
	 8jXiVBnPhdYg/nOQFfeY3Bkxib/0lI1Oq0vSNd7r+6RxiC0sFcHyKx/F1LWylFoe+lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201875;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=m1TclirPbvgcUaKJEUxrCyuPafo2Iw/f2gyC7433bBM=;
	b=IfNJRlVriVEV+WzrDl2q7/2H2+0bZLtvrafdIIRoRIeJl5vH6WBwCv8LPkipkA2K1fLx
	 G/IQXhXm6Qjp7VaajJbFuGj7Xl/NQVbVsfUK1Cb3n3fa86fSPKQbzAJvgprxZztJt2uSo
	 me+BrwWhkF5ZaLkLV9cF9yUWZEe3tPv0YcGi5uGYgWDvQE1cVB+KvMAZFHVY59Yjlm4Y7
	 tLUpxYDwL3GVvfrs+J8vQgnzKuYL+OCSIE4IbbgXxi82PcWlAQr4V2VwLub/QSjVmrBEX
	 znWcpjx3+dSqkWhYqvswkl2tByXVYFee3NEOwhtRtB9VNNKPQZLcB1MSr2mbJcekwDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VTPE+Q8G;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393EF606A321
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 15:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 393EF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VTPE+Q8G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793201875; x=1824737875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n5y+3lokQkHIae8lv2QaFzSFFEpFbB8zqhxkYWH3t+w=;
  b=VTPE+Q8GURNJTRdOYb5QkmvDSQTE0WLAZ0Wr0UBRhiI6oTBvM4hXGOMW
   np9N6MTXPOzqqAveSRVw57gCSLmFWVDgqo+P3k0oVI8vyLbszW5GbROrw
   gxvZiwi0k4Ay/lk3N0Kt+h3wFD1Cap74tX6eiUW1A3C4MUe1VjKv25z4H
   qLPJ1AU/sKe/OPdYta7SeLKR4zouojNWLWH6ZKS9U79D0f93I6sF2KrUa
   w/VLzrPAIc9sT0Ea2WiMw5Z/u4DQ9zSmz8CljcRYtj4lhoFXFkkWKHOQc
   HSJpEHKQtEUGzaXO6sesibAbjBdltCSsTJBNHMRBppERLbgqg0JGYP+8n
   A==;
X-CSE-ConnectionGUID: XIQIj2seRwenoqohYV/O1A==
X-CSE-MsgGUID: 2TMgjSWsR2W56u6pgEPoiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2020445"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="2020445"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 08:37:55 -0700
X-CSE-ConnectionGUID: phNut9efTymOfv9j36/4ug==
X-CSE-MsgGUID: WlSJRroXSVWbXiQPsjfBbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4861838"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Oct 2026 08:37:49 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM5ii-00000000Ytw-2DkW;
	Wed, 28 Oct 2026 15:37:44 +0000
Date: Wed, 28 Oct 2026 23:37:22 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Joshua Rogers <linux@joshua.hu>,
	Chris Mason <chris.mason@fusionio.com>,
	Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev, Tony Lindgren <tony@atomide.com>,
	Rafael Gago Castano <rgc@hms.se>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Peter Hurley <peter@hurleysoftware.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>,
	Frank Li <Frank.Li@nxp.com>, Sherry Sun <sherry.sun@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Robert Baldyga <r.baldyga@samsung.com>,
	Thomas Abraham <thomas.abraham@linaro.org>,
	Kukjin Kim <kgene.kim@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH 14/24] serial: 8250: ioc3: store registered line number
 in driver data
Message-ID: <202610282338.BSNv628b-lkp@intel.com>
References: <20261027-tty-llm-v1-14-99b0202ae546@linuxfoundation.org>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-tty-llm-v1-14-99b0202ae546@linuxfoundation.org>

Hi Greg,

kernel test robot noticed the following build errors:

[auto build test ERROR on d135ab453a7400a34930bdda1ef4bdc8acfac80e]

url:    https://github.com/intel-lab-lkp/linux/commits/Greg-Kroah-Hartman/vt-serialise-the-producers-of-the-flip-buffer/20261027-120627
base:   d135ab453a7400a34930bdda1ef4bdc8acfac80e
patch link:    https://lore.kernel.org/r/20261027-tty-llm-v1-14-99b0202ae546%40linuxfoundation.org
patch subject: [PATCH 14/24] serial: 8250: ioc3: store registered line number in driver data
config: parisc-randconfig-1000-20261028 (https://download.01.org/0day-ci/archive/20261028/202610282338.BSNv628b-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610282338.BSNv628b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610282338.BSNv628b-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_ioc3.c: In function 'serial8250_ioc3_probe':
>> drivers/tty/serial/8250/8250_ioc3.c:66:9: error: 'data' undeclared (first use in this function); did you mean '_data'?
      66 |         data->line = line;
         |         ^~~~
         |         _data
   drivers/tty/serial/8250/8250_ioc3.c:66:9: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/tty/serial/8250/8250_ioc3.c:66:22: error: 'line' undeclared (first use in this function)
      66 |         data->line = line;
         |                      ^~~~


vim +66 drivers/tty/serial/8250/8250_ioc3.c

    30	
    31	static int serial8250_ioc3_probe(struct platform_device *pdev)
    32	{
    33		struct uart_8250_port *uport, up;
    34		struct resource *r;
    35		void __iomem *membase;
    36		int irq;
    37	
    38		r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
    39		if (!r)
    40			return -ENODEV;
    41	
    42		membase = devm_ioremap(&pdev->dev, r->start, resource_size(r));
    43		if (!membase)
    44			return -ENOMEM;
    45	
    46		irq = platform_get_irq(pdev, 0);
    47		if (irq < 0)
    48			irq = 0; /* no interrupt -> use polling */
    49	
    50		/* Register serial ports with 8250.c */
    51		memset(&up, 0, sizeof(struct uart_8250_port));
    52		up.port.iotype = UPIO_MEM;
    53		up.port.uartclk = IOC3_UARTCLK;
    54		up.port.type = PORT_16550A;
    55		up.port.irq = irq;
    56		up.port.flags = (UPF_BOOT_AUTOCONF | UPF_SHARE_IRQ);
    57		up.port.dev = &pdev->dev;
    58		up.port.membase = membase;
    59		up.port.mapbase = r->start;
    60		up.port.serial_in = ioc3_serial_in;
    61		up.port.serial_out = ioc3_serial_out;
    62		uport = serial8250_register_8250_port(&up);
    63		if (IS_ERR(uport))
    64			return PTR_ERR(uport);
    65	
  > 66		data->line = line;
    67		platform_set_drvdata(pdev, uport);
    68		return 0;
    69	}
    70	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
