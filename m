Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEB05224
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 17:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709313383; cv=none; b=RSUs5ZyqBk31jrmZktrQ9iZIDNkGUztqnosLfjg+/BllDYRcImLLDf2OU/5niNNhjuprN+cmZKSU5xPYbazrdbuklQcEdLfyt176GSCq4eyihGsFdo1c9xHzGp1dJy1IyfBYkDS0L86sbdnGcPsjkyAcyOmB29rbkyxjBnKRzgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709313383; c=relaxed/simple;
	bh=cbRohUx3ErKxgK1qjHBxPNafeJKEOaCPZl44D0Y9rXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nJuuzuUWc6v30JiH3Tk3HZ7wauKhH9l/Rja4zs6rleoKzgQeNTgxRVQLmWz0chmDsqV/0scsdyiHMWqeCGGBja7l2xR1JPSuMmSZgQ8HzOqOax9YmuDzNrSWaJg2MRH03k8HvnpfucYliDmqAIA187Ch9vGv4JOKhPTeJkWuJsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PsClNG+0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PsClNG+0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709313381; x=1740849381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cbRohUx3ErKxgK1qjHBxPNafeJKEOaCPZl44D0Y9rXo=;
  b=PsClNG+0LM3aZIoFJy4l0djOofxGswmOHR1vbTTnq68bie4BvpLPPKd0
   OIiYr0ZBMl42NG0EJAO1pHlOzAXPO+es9vtmqy7AcAZEGpkPI/Ol2RP4v
   mYnRGGx2W1FGqZ/awim5b1QSiyZutINWsU7xvdG5znCUPaSt5ZOlnDT/4
   q1xCz1+nz4tri4XGEQI75ZEkNX0uddNNBq0QgPQUWQzkYA3R8/q9bkwCx
   8A3gEiZk3O0Zd4VUBqG79hWE0+iO7X+Y7xt8cTimCkSfWoILrpgwMPzwc
   4yvIBBZwSLHgLEfa9RTgvj11ZruoX7+rnBHGv6PiCPaNpxpA4B7bHG36J
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="4029662"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="4029662"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 09:16:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8642226"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Mar 2024 09:16:17 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rg6UU-000DzH-0U;
	Fri, 01 Mar 2024 17:16:11 +0000
Date: Sat, 2 Mar 2024 01:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/usb/dwc2/core_intr.c:715:7: error: 'struct dwc2_hsotg' has
 no member named 'bus_suspended'
Message-ID: <202403020130.RJskhtuv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: d97c8b050724954bd68647f6d057636eb3f2abe8 usb: dwc2: Fix hibernation between host and device modes.
date:   2 years, 9 months ago
config: x86_64-randconfig-003-20240301 (https://download.01.org/0day-ci/archive/20240302/202403020130.RJskhtuv-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403020130.RJskhtuv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403020130.RJskhtuv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/dwc2/core_intr.c: In function 'dwc_handle_gpwrdn_disc_det':
>> drivers/usb/dwc2/core_intr.c:715:7: error: 'struct dwc2_hsotg' has no member named 'bus_suspended'
     715 |  hsotg->bus_suspended = 0;
         |       ^~


vim +715 drivers/usb/dwc2/core_intr.c

   667	
   668	/**
   669	 * dwc_handle_gpwrdn_disc_det() - Handles the gpwrdn disconnect detect.
   670	 * Exits hibernation without restoring registers.
   671	 *
   672	 * @hsotg: Programming view of DWC_otg controller
   673	 * @gpwrdn: GPWRDN register
   674	 */
   675	static inline void dwc_handle_gpwrdn_disc_det(struct dwc2_hsotg *hsotg,
   676						      u32 gpwrdn)
   677	{
   678		u32 gpwrdn_tmp;
   679	
   680		/* Switch-on voltage to the core */
   681		gpwrdn_tmp = dwc2_readl(hsotg, GPWRDN);
   682		gpwrdn_tmp &= ~GPWRDN_PWRDNSWTCH;
   683		dwc2_writel(hsotg, gpwrdn_tmp, GPWRDN);
   684		udelay(5);
   685	
   686		/* Reset core */
   687		gpwrdn_tmp = dwc2_readl(hsotg, GPWRDN);
   688		gpwrdn_tmp &= ~GPWRDN_PWRDNRSTN;
   689		dwc2_writel(hsotg, gpwrdn_tmp, GPWRDN);
   690		udelay(5);
   691	
   692		/* Disable Power Down Clamp */
   693		gpwrdn_tmp = dwc2_readl(hsotg, GPWRDN);
   694		gpwrdn_tmp &= ~GPWRDN_PWRDNCLMP;
   695		dwc2_writel(hsotg, gpwrdn_tmp, GPWRDN);
   696		udelay(5);
   697	
   698		/* Deassert reset core */
   699		gpwrdn_tmp = dwc2_readl(hsotg, GPWRDN);
   700		gpwrdn_tmp |= GPWRDN_PWRDNRSTN;
   701		dwc2_writel(hsotg, gpwrdn_tmp, GPWRDN);
   702		udelay(5);
   703	
   704		/* Disable PMU interrupt */
   705		gpwrdn_tmp = dwc2_readl(hsotg, GPWRDN);
   706		gpwrdn_tmp &= ~GPWRDN_PMUINTSEL;
   707		dwc2_writel(hsotg, gpwrdn_tmp, GPWRDN);
   708	
   709		/* De-assert Wakeup Logic */
   710		gpwrdn_tmp = dwc2_readl(hsotg, GPWRDN);
   711		gpwrdn_tmp &= ~GPWRDN_PMUACTV;
   712		dwc2_writel(hsotg, gpwrdn_tmp, GPWRDN);
   713	
   714		hsotg->hibernated = 0;
 > 715		hsotg->bus_suspended = 0;
   716	
   717		if (gpwrdn & GPWRDN_IDSTS) {
   718			hsotg->op_state = OTG_STATE_B_PERIPHERAL;
   719			dwc2_core_init(hsotg, false);
   720			dwc2_enable_global_interrupts(hsotg);
   721			dwc2_hsotg_core_init_disconnected(hsotg, false);
   722			dwc2_hsotg_core_connect(hsotg);
   723		} else {
   724			hsotg->op_state = OTG_STATE_A_HOST;
   725	
   726			/* Initialize the Core for Host mode */
   727			dwc2_core_init(hsotg, false);
   728			dwc2_enable_global_interrupts(hsotg);
   729			dwc2_hcd_start(hsotg);
   730		}
   731	}
   732	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
