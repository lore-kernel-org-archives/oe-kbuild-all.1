Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2104418B12
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 02:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755138905; cv=none; b=YDSsGj0MwJjixBqKYPCbHaWPbY9BCmVy4W24S771wuWkfqELw4KuyOg29yzYLFUxb5X/icufY8n1Qaxzvd+mjq7ItklX3POrqp9AYSBglILN05psqT39PHOct2uYzim73uWd7bJ2vvrX7FyCbtgbqYDMH5ch32iAtP0oOZVBtYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755138905; c=relaxed/simple;
	bh=N60bDnLAPN5Wh5Oy9gmeS9fn7pMQZpwWNCI3T53BA0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sPtFPtAhfOLG1NJeL25YrxiH79BVleMZelKUQKmV2TRd0/mUw36feUjW3OQZEDDp2gAR6DLpwGUWGuy0iHwahNwvrE5ZBO6mi9xCOBy3rBFoQxhStvWqkzNivCviQPrS6JREcfrWH7xKSN26z0PqjJqnpqzmsyyJzC0kP0FJXz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ei3sAEzz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ei3sAEzz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755138903; x=1786674903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N60bDnLAPN5Wh5Oy9gmeS9fn7pMQZpwWNCI3T53BA0Y=;
  b=Ei3sAEzzcB/G8OfiatIrKQlTF/bd+yv96FZIgkwTAXwl4lW4vNBwlvq1
   ZXmG7V4iHJ0kEacDup402N+Uo8pHh74cgkNKwciT7ZWQQ7eRHWe7NxVcm
   6KHt3ksaf5Zn66hB6+y7vsSeZ0hzFzdrimpd6c0WKfSmtTnyzLen62OtO
   uhnced3YoLybr+LbJ+QFpDqZxgdciKdJtuOHvkpLhBpZUWihSfpC64VxV
   MAHXKbe/Q+/xDRjmewF9DwbrWrF8t7S9DVQksUZgkn54e5b6KXVEmosHK
   xoEg0iqn3DWKFKT9S5PgTLmLYobBN/uKf+c4rCU/N/oxH+RqIrRfIQgPt
   w==;
X-CSE-ConnectionGUID: RdBNO/B7QLuKkbqNC1Zj5g==
X-CSE-MsgGUID: l2HzYA3sSrqhNZq4Z9HxNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68148945"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="68148945"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 19:35:02 -0700
X-CSE-ConnectionGUID: ob8R+3A6QH6rynjocKYNBg==
X-CSE-MsgGUID: 4aoZMx1rRzSX/VRCnB05/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="197631370"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 13 Aug 2025 19:35:01 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umNnu-0000Al-31;
	Thu, 14 Aug 2025 02:34:58 +0000
Date: Thu, 14 Aug 2025 04:34:33 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-01 1/1] net/core/scm.c:95:8:
 error: no member named 'inflight' in 'struct scm_fp_list'
Message-ID: <202508140419.RQyxsN9J-lkp@intel.com>
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
commit: 022a11b9bd5dda54a6d3c981fdffc001fb751b4c [1/1] UPSTREAM: af_unix: Link struct unix_edge when queuing skb.
config: x86_64-buildonly-randconfig-2004-20250813 (https://download.01.org/0day-ci/archive/20250814/202508140419.RQyxsN9J-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508140419.RQyxsN9J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140419.RQyxsN9J-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/scm.c:95:8: error: no member named 'inflight' in 'struct scm_fp_list'
      95 |                 fpl->inflight = false;
         |                 ~~~  ^
   net/core/scm.c:96:8: error: no member named 'edges' in 'struct scm_fp_list'
      96 |                 fpl->edges = NULL;
         |                 ~~~  ^
   net/core/scm.c:97:24: error: no member named 'vertices' in 'struct scm_fp_list'
      97 |                 INIT_LIST_HEAD(&fpl->vertices);
         |                                 ~~~  ^
   net/core/scm.c:386:12: error: no member named 'inflight' in 'struct scm_fp_list'
     386 |                 new_fpl->inflight = false;
         |                 ~~~~~~~  ^
   net/core/scm.c:387:12: error: no member named 'edges' in 'struct scm_fp_list'
     387 |                 new_fpl->edges = NULL;
         |                 ~~~~~~~  ^
   net/core/scm.c:388:28: error: no member named 'vertices' in 'struct scm_fp_list'
     388 |                 INIT_LIST_HEAD(&new_fpl->vertices);
         |                                 ~~~~~~~  ^
   6 errors generated.

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
  > 95			fpl->inflight = false;
    96			fpl->edges = NULL;
    97			INIT_LIST_HEAD(&fpl->vertices);
    98	#endif
    99		}
   100		fpp = &fpl->fp[fpl->count];
   101	
   102		if (fpl->count + num > fpl->max)
   103			return -EINVAL;
   104	
   105		/*
   106		 *	Verify the descriptors and increment the usage count.
   107		 */
   108	
   109		for (i=0; i< num; i++)
   110		{
   111			int fd = fdp[i];
   112			struct file *file;
   113	
   114			if (fd < 0 || !(file = fget_raw(fd)))
   115				return -EBADF;
   116			/* don't allow io_uring files */
   117			if (io_is_uring_fops(file)) {
   118				fput(file);
   119				return -EINVAL;
   120			}
   121			if (unix_get_socket(file))
   122				fpl->count_unix++;
   123	
   124			*fpp++ = file;
   125			fpl->count++;
   126		}
   127	
   128		if (!fpl->user)
   129			fpl->user = get_uid(current_user());
   130	
   131		return num;
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
