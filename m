Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC38A156C2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 21:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687555882; x=1719091882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F6dwp3nPAd88dskisTAPgKVXzc2JC5OvfudzgKHq4eo=;
  b=mRq1ATTZ+4YvAv+lF3m2tM95DsFgGD/xgZC8LKlLXw9Z40G1rGCvj6C7
   pl5/Rgw0o6RfIXmgfdnU9eyHof2O+Nq3Lj216R6Tn61EStvRBYWyDDuHc
   vr02cwQ2dSzJWmCbkZ8hRkH1gj4E7M2b7GpK2loUZ/DLEa6L0q6Y+CGGT
   Z/tYjjaiJIHU+nEwqt26BrVV+L2ybf0TO2cTntwOjDgutmET8HEJjqRqV
   vu9wda48ialSpyvFCuUCmT1czqCoWcC6eYl9sLa6k5oLkuRmOrz1rkXDZ
   lYgri+3X3sSLUSo3yzeVwS1EFA74LR5frUc2NQIYdNc5N0jpQs3TNKvzb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="426851393"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="426851393"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 14:31:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="962114706"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="962114706"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Jun 2023 14:31:19 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCoND-0008Xf-09;
	Fri, 23 Jun 2023 21:31:19 +0000
Date: Sat, 24 Jun 2023 05:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:for_maor_reuse_roce_gid 12/16]
 drivers/infiniband/core/cache.c:372:28: warning: no previous prototype for
 'get_valid_entry'
Message-ID: <202306240529.OmHByKnL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux for_maor_reuse_roce_gid
head:   1b26be51e181c4a802d87e5d1f806d3722b3a834
commit: 23f090b3a944d84665bfaac23948a0a36a579a7c [12/16] rdma/gidtable: Use an xarray instead of a preallocated array
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230624/202306240529.OmHByKnL-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306240529.OmHByKnL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306240529.OmHByKnL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/core/cache.c:372:28: warning: no previous prototype for 'get_valid_entry' [-Wmissing-prototypes]
     372 | struct ib_gid_table_entry *get_valid_entry(struct ib_gid_table *table,
         |                            ^~~~~~~~~~~~~~~


vim +/get_valid_entry +372 drivers/infiniband/core/cache.c

   371	
 > 372	struct ib_gid_table_entry *get_valid_entry(struct ib_gid_table *table,
   373						   unsigned int index)
   374	{
   375		struct ib_gid_table_entry *entry = xa_load(&table->entries, index);
   376	
   377		if (!is_gid_entry_valid(entry))
   378			return NULL;
   379		return entry;
   380	}
   381	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
