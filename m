Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20233FD15E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 08:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538350; cv=none; b=GcEEsxfPEw76kjri4VuSSjWHNmT6Ls0WcLkr0sD0UQZiEQBmeZEcXVKua5//W28328woM2q9i5gzNWBB/hcH+Yf++ZoDwOSgTNqYfRItE/5qvXirgwuzrwdZMurNFs2i8e0FrEE/JyRUBE0exwsEnJvVMxm7VayS5+ikmnQgB+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538350; c=relaxed/simple;
	bh=EZLt/Q61F81pIpBCsEKQfytPppKMJHW/eNWAnbnIRr0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OFHbbfk6UjGGEaAWUEPE9sktUCwux54nk/lYwDBQVC0VWJEaKBmG1Gjvu+9C2s7+gKmS/75KsiwibZICo3UquN/ezAsmrETkSG4lbAIf0ScbNU2Wvs4cGRT/9NFTkow6B9jbR0HvEs6a7dUrP/Zmt5TZE2YwVHhK7ZIKDVEkNP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B32nxKNH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B32nxKNH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777538347; x=1809074347;
  h=date:from:to:cc:subject:message-id;
  bh=EZLt/Q61F81pIpBCsEKQfytPppKMJHW/eNWAnbnIRr0=;
  b=B32nxKNHtV557pV1U18MXqN9AFi+4a1v19z0DDfV4YBUCRMjivuXaJwe
   fXaxr6dMNR9pa25OGqRfwv5vU7lg7yPTymP8XOYu3N3ag0gH/sHwmNnhj
   gx+O3tj4yQHymk764aCJm8DYwUa1BiwqzzlPNfqAdw6OrEjr2u/g4N7hU
   QfJymZ3gAorbceW3aQI2hIllhkGimTWbgPjZnxBj5sWxGT71XfMXlf1FR
   T/Mix+b89OzhRpt51x36wn4PWTw4HTcdLkznZp36D1AES9Y+J/C+lD3Kh
   Csq9CYk9yYSMnPMUp4LDgJYhScLeChyKYxK+HmzVp1fJzb25/pOq0I0uU
   w==;
X-CSE-ConnectionGUID: yGWq31CeTPyGPQ1bKgkqbw==
X-CSE-MsgGUID: D6BKM0+rQ/ewsowmJEmKgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="77509318"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="77509318"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 01:39:07 -0700
X-CSE-ConnectionGUID: oUFSPaQ5QJa/ruw2AwbWhQ==
X-CSE-MsgGUID: uoOxnY+rQcW0cftG/QWLCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="238494766"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Apr 2026 01:39:05 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIMvG-00000000CAe-0ZlJ;
	Thu, 30 Apr 2026 08:39:02 +0000
Date: Thu, 30 Apr 2026 16:38:21 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
 Kishon <kishon@ti.com>, Dmitry Baryshkov <lumag@kernel.org>
Subject: [phy:phy_7.2 26/27] drivers/usb/dwc3/dwc3-imx.c:74:3: error:
 implicit declaration of function 'device_property_read_bool'; did you mean
 'device_store_bool'?
