Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754D86FA2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 18:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680116290; x=1711652290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ljrfnDxbr6tNexL3uEz0cAUdzMrGQ6M9pENRFgx4P4Q=;
  b=JbKc9PS4avrcGC5VESz8IbqKMEzGufMhlfmPdUg97juf/GBDPklVIvRb
   uvCAITCzDSN10zEhKZlcVi/T5egTIIkIYzQC3hCyL77D5YRPW1ZO2eAHV
   MHIZwT222QlIGhaH+7ukVf0aKjwBahnA823yfAKDjkcNPfF4a9ZRWd8VS
   MjRCnlHFZB++ExqqVjDTM2tKCuEBG3u+9AGXuXaQfTAFosjXtR1g8Yhp/
   kT/k7QvKD5iMdeGbMXS7yjjbkA2TMCm7Fsnk4jLoeInquGxVqqkikKz47
   eaRfSyOAe9QdKgsPH5TKNGxBZ59BgVMg848C156+yapGDXKYHA0t86SrB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="342583447"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="342583447"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 11:58:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="686947687"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="686947687"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Mar 2023 11:58:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phazn-000JqS-1Y;
	Wed, 29 Mar 2023 18:58:07 +0000
Date: Thu, 30 Mar 2023 02:57:27 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:acpi-header-cleanup 1/1]
 drivers/tty/serial/8250/8250_tegra.c:68:15: error: implicit declaration of
 function 'of_alias_get_id'
