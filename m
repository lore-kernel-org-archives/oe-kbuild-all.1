Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF8B3C465
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 01:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773969690; cv=none; b=bg+v1BEBl/V/uqIUx76ho0K9DR98dXf1vTjdabJvdFa2ZI4WxGwq5lUDDf78HktkZ25XSTCziyYS0XUnw6xb3Xupv9+BfjD3wLKBdWWIgsqgFKLI3jrFrh8zWfKBk+4B8NV7/Kd9XkElCJ4jM7CwrsCXUpELTojYA7+vySqmJqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773969690; c=relaxed/simple;
	bh=XfTGDv25Z3qgeprzxEF26+kpxwk1t5LiUTyWdHyppS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yxyk3L+wmtEhZmezJ/lEO0haD67Xb+c/GoJvmedZLgeFJSaYsf0xXK4uKhwYYN8ei9eAFKJcHZ7ugEB1kbF+XQaP008ohkKA3yu4QbfaEEzS7TCDtJSSZX23bZGKoyPYcuEtKMJycrksZ4sSU1Ca6Tvkr2WA5QmIsdwe4dyr1EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YF5a8+Yo; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YF5a8+Yo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773969689; x=1805505689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XfTGDv25Z3qgeprzxEF26+kpxwk1t5LiUTyWdHyppS0=;
  b=YF5a8+Yof5oPS+6IISXb07aLHT7Q5b723sMTA31BvsY9OPC564MXEyQ4
   LAfwRWzYQ9sDzqae13vzKuG6nIjknGDoaYjvIovHc7EDQDvTXjPVNRLyb
   b5nED4+QGmREjakbt5D/LW+MAkdEpIpT/n+d7LtNtBAMXXdyhJxzoqRIa
   iJMSfQXTOlRu8feoz8DiJJBzXXOHfPcIaDttyN8i3gPdjcS/ukXyLHbUd
   4OJmylHAKkI4NKZsOBleFkmTNu0vKaztl1+ENFZP1FVMZMbZmh1Cy3/j3
   KVm+FDvfr9X1heUD4i6rRRpGHylA+CYtX7JkuyEUwo/lUhgKopTeh7UDB
   g==;
X-CSE-ConnectionGUID: wBuhWwTFSL6PVhYWt7DUoA==
X-CSE-MsgGUID: uFT5TVmiRQmpsE7VlfX3zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75239485"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75239485"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 18:21:29 -0700
X-CSE-ConnectionGUID: FcsPf0prRRq0/qxuc/nEAw==
X-CSE-MsgGUID: clM0ws1ASKSMHzES+rX23A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="227614597"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 19 Mar 2026 18:21:25 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3OUi-000000001qC-3MVc;
	Fri, 20 Mar 2026 01:18:54 +0000
Date: Fri, 20 Mar 2026 09:17:14 +0800
From: kernel test robot <lkp@intel.com>
To: aspeedyh <yh_chung@aspeedtech.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	maciej.lawniczak@intel.com, aspeedyh <yh_chung@aspeedtech.com>
Subject: Re: [PATCH 5/7] soc: aspeed: Add eSPI flash channel support
Message-ID: <202603200904.M00MLkjz-lkp@intel.com>
References: <20260313-upstream_espi-v1-5-9504428e1f43@aspeedtech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-upstream_espi-v1-5-9504428e1f43@aspeedtech.com>

Hi aspeedyh,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0257f64bdac7fdca30fa3cae0df8b9ecbec7733a]

url:    https://github.com/intel-lab-lkp/linux/commits/aspeedyh/dt-bindings-soc-aspeed-Add-AST2600-eSPI-controller/20260315-101647
base:   0257f64bdac7fdca30fa3cae0df8b9ecbec7733a
patch link:    https://lore.kernel.org/r/20260313-upstream_espi-v1-5-9504428e1f43%40aspeedtech.com
patch subject: [PATCH 5/7] soc: aspeed: Add eSPI flash channel support
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260320/202603200904.M00MLkjz-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200904.M00MLkjz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200904.M00MLkjz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/aspeed/espi/ast2600-espi.c: In function 'ast2600_espi_flash_reset':
>> drivers/soc/aspeed/espi/ast2600-espi.c:137:16: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     137 |         reg |= FIELD_PREP(ESPI_CTRL_FLASH_TAFS_MODE, flash->tafs.mode);
         |                ^~~~~~~~~~
   drivers/soc/aspeed/espi/ast2600-espi.c: In function 'ast2600_espi_flash_remove':
   drivers/soc/aspeed/espi/ast2600-espi.c:172:35: warning: variable 'flash' set but not used [-Wunused-but-set-variable]
     172 |         struct aspeed_espi_flash *flash;
         |                                   ^~~~~
   drivers/soc/aspeed/espi/ast2600-espi.c: In function 'ast2600_espi_flash_get_hdr':
