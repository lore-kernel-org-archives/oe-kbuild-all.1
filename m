Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B552439843
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 23:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZixBq141"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697670637; x=1729206637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b8VJ5n9UD4w2IQp5EIwOQaCh+fiy8q+6NE9cSUXO8W4=;
  b=ZixBq1412QPFtq6CGmOVLL7CnSF3laxwoIIKs7EoDZQXqn3sOB0x2hMN
   qGSxw8KSr+E11LjuIXs9agdUjxRJAPvJ6DSX55098bSJvUEvtf2FcVwlf
   G/fi900Vw07xE5QBSXmlyxUFDeoWMPITyAsarHPMBEzqK+Exp93cBNZvB
   nzk0XjDz8XD0XNNSmXzK81gecBaTPkYSCR1VxpDmHFUAw74wh6JIO2mls
   aMgiUfe4tjSEY/QND1qqEKFa8c51Xn1DSyReG9w8dXTxzXyPu0Hzodbxy
   DTG3nNKt8sfD9VTtLTig1jgz2RQ2H5wCKl2CUW/dGxTWmkFEUhaUB+fXL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="365485272"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="365485272"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 16:10:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="786125786"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="786125786"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 18 Oct 2023 16:10:32 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtFgM-0001DQ-0A;
	Wed, 18 Oct 2023 23:10:30 +0000
Date: Thu, 19 Oct 2023 07:09:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 18399/29114]
 drivers/media/usb/cx231xx/cx231xx-dvb.c:224:49: warning: array subscript i
 is outside array bounds of 'struct usb_iso_packet_descriptor[0]'
Message-ID: <202310190758.yVF6T8g6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   8e02ba97da24649878c11c18a20e36128a029d16
commit: fed071635e828e2d67ec736d8857f803dacd68b4 [18399/29114] ANDROID: GKI: usb: move KABI_RESERVED up
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231019/202310190758.yVF6T8g6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190758.yVF6T8g6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190758.yVF6T8g6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/usb/cx231xx/cx231xx-dvb.c: In function 'dvb_isoc_copy':
>> drivers/media/usb/cx231xx/cx231xx-dvb.c:224:49: warning: array subscript i is outside array bounds of 'struct usb_iso_packet_descriptor[0]' [-Warray-bounds=]
     224 |                 int status = urb->iso_frame_desc[i].status;
         |                              ~~~~~~~~~~~~~~~~~~~^~~
   In file included from drivers/media/usb/cx231xx/cx231xx.h:19,
                    from drivers/media/usb/cx231xx/cx231xx-dvb.c:10:
   include/linux/usb.h:1617:42: note: while referencing 'iso_frame_desc'
    1617 |         struct usb_iso_packet_descriptor iso_frame_desc[0];
         |                                          ^~~~~~~~~~~~~~
   drivers/media/usb/cx231xx/cx231xx-dvb.c:228:48: warning: array subscript i is outside array bounds of 'struct usb_iso_packet_descriptor[0]' [-Warray-bounds=]
     228 |                         if (urb->iso_frame_desc[i].status != -EPROTO)
         |                             ~~~~~~~~~~~~~~~~~~~^~~
   include/linux/usb.h:1617:42: note: while referencing 'iso_frame_desc'
    1617 |         struct usb_iso_packet_descriptor iso_frame_desc[0];
         |                                          ^~~~~~~~~~~~~~
   drivers/media/usb/cx231xx/cx231xx-dvb.c:234:52: warning: array subscript i is outside array bounds of 'struct usb_iso_packet_descriptor[0]' [-Warray-bounds=]
     234 |                                 urb->iso_frame_desc[i].offset,
         |                                 ~~~~~~~~~~~~~~~~~~~^~~
   include/linux/usb.h:1617:42: note: while referencing 'iso_frame_desc'
    1617 |         struct usb_iso_packet_descriptor iso_frame_desc[0];
         |                                          ^~~~~~~~~~~~~~
   drivers/media/usb/cx231xx/cx231xx-dvb.c:235:52: warning: array subscript i is outside array bounds of 'struct usb_iso_packet_descriptor[0]' [-Warray-bounds=]
     235 |                                 urb->iso_frame_desc[i].actual_length);
         |                                 ~~~~~~~~~~~~~~~~~~~^~~
   include/linux/usb.h:1617:42: note: while referencing 'iso_frame_desc'
    1617 |         struct usb_iso_packet_descriptor iso_frame_desc[0];
         |                                          ^~~~~~~~~~~~~~
--
   drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c: In function 'ttusb_iso_irq':
>> drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:773:49: warning: array subscript i is outside array bounds of 'struct usb_iso_packet_descriptor[0]' [-Warray-bounds=]
     773 |                         d = &urb->iso_frame_desc[i];
         |                              ~~~~~~~~~~~~~~~~~~~^~~
   In file included from drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:13:
   include/linux/usb.h:1617:42: note: while referencing 'iso_frame_desc'
    1617 |         struct usb_iso_packet_descriptor iso_frame_desc[0];
         |                                          ^~~~~~~~~~~~~~
>> drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:773:49: warning: array subscript i is outside array bounds of 'struct usb_iso_packet_descriptor[0]' [-Warray-bounds=]
     773 |                         d = &urb->iso_frame_desc[i];
         |                              ~~~~~~~~~~~~~~~~~~~^~~
   include/linux/usb.h:1617:42: note: while referencing 'iso_frame_desc'
    1617 |         struct usb_iso_packet_descriptor iso_frame_desc[0];
         |                                          ^~~~~~~~~~~~~~
>> drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:773:49: warning: array subscript i is outside array bounds of 'struct usb_iso_packet_descriptor[0]' [-Warray-bounds=]
     773 |                         d = &urb->iso_frame_desc[i];
         |                              ~~~~~~~~~~~~~~~~~~~^~~
   include/linux/usb.h:1617:42: note: while referencing 'iso_frame_desc'
    1617 |         struct usb_iso_packet_descriptor iso_frame_desc[0];
         |                                          ^~~~~~~~~~~~~~
>> drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:773:49: warning: array subscript i is outside array bounds of 'struct usb_iso_packet_descriptor[0]' [-Warray-bounds=]
     773 |                         d = &urb->iso_frame_desc[i];
         |                              ~~~~~~~~~~~~~~~~~~~^~~
   include/linux/usb.h:1617:42: note: while referencing 'iso_frame_desc'
    1617 |         struct usb_iso_packet_descriptor iso_frame_desc[0];
         |                                          ^~~~~~~~~~~~~~
   In function 'ttusb_start_iso_xfer',
       inlined from 'ttusb_start_feed' at drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:936:3:
>> drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:858:44: warning: array subscript 0 is outside array bounds of 'struct usb_iso_packet_descriptor[0]' [-Warray-bounds=]
     858 |                         urb->iso_frame_desc[j].offset = frame_offset;
         |                         ~~~~~~~~~~~~~~~~~~~^~~
   include/linux/usb.h: In function 'ttusb_start_feed':
   include/linux/usb.h:1617:42: note: while referencing 'iso_frame_desc'
    1617 |         struct usb_iso_packet_descriptor iso_frame_desc[0];
         |                                          ^~~~~~~~~~~~~~
   In function 'ttusb_start_iso_xfer',
       inlined from 'ttusb_start_feed' at drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:936:3:
   drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:859:44: warning: array subscript 0 is outside array bounds of 'struct usb_iso_packet_descriptor[0]' [-Warray-bounds=]
     859 |                         urb->iso_frame_desc[j].length = ISO_FRAME_SIZE;
         |                         ~~~~~~~~~~~~~~~~~~~^~~
   include/linux/usb.h: In function 'ttusb_start_feed':
   include/linux/usb.h:1617:42: note: while referencing 'iso_frame_desc'
    1617 |         struct usb_iso_packet_descriptor iso_frame_desc[0];
         |                                          ^~~~~~~~~~~~~~
   In function 'ttusb_start_iso_xfer',
       inlined from 'ttusb_start_feed' at drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:936:3:
   drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:858:44: warning: array subscript 1 is outside array bounds of 'struct usb_iso_packet_descriptor[0]' [-Warray-bounds=]
     858 |                         urb->iso_frame_desc[j].offset = frame_offset;
         |                         ~~~~~~~~~~~~~~~~~~~^~~
   include/linux/usb.h: In function 'ttusb_start_feed':
   include/linux/usb.h:1617:42: note: while referencing 'iso_frame_desc'
    1617 |         struct usb_iso_packet_descriptor iso_frame_desc[0];
         |                                          ^~~~~~~~~~~~~~
   In function 'ttusb_start_iso_xfer',
       inlined from 'ttusb_start_feed' at drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:936:3:
   drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:859:44: warning: array subscript 1 is outside array bounds of 'struct usb_iso_packet_descriptor[0]' [-Warray-bounds=]
     859 |                         urb->iso_frame_desc[j].length = ISO_FRAME_SIZE;
         |                         ~~~~~~~~~~~~~~~~~~~^~~
   include/linux/usb.h: In function 'ttusb_start_feed':
   include/linux/usb.h:1617:42: note: while referencing 'iso_frame_desc'
    1617 |         struct usb_iso_packet_descriptor iso_frame_desc[0];
         |                                          ^~~~~~~~~~~~~~
   In function 'ttusb_start_iso_xfer',
       inlined from 'ttusb_start_feed' at drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:936:3:
   drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:858:44: warning: array subscript 2 is outside array bounds of 'struct usb_iso_packet_descriptor[0]' [-Warray-bounds=]
     858 |                         urb->iso_frame_desc[j].offset = frame_offset;
         |                         ~~~~~~~~~~~~~~~~~~~^~~
   include/linux/usb.h: In function 'ttusb_start_feed':
   include/linux/usb.h:1617:42: note: while referencing 'iso_frame_desc'
    1617 |         struct usb_iso_packet_descriptor iso_frame_desc[0];
         |                                          ^~~~~~~~~~~~~~
   In function 'ttusb_start_iso_xfer',
       inlined from 'ttusb_start_feed' at drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:936:3:
   drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:859:44: warning: array subscript 2 is outside array bounds of 'struct usb_iso_packet_descriptor[0]' [-Warray-bounds=]
     859 |                         urb->iso_frame_desc[j].length = ISO_FRAME_SIZE;
         |                         ~~~~~~~~~~~~~~~~~~~^~~
   include/linux/usb.h: In function 'ttusb_start_feed':
   include/linux/usb.h:1617:42: note: while referencing 'iso_frame_desc'
    1617 |         struct usb_iso_packet_descriptor iso_frame_desc[0];
         |                                          ^~~~~~~~~~~~~~
   In function 'ttusb_start_iso_xfer',
       inlined from 'ttusb_start_feed' at drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:936:3:
   drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:858:44: warning: array subscript 3 is outside array bounds of 'struct usb_iso_packet_descriptor[0]' [-Warray-bounds=]
     858 |                         urb->iso_frame_desc[j].offset = frame_offset;
         |                         ~~~~~~~~~~~~~~~~~~~^~~
   include/linux/usb.h: In function 'ttusb_start_feed':
   include/linux/usb.h:1617:42: note: while referencing 'iso_frame_desc'
    1617 |         struct usb_iso_packet_descriptor iso_frame_desc[0];
         |                                          ^~~~~~~~~~~~~~
   In function 'ttusb_start_iso_xfer',
       inlined from 'ttusb_start_feed' at drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:936:3:
   drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:859:44: warning: array subscript 3 is outside array bounds of 'struct usb_iso_packet_descriptor[0]' [-Warray-bounds=]
     859 |                         urb->iso_frame_desc[j].length = ISO_FRAME_SIZE;
         |                         ~~~~~~~~~~~~~~~~~~~^~~
   include/linux/usb.h: In function 'ttusb_start_feed':
   include/linux/usb.h:1617:42: note: while referencing 'iso_frame_desc'
    1617 |         struct usb_iso_packet_descriptor iso_frame_desc[0];
         |                                          ^~~~~~~~~~~~~~


