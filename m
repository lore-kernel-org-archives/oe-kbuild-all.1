Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD363C0B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 05:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728277651; cv=none; b=GrWoF7+sGdfue/yY6Np7UhiQdl+Xhk4iH3MFY4DrQJeg/Bu0FBs+Pr8X3GWW5b6RZMXxa3/cjuqf2g3OQGU7PkJpN/Wn0nk0ccomzJmms6kV7IMjdqDl+wJCovUKvOpwkljuCCguZdg4VMCNzswcVX/xDeebMo8FHGjh3h/2DhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728277651; c=relaxed/simple;
	bh=tSpPmJ/Up7hVvPp9PHrOWyNpvaE7EFUi0OKMB4acoa0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EaS4s+5rJ4iycB+658itZ7wtIWBtcYb6soltpWZfAUd/BK91X1G0X+9H+CVQq3lNkv7k0mRoqn2PirTnWdGiSQEnW7pbbEntURhJe9SlxLz0VZgZV6DgoaBVJ2dkxEIQa6Tmn5ngCwg3C+97MebnXEfyKT4CIkqLdiZbQBBgTk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LT5iAO7P; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LT5iAO7P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728277650; x=1759813650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tSpPmJ/Up7hVvPp9PHrOWyNpvaE7EFUi0OKMB4acoa0=;
  b=LT5iAO7PzG4Kb1E5MgtECu6TtduddHM+cmlPaasMCxwzHBo6/RJAiYiK
   S7TUDqvhpN1aqXbTxYG3Ea/PjNk4jdCVoASvuCKDPwwgnW3dIk4mhG5cw
   a2IJji2XihW7QukvHm6mAOKcBoKQMvkY3djzJC6SgX/y6a8MZYOUr6QmI
   nmhXPjMIGMzpCY9jv/zuwNuJVWO8ahtvQzPyXHAOaHRgHCUQ3nsYvDcCn
   qy0l32yJS/sMWR9zXuNZUvCKXeZOLVz1QZQKQDwtagMLRaH+1beSBbJCX
   ig2wE2Etdu3j9Ez/FHmuO3t8D46+12IZYAEK9SDKigZKM2dJP65J3FxP0
   Q==;
X-CSE-ConnectionGUID: 36OO1RFdQySL5T0oFNq49g==
X-CSE-MsgGUID: 0hkDJoRxRcC5ga5RB3ktpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="27354763"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="27354763"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 22:07:30 -0700
X-CSE-ConnectionGUID: eO397I/JRhe8PGfYxBE+Yw==
X-CSE-MsgGUID: 86zLvY/6TBaCHt1ctgkOsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="106111982"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Oct 2024 22:07:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxfxu-0004bo-1E;
	Mon, 07 Oct 2024 05:07:26 +0000
Date: Mon, 7 Oct 2024 13:06:41 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.12-rc 26/59]
 drivers/net/pcs/pcs-standalone.c:89:9-16: WARNING: ERR_CAST can be used with
 pcssa
Message-ID: <202410071308.0AxeFRLw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.12-rc
head:   8c14f234bea18137f2c1310bfaaff554cd7df46d
commit: cea7d8f59f07d531d2701e0fb259d7da9a39889c [26/59] net: pcs: add helper module for standalone drivers
config: x86_64-randconfig-102-20241007 (https://download.01.org/0day-ci/archive/20241007/202410071308.0AxeFRLw-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410071308.0AxeFRLw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/pcs/pcs-standalone.c:89:9-16: WARNING: ERR_CAST can be used with pcssa
--
>> drivers/net/pcs/pcs-mtk-lynxi.c:357:2-3: Unneeded semicolon

vim +89 drivers/net/pcs/pcs-standalone.c

    80	
    81	struct phylink_pcs *devm_of_pcs_get(struct device *dev,
    82					    const struct device_node *np,
    83					    unsigned int index)
    84	{
    85		struct pcs_standalone *pcssa;
    86	
    87		pcssa = of_pcs_locate(np ?: dev->of_node, index);
    88		if (IS_ERR_OR_NULL(pcssa))
  > 89			return ERR_PTR(PTR_ERR(pcssa));
    90	
    91		device_link_add(dev, pcssa->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
    92	
    93		return pcssa->pcs;
    94	}
    95	EXPORT_SYMBOL_GPL(devm_of_pcs_get);
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
