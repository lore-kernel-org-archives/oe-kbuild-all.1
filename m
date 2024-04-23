Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7057142E83
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 19:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713900350; cv=none; b=qDLpy1IDSXbyI7Wv0yg69mGGrsp1pszuvYB0awuERHzzXahCaidWIZEdjdM/5nlBuUuD0u+l8I+xgTBU4ky/qPXXwuP7X/IuxSwKZdJEc/fN7W3V51ZjxPoCagjRmiJOgn+qVt5xlHjdtcsFbIZOhqIKr61VSMPJJot3Ubpy3MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713900350; c=relaxed/simple;
	bh=QvTeZMhAmI4um4Z6DmqBlhFSAyFSubtICL6Y4Ix+tS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FBD1otL0yF4+SYwEWiSW0Xrx7NGycxH7rCaodvgg5ZWrKYn5lnDvkL6NUuyWczKgo6ikygsj0EzbOFgOak7VoCBKHfGeP6GUxFOjsp7xVim9lDP1331nAOOvawlhc27s0uD8gFEUQlyaxxGKMWFmbky9SH1a+E85UpPVMc0ToHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FrZYq09h; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FrZYq09h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713900348; x=1745436348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QvTeZMhAmI4um4Z6DmqBlhFSAyFSubtICL6Y4Ix+tS4=;
  b=FrZYq09he2wwBAVFj/YIJSVIOu+UIPWMamzkjW25yK87OfBItbD3nHrQ
   E4g7QEVaQqmX/Qvs2cRpbNtAntuOyoCdjEdx+ga42/pHdVVXzswh5lqjy
   zBRoRUvYtVW65u3dPou4LNusGXBG3yT5vScBtD6pa1SD7LP93jk7KVBmY
   OZvgrMg0UrPZT7AzxqDm7TK2Lvr3LPrRCwpVOaAjdQP8x4yguX5Lgwiaj
   Hu/bhOJmnBQF7I/dngaF6fzKxO8dNP4rEo8qAnTmunRi3hff0l4WiEX7n
   MTtJBTuTG/Mzj4mkGNtJrqRRCca1MNbaxqYv4V/SHn+GCyh9ycq8n2Daf
   Q==;
X-CSE-ConnectionGUID: QeNsXZfoTQeFOINF2Y3LxA==
X-CSE-MsgGUID: 9f4M9ppxQYuqzPt2WBrqIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9380231"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9380231"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 12:25:48 -0700
X-CSE-ConnectionGUID: SRUgNj3/RlWkSjMImNZDZA==
X-CSE-MsgGUID: W04nSCJ5S6mjiwrXXJRjOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="55440285"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Apr 2024 12:25:46 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzLls-0000TA-0o;
	Tue, 23 Apr 2024 19:25:40 +0000
Date: Wed, 24 Apr 2024 03:25:15 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:qwip 4/6] drivers/spi/spi-microchip-core-qspi.c:228:13:
 warning: unused variable 'frames'
