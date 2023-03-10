Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E9EDABB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 21:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678482690; x=1710018690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fq8esu4isaOj57BiqME++h93jC2J82F0EZhhLwQn6Ng=;
  b=kR/hoIc2CXHQS5W0s9XLSnZe1992GpKLVogNHAUfQXat+78ixWrX/e7T
   B7zRJvps/EUlryyN2ogpkfQ80Oyb7rSC9/NkQT5VKb5e4ZqjKxiOPWKwn
   6RufCDMRTwkURQE1PjHRVeGsrdshzW1isgrEgo0Etg5Qrgh5V/ai3cDBi
   p4Z0wE7H1hNQqey/CvEXakTWkiN8deXbrAOnOD4vfntpnmHmIIDzUdPQU
   YRvBP78MXZbHmmnYRnyc4b90RsaIGouBEIJspkdLU+6zF2Jh1/1fIfxcx
   rR4RgV19KCAXmn8hcHo8jMMkaufgAXb9HmgdWobZAREzrafKQpJRSwZNq
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="325186260"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="325186260"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 13:11:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="627941786"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="627941786"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Mar 2023 13:11:29 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pak1Q-00045z-1N;
	Fri, 10 Mar 2023 21:11:28 +0000
Date: Sat, 11 Mar 2023 05:10:36 +0800
From: kernel test robot <lkp@intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mnyman-xhci:feature_interrupters 4/4]
 drivers/usb/host/xhci-sideband.h:21:31: warning: 'struct usb_device'
 declared inside parameter list will not be visible outside of this
 definition or declaration
Message-ID: <202303110544.XWDZ623Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git feature_interrupters
head:   93b93462a62a86505a34344c2342741388b36d1a
commit: 93b93462a62a86505a34344c2342741388b36d1a [4/4] xhci: sideband: add initial api to register a sideband entity
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230311/202303110544.XWDZ623Y-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?id=93b93462a62a86505a34344c2342741388b36d1a
        git remote add mnyman-xhci https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git
        git fetch --no-tags mnyman-xhci feature_interrupters
        git checkout 93b93462a62a86505a34344c2342741388b36d1a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/usb/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303110544.XWDZ623Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/host/xhci-sideband.c:11:
   drivers/usb/host/xhci-sideband.h:16:46: error: 'EP_CTX_PER_DEV' undeclared here (not in a function)
      16 |         struct xhci_virt_ep             *eps[EP_CTX_PER_DEV];
         |                                              ^~~~~~~~~~~~~~
>> drivers/usb/host/xhci-sideband.h:21:31: warning: 'struct usb_device' declared inside parameter list will not be visible outside of this definition or declaration
      21 | xhci_sideband_register(struct usb_device *udev);
         |                               ^~~~~~~~~~
>> drivers/usb/host/xhci-sideband.h:26:35: warning: 'struct usb_host_endpoint' declared inside parameter list will not be visible outside of this definition or declaration
      26 |                            struct usb_host_endpoint *host_ep);
         |                                   ^~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-sideband.h:29:38: warning: 'struct usb_host_endpoint' declared inside parameter list will not be visible outside of this definition or declaration
      29 |                               struct usb_host_endpoint *host_ep);
         |                                      ^~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-sideband.h:32:36: warning: 'struct usb_host_endpoint' declared inside parameter list will not be visible outside of this definition or declaration
      32 |                             struct usb_host_endpoint *host_ep);
         |                                    ^~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-sideband.c:16:22: error: unknown type name 'xhci_ring'
      16 | xhci_ring_to_sgtable(xhci_ring *ring, struct device *dev)
         |                      ^~~~~~~~~


vim +21 drivers/usb/host/xhci-sideband.h

    19	
    20	struct xhci_sideband *
  > 21	xhci_sideband_register(struct usb_device *udev);
    22	void
    23	xhci_sideband_unregister(struct xhci_sideband *sb);
    24	int
    25	xhci_sideband_add_endpoint(struct xhci_sideband *sb,
  > 26				   struct usb_host_endpoint *host_ep);
    27	int
    28	xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
    29				      struct usb_host_endpoint *host_ep);
    30	int
    31	xhci_sideband_stop_endpoint(struct xhci_sideband *sb,
    32				    struct usb_host_endpoint *host_ep);
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
