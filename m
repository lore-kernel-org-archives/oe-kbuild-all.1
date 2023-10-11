Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29C6D51A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 05:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VOkVyOqP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697002900; x=1728538900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sE2pG4kZB/fzpwQwvpXOz3nCJwJ5WOzLJE6uaFjj60U=;
  b=VOkVyOqPFW73bSW8RMgyt50KI/pGDT0OVF61fJ+mXK3X63t/ivMGLwJF
   HNpPSOnAloOvcRnGXYytYfuJ4HyVxArS5lNqx1NxiFS7FL/IZFvLzODOn
   9n6Li2oNmRyrZytYkmZV8xGvpZ5dJ0VOZ519ap82y7j/w45mD5eCAw51J
   me9bExpvR5bPWq9NhkyytQOCQbbZqAH06liE6bh4nR3CYxWekswYVQ/Hy
   HQCPlnkoSjv6/AAUzumaRHg6JvgEVyMn6nQHGxQISBoHtbvvduHgdwylw
   xzhbWHzpcZvYM+v2a/OqljMPNOX2Sp4A+9VTkBtuqrLDj96YV+t7NRNtB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="451076446"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="451076446"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 22:41:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="703605144"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="703605144"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 10 Oct 2023 22:41:35 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqRyO-0001mf-2z;
	Wed, 11 Oct 2023 05:41:32 +0000
Date: Wed, 11 Oct 2023 13:40:44 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Narani <manish.narani@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:pr/146 11930/14527]
 drivers/usb/dwc3/gadget_hibernation.c:383: warning: Function parameter or
 member '_dwc' not described in 'dwc3_gadget_exit_hibernation'
Message-ID: <202310111301.DiF8Nlc9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Manish,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx pr/146
head:   38b0c0cf11566882cda99f8e4f2243924a684be5
commit: 719080ff0022e05bb4cb8043d62739feebcd8dbc [11930/14527] usb: dwc3: gadget: Add hibernation support when operating in gadget mode
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231011/202310111301.DiF8Nlc9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310111301.DiF8Nlc9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310111301.DiF8Nlc9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/dwc3/gadget_hibernation.c:16: warning: cannot understand function prototype: 'u32 save_reg_addr[] = '
   drivers/usb/dwc3/gadget_hibernation.c:74: warning: Function parameter or member 'epnum' not described in 'restart_ep0_trans'
>> drivers/usb/dwc3/gadget_hibernation.c:383: warning: Function parameter or member '_dwc' not described in 'dwc3_gadget_exit_hibernation'
>> drivers/usb/dwc3/gadget_hibernation.c:383: warning: Excess function parameter 'dwc' description in 'dwc3_gadget_exit_hibernation'


