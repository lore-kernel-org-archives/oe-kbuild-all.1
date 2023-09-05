Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1420C2CA4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 20:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693946676; x=1725482676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9iy0Shk12whZtjlHReDMJe69Fcyof73nG9chGCFR8UY=;
  b=nN+bRw1nmoT/M+/5jacKv6C5/CCx7WzzuSH/0RnPQX2kYZsD+neXWPUc
   4yHLNXExSAk8INP+/IkH5wJ/mSiCidcmHxr1c89qClb1Pt8/Nk3YWKmsF
   VUMEtEsXMmGootkafaB/S8nEjX88u6qaT/7RUbQyKZdo8rQryB4RZQt8/
   T6rDlVpdq4EUBRVNgO/oA9Axbc689cS99Tt0gHAwKDuwiN/9Gu46+t00V
   TTFHYpzaO6RpuQwLYgiVMqR3iuXqw8FMKog1G7bnCYcltZl/WJ5+ngheT
   kUnUsAEv35PYqRiuTKIGZ8PePB6cxQK+67OMpc1wiO13/PhGaDKlzaca+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="361928008"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="361928008"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 13:44:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="864886954"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="864886954"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 05 Sep 2023 13:44:33 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdcuV-00023q-1f;
	Tue, 05 Sep 2023 20:44:31 +0000
Date: Wed, 6 Sep 2023 04:44:27 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Narani <manish.narani@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:pr/146 11930/14527]
 drivers/usb/dwc3/gadget_hibernation.c:16: warning: cannot understand
 function prototype: 'u32 save_reg_addr[] = '
Message-ID: <202309060400.AfWhvJA1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx pr/146
head:   38b0c0cf11566882cda99f8e4f2243924a684be5
commit: 719080ff0022e05bb4cb8043d62739feebcd8dbc [11930/14527] usb: dwc3: gadget: Add hibernation support when operating in gadget mode
config: arc-randconfig-r015-20230905 (https://download.01.org/0day-ci/archive/20230906/202309060400.AfWhvJA1-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060400.AfWhvJA1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060400.AfWhvJA1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc3/gadget_hibernation.c:16: warning: cannot understand function prototype: 'u32 save_reg_addr[] = '
   drivers/usb/dwc3/gadget_hibernation.c:74: warning: Function parameter or member 'epnum' not described in 'restart_ep0_trans'
>> drivers/usb/dwc3/gadget_hibernation.c:383: warning: Function parameter or member '_dwc' not described in 'dwc3_gadget_exit_hibernation'
>> drivers/usb/dwc3/gadget_hibernation.c:383: warning: Excess function parameter 'dwc' description in 'dwc3_gadget_exit_hibernation'


vim +16 drivers/usb/dwc3/gadget_hibernation.c

    14	
    15	/* array of registers to save on hibernation and restore them on wakeup */
  > 16	static u32 save_reg_addr[] = {
    17		DWC3_DCTL,
    18		DWC3_DCFG,
    19		DWC3_DEVTEN
    20	};
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
