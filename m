Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1584ED3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 22:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aGB2VWEP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699656571; x=1731192571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+H/+pwkQqLIcSesUO7CYd7e/IWnf4l7r3MASOt/xY60=;
  b=aGB2VWEPS+Ks5Bsgs7xZv9NqLMcubC82b6XgwsDJFX5+FJpdqkhHWNO/
   q3YJtCTyLJt12WFjM5a6IVHv1qEtGg+PiO3UR+ot3SB1MMt1XBAIVak83
   N2ThstUyPH4GGJ7BkX6mkHAA10H5fsJXCZ79U6pqUeMst7OHNkXldzuJb
   qVZwTa0fgU0BlRNvsXc5rxJsOKjIjLUI2NLfUNdRHO2acnkZYrPHVjWlO
   qmghmbuEd1n7lN9MQqVzWhW0mbM89hBd2Yvc81EfmHZWW48aI2oRJlBqB
   ICBJFB+DpzV3dwTRx3E1QOgKkTu3UToihcO7nUwHmw96z2LuVAo/bLszU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="369571814"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="369571814"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 14:49:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="763845449"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="763845449"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Nov 2023 14:49:29 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1aJb-0009za-1P;
	Fri, 10 Nov 2023 22:49:27 +0000
Date: Sat, 11 Nov 2023 06:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 6/8] net: pcs: add driver for MediaTek USXGMII PCS
Message-ID: <202311110611.RMxLQYxV-lkp@intel.com>
References: <b9f787f3e4aa36e148d7595495af60db53f74417.1699565880.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9f787f3e4aa36e148d7595495af60db53f74417.1699565880.git.daniel@makrotopia.org>

Hi Daniel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on net-next/main net/main linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/dt-bindings-phy-mediatek-xfi-pextp-add-new-bindings/20231110-055440
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/b9f787f3e4aa36e148d7595495af60db53f74417.1699565880.git.daniel%40makrotopia.org
patch subject: [RFC PATCH 6/8] net: pcs: add driver for MediaTek USXGMII PCS
config: x86_64-buildonly-randconfig-003-20231111 (https://download.01.org/0day-ci/archive/20231111/202311110611.RMxLQYxV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110611.RMxLQYxV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110611.RMxLQYxV-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `mtk_pcs_lynxi_get_state':
>> pcs-mtk-lynxi.c:(.text+0x13acb97): undefined reference to `phylink_mii_c22_pcs_decode_state'
   ld: vmlinux.o: in function `mtk_pcs_lynxi_config':
>> pcs-mtk-lynxi.c:(.text+0x13acf7b): undefined reference to `phylink_mii_c22_pcs_encode_advertisement'
   ld: vmlinux.o: in function `mtk_usxgmii_pcs_get_state':
>> pcs-mtk-usxgmii.c:(.text+0x13ada3d): undefined reference to `phylink_decode_usxgmii_word'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHY_MTK_PEXTP
   Depends on [n]: (ARCH_MEDIATEK || COMPILE_TEST [=y]) && OF [=n] && OF_ADDRESS [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - PCS_MTK_USXGMII [=y] && NETDEVICES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