Message-ID: <202404240322.auwWlTSK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git qwip
head:   1c9b80c2e5ca502bc305922729b49e156dcdf6da
commit: 51610d6a78f7de531263984e0d831e44550d9e72 [4/6] spi: microchip-core-qspi: Add regular transfers
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240424/202404240322.auwWlTSK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404240322.auwWlTSK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404240322.auwWlTSK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-microchip-core-qspi.c: In function 'mchp_coreqspi_write_read_op':
>> drivers/spi/spi-microchip-core-qspi.c:228:13: warning: unused variable 'frames' [-Wunused-variable]
     228 |         u32 frames, control, data;
         |             ^~~~~~
   drivers/spi/spi-microchip-core-qspi.c: In function 'mchp_coreqspi_transfer_one_message':
   drivers/spi/spi-microchip-core-qspi.c:588:13: warning: the comparison will always evaluate as 'true' for the address of 'cs_gpiod' will never be NULL [-Waddress]
     588 |         if (m->spi->cs_gpiod) {
         |             ^
   In file included from drivers/spi/spi-microchip-core-qspi.c:22:
   include/linux/spi/spi.h:219:34: note: 'cs_gpiod' declared here
     219 |         struct gpio_desc        *cs_gpiod[SPI_CS_CNT_MAX];      /* Chip select gpio desc */
         |                                  ^~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:590:47: error: passing argument 1 of 'gpiod_set_value' from incompatible pointer type [-Werror=incompatible-pointer-types]
     590 |                         gpiod_set_value(m->spi->cs_gpiod, 0);
         |                                         ~~~~~~^~~~~~~~~~
         |                                               |
         |                                               struct gpio_desc **
   In file included from include/linux/spi/spi.h:13:
   include/linux/gpio/consumer.h:122:40: note: expected 'struct gpio_desc *' but argument is of type 'struct gpio_desc **'
     122 | void gpiod_set_value(struct gpio_desc *desc, int value);
         |                      ~~~~~~~~~~~~~~~~~~^~~~
   drivers/spi/spi-microchip-core-qspi.c:592:47: error: passing argument 1 of 'gpiod_set_value' from incompatible pointer type [-Werror=incompatible-pointer-types]
     592 |                         gpiod_set_value(m->spi->cs_gpiod, 1);
         |                                         ~~~~~~^~~~~~~~~~
         |                                               |
         |                                               struct gpio_desc **
   include/linux/gpio/consumer.h:122:40: note: expected 'struct gpio_desc *' but argument is of type 'struct gpio_desc **'
     122 | void gpiod_set_value(struct gpio_desc *desc, int value);
         |                      ~~~~~~~~~~~~~~~~~~^~~~
   drivers/spi/spi-microchip-core-qspi.c:667:71: error: passing argument 1 of 'gpiod_set_value' from incompatible pointer type [-Werror=incompatible-pointer-types]
     667 |                                                 gpiod_set_value(m->spi->cs_gpiod, 0);
         |                                                                 ~~~~~~^~~~~~~~~~
         |                                                                       |
         |                                                                       struct gpio_desc **
   include/linux/gpio/consumer.h:122:40: note: expected 'struct gpio_desc *' but argument is of type 'struct gpio_desc **'
     122 | void gpiod_set_value(struct gpio_desc *desc, int value);
         |                      ~~~~~~~~~~~~~~~~~~^~~~
   drivers/spi/spi-microchip-core-qspi.c:669:71: error: passing argument 1 of 'gpiod_set_value' from incompatible pointer type [-Werror=incompatible-pointer-types]
     669 |                                                 gpiod_set_value(m->spi->cs_gpiod, 1);
         |                                                                 ~~~~~~^~~~~~~~~~
         |                                                                       |
         |                                                                       struct gpio_desc **
   include/linux/gpio/consumer.h:122:40: note: expected 'struct gpio_desc *' but argument is of type 'struct gpio_desc **'
     122 | void gpiod_set_value(struct gpio_desc *desc, int value);
         |                      ~~~~~~~~~~~~~~~~~~^~~~
   drivers/spi/spi-microchip-core-qspi.c:677:71: error: passing argument 1 of 'gpiod_set_value' from incompatible pointer type [-Werror=incompatible-pointer-types]
     677 |                                                 gpiod_set_value(m->spi->cs_gpiod, 1);
         |                                                                 ~~~~~~^~~~~~~~~~
         |                                                                       |
         |                                                                       struct gpio_desc **
   include/linux/gpio/consumer.h:122:40: note: expected 'struct gpio_desc *' but argument is of type 'struct gpio_desc **'
     122 | void gpiod_set_value(struct gpio_desc *desc, int value);
         |                      ~~~~~~~~~~~~~~~~~~^~~~
   drivers/spi/spi-microchip-core-qspi.c:680:71: error: passing argument 1 of 'gpiod_set_value' from incompatible pointer type [-Werror=incompatible-pointer-types]
     680 |                                                 gpiod_set_value(m->spi->cs_gpiod, 0);
         |                                                                 ~~~~~~^~~~~~~~~~
         |                                                                       |
         |                                                                       struct gpio_desc **
   include/linux/gpio/consumer.h:122:40: note: expected 'struct gpio_desc *' but argument is of type 'struct gpio_desc **'
     122 | void gpiod_set_value(struct gpio_desc *desc, int value);
         |                      ~~~~~~~~~~~~~~~~~~^~~~
   drivers/spi/spi-microchip-core-qspi.c:689:71: error: passing argument 1 of 'gpiod_set_value' from incompatible pointer type [-Werror=incompatible-pointer-types]
     689 |                                                 gpiod_set_value(m->spi->cs_gpiod, !t->cs_off);
         |                                                                 ~~~~~~^~~~~~~~~~
         |                                                                       |
         |                                                                       struct gpio_desc **
   include/linux/gpio/consumer.h:122:40: note: expected 'struct gpio_desc *' but argument is of type 'struct gpio_desc **'
     122 | void gpiod_set_value(struct gpio_desc *desc, int value);
         |                      ~~~~~~~~~~~~~~~~~~^~~~
   drivers/spi/spi-microchip-core-qspi.c:691:71: error: passing argument 1 of 'gpiod_set_value' from incompatible pointer type [-Werror=incompatible-pointer-types]
     691 |                                                 gpiod_set_value(m->spi->cs_gpiod, !t->cs_off);
         |                                                                 ~~~~~~^~~~~~~~~~
         |                                                                       |
         |                                                                       struct gpio_desc **
   include/linux/gpio/consumer.h:122:40: note: expected 'struct gpio_desc *' but argument is of type 'struct gpio_desc **'
     122 | void gpiod_set_value(struct gpio_desc *desc, int value);
         |                      ~~~~~~~~~~~~~~~~~~^~~~
   drivers/spi/spi-microchip-core-qspi.c:708:39: error: passing argument 1 of 'gpiod_set_value' from incompatible pointer type [-Werror=incompatible-pointer-types]
     708 |                 gpiod_set_value(m->spi->cs_gpiod, 0);
         |                                 ~~~~~~^~~~~~~~~~
         |                                       |
         |                                       struct gpio_desc **
   include/linux/gpio/consumer.h:122:40: note: expected 'struct gpio_desc *' but argument is of type 'struct gpio_desc **'
     122 | void gpiod_set_value(struct gpio_desc *desc, int value);
         |                      ~~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/frames +228 drivers/spi/spi-microchip-core-qspi.c

   225	
   226	static inline void mchp_coreqspi_write_read_op(struct mchp_coreqspi *qspi, bool last)
   227	{
 > 228		u32 frames, control, data;
   229		qspi->rx_len = qspi->tx_len;
   230	
   231		control = readl_relaxed(qspi->regs + REG_CONTROL);
   232		control |= CONTROL_FLAGSX4;
   233		writel_relaxed(control, qspi->regs + REG_CONTROL);
   234	
   235		while (qspi->tx_len >= 4) {
   236			while (readl_relaxed(qspi->regs + REG_STATUS) & STATUS_TXFIFOFULL)
   237				;
   238	
   239			data = *(u32 *)qspi->txbuf;
   240			qspi->txbuf += 4;
   241			qspi->tx_len -= 4;
   242			writel_relaxed(data, qspi->regs + REG_X4_TX_DATA);
   243	
   244			if (qspi->rx_len >= 8) {
   245				if (readl_relaxed(qspi->regs + REG_STATUS) & STATUS_RXAVAILABLE) {
   246					data = readl_relaxed(qspi->regs + REG_X4_RX_DATA);
   247					*(u32 *)qspi->rxbuf = data;
   248					qspi->rxbuf += 4;
   249					qspi->rx_len -= 4;
   250				}
   251			}
   252		}
   253	
   254		if (!last ) {
   255			while (qspi->rx_len >= 4) {
   256				while (readl_relaxed(qspi->regs + REG_STATUS) & STATUS_RXFIFOEMPTY)
   257					;
   258				data = readl_relaxed(qspi->regs + REG_X4_RX_DATA);
   259				*(u32 *)qspi->rxbuf = data;
   260				qspi->rxbuf += 4;
   261				qspi->rx_len -= 4;
   262			}
   263		}
   264	
   265		if (qspi->tx_len) {
   266			control &= ~CONTROL_FLAGSX4;
   267			writel_relaxed(control, qspi->regs + REG_CONTROL);
   268	
   269	
   270			while (qspi->tx_len--) {
   271				while (readl_relaxed(qspi->regs + REG_STATUS) & STATUS_TXFIFOFULL)
   272					;
   273				data =  *qspi->txbuf++;
   274				writel_relaxed(data, qspi->regs + REG_TX_DATA);
   275			}
   276			if (!last) {
   277				while (qspi->rx_len--) {
   278					while (readl_relaxed(qspi->regs + REG_STATUS) & STATUS_RXFIFOEMPTY)
   279						;
   280					data = readl_relaxed(qspi->regs + REG_RX_DATA);
   281					*qspi->rxbuf++ = (data & 0xFF);
   282				}
   283			}
   284		}
   285	}
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