vim +383 drivers/usb/dwc3/gadget_hibernation.c

   377	
   378	/**
   379	 * dwc3_gadget_exit_hibernation - Interrupt handler of wakeup
   380	 * @dwc: pointer to our controller context structure
   381	 */
   382	void dwc3_gadget_exit_hibernation(void *_dwc)
 > 383	{
   384		struct dwc3 *dwc = (struct dwc3 *)(_dwc);
   385	
   386		u32 reg, link_state;
   387		int ret, retries;
   388		bool enter_hiber = false;
   389	
   390		/* On USB 2.0 we observed back to back wakeup interrupts */
   391		if (!dwc->is_hibernated) {
   392			dev_dbg(dwc->dev, "Not in hibernated state\n");
   393			goto err;
   394		}
   395	
   396		restore_regs(dwc);
   397	
   398		/* Initialize the core and restore the saved registers */
   399		dwc3_core_init(dwc);
   400	
   401		/* ask controller to save the non-sticky registers */
   402		reg = dwc3_readl(dwc->regs, DWC3_DCTL);
   403		reg |= DWC3_DCTL_CRS;
   404		dwc3_writel(dwc->regs, DWC3_DCTL, reg);
   405	
   406		/* Wait till non-sticky registers are restored */
   407		retries = DWC3_NON_STICKY_RESTORE_RETRIES;
   408		do {
   409			reg = dwc3_readl(dwc->regs, DWC3_DSTS);
   410			if (!(reg & DWC3_DSTS_RSS))
   411				break;
   412	
   413			udelay(DWC3_NON_STICKY_RESTORE_DELAY);
   414		} while (--retries);
   415	
   416		if (retries < 0 || (reg & DWC3_DSTS_SRE)) {
   417			dev_err(dwc->dev, "Failed to restore non-sticky regs\n");
   418			goto err;
   419		}
   420	
   421		/* restore ep0 endpoints */
   422		ret = restore_ep0(dwc);
   423		if (ret) {
   424			dev_err(dwc->dev, "Failed in restorig EP0 states\n");
   425			goto err;
   426		}
   427	
   428		/* start the controller */
   429		ret = dwc3_gadget_run_stop(dwc, true, false);
   430		if (ret < 0) {
   431			dev_err(dwc->dev, "USB core failed to start on wakeup\n");
   432			goto err;
   433		}
   434	
   435		/* Wait until device controller is ready */
   436		retries = DWC3_DEVICE_CTRL_READY_RETRIES;
   437		while (--retries) {
   438			reg = dwc3_readl(dwc->regs, DWC3_DSTS);
   439			if (reg & DWC3_DSTS_DCNRD)
   440				udelay(DWC3_DEVICE_CTRL_READY_DELAY);
   441			else
   442				break;
   443		}
   444	
   445		if (retries < 0) {
   446			dev_err(dwc->dev, "USB core failed to restore controller\n");
   447			goto err;
   448		}
   449	
   450		/*
   451		 * As some suprious signals also cause wakeup event, wait for some time
   452		 * and check the link state to confirm if the wakeup signal is real
   453		 */
   454		udelay(10);
   455	
   456		link_state = dwc3_gadget_get_link_state(dwc);
   457	
   458		/* check if the link state is in a valid state */
   459		switch (link_state) {
   460		case DWC3_LINK_STATE_RESET:
   461			/* Reset devaddr */
   462			reg = dwc3_readl(dwc->regs, DWC3_DCFG);
   463			reg &= ~(DWC3_DCFG_DEVADDR_MASK);
   464			dwc3_writel(dwc->regs, DWC3_DCFG, reg);
   465	
   466			/* issue recovery on the link */
   467			ret = dwc3_gadget_set_link_state(dwc, DWC3_LINK_STATE_RECOV);
   468			if (ret < 0) {
   469				dev_err(dwc->dev,
   470					"Failed to set link state to Recovery\n");
   471				goto err;
   472			}
   473	
   474			break;
   475	
   476		case DWC3_LINK_STATE_SS_DIS:
   477			/* Clear keep connect from reconnecting to HOST */
   478			reg = dwc3_readl(dwc->regs, DWC3_DCTL);
   479			reg &= ~DWC3_DCTL_KEEP_CONNECT;
   480			dwc3_writel(dwc->regs, DWC3_DCTL, reg);
   481			/* fall through */
   482		case DWC3_LINK_STATE_U3:
   483			/* Ignore wakeup event as the link is still in U3 state */
   484			dev_dbg(dwc->dev, "False wakeup event %d\n", link_state);
   485	
   486			if (!dwc->force_hiber_wake)
   487				enter_hiber = true;
   488			break;
   489	
   490		default:
   491			/* issue recovery on the link */
   492			ret = dwc3_gadget_set_link_state(dwc, DWC3_LINK_STATE_RECOV);
   493			if (ret < 0) {
   494				dev_err(dwc->dev,
   495					"Failed to set link state to Recovery\n");
   496				goto err;
   497			}
   498	
   499			break;
   500		}
   501	
   502		if (link_state != DWC3_LINK_STATE_SS_DIS) {
   503			/* Restore non EP0 EPs */
   504			ret = restore_eps(dwc);
   505			if (ret) {
   506				dev_err(dwc->dev, "Failed restoring non-EP0 states\n");
   507				goto err;
   508			}
   509		}
   510	
   511		/* clear the flag */
   512		dwc->is_hibernated = false;
   513	
   514		if (enter_hiber) {
   515			/*
   516			 * as the wakeup was because of the spurious signals,
   517			 * enter hibernation again
   518			 */
   519			dwc3_gadget_enter_hibernation(dwc);
   520			return;
   521		}
   522	
   523		dev_dbg(dwc->dev, "We are back from hibernation!\n");
   524		return;
   525	
   526	err:
   527		dev_err(dwc->dev, "Fail in handling Wakeup Interrupt\n");
   528		return;
   529	}
   530	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
