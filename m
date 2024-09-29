Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4441638FB0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 17:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727632006; cv=none; b=X780j4NxiXiO4v8xl7HTLOh5oYX0gFvl/AVg9aAKtw2bVKsSDiYgpKcMVS4h2Eow9T38JdEcaGY0VlKsPLlPcjJ9BaccxkVyfG6qtyG8LIfGivbUc9FPv+FHCrYQjkX2fi5V/HzGu/B76W4J6J2OeacgwVENANnJlObVMHLdCCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727632006; c=relaxed/simple;
	bh=BxYCCmQusE9JhBzSO5IEyFNtWuFancuxJzazrF5fRZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f/mDiIZ/QxJpuafVmnJrxbx6ypJeqpcAk8Cb6y4Xmv/lEZ89m5+KQ0eeYdtfBtVDEinTB2/S/apsuztzg6sNA69GOYM7cAe6D5EqGKAm7Q/ztB9/ySyCk4Uy9jemfNvbdd9JeNXXmFWr3GW38iHMIfDz0t5kJYON+BR3Uyh/QWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FZnvkuaM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FZnvkuaM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727632005; x=1759168005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BxYCCmQusE9JhBzSO5IEyFNtWuFancuxJzazrF5fRZQ=;
  b=FZnvkuaMKZS0K5z4OVONwq6lVUpMfq1KSnWtHrvZWW8dBRDo5SSEfHeL
   wurB+/bzccpj/OMEzo80CKAd2203o/Xh07/GjxJ4HZPWyxDSlhjpx82eS
   gMjkOo31hkhFTuDMYR//Vtk56/9dzzF8qJ95mWaI/lKgGTR1cNuVaRpFm
   QCDHJbhpoa5HIcCUE0nu8pGnFE549Qa4qDt0J/d+74jerXelheI1SomeI
   j9mvaj5f/DMsAcQUUHyJVtuwdAOoWGD9ieWaqzVPjb5yYphcZU7BwPOQe
   Hr5LRdM2AobQe/5uDq8lcVvvsReUQ6rBC6eE0NHhSkg/YV5W4125OwNMX
   A==;
X-CSE-ConnectionGUID: 4t/Suy5HQB6We/9y1uamlQ==
X-CSE-MsgGUID: BiDlmJu8QWSFln3iOMBb9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="49239857"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="49239857"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 10:46:42 -0700
X-CSE-ConnectionGUID: Hz1JeskJThSv5YTOVjWs3w==
X-CSE-MsgGUID: kuv8dfu3RjeKGliehWxbQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="73391281"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Sep 2024 10:46:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suy0F-000OWw-1K;
	Sun, 29 Sep 2024 17:46:39 +0000
Date: Mon, 30 Sep 2024 01:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-6.1.y-cip 2/10] drivers/soc/renesas/pwc-rzv2m.c:124:34:
 warning: unused variable 'rzv2m_pwc_of_match'
Message-ID: <202409300153.vVkxQe1b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip
head:   0f19f32122651a230b262ce09853c6e604e18a23
commit: eec8287bdd56aedf04eb40e2a3da5482ac379f04 [2/10] soc: renesas: Add PWC support for RZ/V2M
config: i386-buildonly-randconfig-003-20240929 (https://download.01.org/0day-ci/archive/20240930/202409300153.vVkxQe1b-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300153.vVkxQe1b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300153.vVkxQe1b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/renesas/pwc-rzv2m.c:124:34: warning: unused variable 'rzv2m_pwc_of_match' [-Wunused-const-variable]
     124 | static const struct of_device_id rzv2m_pwc_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [y]:
   - TEST_MAPLE_TREE [=y] && RUNTIME_TESTING_MENU [=y]


vim +/rzv2m_pwc_of_match +124 drivers/soc/renesas/pwc-rzv2m.c

   123	
 > 124	static const struct of_device_id rzv2m_pwc_of_match[] = {
   125		{ .compatible = "renesas,rzv2m-pwc" },
   126		{ /* sentinel */ }
   127	};
   128	MODULE_DEVICE_TABLE(of, rzv2m_pwc_of_match);
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
