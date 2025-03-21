Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FEDC13B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 00:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742518662; cv=none; b=rGH9knQDtD/4CS491ZspvizgSF5+SGUj95HUfyhTe7eanPiGYw+zcjRr/t6beWAxLs1u2TSJNvX0ZLN1eiCRgEfhpLPT/GvIpLHhbsMzCTlOPpSvxnf99ZJKGsCM/uKGLsCdntsIb+yATHydeQZfvEhqh0AQP76AD5w7xG9HtOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742518662; c=relaxed/simple;
	bh=K3D18yOw+CrtLhJwZU3ssiJ8uolaLR6gM335e5imsp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z1w0fdkNQIZCSk71LtjDbEBBzORJUPObNBltV+uSPPTrcxuc1s/Eb23lF6ZGcZjbllxiozGwa7RHG+1Jmhr0FiIdDGck+StOs8SiD8+1Q/lx1g2cjvWU3dtg3QaWXuawQfVVM0oeZIVE0dT6eMKfBW735foM5jwmhdVyVxA5jcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eSovJIvV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eSovJIvV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742518657; x=1774054657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K3D18yOw+CrtLhJwZU3ssiJ8uolaLR6gM335e5imsp8=;
  b=eSovJIvVEWL3zGzaG3lJDsSbQh9NX0UgorlLbi1eNgj6OtTPpz3+mPhd
   18HRP6vENRBBL4MQ/Nk+A8/BbEMz4ggd+s8vXH1rxR0UVqgyrPBSVMwbA
   rJx0VJeRUq2BJTFuXWpC5mcN8N5+RNmzNgr8jN/0aHuR7tNZSZUBZUHZt
   nASjrfv696ul0ct/YLt0sgE70fh4Imv5Tvz/A9yDdifw7ntjVUBUxqQs0
   WDgd4nJDgtYXZtzbJ/oBMeWXiu1eb9r+qbwV3KKopMvFoU1S5XKH4yRvP
   sj7RcHBQzszWMyNAcMmbDHQEWtXrMugGdNSlQx5uNL1krtBOmGTLedk17
   Q==;
X-CSE-ConnectionGUID: EZVWFuWUSSejqm31ii3Qcw==
X-CSE-MsgGUID: sciAOQvmTDCH6/tXUpHqjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43787330"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="43787330"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 17:57:37 -0700
X-CSE-ConnectionGUID: PGy+qct7T1aFdHqNY0K30Q==
X-CSE-MsgGUID: g/UHt48cTsaBUPBwj64bYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="127942089"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 20 Mar 2025 17:57:35 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvQhZ-0000u3-31;
	Fri, 21 Mar 2025 00:57:33 +0000
Date: Fri, 21 Mar 2025 08:56:48 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Kubiak <michal.kubiak@intel.com>
Subject: [alobakin:libeth 14/16] drivers/net/ethernet/intel/idpf/xdp.c:357:1:
 warning: 'static' is not at beginning of declaration
Message-ID: <202503210858.FmNjOQGd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux libeth
head:   af0bd281376a224f466440508ba6a17ebe4ae0ad
commit: 22a26f973e9f391d46318e0768a9ca9a546e25ac [14/16] idpf: add support for XDP on Rx
config: powerpc-randconfig-002-20250321 (https://download.01.org/0day-ci/archive/20250321/202503210858.FmNjOQGd-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210858.FmNjOQGd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503210858.FmNjOQGd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/xdp.c:357:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    LIBETH_XDP_DEFINE_TIMER(static idpf_xdp_tx_timer, idpf_clean_xdp_irq);
    ^~~~~~~~~~~~~~~~~~~~~~~


vim +/static +357 drivers/net/ethernet/intel/idpf/xdp.c

   355	
   356	LIBETH_XDP_DEFINE_START();
 > 357	LIBETH_XDP_DEFINE_TIMER(static idpf_xdp_tx_timer, idpf_clean_xdp_irq);
   358	LIBETH_XDP_DEFINE_FLUSH_TX(idpf_xdp_tx_flush_bulk, idpf_xdp_tx_prep,
   359				   idpf_xdp_tx_xmit);
   360	LIBETH_XDP_DEFINE_END();
   361	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
