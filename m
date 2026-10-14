Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C815650EF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Oct 2026 18:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792003898; cv=none; b=E56LH29dWS2yT9FbL6an1WG1y+Iq470gCd7TXfscl2W2Cj8ft69AkU9H5RkHWi9OQMzvQgm9/+vp1PmQQ4YVBq1iiPRm59DwVZ4cPIsmVN9aazYF1K2dtCgimU9/isoK3KdtFdbfToyrtkjeHJ2vn/T9XzvMQIq9zoTx0liXNFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792003898; c=relaxed/simple;
	bh=WvLXr2LbVqIDRNEA1OIRFtPwetozYh92WHM3npLZ5Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBMPzcryKx6WYK5J1aYXzSLZOUzrXd7QsBKvRmJQSzb+baM+P/UqD05ENYX5rAZSTH3kb73teBac4I5L/DiNBEDytc0J+IJi0ysGOa638wNqwRTEK2uIK+8n0fxWkCOWrpyr2+bsF8KHiAeEWgM9HJGznryo+TMmZEzE3bAVwbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/sBQFuI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/sBQFuI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792003895; x=1823539895;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WvLXr2LbVqIDRNEA1OIRFtPwetozYh92WHM3npLZ5Nw=;
  b=I/sBQFuIX7H4hf5Xq1aetPEFJj9XTqfETqP0SL0E3fMAEN66TFsZNLOb
   RC/MwWcDxfULJuxddWqioFlpR9r2QllsV3du/ze6R6rGNFii3gIa8tZ8c
   7lXUd+mJbm0s5VTCWC16gbW2pfDvOgHxsjQ9jnEP6JkiPoQ+4a0SAYSUK
   8cv/pt9ojOrUMSyyyPu4AGzbfxfnla3JMuLNkgNfK8oiQ5OrbjqutJF/I
   KkeBuzegnOVsgil4xfFCYOe3apdShHHJkWs+CnnYdoejxjG+YMwkB9s8z
   ldGTa1CuiH9hHgnOmyQMmXfm+fX20ZOCukYsWK+ftjuiGTvCoGz79wxi/
   Q==;
X-CSE-ConnectionGUID: Hyt1e3HJQxOddObTY0yNcg==
X-CSE-MsgGUID: laWV16bbQECimttxWLO6ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="650246"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="650246"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 11:51:35 -0700
X-CSE-ConnectionGUID: BjA+k1kjQUOGi1F/NxIEqg==
X-CSE-MsgGUID: K/txeHf1RlGsXfpV65Lvjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1522675"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Oct 2026 11:51:34 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH44Z-00000000F4f-0p49;
	Wed, 14 Oct 2026 18:51:31 +0000
Date: Thu, 15 Oct 2026 02:50:39 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] phy: mediatek: phy-mtk-hdmi: Use regmap to
 manipulate hdmi registers
Message-ID: <202610150209.zeRPUX53-lkp@intel.com>
References: <20261011082042.348422-2-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011082042.348422-2-l.scorcia@gmail.com>

Hi Luca,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linux-review/Luca-Leonardo-Scorcia/dt-bindings-mediatek-hdmi-phy-Add-compatible-for-mt8167/20261010-135401]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Leonardo-Scorcia/phy-mediatek-phy-mtk-hdmi-Use-regmap-to-manipulate-hdmi-registers/20261011-102031
base:   https://github.com/intel-lab-lkp/linux Luca-Leonardo-Scorcia/dt-bindings-mediatek-hdmi-phy-Add-compatible-for-mt8167/20261010-135401
patch link:    https://lore.kernel.org/r/20261011082042.348422-2-l.scorcia%40gmail.com
patch subject: [RFC PATCH 1/1] phy: mediatek: phy-mtk-hdmi: Use regmap to manipulate hdmi registers
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20261015/202610150209.zeRPUX53-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150209.zeRPUX53-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150209.zeRPUX53-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c: In function 'mtk_hdmi_pll_set_rate':
>> drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:13:47: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      13 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^~~~~~~~~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:113:9: note: in expansion of macro 'mtk_phy_update_regmap_field'
     113 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_IC_MASK, 0x1);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c: In function 'mtk_hdmi_pll_recalc_rate':
>> drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:140:15: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     140 |         val = FIELD_GET(RG_HTPLL_PREDIV_MASK, tmp);
         |               ^~~~~~~~~
