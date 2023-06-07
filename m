Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE2D7C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 02:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686106232; x=1717642232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Omrh7+E8pecVzrVXbUgrGc2bNPNRVFgUrdE4PiRQvCg=;
  b=X401/11RpEn9qpXbJQVzRkt1aTKyLHm/3m2Ky5QI/on+A6top8tk3tAQ
   svhgyvTkANXKvopPxXXyWkRuQQuh9Naf8by5F5qvkGE+IWZAOvVyHGnfm
   VXHEW1lWpRW6OOS3boEUdqjA2m1Uywzu7FFneO7WJofzucpg33WmhnOwY
   dzYlIqVrhPclEhfp5xIR8KKsGEXnb+recAoou0C9XUxe5S4InbtknmCyR
   bdkfvB7ZFNRiWmAjJimCKhsPybDBunMi9W2rbuvcCLD3Ype2UUUqoAwgB
   I51Rv3LDMJmXxqlETv/UTO/fE+14UuNEASyfsRLk+xiFRF2q9aeQr9/bw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="422701319"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="422701319"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 19:50:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="709320839"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="709320839"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Jun 2023 19:50:31 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6jFm-00062F-0n;
	Wed, 07 Jun 2023 02:50:30 +0000
Date: Wed, 7 Jun 2023 10:50:18 +0800
From: kernel test robot <lkp@intel.com>
To: Pallav Joshi <pallav.joshi@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Simek <monstr@monstr.eu>
Subject: [pinchartl-media:muxed/2022.2/base 419/740]
 drivers/staging/uartlite-rs485/uartlite-rs485.c:116:25: warning:
 'ulite_ports' defined but not used
Message-ID: <202306071049.9uEFqZmQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/pinchartl/media.git muxed/2022.2/base
head:   e26621179c3b1834a1bb17e9a38e47238ac63bf5
commit: 9cebd33ae5666e6ff30f045a1179bc8ad64973d0 [419/740] staging: uartlite-rs485: Initial commit to add drv
config: x86_64-randconfig-r015-20230607 (https://download.01.org/0day-ci/archive/20230607/202306071049.9uEFqZmQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2022.2/base
        git checkout 9cebd33ae5666e6ff30f045a1179bc8ad64973d0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/staging/uartlite-rs485/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306071049.9uEFqZmQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/uartlite-rs485/uartlite-rs485.c:32:33: error: 'CONFIG_SERIAL_UARTLITE_NR_UARTS' undeclared here (not in a function); did you mean 'CONFIG_SERIAL_UARTLITE_RS485'?
      32 | #define ULITE_NR_UARTS          CONFIG_SERIAL_UARTLITE_NR_UARTS
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/uartlite-rs485/uartlite-rs485.c:116:37: note: in expansion of macro 'ULITE_NR_UARTS'
     116 | static struct uart_port ulite_ports[ULITE_NR_UARTS];
         |                                     ^~~~~~~~~~~~~~
>> drivers/staging/uartlite-rs485/uartlite-rs485.c:116:25: warning: 'ulite_ports' defined but not used [-Wunused-variable]
     116 | static struct uart_port ulite_ports[ULITE_NR_UARTS];
         |                         ^~~~~~~~~~~


vim +/ulite_ports +116 drivers/staging/uartlite-rs485/uartlite-rs485.c

    27	
    28	#define ULITE_NAME		"ttyULR"
    29	#define ULITE_DRV_NAME		"uartlite_rs485"
    30	#define ULITE_MAJOR		205
    31	#define ULITE_MINOR		187
  > 32	#define ULITE_NR_UARTS		CONFIG_SERIAL_UARTLITE_NR_UARTS
    33	
    34	/* ---------------------------------------------------------------------
    35	 * Register definitions
    36	 *
    37	 * For register details see datasheet:
    38	 * https://www.xilinx.com/support/documentation/ip_documentation/opb_uartlite.pdf
    39	 */
    40	
    41	#define ULITE_RX		0x00
    42	#define ULITE_TX		0x04
    43	#define ULITE_STATUS		0x08
    44	#define ULITE_CONTROL		0x0c
    45	
    46	#define ULITE_REGION		16
    47	
    48	#define ULITE_STATUS_RXVALID	0x01
    49	#define ULITE_STATUS_RXFULL	0x02
    50	#define ULITE_STATUS_TXEMPTY	0x04
    51	#define ULITE_STATUS_TXFULL	0x08
    52	#define ULITE_STATUS_IE		0x10
    53	#define ULITE_STATUS_OVERRUN	0x20
    54	#define ULITE_STATUS_FRAME	0x40
    55	#define ULITE_STATUS_PARITY	0x80
    56	
    57	#define ULITE_CONTROL_RST_TX	0x01
    58	#define ULITE_CONTROL_RST_RX	0x02
    59	#define ULITE_CONTROL_IE	0x10
    60	#define UART_AUTOSUSPEND_TIMEOUT	3000	/* ms */
    61	
    62	struct uartlite_data {
    63		const struct uartlite_reg_ops *reg_ops;
    64		struct clk *clk;
    65	};
    66	
    67	struct uartlite_reg_ops {
    68		u32 (*in)(void __iomem *addr);
    69		void (*out)(u32 val, void __iomem *addr);
    70	};
    71	
    72	static u32 uartlite_inbe32(void __iomem *addr)
    73	{
    74		return ioread32be(addr);
    75	}
    76	
    77	static void uartlite_outbe32(u32 val, void __iomem *addr)
    78	{
    79		iowrite32be(val, addr);
    80	}
    81	
    82	static const struct uartlite_reg_ops uartlite_be = {
    83		.in = uartlite_inbe32,
    84		.out = uartlite_outbe32,
    85	};
    86	
    87	static u32 uartlite_inle32(void __iomem *addr)
    88	{
    89		return ioread32(addr);
    90	}
    91	
    92	static void uartlite_outle32(u32 val, void __iomem *addr)
    93	{
    94		iowrite32(val, addr);
    95	}
    96	
    97	static const struct uartlite_reg_ops uartlite_le = {
    98		.in = uartlite_inle32,
    99		.out = uartlite_outle32,
   100	};
   101	
   102	static inline u32 uart_in32(u32 offset, struct uart_port *port)
   103	{
   104		struct uartlite_data *pdata = port->private_data;
   105	
   106		return pdata->reg_ops->in(port->membase + offset);
   107	}
   108	
   109	static inline void uart_out32(u32 val, u32 offset, struct uart_port *port)
   110	{
   111		struct uartlite_data *pdata = port->private_data;
   112	
   113		pdata->reg_ops->out(val, port->membase + offset);
   114	}
   115	
 > 116	static struct uart_port ulite_ports[ULITE_NR_UARTS];
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
