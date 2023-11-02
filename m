Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FC2208A4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 17:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMOXEcX8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698947120; x=1730483120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9E44wn+axP+bawWrgvtEGU6Fj8KrNPI81SGFPxHo3Ws=;
  b=BMOXEcX8wcAoXuqTtc3b8tNUtVkZYP8mIPTZV1caxkp1d+yTIzvLnc94
   UBOCy/mpx1WyJvqWfrDBx9HUaMi9o4LaOdOz7pmDKAkX0LT2OyUa3I2G/
   5NnnHwpQToG7utJd/PvD2UUynmq8Lg7hohmya1qNApqmBgiRnJRlZKvjw
   mtva0UHPCnQCLYauxjAsX0XD8oR/veaiiLMVT/4EcHRk72+ZrygziuegS
   p/2QtL7+d108Z5Eo/sV4Bp8RsXCbt0Vl14oGdRuAaI17DYWuXEtwOv4lL
   cJHekujV8z9U5NEHgNPBLBFbLFgCBgIYZAsCow3OVWK75D+EPim+CCQ23
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="419879815"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="419879815"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 10:45:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="737833362"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="737833362"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 02 Nov 2023 10:45:16 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qybko-0001jI-0n;
	Thu, 02 Nov 2023 17:45:14 +0000
Date: Fri, 3 Nov 2023 01:44:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 20/23]
 drivers/usb/gadget/udc/core.c:56: warning: Function parameter or member
 'vbus_work' not described in 'usb_udc'
Message-ID: <202311030143.xkdZCpaX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   f8d3b450e9beb7962d2ca9ebe66444eb9aa7ef13
commit: 18b677ffae1a206a5f263b86cd39ef268d6db830 [20/23] FROMGIT: usb: gadget: udc: core: Offload usb_udc_vbus_handler processing
config: i386-buildonly-randconfig-004-20231102 (https://download.01.org/0day-ci/archive/20231103/202311030143.xkdZCpaX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030143.xkdZCpaX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030143.xkdZCpaX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/udc/core.c:56: warning: Function parameter or member 'vbus_work' not described in 'usb_udc'


vim +56 drivers/usb/gadget/udc/core.c

fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern             2022-04-23  30  
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  31  /**
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  32   * struct usb_udc - describes one usb device controller
e21cd08f965766 drivers/usb/gadget/udc/core.c     Lee Jones              2020-07-03  33   * @driver: the gadget driver pointer. For use by the class code
e21cd08f965766 drivers/usb/gadget/udc/core.c     Lee Jones              2020-07-03  34   * @dev: the child device to the actual controller
e21cd08f965766 drivers/usb/gadget/udc/core.c     Lee Jones              2020-07-03  35   * @gadget: the gadget. For use by the class code
e21cd08f965766 drivers/usb/gadget/udc/core.c     Lee Jones              2020-07-03  36   * @list: for use by the udc class driver
e21cd08f965766 drivers/usb/gadget/udc/core.c     Lee Jones              2020-07-03  37   * @vbus: for udcs who care about vbus status, this value is real vbus status;
628ef0d273a69d drivers/usb/gadget/udc/udc-core.c Peter Chen             2015-03-06  38   * for udcs who do not care about vbus status, this value is always true
49d08cfc783044 drivers/usb/gadget/udc/core.c     Thinh Nguyen           2021-01-11  39   * @started: the UDC's started state. True if the UDC had started.
18b677ffae1a20 drivers/usb/gadget/udc/core.c     Badhri Jagan Sridharan 2023-06-09  40   * @allow_connect: Indicates whether UDC is allowed to be pulled up.
18b677ffae1a20 drivers/usb/gadget/udc/core.c     Badhri Jagan Sridharan 2023-06-09  41   * Set/cleared by gadget_(un)bind_driver() after gadget driver is bound or
18b677ffae1a20 drivers/usb/gadget/udc/core.c     Badhri Jagan Sridharan 2023-06-09  42   * unbound.
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  43   *
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  44   * This represents the internal data structure which is used by the UDC-class
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  45   * to hold information about udc driver and gadget together.
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  46   */
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  47  struct usb_udc {
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  48  	struct usb_gadget_driver	*driver;
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  49  	struct usb_gadget		*gadget;
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  50  	struct device			dev;
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  51  	struct list_head		list;
628ef0d273a69d drivers/usb/gadget/udc/udc-core.c Peter Chen             2015-03-06  52  	bool				vbus;
49d08cfc783044 drivers/usb/gadget/udc/core.c     Thinh Nguyen           2021-01-11  53  	bool				started;
18b677ffae1a20 drivers/usb/gadget/udc/core.c     Badhri Jagan Sridharan 2023-06-09  54  	bool				allow_connect;
18b677ffae1a20 drivers/usb/gadget/udc/core.c     Badhri Jagan Sridharan 2023-06-09  55  	struct work_struct		vbus_work;
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28 @56  };
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  57  

:::::: The code at line 56 was first introduced by commit
:::::: 2ccea03a8f7ec93641791f2760d7cdc6cab6205f usb: gadget: introduce UDC Class

:::::: TO: Felipe Balbi <balbi@ti.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
