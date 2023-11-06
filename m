Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A504A4422
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 07:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQJUzqW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699254072; x=1730790072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z5md8nFIDUVxbsFETt4dnH4OJteqkOpEwqswLVVTazo=;
  b=aQJUzqW9/Tnx0WneYuo2Y7YO3EgW3vkXAdPEYotJWx5m59xsu7YRNofN
   ZNNuXu9HF1tuYShHog/cf60dVfy37ZWtVGrxZG8+U9Bcn/0MLVWo6L3JJ
   yWVbNbsgfDwAOeojJomdnIoiPWh9DvhIlf4KAj37SdJOwDoliGc3R1O2v
   y9SSrvcfXm1Q4H3SnCif1YnAqzaViOo+kjmxTNY+IP9K4vlXjn2u/CJit
   MaSpCeQvfOXMXAO1J1Fg/TNX6Fy/sF03HEfiSywXgKlJ7RcfrwVlA9j4h
   c+iRq+SGR0as+WFfreDQj3yzY/byXT+twe/0sufz1Ay/WbzlhOujOA3+x
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="392087537"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="392087537"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 23:01:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="935714914"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="935714914"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Nov 2023 23:01:05 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qztbb-0006DH-2V;
	Mon, 06 Nov 2023 07:01:03 +0000
Date: Mon, 6 Nov 2023 15:00:02 +0800
From: kernel test robot <lkp@intel.com>
To: James Tai <james.tai@realtek.com>, linux-kernel@vger.kernel.org,
	linux-realtek-soc@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 5/6] irqchip: Introduce RTD1325 support using the Realtek
 Common Interrupt Controller Driver
Message-ID: <202311061408.qjl1jfVl-lkp@intel.com>
References: <20231102142731.2087245-6-james.tai@realtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102142731.2087245-6-james.tai@realtek.com>

Hi James,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on linus/master v6.6 next-20231106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Tai/dt-bindings-interrupt-controller-Add-support-for-Realtek-DHC-SoCs/20231103-074117
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20231102142731.2087245-6-james.tai%40realtek.com
patch subject: [PATCH 5/6] irqchip: Introduce RTD1325 support using the Realtek Common Interrupt Controller Driver
config: i386-randconfig-061-20231106 (https://download.01.org/0day-ci/archive/20231106/202311061408.qjl1jfVl-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061408.qjl1jfVl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061408.qjl1jfVl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-realtek-rtd1325.c:175:25: sparse: sparse: symbol 'realtek_intc_rtd1325_pm_ops' was not declared. Should it be static?

vim +/realtek_intc_rtd1325_pm_ops +175 drivers/irqchip/irq-realtek-rtd1325.c

   174	
 > 175	const struct dev_pm_ops realtek_intc_rtd1325_pm_ops = {
   176		.suspend_noirq = realtek_intc_rtd1325_suspend,
   177		.resume_noirq = realtek_intc_rtd1325_resume,
   178	};
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
