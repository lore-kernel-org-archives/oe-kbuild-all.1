Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FCC3BED32
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 23:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773964509; cv=none; b=iRoUeDA3UWQfG3GwPi6AFmDxhxjYz7HXRy9rLBNw5ifb5ITX14zYyxa59LHhdhUxOjRGP+CUw1KFD8z+MCqWvMLj4mQG7zfOQ3poH+nKFeZ+uDXCWppa/uMo8Ii2HJK16UeqCmQ9QnLR65uTZ3qLwH0C/cqeQ4Di08YhY99Ymgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773964509; c=relaxed/simple;
	bh=r/SbXPFP/ykN1nLBK9p10AiU3ezsLWp1iV0fpBfCrpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ID+5GNGHoVwzm25duIMK8a3oBlcqrumqzaCRkMtYPNKaMg2gqgFpUhKdUWm0WuU5Ac3+GrdvMNUxV/3DqKaEQczILgc1AM9BiKpcWHiqrigMhU2vJaQFHKrVQldxbJQsj3+bYMRL8xXTqqb4wHDTwYs81t9ptdwjLTG/MVSnO1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n69+U6i/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n69+U6i/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773964508; x=1805500508;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r/SbXPFP/ykN1nLBK9p10AiU3ezsLWp1iV0fpBfCrpY=;
  b=n69+U6i/JBZbtXa4Y6skrdojBl3YWL+FNVW3UxJ2UisdK+SjGa/mGLV+
   JHt7O1CVk/Sbtn0OKZE1yqXoEi/6+siICmtGHAmPAJ3QAR88YbmDKIWiS
   TD+82omWfvaAbT0fzkT4eSJjD3DcLHfivdg1h4TB9Qtr96sQTQSdbXkLA
   Qjoy94ubzC+AU5E8u2GQr9128zYrDl+La9Ivj1lGNKvwunq4XmQ0ouCeB
   Z96jc9s5qbgwEj3qXXo4T1Fc3HaAfLnOBBqk32GR3Cb+Q33NnCgRqvxgk
   Jwhuc+OWTK4efWRRCzpxBpx9LEo1n+8NhxVz3Cz/7utP6CbpBMV0C0kdS
   g==;
X-CSE-ConnectionGUID: txN8iHHgSYe+ghch31rqQw==
X-CSE-MsgGUID: 06zzLsqeScKJU/gLLQSywQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="62612633"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="62612633"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 16:55:07 -0700
X-CSE-ConnectionGUID: HphZLJquTpmTIN6wubYLGw==
X-CSE-MsgGUID: 4aygXDj7Tv618DsIpcD7yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="261016791"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 Mar 2026 16:55:03 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3NCe-000000001nJ-25Ey;
	Thu, 19 Mar 2026 23:55:00 +0000
Date: Fri, 20 Mar 2026 07:53:04 +0800
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
Message-ID: <202603200700.6fddOZHQ-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0257f64bdac7fdca30fa3cae0df8b9ecbec7733a]

url:    https://github.com/intel-lab-lkp/linux/commits/aspeedyh/dt-bindings-soc-aspeed-Add-AST2600-eSPI-controller/20260315-101647
base:   0257f64bdac7fdca30fa3cae0df8b9ecbec7733a
patch link:    https://lore.kernel.org/r/20260313-upstream_espi-v1-5-9504428e1f43%40aspeedtech.com
patch subject: [PATCH 5/7] soc: aspeed: Add eSPI flash channel support
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260320/202603200700.6fddOZHQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200700.6fddOZHQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200700.6fddOZHQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/aspeed/espi/ast2600-espi.c: In function 'ast2600_espi_flash_reset':
   drivers/soc/aspeed/espi/ast2600-espi.c:137:16: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     137 |         reg |= FIELD_PREP(ESPI_CTRL_FLASH_TAFS_MODE, flash->tafs.mode);
         |                ^~~~~~~~~~
   drivers/soc/aspeed/espi/ast2600-espi.c: In function 'ast2600_espi_flash_remove':
>> drivers/soc/aspeed/espi/ast2600-espi.c:172:35: warning: variable 'flash' set but not used [-Wunused-but-set-variable]
     172 |         struct aspeed_espi_flash *flash;
         |                                   ^~~~~
   drivers/soc/aspeed/espi/ast2600-espi.c: In function 'ast2600_espi_flash_get_hdr':
   drivers/soc/aspeed/espi/ast2600-espi.c:194:20: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     194 |         hdr->cyc = FIELD_GET(ESPI_FLASH_RX_CTRL_CYC, reg);
         |                    ^~~~~~~~~


vim +/flash +172 drivers/soc/aspeed/espi/ast2600-espi.c

   169	
   170	int ast2600_espi_flash_remove(struct aspeed_espi *espi)
   171	{
 > 172		struct aspeed_espi_flash *flash;
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
