Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66F0250E6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 11:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MMd4hHpC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702640061; x=1734176061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UHj0Dp4oiQkRgKTSpG8bRGKxlOBilIX8eaeJk/jhsH8=;
  b=MMd4hHpCEr/EDC4OmuLOmgT3L0juhZ7Ok1199T5v0II9tyGwKaQQgX5f
   5+85vkjB1rp6ftiLXGEgxGGWRedzSUib+1LjXpntUy+WFgso0VVaT55RX
   mbypfDnBvD8p8lzGdCE253ilsQ1BTeGUhB3AZCxucLimZOjQz0zzm1ml4
   kNvDv/T52JCTEW5r+hQZkOv7ZN/UQqDNdE2BbcNYd1ln4+CTVeJQxz3Sr
   MeLHbU1ciALw3IV39wpR2PTXF0MCaPDJ0kO7UHEUdA4MGVfUgKS4v1Qm7
   d0ZdIyw874VknWRRw1tdXVsQ9MkYlYMWw/ob4/nQFDsuDJ4igByjGgAbk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="461728074"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="461728074"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 03:34:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="947934859"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="947934859"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Dec 2023 03:34:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rE6SL-000074-0M;
	Fri, 15 Dec 2023 11:34:13 +0000
Date: Fri, 15 Dec 2023 19:33:20 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 135/25021]
 sound/soc/fsl/fsl_xcvr_sysfs.c:106:52: error: a function declaration without
 a prototype is deprecated in all versions of C
Message-ID: <202312151917.H3FKSWZ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Viorel,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3a95b5654979d1c2d61616bf60249ed3a98dcfbc
commit: 63a55b587dc56c1621aeea7bed86c56c75f98fa5 [135/25021] MLK-24965: ASoC: fsl_xcvr: bit and timestamp counters
config: hexagon-randconfig-r013-20230831 (https://download.01.org/0day-ci/archive/20231215/202312151917.H3FKSWZ8-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312151917.H3FKSWZ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312151917.H3FKSWZ8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/fsl/fsl_xcvr_sysfs.c:106:52: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
   const struct attribute_group *fsl_xcvr_get_attr_grp()
                                                      ^
                                                       void
   1 error generated.


vim +106 sound/soc/fsl/fsl_xcvr_sysfs.c

   105	
 > 106	const struct attribute_group *fsl_xcvr_get_attr_grp()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
