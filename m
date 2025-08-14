Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9470618DB37
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 01:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755135001; cv=none; b=BeVXWERDcBiUdgosfGWMfCrQqSccOWKkcJ+6JLs7qD6h/NTIDzeY7/3f5o78YgUBs2mC/tKmwrwazCds/gN+rHTcufE4tP84FouE6/G0qQWhbpMSHs3a3PO7Hqyrea0swb7b41kGd428S1nGX1IKH9HRG9mcl0dOB/lFP+cJsi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755135001; c=relaxed/simple;
	bh=3VkT9E4XBhRWbvkK0sDCx/571uI6vNHf5bmry1joc7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sHJMrzoacsxWck1rR24O3lyHut/qsBOe0NYxe9dlvC9qilOEpDV+pO197AzX5iu47Kf64keYTkUT+TiBEE2nH43BzeahQ93eFbmwOHefpddFUNPFPsyDuuwBwAoiWGmybB8reSPSAgo6fvLJoNtT52uAqxEnFMRIXbLHjgkmPro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmhfvvCS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmhfvvCS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755134999; x=1786670999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3VkT9E4XBhRWbvkK0sDCx/571uI6vNHf5bmry1joc7M=;
  b=NmhfvvCSMiHUVIfyGfzuAuCPwocZi/jQdHSH4RtHZlmp1senyJ7n+Vf4
   iUhF+I3/EpGe5ai/OG2oihHDnvDlUn0W2Pw7feugGwkjCDbnJGt2CbZHy
   /311oDJvHNbiSXs4b2FLg1kmdOvzMKVChHrpN21b3b9bD08TVMjLS1vgf
   vATzGS/izCjzA0fpQ88igi0Udiapu9+n1XSrfmlB8ZKWl8bsT+z95GEWY
   smV9RnTbgbSVueDqHOOaUPDuI5++eL/rYmOeT4Wi9bVg9DQIZzfCN/CgQ
   IjqU9OTYtHeMlSN7vWVxzIyiHz0TIaCx4hkcjdiCZZwzUpZUxJ0YuDr0A
   g==;
X-CSE-ConnectionGUID: O1niDEC0TZCnOMu67cjR6w==
X-CSE-MsgGUID: wjwStpFgTHqG+B2gXuBf+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57347264"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57347264"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 18:29:58 -0700
X-CSE-ConnectionGUID: QVuvywOQQHG8zSLrlYo7tg==
X-CSE-MsgGUID: 1bzHm3+XTDGeUQPMG4aqZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="166120824"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 13 Aug 2025 18:29:57 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umMmx-0000A3-0K;
	Thu, 14 Aug 2025 01:29:55 +0000
Date: Thu, 14 Aug 2025 03:29:24 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-01 1/1] net/core/scm.c:95:8:
 error: no member named 'edges' in 'struct scm_fp_list'
Message-ID: <202508140307.H1RgNpX5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-01
head:   c8d465512cdf4115614f49004b013741d7fbabeb
commit: 84a59c9eb1a6b72ceb8c0f639a75c10a9c5d8bc7 [1/1] UPSTREAM: af_unix: Allocate struct unix_edge for each inflight AF_UNIX fd.
config: x86_64-buildonly-randconfig-2004-20250813 (https://download.01.org/0day-ci/archive/20250814/202508140307.H1RgNpX5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508140307.H1RgNpX5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140307.H1RgNpX5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/scm.c:95:8: error: no member named 'edges' in 'struct scm_fp_list'
      95 |                 fpl->edges = NULL;
         |                 ~~~  ^
   net/core/scm.c:96:24: error: no member named 'vertices' in 'struct scm_fp_list'
      96 |                 INIT_LIST_HEAD(&fpl->vertices);
         |                                 ~~~  ^
   net/core/scm.c:385:12: error: no member named 'edges' in 'struct scm_fp_list'
     385 |                 new_fpl->edges = NULL;
         |                 ~~~~~~~  ^
   net/core/scm.c:386:28: error: no member named 'vertices' in 'struct scm_fp_list'
     386 |                 INIT_LIST_HEAD(&new_fpl->vertices);
         |                                 ~~~~~~~  ^
   4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +95 net/core/scm.c

    68	
    69	static int scm_fp_copy(struct cmsghdr *cmsg, struct scm_fp_list **fplp)
    70	{
    71		int *fdp = (int*)CMSG_DATA(cmsg);
    72		struct scm_fp_list *fpl = *fplp;
    73		struct file **fpp;
    74		int i, num;
    75	
    76		num = (cmsg->cmsg_len - sizeof(struct cmsghdr))/sizeof(int);
    77	
    78		if (num <= 0)
    79			return 0;
    80	
    81		if (num > SCM_MAX_FD)
    82			return -EINVAL;
    83	
    84		if (!fpl)
    85		{
    86			fpl = kmalloc(sizeof(struct scm_fp_list), GFP_KERNEL_ACCOUNT);
    87			if (!fpl)
    88				return -ENOMEM;
    89			*fplp = fpl;
    90			fpl->count = 0;
    91			fpl->count_unix = 0;
    92			fpl->max = SCM_MAX_FD;
    93			fpl->user = NULL;
    94	#if IS_ENABLED(CONFIG_UNIX)
  > 95			fpl->edges = NULL;
    96			INIT_LIST_HEAD(&fpl->vertices);
    97	#endif
    98		}
    99		fpp = &fpl->fp[fpl->count];
   100	
   101		if (fpl->count + num > fpl->max)
   102			return -EINVAL;
   103	
   104		/*
   105		 *	Verify the descriptors and increment the usage count.
   106		 */
   107	
   108		for (i=0; i< num; i++)
   109		{
   110			int fd = fdp[i];
   111			struct file *file;
   112	
   113			if (fd < 0 || !(file = fget_raw(fd)))
   114				return -EBADF;
   115			/* don't allow io_uring files */
   116			if (io_is_uring_fops(file)) {
   117				fput(file);
   118				return -EINVAL;
   119			}
   120			if (unix_get_socket(file))
   121				fpl->count_unix++;
   122	
   123			*fpp++ = file;
   124			fpl->count++;
   125		}
   126	
   127		if (!fpl->user)
   128			fpl->user = get_uid(current_user());
   129	
   130		return num;
   131	}
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
