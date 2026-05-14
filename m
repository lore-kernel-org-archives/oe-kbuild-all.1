Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257E4346E4A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 21:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778794673; cv=none; b=JjU0bp5/1PNb+tM2QroVy837tsqefxmDFTaS5WsyhssIe4WvwiQjNz7B5ZBeN/TJrrVgjd1ct/xiBfFbvULOwFbWlpn6hvzIYR4IQXPwSdjqD9DaVe4qdM9z7rQbph/I+js6ndn1gnoEFoAClIamxIA6TkM4ZpK+q1z55ynGtE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778794673; c=relaxed/simple;
	bh=w1hhzXE+DD74DIYF+ubNIkcYEHesCf3LS4X+NZRyKlo=;
	h=Date:From:Cc:Subject:Message-ID; b=rmq3AVPU/5aH5SBq9FO1TZK3nhgClT6n30kUJ6wHsYLV7PRxh6I7IzhoFkcoTHn20YwxKpFTWu6FPGFqT7DPG3DKM7GGIQNKhMKIG5OBYcDmbWzvOXJ3HT1fLRD/b/BA/gubLVjKJgyxfj/4Vw2PRngxpIUuZ00oOBcnFbmBSlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DW2m8vwD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DW2m8vwD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778794672; x=1810330672;
  h=date:from:cc:subject:message-id;
  bh=w1hhzXE+DD74DIYF+ubNIkcYEHesCf3LS4X+NZRyKlo=;
  b=DW2m8vwDOBrbWnEtRIEUXjzqeai04ya4POrxbI4iSFGj0dEoU0juskr9
   xm0INyf+YKr8xS7EgkRGaivWVZO+7jlenyJOrdoJ5ZOZJDrJMMpdHaygT
   bsisH2shh0Q96Di8ZqhlZD4WQG7xtVpxab4XVM3nKD6BH/CjpDxl4Ot+7
   EkkhNjzztblvYK4sMx2UzSsg8Srdq5Yv69lJfWS5YPUnIYPRbhGOPmvCG
   841w0PTGqNk14PSc/hk85EZknBkUJa3WAtsptLqwOh1XJLl4aH0cODUAt
   QbjwDkl0ZHVjUg7xX3CF0pciIHBuUKGULu+F4ZdXHOOEv/q6/9QMfYwwh
   w==;
X-CSE-ConnectionGUID: aN9OF7m2SByiNU7myu7eXA==
X-CSE-MsgGUID: SUw/WfAAQg2rrKMav9m95g==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="90055550"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="90055550"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 14:37:52 -0700
X-CSE-ConnectionGUID: RkbkFnzaR6C4XsJAUfgmEw==
X-CSE-MsgGUID: pFb01DlFRPG2odFL7dt+mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="262254229"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 14 May 2026 14:37:50 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNdka-000000000Ab-0Kb5;
	Thu, 14 May 2026 21:37:48 +0000
Date: Fri, 15 May 2026 05:25:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/usb/dwc3/core.c:796:45: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202605150540.X43iAYqH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66182ca873a4e87b3496eca79d57f86b76d7f52d
commit: de6c925db978004703944585e9dd57d58aba0fac Merge 7.0-rc4 into usb-next
date:   8 weeks ago
config: i386-randconfig-063 (https://download.01.org/0day-ci/archive/20260515/202605150540.X43iAYqH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150540.X43iAYqH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: de6c925db978 ("Merge 7.0-rc4 into usb-next")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150540.X43iAYqH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/dwc3/core.c:796:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct dwc3 *dwc @@     got void [noderef] __iomem *regs @@
   drivers/usb/dwc3/core.c:796:45: sparse:     expected struct dwc3 *dwc
   drivers/usb/dwc3/core.c:796:45: sparse:     got void [noderef] __iomem *regs
   drivers/usb/dwc3/core.c:798:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct dwc3 *dwc @@     got void [noderef] __iomem *regs @@
   drivers/usb/dwc3/core.c:798:40: sparse:     expected struct dwc3 *dwc
   drivers/usb/dwc3/core.c:798:40: sparse:     got void [noderef] __iomem *regs

vim +796 drivers/usb/dwc3/core.c

30a46746ca5a1ef Krishna Kurapati 2024-04-20  784  
a28de6335657561 Ingo Rohloff     2026-03-05  785  static void dwc3_ulpi_setup(struct dwc3 *dwc)
a28de6335657561 Ingo Rohloff     2026-03-05  786  {
a28de6335657561 Ingo Rohloff     2026-03-05  787  	int index;
a28de6335657561 Ingo Rohloff     2026-03-05  788  	u32 reg;
a28de6335657561 Ingo Rohloff     2026-03-05  789  
a28de6335657561 Ingo Rohloff     2026-03-05  790  	/* Don't do anything if there is no ULPI PHY */
a28de6335657561 Ingo Rohloff     2026-03-05  791  	if (!dwc->ulpi)
a28de6335657561 Ingo Rohloff     2026-03-05  792  		return;
a28de6335657561 Ingo Rohloff     2026-03-05  793  
a28de6335657561 Ingo Rohloff     2026-03-05  794  	if (dwc->enable_usb2_transceiver_delay) {
a28de6335657561 Ingo Rohloff     2026-03-05  795  		for (index = 0; index < dwc->num_usb2_ports; index++) {
a28de6335657561 Ingo Rohloff     2026-03-05 @796  			reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(index));
a28de6335657561 Ingo Rohloff     2026-03-05  797  			reg |= DWC3_GUSB2PHYCFG_XCVRDLY;
a28de6335657561 Ingo Rohloff     2026-03-05  798  			dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(index), reg);
a28de6335657561 Ingo Rohloff     2026-03-05  799  		}
a28de6335657561 Ingo Rohloff     2026-03-05  800  	}
a28de6335657561 Ingo Rohloff     2026-03-05  801  }
a28de6335657561 Ingo Rohloff     2026-03-05  802  

:::::: The code at line 796 was first introduced by commit
:::::: a28de63356575612954d4e5d5f48a2488f50e16d usb: dwc3: Support USB3340x ULPI PHY high-speed negotiation.

:::::: TO: Ingo Rohloff <ingo.rohloff@lauterbach.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
