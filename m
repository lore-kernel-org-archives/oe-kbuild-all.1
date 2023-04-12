Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7916FD2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 17:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681321591; x=1712857591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=khJ00F6Ev+zDu3pFRxON/S8TeOQDpHxuXnnNIINFYXk=;
  b=OTL1pXdIzvlAC6bphtcf92SFL01X69ReXp8VD3woPRIqBsiJ4hnLYbvC
   p5gEKnrg2aXplDOoJXsAqjEl+PXnNWyQ5ev/LQZFPGmJO27jkBV6NhwzJ
   dNdq92uNmjlj5Ei/kp/CwYnVcfrWqRNvoAT5EbaMWXV9pZuKj6/A99kn1
   986SHtJCLdbd0V+5Qm8/KPH6qWq1I8jmHQYog0aiJieQ7n8SYqolpHWSx
   o0KDYc1WLiz25OIRNMAiJ32EoaOE6tPkJzSIBijR8wpVhX6eQ5P0mCbOL
   0a/x6IdIKAVv9qAiUbJ9ssOyrmWN6lP4Hkvy1pM9IF2zBn1rR87Ar3brY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="406803181"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="406803181"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 10:46:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="682574204"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="682574204"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Apr 2023 10:46:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmeY0-000XxX-06;
	Wed, 12 Apr 2023 17:46:20 +0000
Date: Thu, 13 Apr 2023 01:45:43 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Manish Narani <manish.narani@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 671/1065] ERROR: modpost:
 "dwc3_host_wakeup_capable" [drivers/usb/host/xhci-plat-hcd.ko] undefined!
Message-ID: <202304130111.8tlVvD8K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   e5753363b5e03fc0a3055d5476c6cca93e9ea28b
commit: c72511380a06150f86102ac467cefe77a69339e7 [671/1065] usb: xhci-plat: Add remote wakeup support
config: x86_64-randconfig-a015-20230410 (https://download.01.org/0day-ci/archive/20230413/202304130111.8tlVvD8K-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/Xilinx/linux-xlnx/commit/c72511380a06150f86102ac467cefe77a69339e7
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1_LTS
        git checkout c72511380a06150f86102ac467cefe77a69339e7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130111.8tlVvD8K-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dwc3_host_wakeup_capable" [drivers/usb/host/xhci-plat-hcd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