>> drivers/soc/aspeed/espi/ast2600-espi.c:194:20: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     194 |         hdr->cyc = FIELD_GET(ESPI_FLASH_RX_CTRL_CYC, reg);
         |                    ^~~~~~~~~


vim +/FIELD_PREP +137 drivers/soc/aspeed/espi/ast2600-espi.c

   111	
   112	static void ast2600_espi_flash_reset(struct aspeed_espi *espi)
   113	{
   114		struct aspeed_espi_flash *flash;
   115		u32 reg;
   116	
   117		flash = &espi->flash;
   118	
   119		writel(ESPI_INT_EN_FLASH, espi->regs + ESPI_INT_EN_CLR);
   120		writel(ESPI_INT_STS_FLASH, espi->regs + ESPI_INT_STS);
   121	
   122		reg = readl(espi->regs + ESPI_CTRL);
   123		reg &= ~(ESPI_CTRL_FLASH_TX_SW_RST
   124			 | ESPI_CTRL_FLASH_RX_SW_RST
   125			 | ESPI_CTRL_FLASH_TX_DMA_EN
   126			 | ESPI_CTRL_FLASH_RX_DMA_EN
   127			 | ESPI_CTRL_FLASH_SW_RDY);
   128		writel(reg, espi->regs + ESPI_CTRL);
   129	
   130		udelay(1);
   131	
   132		reg |= (ESPI_CTRL_FLASH_TX_SW_RST | ESPI_CTRL_FLASH_RX_SW_RST);
   133		writel(reg, espi->regs + ESPI_CTRL);
   134	
   135		flash->tafs.mode = TAFS_MODE_SW;
   136		reg = readl(espi->regs + ESPI_CTRL) & ~ESPI_CTRL_FLASH_TAFS_MODE;
 > 137		reg |= FIELD_PREP(ESPI_CTRL_FLASH_TAFS_MODE, flash->tafs.mode);
   138		writel(reg, espi->regs + ESPI_CTRL);
   139	
   140		if (flash->dma.enable) {
   141			writel(flash->dma.tx_addr, espi->regs + ESPI_FLASH_TX_DMA);
   142			writel(flash->dma.rx_addr, espi->regs + ESPI_FLASH_RX_DMA);
   143	
   144			reg = readl(espi->regs + ESPI_CTRL)
   145			      | ESPI_CTRL_FLASH_TX_DMA_EN
   146			      | ESPI_CTRL_FLASH_RX_DMA_EN;
   147			writel(reg, espi->regs + ESPI_CTRL);
   148		}
   149	
   150		writel(ESPI_INT_EN_FLASH_RX_CMPLT, espi->regs + ESPI_INT_EN);
   151	
   152		reg = readl(espi->regs + ESPI_CTRL) | ESPI_CTRL_FLASH_SW_RDY;
   153		writel(reg, espi->regs + ESPI_CTRL);
   154	}
   155	
   156	int ast2600_espi_flash_probe(struct aspeed_espi *espi)
   157	{
   158		u32 regs;
   159	
   160		regs = readl(espi->regs + ESPI_STS);
   161		if (regs & (ESPI_STS_FLASH_TX_BUSY | ESPI_STS_FLASH_RX_BUSY)) {
   162			dev_warn(espi->dev, "eSPI flash channel is busy, deferring...\n");
   163			return -EPROBE_DEFER;
   164		}
   165	
   166		ast2600_espi_flash_reset(espi);
   167		return 0;
   168	}
   169	
   170	int ast2600_espi_flash_remove(struct aspeed_espi *espi)
   171	{
   172		struct aspeed_espi_flash *flash;
   173		u32 reg;
   174	
   175		flash = &espi->flash;
   176	
   177		writel(ESPI_INT_EN_FLASH, espi->regs + ESPI_INT_EN_CLR);
   178	
   179		reg = readl(espi->regs + ESPI_CTRL);
   180		reg &= ~(ESPI_CTRL_FLASH_TX_DMA_EN
   181			 | ESPI_CTRL_FLASH_RX_DMA_EN
   182			 | ESPI_CTRL_FLASH_SW_RDY);
   183		writel(reg, espi->regs + ESPI_CTRL);
   184	
   185		return 0;
   186	}
   187	
   188	int ast2600_espi_flash_get_hdr(struct aspeed_espi *espi,
   189				       struct espi_comm_hdr *hdr)
   190	{
   191		u32 reg, len;
   192	
   193		reg = readl(espi->regs + ESPI_FLASH_RX_CTRL);
 > 194		hdr->cyc = FIELD_GET(ESPI_FLASH_RX_CTRL_CYC, reg);
   195		hdr->tag = FIELD_GET(ESPI_FLASH_RX_CTRL_TAG, reg);
   196		len = FIELD_GET(ESPI_FLASH_RX_CTRL_LEN, reg);
   197		hdr->len_h = (len >> 8) & 0xff;
   198		hdr->len_l = len & 0xff;
   199	
   200		return 0;
   201	}
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
