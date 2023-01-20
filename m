Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4CA20FE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 12:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674218907; x=1705754907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0MLiPhxVxets6x6vhMskl3WBTbzU74WPrypwTq2PBbo=;
  b=a78Lea34o7CCw6pDQ01qN2F8h6cH6PlaTfN02tnLJJQazDcoJ8CF2lcb
   JzlBJa5dS2dhTxfiqho0oqgTmGBjJ27DUbC3zpqs2bV+jBsyuirDTJyLh
   CNdULr35kF+SSiT7Vkr6m8Thk5MOZElCg4zyUPkhxHVoj/wiHYeFpJThi
   sgoYVzvuJkTrq/v3q7980mmfM/98VO9MANWwmxBydOMLWthPtADON+zy6
   DcjjLu1sWviup0QhDcFp5aFWSkOCcHH0EC9V4SCyHmcPIkhNIz6DMJtWI
   drMyQ3bKaqC+f2z0yYWKAcYl/u4M+/xQBLfmakGkAezmnnZEeSh/9k3yr
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="324254046"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="324254046"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 04:48:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="834398866"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="834398866"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Jan 2023 04:48:00 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIqoK-0002Yu-0H;
	Fri, 20 Jan 2023 12:48:00 +0000
Date: Fri, 20 Jan 2023 20:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Simek <monstr@monstr.eu>
Subject: [pinchartl-media:muxed/2022.2/base 670/740]
 drivers/usb/gadget/udc/udc-xilinx.c:502:37: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202301202055.8ju3nTtq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Piyush,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   git://linuxtv.org/pinchartl/media.git muxed/2022.2/base
head:   e26621179c3b1834a1bb17e9a38e47238ac63bf5
commit: 59acbc300f7f442215a37478ac611aca8092eee3 [670/740] usb: gadget: udc-xilinx: fix compilation error
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20230120/202301202055.8ju3nTtq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2022.2/base
        git checkout 59acbc300f7f442215a37478ac611aca8092eee3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/usb/gadget/udc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/gadget/udc/udc-xilinx.c:502:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned int [usertype] *[assigned] eprambase @@
   drivers/usb/gadget/udc/udc-xilinx.c:502:37: sparse:     expected void volatile [noderef] __iomem *
   drivers/usb/gadget/udc/udc-xilinx.c:502:37: sparse:     got unsigned int [usertype] *[assigned] eprambase
>> drivers/usb/gadget/udc/udc-xilinx.c:506:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char [usertype] *bufferptr @@
   drivers/usb/gadget/udc/udc-xilinx.c:506:37: sparse:     expected void volatile [noderef] __iomem *
   drivers/usb/gadget/udc/udc-xilinx.c:506:37: sparse:     got unsigned char [usertype] *bufferptr
   drivers/usb/gadget/udc/udc-xilinx.c:520:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned int [usertype] *[assigned] eprambase @@
   drivers/usb/gadget/udc/udc-xilinx.c:520:37: sparse:     expected void volatile [noderef] __iomem *
   drivers/usb/gadget/udc/udc-xilinx.c:520:37: sparse:     got unsigned int [usertype] *[assigned] eprambase
   drivers/usb/gadget/udc/udc-xilinx.c:524:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char [usertype] *bufferptr @@
   drivers/usb/gadget/udc/udc-xilinx.c:524:37: sparse:     expected void volatile [noderef] __iomem *
   drivers/usb/gadget/udc/udc-xilinx.c:524:37: sparse:     got unsigned char [usertype] *bufferptr
>> drivers/usb/gadget/udc/udc-xilinx.c:1026:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char [usertype] *[assigned] corebuf @@
   drivers/usb/gadget/udc/udc-xilinx.c:1026:29: sparse:     expected void volatile [noderef] __iomem *
   drivers/usb/gadget/udc/udc-xilinx.c:1026:29: sparse:     got unsigned char [usertype] *[assigned] corebuf
   drivers/usb/gadget/udc/udc-xilinx.c:1617:35: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/udc-xilinx.c:1623:31: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/udc-xilinx.c:1638:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   drivers/usb/gadget/udc/udc-xilinx.c:1638:34: sparse:     expected unsigned short [usertype]
   drivers/usb/gadget/udc/udc-xilinx.c:1638:34: sparse:     got restricted __le16 [usertype]
   drivers/usb/gadget/udc/udc-xilinx.c:1666:35: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/udc-xilinx.c:1666:35: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/udc-xilinx.c:1686:46: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/udc-xilinx.c:1692:46: sparse: sparse: restricted __le16 degrades to integer
>> drivers/usb/gadget/udc/udc-xilinx.c:1752:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got struct usb_ctrlrequest * @@
   drivers/usb/gadget/udc/udc-xilinx.c:1752:22: sparse:     expected void volatile [noderef] __iomem *
   drivers/usb/gadget/udc/udc-xilinx.c:1752:22: sparse:     got struct usb_ctrlrequest *
   drivers/usb/gadget/udc/udc-xilinx.c:1755:29: sparse: sparse: cast from restricted __le16
   drivers/usb/gadget/udc/udc-xilinx.c:1756:29: sparse: sparse: cast from restricted __le16
   drivers/usb/gadget/udc/udc-xilinx.c:1757:30: sparse: sparse: cast from restricted __le16
