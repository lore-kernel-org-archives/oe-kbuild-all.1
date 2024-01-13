Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B517F1FA1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 15:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AfkMiu2u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705161066; x=1736697066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rinxxi+EtQNu4OX7mDG4nrLT1uzYEdPQhb39rSOueXQ=;
  b=AfkMiu2uj9/oOl+jqJVv+WyNz7RHnCpeHx+8MH3llc2/meQlPC1uTGxr
   BP95gJFHZBsNb/D8RBmTkqkCaTjXTmH+GoKVIoy9paE/2NPpFnS6pxpOF
   DsB1XvzYDeVbRh9W15i+WQdH2w/1f2K5C8zEqcm8dVg4M59NE8aQhR4yb
   iQJAuTW8Dva1uLMAYgQEZeRPJBuO25lYCjiLkoxrHYuzunhnPBv9eyvpr
   LoFwGwd0L8u8y+GDn9BzKK5PMrztvNuV+KfWfLo6Jj0/PouQ9XAm9R3Y9
   98s5CNTt9qqcEcZShmzhQL1nw8C1lYXXd+7SZAhfdI4m/YFnyjioR+c2J
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="6477557"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="6477557"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 07:51:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="956392384"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="956392384"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Jan 2024 07:51:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOgHl-000Adw-1e;
	Sat, 13 Jan 2024 15:51:01 +0000
Date: Sat, 13 Jan 2024 23:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 13666/17888]
 drivers/net/phy/mtip_backplane.c:1735:34: warning: unused variable
 'mtip_backplane_of_match'
Message-ID: <202401132347.GAhukC5Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   32a344619c750cdcbe31bed754adc1b30d362e45
commit: 19aa941dc1bfcb28c8a41a9af3b888be30436000 [13666/17888] net: phy: mtip_backplane: add driver for MoreThanIP backplane AN/LT core
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240113/202401132347.GAhukC5Z-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401132347.GAhukC5Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401132347.GAhukC5Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/mtip_backplane.c:1735:34: warning: unused variable 'mtip_backplane_of_match' [-Wunused-const-variable]
    1735 | static const struct of_device_id mtip_backplane_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/mtip_backplane_of_match +1735 drivers/net/phy/mtip_backplane.c

  1734	
> 1735	static const struct of_device_id mtip_backplane_of_match[] = {
  1736		{ .compatible = "fsl,lx2160a-backplane-anlt" },
  1737		{ /* sentinel */ },
  1738	};
  1739	MODULE_DEVICE_TABLE(of, mtip_backplane_of_match);
  1740	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
