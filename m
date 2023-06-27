Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783261308B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jun 2023 19:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687894638; x=1719430638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wgyCfSddnSQbPwbxs/P5WjxSDpQdbH4hk+KK+yjnJMM=;
  b=J5sKuW3z/t4VQmK8b2/LlZeyfT0l41nMzuD3IJBdP+wdLyakshyDP+/G
   ScgL+zBRxhtFzueDDF+h8nzSwTgxCyyZv02kpETGKQPjJP9vfxOAWf8Pg
   wP/egCZBrqk08jy7qUewNvjMxWfG6tkVP1w709R0qraZHfOedooderuse
   DqtDYfAE3+MEtVTCgEIoHUNkkca3Pdf7QOqqeD7BRy3Ls4Rrebcb063tM
   ofRC7BGWaK7YYdkpBtQ65g+enOk6EZL3qUrq7DcGT81rMNWY+vmR73Ag3
   HAAsXpH8EUXwwyDDZwBUJZM1Ejk9jitebmCz+f/JOieCNcnkwFzKl8MDR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="392295466"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="392295466"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 12:37:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="963325375"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="963325375"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Jun 2023 12:37:16 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEEV1-000C9x-1q;
	Tue, 27 Jun 2023 19:37:15 +0000
Date: Wed, 28 Jun 2023 03:37:07 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 05/10] usb: dwc3: core: Refactor PHY logic to support
 Multiport Controller
Message-ID: <202306280340.7mq13HUk-lkp@intel.com>
References: <20230621043628.21485-6-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621043628.21485-6-quic_kriskura@quicinc.com>

Hi Krishna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus robh/for-next linus/master v6.4]
[cannot apply to next-20230627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Kurapati/dt-bindings-usb-qcom-dwc3-Add-bindings-for-SC8280-Multiport/20230621-124117
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230621043628.21485-6-quic_kriskura%40quicinc.com
patch subject: [PATCH v9 05/10] usb: dwc3: core: Refactor PHY logic to support Multiport Controller
config: arm-randconfig-m041-20230627 (https://download.01.org/0day-ci/archive/20230628/202306280340.7mq13HUk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306280340.7mq13HUk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306280340.7mq13HUk-lkp@intel.com/

New smatch warnings:
drivers/usb/dwc3/core.c:2239 dwc3_resume_common() warn: inconsistent indenting

Old smatch warnings:
drivers/usb/dwc3/core.c:501 dwc3_alloc_event_buffers() warn: passing a valid pointer to 'PTR_ERR'

vim +2239 drivers/usb/dwc3/core.c

  2202	
  2203	static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
  2204	{
  2205		unsigned long	flags;
  2206		int		ret;
  2207		u32		reg;
  2208		int		i;
  2209	
  2210		switch (dwc->current_dr_role) {
  2211		case DWC3_GCTL_PRTCAP_DEVICE:
  2212			ret = dwc3_core_init_for_resume(dwc);
  2213			if (ret)
  2214				return ret;
  2215	
  2216			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE);
  2217			dwc3_gadget_resume(dwc);
  2218			break;
  2219		case DWC3_GCTL_PRTCAP_HOST:
  2220			if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
  2221				ret = dwc3_core_init_for_resume(dwc);
  2222				if (ret)
  2223					return ret;
  2224				dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
  2225				break;
  2226			}
  2227			/* Restore GUSB2PHYCFG bits that were modified in suspend */
  2228			 for (i = 0; i < dwc->num_usb2_ports; i++) {
  2229				reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(i));
  2230				if (dwc->dis_u2_susphy_quirk)
  2231					reg &= ~DWC3_GUSB2PHYCFG_SUSPHY;
  2232	
  2233				if (dwc->dis_enblslpm_quirk)
  2234					reg &= ~DWC3_GUSB2PHYCFG_ENBLSLPM;
  2235	
  2236				dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(i), reg);
  2237			}
  2238	
> 2239			for (i = 0; i < dwc->num_usb2_ports; i++) {
  2240				phy_pm_runtime_get_sync(dwc->usb2_generic_phy[i]);
  2241				phy_pm_runtime_get_sync(dwc->usb3_generic_phy[i]);
  2242			}
  2243			break;
  2244		case DWC3_GCTL_PRTCAP_OTG:
  2245			/* nothing to do on runtime_resume */
  2246			if (PMSG_IS_AUTO(msg))
  2247				break;
  2248	
  2249			ret = dwc3_core_init_for_resume(dwc);
  2250			if (ret)
  2251				return ret;
  2252	
  2253			dwc3_set_prtcap(dwc, dwc->current_dr_role);
  2254	
  2255			dwc3_otg_init(dwc);
  2256			if (dwc->current_otg_role == DWC3_OTG_ROLE_HOST) {
  2257				dwc3_otg_host_init(dwc);
  2258			} else if (dwc->current_otg_role == DWC3_OTG_ROLE_DEVICE) {
  2259				spin_lock_irqsave(&dwc->lock, flags);
  2260				dwc3_gadget_resume(dwc);
  2261				spin_unlock_irqrestore(&dwc->lock, flags);
  2262			}
  2263	
  2264			break;
  2265		default:
  2266			/* do nothing */
  2267			break;
  2268		}
  2269	
  2270		return 0;
  2271	}
  2272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
