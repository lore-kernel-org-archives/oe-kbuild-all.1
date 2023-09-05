Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE652101C5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 21:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693950541; x=1725486541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IHpG001oqDlOVSllfQh6Vygo/Pn8oj0qtt2TDUTOeFM=;
  b=K78hz4zrfLhyl9fJOiyz6yJlrK95xVAloLxddcan+zKCqp957jAbq8Z6
   5pZhpsJ7b27fgo/92uz1Je6zBiPPv0Gnhc/renssqEYzsaBysXEGnspd1
   v9PwdebGKsPT1JYFkIGZFtO+Ee8xVjAGypqhE/c3BdQeImDDykQi+kzQC
   e8yLfIjORg3qJWOuier21JIbe574rT6IhEJWIt5sbCW6AhpU4Le7wqUH5
   KC3N1JvhEtBXTs4ZG0Ru991LZ5R3Jcy4cHVZc3YsbbvbHX3PeGlz5ZyZk
   DY2Y3AgHFHlu7KvR+IOGV8aGUGHktkYsVXn+nuFfyF6DcC8+Hu0T0zD+n
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="379626616"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="379626616"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 14:48:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="691074707"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="691074707"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 05 Sep 2023 14:48:57 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qddup-00027V-18;
	Tue, 05 Sep 2023 21:48:55 +0000
Date: Wed, 6 Sep 2023 05:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:master 1075/1123] drivers/usb/dwc3/core.c:2164:
 undefined reference to `ulpi_write'
Message-ID: <202309060506.ru9YZ8E6-lkp@intel.com>
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
head:   cb1f2dbc7e487361688257fccf78bf3f3ce0e9ed
commit: 9e004927e608d30e05d67689ad398e05be969dc6 [1075/1123] usb: dwc3: core: Add support for disabling vbus when suspended
config: i386-randconfig-012-20230905 (https://download.01.org/0day-ci/archive/20230906/202309060506.ru9YZ8E6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060506.ru9YZ8E6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060506.ru9YZ8E6-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/usb/dwc3/core.o: in function `dwc3_suspend_common':
>> drivers/usb/dwc3/core.c:2164: undefined reference to `ulpi_write'
   ld: drivers/usb/dwc3/core.o: in function `dwc3_resume_common':
   drivers/usb/dwc3/core.c:2248: undefined reference to `ulpi_write'


vim +2164 drivers/usb/dwc3/core.c

  2148	
  2149	static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
  2150	{
  2151		unsigned long	flags;
  2152		u32 reg;
  2153	
  2154		switch (dwc->current_dr_role) {
  2155		case DWC3_GCTL_PRTCAP_DEVICE:
  2156			if (pm_runtime_suspended(dwc->dev))
  2157				break;
  2158			dwc3_gadget_suspend(dwc);
  2159			synchronize_irq(dwc->irq_gadget);
  2160			dwc3_core_exit(dwc);
  2161			break;
  2162		case DWC3_GCTL_PRTCAP_HOST:
  2163			if (!device_wakeup_path(dwc->dev) && dwc->ulpi)
> 2164				ulpi_write(dwc->ulpi, ULPI_OTG_CTRL_CLEAR,
  2165					   OTG_CTRL_DRVVBUS_OFFSET);
  2166	
  2167			if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
  2168				dwc3_core_exit(dwc);
  2169				break;
  2170			}
  2171	
  2172			/* Let controller to suspend HSPHY before PHY driver suspends */
  2173			if (dwc->dis_u2_susphy_quirk ||
  2174			    dwc->dis_enblslpm_quirk) {
  2175				reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
  2176				reg |=  DWC3_GUSB2PHYCFG_ENBLSLPM |
  2177					DWC3_GUSB2PHYCFG_SUSPHY;
  2178				dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), reg);
  2179	
  2180				/* Give some time for USB2 PHY to suspend */
  2181				usleep_range(5000, 6000);
  2182			}
  2183	
  2184			phy_pm_runtime_put_sync(dwc->usb2_generic_phy);
  2185			phy_pm_runtime_put_sync(dwc->usb3_generic_phy);
  2186			break;
  2187		case DWC3_GCTL_PRTCAP_OTG:
  2188			/* do nothing during runtime_suspend */
  2189			if (PMSG_IS_AUTO(msg))
  2190				break;
  2191	
  2192			if (dwc->current_otg_role == DWC3_OTG_ROLE_DEVICE) {
  2193				spin_lock_irqsave(&dwc->lock, flags);
  2194				dwc3_gadget_suspend(dwc);
  2195				spin_unlock_irqrestore(&dwc->lock, flags);
  2196				synchronize_irq(dwc->irq_gadget);
  2197			}
  2198	
  2199			dwc3_otg_exit(dwc);
  2200			dwc3_core_exit(dwc);
  2201			break;
  2202		default:
  2203			/* do nothing */
  2204			break;
  2205		}
  2206	
  2207		/* Put the core into D3 state */
  2208		if (dwc->dwc3_pmu) {
  2209			int ret;
  2210	
  2211			ret = regulator_disable(dwc->dwc3_pmu);
  2212			if (ret) {
  2213				dev_err(dwc->dev,
  2214					"Failed to disable dwc3_pmu supply\n");
  2215				return ret;
  2216			}
  2217		}
  2218	
  2219		return 0;
  2220	}
  2221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
