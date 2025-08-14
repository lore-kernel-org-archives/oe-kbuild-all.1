Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3952FF66F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 00:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755130736; cv=none; b=a7ASxj+WReJJ/puT5lcBlQ4vGST2vsr3jHFwXGPYB34LtpdqKsz/a5nUafco7BevYLNYccjuUcqStR6YI3/65oB93BJKb6P8AsYFB6lNDwAZ+J8d1DfYyS69d/GKkZi9iY0Ni57JwwGnQgSWsG/Ls+Y1X8WcqMRUonLtf52r1GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755130736; c=relaxed/simple;
	bh=4oNrFQUT+V9Ty4ElHhzpX8Irzjqh9ydPqHyZfaW53eA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RxPrsSHXi6/EDUJSBKoKfAOiCvpLNEcKPlaNtuUG8v602eTqjx9K7o7krvcUGwnkJCUrksLr+iGOoLnE4IiHmXx+2lTvgm7e9g9KyDtxw1hI/jnszc7k9v5MIzfRzL7fRI6za3Ig4g7XzjCkX1/ie4ZRvguMqisLqr2CZvWaOCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJoN1AZh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJoN1AZh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755130734; x=1786666734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4oNrFQUT+V9Ty4ElHhzpX8Irzjqh9ydPqHyZfaW53eA=;
  b=cJoN1AZhmXDc+YiGPc7YV+MtWdBgHduh54CRIImDPsn8QPfO5Gj/qBZL
   s0F3MeMQJffBm1IfwMFLlCHiC9gU+B6ZnFVZp3eI+cScM5p/KrBDCEg8F
   jTPIbmm6WONy7mdXLnE9L68NTVu7wmr9xicTL4vrv95ADa5ld7erU1S8/
   zvJ/WSoAXJY6mM9LhiwzSo9UaxsTuX+zly9bibxo/dFdMxFVraC1wL9sx
   Aa7m85FQJ6H+llfoXYufrb81D1eI+3b0y1RkNO5l5K/MOJwwgegWeHZQf
   SaGfxDCPe8E9hjpC9I4uZjsTIb4o+hBon0bs7jLr4sVoB9uRiuD359d9j
   w==;
X-CSE-ConnectionGUID: W58dfq3bQRabRPhk5BXw6w==
X-CSE-MsgGUID: xdhQQv/pRz2Br44Yaiq3iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56651765"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="56651765"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 17:18:53 -0700
X-CSE-ConnectionGUID: DBG33CQgRLedcelOycA+OA==
X-CSE-MsgGUID: +j9J1I6zSuO7+3OemiOcZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="166990965"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 13 Aug 2025 17:18:53 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umLgA-00009D-26;
	Thu, 14 Aug 2025 00:18:50 +0000
Date: Thu, 14 Aug 2025 02:18:22 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-01 1/1] net/core/scm.c:95:24:
 error: no member named 'vertices' in 'struct scm_fp_list'
Message-ID: <202508140206.wOus3w3G-lkp@intel.com>
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
commit: 7231e4ad69b03a0246d1324150fe437d5d68b669 [1/1] UPSTREAM: af_unix: Allocate struct unix_vertex for each inflight AF_UNIX fd.
config: x86_64-buildonly-randconfig-2004-20250813 (https://download.01.org/0day-ci/archive/20250814/202508140206.wOus3w3G-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508140206.wOus3w3G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140206.wOus3w3G-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/scm.c:95:24: error: no member named 'vertices' in 'struct scm_fp_list'
      95 |                 INIT_LIST_HEAD(&fpl->vertices);
         |                                 ~~~  ^
   net/core/scm.c:384:28: error: no member named 'vertices' in 'struct scm_fp_list'
     384 |                 INIT_LIST_HEAD(&new_fpl->vertices);
         |                                 ~~~~~~~  ^
   2 errors generated.

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
  > 95			INIT_LIST_HEAD(&fpl->vertices);
    96	#endif
    97		}
    98		fpp = &fpl->fp[fpl->count];
    99	
   100		if (fpl->count + num > fpl->max)
   101			return -EINVAL;
   102	
   103		/*
   104		 *	Verify the descriptors and increment the usage count.
   105		 */
   106	
   107		for (i=0; i< num; i++)
   108		{
   109			int fd = fdp[i];
   110			struct file *file;
   111	
   112			if (fd < 0 || !(file = fget_raw(fd)))
   113				return -EBADF;
   114			/* don't allow io_uring files */
   115			if (io_is_uring_fops(file)) {
   116				fput(file);
   117				return -EINVAL;
   118			}
   119			if (unix_get_socket(file))
   120				fpl->count_unix++;
   121	
   122			*fpp++ = file;
   123			fpl->count++;
   124		}
   125	
   126		if (!fpl->user)
   127			fpl->user = get_uid(current_user());
   128	
   129		return num;
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
