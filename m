Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5EA7F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 04:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682138978; x=1713674978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/V+3BAAT397F8eyLeGy+/uiJtntTbyF4GPznec0vqS0=;
  b=IEXTfb5yJ1gf8BUPKq31BWcxKv/wQYYnsaeOsk84jGSQebrZtKQkLBgL
   mh0DGuaJ5UCiGzuu9e1FSUCoHvEOqAOKqMXa+h/aQiFZ7eTtlwGZ+ASwl
   EWOear1/NuvKeogoq9NkT4HXw+C9ePtTCPAhBAOwL1u4Ctx6yl3hMfWxZ
   i4Nx1bherWQICrWLoY2lneCnnvPhEJNce9lspwY5fP2mqUv6bSTAtDDmQ
   TPAZJ8LI/hEaPrBSJ+q3C5ktor2Z5VLFSVUl3CZBmrotp62mK0LRR8eXI
   f1sv1Srp/lyNB7buNCXsUnK40oyRJ9L7Ar81UG3r6goEYsVtnq75DBNUO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="432403267"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="432403267"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 21:49:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="642736365"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="642736365"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Apr 2023 21:49:35 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq5Bm-000h4m-2a;
	Sat, 22 Apr 2023 04:49:34 +0000
Date: Sat, 22 Apr 2023 12:49:11 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Manish Narani <manish.narani@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:master 674/1117] ERROR: modpost:
 "dwc3_host_wakeup_capable" [drivers/usb/host/xhci-plat-hcd.ko] undefined!
Message-ID: <202304221252.6LLXdsqi-lkp@intel.com>
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

tree:   https://github.com/Xilinx/linux-xlnx master
head:   3a2a9dcee70777a85b3952269c47e6eb65779b78
commit: 22f32ef388442066b0fd5a9f03d63102f09825bf [674/1117] usb: xhci-plat: Add remote wakeup support
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20230422/202304221252.6LLXdsqi-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/Xilinx/linux-xlnx/commit/22f32ef388442066b0fd5a9f03d63102f09825bf
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout 22f32ef388442066b0fd5a9f03d63102f09825bf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304221252.6LLXdsqi-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dwc3_host_wakeup_capable" [drivers/usb/host/xhci-plat-hcd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
