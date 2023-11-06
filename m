Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89C44422
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 10:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQ1XNJ6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699266434; x=1730802434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mNRCEoOy8hKYCH98XCcXsARy2hw5s+9eonx2jFd56r4=;
  b=DQ1XNJ6lFu00duKWjuN/MnbpmWN5O2U9FdeQDi9zYgK3AAuNHpk0ttFx
   JVaW5LlSnC5PvPfaCQ2h1RftisTxhUDnV2OzXzi/NBVDSfBkydbAPhWwU
   yz2BJyU+KJGm/9zrM+2+sFOVMkBIzyj3c9TqSk8/jiJW/3kqwiJed3lgZ
   Jb2UfmDyQWF9ymJESqW4IiMg9sY6lnLykQR4h4LTIfRuuGNqau0LQC3k4
   TIb5eohIh9rks5Dgt1+L+ZB+EBY39/Fh/dnxFA/IiJ5ez7wnN/j6cVPLw
   iqBAoYJSdMw2sWSbMZ/FQqPBQAfwLHvPNeE0iureuXWahNO/RSIWY/Ksl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2235830"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="2235830"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 02:27:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="935755856"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="935755856"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Nov 2023 02:27:11 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzwp2-0006Ka-2b;
	Mon, 06 Nov 2023 10:27:08 +0000
Date: Mon, 6 Nov 2023 18:26:11 +0800
From: kernel test robot <lkp@intel.com>
To: James Tai <james.tai@realtek.com>, linux-kernel@vger.kernel.org,
	linux-realtek-soc@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 6/6] irqchip: Introduce RTD1619B support using the
 Realtek Common Interrupt Controller Driver
Message-ID: <202311061822.551ieaoI-lkp@intel.com>
References: <20231102142731.2087245-7-james.tai@realtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102142731.2087245-7-james.tai@realtek.com>

Hi James,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on linus/master v6.6 next-20231106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Tai/dt-bindings-interrupt-controller-Add-support-for-Realtek-DHC-SoCs/20231103-074117
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20231102142731.2087245-7-james.tai%40realtek.com
patch subject: [PATCH 6/6] irqchip: Introduce RTD1619B support using the Realtek Common Interrupt Controller Driver
config: i386-randconfig-061-20231106 (https://download.01.org/0day-ci/archive/20231106/202311061822.551ieaoI-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061822.551ieaoI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061822.551ieaoI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-realtek-rtd1619b.c:162:25: sparse: sparse: symbol 'realtek_intc_rtd1619b_pm_ops' was not declared. Should it be static?

vim +/realtek_intc_rtd1619b_pm_ops +162 drivers/irqchip/irq-realtek-rtd1619b.c

   161	
 > 162	const struct dev_pm_ops realtek_intc_rtd1619b_pm_ops = {
   163		.suspend_noirq = realtek_intc_rtd1619b_suspend,
   164		.resume_noirq = realtek_intc_rtd1619b_resume,
   165	};
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
