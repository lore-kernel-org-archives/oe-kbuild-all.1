Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D164D2F46
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 05:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738733695; cv=none; b=bu2hCUcb5i5Qy71znHOGu9D11Kt3Vr+kUL5104BA3uhI0btawJKbhgrRWvWtP3TlTm4nj/GiTYfgDXnB4oykJp08fCRFAn1xghCk0zK4hH12FIg52b++DgkKlrgXSYLFVOIzd1rjSVnYMgNHgR1KY+O27iBKRtcFMChSOxV9HkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738733695; c=relaxed/simple;
	bh=1UgCevqHM1s4X/FGwV/MxXZd+l6cycEjJeVW6OJxvl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B9x8N/4omUEoH1/MgEkKcqFLCTRhjLjtzGjqWpE7mO3SlOjk8aZc4ZuxjEc14GH/MGpScg8NB3VznOPAt8qcqphvHifvlS+SpyEn334f2+lnuquyiOOPvokr2WWA8hITYb56X3isas9M7v+zYD0tZz2gghVRDphcL9BEhXIZtD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kDBd74RH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kDBd74RH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738733693; x=1770269693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1UgCevqHM1s4X/FGwV/MxXZd+l6cycEjJeVW6OJxvl0=;
  b=kDBd74RH4ReAp2AxX4JzHkqGAnUsjoNR/XR9NPZVu8lWcZ1tVshYEe2C
   qsv1zpyu569dmm3QhgAZ+e1/56Bv1c7hdv6sImvpqWxnP2YIPZnyNsLS2
   GzfWhBMqz3fe/WlFWmcYWC7hIgw6pxfZB6AkCx4kQn+cZ42Af5DeClvui
   CJDJuVU9Rn0ZEdCDJp5+AO1KRjcEKiAQqFQOU91rEcT9PzlYn2oi3gzTr
   CbEiN44eS4DAn2UJPqEjcqBQXjDClOF3DhMcjnPTCNHZIm4pnacrJSSPK
   Fd9Kr6b54I1OH6SMyExOLvxiJCIMj+cuQLYyUt3tyyJGK0hm+kmW6KxNs
   g==;
X-CSE-ConnectionGUID: bdBKPyXVRG+Te9F3u1Td1w==
X-CSE-MsgGUID: uX+FTmbNTiuQ064W5Brbww==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39394145"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39394145"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 21:34:52 -0800
X-CSE-ConnectionGUID: aGbnJcsqTHu7C7iG3866VQ==
X-CSE-MsgGUID: 2xQg/A0bQy6qOGEbGC3QLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115993715"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Feb 2025 21:34:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfY3k-000tTv-0d;
	Wed, 05 Feb 2025 05:34:48 +0000
Date: Wed, 5 Feb 2025 13:33:46 +0800
From: kernel test robot <lkp@intel.com>
To: Filip Kokosinski <fkokosinski@internships.antmicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Gabriel Somlo <gsomlo@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [litex-hub:litex-rebase 3/15] drivers/spi/spi-litespi.c:90:50:
 sparse: sparse: cast to restricted __be16
Message-ID: <202502051327.dUo3s7aG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/litex-hub/linux litex-rebase
head:   a1cd33eb9593685b8b0716cbecf1a817b6410ca2
commit: 4743eb95afc8c00bcdc3b4e5fc8b7602e9b096e8 [3/15] LiteX: driver for LiteSPI
config: arm-randconfig-r123-20250205 (https://download.01.org/0day-ci/archive/20250205/202502051327.dUo3s7aG-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce: (https://download.01.org/0day-ci/archive/20250205/202502051327.dUo3s7aG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051327.dUo3s7aG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/spi/spi-litespi.c:90:50: sparse: sparse: cast to restricted __be16
>> drivers/spi/spi-litespi.c:96:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __be16 [usertype] @@
   drivers/spi/spi-litespi.c:96:39: sparse:     expected unsigned short [usertype]
   drivers/spi/spi-litespi.c:96:39: sparse:     got restricted __be16 [usertype]
>> drivers/spi/spi-litespi.c:107:50: sparse: sparse: cast to restricted __be32
>> drivers/spi/spi-litespi.c:113:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/spi/spi-litespi.c:113:39: sparse:     expected unsigned int [usertype]
   drivers/spi/spi-litespi.c:113:39: sparse:     got restricted __be32 [usertype]

vim +90 drivers/spi/spi-litespi.c

    44	
    45	static int litespi_rxtx(struct spi_controller *ctlr, struct spi_device *spi,
    46				struct spi_transfer *t)
    47	{
    48		struct litespi_hw *hw = spi_controller_get_devdata(ctlr);
    49		u16 ctl_word = t->bits_per_word << LITESPI_CTRL_SHIFT_BPW;
    50		int i;
    51	
    52		/* set chip select */
    53		litex_write8(hw->base + LITESPI_OFF_CS, BIT(spi_get_chipselect(spi, 0)));
    54	
    55		/* set word size */
    56		litex_write16(hw->base + LITESPI_OFF_CTRL, ctl_word);
    57	
    58		/* add start bit to ctl_word */
    59		ctl_word |= BIT(LITESPI_CTRL_START_BIT);
    60	
    61		/*
    62		 * Validated SPI transfer length is multiple of SPI word size, which
    63		 * is itself a power-of-two multiple, and fits in a litex subregister
    64		 */
    65		if (t->bits_per_word <= 8) {
    66			const u8 *tx = t->tx_buf;
    67			u8 *rx = t->rx_buf;
    68	
    69			/* word size is 1 byte */
    70			for (i = 0; i < t->len; i++) {
    71				if (tx)
    72					litex_write8(hw->base +
    73							 LITESPI_OFF_MOSI, *tx++);
    74	
    75				litex_write16(hw->base + LITESPI_OFF_CTRL, ctl_word);
    76				litespi_wait_xfer_end(hw);
    77	
    78				if (rx)
    79					*rx++ = litex_read8(hw->base +
    80								LITESPI_OFF_MISO);
    81			}
    82		} else if (t->bits_per_word <= 16) {
    83			const u16 *tx = t->tx_buf;
    84			u16 *rx = t->rx_buf;
    85	
    86			/* word size is 2 bytes */
    87			for (i = 0; i < t->len / 2; i++) {
    88				if (tx)
    89					litex_write16(hw->base + LITESPI_OFF_MOSI,
  > 90							 be16_to_cpu(*tx++));
    91	
    92				litex_write16(hw->base + LITESPI_OFF_CTRL, ctl_word);
    93				litespi_wait_xfer_end(hw);
    94	
    95				if (rx)
  > 96					*rx++ = cpu_to_be16(litex_read16(
    97							hw->base + LITESPI_OFF_MISO));
    98			}
    99		} else {
   100			const u32 *tx = t->tx_buf;
   101			u32 *rx = t->rx_buf;
   102	
   103			/* word size is 4 bytes */
   104			for (i = 0; i < t->len / 4; i++) {
   105				if (tx)
   106					litex_write32(hw->base + LITESPI_OFF_MOSI,
 > 107							 be32_to_cpu(*tx++));
   108	
   109				litex_write16(hw->base + LITESPI_OFF_CTRL, ctl_word);
   110				litespi_wait_xfer_end(hw);
   111	
   112				if (rx)
 > 113					*rx++ = cpu_to_be32(litex_read32(
   114							hw->base + LITESPI_OFF_MISO));
   115			}
   116		}
   117	
   118		return 0;
   119	}
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
