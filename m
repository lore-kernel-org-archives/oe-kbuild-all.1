Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8EC7AE53
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 11:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707393403; cv=none; b=sjAxKYUqFL7o8SeBansz7+q/G2mvqvttfvXmzXaunM7LaNC8yPt8JACTm/wmlDw2+3XsZJkLqYqwnYLepuB5pAe2w22byPquU4Tv7WD/hzXp3d6UdOfuyml2m46DW0tQcjwsOe8gWYCeUiIWmVllZ552QiOgx5zmzrnCc2j82kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707393403; c=relaxed/simple;
	bh=KkJqE5tNPXG6c6GRcF3WagrV1otnRs72gfDJ2XhSv8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DpzV25+iFZcPv2bvZH3A0FP2xrArv9MyIes30VAUdhQrOhM9R/CkHA7kSbQYtvBdZAeuFZgjBVrQ35Dty7BYlVJ/84jvT9p0g6//KzqpVxZZ0Jcvzf8cunGMhWTxnOo6bzqvXPrUsL+OqY3vy6hTM9V3XpXr8Gh2abdIsZ5wmpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwFe83LO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwFe83LO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707393402; x=1738929402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KkJqE5tNPXG6c6GRcF3WagrV1otnRs72gfDJ2XhSv8s=;
  b=dwFe83LOMcOEUcAin7RKK3ONe32mZQyy9fxB3y8sBLclZ8a9bA3UOm+V
   eSKvUvpSIbGszYdRc3WMarLiaD4VmvwPna64uMuKcAqQs0UceJ6+KufuZ
   BcqAJitlcpiVH3/GG6Ei1dzCjs+AzWPE6JSlK6/dxx6xpUDwuLUZ5b4BF
   iY+8IjXdcT+5Zs60lyOh3wm89vffO8o0xnWM8JL4jnDsntutJKX/XfJWv
   Sgbt9woVL/+t7mLjcKn75dozgfnUDpKX/TzjKol6C79WkIaEpu4hbI53A
   y9Bmyrr5lYakxR6Kbzya99KTfgEHm9LxQ+RYZIIAdXZelX1pM4YgHzY2F
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1089006"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1089006"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 03:56:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="6265116"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Feb 2024 03:56:40 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY31B-0003ii-2Y;
	Thu, 08 Feb 2024 11:56:37 +0000
Date: Thu, 8 Feb 2024 19:56:12 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [esmil:d1-6.8.y 40/50] drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:411:9:
 sparse: sparse: dereference of noderef expression
Message-ID: <202402081907.58BgAgue-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux d1-6.8.y
head:   f3b6698ac10e7f6528408bda7d8d162065a44af1
commit: eb6eef918e6778e8dee90830c0a9be33f7ab9510 [40/50] [HACK] drm/sun4i: Copy in BSP code for D1 HDMI PHY
config: arc-randconfig-r132-20240208 (https://download.01.org/0day-ci/archive/20240208/202402081907.58BgAgue-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240208/202402081907.58BgAgue-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402081907.58BgAgue-lkp@intel.com/

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
