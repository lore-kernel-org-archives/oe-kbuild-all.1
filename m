Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9545A3BB20
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 21:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OUa4TP6I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700862889; x=1732398889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RCLlAAkK8xLFZtJ3rC5RwzZPFjiKIM7ie76yTi8ZTw4=;
  b=OUa4TP6I3WnuBwav1sLP1XKpArlSiVnJUto+QsKyjGC0QIEHVENkzRmj
   Gd5wR4wankNg7wxi8WlAjx2qnNiMqnEZ6OHi1GdUgD4y/c92jTHzKIrxW
   LBRZZj/6OabqhIufFenLn01rW9WL7aPsSS4DlxqbWd/nMk1iyQguo15dc
   X5+A6SuISnQbc90G9UtWRffugTeJvSvcDcLl34mYVQvDgKNsPw+3EhgtA
   wPYsbJiu15GfrGeIraYXxYEaQJz3ovTRWVBWLGqfHEIw1Jtyfza8NG4oL
   /86IQ6UzODUTFVtqXgIHhYGBPZyQh45xQ1aipU6f1MchSE6IPaRQklT9F
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="372631391"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="372631391"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 13:54:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="1099198244"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="1099198244"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 Nov 2023 13:54:47 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6e8L-0003JS-0l;
	Fri, 24 Nov 2023 21:54:45 +0000
Date: Sat, 25 Nov 2023 05:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mnyman-xhci:fix_urb_enqueue_locking 1/3]
 drivers/usb/fotg210/fotg210-hcd.c:5517:35: error: initialization of 'void
 (*)(struct usb_hcd *, struct usb_device *, struct usb_host_endpoint *)' from
 incompatible pointer type 'void (*)(struct usb_hcd *, struct
 usb_host_endpoint *)'
Message-ID: <202311250313.fIZ7NH2d-lkp@intel.com>
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
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20231125/202311250313.fIZ7NH2d-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311250313.fIZ7NH2d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250313.fIZ7NH2d-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/fotg210/fotg210-hcd.c:5517:35: error: initialization of 'void (*)(struct usb_hcd *, struct usb_device *, struct usb_host_endpoint *)' from incompatible pointer type 'void (*)(struct usb_hcd *, struct usb_host_endpoint *)' [-Werror=incompatible-pointer-types]
    5517 |         .endpoint_reset         = fotg210_endpoint_reset,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/fotg210/fotg210-hcd.c:5517:35: note: (near initialization for 'fotg210_fotg210_hc_driver.endpoint_reset')
   cc1: some warnings being treated as errors


vim +5517 drivers/usb/fotg210/fotg210-hcd.c

7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5485  
259127ba78d0f2 drivers/usb/host/fotg210-hcd.c Peter Senna Tschudin 2015-10-12  5486  /* The EHCI in ChipIdea HDRC cannot be a separate module or device,
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5487   * because its registers (and irq) are shared between host/gadget/otg
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5488   * functions  and in order to facilitate role switching we cannot
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5489   * give the fotg210 driver exclusive access to those.
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5490   */
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5491  
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5492  static const struct hc_driver fotg210_fotg210_hc_driver = {
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5493  	.description		= hcd_name,
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5494  	.product_desc		= "Faraday USB2.0 Host Controller",
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5495  	.hcd_priv_size		= sizeof(struct fotg210_hcd),
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5496  
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5497  	/*
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5498  	 * generic hardware linkage
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5499  	 */
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5500  	.irq			= fotg210_irq,
7b81cb6bddd2c4 drivers/usb/host/fotg210-hcd.c Christoph Hellwig    2019-08-16  5501  	.flags			= HCD_MEMORY | HCD_DMA | HCD_USB2,
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5502  
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5503  	/*
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5504  	 * basic lifecycle operations
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5505  	 */
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5506  	.reset			= hcd_fotg210_init,
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5507  	.start			= fotg210_run,
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5508  	.stop			= fotg210_stop,
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5509  	.shutdown		= fotg210_shutdown,
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5510  
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5511  	/*
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5512  	 * managing i/o requests and associated device resources
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5513  	 */
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5514  	.urb_enqueue		= fotg210_urb_enqueue,
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5515  	.urb_dequeue		= fotg210_urb_dequeue,
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5516  	.endpoint_disable	= fotg210_endpoint_disable,
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29 @5517  	.endpoint_reset		= fotg210_endpoint_reset,
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5518  
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5519  	/*
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5520  	 * scheduling support
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5521  	 */
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5522  	.get_frame_number	= fotg210_get_frame,
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5523  
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5524  	/*
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5525  	 * root hub support
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5526  	 */
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5527  	.hub_status_data	= fotg210_hub_status_data,
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5528  	.hub_control		= fotg210_hub_control,
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5529  	.bus_suspend		= fotg210_bus_suspend,
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5530  	.bus_resume		= fotg210_bus_resume,
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5531  
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5532  	.relinquish_port	= fotg210_relinquish_port,
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5533  	.port_handed_over	= fotg210_port_handed_over,
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5534  
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5535  	.clear_tt_buffer_complete = fotg210_clear_tt_buffer_complete,
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5536  };
7d50195f6c5005 drivers/usb/host/fotg210-hcd.c Feng-Hsin Chiang     2013-07-29  5537  

:::::: The code at line 5517 was first introduced by commit
:::::: 7d50195f6c5005d6ae7a789d9a7f0a94d104ee96 usb: host: Faraday fotg210-hcd driver

:::::: TO: Feng-Hsin Chiang <john453@faraday-tech.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
