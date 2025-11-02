Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D1E225D6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 03:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762054919; cv=none; b=eSm3s1u8ey5uq5lUOwsS+b0gPK8/I+nXhE4LtnuC4ayvXflnlkyjSP5bEs8o1lFlSesWdqH2o7K0CgINwSvyf8RimMwss2tMLJKO33UMu2sqVEAsWU8XlK5BVlzlygKFByvPU5mcDysX3tjG4kwmWAcqMnJWJmLVYtwD64jYRSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762054919; c=relaxed/simple;
	bh=BlDc0Eyp6lPC0O/+vHjEJrw7NAmJ33oHGKFyL2urQAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uJYIm44yieI50X6pLWzM8oCU3TS/Hh61/pWvKhoMclVpfp+v4CMgK0TeJmYBNptT0ntRwtbKPRnJwSdLjl0A4MZtYyydWzZbj2qar/zB1G4a+xW1ZmnXF7ADvCoQTkiGzoA6BtZCsua1PzZX1R5mEs0Kasod+9vZ8rEagOYC3bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5jFazNv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5jFazNv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762054917; x=1793590917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BlDc0Eyp6lPC0O/+vHjEJrw7NAmJ33oHGKFyL2urQAY=;
  b=P5jFazNvT9dpW/VRlWaLtwETxXyrWWf/fWOruhLKbuCpxL9xDOi7oPaH
   OtXjYO9mRkmHdvBkur2+PA71PYRNGdfuGfhVvdOHG8x2ZUfgW+quuFXBd
   LZjbag2ims2lFMbMug4l2QP8vvi2fbGTQDO1r+hwM/9MYPiceJ1ZFVaq/
   8bCozvXcyz9jK6Z6uUwc6uUZ0Gs6zXZ1ysAVAnm7uY5EANPswCP7UpJ/E
   bmT0NGUl1Hk8hJZ6DM4TaS/AEP0rAD1jqmoinMUkAIoQtE0wizX35Scm+
   c6PVCRMLAehwbto4mcs4SSRSYivzkLTOSkcUYm6VlUpE+3g1eM4uJOAJj
   w==;
X-CSE-ConnectionGUID: 781v/akXQQ2rntnM4DAkjA==
X-CSE-MsgGUID: 2VNs56YnTy6V5MD58tzw6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="67824553"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="67824553"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 20:41:57 -0700
X-CSE-ConnectionGUID: UpdNf1czRnuTeVaVCQmDZA==
X-CSE-MsgGUID: RoG5zjv/ReKa/8W+7kIjHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="190652557"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 01 Nov 2025 20:41:56 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFOyX-000Oyo-2A;
	Sun, 02 Nov 2025 03:41:53 +0000
Date: Sun, 2 Nov 2025 11:41:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jonhunter:tegra/pmc 22/22] drivers/soc/tegra/pmc.c:1530:1-6:
 WARNING: invalid free of devm_ allocated data
Message-ID: <202511021138.yghcp20C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jonhunter/linux tegra/pmc
head:   af17e01bad167fdd9c168f7539c4e3e37262dcc8
commit: af17e01bad167fdd9c168f7539c4e3e37262dcc8 [22/22] fix
config: arm64-randconfig-r054-20251102 (https://download.01.org/0day-ci/archive/20251102/202511021138.yghcp20C-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511021138.yghcp20C-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/soc/tegra/pmc.c:1530:1-6: WARNING: invalid free of devm_ allocated data

vim +1530 drivers/soc/tegra/pmc.c

6ac2a01de1700c1 Jon Hunter     2019-04-16  1516  
6ac2a01de1700c1 Jon Hunter     2019-04-16  1517  static void tegra_powergate_remove(struct generic_pm_domain *genpd)
6ac2a01de1700c1 Jon Hunter     2019-04-16  1518  {
6ac2a01de1700c1 Jon Hunter     2019-04-16  1519  	struct tegra_powergate *pg = to_powergate(genpd);
6ac2a01de1700c1 Jon Hunter     2019-04-16  1520  
6ac2a01de1700c1 Jon Hunter     2019-04-16  1521  	reset_control_put(pg->reset);
6ac2a01de1700c1 Jon Hunter     2019-04-16  1522  
6ac2a01de1700c1 Jon Hunter     2019-04-16  1523  	while (pg->num_clks--)
6ac2a01de1700c1 Jon Hunter     2019-04-16  1524  		clk_put(pg->clks[pg->num_clks]);
6ac2a01de1700c1 Jon Hunter     2019-04-16  1525  
6ac2a01de1700c1 Jon Hunter     2019-04-16  1526  	kfree(pg->clks);
6ac2a01de1700c1 Jon Hunter     2019-04-16  1527  
ad2d8b13ed64f0d Thierry Reding 2025-02-03  1528  	set_bit(pg->id, pg->pmc->powergates_available);
6ac2a01de1700c1 Jon Hunter     2019-04-16  1529  
6ac2a01de1700c1 Jon Hunter     2019-04-16 @1530  	kfree(pg);
6ac2a01de1700c1 Jon Hunter     2019-04-16  1531  }
6ac2a01de1700c1 Jon Hunter     2019-04-16  1532  

:::::: The code at line 1530 was first introduced by commit
:::::: 6ac2a01de1700c1b6d889f02f61c4c9602573a8d soc/tegra: pmc: Move powergate initialisation to probe

:::::: TO: Jon Hunter <jonathanh@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
