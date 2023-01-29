Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A17917F1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 11:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674992469; x=1706528469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ix9sPj7+2IMdYW50mRCoytICUDn4AOz3xH8QsMmc0kY=;
  b=b1pf3zosyEVWXimiaeCjK71II/sYodJz8anZ+rU4C9DcrzqgP4Ur/fCt
   sI+/fcH+AlgtmkwJxxDL8e2uq/dALeEcht2ku87tPnadguPjFatsCaAjn
   a2pxUGwRc+GlahUbmCsPIgqM1QePsZWflDGVhYl8oQUAvY6C2YdW1V3at
   M90BSFfOdBc/NAIb68Ex54BxQY5a9tW0sJdVwf+iQmkPEAvkG33iNRC04
   iJsdHpk61Ee5jkFCivlXDoHmWok+NxlkU4+PQ5HQH5wBJZVUuzUtUnXMw
   FomgVqVXH0emsZYU6NvjcqCMxioNSuoM4Gy+EAl1MW7lHfD0ZOIidQQY1
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="326059666"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="326059666"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 03:41:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="613719918"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="613719918"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 Jan 2023 03:41:06 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pM63V-0002m2-2G;
	Sun, 29 Jan 2023 11:41:05 +0000
Date: Sun, 29 Jan 2023 19:40:39 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Manish Narani <manish.narani@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS_2022.1_update 404/1124]
 drivers/usb/dwc3/dwc3-xilinx.c:508:6: warning: no previous prototype for
 'dwc3_xilinx_wakeup_capable'
Message-ID: <202301291956.7mRsLiyf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Piyush,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
head:   5da20470af455bc588357712b64603b06e4edf42
commit: db6b55a74c709a27fdf6d175f890568dc8945424 [404/1124] usb: dwc3: Added remote wake-up in xilinx glue driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230129/202301291956.7mRsLiyf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/db6b55a74c709a27fdf6d175f890568dc8945424
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
        git checkout db6b55a74c709a27fdf6d175f890568dc8945424
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/usb/dwc3/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc3/dwc3-xilinx.c:508:6: warning: no previous prototype for 'dwc3_xilinx_wakeup_capable' [-Wmissing-prototypes]
     508 | void dwc3_xilinx_wakeup_capable(struct device *dev, bool wakeup)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/dwc3_xilinx_wakeup_capable +508 drivers/usb/dwc3/dwc3-xilinx.c

   506	
   507	/* xilinx feature support functions */
 > 508	void dwc3_xilinx_wakeup_capable(struct device *dev, bool wakeup)
   509	{
   510		struct device_node *node = of_node_get(dev->parent->of_node);
   511	
   512		/* check for valid parent node */
   513		while (node) {
   514			if (of_device_is_compatible(node, "xlnx,zynqmp-dwc3") ||
   515			    of_device_is_compatible(node, "xlnx,versal-dwc3"))
   516				break;
   517	
   518			/* get the next parent node */
   519			node = of_get_next_parent(node);
   520		}
   521	
   522		if (node) {
   523			struct platform_device *pdev_parent;
   524			struct dwc3_xlnx *priv_data;
   525	
   526			pdev_parent = of_find_device_by_node(node);
   527			priv_data = platform_get_drvdata(pdev_parent);
   528	
   529			/* Set wakeup capable as true or false */
   530			priv_data->wakeup_capable = wakeup;
   531	
   532			/* Allow D3 state if wakeup capable only */
   533			priv_data->enable_d3_suspend = wakeup;
   534		}
   535	}
   536	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
