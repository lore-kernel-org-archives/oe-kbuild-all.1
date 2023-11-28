Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4441118B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Nov 2023 06:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QPxeIZpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701151792; x=1732687792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AkNFbi5luQqICXD4AnWLiatCH/9PPUKEbzMFIFCoWOU=;
  b=QPxeIZpwTHmigyZ2pBmjOeu3mJbomoz/4OfjeaA3lJQGz8thhpdFHz+f
   /K+4kQEwEWQtdffWLTwYmZFu5Y0o4v8h/Gdjocec9FVnGrlK51SzQZx5q
   +VKwJV8/P1AQaK8Z47+qvC1YQtHe0FH97ek4QRaq859JExg+b9y3cWeaT
   dtDgTeNTm9C5hdCAvWZu1E5XA/YAe5oPPqUVOW97HDjvJKGxuFcqgP1lK
   a+YzQVM+fvgeepCMYs+8N1WuuM5pmL0UfwQGwL002n1hA1C0DcKKD6ZRo
   qRfOloSzVTyOfy57vOFoXRrjdisDZe/WZ+0rF246ecdFzMUKfIwrkrLSL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="459360289"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="459360289"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 22:09:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="941819404"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="941819404"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Nov 2023 22:09:50 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7rI4-00076a-0K;
	Tue, 28 Nov 2023 06:09:48 +0000
Date: Tue, 28 Nov 2023 14:09:11 +0800
From: kernel test robot <lkp@intel.com>
To: Harsh Agarwal <quic_harshq@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [steev:lenovo-x13s-v6.7.0-rc3 59/88] drivers/usb/dwc3/core.c:2380
 dwc3_resume_common() warn: inconsistent indenting
Message-ID: <202311281239.3ufBuBDX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.7.0-rc3
head:   ecb02aa1a2217cd19532d7272a696382d1b4a8e0
commit: c58501fd8ae719afd74cc5e291e9a3b3efba9661 [59/88] usb: dwc3: core: Refactor PHY logic to support Multiport Controller
config: mips-randconfig-r081-20231128 (https://download.01.org/0day-ci/archive/20231128/202311281239.3ufBuBDX-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231128/202311281239.3ufBuBDX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311281239.3ufBuBDX-lkp@intel.com/

smatch warnings:
drivers/usb/dwc3/core.c:2380 dwc3_resume_common() warn: inconsistent indenting

vim +2380 drivers/usb/dwc3/core.c

  2343	
  2344	static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
  2345	{
  2346		unsigned long	flags;
  2347		int		ret;
  2348		u32		reg;
  2349		int		i;
  2350	
  2351		switch (dwc->current_dr_role) {
  2352		case DWC3_GCTL_PRTCAP_DEVICE:
  2353			ret = dwc3_core_init_for_resume(dwc);
  2354			if (ret)
  2355				return ret;
  2356	
  2357			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE);
  2358			dwc3_gadget_resume(dwc);
  2359			break;
  2360		case DWC3_GCTL_PRTCAP_HOST:
  2361			if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
  2362				ret = dwc3_core_init_for_resume(dwc);
  2363				if (ret)
  2364					return ret;
  2365				dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
  2366				break;
  2367			}
  2368			/* Restore GUSB2PHYCFG bits that were modified in suspend */
  2369			 for (i = 0; i < dwc->num_usb2_ports; i++) {
  2370				reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(i));
  2371				if (dwc->dis_u2_susphy_quirk)
  2372					reg &= ~DWC3_GUSB2PHYCFG_SUSPHY;
  2373	
  2374				if (dwc->dis_enblslpm_quirk)
  2375					reg &= ~DWC3_GUSB2PHYCFG_ENBLSLPM;
  2376	
  2377				dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(i), reg);
  2378			}
  2379	
> 2380			for (i = 0; i < dwc->num_usb2_ports; i++) {
  2381				phy_pm_runtime_get_sync(dwc->usb2_generic_phy[i]);
  2382				phy_pm_runtime_get_sync(dwc->usb3_generic_phy[i]);
  2383			}
  2384			break;
  2385		case DWC3_GCTL_PRTCAP_OTG:
  2386			/* nothing to do on runtime_resume */
  2387			if (PMSG_IS_AUTO(msg))
  2388				break;
  2389	
  2390			ret = dwc3_core_init_for_resume(dwc);
  2391			if (ret)
  2392				return ret;
  2393	
  2394			dwc3_set_prtcap(dwc, dwc->current_dr_role);
  2395	
  2396			dwc3_otg_init(dwc);
  2397			if (dwc->current_otg_role == DWC3_OTG_ROLE_HOST) {
  2398				dwc3_otg_host_init(dwc);
  2399			} else if (dwc->current_otg_role == DWC3_OTG_ROLE_DEVICE) {
  2400				spin_lock_irqsave(&dwc->lock, flags);
  2401				dwc3_gadget_resume(dwc);
  2402				spin_unlock_irqrestore(&dwc->lock, flags);
  2403			}
  2404	
  2405			break;
  2406		default:
  2407			/* do nothing */
  2408			break;
  2409		}
  2410	
  2411		return 0;
  2412	}
  2413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
