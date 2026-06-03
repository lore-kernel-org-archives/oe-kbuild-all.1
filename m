Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C70244692
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481802; cv=none; b=VIJbyzyqua9w7ih66wjnaxkFgl9uDvWIG2nAuGVi0tsgdXAffu8yzOgO2UvFqvaLkUsdY99QFcfLM5mBNWMIup68vUyctKK2cZe5g+MFnvMMRZO3HtFOV8BhiDH9qsVyzjGazJby8VAUVLHOX073j9h9LOE/ylU9t01evhWXFFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481802; c=relaxed/simple;
	bh=mFe8TlPUiYEP0LvOO0Qo32Ff4Z5L8cJGkeRv0+L5w3M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SUaP1EtFZnjBFCOXZXvvJGf734sMYlnzsuHt/Yr8+nVypHiz97USCLEOc9lKcYrF03aKkRy8pYE1WXd+/5UcYL0OMJ1oJ/n1wPn8EwUkYDglDfmNFmMUjXYXGk/wuEDqoSo+US/6O6zYlS3GCT7mQ95sXmQlxwJz5rcGGTFz1IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E1CAi7D4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E1CAi7D4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780481800; x=1812017800;
  h=date:from:to:cc:subject:message-id;
  bh=mFe8TlPUiYEP0LvOO0Qo32Ff4Z5L8cJGkeRv0+L5w3M=;
  b=E1CAi7D4zwvqoV0Mgx8CPyNUPAg5Qyh0vt7z5NUoilrvRWSFDi1yTRlk
   alp/oJo4BKs2K0KbyOXCLwcUbCaxcQstGt+YASod/LKy+OiLxhsw7YVD/
   YiKU1EakXZNe+3ozVm4B/fe3JMn5IMCghOuaM78qNNbFf4UbHLC5zC9IB
   sai3bq8U3KS0/tdQ0H9UaV6Ogxvf3ioffbSGLJarocETILOKNjTsWJEzL
   opoall/IyLatj+RSotvIAmFbidqtEniLXdFBQcv6M0j+ohB/PkQDnAste
   c8YR2WX5JbsMbgLQa9JP68QE98hGfUoaN6nRg1g7IJkCu/BD1OxglRsJb
   g==;
X-CSE-ConnectionGUID: 6sXvW5bOTt+JiGYHs8eosA==
X-CSE-MsgGUID: V6KMIfpAQwOGf54lArs43w==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91857377"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="91857377"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 03:16:40 -0700
X-CSE-ConnectionGUID: KtKjn03XSqmLm+h/LArQug==
X-CSE-MsgGUID: NqbivEd7TZq0rz2s8dkcEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="243333201"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Jun 2026 03:16:39 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUieK-00000000DHW-1MZk;
	Wed, 03 Jun 2026 10:16:36 +0000
Date: Wed, 03 Jun 2026 18:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-03 0/1]
 sound/soc/codecs/ak4458.c:631:13: warning: 'ak4458_reset' defined but not
 used
Message-ID: <202606031808.msCZcY3d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Shengjiu,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-03
head:   9fd7e18b52f192bb481ee8aa50c64c39697a93f7
commit: 47c4976513f1dd9630c97b5d13a579ab68f908d1 [0/1] ASoC: ak4458: remove the reset operation in probe and remove
config: i386-randconfig-011-20260603 (https://download.01.org/0day-ci/archive/20260603/202606031808.msCZcY3d-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606031808.msCZcY3d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606031808.msCZcY3d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/ak4458.c:631:13: warning: 'ak4458_reset' defined but not used [-Wunused-function]
     631 | static void ak4458_reset(struct ak4458_priv *ak4458, bool active)
         |             ^~~~~~~~~~~~


vim +/ak4458_reset +631 sound/soc/codecs/ak4458.c

ee6047b8288814 Daniel Baluta          2019-01-04  630  
e953daeb68b1ab Eliot Blennerhassett   2021-01-22 @631  static void ak4458_reset(struct ak4458_priv *ak4458, bool active)
08660086eff9e9 Cosmin-Gabriel Samoila 2018-02-14  632  {
1e0dff741b0a8a Shengjiu Wang          2024-07-03  633  	if (!IS_ERR_OR_NULL(ak4458->reset)) {
8a0de73cf9dc04 Viorel Suman           2022-10-13  634  		if (active)
8a0de73cf9dc04 Viorel Suman           2022-10-13  635  			reset_control_assert(ak4458->reset);
8a0de73cf9dc04 Viorel Suman           2022-10-13  636  		else
8a0de73cf9dc04 Viorel Suman           2022-10-13  637  			reset_control_deassert(ak4458->reset);
8a0de73cf9dc04 Viorel Suman           2022-10-13  638  		usleep_range(1000, 2000);
08660086eff9e9 Cosmin-Gabriel Samoila 2018-02-14  639  	}
08660086eff9e9 Cosmin-Gabriel Samoila 2018-02-14  640  }
08660086eff9e9 Cosmin-Gabriel Samoila 2018-02-14  641  

:::::: The code at line 631 was first introduced by commit
:::::: e953daeb68b1abd8a7d44902786349fdeef5c297 ASoC: ak4458: correct reset polarity

:::::: TO: Eliot Blennerhassett <eliot@blennerhassett.gen.nz>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
