Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DC51547C7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Aug 2024 08:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724918454; cv=none; b=Cemm0JbTi668yUXbxbxBOVjpUdrhDcf0R97T+h0pnrEgJuDIUZfCHsC9xixEG/ha7CbJMGYMP75shdKzIr4YrT6hjXxeZfHgcmwaCklLNJLYy7WJacHidcNC4E/ZC8fJfm6H912JCFB8YuZBfgdXW9EHYkovavBwDS3jDt9MX4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724918454; c=relaxed/simple;
	bh=lBFMwaF5XsuQDJLJ4wI9KG7U0AIHTD6K0fXvDT9yfeI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ss7oSC8i/wFXrNEZy0BFo1WDEzm3k1NQK6UP4iJYTvOD81Dfc657dPMhOFUfDf7jiWMwg+jU6qMKLWjJBXfwGSJVnsmM/xDHNjLf4i4zoEj8tB8E7sqKWs2/dngNeQH13dsTE90IaNmJT80SC4Gnra0g6LnEDNW4Msk+yd46cBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fiixTQEh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fiixTQEh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724918453; x=1756454453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lBFMwaF5XsuQDJLJ4wI9KG7U0AIHTD6K0fXvDT9yfeI=;
  b=fiixTQEhN0eZcy1WHZWrdNAO8BQ2frIJTuZh50IIW/O7UeyYCoxUljWX
   B2cVhSl3eM+2eRzTQkLdxzB3N9nUf3+D/+anpD/KNewNIVTlaJTeklYoB
   JNZi8XTRKcaUe9aZRhi1QfKUsPGJNsawcd9RM6vUvEiTfiTtn82tf2Zne
   xD0TVSlOCYBGKmHCbK72YEmcu9NRH6tYFxdZuS+K2uvOMcNVSEqdzhoeb
   Gu05pubNmL8Plgs+r3EYIhc1Q5P+dUWM3ahWdkcghFVutYLFCr289sO2s
   Ea0FLlay+0aamox/nLUwRxz23rpKUbT0pgvlT0IGtn7nbM6xbXmeXbYq/
   A==;
X-CSE-ConnectionGUID: JD3IGIHsThifWi1SX5ADqA==
X-CSE-MsgGUID: qP7Z3SglQtmu/9YaYSU7fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23006093"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="23006093"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 01:00:52 -0700
X-CSE-ConnectionGUID: RAiu/apyTyCN14g9kafogA==
X-CSE-MsgGUID: UWli57DWTqypfyVgOzQjhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="64181439"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Aug 2024 01:00:51 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sja5I-000LsU-33;
	Thu, 29 Aug 2024 08:00:48 +0000
Date: Thu, 29 Aug 2024 16:00:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, sanglipeng1 <sanglipeng1@jd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29859/30000]
 drivers/usb/dwc2/core_intr.c:404:22: error: 'struct dwc2_hsotg' has no
 member named 'bus_suspended'
Message-ID: <202408291511.CoEgpYo7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   9c002e226526016292b0c1d3dbed7ebc4e3e71d6
commit: cae57e806b90cecf7f322a6a37de4fb422f1ea60 [29859/30000] usb: dwc2: gadget: LPM flow fix
config: x86_64-randconfig-101-20240829 (https://download.01.org/0day-ci/archive/20240829/202408291511.CoEgpYo7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408291511.CoEgpYo7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408291511.CoEgpYo7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/dwc2/core_intr.c: In function 'dwc2_wakeup_from_lpm_l1':
>> drivers/usb/dwc2/core_intr.c:404:22: error: 'struct dwc2_hsotg' has no member named 'bus_suspended'
     404 |                 hsotg->bus_suspended = false;
         |                      ^~


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
