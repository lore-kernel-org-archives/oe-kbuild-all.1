Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A0A3A257C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 16:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787071051; cv=none; b=BW/j8dmYS3g9O4XbOndq3BtLNNC2kOkX+dq829p9ai9jFlWQdH9h5Ep3GuJ1NG//QAh9oAPH5K/qz40FhHSkqz2mFBWWJiCgnyusfinVP3wEX27TwgwVZvM7Bng7xlQn5dEnpEuSmI1Fs9GQJzzMwSPeaNBDr9yD6Q0swyIJX7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787071051; c=relaxed/simple;
	bh=hpSzPxLbh06KNXaXsHoygzI2mxJwiHfJ8oCQwGd/7hk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kI4tt2oQmCzHLAWvjszplaM1PPNtI5dSoYBOitOz5CWGa5VQo/0Q5hNdSHBUsckXMLsC3si8AyTdpN/i9OlFVplVEEFLuITtnjtjUQe37LosllcnR5RzhsuCle2V2ua3gCHcdJ8HxrgIS5dyxsyd5lrl0/s6DZ+yKwnRDFCfXmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6jpatj8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6jpatj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787071044; x=1818607044;
  h=date:from:to:cc:subject:message-id;
  bh=hpSzPxLbh06KNXaXsHoygzI2mxJwiHfJ8oCQwGd/7hk=;
  b=l6jpatj8WlN4kg5lkEfNLiKHBL6c8pi+fZS4BAlbqNlQqW0kFWLtQVIr
   8QZUa1M4e0/0sDu3H4nqTX4TTQkE4DCfMaajjb0z4BUBI9Ll2LuEOYnxO
   h6awuMJZKOhfWd+XJq8H3E8VPtMkV90qOiMnEmrJPnLoYkTGMAz9DKnyK
   OLZLtTouIJy+3Fs5bfMJXWoiHbTbg9gZD2wI4sehRcpJkfcpV0LA2PsZh
   OAMX+rZcr5DUYiISjRb4/74hjDTjR5Ez46XJXwJGLWfVZoUJ/RRmrkor5
   8yskLqg3BzCcpMdDKKXFmwz2pxuX+2BJFpTC898yp64LrStRyd/R+eyIU
   w==;
X-CSE-ConnectionGUID: Iu4u4Cp8Sli5jynsRXIQ3Q==
X-CSE-MsgGUID: dzd9scKEQwWe0q3S/ZVKQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="98930594"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98930594"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 09:37:14 -0700
X-CSE-ConnectionGUID: AbYSFJ5eS6aoAMyeYJjLig==
X-CSE-MsgGUID: Wv5+92lXT/2OAlfbbYisLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="267255003"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Aug 2026 09:37:12 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwMoH-00000000eRQ-35TX;
	Tue, 18 Aug 2026 16:37:09 +0000
Date: Wed, 19 Aug 2026 00:36:28 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:headers 4/19]
 drivers/soc/xilinx/zynqmp_power.c:101:8: error: unknown type name
 'irqreturn_t'
