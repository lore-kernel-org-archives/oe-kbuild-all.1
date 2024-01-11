Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402574C3DF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 14:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pl328I85"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704984020; x=1736520020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j0yt7PR/bKDjkwC92Y+HgLwVC0U2Cl5S4FFyA8QYRlE=;
  b=Pl328I850E8VEZk7HJ7sXh7rtIwb/An1bwDWjZV+tQ3xT8yq5gB6+BWi
   p3s3oJ5NX7FxtNqtu0TNTY0Mz9PftXGogci3W++Ww+m8zv4oMl7FLPtmG
   PIc8NNhjYt2hWJIDSWzj8qQHAuRKWwKff45rKauUNkURb6jK9n8GoFgyE
   9JCpNLUWgEa44TQII0Rk1jAjsK5xXQlP7aYyTXETMtGrd3d9fl/uRuqni
   d1ogu+oWpznUbift6oE9PDbYocjZy7T7SPiTCvJ97N4/y0257img8hpD6
   tRGZGgtitOi+oDYW0mA0CEDJKgOZdJ7524N4Chi6KHpaxh80U+732wqFG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="5628784"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="5628784"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 06:40:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="24652086"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jan 2024 06:40:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNwEA-0008Mm-2p;
	Thu, 11 Jan 2024 14:40:14 +0000
Date: Thu, 11 Jan 2024 22:40:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2303/2356] mm/memcontrol.c:4428:12: warning:
 'mem_cgroup_check_swap_for_v1' defined but not used
Message-ID: <202401112227.IrFM3SmF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ea6de9f6732d495c506f9c140b4ec17c957e1b77
commit: a095a940f784db58ea4e87df361f9a4fd0dd977f [2303/2356] memcg: add restrict to swap to cgroup1
config: arm64-randconfig-003-20240111 (https://download.01.org/0day-ci/archive/20240111/202401112227.IrFM3SmF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401112227.IrFM3SmF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401112227.IrFM3SmF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:4428:12: warning: 'mem_cgroup_check_swap_for_v1' defined but not used [-Wunused-function]
    4428 | static int mem_cgroup_check_swap_for_v1(struct folio *folio, swp_entry_t entry)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mem_cgroup_check_swap_for_v1 +4428 mm/memcontrol.c

  4427	
> 4428	static int mem_cgroup_check_swap_for_v1(struct folio *folio, swp_entry_t entry)
  4429	{
  4430		return 0;
  4431	}
  4432	#endif
  4433	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