vim +224 drivers/media/usb/cx231xx/cx231xx-dvb.c

e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  206  
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  207  static inline int dvb_isoc_copy(struct cx231xx *dev, struct urb *urb)
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  208  {
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  209  	int i;
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  210  
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  211  	if (!dev)
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  212  		return 0;
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  213  
990862a2f02429 drivers/media/video/cx231xx/cx231xx-dvb.c Mauro Carvalho Chehab 2012-01-10  214  	if (dev->state & DEV_DISCONNECTED)
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  215  		return 0;
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  216  
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  217  	if (urb->status < 0) {
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  218  		print_err_status(dev, -1, urb->status);
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  219  		if (urb->status == -ENOENT)
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  220  			return 0;
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  221  	}
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  222  
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  223  	for (i = 0; i < urb->number_of_packets; i++) {
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03 @224  		int status = urb->iso_frame_desc[i].status;
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  225  
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  226  		if (status < 0) {
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  227  			print_err_status(dev, i, status);
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  228  			if (urb->iso_frame_desc[i].status != -EPROTO)
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  229  				continue;
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  230  		}
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  231  
64fbf444552606 drivers/media/video/cx231xx/cx231xx-dvb.c Palash Bandyopadhyay  2010-07-06  232  		dvb_dmx_swfilter(&dev->dvb->demux,
64fbf444552606 drivers/media/video/cx231xx/cx231xx-dvb.c Palash Bandyopadhyay  2010-07-06  233  				 urb->transfer_buffer +
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  234  				urb->iso_frame_desc[i].offset,
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  235  				urb->iso_frame_desc[i].actual_length);
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  236  	}
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  237  
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  238  	return 0;
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  239  }
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-dvb.c Sri Deevi             2009-03-03  240  

:::::: The code at line 224 was first introduced by commit
:::::: e0d3bafd02586cfde286c320f56906fd9fa8d256 V4L/DVB (10954): Add cx231xx USB driver

:::::: TO: Sri Deevi <Srinivasa.Deevi@conexant.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
