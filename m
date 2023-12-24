Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3C45663
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Dec 2023 13:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJZsrZD2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703423039; x=1734959039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BoFdmJdQQT2xp9rFk2wUJgHRWZnEJrBUin/6lHl54W0=;
  b=SJZsrZD2SJSwZWaNXjjIaxwlwJtsURdV9PzoTMupckE8LZBwD5ueVITv
   AIBYQ8dHtL6wzCRCWevQWSv8q2AgpQFuytAKxg9mo3Bj2kl66+QwZmVFd
   q5OJvgDkE6ZiHEgdb3UMxWpKwB/hQIdO0F5K3c0Kcoz5L+qZOgCwfBtyt
   MYSe3xFoy1Dbt7ER3x0A+V60qc077VqfamtrfCMvXSgDMb0GoBNTvL9ub
   ANTwRN6I6XQgbcdFRc/dEgw/2DwIst1fZEv6G++4feXdbmJz/BVEaJ2nF
   rby7fdpR9Gqy35K96i6oYBdvIdcD8Ekm6VOEsTfmV0mAQZwWaGB7o0ZQh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="375730306"
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; 
   d="scan'208";a="375730306"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 05:03:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="868173885"
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; 
   d="scan'208";a="868173885"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Dec 2023 05:03:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHO83-000CGX-0d;
	Sun, 24 Dec 2023 13:03:09 +0000
Date: Sun, 24 Dec 2023 21:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kartik <kkartik@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Thierry Reding <treding@nvidia.com>
Subject: [linux-next:master 7400/10295]
 drivers/soc/tegra/fuse/fuse-tegra30.c:698:28: error:
 'tegra194_soc_attr_group' undeclared here (not in a function); did you mean
 'tegra_soc_attr_group'?
Message-ID: <202312242006.dHAPx6i7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: dee509eb9cd593b7bcb1c1f1f5f2d7e75e389290 [7400/10295] soc/tegra: fuse: Add support for Tegra241
config: arm64-randconfig-002-20231224 (https://download.01.org/0day-ci/archive/20231224/202312242006.dHAPx6i7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231224/202312242006.dHAPx6i7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312242006.dHAPx6i7-lkp@intel.com/

Note: the linux-next/master HEAD 39676dfe52331dba909c617f213fdb21015c8d10 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/soc/tegra/fuse/fuse-tegra30.c:698:28: error: 'tegra194_soc_attr_group' undeclared here (not in a function); did you mean 'tegra_soc_attr_group'?
     698 |         .soc_attr_group = &tegra194_soc_attr_group,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~
         |                            tegra_soc_attr_group


vim +698 drivers/soc/tegra/fuse/fuse-tegra30.c

   692	
   693	const struct tegra_fuse_soc tegra241_fuse_soc = {
   694		.init = tegra30_fuse_init,
   695		.info = &tegra241_fuse_info,
   696		.keepouts = tegra241_fuse_keepouts,
   697		.num_keepouts = ARRAY_SIZE(tegra241_fuse_keepouts),
 > 698		.soc_attr_group = &tegra194_soc_attr_group,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
