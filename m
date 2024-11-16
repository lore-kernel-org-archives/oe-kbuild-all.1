Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2022B9BF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 22:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731797360; cv=none; b=fEke42XG47+5PrD7vBNaIeraAyWKwSHJ+10N6Qpi2yVQlei/IeC+ZjHpg+0ojzvHpmKueH6fJsmgFxrUKd7KGwgjofoHha4C2SQz2DojbFOhXUAjkBnFdD+0nGbJymx5z3plgnpBS2lj2QtM591YdbcEy5d94iPBdQvTV+i2cd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731797360; c=relaxed/simple;
	bh=34rtKAtW09YA6nhGUf46oHQ9E6PrjEFSdM3HjDGOHHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZOpuFN3LAhF2ljRKFnoMeMgzLFkTjwoG1s+3DqA9EOmdKjCUVW0w0vMxBHmckCLWPv4922B2B/21RvjDxQ11OerDGGX3uD6hZG/kXrxYsqQdZpRt7aQUgjUHUSF3+GLkmPxOQCrR7j5+hYay8tu1C6eKNj3rqAVtEDRtjRjVJIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZm45vIX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZm45vIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731797358; x=1763333358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=34rtKAtW09YA6nhGUf46oHQ9E6PrjEFSdM3HjDGOHHE=;
  b=eZm45vIXQoPN/cEXX+wyFXr86rrXM82AfDuFy4U3KpvCrVhbAxmr4itv
   qQvwkjhD+smtnmAb4wfTUc/Qa/v+IGc4FhlcChCw3Iv99S4PI6BWO7lGJ
   yB4cnd9lOvFJelCukfyJYw65NcDB9MvRiiQJRCvieGok86ggv284ImaGj
   2kZITnpBXunisKpQFPWz8wMITQjh/BbvNAcsF4vdIiQlpUi4ZWZXcZ9nF
   z3M7j5N/I3EpBBF9fv/DtT1xDGzz7k9TWGCQJ39l/htaeXlZKjjw2Za8y
   PsW3d+s3xVhwWVvF14B2Zsz1sdEbC7P4pS951+D8/MiIe2dgoL3+WEUdC
   g==;
X-CSE-ConnectionGUID: 2X1JooLGT8iJ5YlTW5JbHg==
X-CSE-MsgGUID: FqBNwCBfTMKnlSeg/zgrIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31918630"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="31918630"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 14:49:17 -0800
X-CSE-ConnectionGUID: yqb2il9nRv6zhpEdW/brow==
X-CSE-MsgGUID: 6Ba7HyhbQf+5Vz92VDUyow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="88634291"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Nov 2024 14:49:15 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCRbN-00019d-1Y;
	Sat, 16 Nov 2024 22:49:13 +0000
Date: Sun, 17 Nov 2024 06:49:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1297/1297] mm/share_pool.c:1043:9:
 error: implicit declaration of function 'sysctl_compaction_handler'; did you
 mean 'sysctl_memcg_qos_handler'?
Message-ID: <202411170615.z7wW3RFB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhou,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4c37b6449701a1fcb16050d4e517fa6d505673e1
commit: d45b33b72c530e64219ad997947a33f6e07d339c [1297/1297] share pool: Try to compact when memory is insufficient
config: arm64-randconfig-002-20241117 (https://download.01.org/0day-ci/archive/20241117/202411170615.z7wW3RFB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170615.z7wW3RFB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170615.z7wW3RFB-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/share_pool.c: In function 'sp_compact_nodes':
>> mm/share_pool.c:1043:9: error: implicit declaration of function 'sysctl_compaction_handler'; did you mean 'sysctl_memcg_qos_handler'? [-Werror=implicit-function-declaration]
    1043 |         sysctl_compaction_handler(NULL, 1, NULL, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         sysctl_memcg_qos_handler
   mm/share_pool.c: At top level:
   mm/share_pool.c:2482:12: warning: 'spa_stat_show' defined but not used [-Wunused-function]
    2482 | static int spa_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~
   mm/share_pool.c:2363:12: warning: 'proc_stat_show' defined but not used [-Wunused-function]
    2363 | static int proc_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~
   In file included from mm/share_pool.c:22:
   In function 'memalloc_noreclaim_restore',
       inlined from 'sp_alloc' at mm/share_pool.c:1374:4:
   include/linux/sched/mm.h:278:58: warning: 'noreclaim_flag' may be used uninitialized [-Wmaybe-uninitialized]
     278 |         current->flags = (current->flags & ~PF_MEMALLOC) | flags;
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   mm/share_pool.c: In function 'sp_alloc':
   mm/share_pool.c:1238:22: note: 'noreclaim_flag' was declared here
    1238 |         unsigned int noreclaim_flag;
         |                      ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1043 mm/share_pool.c

  1039	
  1040	static unsigned long last_jiffies;
  1041	static void sp_compact_nodes(struct work_struct *work)
  1042	{
> 1043		sysctl_compaction_handler(NULL, 1, NULL, NULL, NULL);
  1044	
  1045		kfree(work);
  1046	}
  1047	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
