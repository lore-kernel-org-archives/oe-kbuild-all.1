Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D0937D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Oct 2023 00:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696121479; x=1727657479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gbCSPF0Slg5PTD4puW98udi102pj1A3NS6jgN+hoprw=;
  b=HKmeXQ5mGng2S7bKRrcqI2mEJyZvWtV8SBuXRNKzim8okVgCavdQiLL6
   dzoQw2fk1K/rHLL054XKw7lcwgeq/Fgao3LLW7QD2fsB3q1EgN+zqhYQA
   ySdsexfw1DOOctIr88ujcOYCeYXjEtss6SEcWip4OnbAis+DaaYkzS/3O
   ToliYq2/Ubvr1+c92EDn4mFZVAnSlRW7zFaFq0ofyFbn6H+yIjVxjeee9
   q1zUSd+lOqEW1MypSNJz3bKCpekPRMCQG6otbeOcLXyLI6d96DKMcNwrt
   0Ts6vWNhFZvqd2Aq4tqN0YmLgWl0vr+eVYGaQLPleFf0GqKFuxtsSQz4o
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="367537802"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="367537802"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 17:51:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="840627775"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="840627775"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Sep 2023 17:51:03 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmkfk-0004cK-2Q;
	Sun, 01 Oct 2023 00:51:00 +0000
Date: Sun, 1 Oct 2023 08:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 25/28] mm/damon/sysfs-schemes.c:1869:6: warning: no
 previous prototype for 'damos_sysfs_tried_regions_reset_update_status'
Message-ID: <202310010851.UTmHwpyH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   ee9e834252d5110f424abdef73f776cd4dc5ceae
commit: d3dfc5443e1f05dd03955ba5fe214812d0219395 [25/28] mm/damon/sysfs-schemes: update tried regions for only one apply interval
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231001/202310010851.UTmHwpyH-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310010851.UTmHwpyH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310010851.UTmHwpyH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/damon/sysfs-schemes.c:127:60: error: field 'update_status' has incomplete type
     127 |         enum damos_sysfs_tried_regions_reset_update_status update_status;
         |                                                            ^~~~~~~~~~~~~
>> mm/damon/sysfs-schemes.c:1869:6: warning: no previous prototype for 'damos_sysfs_tried_regions_reset_update_status' [-Wmissing-prototypes]
    1869 | void damos_sysfs_tried_regions_reset_update_status(struct damon_ctx *ctx)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/sysfs-schemes.c: In function 'damos_sysfs_tried_regions_reset_update_status':
   mm/damon/sysfs-schemes.c:1876:17: error: 'sysfs_Schemes' undeclared (first use in this function); did you mean 'sysfs_schemes'?
    1876 |                 sysfs_Schemes->schemes_arr[i]->tried_regions->update_status =
         |                 ^~~~~~~~~~~~~
         |                 sysfs_schemes
   mm/damon/sysfs-schemes.c:1876:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/damos_sysfs_tried_regions_reset_update_status +1869 mm/damon/sysfs-schemes.c

  1868	
> 1869	void damos_sysfs_tried_regions_reset_update_status(struct damon_ctx *ctx)
  1870	{
  1871		struct damon_sysfs_schemes *sysfs_schemes =
  1872			damon_sysfs_schemes_for_damos_callback;
  1873		int i;
  1874	
  1875		for (i = 0; i < sysfs_schemes->nr; i++)
  1876			sysfs_Schemes->schemes_arr[i]->tried_regions->update_status =
  1877				damos_tried_region_update_idle;
  1878	}
  1879	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
