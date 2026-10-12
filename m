Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70840372EF0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 04:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791778094; cv=none; b=L8t6TF+QyxFJuIYEjX6FY2YzkY8tlRJISbeLVeJWHsW4Mx5Oou87t9xmHj52p6Y5xL0Ak5JFSKFAMao7qR0ZLp2Fmbpey9IWJrdqrQU3ktQ4W0s4PR80E/0UKrASm53ul/InKlrXNsQDxtzhahR7q2HuEZaBxsJlRfWJG4YWc50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791778094; c=relaxed/simple;
	bh=cNh3w0O0bFU7CypXhFldgjjIbTil15btNptYzSIAIag=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oUDQdALSKYP00ALRn9dtx6okEwvU7a/Vyr2o6V3Zb2JD0TbN02UYkMKtk1kx18sghuOdJe7drw8UZjdci/u/6vKz5472Uo9Il1nMjqzk6AONGcuD4mdY2GpVusBC0zqEbGHfCXebfbiJ3dc2y6YiK9fEDw9Rv1uFNMeTSUyqSHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Njp4srro; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Njp4srro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791778093; x=1823314093;
  h=date:from:to:cc:subject:message-id;
  bh=cNh3w0O0bFU7CypXhFldgjjIbTil15btNptYzSIAIag=;
  b=Njp4srroVTRLYI0mMCk2poOWpKCMfAGseA7IG0Peb35JFUgM/fblMFe2
   /JJXffK9wNvchpE9ZngIuRDQ7SRh0c5LlYeS3rlyPQByIl/TWvSsRzPxb
   1DGfRrFt68dJ1KN01iBcyLAjwJ60Wpj5vn9UgqlmB/UAWSBts2/ollKjT
   lAbC1gGqEPYpmaOZxcnzL4o45pH0eKdq3V+rhdLcRuUC3aRdsFEs/0+OR
   8xz8c8VWo1KF8l82aWGIQufYzGEQgSffiXPPF0tCqOjHvQRfhvbxKSaj8
   8WfX8rA0mM5oPGp6QM/tf8YzSwI+IHSlobQIJ9ClF12hxifrM7asUBQcK
   Q==;
X-CSE-ConnectionGUID: RpDAhK/yRWyBm3a7cvPTJw==
X-CSE-MsgGUID: VpOpTLXcQH6j6aK9iJI4tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="377381"
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="377381"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 21:08:12 -0700
X-CSE-ConnectionGUID: Bm/GK10dTwuxgkPahhTlSQ==
X-CSE-MsgGUID: 6yBaajK3QHme1hoWTHq53w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="753521"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 11 Oct 2026 21:08:11 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xG7Ka-000000009th-0gPl;
	Mon, 12 Oct 2026 04:08:08 +0000
Date: Mon, 12 Oct 2026 06:07:17 +0200
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [drm-msm:msm-next 18/18]
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c:720:28: sparse: sparse: symbol
 'x285_limits_tbl' was not declared. Should it be static?
Message-ID: <202610120625.SzvjsUVZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next
head:   d024361c631b3f020a26c07d683e5103404b0fbf
commit: d024361c631b3f020a26c07d683e5103404b0fbf [18/18] drm/msm/a6xx: Split out a7xx/a8xx device tables
config: sparc-randconfig-r2303-20261012 (https://download.01.org/0day-ci/archive/20261012/202610120625.SzvjsUVZ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610120625.SzvjsUVZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610120625.SzvjsUVZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/msm/adreno/a8xx_catalog.c:720:28: sparse: sparse: symbol 'x285_limits_tbl' was not declared. Should it be static?
>> drivers/gpu/drm/msm/adreno/a8xx_catalog.c:1113:28: sparse: sparse: symbol 'a840_limits_tbl' was not declared. Should it be static?

vim +/x285_limits_tbl +720 drivers/gpu/drm/msm/adreno/a8xx_catalog.c

   719	
 > 720	struct a6xx_hfi_limits_tbl x285_limits_tbl[] = {
   721		{
   722			.feature_id = GMU_MIT_IFF,
   723			.domain = GMU_GX_DOMAIN,
   724			.feature_rev = 0,
   725			.cfg = {
   726				.enable = 1,
   727				.msg_path = 0,
   728				.lkg_en = 0,
   729				.mode = 0,
   730				.sid = 12,
   731				.mit_time = 5,
   732				.curr_limit = 18000,
   733			},
   734		},
   735		{
   736			.feature_id = GMU_MIT_IFF,
   737			.domain = GMU_MX_DOMAIN,
   738			.feature_rev = 0,
   739			.cfg = {
   740				.enable = 1,
   741				.msg_path = 0,
   742				.lkg_en = 0,
   743				.mode = 0,
   744				.sid = 18,
   745				.mit_time = 2000,
   746				.curr_limit = 6000,
   747			},
   748		},
   749		{
   750			.feature_id = GMU_MIT_PCLX,
   751			.domain = GMU_GX_DOMAIN,
   752			.feature_rev = 0,
   753			.cfg = {
   754				.enable = 1,
   755				.msg_path = 0,
   756				.lkg_en = 0,
   757				.mode = 0,
   758				.sid = 6,
   759				.mit_time = 3,
   760				.curr_limit = 66000,
   761			},
   762		},
   763		{
   764			.feature_id = GMU_MIT_PCLX,
   765			.domain = GMU_MX_DOMAIN,
   766			.feature_rev = 0,
   767			.cfg = {
   768				.enable = 0,
   769				.msg_path = 0,
   770				.lkg_en = 0,
   771				.mode = 0,
   772				.sid = 6,
   773				.mit_time = 3,
   774				.curr_limit = 18000,
   775			},
   776		},
   777	};
   778	DECLARE_ADRENO_LIMITS_TABLE(x285_limits);
   779	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
