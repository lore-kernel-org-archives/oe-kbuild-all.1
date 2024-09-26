Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E975C522A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 16:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727368058; cv=none; b=hez18rrGXbE2fMXC0GDp7KqZhfiNzIGjUbllbf22hhzMC11sfR+Hb5Wwm7ds9axwI+hm0QcpT8XQbBraFzd8R/expYmca9Rm4tQE4BDaDKPq5lr8tK3NAd9BYbtfZ+ddqXbwvhsktmQNADKHSLT4FHwRE/osh/6I2emxg6Gozi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727368058; c=relaxed/simple;
	bh=AD9BbJN250tRx80ZVYcP6ErmsRGSXHBwNXtzmDe2DfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vA3opJE1MmBne30BZ+ZnkfU9SNSiPgNSq90bwr7ftL1HOCflsuAVvXd+qNe+k+w5I9rgC/0mzKxIDGyAJ380EXYBYp6IZd0Q+i3VeAjL6hMdRzvWWYc+YA5ENUkzoie4w0qgveNB9JzZmA7sOrnBaDJBbuiXvScDJKv2MLAahSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Clb5lFAA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Clb5lFAA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727368056; x=1758904056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AD9BbJN250tRx80ZVYcP6ErmsRGSXHBwNXtzmDe2DfU=;
  b=Clb5lFAAYV0LTiydJ2TITNwIcV0NdQTLkeHP2M9iIC9rCZ3BopmTCZVm
   44ynGqWdomLkazumP85ZBKa7/cbtLV/VAc4zLnhkRng7Goj169Y7U13S/
   fJOs4/InTCfQqN04MNqqULouMW2XwbJRTKzzWWIy/6UL4tG3YZisSSm6B
   cMC03kCiZfiJmoweJinm86ltX/5YW1yTE4QLjpiTQJirVGFBXhSrdg6oc
   d5BG6g/bPtyYOX9AJQIr5zg8tPCLXrXkZIuxQQaCL+15SLjELlGrgEK5B
   dpSBhf8eoGYbk/udfew4kXZuI9JmVQDJ6gM3Z2YYoZ+O9VuscYecAyiIe
   g==;
X-CSE-ConnectionGUID: +ycMfLSOTv2qYNQ+qeD8fQ==
X-CSE-MsgGUID: V2qzIt4lTTWArIIW4Tr3Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37062779"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="37062779"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 09:27:34 -0700
X-CSE-ConnectionGUID: tyvRWy6qR06vVyUck0M/CA==
X-CSE-MsgGUID: lOtCjtRnS826XXGlLjosbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="77146769"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Sep 2024 09:27:32 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1strL0-000Kvv-0z;
	Thu, 26 Sep 2024 16:27:30 +0000
Date: Fri, 27 Sep 2024 00:26:40 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [esmil:d1-6.11.y 38/47]
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:411:9: sparse: sparse: dereference of
 noderef expression
Message-ID: <202409270009.HCTBZYuM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux d1-6.11.y
head:   d99b769766ff1b1ced32d8d279d28e581e02fa9d
commit: 9138f6343e92d64026f76f1e0b5bccb5fc3d342d [38/47] [HACK] drm/sun4i: Copy in BSP code for D1 HDMI PHY
config: hexagon-randconfig-r111-20240926 (https://download.01.org/0day-ci/archive/20240927/202409270009.HCTBZYuM-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce: (https://download.01.org/0day-ci/archive/20240927/202409270009.HCTBZYuM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409270009.HCTBZYuM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:411:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:412:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:413:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:414:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:415:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:417:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:421:26: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:432:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:435:26: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:446:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:447:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:448:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:449:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:450:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:454:26: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:479:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:482:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:483:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:484:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:485:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:486:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:487:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:488:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:489:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:490:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:491:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:492:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:493:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:494:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:495:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:498:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:499:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:500:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:501:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:502:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:503:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:504:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:505:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:506:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:507:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:508:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:511:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:512:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:513:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:514:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:515:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:516:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:518:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:519:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:520:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:521:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:522:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:523:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:527:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:527:38: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:528:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:528:38: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:529:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:529:38: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:530:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:530:38: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:535:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:536:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:537:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:538:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:539:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:540:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:541:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:546:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:547:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:548:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:549:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:550:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:557:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:558:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:559:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:560:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:561:9: sparse: sparse: dereference of noderef expression

vim +411 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c

   403	
   404	static int sun20i_d1_hdmi_phy_enable(volatile struct __aw_phy_reg_t __iomem *phy_base)
   405	{
   406		int i = 0, status = 0;
   407	
   408		pr_info("enter %s\n", __func__);
   409	
   410		//enib -> enldo -> enrcal -> encalog -> enbi[3:0] -> enck -> enp2s[3:0] -> enres -> enresck -> entx[3:0]
 > 411		phy_base->phy_ctl4.bits.reg_slv = 4;     //low power voltage 1.08V, default is 3, set 4 as well as pll_ctl0 bit [24:26]
   412		phy_base->phy_ctl5.bits.enib = 1;
   413		phy_base->phy_ctl0.bits.enldo = 1;
   414		phy_base->phy_ctl0.bits.enldo_fs = 1;
   415		phy_base->phy_ctl5.bits.enrcal = 1;
   416	
   417		phy_base->phy_ctl5.bits.encalog = 1;
   418	
   419		for (i = 0; i < AW_PHY_TIMEOUT; i++) {
   420			udelay(5);
   421			status = phy_base->phy_pll_sts.bits.phy_rcalend2d_status;
   422			if (status & 0x1) {
   423				pr_info("[%s]:phy_rcalend2d_status\n", __func__);
   424				break;
   425			}
   426		}
   427		if ((i == AW_PHY_TIMEOUT) && !status) {
   428			pr_err("phy_rcalend2d_status Timeout !\n");
   429			return -1;
   430		}
   431	
   432		phy_base->phy_ctl0.bits.enbi = 0xF;
   433		for (i = 0; i < AW_PHY_TIMEOUT; i++) {
   434			udelay(5);
   435			status = phy_base->phy_pll_sts.bits.pll_lock_status;
   436			if (status & 0x1) {
   437				pr_info("[%s]:pll_lock_status\n", __func__);
   438				break;
   439			}
   440		}
   441		if ((i == AW_PHY_TIMEOUT) && !status) {
   442			pr_err("pll_lock_status Timeout! status = 0x%x\n", status);
   443			return -1;
   444		}
   445	
   446		phy_base->phy_ctl0.bits.enck = 1;
   447		phy_base->phy_ctl5.bits.enp2s = 0xF;
   448		phy_base->phy_ctl5.bits.enres = 1;
   449		phy_base->phy_ctl5.bits.enresck = 1;
   450		phy_base->phy_ctl0.bits.entx = 0xF;
   451	
   452		for (i = 0; i < AW_PHY_TIMEOUT; i++) {
   453			udelay(5);
   454			status = phy_base->phy_pll_sts.bits.tx_ready_dly_status;
   455			if (status & 0x1) {
   456				pr_info("[%s]:tx_ready_status\n", __func__);
   457				break;
   458			}
   459		}
   460		if ((i == AW_PHY_TIMEOUT) && !status) {
   461			pr_err("tx_ready_status Timeout ! status = 0x%x\n", status);
   462			return -1;
   463		}
   464	
   465		return 0;
   466	}
   467	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
