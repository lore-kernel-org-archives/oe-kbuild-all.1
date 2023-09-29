Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63801747B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 04:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695960012; x=1727496012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DhEP7CM96P03nNJhtz/jjVnnWWE+vFxYSQ8NofubhoM=;
  b=BPCRyZEdRqL21NDvmgJ8a53R0Fr5ooavs87FuvgBBZC/zuLClA//jPzK
   Q3EZdf+5BwHDI1inVGVdjToLcWT7xHwBSsQjEsCmm+N7d3tACGm+6TuHs
   SZhflemYdOzL/hNfFN74SmyDT3Vxm8xCpqiS0RJLFjiZQHszEcOasuDD2
   WEYUxOxJ88on6qPxm+H9OiikttaURTN6fUAzn+0injiJN3UfM6tKUZIBk
   v2G+zfU0vn4lzY08OJhy6huq+W3WdlHdrpnO/t0gTnXOBrUJlseJ0AIId
   GkqVTQSuzE+PzOj8j3qiXiQ4gmHYFJyFwRgRNZwGCK2bacLETZdtEBwCP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="382130907"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="382130907"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 21:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="749843219"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="749843219"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 28 Sep 2023 21:00:09 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm4ff-0002Rr-0U;
	Fri, 29 Sep 2023 04:00:07 +0000
Date: Fri, 29 Sep 2023 11:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 238/1370]
 drivers/usb/gadget/udc/udc-xilinx.c:502:37: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202309291100.KELE68LD-lkp@intel.com>
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

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 8ecb6029436c0ae23a5e66f6ba095fae4d489d64 [238/1370] usb: gadget: udc-xilinx: fix compilation error
config: i386-randconfig-062-20230929 (https://download.01.org/0day-ci/archive/20230929/202309291100.KELE68LD-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309291100.KELE68LD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291100.KELE68LD-lkp@intel.com/

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
   drivers/usb/gadget/udc/udc-xilinx.c:1620:35: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/udc-xilinx.c:1626:31: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/udc-xilinx.c:1641:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   drivers/usb/gadget/udc/udc-xilinx.c:1641:34: sparse:     expected unsigned short [usertype]
   drivers/usb/gadget/udc/udc-xilinx.c:1641:34: sparse:     got restricted __le16 [usertype]
   drivers/usb/gadget/udc/udc-xilinx.c:1669:35: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/udc-xilinx.c:1669:35: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/udc-xilinx.c:1689:46: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/udc-xilinx.c:1695:46: sparse: sparse: restricted __le16 degrades to integer
>> drivers/usb/gadget/udc/udc-xilinx.c:1755:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got struct usb_ctrlrequest * @@
   drivers/usb/gadget/udc/udc-xilinx.c:1755:22: sparse:     expected void volatile [noderef] __iomem *
   drivers/usb/gadget/udc/udc-xilinx.c:1755:22: sparse:     got struct usb_ctrlrequest *
   drivers/usb/gadget/udc/udc-xilinx.c:1758:29: sparse: sparse: cast from restricted __le16
   drivers/usb/gadget/udc/udc-xilinx.c:1759:29: sparse: sparse: cast from restricted __le16
   drivers/usb/gadget/udc/udc-xilinx.c:1760:30: sparse: sparse: cast from restricted __le16
>> drivers/usb/gadget/udc/udc-xilinx.c:1842:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void *[assigned] buffer @@
   drivers/usb/gadget/udc/udc-xilinx.c:1842:29: sparse:     expected void volatile [noderef] __iomem *
   drivers/usb/gadget/udc/udc-xilinx.c:1842:29: sparse:     got void *[assigned] buffer
   drivers/usb/gadget/udc/udc-xilinx.c:1872:34: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/udc-xilinx.c:1883:49: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] @@     got restricted __le16 [usertype] wValue @@
   drivers/usb/gadget/udc/udc-xilinx.c:1883:49: sparse:     expected unsigned int [usertype]
   drivers/usb/gadget/udc/udc-xilinx.c:1883:49: sparse:     got restricted __le16 [usertype] wValue
   drivers/usb/gadget/udc/udc-xilinx.c:1888:47: sparse: sparse: restricted __le16 degrades to integer
>> drivers/usb/gadget/udc/udc-xilinx.c:1918:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char [usertype] *[assigned] ep0rambase @@
   drivers/usb/gadget/udc/udc-xilinx.c:1918:37: sparse:     expected void volatile [noderef] __iomem *
   drivers/usb/gadget/udc/udc-xilinx.c:1918:37: sparse:     got unsigned char [usertype] *[assigned] ep0rambase

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
