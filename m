Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FC87867B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710241232; cv=none; b=Y/ABp7SkQyOI9wu7/ZkXZmgqRRmsm1+wySV++L6YvEjq9LG+xk79MpAM0MQ2SEuKckLjdhXjjI08Qcz7fY6BcXQgSx4gUtPs8Gsr7P5EYuRe8YWg/A1oDAFu2Jim89Io0sI9ku/eFTdN1qDFyAjqD2PPFo0hoHht7LkN3bdwv+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710241232; c=relaxed/simple;
	bh=GcJ65gi+sRU53pqKldHXiytZ6bvi7xIhdVe7BXudwTw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dvPI+gcfMkihY8XXmMPFJt3xTritBO+6WXh7PLY4svGdvIDbPaaV/WEYu0mGbrWcMxSEs+6zvTwWjg/Bb7IIFPBZXt1nZ9SrC6LA3nCJJHORtSa3n66NcS1u1gv3dcX0dUUNi1aFESGOY3BqWpSF53svYSyeJT2kvtIfNGZgcRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KAx0HKcT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KAx0HKcT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710241230; x=1741777230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GcJ65gi+sRU53pqKldHXiytZ6bvi7xIhdVe7BXudwTw=;
  b=KAx0HKcTdPdJvR9LPPD8QOd0vnYtcy5ulSe2T3BlTLu5fZLoMZwEAXDI
   1ljGn2IEOQLldeztC866a8X9/D5rshoScntNLKBBgS7BHNBiwtdpiA9nP
   vIJor5/Y22sWKLqI5zA2XKaciu2So9hCybjIYGydzIzAJVsaEBclF/mAH
   90tWOtwbbe75uPVCvpMuiC4hsQXeoZFg72cBa2WUqK0QLvDRwwFUk3Ltv
   FOILiEE0bx8tO/LbJtpwrPqisFOQG0t+Ow3pk/43RfqbcKi/6iQIEH4iS
   Ffad5eAXZwoT3xPMCnk+5Tq41fIoIlLNZluMgaAgEFiyKS2THTnjWgn+F
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="8760715"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="8760715"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 04:00:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="48947490"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Mar 2024 04:00:27 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjzrt-000A3o-1h;
	Tue, 12 Mar 2024 11:00:25 +0000
Date: Tue, 12 Mar 2024 19:00:11 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rmk-arm:clearfog 80/94]
 drivers/net/ethernet/marvell/mvgmac.c:174:55: error: 'MVNETA_GMAC_LINK_UP'
 undeclared; did you mean 'MVGMAC_LINK_UP'?
Message-ID: <202403121819.ExhV387x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm clearfog
head:   9d1640e5aae3e685888788662bb7b33adb457f13
commit: 4e45e1b969facc484006a6998cd4d3daadca4fe2 [80/94] net: mvneta: split out GMAC
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240312/202403121819.ExhV387x-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403121819.ExhV387x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403121819.ExhV387x-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/marvell/mvgmac.c: In function 'mvgmac_link_change':
>> drivers/net/ethernet/marvell/mvgmac.c:174:55: error: 'MVNETA_GMAC_LINK_UP' undeclared (first use in this function); did you mean 'MVGMAC_LINK_UP'?
     174 |         phylink_pcs_change(&gmac->pcs, !!(gmac_stat & MVNETA_GMAC_LINK_UP));
         |                                                       ^~~~~~~~~~~~~~~~~~~
         |                                                       MVGMAC_LINK_UP
   drivers/net/ethernet/marvell/mvgmac.c:174:55: note: each undeclared identifier is reported only once for each function it appears in


vim +174 drivers/net/ethernet/marvell/mvgmac.c

   169	
   170	void mvgmac_link_change(struct mvgmac *gmac)
   171	{
   172		u32 gmac_stat = readl_relaxed(gmac->base + GMAC_STATUS_REG);
   173	
 > 174		phylink_pcs_change(&gmac->pcs, !!(gmac_stat & MVNETA_GMAC_LINK_UP));
   175	}
   176	EXPORT_SYMBOL_GPL(mvgmac_link_change);
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
