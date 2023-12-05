Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D24675D4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 16:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UADj0OsW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701794212; x=1733330212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=92MfA4MvbvqjZFoA2gfByCQeE0/OZjs1Zm98Qt+KTJ8=;
  b=UADj0OsWDpjVUCDo9pKcIYI0W2GT+GMvdiikyDIQbXLEchFK0spS2NKv
   duUM0nNUEf8O7eX+2isVegPatWu8yuXE6UguG4wiXde0Nf03EbVfLMBMH
   6nI18Hq6ZKxvq3i0E7oaMc1YyDqeJNy31Pk2uAgnja1T85ud8x8tp0q6h
   obi9B7WuXcFQcB2R9u8jgqiVqkJNsHrHZ/EuxkL42cZsoECDNVuugLMVw
   mlzRlYGV3BBjRK6EJAn+e6SnhR8BJ5EpQi09UJHgzy7b5R/wnSw8gwpOe
   /ZijLAIxIizrNoEhDO39z8hQYECbRaFfN22I0mDTroFXoZuoxThGJvc9B
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="977972"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="977972"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 08:36:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="800025870"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="800025870"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 05 Dec 2023 08:36:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAYPf-0009MM-1z;
	Tue, 05 Dec 2023 16:36:47 +0000
Date: Wed, 6 Dec 2023 00:35:50 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next v3 05/13] net: ethtool: Allow passing a phy
 index for some commands
Message-ID: <202312060014.KIUomjmF-lkp@intel.com>
References: <20231201163704.1306431-6-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201163704.1306431-6-maxime.chevallier@bootlin.com>

Hi Maxime,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-phy-Introduce-ethernet-link-topology-representation/20231202-003935
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231201163704.1306431-6-maxime.chevallier%40bootlin.com
patch subject: [RFC PATCH net-next v3 05/13] net: ethtool: Allow passing a phy index for some commands
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20231206/202312060014.KIUomjmF-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060014.KIUomjmF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060014.KIUomjmF-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: net/core/dev.o: in function `alloc_netdev_mqs':
   dev.c:(.text+0x14ada): undefined reference to `phy_link_topo_init'
   s390-linux-ld: net/ethtool/netlink.o: in function `ethnl_parse_header_dev_get':
>> netlink.c:(.text+0xcfa): undefined reference to `phy_link_topo_get_phy'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
