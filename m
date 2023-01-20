Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC5620FE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 13:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674221344; x=1705757344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zWJtsk3gS+T2zQGMl/vf87nl5aThZsvExaoOyVZg2F0=;
  b=RIKvU8MTkHuxwGCir7AKOOaQDIfREDkLS9M71+hXlQNu+AmNeMW+lTTt
   QU0GblOhIJShbCoh+MYTXLn2Urg/mhC7bdhe7knRAUYjuebQo0Z9jmMvZ
   PAbqIy+uiT5wXz0XS5xulVm9trZ54arhdoufIwomk586+b66Vj6NZdfGE
   gX9bt+u8i370aMK/J3M+vLgBv/Llz9DkTikaTY6xFY6FzA8+bTgctV30a
   ZoRCD0+IifhEgigdQ4N69VsAdVk1WNFf6R43sBzMixq4QzokW9RNr9Mtr
   u19G5ssDnQ2GFZCQg7op6lvpwunXoQJhy+EeWo8ZUPruGC2icIMWlOqgN
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="325614153"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="325614153"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 05:29:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="662541534"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="662541534"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jan 2023 05:29:02 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIrS1-0002aM-0c;
	Fri, 20 Jan 2023 13:29:01 +0000
Date: Fri, 20 Jan 2023 21:28:34 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Simek <monstr@monstr.eu>
Subject: [pinchartl-media:muxed/2022.2/base 670/740]
 drivers/usb/gadget/udc/udc-xilinx.c:502:25: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202301202157.K7SHN0ep-lkp@intel.com>
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
config: s390-randconfig-s041-20230119 (https://download.01.org/0day-ci/archive/20230120/202301202157.K7SHN0ep-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2022.2/base
        git checkout 59acbc300f7f442215a37478ac611aca8092eee3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 SHELL=/bin/bash drivers/usb/gadget/udc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/gadget/udc/udc-xilinx.c:502:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got unsigned int [usertype] *[assigned] eprambase @@
   drivers/usb/gadget/udc/udc-xilinx.c:502:25: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/usb/gadget/udc/udc-xilinx.c:502:25: sparse:     got unsigned int [usertype] *[assigned] eprambase
>> drivers/usb/gadget/udc/udc-xilinx.c:506:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got unsigned char [usertype] *bufferptr @@
   drivers/usb/gadget/udc/udc-xilinx.c:506:25: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/usb/gadget/udc/udc-xilinx.c:506:25: sparse:     got unsigned char [usertype] *bufferptr
   drivers/usb/gadget/udc/udc-xilinx.c:520:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got unsigned int [usertype] *[assigned] eprambase @@
   drivers/usb/gadget/udc/udc-xilinx.c:520:25: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/usb/gadget/udc/udc-xilinx.c:520:25: sparse:     got unsigned int [usertype] *[assigned] eprambase
   drivers/usb/gadget/udc/udc-xilinx.c:524:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got unsigned char [usertype] *bufferptr @@
   drivers/usb/gadget/udc/udc-xilinx.c:524:25: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/usb/gadget/udc/udc-xilinx.c:524:25: sparse:     got unsigned char [usertype] *bufferptr
>> drivers/usb/gadget/udc/udc-xilinx.c:1026:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got unsigned char [usertype] *[assigned] corebuf @@
   drivers/usb/gadget/udc/udc-xilinx.c:1026:17: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/usb/gadget/udc/udc-xilinx.c:1026:17: sparse:     got unsigned char [usertype] *[assigned] corebuf
   drivers/usb/gadget/udc/udc-xilinx.c:1617:35: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/udc-xilinx.c:1623:31: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/udc-xilinx.c:1638:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   drivers/usb/gadget/udc/udc-xilinx.c:1638:34: sparse:     expected unsigned short [usertype]
   drivers/usb/gadget/udc/udc-xilinx.c:1638:34: sparse:     got restricted __le16 [usertype]
   drivers/usb/gadget/udc/udc-xilinx.c:1666:35: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/udc-xilinx.c:1666:35: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/udc-xilinx.c:1686:46: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/udc-xilinx.c:1692:46: sparse: sparse: restricted __le16 degrades to integer
>> drivers/usb/gadget/udc/udc-xilinx.c:1752:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got struct usb_ctrlrequest * @@
   drivers/usb/gadget/udc/udc-xilinx.c:1752:9: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/usb/gadget/udc/udc-xilinx.c:1752:9: sparse:     got struct usb_ctrlrequest *
   drivers/usb/gadget/udc/udc-xilinx.c:1755:29: sparse: sparse: cast from restricted __le16
   drivers/usb/gadget/udc/udc-xilinx.c:1756:29: sparse: sparse: cast from restricted __le16
   drivers/usb/gadget/udc/udc-xilinx.c:1757:30: sparse: sparse: cast from restricted __le16
>> drivers/usb/gadget/udc/udc-xilinx.c:1839:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got void *[assigned] buffer @@
   drivers/usb/gadget/udc/udc-xilinx.c:1839:17: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/usb/gadget/udc/udc-xilinx.c:1839:17: sparse:     got void *[assigned] buffer
   drivers/usb/gadget/udc/udc-xilinx.c:1869:34: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/udc-xilinx.c:1880:49: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] @@     got restricted __le16 [usertype] wValue @@
   drivers/usb/gadget/udc/udc-xilinx.c:1880:49: sparse:     expected unsigned int [usertype]
   drivers/usb/gadget/udc/udc-xilinx.c:1880:49: sparse:     got restricted __le16 [usertype] wValue
   drivers/usb/gadget/udc/udc-xilinx.c:1885:47: sparse: sparse: restricted __le16 degrades to integer
>> drivers/usb/gadget/udc/udc-xilinx.c:1915:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got unsigned char [usertype] *[assigned] ep0rambase @@
   drivers/usb/gadget/udc/udc-xilinx.c:1915:25: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/usb/gadget/udc/udc-xilinx.c:1915:25: sparse:     got unsigned char [usertype] *[assigned] ep0rambase

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
