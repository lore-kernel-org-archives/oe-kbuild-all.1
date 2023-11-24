Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366D43C088
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 21:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vb+VgLhm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700862892; x=1732398892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s1ff4gpSnmfFIpFrX5i8UKyrPMR0vdTqHdNu6InzNUY=;
  b=Vb+VgLhmcL3icB7r2q42/PPK2Y1ZOrwFtoGwmrrOws5a3hViFRONrSqH
   Gs2QRPoRyP64nO2Hu4HG2q90VE1Y156IkP63uqsa//PkLSgIGvfyqYkDb
   /4yC1S1Oarq3371G1vL4OPo9YUwXz+TzaLZARuQ2gQaPLxjodgwhu2xQh
   z+ba59vaQlw1CEvQhhaei/1tv8GnLhVDRfpEZ75PNZhottcbXQh8P17Ik
   cUvkA93MdLKdl2Xq07lNJEwEuGVi09s2ZMIVHvAoowEPVkEvpu9+PAgPz
   Ih9wZM7HR4wtYv6kJ+AL++kUoJIeEVa5nqBz+u/QaXjOsVQq2xmrBy9YV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="391344083"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="391344083"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 13:54:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="802229621"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="802229621"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Nov 2023 13:54:50 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6e8O-0003Jh-0W;
	Fri, 24 Nov 2023 21:54:48 +0000
Date: Sat, 25 Nov 2023 05:54:22 +0800
From: kernel test robot <lkp@intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mnyman-xhci:fix_urb_enqueue_locking 1/3]
 drivers/usb/dwc2/hcd.c:4999:27: error: initialization of 'void (*)(struct
 usb_hcd *, struct usb_device *, struct usb_host_endpoint *)' from
 incompatible pointer type 'void (*)(struct usb_hcd *, struct
 usb_host_endpoint *)'
Message-ID: <202311250326.LWU6uk7Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_urb_enqueue_locking
head:   7a8761d5c3f3e2e8a361eab4cb7da61baf8bf171
commit: a8aa65cdd65624ba48f9d2a99ffb06844e86e2a1 [1/3] usb: pass usb device structure as parameter to reset endpoint callback
config: x86_64-randconfig-161-20231125 (https://download.01.org/0day-ci/archive/20231125/202311250326.LWU6uk7Y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311250326.LWU6uk7Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250326.LWU6uk7Y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/dwc2/hcd.c:4999:27: error: initialization of 'void (*)(struct usb_hcd *, struct usb_device *, struct usb_host_endpoint *)' from incompatible pointer type 'void (*)(struct usb_hcd *, struct usb_host_endpoint *)' [-Werror=incompatible-pointer-types]
    4999 |         .endpoint_reset = _dwc2_hcd_endpoint_reset,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc2/hcd.c:4999:27: note: (near initialization for 'dwc2_hc_driver.endpoint_reset')
   cc1: some warnings being treated as errors


vim +4999 drivers/usb/dwc2/hcd.c

ca8b03324877e1 drivers/usb/dwc2/hcd.c     Chen Yu          2017-01-23  4985  
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4986  static struct hc_driver dwc2_hc_driver = {
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4987  	.description = "dwc2_hsotg",
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4988  	.product_desc = "DWC OTG Controller",
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4989  	.hcd_priv_size = sizeof(struct wrapper_priv_data),
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4990  
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4991  	.irq = _dwc2_hcd_irq,
8add17cf8e4c55 drivers/usb/dwc2/hcd.c     Douglas Anderson 2016-01-28  4992  	.flags = HCD_MEMORY | HCD_USB2 | HCD_BH,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4993  
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4994  	.start = _dwc2_hcd_start,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4995  	.stop = _dwc2_hcd_stop,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4996  	.urb_enqueue = _dwc2_hcd_urb_enqueue,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4997  	.urb_dequeue = _dwc2_hcd_urb_dequeue,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4998  	.endpoint_disable = _dwc2_hcd_endpoint_disable,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11 @4999  	.endpoint_reset = _dwc2_hcd_endpoint_reset,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5000  	.get_frame_number = _dwc2_hcd_get_frame_number,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5001  
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5002  	.hub_status_data = _dwc2_hcd_hub_status_data,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5003  	.hub_control = _dwc2_hcd_hub_control,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5004  	.clear_tt_buffer_complete = _dwc2_hcd_clear_tt_buffer_complete,
99a657983a1e03 drivers/usb/dwc2/hcd.c     Gregory Herrero  2015-04-29  5005  
99a657983a1e03 drivers/usb/dwc2/hcd.c     Gregory Herrero  2015-04-29  5006  	.bus_suspend = _dwc2_hcd_suspend,
99a657983a1e03 drivers/usb/dwc2/hcd.c     Gregory Herrero  2015-04-29  5007  	.bus_resume = _dwc2_hcd_resume,
3bc04e28a030a8 drivers/usb/dwc2/hcd.c     Douglas Anderson 2016-01-28  5008  
3bc04e28a030a8 drivers/usb/dwc2/hcd.c     Douglas Anderson 2016-01-28  5009  	.map_urb_for_dma	= dwc2_map_urb_for_dma,
3bc04e28a030a8 drivers/usb/dwc2/hcd.c     Douglas Anderson 2016-01-28  5010  	.unmap_urb_for_dma	= dwc2_unmap_urb_for_dma,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5011  };
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5012  

:::::: The code at line 4999 was first introduced by commit
:::::: 7359d482eb4d3967cc8be354405ae6be6eaf732c staging: HCD files for the DWC2 driver

:::::: TO: Paul Zimmerman <Paul.Zimmerman@synopsys.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
