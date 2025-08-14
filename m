Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA8911CA0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 03:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755142808; cv=none; b=N5jMSMbrv3k9Jlgf4TWpluX60Yww0AzeNsg54vIXtJ8OsJ1QtkOTg7Hk4ZS0Eqnima+oaQv9w3C04yROeSU7XCvGtXKFYCQqTydW4cTlpngkn1X8E8ekLzrMU7QhatHWNr7jPZbmN3ebjtHDVgTRsWj1bVd3UeK9cMb9NS/X5ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755142808; c=relaxed/simple;
	bh=C4oDCBvnncVW86xLQ9n4UHNguior+lJV2t5kTrRmQ+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rPRmhTMjUTxoRnX1ZojPtYNKLbI4F70pAKK8QlOp7d2ZwNenEEMKlHFHp+2ctMI/1UhJdsqJHksEGUcxlSLzhxw4iDO6zkxU/sKejGxecQNRRKDPYdq8hWjEh3Z/VN4KrRZ0hOAkdDBH+ZmRMvyXs1I8TbQMQO4LSpLV0yNmGkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OL9NQRc+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OL9NQRc+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755142806; x=1786678806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C4oDCBvnncVW86xLQ9n4UHNguior+lJV2t5kTrRmQ+g=;
  b=OL9NQRc+0ouZ0lNSPtX4moiWm1bNMHThrgW+nJJSf/vNgfXN5F3i+YPc
   a/rdf4oDzlk4Bn67LAMbICVKE/B1bMYdz3QXT9D/4XtRor8/rWEwk9U/x
   lGEs3tKsHWJg1/xzgprt6P4pjRIK+XaB4aCoRqv9lhHCfcYlkGP+9HPjt
   iOilwHL2zo47lIofa+r+8ujzETH7hCp2qga+ucHQ5mVR9EUZNgGtQt4m9
   CtHdh4SgxLyImyeLRe9bJJVsgypgKUAsY+J7cswawZBMZ9c0afEy3s3aD
   7oORMP+BZJw+MFI/xj4FcSKXiRZ4W9IvblAPloSTSsBy2DMSXzZlTP/m8
   w==;
X-CSE-ConnectionGUID: ODR/PrDeSdunOkxFuD27xQ==
X-CSE-MsgGUID: fAyP0VplS1SwSEdUkVH0ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="60077290"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="60077290"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 20:40:06 -0700
X-CSE-ConnectionGUID: txK8xDqiQFCKyWmthhmmsg==
X-CSE-MsgGUID: RoFVOcPET1OWugBNJbAUnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="166638181"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 13 Aug 2025 20:40:05 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umOos-0000BP-2n;
	Thu, 14 Aug 2025 03:40:02 +0000
Date: Thu, 14 Aug 2025 05:39:55 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-01 1/1] net/core/scm.c:96:8:
 error: no member named 'dead' in 'struct scm_fp_list'
Message-ID: <202508140537.Mtk0jAlE-lkp@intel.com>
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
commit: ffd46a72008507c048e938cdd9f330f6e02d80f6 [1/1] UPSTREAM: af_unix: Add dead flag to struct scm_fp_list.
config: x86_64-buildonly-randconfig-2004-20250813 (https://download.01.org/0day-ci/archive/20250814/202508140537.Mtk0jAlE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508140537.Mtk0jAlE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140537.Mtk0jAlE-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/scm.c:95:8: error: no member named 'inflight' in 'struct scm_fp_list'
      95 |                 fpl->inflight = false;
         |                 ~~~  ^
>> net/core/scm.c:96:8: error: no member named 'dead' in 'struct scm_fp_list'
      96 |                 fpl->dead = false;
         |                 ~~~  ^
   net/core/scm.c:97:8: error: no member named 'edges' in 'struct scm_fp_list'
      97 |                 fpl->edges = NULL;
         |                 ~~~  ^
   net/core/scm.c:98:24: error: no member named 'vertices' in 'struct scm_fp_list'
      98 |                 INIT_LIST_HEAD(&fpl->vertices);
         |                                 ~~~  ^
   net/core/scm.c:387:12: error: no member named 'inflight' in 'struct scm_fp_list'
     387 |                 new_fpl->inflight = false;
         |                 ~~~~~~~  ^
   net/core/scm.c:388:12: error: no member named 'edges' in 'struct scm_fp_list'
     388 |                 new_fpl->edges = NULL;
         |                 ~~~~~~~  ^
   net/core/scm.c:389:28: error: no member named 'vertices' in 'struct scm_fp_list'
     389 |                 INIT_LIST_HEAD(&new_fpl->vertices);
         |                                 ~~~~~~~  ^
   7 errors generated.

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


vim +96 net/core/scm.c

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
    95			fpl->inflight = false;
  > 96			fpl->dead = false;
    97			fpl->edges = NULL;
    98			INIT_LIST_HEAD(&fpl->vertices);
    99	#endif
   100		}
   101		fpp = &fpl->fp[fpl->count];
   102	
   103		if (fpl->count + num > fpl->max)
   104			return -EINVAL;
   105	
   106		/*
   107		 *	Verify the descriptors and increment the usage count.
   108		 */
   109	
   110		for (i=0; i< num; i++)
   111		{
   112			int fd = fdp[i];
   113			struct file *file;
   114	
   115			if (fd < 0 || !(file = fget_raw(fd)))
   116				return -EBADF;
   117			/* don't allow io_uring files */
   118			if (io_is_uring_fops(file)) {
   119				fput(file);
   120				return -EINVAL;
   121			}
   122			if (unix_get_socket(file))
   123				fpl->count_unix++;
   124	
   125			*fpp++ = file;
   126			fpl->count++;
   127		}
   128	
   129		if (!fpl->user)
   130			fpl->user = get_uid(current_user());
   131	
   132		return num;
   133	}
   134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
