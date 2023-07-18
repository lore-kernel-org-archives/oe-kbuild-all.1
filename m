Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA63125D8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 16:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689697344; x=1721233344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aR2y2RvDrPdi89g8aHNpkO7v5Cb0Tr2apagqy/ciS0o=;
  b=cN3IuxnB5kTDidYo1hXYT67MxWj2ljQ2O9I1n0cwXPj8VS/nGfHbwRpW
   xlDLbrSpMDpntKj7oGj/mIsR1ZmG8r8eE8bDNF/B0j5bq/gueqf557yE9
   YTzXcS2y9D+AvSOGodeD19D5azrDQDa9o2BJSuo5MLEfJdk9XlU1NjRPC
   HK4hReDAkbrxDAH0QkQ2PDKtKtLYhn2RxdBxznaMAUZ7CFrK5hg0/2AfZ
   8KHrljKsN1MtQS1FWVsoOp8YZMUhVGumqHlFl8DQhxWG8V8iIWhVgdUy1
   sbDb76V0kuNgbJxYMBaPuMnDEcAVPDte1wRkP/p2T3z/RYKNwKpF+6NM1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="368893753"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="368893753"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 09:22:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="970291755"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="970291755"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 18 Jul 2023 09:22:22 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLnSv-0001GL-2y;
	Tue, 18 Jul 2023 16:22:21 +0000
Date: Wed, 19 Jul 2023 00:21:32 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>,
	Harsh Agarwal <quic_harshq@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [steev:lenovo-x13s-v6.5-rc2 84/120] drivers/usb/dwc3/core.c:2244
 dwc3_resume_common() warn: inconsistent indenting
Message-ID: <202307190035.GcuPhPf2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.5-rc2
head:   8e71e57ab12cd2d295c7e261e028f4650dcc4af9
commit: e02c3a8a3f0cd57ca97150d0a6ec9e4305de8632 [84/120] usb: dwc3: core: Refactor PHY logic to support Multiport Controller
config: i386-randconfig-m021-20230717 (https://download.01.org/0day-ci/archive/20230719/202307190035.GcuPhPf2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307190035.GcuPhPf2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307190035.GcuPhPf2-lkp@intel.com/

New smatch warnings:
drivers/usb/dwc3/core.c:2244 dwc3_resume_common() warn: inconsistent indenting

Old smatch warnings:
drivers/usb/dwc3/core.c:501 dwc3_alloc_event_buffers() warn: passing a valid pointer to 'PTR_ERR'

vim +2244 drivers/usb/dwc3/core.c

  2207	
  2208	static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
  2209	{
  2210		unsigned long	flags;
  2211		int		ret;
  2212		u32		reg;
  2213		int		i;
  2214	
  2215		switch (dwc->current_dr_role) {
  2216		case DWC3_GCTL_PRTCAP_DEVICE:
  2217			ret = dwc3_core_init_for_resume(dwc);
  2218			if (ret)
  2219				return ret;
  2220	
  2221			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE);
  2222			dwc3_gadget_resume(dwc);
  2223			break;
  2224		case DWC3_GCTL_PRTCAP_HOST:
  2225			if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
  2226				ret = dwc3_core_init_for_resume(dwc);
  2227				if (ret)
  2228					return ret;
  2229				dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
  2230				break;
  2231			}
  2232			/* Restore GUSB2PHYCFG bits that were modified in suspend */
  2233			 for (i = 0; i < dwc->num_usb2_ports; i++) {
  2234				reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(i));
  2235				if (dwc->dis_u2_susphy_quirk)
  2236					reg &= ~DWC3_GUSB2PHYCFG_SUSPHY;
  2237	
  2238				if (dwc->dis_enblslpm_quirk)
  2239					reg &= ~DWC3_GUSB2PHYCFG_ENBLSLPM;
  2240	
  2241				dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(i), reg);
  2242			}
  2243	
> 2244			for (i = 0; i < dwc->num_usb2_ports; i++) {
  2245				phy_pm_runtime_get_sync(dwc->usb2_generic_phy[i]);
  2246				phy_pm_runtime_get_sync(dwc->usb3_generic_phy[i]);
  2247			}
  2248			break;
  2249		case DWC3_GCTL_PRTCAP_OTG:
  2250			/* nothing to do on runtime_resume */
  2251			if (PMSG_IS_AUTO(msg))
  2252				break;
  2253	
  2254			ret = dwc3_core_init_for_resume(dwc);
  2255			if (ret)
  2256				return ret;
  2257	
  2258			dwc3_set_prtcap(dwc, dwc->current_dr_role);
  2259	
  2260			dwc3_otg_init(dwc);
  2261			if (dwc->current_otg_role == DWC3_OTG_ROLE_HOST) {
  2262				dwc3_otg_host_init(dwc);
  2263			} else if (dwc->current_otg_role == DWC3_OTG_ROLE_DEVICE) {
  2264				spin_lock_irqsave(&dwc->lock, flags);
  2265				dwc3_gadget_resume(dwc);
  2266				spin_unlock_irqrestore(&dwc->lock, flags);
  2267			}
  2268	
  2269			break;
  2270		default:
  2271			/* do nothing */
  2272			break;
  2273		}
  2274	
  2275		return 0;
  2276	}
  2277	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
