Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DAF1D131D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 02:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724983488; cv=none; b=IE666FgKVX01rl/NWPzmmOCZ/xDgBKyMF8wtpBIDyaVgdA3XUcG0LwkU+soy5mjcuq8uWRoA8GvI/muJiAYDOABbelgFpEPWx2CyuZIgXnEZFEtYv+sY6fQRwvVzvyhUBy4BfgENlVAnzdmp+cAOctnw2F9n56LXlHmrFoDbuQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724983488; c=relaxed/simple;
	bh=XEki+8PyYjzyI5U8CiyZYNIotUqvXNU2b2Lb/fcwcyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pt4CSKZrJCaAgYsG8XS7/i50w22pOyAObmM90Dp5Bv4Z2ghNt5ieKD6+swFVzDduU7PdoyQHfnG+8aJax01rmgW4ax/7/sthcdZiUOcV5PG04Pym/NqWp59rQAs52ih6F9qCucS+k6vYSyo+FSit4rqDFI3ndDQG9qS0t9FeKM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJPq9riR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJPq9riR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724983487; x=1756519487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XEki+8PyYjzyI5U8CiyZYNIotUqvXNU2b2Lb/fcwcyg=;
  b=kJPq9riRNrdnz66965PJGfBpRUi5LpaY/z88vSEHRuMv6O3TydtSzlDH
   1MRtvE5ykmD+FkxJcl+EWrInUSLQPy8icPiLUBPHklgMWDqdLTpivNnfp
   KuBO1rShpOdjcHJ4tEfcXvPWSmEa1jOoiZpnPyh+7JT8PI1gDya7zMF34
   XcQSbSz3ex+Eg/B8ygEE8tLORUf0+y27ZdwXaHPtBxcj9Yj4NUZNJ8eak
   qqYdrcGcSySQ2pmIRZ1tcEj93HyWWlx6s3wthAU8/JUzNbvulQp/7slmL
   MbF60Ay5Mkj0PqGejEBZavE099QzL8JXIsncrbfuQzC6SFbS4anePQiYR
   Q==;
X-CSE-ConnectionGUID: uUcAY/mvSi+djtANF9Fd5A==
X-CSE-MsgGUID: iWh1l4ZBTPe+mOaXjjPIHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23183228"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="23183228"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 19:04:47 -0700
X-CSE-ConnectionGUID: b1BtpFlFQW2qUQW5FImfwQ==
X-CSE-MsgGUID: zkXcG0P4QXmVB+RVbqvpcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="68592360"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Aug 2024 19:04:45 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjr0E-0000ta-2f;
	Fri, 30 Aug 2024 02:04:42 +0000
Date: Fri, 30 Aug 2024 10:04:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, sanglipeng1 <sanglipeng1@jd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29847/30000]
 drivers/usb/dwc2/core_intr.c:404:10: error: no member named 'bus_suspended'
 in 'struct dwc2_hsotg'
Message-ID: <202408300929.COp4KmgY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   612ca815b0690e93478c183deedf7a66dd5633ca
commit: cae57e806b90cecf7f322a6a37de4fb422f1ea60 [29847/30000] usb: dwc2: gadget: LPM flow fix
config: x86_64-randconfig-076-20240829 (https://download.01.org/0day-ci/archive/20240830/202408300929.COp4KmgY-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408300929.COp4KmgY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408300929.COp4KmgY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/dwc2/core_intr.c:404:10: error: no member named 'bus_suspended' in 'struct dwc2_hsotg'
     404 |                 hsotg->bus_suspended = false;
         |                 ~~~~~  ^
   1 error generated.


vim +404 drivers/usb/dwc2/core_intr.c

   340	
   341	/**
   342	 * dwc2_wakeup_from_lpm_l1 - Exit the device from LPM L1 state
   343	 *
   344	 * @hsotg: Programming view of DWC_otg controller
   345	 *
   346	 */
   347	void dwc2_wakeup_from_lpm_l1(struct dwc2_hsotg *hsotg, bool remotewakeup)
   348	{
   349		u32 glpmcfg;
   350		u32 pcgctl;
   351		u32 dctl;
   352	
   353		if (hsotg->lx_state != DWC2_L1) {
   354			dev_err(hsotg->dev, "Core isn't in DWC2_L1 state\n");
   355			return;
   356		}
   357	
   358		glpmcfg = dwc2_readl(hsotg, GLPMCFG);
   359		if (dwc2_is_device_mode(hsotg)) {
   360			dev_dbg(hsotg->dev, "Exit from L1 state, remotewakeup=%d\n", remotewakeup);
   361			glpmcfg &= ~GLPMCFG_ENBLSLPM;
   362			glpmcfg &= ~GLPMCFG_HIRD_THRES_MASK;
   363			dwc2_writel(hsotg, glpmcfg, GLPMCFG);
   364	
   365			pcgctl = dwc2_readl(hsotg, PCGCTL);
   366			pcgctl &= ~PCGCTL_ENBL_SLEEP_GATING;
   367			dwc2_writel(hsotg, pcgctl, PCGCTL);
   368	
   369			glpmcfg = dwc2_readl(hsotg, GLPMCFG);
   370			if (glpmcfg & GLPMCFG_ENBESL) {
   371				glpmcfg |= GLPMCFG_RSTRSLPSTS;
   372				dwc2_writel(hsotg, glpmcfg, GLPMCFG);
   373			}
   374	
   375			if (remotewakeup) {
   376				if (dwc2_hsotg_wait_bit_set(hsotg, GLPMCFG, GLPMCFG_L1RESUMEOK, 1000)) {
   377					dev_warn(hsotg->dev, "%s: timeout GLPMCFG_L1RESUMEOK\n", __func__);
   378					goto fail;
   379					return;
   380				}
   381	
   382				dctl = dwc2_readl(hsotg, DCTL);
   383				dctl |= DCTL_RMTWKUPSIG;
   384				dwc2_writel(hsotg, dctl, DCTL);
   385	
   386				if (dwc2_hsotg_wait_bit_set(hsotg, GINTSTS, GINTSTS_WKUPINT, 1000)) {
   387					dev_warn(hsotg->dev, "%s: timeout GINTSTS_WKUPINT\n", __func__);
   388					goto fail;
   389					return;
   390				}
   391			}
   392	
   393			glpmcfg = dwc2_readl(hsotg, GLPMCFG);
   394			if (glpmcfg & GLPMCFG_COREL1RES_MASK || glpmcfg & GLPMCFG_SLPSTS ||
   395			    glpmcfg & GLPMCFG_L1RESUMEOK) {
   396				goto fail;
   397				return;
   398			}
   399	
   400			/* Inform gadget to exit from L1 */
   401			call_gadget(hsotg, resume);
   402			/* Change to L0 state */
   403			hsotg->lx_state = DWC2_L0;
 > 404			hsotg->bus_suspended = false;
   405	fail:		dwc2_gadget_init_lpm(hsotg);
   406		} else {
   407			/* TODO */
   408			dev_err(hsotg->dev, "Host side LPM is not supported.\n");
   409			return;
   410		}
   411	}
   412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
