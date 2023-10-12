Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318C412E42
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 11:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2fkY3k0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697109589; x=1728645589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8bezzCfNxQOfcC4Z4XXRVYLn0flJ1mJB1ZM/qbiJXnY=;
  b=d2fkY3k06QhGv4hHlH+Vc0QGfVTdwU1+/H1rft3cX2QOoGYivjkgWhPi
   Jx5U64n4wqF7VmhEyPlSkEzJwSlgypNhWYGjvFdzdthqYhNKR/GhiJdEK
   isIKzJBLAZyqiBATUfkzbeyKkyP/PKTUaowtQ3FCMNNJ23P5TBk2UGUdb
   6YWA4B76v9o9FOoQ2hsE51pN0i0wgWUALu055TMJxnC2BP82l5vkf1XJG
   MMBBcqucrW6MGloVh88Cr0kkDpvXrxBmnSijzzR7F+Gy0L0pwul/BToz5
   tm4gAj7GFB3hTZCMSgsVO0T6i64tYV806Iyvh0VSXI/xZnuyo7U0aXWrX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="415944828"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="415944828"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 04:19:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="820099499"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="820099499"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 12 Oct 2023 04:19:46 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqtjE-0003P2-22;
	Thu, 12 Oct 2023 11:19:44 +0000
Date: Thu, 12 Oct 2023 19:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V2 2/2] tty: serial: uartps: Add rs485 support to uartps
 driver
Message-ID: <202310121912.HkIj952o-lkp@intel.com>
References: <20231011145602.3619616-3-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011145602.3619616-3-manikanta.guntupalli@amd.com>

Hi Manikanta,

kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on tty/tty-next tty/tty-linus linus/master v6.6-rc5 next-20231012]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manikanta-Guntupalli/dt-bindings-Add-optional-gpio-property-to-uartps-node-to-support-rs485/20231011-225836
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20231011145602.3619616-3-manikanta.guntupalli%40amd.com
patch subject: [PATCH V2 2/2] tty: serial: uartps: Add rs485 support to uartps driver
config: xtensa-cadence_csp_defconfig (https://download.01.org/0day-ci/archive/20231012/202310121912.HkIj952o-lkp@intel.com/config)
compiler: xtensa-csp-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310121912.HkIj952o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121912.HkIj952o-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/xilinx_uartps.c: In function 'cdns_rs485_tx_setup':
>> drivers/tty/serial/xilinx_uartps.c:328:17: error: implicit declaration of function 'gpiod_set_value'; did you mean 'gpio_set_value'? [-Werror=implicit-function-declaration]
     328 |                 gpiod_set_value(cdns_uart->gpiod, 1);
         |                 ^~~~~~~~~~~~~~~
         |                 gpio_set_value
   drivers/tty/serial/xilinx_uartps.c: In function 'cdns_uart_probe':
>> drivers/tty/serial/xilinx_uartps.c:1703:33: error: implicit declaration of function 'devm_gpiod_get_optional'; did you mean 'devm_clk_get_optional'? [-Werror=implicit-function-declaration]
    1703 |         cdns_uart_data->gpiod = devm_gpiod_get_optional(&pdev->dev, "xlnx,phy-ctrl",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                                 devm_clk_get_optional
>> drivers/tty/serial/xilinx_uartps.c:1704:57: error: 'GPIOD_OUT_LOW' undeclared (first use in this function); did you mean 'GPIOF_INIT_LOW'?
    1704 |                                                         GPIOD_OUT_LOW);
         |                                                         ^~~~~~~~~~~~~
         |                                                         GPIOF_INIT_LOW
   drivers/tty/serial/xilinx_uartps.c:1704:57: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/tty/serial/xilinx_uartps.c:1712:17: error: implicit declaration of function 'gpiod_direction_output'; did you mean 'gpio_direction_output'? [-Werror=implicit-function-declaration]
    1712 |                 gpiod_direction_output(cdns_uart_data->gpiod, GPIOD_OUT_LOW);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 gpio_direction_output
   cc1: some warnings being treated as errors


vim +328 drivers/tty/serial/xilinx_uartps.c

   318	
   319	/**
   320	 * cdns_rs485_tx_setup - Tx setup specific to rs485
   321	 * @cdns_uart: Handle to the cdns_uart
   322	 */
   323	static void cdns_rs485_tx_setup(struct cdns_uart *cdns_uart)
   324	{
   325		u32 val;
   326	
   327		if (cdns_uart->gpiod) {
 > 328			gpiod_set_value(cdns_uart->gpiod, 1);
   329		} else {
   330			val = readl(cdns_uart->port->membase + CDNS_UART_MODEMCR);
   331			val &= ~CDNS_UART_MODEMCR_RTS;
   332			writel(val, cdns_uart->port->membase + CDNS_UART_MODEMCR);
   333		}
   334	}
   335	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