--
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/m68k/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/m68k/include/asm/bitops.h:569,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from include/linux/clk.h:13,
                    from drivers/phy/mediatek/phy-mtk-hdmi.h:9,
                    from drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:2:
   drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c: In function 'mtk_hdmi_pll_recalc_rate':
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:156:36: error: invalid use of undefined type 'struct regmap'
     156 |         tmp = readl(hdmi_phy->regs + HDMI_CON6);
         |                                    ^
   include/uapi/linux/swab.h:118:38: note: in definition of macro '__swab32'
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:372:26: note: in expansion of macro 'in_le32'
     372 | #define readl(addr)      in_le32(addr)
         |                          ^~~~~~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:156:15: note: in expansion of macro 'readl'
     156 |         tmp = readl(hdmi_phy->regs + HDMI_CON6);
         |               ^~~~~
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:156:36: error: invalid use of undefined type 'struct regmap'
     156 |         tmp = readl(hdmi_phy->regs + HDMI_CON6);
         |                                    ^
   include/uapi/linux/swab.h:19:19: note: in definition of macro '___constant_swab32'
      19 |         (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:372:26: note: in expansion of macro 'in_le32'
     372 | #define readl(addr)      in_le32(addr)
         |                          ^~~~~~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:156:15: note: in expansion of macro 'readl'
     156 |         tmp = readl(hdmi_phy->regs + HDMI_CON6);
         |               ^~~~~
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:156:36: error: invalid use of undefined type 'struct regmap'
     156 |         tmp = readl(hdmi_phy->regs + HDMI_CON6);
         |                                    ^
   include/uapi/linux/swab.h:20:19: note: in definition of macro '___constant_swab32'
      20 |         (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:372:26: note: in expansion of macro 'in_le32'
     372 | #define readl(addr)      in_le32(addr)
         |                          ^~~~~~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:156:15: note: in expansion of macro 'readl'
     156 |         tmp = readl(hdmi_phy->regs + HDMI_CON6);
         |               ^~~~~
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:156:36: error: invalid use of undefined type 'struct regmap'
     156 |         tmp = readl(hdmi_phy->regs + HDMI_CON6);
         |                                    ^
   include/uapi/linux/swab.h:21:19: note: in definition of macro '___constant_swab32'
      21 |         (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:372:26: note: in expansion of macro 'in_le32'
     372 | #define readl(addr)      in_le32(addr)
         |                          ^~~~~~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:156:15: note: in expansion of macro 'readl'
     156 |         tmp = readl(hdmi_phy->regs + HDMI_CON6);
         |               ^~~~~
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:156:36: error: invalid use of undefined type 'struct regmap'
     156 |         tmp = readl(hdmi_phy->regs + HDMI_CON6);
         |                                    ^
   include/uapi/linux/swab.h:22:19: note: in definition of macro '___constant_swab32'
      22 |         (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:372:26: note: in expansion of macro 'in_le32'
     372 | #define readl(addr)      in_le32(addr)
         |                          ^~~~~~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:156:15: note: in expansion of macro 'readl'
     156 |         tmp = readl(hdmi_phy->regs + HDMI_CON6);
         |               ^~~~~
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:156:36: error: invalid use of undefined type 'struct regmap'
     156 |         tmp = readl(hdmi_phy->regs + HDMI_CON6);
         |                                    ^
   include/uapi/linux/swab.h:120:19: note: in definition of macro '__swab32'
     120 |         __fswab32(x))
         |                   ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:372:26: note: in expansion of macro 'in_le32'
     372 | #define readl(addr)      in_le32(addr)
         |                          ^~~~~~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:156:15: note: in expansion of macro 'readl'
     156 |         tmp = readl(hdmi_phy->regs + HDMI_CON6);
         |               ^~~~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:173:36: error: invalid use of undefined type 'struct regmap'
     173 |         tmp = readl(hdmi_phy->regs + HDMI_CON2);
         |                                    ^
   include/uapi/linux/swab.h:118:38: note: in definition of macro '__swab32'
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:372:26: note: in expansion of macro 'in_le32'
     372 | #define readl(addr)      in_le32(addr)
         |                          ^~~~~~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:173:15: note: in expansion of macro 'readl'
     173 |         tmp = readl(hdmi_phy->regs + HDMI_CON2);
         |               ^~~~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:173:36: error: invalid use of undefined type 'struct regmap'
     173 |         tmp = readl(hdmi_phy->regs + HDMI_CON2);
         |                                    ^
   include/uapi/linux/swab.h:19:19: note: in definition of macro '___constant_swab32'
      19 |         (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:372:26: note: in expansion of macro 'in_le32'
     372 | #define readl(addr)      in_le32(addr)
         |                          ^~~~~~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:173:15: note: in expansion of macro 'readl'
     173 |         tmp = readl(hdmi_phy->regs + HDMI_CON2);
         |               ^~~~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:173:36: error: invalid use of undefined type 'struct regmap'
     173 |         tmp = readl(hdmi_phy->regs + HDMI_CON2);
         |                                    ^
   include/uapi/linux/swab.h:20:19: note: in definition of macro '___constant_swab32'
      20 |         (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:372:26: note: in expansion of macro 'in_le32'
     372 | #define readl(addr)      in_le32(addr)
         |                          ^~~~~~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:173:15: note: in expansion of macro 'readl'
     173 |         tmp = readl(hdmi_phy->regs + HDMI_CON2);
         |               ^~~~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:173:36: error: invalid use of undefined type 'struct regmap'
     173 |         tmp = readl(hdmi_phy->regs + HDMI_CON2);
         |                                    ^
   include/uapi/linux/swab.h:21:19: note: in definition of macro '___constant_swab32'
      21 |         (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:372:26: note: in expansion of macro 'in_le32'
     372 | #define readl(addr)      in_le32(addr)
         |                          ^~~~~~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:173:15: note: in expansion of macro 'readl'
     173 |         tmp = readl(hdmi_phy->regs + HDMI_CON2);
         |               ^~~~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:173:36: error: invalid use of undefined type 'struct regmap'
     173 |         tmp = readl(hdmi_phy->regs + HDMI_CON2);
         |                                    ^
   include/uapi/linux/swab.h:22:19: note: in definition of macro '___constant_swab32'
      22 |         (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:372:26: note: in expansion of macro 'in_le32'
     372 | #define readl(addr)      in_le32(addr)
         |                          ^~~~~~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:173:15: note: in expansion of macro 'readl'
     173 |         tmp = readl(hdmi_phy->regs + HDMI_CON2);
--
   drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c: In function 'mtk_hdmi_pll_set_rate':
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c:13:47: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      13 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^~~~~~~~~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c:163:9: note: in expansion of macro 'mtk_phy_update_regmap_field'
     163 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_PLL_PREDIV, pre_div);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c: In function 'mtk_phy_tmds_clk_ratio':
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:25:47: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      25 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^~~~~~~~~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:43:17: note: in expansion of macro 'mtk_phy_update_regmap_field'
      43 |                 mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI20_CLK_CFG, REG_TXC_DIV, VAL_TXC_DIV4);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c: In function 'mtk_hdmi_pll_calc':
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:282:23: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     282 |         fbkdiv_high = FIELD_GET(GENMASK_ULL(63, 32), pcw);
         |                       ^~~~~~~~~


vim +/FIELD_PREP +13 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c

     8	
     9	/* field @mask shall be constant and continuous */
    10	#define mtk_phy_update_regmap_field(regmap, reg, mask, val) \
    11	({ \
    12		BUILD_BUG_ON_MSG(!__builtin_constant_p(mask), "mask is not constant"); \
  > 13		regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
    14	})
    15	
    16	#define HDMI_CON0	0x00
    17	#define RG_HDMITX_DRV_IBIAS_MASK	GENMASK(5, 0)
    18	#define RG_HDMITX_EN_SER_MASK		GENMASK(15, 12)
    19	#define RG_HDMITX_EN_SLDO_MASK		GENMASK(19, 16)
    20	#define RG_HDMITX_EN_PRED_MASK		GENMASK(23, 20)
    21	#define RG_HDMITX_EN_IMP_MASK		GENMASK(27, 24)
    22	#define RG_HDMITX_EN_DRV_MASK		GENMASK(31, 28)
    23	
    24	#define HDMI_CON1	0x04
    25	#define RG_HDMITX_PRED_IBIAS_MASK	GENMASK(21, 18)
    26	#define RG_HDMITX_PRED_IMP		BIT(22)
    27	#define RG_HDMITX_DRV_IMP_MASK		GENMASK(31, 26)
    28	
    29	#define HDMI_CON2	0x08
    30	#define RG_HDMITX_EN_TX_CKLDO		BIT(0)
    31	#define RG_HDMITX_EN_TX_POSDIV		BIT(1)
    32	#define RG_HDMITX_TX_POSDIV_MASK	GENMASK(4, 3)
    33	#define RG_HDMITX_EN_MBIAS		BIT(6)
    34	#define RG_HDMITX_MBIAS_LPF_EN		BIT(7)
    35	
    36	#define HDMI_CON4	0x10
    37	#define RG_HDMITX_RESERVE_MASK		GENMASK(31, 0)
    38	
    39	#define HDMI_CON6	0x18
    40	#define RG_HTPLL_BR_MASK		GENMASK(1, 0)
    41	#define RG_HTPLL_BC_MASK		GENMASK(3, 2)
    42	#define RG_HTPLL_BP_MASK		GENMASK(7, 4)
    43	#define RG_HTPLL_IR_MASK		GENMASK(11, 8)
    44	#define RG_HTPLL_IC_MASK		GENMASK(15, 12)
    45	#define RG_HTPLL_POSDIV_MASK		GENMASK(17, 16)
    46	#define RG_HTPLL_PREDIV_MASK		GENMASK(19, 18)
    47	#define RG_HTPLL_FBKSEL_MASK		GENMASK(21, 20)
    48	#define RG_HTPLL_RLH_EN			BIT(22)
    49	#define RG_HTPLL_FBKDIV_MASK		GENMASK(30, 24)
    50	#define RG_HTPLL_EN			BIT(31)
    51	
    52	#define HDMI_CON7	0x1c
    53	#define RG_HTPLL_AUTOK_EN		BIT(23)
    54	#define RG_HTPLL_DIVEN_MASK		GENMASK(30, 28)
    55	
    56	static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
    57	{
    58		struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
    59	
    60		regmap_set_bits(hdmi_phy->regs, HDMI_CON7, RG_HTPLL_AUTOK_EN);
    61		regmap_clear_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_RLH_EN);
    62		regmap_set_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
    63		regmap_set_bits(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_EN_MBIAS);
    64		usleep_range(80, 100);
    65		regmap_set_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_EN);
    66		regmap_set_bits(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
    67		regmap_set_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
    68		usleep_range(80, 100);
    69		regmap_set_bits(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
    70		regmap_set_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
    71		regmap_set_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
    72		regmap_set_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
    73		usleep_range(80, 100);
    74		return 0;
    75	}
    76	
    77	static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
    78	{
    79		struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
    80	
    81		regmap_clear_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
    82		regmap_clear_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
    83		regmap_clear_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
    84		regmap_clear_bits(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
    85		usleep_range(80, 100);
    86		regmap_clear_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
    87		regmap_clear_bits(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
    88		regmap_clear_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_EN);
    89		usleep_range(80, 100);
    90		regmap_clear_bits(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_EN_MBIAS);
    91		regmap_clear_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
    92		regmap_clear_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_RLH_EN);
    93		regmap_clear_bits(hdmi_phy->regs, HDMI_CON7, RG_HTPLL_AUTOK_EN);
    94		usleep_range(80, 100);
    95	}
    96	
    97	static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
    98					 unsigned long parent_rate)
    99	{
   100		struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
   101		u32 pos_div;
   102	
   103		if (rate <= 64000000)
   104			pos_div = 3;
   105		else if (rate <= 128000000)
   106			pos_div = 2;
   107		else
   108			pos_div = 1;
   109	
   110		regmap_set_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_PREDIV_MASK);
   111		regmap_set_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
   112		regmap_set_bits(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_EN_TX_POSDIV);
   113		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_IC_MASK, 0x1);
   114		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_IR_MASK, 0x1);
   115		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_TX_POSDIV_MASK, pos_div);
   116		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_FBKSEL_MASK, 1);
   117		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_FBKDIV_MASK, 19);
   118		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON7, RG_HTPLL_DIVEN_MASK, 0x2);
   119		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_BP_MASK, 0xc);
   120		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_BC_MASK, 0x2);
   121		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_BR_MASK, 0x1);
   122	
   123		regmap_clear_bits(hdmi_phy->regs, HDMI_CON1, RG_HDMITX_PRED_IMP);
   124		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON1, RG_HDMITX_PRED_IBIAS_MASK, 0x3);
   125		regmap_clear_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_IMP_MASK);
   126		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON1, RG_HDMITX_DRV_IMP_MASK, 0x28);
   127		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON4, RG_HDMITX_RESERVE_MASK, 0x28);
   128		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_DRV_IBIAS_MASK, 0xa);
   129		return 0;
   130	}
   131	
   132	static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
   133						      unsigned long parent_rate)
   134	{
   135		struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
   136		unsigned long out_rate, val;
   137		u32 tmp;
   138	
   139		regmap_read(hdmi_phy->regs, HDMI_CON6, &tmp);
 > 140		val = FIELD_GET(RG_HTPLL_PREDIV_MASK, tmp);
   141		switch (val) {
   142		case 0x00:
   143			out_rate = parent_rate;
   144			break;
   145		case 0x01:
   146			out_rate = parent_rate / 2;
   147			break;
   148		default:
   149			out_rate = parent_rate / 4;
   150			break;
   151		}
   152	
   153		val = FIELD_GET(RG_HTPLL_FBKDIV_MASK, tmp);
   154		out_rate *= (val + 1) * 2;
   155	
   156		regmap_read(hdmi_phy->regs, HDMI_CON2, &tmp);
   157		val = FIELD_GET(RG_HDMITX_TX_POSDIV_MASK, tmp);
   158		out_rate >>= val;
   159	
   160		if (tmp & RG_HDMITX_EN_TX_POSDIV)
   161			out_rate /= 5;
   162	
   163		return out_rate;
   164	}
   165	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
