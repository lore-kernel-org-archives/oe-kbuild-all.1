Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBAE18C332
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 00:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791505989; cv=none; b=PVKrLP+scrWx8CUe45PvtlK6kPofE7liumXJWbZxZCYYLjBhjQhzmv0r1Gz3eDEV0FUeBRv90tKwKMyDDk29CGbei1UIv6r/NkPre+3FxogzNVceo/TQjK9CXHNG6/FxidIj/Qf9/8ZvVEgtjs7L5uwRg4WQit2qVK+j+hglnLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791505989; c=relaxed/simple;
	bh=7hpFUKr7EVvglbkHCc1lMsjsDOx3o620ZX4oGXumnRg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CanQH5tIZvw3u96q+K2Qkpk5wCjOzkz3t8vvogMLOHkGoUdEy4cmxciK7kooZnQzwVQvznmF/vh8ddhwxME1Bx/QDoy6oNLNKKvCo7OyAI9y6NaCesd4pp3qTVWZC5x7HiP4M/HDiSl90YmE9MHqLj1j5m7p1A67DY0sdu3W/Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gsej1z7h; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gsej1z7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791505988; x=1823041988;
  h=date:from:to:cc:subject:message-id;
  bh=7hpFUKr7EVvglbkHCc1lMsjsDOx3o620ZX4oGXumnRg=;
  b=gsej1z7hDIh4XhTgPNmy0WyUxFYTozMOzKu1/F91d+EjyWk7ve9QPMYc
   r2t/iOW/ls4OIFgpMN2VDipZEbBQHftX1XYFEA8KoZhKWa14J8bkx26LZ
   1Zp0dkUOXfBUSTkKp0oZcylSdnzhsSiv+413KLo00R/sRt7IbXAikFCYa
   zyN+0z0zlxGL1ksTW01sGI+byICI9M2e4zMhbcjuHhRRQ1iYTtlm5nlBG
   a1B4Bhzj7f7EV/okCj7oFlvaqsZ9MEu22tiABchhIM6RectWVIyWBXUdo
   OiuZrR0WGt0F8SlAfIqLxM2ZdlP+muaxw54x6YiOVyyHkLloUoeEhGXFk
   Q==;
X-CSE-ConnectionGUID: 81I+HQx8R8WyPeDL9eWl3g==
X-CSE-MsgGUID: HNF0jTDJS2ypSXS2S62jZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="175829"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="175829"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 17:33:07 -0700
X-CSE-ConnectionGUID: Z2KNoxt4QgOdpzUWf3d+Yg==
X-CSE-MsgGUID: QTPddXa+Rsiverk891Cw2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="172615"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 08 Oct 2026 17:33:05 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEyXn-000000006Op-2qSW;
	Fri, 09 Oct 2026 00:33:03 +0000
Date: Fri, 09 Oct 2026 02:32:45 +0200
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Subject: [vkoul-dmaengine:next 109/138]
 drivers/dma/ste_dma40.c:1444:25: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202610090216.pjMRxhRL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