>> drivers/usb/gadget/udc/udc-xilinx.c:1839:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void *[assigned] buffer @@
   drivers/usb/gadget/udc/udc-xilinx.c:1839:29: sparse:     expected void volatile [noderef] __iomem *
   drivers/usb/gadget/udc/udc-xilinx.c:1839:29: sparse:     got void *[assigned] buffer
   drivers/usb/gadget/udc/udc-xilinx.c:1869:34: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/udc-xilinx.c:1880:49: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] @@     got restricted __le16 [usertype] wValue @@
   drivers/usb/gadget/udc/udc-xilinx.c:1880:49: sparse:     expected unsigned int [usertype]
   drivers/usb/gadget/udc/udc-xilinx.c:1880:49: sparse:     got restricted __le16 [usertype] wValue
   drivers/usb/gadget/udc/udc-xilinx.c:1885:47: sparse: sparse: restricted __le16 degrades to integer
>> drivers/usb/gadget/udc/udc-xilinx.c:1915:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char [usertype] *[assigned] ep0rambase @@
   drivers/usb/gadget/udc/udc-xilinx.c:1915:37: sparse:     expected void volatile [noderef] __iomem *
   drivers/usb/gadget/udc/udc-xilinx.c:1915:37: sparse:     got unsigned char [usertype] *[assigned] ep0rambase

vim +502 drivers/usb/gadget/udc/udc-xilinx.c

   468	
   469	/**
   470	 * xudc_eptxrx - Transmits or receives data to or from an endpoint.
   471	 * @ep: pointer to the usb endpoint configuration structure.
   472	 * @req: pointer to the usb request structure.
   473	 * @bufferptr: pointer to buffer containing the data to be sent.
   474	 * @bufferlen: The number of data bytes to be sent.
   475	 *
   476	 * Return: 0 on success, -EAGAIN if no buffer is free.
   477	 *
   478	 * This function copies the transmit/receive data to/from the end point buffer
   479	 * and enables the buffer for transmission/reception.
   480	 */
   481	static int xudc_eptxrx(struct xusb_ep *ep, struct xusb_req *req,
   482			       u8 *bufferptr, u32 bufferlen)
   483	{
   484		u32 *eprambase;
   485		u32 bytestosend;
   486		int rc = 0;
   487		struct xusb_udc *udc = ep->udc;
   488	
   489		bytestosend = bufferlen;
   490		if (udc->dma_enabled) {
   491			if (ep->is_in)
   492				rc = xudc_dma_send(ep, req, bufferptr, bufferlen);
   493			else
   494				rc = xudc_dma_receive(ep, req, bufferptr, bufferlen);
   495			return rc;
   496		}
   497		/* Put the transmit buffer into the correct ping-pong buffer.*/
   498		if (!ep->curbufnum && !ep->buffer0ready) {
   499			/* Get the Buffer address and copy the transmit data.*/
   500			eprambase = (u32 __force *)(udc->addr + ep->rambase);
   501			if (ep->is_in) {
 > 502				memcpy_toio(eprambase, bufferptr, bytestosend);
   503				udc->write_fn(udc->addr, ep->offset +
   504					      XUSB_EP_BUF0COUNT_OFFSET, bufferlen);
   505			} else {
 > 506				memcpy_toio(bufferptr, eprambase, bytestosend);
   507			}
   508			/*
   509			 * Enable the buffer for transmission.
   510			 */
   511			udc->write_fn(udc->addr, XUSB_BUFFREADY_OFFSET,
   512				      1 << ep->epnumber);
   513			ep->buffer0ready = 1;
   514			ep->curbufnum = 1;
   515		} else if (ep->curbufnum && !ep->buffer1ready) {
   516			/* Get the Buffer address and copy the transmit data.*/
   517			eprambase = (u32 __force *)(udc->addr + ep->rambase +
   518				     ep->ep_usb.maxpacket);
   519			if (ep->is_in) {
   520				memcpy_toio(eprambase, bufferptr, bytestosend);
   521				udc->write_fn(udc->addr, ep->offset +
   522					      XUSB_EP_BUF1COUNT_OFFSET, bufferlen);
   523			} else {
   524				memcpy_toio(bufferptr, eprambase, bytestosend);
   525			}
   526			/*
   527			 * Enable the buffer for transmission.
   528			 */
   529			udc->write_fn(udc->addr, XUSB_BUFFREADY_OFFSET,
   530				      1 << (ep->epnumber + XUSB_STATUS_EP_BUFF2_SHIFT));
   531			ep->buffer1ready = 1;
   532			ep->curbufnum = 0;
   533		} else {
   534			/* None of the ping-pong buffers are ready currently */
   535			return -EAGAIN;
   536		}
   537		return rc;
   538	}
   539	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