Message-ID: <202303300209.MkcO2xDE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git acpi-header-cleanup
head:   333a203a26446521eac7046c6fb7426997569bf8
commit: 333a203a26446521eac7046c6fb7426997569bf8 [1/1] ACPI: Replace irqdomain.h include with struct declarations
config: ia64-randconfig-r036-20230329 (https://download.01.org/0day-ci/archive/20230330/202303300209.MkcO2xDE-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=333a203a26446521eac7046c6fb7426997569bf8
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh acpi-header-cleanup
        git checkout 333a203a26446521eac7046c6fb7426997569bf8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/tty/serial/8250/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300209.MkcO2xDE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_tegra.c: In function 'tegra_uart_probe':
>> drivers/tty/serial/8250/8250_tegra.c:68:15: error: implicit declaration of function 'of_alias_get_id' [-Werror=implicit-function-declaration]
      68 |         ret = of_alias_get_id(pdev->dev.of_node, "serial");
         |               ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/of_alias_get_id +68 drivers/tty/serial/8250/8250_tegra.c

c6825c6395b7db Jeff Brasen 2020-01-29   41  
c6825c6395b7db Jeff Brasen 2020-01-29   42  static int tegra_uart_probe(struct platform_device *pdev)
c6825c6395b7db Jeff Brasen 2020-01-29   43  {
c6825c6395b7db Jeff Brasen 2020-01-29   44  	struct uart_8250_port port8250;
c6825c6395b7db Jeff Brasen 2020-01-29   45  	struct tegra_uart *uart;
c6825c6395b7db Jeff Brasen 2020-01-29   46  	struct uart_port *port;
c6825c6395b7db Jeff Brasen 2020-01-29   47  	struct resource *res;
c6825c6395b7db Jeff Brasen 2020-01-29   48  	int ret;
c6825c6395b7db Jeff Brasen 2020-01-29   49  
c6825c6395b7db Jeff Brasen 2020-01-29   50  	uart = devm_kzalloc(&pdev->dev, sizeof(*uart), GFP_KERNEL);
c6825c6395b7db Jeff Brasen 2020-01-29   51  	if (!uart)
c6825c6395b7db Jeff Brasen 2020-01-29   52  		return -ENOMEM;
c6825c6395b7db Jeff Brasen 2020-01-29   53  
c6825c6395b7db Jeff Brasen 2020-01-29   54  	memset(&port8250, 0, sizeof(port8250));
c6825c6395b7db Jeff Brasen 2020-01-29   55  
c6825c6395b7db Jeff Brasen 2020-01-29   56  	port = &port8250.port;
c6825c6395b7db Jeff Brasen 2020-01-29   57  	spin_lock_init(&port->lock);
c6825c6395b7db Jeff Brasen 2020-01-29   58  
c6825c6395b7db Jeff Brasen 2020-01-29   59  	port->flags = UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF | UPF_FIXED_PORT |
c6825c6395b7db Jeff Brasen 2020-01-29   60  		      UPF_FIXED_TYPE;
c6825c6395b7db Jeff Brasen 2020-01-29   61  	port->iotype = UPIO_MEM32;
c6825c6395b7db Jeff Brasen 2020-01-29   62  	port->regshift = 2;
c6825c6395b7db Jeff Brasen 2020-01-29   63  	port->type = PORT_TEGRA;
c6825c6395b7db Jeff Brasen 2020-01-29   64  	port->irqflags |= IRQF_SHARED;
c6825c6395b7db Jeff Brasen 2020-01-29   65  	port->dev = &pdev->dev;
c6825c6395b7db Jeff Brasen 2020-01-29   66  	port->handle_break = tegra_uart_handle_break;
c6825c6395b7db Jeff Brasen 2020-01-29   67  
c6825c6395b7db Jeff Brasen 2020-01-29  @68  	ret = of_alias_get_id(pdev->dev.of_node, "serial");
c6825c6395b7db Jeff Brasen 2020-01-29   69  	if (ret >= 0)
c6825c6395b7db Jeff Brasen 2020-01-29   70  		port->line = ret;
c6825c6395b7db Jeff Brasen 2020-01-29   71  
c6825c6395b7db Jeff Brasen 2020-01-29   72  	ret = platform_get_irq(pdev, 0);
c6825c6395b7db Jeff Brasen 2020-01-29   73  	if (ret < 0)
c6825c6395b7db Jeff Brasen 2020-01-29   74  		return ret;
c6825c6395b7db Jeff Brasen 2020-01-29   75  
c6825c6395b7db Jeff Brasen 2020-01-29   76  	port->irq = ret;
c6825c6395b7db Jeff Brasen 2020-01-29   77  
c6825c6395b7db Jeff Brasen 2020-01-29   78  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
c6825c6395b7db Jeff Brasen 2020-01-29   79  	if (!res)
c6825c6395b7db Jeff Brasen 2020-01-29   80  		return -ENODEV;
c6825c6395b7db Jeff Brasen 2020-01-29   81  
c6825c6395b7db Jeff Brasen 2020-01-29   82  	port->membase = devm_ioremap(&pdev->dev, res->start,
c6825c6395b7db Jeff Brasen 2020-01-29   83  				     resource_size(res));
c6825c6395b7db Jeff Brasen 2020-01-29   84  	if (!port->membase)
c6825c6395b7db Jeff Brasen 2020-01-29   85  		return -ENOMEM;
c6825c6395b7db Jeff Brasen 2020-01-29   86  
c6825c6395b7db Jeff Brasen 2020-01-29   87  	port->mapbase = res->start;
c6825c6395b7db Jeff Brasen 2020-01-29   88  	port->mapsize = resource_size(res);
c6825c6395b7db Jeff Brasen 2020-01-29   89  
c6825c6395b7db Jeff Brasen 2020-01-29   90  	uart->rst = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
c6825c6395b7db Jeff Brasen 2020-01-29   91  	if (IS_ERR(uart->rst))
c6825c6395b7db Jeff Brasen 2020-01-29   92  		return PTR_ERR(uart->rst);
c6825c6395b7db Jeff Brasen 2020-01-29   93  
c6825c6395b7db Jeff Brasen 2020-01-29   94  	if (device_property_read_u32(&pdev->dev, "clock-frequency",
c6825c6395b7db Jeff Brasen 2020-01-29   95  				     &port->uartclk)) {
c6825c6395b7db Jeff Brasen 2020-01-29   96  		uart->clk = devm_clk_get(&pdev->dev, NULL);
c6825c6395b7db Jeff Brasen 2020-01-29   97  		if (IS_ERR(uart->clk)) {
c6825c6395b7db Jeff Brasen 2020-01-29   98  			dev_err(&pdev->dev, "failed to get clock!\n");
c6825c6395b7db Jeff Brasen 2020-01-29   99  			return -ENODEV;
c6825c6395b7db Jeff Brasen 2020-01-29  100  		}
c6825c6395b7db Jeff Brasen 2020-01-29  101  
c6825c6395b7db Jeff Brasen 2020-01-29  102  		ret = clk_prepare_enable(uart->clk);
c6825c6395b7db Jeff Brasen 2020-01-29  103  		if (ret < 0)
c6825c6395b7db Jeff Brasen 2020-01-29  104  			return ret;
c6825c6395b7db Jeff Brasen 2020-01-29  105  
c6825c6395b7db Jeff Brasen 2020-01-29  106  		port->uartclk = clk_get_rate(uart->clk);
c6825c6395b7db Jeff Brasen 2020-01-29  107  	}
c6825c6395b7db Jeff Brasen 2020-01-29  108  
c6825c6395b7db Jeff Brasen 2020-01-29  109  	ret = reset_control_deassert(uart->rst);
c6825c6395b7db Jeff Brasen 2020-01-29  110  	if (ret)
c6825c6395b7db Jeff Brasen 2020-01-29  111  		goto err_clkdisable;
c6825c6395b7db Jeff Brasen 2020-01-29  112  
c6825c6395b7db Jeff Brasen 2020-01-29  113  	ret = serial8250_register_8250_port(&port8250);
c6825c6395b7db Jeff Brasen 2020-01-29  114  	if (ret < 0)
c6825c6395b7db Jeff Brasen 2020-01-29  115  		goto err_clkdisable;
c6825c6395b7db Jeff Brasen 2020-01-29  116  
c6825c6395b7db Jeff Brasen 2020-01-29  117  	platform_set_drvdata(pdev, uart);
c6825c6395b7db Jeff Brasen 2020-01-29  118  	uart->line = ret;
c6825c6395b7db Jeff Brasen 2020-01-29  119  
c6825c6395b7db Jeff Brasen 2020-01-29  120  	return 0;
c6825c6395b7db Jeff Brasen 2020-01-29  121  
c6825c6395b7db Jeff Brasen 2020-01-29  122  err_clkdisable:
c6825c6395b7db Jeff Brasen 2020-01-29  123  	clk_disable_unprepare(uart->clk);
c6825c6395b7db Jeff Brasen 2020-01-29  124  
c6825c6395b7db Jeff Brasen 2020-01-29  125  	return ret;
c6825c6395b7db Jeff Brasen 2020-01-29  126  }
c6825c6395b7db Jeff Brasen 2020-01-29  127  

:::::: The code at line 68 was first introduced by commit
:::::: c6825c6395b7dbcb5421d89ac8d5631be815ca36 serial: 8250_tegra: Create Tegra specific 8250 driver

:::::: TO: Jeff Brasen <jbrasen@nvidia.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
