Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633DB1F03EE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 08:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739262946; cv=none; b=u1dHUQ/x4SC5l7lXMynKH13iymefTzYMG/zoQK8F7ed8LLwqRxR98hNhaQolfW9V0OZ/WyZp4jNrvAcsKWH7gdpxRgo5J/9apiLma1UbLt27daBb9l0fa5jsvrPR7Ycx26oAxaWEeO4XNf24q16Ivzq6b/kLTJ0a8SUGN7tTHis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739262946; c=relaxed/simple;
	bh=Ix028SckBZgdnnboEkqBM1VVOG5dAGn+1S0RPIcRj8U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T3Sm++ZWh1B27fWAMHD4C4ven2bLolar2mVDdVRtK4RGh8UhtFyk2rU7rIwBN9+alW+E5Z4ioF4fcFzAablYqMksSYPWgEjcJ++i1i+Eg+y36DMAHZaOjATwViMmQAsjBuVZJqjAp4qeFk5L82x8XpZodh57ZJM0mwufTQxgdLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dPLM4sm/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPLM4sm/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739262944; x=1770798944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ix028SckBZgdnnboEkqBM1VVOG5dAGn+1S0RPIcRj8U=;
  b=dPLM4sm/mIwEyM2xAiV/XQgxw2aOknjVFcTI3i/S5Ypv6Oaph9dIutJf
   U9oglaniSqNjJWob+nfXWyXsWr4SCf8D9eILoEh+EZTrR0gHGdIN74dOj
   c63nkGa/9QiYqSs1CSKXtd9/gqK8HmMqz89UdvJL/oL2uAlVSfZPB2Z0S
   Xu2e7A1k2VvUepkoMYBfC6o2zDClaaNgse1tUZJwHSEMe+W6GGhP4FMFR
   Jk95Lxs4poU7UIe8/tI3fIcfJwC9aQlqNvIZMwMIemTv0CdUyPJAc4eJz
   S3k79FWLnAXsHi2usJ9JGKNi3dOoh2R3gtHuC/xiSTWBnWWUY5AdWVDnQ
   Q==;
X-CSE-ConnectionGUID: b+TY+gs2R3ObFcCibbDeIQ==
X-CSE-MsgGUID: 9jFljJFlQTi5RaYwZDbE/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51298795"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51298795"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 00:35:41 -0800
X-CSE-ConnectionGUID: CUORJArNR3ifLF/lO0xeWg==
X-CSE-MsgGUID: fzGxy3OIR3mM49eWjKCkzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116529455"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Feb 2025 00:35:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thlk1-0013vc-2I;
	Tue, 11 Feb 2025 08:35:37 +0000
Date: Tue, 11 Feb 2025 16:35:34 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:582:6-8:
 opportunity for str_enabled_disabled(on)
Message-ID: <202502111616.xnebdSv1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   febbc555cf0fff895546ddb8ba2c9a523692fb55
commit: 8e7620726beb800d6806dbe7bf0b8cc13c1feb97 net: stmmac: Introduce dwmac1000 ptp_clock_info and operations
date:   3 months ago
config: csky-randconfig-r051-20250211 (https://download.01.org/0day-ci/archive/20250211/202502111616.xnebdSv1-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502111616.xnebdSv1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:582:6-8: opportunity for str_enabled_disabled(on)

vim +582 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c

   557	
   558	int dwmac1000_ptp_enable(struct ptp_clock_info *ptp,
   559				 struct ptp_clock_request *rq, int on)
   560	{
   561		struct stmmac_priv *priv =
   562		    container_of(ptp, struct stmmac_priv, ptp_clock_ops);
   563		void __iomem *ptpaddr = priv->ptpaddr;
   564		int ret = -EOPNOTSUPP;
   565		u32 tcr_val;
   566	
   567		switch (rq->type) {
   568		case PTP_CLK_REQ_EXTTS:
   569			mutex_lock(&priv->aux_ts_lock);
   570			tcr_val = readl(ptpaddr + PTP_TCR);
   571	
   572			if (on) {
   573				tcr_val |= GMAC_PTP_TCR_ATSEN0;
   574				tcr_val |= GMAC_PTP_TCR_ATSFC;
   575				priv->plat->flags |= STMMAC_FLAG_EXT_SNAPSHOT_EN;
   576			} else {
   577				tcr_val &= ~GMAC_PTP_TCR_ATSEN0;
   578				priv->plat->flags &= ~STMMAC_FLAG_EXT_SNAPSHOT_EN;
   579			}
   580	
   581			netdev_dbg(priv->dev, "Auxiliary Snapshot %s.\n",
 > 582				   on ? "enabled" : "disabled");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
