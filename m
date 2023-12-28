Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08306101C1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Dec 2023 19:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1KB6/Qv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703791038; x=1735327038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7GApJKJvgZsb78+iae7S69nm805ONVYLb+GkLI884nw=;
  b=Y1KB6/QvoWLXFTfHKZ6DbACNOrLHGFU5K36y+0wcszOfsfccQ1e/3Zgv
   mem5KJ0a3fS3ao2TdUsb1YvAamaPmz7RTHf7HdDLFE/FU7nwgRL30BGY1
   7R4G82pB0wm80831TA9B/K8arMMeHWS+aRWgltpMHT/ZIE0J6S5KQ1C02
   /OBN7UAWEgdkNgj5kdvpW1tpKL44jKsZU2x71/YCt1iLw8YA2N2bcw1IZ
   ubrRHhG5xwqaXHYvMepqQv1JUAZEAjk1/hojPAfNLB8bMlGjOeMoqH5Tp
   rfX8nX6DpbVgBWIYo+hSVh7Fq9oWpT40zRyX5lsW8JIHOEXe3zpRVZ6CV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="376063919"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; 
   d="scan'208";a="376063919"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 11:17:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; 
   d="scan'208";a="26929061"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Dec 2023 11:17:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIvsS-000GlB-2s;
	Thu, 28 Dec 2023 19:17:08 +0000
Date: Fri, 29 Dec 2023 03:17:02 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Simek <monstr@monstr.eu>
Subject: [pinchartl-media:muxed/2022.2/base 670/740]
 drivers/usb/gadget/udc/udc-xilinx.c:502:37: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202312290344.OuvJ3Gcz-lkp@intel.com>
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
config: openrisc-randconfig-r123-20231225 (https://download.01.org/0day-ci/archive/20231229/202312290344.OuvJ3Gcz-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231229/202312290344.OuvJ3Gcz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312290344.OuvJ3Gcz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/gadget/udc/udc-xilinx.c:502:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *[assigned] eprambase @@
   drivers/usb/gadget/udc/udc-xilinx.c:502:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/gadget/udc/udc-xilinx.c:502:37: sparse:     got unsigned int [usertype] *[assigned] eprambase
>> drivers/usb/gadget/udc/udc-xilinx.c:506:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] *bufferptr @@
   drivers/usb/gadget/udc/udc-xilinx.c:506:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/gadget/udc/udc-xilinx.c:506:37: sparse:     got unsigned char [usertype] *bufferptr
   drivers/usb/gadget/udc/udc-xilinx.c:520:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *[assigned] eprambase @@
   drivers/usb/gadget/udc/udc-xilinx.c:520:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/gadget/udc/udc-xilinx.c:520:37: sparse:     got unsigned int [usertype] *[assigned] eprambase
   drivers/usb/gadget/udc/udc-xilinx.c:524:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] *bufferptr @@
   drivers/usb/gadget/udc/udc-xilinx.c:524:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/gadget/udc/udc-xilinx.c:524:37: sparse:     got unsigned char [usertype] *bufferptr
>> drivers/usb/gadget/udc/udc-xilinx.c:1026:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] *[assigned] corebuf @@
   drivers/usb/gadget/udc/udc-xilinx.c:1026:29: sparse:     expected void volatile [noderef] __iomem *addr
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
>> drivers/usb/gadget/udc/udc-xilinx.c:1752:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got struct usb_ctrlrequest * @@
   drivers/usb/gadget/udc/udc-xilinx.c:1752:22: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/gadget/udc/udc-xilinx.c:1752:22: sparse:     got struct usb_ctrlrequest *
   drivers/usb/gadget/udc/udc-xilinx.c:1755:29: sparse: sparse: cast from restricted __le16
   drivers/usb/gadget/udc/udc-xilinx.c:1755:29: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [addressable] [usertype] wValue @@
   drivers/usb/gadget/udc/udc-xilinx.c:1755:29: sparse:     expected unsigned short [usertype] val
   drivers/usb/gadget/udc/udc-xilinx.c:1755:29: sparse:     got restricted __le16 [addressable] [usertype] wValue
   drivers/usb/gadget/udc/udc-xilinx.c:1755:29: sparse: sparse: cast from restricted __le16
   drivers/usb/gadget/udc/udc-xilinx.c:1755:29: sparse: sparse: cast from restricted __le16
   drivers/usb/gadget/udc/udc-xilinx.c:1756:29: sparse: sparse: cast from restricted __le16
   drivers/usb/gadget/udc/udc-xilinx.c:1756:29: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [addressable] [usertype] wIndex @@
   drivers/usb/gadget/udc/udc-xilinx.c:1756:29: sparse:     expected unsigned short [usertype] val
   drivers/usb/gadget/udc/udc-xilinx.c:1756:29: sparse:     got restricted __le16 [addressable] [usertype] wIndex
   drivers/usb/gadget/udc/udc-xilinx.c:1756:29: sparse: sparse: cast from restricted __le16
   drivers/usb/gadget/udc/udc-xilinx.c:1756:29: sparse: sparse: cast from restricted __le16
   drivers/usb/gadget/udc/udc-xilinx.c:1757:30: sparse: sparse: cast from restricted __le16
   drivers/usb/gadget/udc/udc-xilinx.c:1757:30: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [addressable] [usertype] wLength @@
   drivers/usb/gadget/udc/udc-xilinx.c:1757:30: sparse:     expected unsigned short [usertype] val
   drivers/usb/gadget/udc/udc-xilinx.c:1757:30: sparse:     got restricted __le16 [addressable] [usertype] wLength
   drivers/usb/gadget/udc/udc-xilinx.c:1757:30: sparse: sparse: cast from restricted __le16
   drivers/usb/gadget/udc/udc-xilinx.c:1757:30: sparse: sparse: cast from restricted __le16
>> drivers/usb/gadget/udc/udc-xilinx.c:1839:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[assigned] buffer @@
   drivers/usb/gadget/udc/udc-xilinx.c:1839:29: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/gadget/udc/udc-xilinx.c:1839:29: sparse:     got void *[assigned] buffer
   drivers/usb/gadget/udc/udc-xilinx.c:1869:34: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/udc-xilinx.c:1880:49: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] @@     got restricted __le16 [usertype] wValue @@
   drivers/usb/gadget/udc/udc-xilinx.c:1880:49: sparse:     expected unsigned int [usertype]
   drivers/usb/gadget/udc/udc-xilinx.c:1880:49: sparse:     got restricted __le16 [usertype] wValue
   drivers/usb/gadget/udc/udc-xilinx.c:1885:47: sparse: sparse: restricted __le16 degrades to integer
>> drivers/usb/gadget/udc/udc-xilinx.c:1915:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] *[assigned] ep0rambase @@
   drivers/usb/gadget/udc/udc-xilinx.c:1915:37: sparse:     expected void volatile [noderef] __iomem *addr
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
https://github.com/intel/lkp-tests/wiki