Message-ID: <202604301628.FO3dQRui-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git phy_7.2
head:   d097a6ebab1ffe9286cca190fe74d51b01d80dc3
commit: 9ed7a91a68cbba256d1a53c353bf6c62c7e056f0 [26/27] phy: remove temporary provider compatibility from consumer header
config: arm-randconfig-001 (https://download.01.org/0day-ci/archive/20260430/202604301628.FO3dQRui-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301628.FO3dQRui-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301628.FO3dQRui-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/usb/dwc3/dwc3-imx.c: In function 'dwc3_imx_get_property':
>> drivers/usb/dwc3/dwc3-imx.c:74:3: error: implicit declaration of function 'device_property_read_bool'; did you mean 'device_store_bool'? [-Werror=implicit-function-declaration]
      device_property_read_bool(dev, "fsl,permanently-attached");
      ^~~~~~~~~~~~~~~~~~~~~~~~~
      device_store_bool
   drivers/usb/dwc3/dwc3-imx.c: At top level:
>> drivers/usb/dwc3/dwc3-imx.c:184:36: error: array type has incomplete element type 'struct property_entry'
    static const struct property_entry dwc3_imx_properties[] = {
                                       ^~~~~~~~~~~~~~~~~~~
>> drivers/usb/dwc3/dwc3-imx.c:185:2: error: implicit declaration of function 'PROPERTY_ENTRY_BOOL' [-Werror=implicit-function-declaration]
     PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk"),
     ^~~~~~~~~~~~~~~~~~~
>> drivers/usb/dwc3/dwc3-imx.c:190:21: error: variable 'dwc3_imx_swnode' has initializer but incomplete type
    static const struct software_node dwc3_imx_swnode = {
                        ^~~~~~~~~~~~~
>> drivers/usb/dwc3/dwc3-imx.c:191:3: error: 'const struct software_node' has no member named 'properties'
     .properties = dwc3_imx_properties,
      ^~~~~~~~~~
>> drivers/usb/dwc3/dwc3-imx.c:191:16: warning: excess elements in struct initializer
     .properties = dwc3_imx_properties,
                   ^~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc3/dwc3-imx.c:191:16: note: (near initialization for 'dwc3_imx_swnode')
   drivers/usb/dwc3/dwc3-imx.c: In function 'dwc3_imx_probe':
>> drivers/usb/dwc3/dwc3-imx.c:255:8: error: implicit declaration of function 'device_add_software_node'; did you mean 'device_add_of_node'? [-Werror=implicit-function-declaration]
     ret = device_add_software_node(dev, &dwc3_imx_swnode);
           ^~~~~~~~~~~~~~~~~~~~~~~~
           device_add_of_node
>> drivers/usb/dwc3/dwc3-imx.c:272:3: error: implicit declaration of function 'device_remove_software_node'; did you mean 'device_remove_of_node'? [-Werror=implicit-function-declaration]
      device_remove_software_node(dev);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
      device_remove_of_node
   drivers/usb/dwc3/dwc3-imx.c: At top level:
>> drivers/usb/dwc3/dwc3-imx.c:190:35: error: storage size of 'dwc3_imx_swnode' isn't known
    static const struct software_node dwc3_imx_swnode = {
                                      ^~~~~~~~~~~~~~~
>> drivers/usb/dwc3/dwc3-imx.c:184:36: warning: 'dwc3_imx_properties' defined but not used [-Wunused-variable]
    static const struct property_entry dwc3_imx_properties[] = {
                                       ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +74 drivers/usb/dwc3/dwc3-imx.c

76fc9452a6bfb6 Xu Yang 2026-02-12   68  
76fc9452a6bfb6 Xu Yang 2026-02-12   69  static void dwc3_imx_get_property(struct dwc3_imx *dwc_imx)
76fc9452a6bfb6 Xu Yang 2026-02-12   70  {
76fc9452a6bfb6 Xu Yang 2026-02-12   71  	struct device	*dev = dwc_imx->dev;
76fc9452a6bfb6 Xu Yang 2026-02-12   72  
76fc9452a6bfb6 Xu Yang 2026-02-12   73  	dwc_imx->permanent_attached =
76fc9452a6bfb6 Xu Yang 2026-02-12  @74  		device_property_read_bool(dev, "fsl,permanently-attached");
76fc9452a6bfb6 Xu Yang 2026-02-12   75  	dwc_imx->disable_pwr_ctrl =
76fc9452a6bfb6 Xu Yang 2026-02-12   76  		device_property_read_bool(dev, "fsl,disable-port-power-control");
76fc9452a6bfb6 Xu Yang 2026-02-12   77  	dwc_imx->overcur_active_low =
76fc9452a6bfb6 Xu Yang 2026-02-12   78  		device_property_read_bool(dev, "fsl,over-current-active-low");
76fc9452a6bfb6 Xu Yang 2026-02-12   79  	dwc_imx->power_active_low =
76fc9452a6bfb6 Xu Yang 2026-02-12   80  		device_property_read_bool(dev, "fsl,power-active-low");
76fc9452a6bfb6 Xu Yang 2026-02-12   81  }
76fc9452a6bfb6 Xu Yang 2026-02-12   82  
76fc9452a6bfb6 Xu Yang 2026-02-12   83  static void dwc3_imx_configure_glue(struct dwc3_imx *dwc_imx)
76fc9452a6bfb6 Xu Yang 2026-02-12   84  {
76fc9452a6bfb6 Xu Yang 2026-02-12   85  	u32		value;
76fc9452a6bfb6 Xu Yang 2026-02-12   86  
76fc9452a6bfb6 Xu Yang 2026-02-12   87  	if (!dwc_imx->glue_base)
76fc9452a6bfb6 Xu Yang 2026-02-12   88  		return;
76fc9452a6bfb6 Xu Yang 2026-02-12   89  
76fc9452a6bfb6 Xu Yang 2026-02-12   90  	value = readl(dwc_imx->glue_base + USB_CTRL0);
76fc9452a6bfb6 Xu Yang 2026-02-12   91  
76fc9452a6bfb6 Xu Yang 2026-02-12   92  	if (dwc_imx->permanent_attached)
76fc9452a6bfb6 Xu Yang 2026-02-12   93  		value |= USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED;
76fc9452a6bfb6 Xu Yang 2026-02-12   94  	else
76fc9452a6bfb6 Xu Yang 2026-02-12   95  		value &= ~(USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);
76fc9452a6bfb6 Xu Yang 2026-02-12   96  
76fc9452a6bfb6 Xu Yang 2026-02-12   97  	if (dwc_imx->disable_pwr_ctrl)
76fc9452a6bfb6 Xu Yang 2026-02-12   98  		value &= ~USB_CTRL0_PORTPWR_EN;
76fc9452a6bfb6 Xu Yang 2026-02-12   99  	else
76fc9452a6bfb6 Xu Yang 2026-02-12  100  		value |= USB_CTRL0_PORTPWR_EN;
76fc9452a6bfb6 Xu Yang 2026-02-12  101  
76fc9452a6bfb6 Xu Yang 2026-02-12  102  	writel(value, dwc_imx->glue_base + USB_CTRL0);
76fc9452a6bfb6 Xu Yang 2026-02-12  103  
76fc9452a6bfb6 Xu Yang 2026-02-12  104  	value = readl(dwc_imx->glue_base + USB_CTRL1);
76fc9452a6bfb6 Xu Yang 2026-02-12  105  	if (dwc_imx->overcur_active_low)
76fc9452a6bfb6 Xu Yang 2026-02-12  106  		value |= USB_CTRL1_OC_POLARITY;
76fc9452a6bfb6 Xu Yang 2026-02-12  107  	else
76fc9452a6bfb6 Xu Yang 2026-02-12  108  		value &= ~USB_CTRL1_OC_POLARITY;
76fc9452a6bfb6 Xu Yang 2026-02-12  109  
76fc9452a6bfb6 Xu Yang 2026-02-12  110  	if (dwc_imx->power_active_low)
76fc9452a6bfb6 Xu Yang 2026-02-12  111  		value |= USB_CTRL1_PWR_POLARITY;
76fc9452a6bfb6 Xu Yang 2026-02-12  112  	else
76fc9452a6bfb6 Xu Yang 2026-02-12  113  		value &= ~USB_CTRL1_PWR_POLARITY;
76fc9452a6bfb6 Xu Yang 2026-02-12  114  
76fc9452a6bfb6 Xu Yang 2026-02-12  115  	writel(value, dwc_imx->glue_base + USB_CTRL1);
76fc9452a6bfb6 Xu Yang 2026-02-12  116  }
76fc9452a6bfb6 Xu Yang 2026-02-12  117  
76fc9452a6bfb6 Xu Yang 2026-02-12  118  static void dwc3_imx_wakeup_enable(struct dwc3_imx *dwc_imx, pm_message_t msg)
76fc9452a6bfb6 Xu Yang 2026-02-12  119  {
76fc9452a6bfb6 Xu Yang 2026-02-12  120  	struct dwc3	*dwc = &dwc_imx->dwc;
76fc9452a6bfb6 Xu Yang 2026-02-12  121  	u32		val;
76fc9452a6bfb6 Xu Yang 2026-02-12  122  
76fc9452a6bfb6 Xu Yang 2026-02-12  123  	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
76fc9452a6bfb6 Xu Yang 2026-02-12  124  
76fc9452a6bfb6 Xu Yang 2026-02-12  125  	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST && dwc->xhci) {
76fc9452a6bfb6 Xu Yang 2026-02-12  126  		val |= USB_WAKEUP_EN | USB_WAKEUP_DPDM_EN;
76fc9452a6bfb6 Xu Yang 2026-02-12  127  		if (PMSG_IS_AUTO(msg))
76fc9452a6bfb6 Xu Yang 2026-02-12  128  			val |= USB_WAKEUP_SS_CONN | USB_WAKEUP_U3_EN;
76fc9452a6bfb6 Xu Yang 2026-02-12  129  	} else {
76fc9452a6bfb6 Xu Yang 2026-02-12  130  		val |= USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
76fc9452a6bfb6 Xu Yang 2026-02-12  131  		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
76fc9452a6bfb6 Xu Yang 2026-02-12  132  	}
76fc9452a6bfb6 Xu Yang 2026-02-12  133  
76fc9452a6bfb6 Xu Yang 2026-02-12  134  	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
76fc9452a6bfb6 Xu Yang 2026-02-12  135  }
76fc9452a6bfb6 Xu Yang 2026-02-12  136  
76fc9452a6bfb6 Xu Yang 2026-02-12  137  static void dwc3_imx_wakeup_disable(struct dwc3_imx *dwc_imx)
76fc9452a6bfb6 Xu Yang 2026-02-12  138  {
76fc9452a6bfb6 Xu Yang 2026-02-12  139  	u32	val;
76fc9452a6bfb6 Xu Yang 2026-02-12  140  
76fc9452a6bfb6 Xu Yang 2026-02-12  141  	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
76fc9452a6bfb6 Xu Yang 2026-02-12  142  	val &= ~(USB_WAKEUP_EN | USB_WAKEUP_EN_MASK);
76fc9452a6bfb6 Xu Yang 2026-02-12  143  	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
76fc9452a6bfb6 Xu Yang 2026-02-12  144  }
76fc9452a6bfb6 Xu Yang 2026-02-12  145  
76fc9452a6bfb6 Xu Yang 2026-02-12  146  static irqreturn_t dwc3_imx_interrupt(int irq, void *data)
76fc9452a6bfb6 Xu Yang 2026-02-12  147  {
76fc9452a6bfb6 Xu Yang 2026-02-12  148  	struct dwc3_imx	*dwc_imx = data;
76fc9452a6bfb6 Xu Yang 2026-02-12  149  	struct dwc3	*dwc = &dwc_imx->dwc;
76fc9452a6bfb6 Xu Yang 2026-02-12  150  
76fc9452a6bfb6 Xu Yang 2026-02-12  151  	if (!dwc_imx->pm_suspended)
76fc9452a6bfb6 Xu Yang 2026-02-12  152  		return IRQ_HANDLED;
76fc9452a6bfb6 Xu Yang 2026-02-12  153  
76fc9452a6bfb6 Xu Yang 2026-02-12  154  	disable_irq_nosync(dwc_imx->irq);
76fc9452a6bfb6 Xu Yang 2026-02-12  155  	dwc_imx->wakeup_pending = true;
76fc9452a6bfb6 Xu Yang 2026-02-12  156  
76fc9452a6bfb6 Xu Yang 2026-02-12  157  	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST && dwc->xhci)
76fc9452a6bfb6 Xu Yang 2026-02-12  158  		pm_runtime_resume(&dwc->xhci->dev);
76fc9452a6bfb6 Xu Yang 2026-02-12  159  	else if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
76fc9452a6bfb6 Xu Yang 2026-02-12  160  		pm_runtime_get(dwc->dev);
76fc9452a6bfb6 Xu Yang 2026-02-12  161  
76fc9452a6bfb6 Xu Yang 2026-02-12  162  	return IRQ_HANDLED;
76fc9452a6bfb6 Xu Yang 2026-02-12  163  }
76fc9452a6bfb6 Xu Yang 2026-02-12  164  
76fc9452a6bfb6 Xu Yang 2026-02-12  165  static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
76fc9452a6bfb6 Xu Yang 2026-02-12  166  {
76fc9452a6bfb6 Xu Yang 2026-02-12  167  	if (role == USB_ROLE_HOST)
76fc9452a6bfb6 Xu Yang 2026-02-12  168  		/*
76fc9452a6bfb6 Xu Yang 2026-02-12  169  		 * For xhci host, we need disable dwc core auto
76fc9452a6bfb6 Xu Yang 2026-02-12  170  		 * suspend, because during this auto suspend delay(5s),
76fc9452a6bfb6 Xu Yang 2026-02-12  171  		 * xhci host RUN_STOP is cleared and wakeup is not
76fc9452a6bfb6 Xu Yang 2026-02-12  172  		 * enabled, if device is inserted, xhci host can't
76fc9452a6bfb6 Xu Yang 2026-02-12  173  		 * response the connection.
76fc9452a6bfb6 Xu Yang 2026-02-12  174  		 */
76fc9452a6bfb6 Xu Yang 2026-02-12  175  		pm_runtime_dont_use_autosuspend(dwc->dev);
76fc9452a6bfb6 Xu Yang 2026-02-12  176  	else
76fc9452a6bfb6 Xu Yang 2026-02-12  177  		pm_runtime_use_autosuspend(dwc->dev);
76fc9452a6bfb6 Xu Yang 2026-02-12  178  }
76fc9452a6bfb6 Xu Yang 2026-02-12  179  
76fc9452a6bfb6 Xu Yang 2026-02-12  180  static struct dwc3_glue_ops dwc3_imx_glue_ops = {
76fc9452a6bfb6 Xu Yang 2026-02-12  181  	.pre_set_role = dwc3_imx_pre_set_role,
76fc9452a6bfb6 Xu Yang 2026-02-12  182  };
76fc9452a6bfb6 Xu Yang 2026-02-12  183  
76fc9452a6bfb6 Xu Yang 2026-02-12 @184  static const struct property_entry dwc3_imx_properties[] = {
76fc9452a6bfb6 Xu Yang 2026-02-12 @185  	PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk"),
76fc9452a6bfb6 Xu Yang 2026-02-12  186  	PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk"),
76fc9452a6bfb6 Xu Yang 2026-02-12  187  	{},
76fc9452a6bfb6 Xu Yang 2026-02-12  188  };
76fc9452a6bfb6 Xu Yang 2026-02-12  189  
76fc9452a6bfb6 Xu Yang 2026-02-12 @190  static const struct software_node dwc3_imx_swnode = {
76fc9452a6bfb6 Xu Yang 2026-02-12 @191  	.properties = dwc3_imx_properties,
76fc9452a6bfb6 Xu Yang 2026-02-12  192  };
76fc9452a6bfb6 Xu Yang 2026-02-12  193  
76fc9452a6bfb6 Xu Yang 2026-02-12  194  static int dwc3_imx_probe(struct platform_device *pdev)
76fc9452a6bfb6 Xu Yang 2026-02-12  195  {
76fc9452a6bfb6 Xu Yang 2026-02-12  196  	struct device		*dev = &pdev->dev;
76fc9452a6bfb6 Xu Yang 2026-02-12  197  	struct dwc3_imx		*dwc_imx;
76fc9452a6bfb6 Xu Yang 2026-02-12  198  	struct dwc3		*dwc;
76fc9452a6bfb6 Xu Yang 2026-02-12  199  	struct resource		*res;
76fc9452a6bfb6 Xu Yang 2026-02-12  200  	const char		*irq_name;
76fc9452a6bfb6 Xu Yang 2026-02-12  201  	struct dwc3_probe_data	probe_data = {};
76fc9452a6bfb6 Xu Yang 2026-02-12  202  	int			ret, irq;
76fc9452a6bfb6 Xu Yang 2026-02-12  203  
76fc9452a6bfb6 Xu Yang 2026-02-12  204  	dwc_imx = devm_kzalloc(dev, sizeof(*dwc_imx), GFP_KERNEL);
76fc9452a6bfb6 Xu Yang 2026-02-12  205  	if (!dwc_imx)
76fc9452a6bfb6 Xu Yang 2026-02-12  206  		return -ENOMEM;
76fc9452a6bfb6 Xu Yang 2026-02-12  207  
76fc9452a6bfb6 Xu Yang 2026-02-12  208  	platform_set_drvdata(pdev, dwc_imx);
76fc9452a6bfb6 Xu Yang 2026-02-12  209  	dwc_imx->dev = dev;
76fc9452a6bfb6 Xu Yang 2026-02-12  210  
76fc9452a6bfb6 Xu Yang 2026-02-12  211  	dwc3_imx_get_property(dwc_imx);
76fc9452a6bfb6 Xu Yang 2026-02-12  212  
76fc9452a6bfb6 Xu Yang 2026-02-12  213  	dwc_imx->blkctl_base = devm_platform_ioremap_resource_byname(pdev, "blkctl");
76fc9452a6bfb6 Xu Yang 2026-02-12  214  	if (IS_ERR(dwc_imx->blkctl_base))
76fc9452a6bfb6 Xu Yang 2026-02-12  215  		return PTR_ERR(dwc_imx->blkctl_base);
76fc9452a6bfb6 Xu Yang 2026-02-12  216  
76fc9452a6bfb6 Xu Yang 2026-02-12  217  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "glue");
76fc9452a6bfb6 Xu Yang 2026-02-12  218  	if (!res) {
76fc9452a6bfb6 Xu Yang 2026-02-12  219  		dev_warn(dev, "Base address for glue layer missing\n");
76fc9452a6bfb6 Xu Yang 2026-02-12  220  	} else {
76fc9452a6bfb6 Xu Yang 2026-02-12  221  		dwc_imx->glue_base = devm_ioremap_resource(dev, res);
76fc9452a6bfb6 Xu Yang 2026-02-12  222  		if (IS_ERR(dwc_imx->glue_base))
76fc9452a6bfb6 Xu Yang 2026-02-12  223  			return PTR_ERR(dwc_imx->glue_base);
76fc9452a6bfb6 Xu Yang 2026-02-12  224  	}
76fc9452a6bfb6 Xu Yang 2026-02-12  225  
76fc9452a6bfb6 Xu Yang 2026-02-12  226  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
76fc9452a6bfb6 Xu Yang 2026-02-12  227  	if (!res)
76fc9452a6bfb6 Xu Yang 2026-02-12  228  		return dev_err_probe(dev, -ENODEV, "missing core memory resource\n");
76fc9452a6bfb6 Xu Yang 2026-02-12  229  
76fc9452a6bfb6 Xu Yang 2026-02-12  230  	dwc_imx->hsio_clk = devm_clk_get_enabled(dev, "hsio");
76fc9452a6bfb6 Xu Yang 2026-02-12  231  	if (IS_ERR(dwc_imx->hsio_clk))
76fc9452a6bfb6 Xu Yang 2026-02-12  232  		return dev_err_probe(dev, PTR_ERR(dwc_imx->hsio_clk),
76fc9452a6bfb6 Xu Yang 2026-02-12  233  				     "Failed to get hsio clk\n");
76fc9452a6bfb6 Xu Yang 2026-02-12  234  
76fc9452a6bfb6 Xu Yang 2026-02-12  235  	dwc_imx->suspend_clk = devm_clk_get_enabled(dev, "suspend");
76fc9452a6bfb6 Xu Yang 2026-02-12  236  	if (IS_ERR(dwc_imx->suspend_clk))
76fc9452a6bfb6 Xu Yang 2026-02-12  237  		return dev_err_probe(dev, PTR_ERR(dwc_imx->suspend_clk),
76fc9452a6bfb6 Xu Yang 2026-02-12  238  				     "Failed to get suspend clk\n");
76fc9452a6bfb6 Xu Yang 2026-02-12  239  
76fc9452a6bfb6 Xu Yang 2026-02-12  240  	irq = platform_get_irq_byname(pdev, "wakeup");
76fc9452a6bfb6 Xu Yang 2026-02-12  241  	if (irq < 0)
76fc9452a6bfb6 Xu Yang 2026-02-12  242  		return irq;
76fc9452a6bfb6 Xu Yang 2026-02-12  243  	dwc_imx->irq = irq;
76fc9452a6bfb6 Xu Yang 2026-02-12  244  
76fc9452a6bfb6 Xu Yang 2026-02-12  245  	irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", dev_name(dev));
76fc9452a6bfb6 Xu Yang 2026-02-12  246  	if (!irq_name)
76fc9452a6bfb6 Xu Yang 2026-02-12  247  		return dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
76fc9452a6bfb6 Xu Yang 2026-02-12  248  
76fc9452a6bfb6 Xu Yang 2026-02-12  249  	ret = devm_request_threaded_irq(dev, irq, NULL, dwc3_imx_interrupt,
76fc9452a6bfb6 Xu Yang 2026-02-12  250  					IRQF_ONESHOT | IRQF_NO_AUTOEN,
76fc9452a6bfb6 Xu Yang 2026-02-12  251  					irq_name, dwc_imx);
76fc9452a6bfb6 Xu Yang 2026-02-12  252  	if (ret)
76fc9452a6bfb6 Xu Yang 2026-02-12  253  		return dev_err_probe(dev, ret, "failed to request IRQ #%d\n", irq);
76fc9452a6bfb6 Xu Yang 2026-02-12  254  
76fc9452a6bfb6 Xu Yang 2026-02-12 @255  	ret = device_add_software_node(dev, &dwc3_imx_swnode);
76fc9452a6bfb6 Xu Yang 2026-02-12  256  	if (ret)
76fc9452a6bfb6 Xu Yang 2026-02-12  257  		return dev_err_probe(dev, ret, "failed to add software node\n");
76fc9452a6bfb6 Xu Yang 2026-02-12  258  
76fc9452a6bfb6 Xu Yang 2026-02-12  259  	dwc3_imx_configure_glue(dwc_imx);
76fc9452a6bfb6 Xu Yang 2026-02-12  260  
76fc9452a6bfb6 Xu Yang 2026-02-12  261  	dwc = &dwc_imx->dwc;
76fc9452a6bfb6 Xu Yang 2026-02-12  262  	dwc->dev = dev;
76fc9452a6bfb6 Xu Yang 2026-02-12  263  	dwc->glue_ops = &dwc3_imx_glue_ops;
76fc9452a6bfb6 Xu Yang 2026-02-12  264  
76fc9452a6bfb6 Xu Yang 2026-02-12  265  	probe_data.res = res;
76fc9452a6bfb6 Xu Yang 2026-02-12  266  	probe_data.dwc = dwc;
76fc9452a6bfb6 Xu Yang 2026-02-12  267  	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
76fc9452a6bfb6 Xu Yang 2026-02-12  268  	probe_data.properties.needs_full_reinit = true;
76fc9452a6bfb6 Xu Yang 2026-02-12  269  
76fc9452a6bfb6 Xu Yang 2026-02-12  270  	ret = dwc3_core_probe(&probe_data);
76fc9452a6bfb6 Xu Yang 2026-02-12  271  	if (ret) {
76fc9452a6bfb6 Xu Yang 2026-02-12 @272  		device_remove_software_node(dev);
76fc9452a6bfb6 Xu Yang 2026-02-12  273  		return ret;
76fc9452a6bfb6 Xu Yang 2026-02-12  274  	}
76fc9452a6bfb6 Xu Yang 2026-02-12  275  
76fc9452a6bfb6 Xu Yang 2026-02-12  276  	device_set_wakeup_capable(dev, true);
76fc9452a6bfb6 Xu Yang 2026-02-12  277  	return 0;
76fc9452a6bfb6 Xu Yang 2026-02-12  278  }
76fc9452a6bfb6 Xu Yang 2026-02-12  279  

:::::: The code at line 74 was first introduced by commit
:::::: 76fc9452a6bfb63a297fa0410d5368a691ed411b usb: dwc3: introduce flatten model driver of i.MX Soc

:::::: TO: Xu Yang <xu.yang_2@nxp.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
