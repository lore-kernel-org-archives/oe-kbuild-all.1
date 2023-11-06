Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA2C53BE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 04:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWFp77fe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699243528; x=1730779528;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L7F5rY6Zj0vKKSUedjqWPKrqKzgauP6Yhp1Zjlw2Rrs=;
  b=RWFp77feq5oxPQCkYCSJc5Elz6VwKqbHaT8aAtV6heFh9LbexxIAr6qK
   NspCFkM7xS/0piHsnsNCsn2M+tx+tYQuytKBlVhRf/cLqIojTBiqlK7HQ
   Ae3V5eemgnUQLXbxuOsRpXyUmjbPHeuhLMvBJJGg+oTzcWPWHrZZcx3Kd
   vH2Fz+sp/hJ3Y4INsUhVkqRH4XqkDZD2xdIUhjQobHLkFge52kuwhFfpZ
   whbFWc6HQSo4NBgj6gVj1PuGSLlUdQLvTeUG5eNFghtz34ePetnNTHXC8
   tx64R3zxnPP+iYAjxdY0NIKHK5auRrAll5kTOiknyjfQ1Ql9sJ5r3wPb5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="386377952"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="386377952"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 20:05:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="1093647998"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="1093647998"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Nov 2023 20:05:00 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzqrC-00065D-15;
	Mon, 06 Nov 2023 04:04:58 +0000
Date: Mon, 6 Nov 2023 12:03:33 +0800
From: kernel test robot <lkp@intel.com>
To: James Tai <james.tai@realtek.com>, linux-kernel@vger.kernel.org,
	linux-realtek-soc@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 4/6] irqchip: Introduce RTD1319D support using the
 Realtek Common Interrupt Controller Driver
Message-ID: <202311061137.FRpoKwcm-lkp@intel.com>
References: <20231102142731.2087245-5-james.tai@realtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102142731.2087245-5-james.tai@realtek.com>

Hi James,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on linus/master v6.6 next-20231106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Tai/dt-bindings-interrupt-controller-Add-support-for-Realtek-DHC-SoCs/20231103-074117
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20231102142731.2087245-5-james.tai%40realtek.com
patch subject: [PATCH 4/6] irqchip: Introduce RTD1319D support using the Realtek Common Interrupt Controller Driver
config: i386-randconfig-061-20231106 (https://download.01.org/0day-ci/archive/20231106/202311061137.FRpoKwcm-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061137.FRpoKwcm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061137.FRpoKwcm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-realtek-rtd1319d.c:172:25: sparse: sparse: symbol 'realtek_intc_rtd1319d_pm_ops' was not declared. Should it be static?

vim +/realtek_intc_rtd1319d_pm_ops +172 drivers/irqchip/irq-realtek-rtd1319d.c

   171	
 > 172	const struct dev_pm_ops realtek_intc_rtd1319d_pm_ops = {
   173		.suspend_noirq = realtek_intc_rtd1319d_suspend,
   174		.resume_noirq = realtek_intc_rtd1319d_resume,
   175	};
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
