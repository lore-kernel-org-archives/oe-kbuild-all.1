Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B940113AA27
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 17:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729274040; cv=none; b=ltb17JFx8t07nwSLcjnVcQjJrZL1RX8ZmltuoVb0+DHOVOfBh//BTjmd3pGK5a840s2LeOSI+RBphjKMLWHZeNBSJdS3q6RuAjm+ZseFng2Yv3j8eqC0CCBl3HZKdYAQtjiV+Ci2pMU3CwwDpdVw9rW1PHBpbL731ryX6t+pjUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729274040; c=relaxed/simple;
	bh=W850vL6fNGhdyGbpl9BxJX7f/UngP91L0GKmN5Q8pv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uJPfdKeZZIgC3bUJQe3wuRhgnd0jZQzIXfQz93tJW7tA6h1tWCkYzj6BOLRfs/Ory5l4JtSqJsaF67+JeAZDYvUOE7C1aBh7cTHMwk7FfessgkscigabfFRjqTJvJ5G0wuLfx8n8avX68AkzHKOM3ItnwxKu79FLxL++m0SixBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+d2GwYR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+d2GwYR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729274038; x=1760810038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W850vL6fNGhdyGbpl9BxJX7f/UngP91L0GKmN5Q8pv4=;
  b=g+d2GwYRx60qvUL2kGfI4oTBT5mVwlvPTiKeX0UvyyFhbRQbP3EHZITL
   jNjXiBFeAjY5RQ8RlxAoJDnqk1Nt5jkYmfg64q42F/5ULi0sCxb6H8MGm
   7CAfmKxMcShHEesfQcJM+aw1fgVQCNeOoe5Dr69WtG4km7z+e9NlJ+P6Y
   WVMhEGRL2aJjsHA+jn/6Njxyp7J+CUxqzckv0diCn09p9mOTBScpsEuTw
   3mWOKdclb2ADT6S2MUIIkhTKWFjWmNoSOIbJQ0NcjkN71r3U46Z+igkcu
   5ijtgBxsX86Zw3e5se+wXP379nQiliQudvTHHTDk0NMF6hGexMxlCiVx9
   w==;
X-CSE-ConnectionGUID: QmaP4XTNRkemXq13gFekig==
X-CSE-MsgGUID: 2/W20la3QU6wPpP7E2U67Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="32613832"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="32613832"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 10:53:58 -0700
X-CSE-ConnectionGUID: JZTh+QcISFugSjfQTeGNOw==
X-CSE-MsgGUID: +537YaIZTH6mBmuYSoJSGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="79346152"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Oct 2024 10:53:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1rAg-000O9T-0G;
	Fri, 18 Oct 2024 17:53:54 +0000
Date: Sat, 19 Oct 2024 01:53:25 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.1.x-imx 3499/17818]
 drivers/phy/freescale/phy-fsl-imx8m-pcie.c:280:19: warning:
 'imx8_pcie_phy_fine_tune' defined but not used
Message-ID: <202410190132.ZFSd4lFf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.1.x-imx
head:   096cd0432b03805f49c86684dafb9ced4511a714
commit: 663460ac656b474257e3d25b0af4809ab11eebd5 [3499/17818] LF-8215 phy: freescale: imx8m-pcie: Fix i.MX8MP EVK EP RC link speed is only Gen1
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241019/202410190132.ZFSd4lFf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190132.ZFSd4lFf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190132.ZFSd4lFf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/freescale/phy-fsl-imx8m-pcie.c:280:19: warning: 'imx8_pcie_phy_fine_tune' defined but not used [-Wunused-function]
     280 | static int __init imx8_pcie_phy_fine_tune(char *str)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~


vim +/imx8_pcie_phy_fine_tune +280 drivers/phy/freescale/phy-fsl-imx8m-pcie.c

   279	
 > 280	static int __init imx8_pcie_phy_fine_tune(char *str)
   281	{
   282		if (!strcmp(str, "yes")) {
   283			pr_info("i.MX PCIe PHY is fine tuned in EP/RC SYS.\n");
   284			imx8_pcie_phy_tuned = 1;
   285		}
   286		return 1;
   287	}
   288	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
