Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E807C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 23:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675552681; x=1707088681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oVQtnFHkUGOT5YDqpfYi8U8KOIettztn8jO5s/wDxOU=;
  b=lhxnNoVCMARTsaqnjXlXNhVag35skLgfls3hY7ZczZPJqkO46FK7ZjPx
   sbzTsgyZooJnpKaagFnRaJo8rtnwAm8C8D8fdIFLkVFQDNoVFVEe5323D
   ZM8DEm52kJVFAAQKVyWB7f/prIMjQ5yIf7u9UJxYyIDKz6steYI32b1W+
   EvvcQo1dQ0XfkwiJQuQeN2etQxhJ06TGQPbxbrMOjs8qMroDGCwTEWFbg
   u77oycWKhnHYcDr5BzCphBFNSowmOQJzrK3FKDvwXDE626i7ob+B8QBH+
   EKqSrgP73PTp1ww2hkRDf6IR3xLqKrNmUcznbeJVIKKLZwF+VyvcmGzE3
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="317004125"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="317004125"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 15:18:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="643641753"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="643641753"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Feb 2023 15:17:59 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pORnD-0001Zk-0E;
	Sat, 04 Feb 2023 23:17:59 +0000
Date: Sun, 5 Feb 2023 07:17:04 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Simek <monstr@monstr.eu>,
	Manish Narani <manish.narani@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [pinchartl-media:muxed/2023.1/base 674/929] ERROR: modpost:
 "dwc3_host_wakeup_capable" [drivers/usb/host/xhci-plat-hcd.ko] undefined!
Message-ID: <202302050748.0FdgIkMo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/pinchartl/media.git muxed/2023.1/base
head:   f9c8e14ae03c937a79e1c904d004d80a0db3647e
commit: 22f32ef388442066b0fd5a9f03d63102f09825bf [674/929] usb: xhci-plat: Add remote wakeup support
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20230205/202302050748.0FdgIkMo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2023.1/base
        git checkout 22f32ef388442066b0fd5a9f03d63102f09825bf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dwc3_host_wakeup_capable" [drivers/usb/host/xhci-plat-hcd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
