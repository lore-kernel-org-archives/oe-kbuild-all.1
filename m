Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118EE10EC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679215746; x=1710751746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vh88PXdqvih6fMe7fbxmucXaDUuShbC6D4kXYBQH6X8=;
  b=RfS9u7UtdHs4Pl0yCwlCmpIAPAem7EzzFJQz8uWsmLAFgWtwxNMvzoyM
   DEpNHx8dXF6su0y8Pohn3UWJZfqepctMY2Jjy77sp2cGTONKm1DGP1dR4
   GICqKcuQGkuCW/8fnSa4hjbDstb3FUiHdh5s3rvpe8aeJmjlyLdJZPNr9
   WYMKnVCkK5VFnmdJ32G7O0IKf9MCO1qDBFeeHcsqXSSHgzyqTFXOzyJmj
   uqmpOzuq/3/lZSBdb3PrNuIr3/HB6pKhelH1Qd9nR5MJDYczmD+Y+c0Dq
   Pc1so/xIgdCQuY7YFbrtxOzKlVXnOYnMPWRaK14RWEUmaSb94zf1trGKS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="322336736"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="322336736"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 01:49:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="658036935"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="658036935"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Mar 2023 01:49:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdoit-000ATW-2s;
	Sun, 19 Mar 2023 08:49:03 +0000
Date: Sun, 19 Mar 2023 16:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mnyman-xhci:feature_interrupters 4/4]
 drivers/usb/host/xhci-sideband.h:16:46: error: 'EP_CTX_PER_DEV' undeclared
 here (not in a function)
Message-ID: <202303191628.s2PtwCi4-lkp@intel.com>
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
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20230319/202303191628.s2PtwCi4-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?id=93b93462a62a86505a34344c2342741388b36d1a
        git remote add mnyman-xhci https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git
        git fetch --no-tags mnyman-xhci feature_interrupters
        git checkout 93b93462a62a86505a34344c2342741388b36d1a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash drivers/rtc/ drivers/usb/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303191628.s2PtwCi4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/usb/host/xhci-sideband.c:11:
>> drivers/usb/host/xhci-sideband.h:16:46: error: 'EP_CTX_PER_DEV' undeclared here (not in a function)
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
>> drivers/usb/host/xhci-sideband.c:16:22: error: unknown type name 'xhci_ring'
      16 | xhci_ring_to_sgtable(xhci_ring *ring, struct device *dev)
         |                      ^~~~~~~~~


vim +/EP_CTX_PER_DEV +16 drivers/usb/host/xhci-sideband.h

    12	
    13	struct xhci_sideband {
    14		struct xhci_hcd                 *xhci;
    15		struct xhci_virt_device         *vdev;
  > 16		struct xhci_virt_ep             *eps[EP_CTX_PER_DEV];
    17		struct xhci_interrupter         *ir;
    18	};
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
