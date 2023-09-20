Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DF715AE8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 11:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695209264; x=1726745264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1CGWOADJZdDL9rvU+lCfXrCXBSpfzSwGiYmfBf2P404=;
  b=CfB4WuuVCAbTLp2um3cGmDUPQyuX2UUkhfjnmctwwWAOzbxVf2+Fyc3V
   bXAP+g7srD3eVqGQ4sqCI7KLl2o6RZ0FA8wHsHiOy/pJswIfqNnPEBJDQ
   Il2icnoqhSRKzpbGw8+qHSROaTa/LPzViI9BxEfvrwFzm6qnnboAymBgl
   TkLg2z+0+ZWqQ1MnMEVWeIpCoPaC/G33Lm8KN+lHl3oa9uCObxR4BmQUa
   kAsp6mNV9uKvlDolJzJLKyktlJsx/CVY62p/3y4ybJa+eH5kPTOUKdfOk
   4o3VWskz1kS18P4AbU/+lBan/za3WYxfBmkmChPbV1x5406VxhcVqQaF4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="380098233"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="380098233"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 04:27:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="696264548"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="696264548"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 20 Sep 2023 04:27:33 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qivMg-0008h6-2o;
	Wed, 20 Sep 2023 11:27:30 +0000
Date: Wed, 20 Sep 2023 19:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Manish Narani <manish.narani@xilinx.com>,
	Piyush Mehta <piyush.mehta@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 670/1365]
 drivers/usb/dwc3/core.c:2343: undefined reference to
 `dwc3_gadget_exit_hibernation'
Message-ID: <202309201903.mF1pRW8x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   008e6788f5aa09862307822bfc396c926dc0dbac
commit: cbd364755cd28447d078372bda5ab27896856c84 [670/1365] usb: dwc3: don't setup event buffers when operating in host mode
config: i386-randconfig-011-20230920 (https://download.01.org/0day-ci/archive/20230920/202309201903.mF1pRW8x-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201903.mF1pRW8x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201903.mF1pRW8x-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/usb/dwc3/core.o: in function `dwc3_suspend':
>> drivers/usb/dwc3/core.c:2343: undefined reference to `dwc3_gadget_exit_hibernation'
   ld: drivers/usb/dwc3/core.o: in function `dwc3_remove':
   drivers/usb/dwc3/core.c:2078: undefined reference to `dwc3_gadget_exit_hibernation'


vim +2343 drivers/usb/dwc3/core.c

  2330	
  2331	#ifdef CONFIG_PM_SLEEP
  2332	static int dwc3_suspend(struct device *dev)
  2333	{
  2334		struct dwc3	*dwc = dev_get_drvdata(dev);
  2335		int		ret;
  2336	
  2337		if (dwc->is_hibernated) {
  2338			/*
  2339			 * As we are about to suspend, wake the controller from
  2340			 * D3 & hibernation states
  2341			 */
  2342			dwc->force_hiber_wake = true;
> 2343			dwc3_gadget_exit_hibernation(dwc);
  2344			dwc->force_hiber_wake = false;
  2345		}
  2346	
  2347		ret = dwc3_suspend_common(dwc, PMSG_SUSPEND);
  2348		if (ret)
  2349			return ret;
  2350	
  2351		pinctrl_pm_select_sleep_state(dev);
  2352	
  2353		return 0;
  2354	}
  2355	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