Message-ID: <202608190039.XjU7uENJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/willy/pagecache headers
head:   032f02810150ef15c319b0ac8f82f7ca9760fe47
commit: ee8c3d1b21838865d98d47c06331c531fa5f426c [4/19] headers: Remove swap.h from suspend.h
config: arm64-randconfig-003-20260818 (https://download.01.org/0day-ci/archive/20260819/202608190039.XjU7uENJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608190039.XjU7uENJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608190039.XjU7uENJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/xilinx/zynqmp_power.c:101:8: error: unknown type name 'irqreturn_t'
    static irqreturn_t zynqmp_pm_isr(int irq, void *data)
           ^~~~~~~~~~~
   drivers/soc/xilinx/zynqmp_power.c: In function 'zynqmp_pm_isr':
>> drivers/soc/xilinx/zynqmp_power.c:124:9: error: 'IRQ_HANDLED' undeclared (first use in this function); did you mean 'EBADHANDLE'?
     return IRQ_HANDLED;
            ^~~~~~~~~~~
            EBADHANDLE
   drivers/soc/xilinx/zynqmp_power.c:124:9: note: each undeclared identifier is reported only once for each function it appears in
   drivers/soc/xilinx/zynqmp_power.c: In function 'zynqmp_pm_probe':
>> drivers/soc/xilinx/zynqmp_power.c:366:9: error: implicit declaration of function 'devm_request_threaded_irq'; did you mean 'devm_request_region'? [-Werror=implicit-function-declaration]
      ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
            ^~~~~~~~~~~~~~~~~~~~~~~~~
            devm_request_region
>> drivers/soc/xilinx/zynqmp_power.c:368:7: error: 'IRQF_NO_SUSPEND' undeclared (first use in this function); did you mean 'SUSPEND_SUSPEND'?
          IRQF_NO_SUSPEND | IRQF_ONESHOT,
          ^~~~~~~~~~~~~~~
          SUSPEND_SUSPEND
>> drivers/soc/xilinx/zynqmp_power.c:368:25: error: 'IRQF_ONESHOT' undeclared (first use in this function); did you mean 'SA_ONESHOT'?
          IRQF_NO_SUSPEND | IRQF_ONESHOT,
                            ^~~~~~~~~~~~
                            SA_ONESHOT
   cc1: some warnings being treated as errors


vim +/irqreturn_t +101 drivers/soc/xilinx/zynqmp_power.c

70602b37c4afd9 Abhyuday Godhasara      2021-11-28  100  
ab272643d723f5 Rajan Vaja              2019-01-29 @101  static irqreturn_t zynqmp_pm_isr(int irq, void *data)
ab272643d723f5 Rajan Vaja              2019-01-29  102  {
ab272643d723f5 Rajan Vaja              2019-01-29  103  	u32 payload[CB_PAYLOAD_SIZE];
ab272643d723f5 Rajan Vaja              2019-01-29  104  
ab272643d723f5 Rajan Vaja              2019-01-29  105  	zynqmp_pm_get_callback_data(payload);
ab272643d723f5 Rajan Vaja              2019-01-29  106  
ab272643d723f5 Rajan Vaja              2019-01-29  107  	/* First element is callback API ID, others are callback arguments */
ab272643d723f5 Rajan Vaja              2019-01-29  108  	if (payload[0] == PM_INIT_SUSPEND_CB) {
ab272643d723f5 Rajan Vaja              2019-01-29  109  		switch (payload[1]) {
ab272643d723f5 Rajan Vaja              2019-01-29  110  		case SUSPEND_SYSTEM_SHUTDOWN:
ab272643d723f5 Rajan Vaja              2019-01-29  111  			orderly_poweroff(true);
ab272643d723f5 Rajan Vaja              2019-01-29  112  			break;
ab272643d723f5 Rajan Vaja              2019-01-29  113  		case SUSPEND_POWER_REQUEST:
ab272643d723f5 Rajan Vaja              2019-01-29  114  			pm_suspend(PM_SUSPEND_MEM);
ab272643d723f5 Rajan Vaja              2019-01-29  115  			break;
ab272643d723f5 Rajan Vaja              2019-01-29  116  		default:
4c0afac2dfa1e1 Michal Simek            2023-10-27  117  			pr_err("%s Unsupported InitSuspendCb reason code %d\n",
4c0afac2dfa1e1 Michal Simek            2023-10-27  118  			       __func__, payload[1]);
ab272643d723f5 Rajan Vaja              2019-01-29  119  		}
87fda1acfc3b90 Naman Trivedi Manojbhai 2023-12-07  120  	} else {
87fda1acfc3b90 Naman Trivedi Manojbhai 2023-12-07  121  		pr_err("%s() Unsupported Callback %d\n", __func__, payload[0]);
ab272643d723f5 Rajan Vaja              2019-01-29  122  	}
ab272643d723f5 Rajan Vaja              2019-01-29  123  
ab272643d723f5 Rajan Vaja              2019-01-29 @124  	return IRQ_HANDLED;
ab272643d723f5 Rajan Vaja              2019-01-29  125  }
ab272643d723f5 Rajan Vaja              2019-01-29  126  

:::::: The code at line 101 was first introduced by commit
:::::: ab272643d723f531b9caa8a4ac5f85fcd26840d2 drivers: soc: xilinx: Add ZynqMP PM driver

:::::: TO: Rajan Vaja <rajan.vaja@xilinx.com>
:::::: CC: Michal Simek <michal.simek@xilinx.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
