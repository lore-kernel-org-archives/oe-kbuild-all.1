Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CC612FB12
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 13:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708606860; cv=none; b=cjk+Sb4I6s8q65zm35792/YDnt0ZWL0qB8jOddlBg16d68eMMgMJ0Ru39hmlF5jEBxiQF9FjYHPdi8KfbS83cIRGl0Ahg7ZS4H14w5c3fuDWi7JRjtFhYB/zlOJgbkZA/DNEYDGFU/y9cofqoL++92eic7vc+mTgHwodEvI1cuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708606860; c=relaxed/simple;
	bh=yq60SXhKJhQ3jQvXB/4G8p8BFmOPnvVaaMmfcdPXwMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DIBkT6qV+hR/Lv4eVhtu4ACHkEreYR7dM5BbNfBpbfZ73+OMUXxIVnlfuG/sGFYDWKIFvVDNBoYjSkYwfa+wGGTmezB635bOtqGuZT8cvYxgkqbt3re7HbSe3rr1JkPEp9IhcdJkDoY3by7GY0zrHD4A3BAfLG3g/Ooa2W5lbY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQ2OnT8n; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQ2OnT8n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708606858; x=1740142858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yq60SXhKJhQ3jQvXB/4G8p8BFmOPnvVaaMmfcdPXwMM=;
  b=BQ2OnT8npXh8KLVMZRvVedfOGJmljgSISwSlL5l4SYGGAWrjFmZaD2Bg
   Lhhd69PxtYq6PbJBPUer8uGiMrUrijGCx6eL+RhTjJhlsvbefKa8+kCmo
   +LgC11ewvO1WPJcdBUWgIr0uFqJink+DNVgN0hBiWgKaY8hgnFGEXprmN
   dKMP/DC7OxGyhmeicA9o2n06loEEWMmlE0osgonTiwtvJe/3mO13xtcgg
   sZCTKWINKZoELTlxxAaSwUoW/B2qKuV5xAqOaglyOXZ4r6cHgWNUfW4GG
   8p+0OdRxYx+ZZIfhFPp3Uvb3bYbJKTFG5KZTQn/7z4w6IswMDsT6sHwiz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="6606727"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="6606727"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 05:00:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5874120"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Feb 2024 05:00:51 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd8gy-0006KW-1S;
	Thu, 22 Feb 2024 13:00:48 +0000
Date: Thu, 22 Feb 2024 21:00:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liao Chen <liaochen4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2392/3331] arch/arm64/kernel/ipi_nmi.c:39:9:
 error: implicit declaration of function '__printk_safe_enter'
Message-ID: <202402222006.PH9PlsbP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   0b30804544e281a67d384ea10249544d92a69e2f
commit: 5e3e94b1477ca3f6cb47ae8137a4a99fe0ef6147 [2392/3331] arm64: Add non nmi ipi backtrace support
config: arm64-randconfig-r064-20240222 (https://download.01.org/0day-ci/archive/20240222/202402222006.PH9PlsbP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402222006.PH9PlsbP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402222006.PH9PlsbP-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/ipi_nmi.c: In function 'ipi_cpu_backtrace':
>> arch/arm64/kernel/ipi_nmi.c:39:9: error: implicit declaration of function '__printk_safe_enter' [-Werror=implicit-function-declaration]
      39 |         __printk_safe_enter();
         |         ^~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/ipi_nmi.c:41:9: error: implicit declaration of function '__printk_safe_exit' [-Werror=implicit-function-declaration]
      41 |         __printk_safe_exit();
         |         ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/__printk_safe_enter +39 arch/arm64/kernel/ipi_nmi.c

    35	
    36	#ifdef CONFIG_NON_NMI_IPI_BACKTRACE
    37	static void ipi_cpu_backtrace(void *info)
    38	{
  > 39		__printk_safe_enter();
    40		nmi_cpu_backtrace(get_irq_regs());
  > 41		__printk_safe_exit();
    42	}
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
