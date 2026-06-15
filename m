Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB173E3C7B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jun 2026 11:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781523667; cv=none; b=rS0CcJwAXSdL9HmkUmlnB12IF3HttFoSHjx3xzDA5QZUCPHZvRnYg29YVsDkg8+MVfCBXEABUzMvLrfHAUpg3cRwKJdMqiVXo8Epfwe/8xivPAgeHNa6wrXjgBkBwOV5LGjxVyAQAOBoIXinF1XhQWwP4kabb6mcW5lUzrLbawk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781523667; c=relaxed/simple;
	bh=IgoBhszxuirrAHteXVRn0HU5hSQ9LACqposfZ0qJzSM=;
	h=Date:From:Cc:Subject:Message-ID; b=I7x5pn4Id4yH2QOtt5Ia+iSPtfwZcdv8OkiGGOXKPPBSQAqcVALDe6m4AjJ0VABOy0NslOQklZ5jWLfNv74WqMf/SY2WDf6eSWUbueiy6oxC4+ZUypylfL7M217geEkGNERxAu/Eh3T7dtSMiSsJvaHzOl/eXGRCjJzcOsCR0qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P2MixiOe; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2MixiOe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781523666; x=1813059666;
  h=date:from:cc:subject:message-id;
  bh=IgoBhszxuirrAHteXVRn0HU5hSQ9LACqposfZ0qJzSM=;
  b=P2MixiOedp7AXbMjA03ODAwt1LKEhi5KvPklO44HS1jE7tSnGDCbKnQ+
   kQpPT/7qgsLkaHQDW0n0UdUgKNO7P8f/jQd/snxi3EtN4+rZHxwhnHTGv
   PWaPmfh69hconogfv5crhU/kL28Z5mPpDxKR7ivJB6QZpEiIk4FW6/1FU
   uIpu55V2bAf0Otm2D3HW5u7BMo87uOuwXKecTXrDPAmukzQqppk5GUW2h
   FpPJhEL1EHTnXETRSSkqMxUaGaSLFpOSngKBUfxjRGNs37Oic7atNE6qN
   4jOS5/GFAxUTa+Yuh0Gu0Q85mDzk/tdMDAC2OdINmuM6Q8gd5mWP6xTpX
   g==;
X-CSE-ConnectionGUID: kv+wKm9ASPaTbudjFGfZQw==
X-CSE-MsgGUID: 0ZoPS5KDQKOGGGxOcH7L/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="85894059"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="85894059"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 04:41:05 -0700
X-CSE-ConnectionGUID: DbLnTr4hQYi5UwJKdgy02Q==
X-CSE-MsgGUID: 5YFQ1otlQSql/XfCAS+WsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="252405504"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Jun 2026 04:41:04 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZ5ga-00000000Rn8-33M1;
	Mon, 15 Jun 2026 11:41:00 +0000
Date: Mon, 15 Jun 2026 19:40:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/usb/dwc3/core.c:796:45: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202606151901.rrsieJcI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e0611827f3349d0a2ac121c023a6d3260dcecdb
commit: de6c925db978004703944585e9dd57d58aba0fac Merge 7.0-rc4 into usb-next
date:   3 months ago
config: i386-randconfig-061-20260614 (https://download.01.org/0day-ci/archive/20260615/202606151901.rrsieJcI-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606151901.rrsieJcI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: de6c925db978 ("Merge 7.0-rc4 into usb-next")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606151901.rrsieJcI-lkp@intel.com/

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
