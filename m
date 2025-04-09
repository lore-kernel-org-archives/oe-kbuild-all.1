Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57011263C8A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Apr 2025 13:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204501; cv=none; b=ezPlQd1sgtrAA0t5WLaOKB4WnaMZzfrDrmTXBSRErFw0QauLmYgrRdmIZH7C87z2kwGAlJeVuuLstc+IBzIYCED93CcYjcu9JWsqfaHLhG0XI2qp/Z7p2CV8Ws4NW1U2lEW/0huAnf7dJyc26RGZK0Rvz7VVEEjS2Yjwpa9wwt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204501; c=relaxed/simple;
	bh=96i/LD9guZ6ayEeG3eF96xAb0R5SkChiMVSC04Q3xu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=udjKX6GzPLm9D+DXggtZNEnnTFaTTBMVEhHcbZTS2yxYZxfPoVZeM31rbzQk2u86Etu5pbkeLAcvbeqaWBOaXhpJVWKfNgLZCXtj74xoXrQqh5OzZ6601idf7gHhbxDrMbExlkgXz9irftK4E0dFss2E92+giwz83hY41cB7tJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccpXivEd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccpXivEd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744204499; x=1775740499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=96i/LD9guZ6ayEeG3eF96xAb0R5SkChiMVSC04Q3xu0=;
  b=ccpXivEda0Yx1X07FGVxZuF5p/H3dneBhPH89dH3iRyDlikELhZrD/TW
   PveomsN+uGMwlRe1BSVvXnjr5sCKu5KBAHALtc3Rlka//JaiL65G1YIPL
   qtq2KBPuWl+QTMPmKKf0zE75wzS71RfLxLF1E72OnlK8UsDIWv34DCnFD
   g4aX10lAwG/ZyNBRrDfzbRg5KZES2a7YuofPITRS09lCWkG+TixrldHQo
   yAV8DOMkrrw4CW/mPir9is2Roh3NMUMGJxqqvIfuyiC4Fe/1h+5ccOf5g
   mt0IjNJa7bM/BI4pPBmc0zJA4+H8gwh4GdM9vAQGXWCpAZ6DKBPFNgMMV
   Q==;
X-CSE-ConnectionGUID: G0i1a3R7SoSMOSYDWKnELw==
X-CSE-MsgGUID: N1frQZBBT1asqCGu2lVHpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45691599"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45691599"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 06:14:59 -0700
X-CSE-ConnectionGUID: IDfY7s5eQv6jLynSQWgzLw==
X-CSE-MsgGUID: ae2SGS1QQv2ouDEYD8Ixqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133457672"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 06:14:58 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2VGZ-0008sJ-2O;
	Wed, 09 Apr 2025 13:14:55 +0000
Date: Wed, 9 Apr 2025 21:14:06 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC RFT] usb: hcd: Add a usb_device argument to
 hc_driver.endpoint_reset()
Message-ID: <202504092040.O4SwfWYt-lkp@intel.com>
References: <20250408121817.6ae8defd@foxbook>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408121817.6ae8defd@foxbook>

Hi Michał,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.15-rc1 next-20250409]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micha-Pecio/usb-hcd-Add-a-usb_device-argument-to-hc_driver-endpoint_reset/20250408-182312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250408121817.6ae8defd%40foxbook
patch subject: [PATCH RFC RFT] usb: hcd: Add a usb_device argument to hc_driver.endpoint_reset()
config: csky-randconfig-002-20250409 (https://download.01.org/0day-ci/archive/20250409/202504092040.O4SwfWYt-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504092040.O4SwfWYt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504092040.O4SwfWYt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/dwc2/hcd.c:5004:27: error: initialization of 'void (*)(struct usb_hcd *, struct usb_device *, struct usb_host_endpoint *)' from incompatible pointer type 'void (*)(struct usb_hcd *, struct usb_host_endpoint *)' [-Wincompatible-pointer-types]
    5004 |         .endpoint_reset = _dwc2_hcd_endpoint_reset,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc2/hcd.c:5004:27: note: (near initialization for 'dwc2_hc_driver.endpoint_reset')
--
>> drivers/usb/fotg210/fotg210-hcd.c:5509:35: error: initialization of 'void (*)(struct usb_hcd *, struct usb_device *, struct usb_host_endpoint *)' from incompatible pointer type 'void (*)(struct usb_hcd *, struct usb_host_endpoint *)' [-Wincompatible-pointer-types]
    5509 |         .endpoint_reset         = fotg210_endpoint_reset,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/fotg210/fotg210-hcd.c:5509:35: note: (near initialization for 'fotg210_fotg210_hc_driver.endpoint_reset')


vim +5004 drivers/usb/dwc2/hcd.c

ca8b03324877e1 drivers/usb/dwc2/hcd.c     Chen Yu          2017-01-23  4990  
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4991  static struct hc_driver dwc2_hc_driver = {
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4992  	.description = "dwc2_hsotg",
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4993  	.product_desc = "DWC OTG Controller",
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4994  	.hcd_priv_size = sizeof(struct wrapper_priv_data),
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4995  
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4996  	.irq = _dwc2_hcd_irq,
8add17cf8e4c55 drivers/usb/dwc2/hcd.c     Douglas Anderson 2016-01-28  4997  	.flags = HCD_MEMORY | HCD_USB2 | HCD_BH,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4998  
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4999  	.start = _dwc2_hcd_start,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5000  	.stop = _dwc2_hcd_stop,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5001  	.urb_enqueue = _dwc2_hcd_urb_enqueue,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5002  	.urb_dequeue = _dwc2_hcd_urb_dequeue,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5003  	.endpoint_disable = _dwc2_hcd_endpoint_disable,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11 @5004  	.endpoint_reset = _dwc2_hcd_endpoint_reset,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5005  	.get_frame_number = _dwc2_hcd_get_frame_number,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5006  
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5007  	.hub_status_data = _dwc2_hcd_hub_status_data,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5008  	.hub_control = _dwc2_hcd_hub_control,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5009  	.clear_tt_buffer_complete = _dwc2_hcd_clear_tt_buffer_complete,
99a657983a1e03 drivers/usb/dwc2/hcd.c     Gregory Herrero  2015-04-29  5010  
99a657983a1e03 drivers/usb/dwc2/hcd.c     Gregory Herrero  2015-04-29  5011  	.bus_suspend = _dwc2_hcd_suspend,
99a657983a1e03 drivers/usb/dwc2/hcd.c     Gregory Herrero  2015-04-29  5012  	.bus_resume = _dwc2_hcd_resume,
3bc04e28a030a8 drivers/usb/dwc2/hcd.c     Douglas Anderson 2016-01-28  5013  
3bc04e28a030a8 drivers/usb/dwc2/hcd.c     Douglas Anderson 2016-01-28  5014  	.map_urb_for_dma	= dwc2_map_urb_for_dma,
3bc04e28a030a8 drivers/usb/dwc2/hcd.c     Douglas Anderson 2016-01-28  5015  	.unmap_urb_for_dma	= dwc2_unmap_urb_for_dma,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5016  };
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5017  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
