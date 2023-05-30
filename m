Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FA214AB5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 12:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685450844; x=1716986844;
  h=date:from:cc:subject:message-id:mime-version;
  bh=0iKGnyl3NuxkxY5E2XXTxxMofGyICi67OjPM3LmKO4M=;
  b=JL6IsAqyW6SsiLSMS62MFACWK5SgfHXe7Cf4j8thkN58JTK36HvJTMgU
   seGMJ67vMxXDoTc22zpnW6F6A0hxZL5Jzi8BBQ36tzY4c/bCiDwpSLKKb
   OJEXN9Q2fT66kRBWEotILIchrWXp4SUGpj6omEJ5CEqBIb0B3e2e2vWYC
   YNgnAMMqL3pkLLqZXUL2SBxsiNKbdFZ8IG+V45R9amBVGQb4M/FpmwI23
   WAfvIMxLVjeAI3me67d5OplJsqgY7uyMrkfEUBy8xXA0AcluYGv6iZ3YH
   CDsx7mORoruPQg2sVOXvRiRkf+B7uy+rjoZz9I8nxlUzC+pMh58pOKzK1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="353743302"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="353743302"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 05:47:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="683948595"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="683948595"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 May 2023 05:47:21 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3ykz-0000Yp-0p;
	Tue, 30 May 2023 12:47:21 +0000
Date: Tue, 30 May 2023 20:47:13 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Simek <monstr@monstr.eu>
Subject: [pinchartl-media:muxed/2022.2/base 30/740]
 drivers/usb/dwc3/core.c:2121: undefined reference to
 `dwc3_gadget_exit_hibernation'
Message-ID: <202305302019.cP1URJxd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/pinchartl/media.git muxed/2022.2/base
head:   e26621179c3b1834a1bb17e9a38e47238ac63bf5
commit: 9b62852ec04b7d48971ce8016b13c27403929908 [30/740] Merge tag 'v5.15' into master
config: i386-randconfig-i086-20230529 (https://download.01.org/0day-ci/archive/20230530/202305302019.cP1URJxd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2022.2/base
        git checkout 9b62852ec04b7d48971ce8016b13c27403929908
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305302019.cP1URJxd-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/usb/dwc3/core.o: in function `dwc3_suspend':
>> drivers/usb/dwc3/core.c:2121: undefined reference to `dwc3_gadget_exit_hibernation'
   ld: drivers/usb/dwc3/core.o: in function `dwc3_remove':
   drivers/usb/dwc3/core.c:1827: undefined reference to `dwc3_gadget_exit_hibernation'


vim +2121 drivers/usb/dwc3/core.c

fc8bb91bc83ef8 Felipe Balbi  2016-05-16  2108  
fc8bb91bc83ef8 Felipe Balbi  2016-05-16  2109  #ifdef CONFIG_PM_SLEEP
fc8bb91bc83ef8 Felipe Balbi  2016-05-16  2110  static int dwc3_suspend(struct device *dev)
fc8bb91bc83ef8 Felipe Balbi  2016-05-16  2111  {
fc8bb91bc83ef8 Felipe Balbi  2016-05-16  2112  	struct dwc3	*dwc = dev_get_drvdata(dev);
fc8bb91bc83ef8 Felipe Balbi  2016-05-16  2113  	int		ret;
fc8bb91bc83ef8 Felipe Balbi  2016-05-16  2114  
719080ff0022e0 Manish Narani 2021-02-04  2115  	if (dwc->is_hibernated) {
719080ff0022e0 Manish Narani 2021-02-04  2116  		/*
719080ff0022e0 Manish Narani 2021-02-04  2117  		 * As we are about to suspend, wake the controller from
719080ff0022e0 Manish Narani 2021-02-04  2118  		 * D3 & hibernation states
719080ff0022e0 Manish Narani 2021-02-04  2119  		 */
719080ff0022e0 Manish Narani 2021-02-04  2120  		dwc->force_hiber_wake = true;
719080ff0022e0 Manish Narani 2021-02-04 @2121  		dwc3_gadget_exit_hibernation(dwc);
719080ff0022e0 Manish Narani 2021-02-04  2122  		dwc->force_hiber_wake = false;
719080ff0022e0 Manish Narani 2021-02-04  2123  	}
719080ff0022e0 Manish Narani 2021-02-04  2124  
c4a5153e87fdf6 Manu Gautam   2018-01-18  2125  	ret = dwc3_suspend_common(dwc, PMSG_SUSPEND);
fc8bb91bc83ef8 Felipe Balbi  2016-05-16  2126  	if (ret)
fc8bb91bc83ef8 Felipe Balbi  2016-05-16  2127  		return ret;
fc8bb91bc83ef8 Felipe Balbi  2016-05-16  2128  
fc8bb91bc83ef8 Felipe Balbi  2016-05-16  2129  	pinctrl_pm_select_sleep_state(dev);
fc8bb91bc83ef8 Felipe Balbi  2016-05-16  2130  
fc8bb91bc83ef8 Felipe Balbi  2016-05-16  2131  	return 0;
fc8bb91bc83ef8 Felipe Balbi  2016-05-16  2132  }
fc8bb91bc83ef8 Felipe Balbi  2016-05-16  2133  

:::::: The code at line 2121 was first introduced by commit
:::::: 719080ff0022e05bb4cb8043d62739feebcd8dbc usb: dwc3: gadget: Add hibernation support when operating in gadget mode

:::::: TO: Manish Narani <manish.narani@xilinx.com>
:::::: CC: Michal Simek <michal.simek@xilinx.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