head:   1d8ae2003de08f61095e4e928b1b8cce6c23cabd
commit: c80edceff29ee212987c2d2c851b2cb2eb4b477a [109/138] dmaengine: ste_dma40: Fix cyclic transfer residue
config: arm-randconfig-r2301-20261008 (https://download.01.org/0day-ci/archive/20261009/202610090216.pjMRxhRL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610090216.pjMRxhRL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610090216.pjMRxhRL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma/ste_dma40.c:1416:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/dma/ste_dma40.c:1416:28: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/dma/ste_dma40.c:1416:28: sparse:     got unsigned int *
>> drivers/dma/ste_dma40.c:1444:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *low_reg @@     got unsigned int * @@
   drivers/dma/ste_dma40.c:1444:25: sparse:     expected void [noderef] __iomem *low_reg
   drivers/dma/ste_dma40.c:1444:25: sparse:     got unsigned int *
>> drivers/dma/ste_dma40.c:1445:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *high_reg @@     got unsigned int * @@
   drivers/dma/ste_dma40.c:1445:26: sparse:     expected void [noderef] __iomem *high_reg
   drivers/dma/ste_dma40.c:1445:26: sparse:     got unsigned int *
   drivers/dma/ste_dma40.c:1447:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *low_reg @@     got unsigned int * @@
   drivers/dma/ste_dma40.c:1447:25: sparse:     expected void [noderef] __iomem *low_reg
   drivers/dma/ste_dma40.c:1447:25: sparse:     got unsigned int *
   drivers/dma/ste_dma40.c:1448:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *high_reg @@     got unsigned int * @@
   drivers/dma/ste_dma40.c:1448:26: sparse:     expected void [noderef] __iomem *high_reg
   drivers/dma/ste_dma40.c:1448:26: sparse:     got unsigned int *
   drivers/dma/ste_dma40.c:1490:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/dma/ste_dma40.c:1490:27: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/dma/ste_dma40.c:1490:27: sparse:     got unsigned int *
   drivers/dma/ste_dma40.c:3638:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *lcpa_base @@     got void [noderef] __iomem * @@
   drivers/dma/ste_dma40.c:3638:25: sparse:     expected void *lcpa_base
   drivers/dma/ste_dma40.c:3638:25: sparse:     got void [noderef] __iomem *
   drivers/dma/ste_dma40.c:3654:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *base @@     got void [noderef] __iomem * @@
   drivers/dma/ste_dma40.c:3654:38: sparse:     expected void *base
   drivers/dma/ste_dma40.c:3654:38: sparse:     got void [noderef] __iomem *

vim +1444 drivers/dma/ste_dma40.c

  1410	
  1411	static u32 d40_residue(struct d40_chan *d40c)
  1412	{
  1413		u32 num_elt;
  1414	
  1415		if (chan_is_logical(d40c))
> 1416			num_elt = (readl(&d40c->lcpa->lcsp2) & D40_MEM_LCSP2_ECNT_MASK)
  1417				>> D40_MEM_LCSP2_ECNT_POS;
  1418		else {
  1419			u32 val = readl(chan_base(d40c) + D40_CHAN_REG_SDELT);
  1420			num_elt = (val & D40_SREG_ELEM_PHY_ECNT_MASK)
  1421				  >> D40_SREG_ELEM_PHY_ECNT_POS;
  1422		}
  1423	
  1424		return num_elt * d40c->dma_cfg.dst_info.data_width;
  1425	}
  1426	
  1427	static bool d40_current_addr(struct d40_chan *d40c, dma_addr_t *addr)
  1428	{
  1429		bool dst = d40c->dma_cfg.dir == DMA_DEV_TO_MEM;
  1430		void __iomem *high_reg;
  1431		void __iomem *low_reg;
  1432		u32 low;
  1433		u32 high;
  1434		u32 check;
  1435		int i;
  1436	
  1437		if (chan_is_physical(d40c)) {
  1438			*addr = readl(chan_base(d40c) +
  1439				      (dst ? D40_CHAN_REG_SDPTR : D40_CHAN_REG_SSPTR));
  1440			return true;
  1441		}
  1442	
  1443		if (dst) {
> 1444			low_reg = &d40c->lcpa->lcsp2;
> 1445			high_reg = &d40c->lcpa->lcsp3;
  1446		} else {
  1447			low_reg = &d40c->lcpa->lcsp0;
  1448			high_reg = &d40c->lcpa->lcsp1;
  1449		}
  1450	
  1451		for (i = 0; i < D40_RESIDUE_MAX_ATTEMPTS; i++) {
  1452			high = readl(high_reg) & D40_MEM_LCSP1_SPTR_MASK;
  1453			low = readl(low_reg) & D40_MEM_LCSP0_SPTR_MASK;
  1454			check = readl(high_reg) & D40_MEM_LCSP1_SPTR_MASK;
  1455			if (high == check) {
  1456				*addr = low | high;
  1457				return true;
  1458			}
  1459		}
  1460	
  1461		return false;
  1462	}
  1463	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
