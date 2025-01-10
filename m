Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75FA190057
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 07:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736492832; cv=none; b=LkPz1hGeKRAhIMVJEpG4E1+fnWKSaH0l75uZcrcCQuGupbizFxxfEtaJKHMK4/PsDfhySYdfiGfKeGIX4cleibVXjatdTynmbtnQv4O8Fji898vHPL2zX9vruyzMKxcGq3naCy4S5Lg/Fvu2RbsprcOsEghwSXNV0aDD1NAJfd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736492832; c=relaxed/simple;
	bh=WTG0O/0NB2Bk1Y+wo4jhwFE9z9GHbm1B2MLaxWRSMLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ANl6i/ZtWIinnoEtLDCKb5VnjStHdjpOPfSkGn3iuKsgJNQSki/fEN4wJfvVJS6A0snXIvDPkQ6GuF6ai82xuElMVrUjUkM7xFd4wjgPW2t39SsvvjbJHj97EYH7zpps/r6k17/ZKIpr35Se6y47a8Ub+B/icRpvQl3K9Az10uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEab+Buj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEab+Buj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736492831; x=1768028831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WTG0O/0NB2Bk1Y+wo4jhwFE9z9GHbm1B2MLaxWRSMLM=;
  b=FEab+Buj1eKABoxm5irTWoRZSUBUOCZowSk9QgEXMZ0hCu0DCoT4P1fo
   ANjiY3PsM6RZmK3spKZ3MMl6Wvqc51Mchx79MTIPF/DhLe83hZzKa9pJ5
   Re5fkOiwQaETaMoi8rsBD0cN13bU4ki/RMhYmLdzv+WgFQ9J3MTIFahgI
   5w6dkHJ0xHOMPlOzQJ7XftOZFN0JG5jwiFKzGLRVpBByo+cFOj42DiEBB
   JDk26KR0+C+ZyoTNkY3MBMvYDu60CHevIMzD4TpJP4EFhn6JXr8g7ENhs
   grPIS0dedoiMqnHdw2hEe2Hqcm+8LdUPPwl0Ai+FasTDFzt+ypUhpS5ip
   A==;
X-CSE-ConnectionGUID: VI/mSsmIRGaRI0NxYrfgKw==
X-CSE-MsgGUID: e5SmfS/xQz+cv3SV+NFzvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36886452"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36886452"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 23:07:11 -0800
X-CSE-ConnectionGUID: c5kf6sfmTg6Eja3VDMxx2w==
X-CSE-MsgGUID: OZpyugCPSyy88m3atwfbFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="108573511"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Jan 2025 23:07:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW96p-000IiD-0A;
	Fri, 10 Jan 2025 07:07:07 +0000
Date: Fri, 10 Jan 2025 15:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/ctl_table_const 1/1]
 drivers/infiniband/core/iwcm.c:1189:30: sparse: sparse: incorrect type in
 argument 3 (different modifiers)
Message-ID: <202501101504.aFnUXcY5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/ctl_table_const
head:   3eed56785bcc57cb6f3184f24a22a4b79692ea5c
commit: 3eed56785bcc57cb6f3184f24a22a4b79692ea5c [1/1] treewide: const qualify ctl_tables where applicable
config: i386-randconfig-061-20250110 (https://download.01.org/0day-ci/archive/20250110/202501101504.aFnUXcY5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101504.aFnUXcY5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101504.aFnUXcY5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/infiniband/core/iwcm.c:1189:30: sparse: sparse: incorrect type in argument 3 (different modifiers) @@     expected struct ctl_table *table @@     got struct ctl_table const * @@
   drivers/infiniband/core/iwcm.c:1189:30: sparse:     expected struct ctl_table *table
   drivers/infiniband/core/iwcm.c:1189:30: sparse:     got struct ctl_table const *
   drivers/infiniband/core/iwcm.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +1189 drivers/infiniband/core/iwcm.c

922a8e9fb2e071 Tom Tucker      2006-08-03  1176  
922a8e9fb2e071 Tom Tucker      2006-08-03  1177  static int __init iw_cm_init(void)
922a8e9fb2e071 Tom Tucker      2006-08-03  1178  {
b493d91d333e86 Faisal Latif    2016-02-26  1179  	int ret;
b493d91d333e86 Faisal Latif    2016-02-26  1180  
b493d91d333e86 Faisal Latif    2016-02-26  1181  	ret = iwpm_init(RDMA_NL_IWCM);
b493d91d333e86 Faisal Latif    2016-02-26  1182  	if (ret)
e677b72a064724 Leon Romanovsky 2021-07-23  1183  		return ret;
e677b72a064724 Leon Romanovsky 2021-07-23  1184  
86dfdd8288907f Zhu Yanjun      2024-08-20  1185  	iwcm_wq = alloc_ordered_workqueue("iw_cm_wq", WQ_MEM_RECLAIM);
922a8e9fb2e071 Tom Tucker      2006-08-03  1186  	if (!iwcm_wq)
e677b72a064724 Leon Romanovsky 2021-07-23  1187  		goto err_alloc;
922a8e9fb2e071 Tom Tucker      2006-08-03  1188  
2f0304d2186747 Steve Wise      2014-07-25 @1189  	iwcm_ctl_table_hdr = register_net_sysctl(&init_net, "net/iw_cm",
2f0304d2186747 Steve Wise      2014-07-25  1190  						 iwcm_ctl_table);
2f0304d2186747 Steve Wise      2014-07-25  1191  	if (!iwcm_ctl_table_hdr) {
2f0304d2186747 Steve Wise      2014-07-25  1192  		pr_err("iw_cm: couldn't register sysctl paths\n");
e677b72a064724 Leon Romanovsky 2021-07-23  1193  		goto err_sysctl;
2f0304d2186747 Steve Wise      2014-07-25  1194  	}
2f0304d2186747 Steve Wise      2014-07-25  1195  
e677b72a064724 Leon Romanovsky 2021-07-23  1196  	rdma_nl_register(RDMA_NL_IWCM, iwcm_nl_cb_table);
922a8e9fb2e071 Tom Tucker      2006-08-03  1197  	return 0;
e677b72a064724 Leon Romanovsky 2021-07-23  1198  
e677b72a064724 Leon Romanovsky 2021-07-23  1199  err_sysctl:
e677b72a064724 Leon Romanovsky 2021-07-23  1200  	destroy_workqueue(iwcm_wq);
e677b72a064724 Leon Romanovsky 2021-07-23  1201  err_alloc:
e677b72a064724 Leon Romanovsky 2021-07-23  1202  	iwpm_exit(RDMA_NL_IWCM);
e677b72a064724 Leon Romanovsky 2021-07-23  1203  	return -ENOMEM;
922a8e9fb2e071 Tom Tucker      2006-08-03  1204  }
922a8e9fb2e071 Tom Tucker      2006-08-03  1205  

:::::: The code at line 1189 was first introduced by commit
:::::: 2f0304d21867476394cd51a54e97f7273d112261 RDMA/iwcm: Use a default listen backlog if needed

:::::: TO: Steve Wise <swise@opengridcomputing.com>
:::::: CC: Roland Dreier <roland@purestorage.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
