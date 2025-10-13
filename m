Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEAC20125F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 17:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760376320; cv=none; b=chXmMwOHM8rI4o9f+SEMbXkdsjA/72K/TmWeD3547oAV0wgp4B63wmscIfSwiovMmXNwN77IodKLFNF2iHS4UfYeuiHpOEAx+YQULs66MeSDyBz20UMbgf0COwpomXXIVNmEVyWuD2osLQF8Fc3KwUMloJzfjAWvg2dLiLJS3wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760376320; c=relaxed/simple;
	bh=LUz6lZrXABWBdmGIJHxo6Q2pijPy0RODmfzvta+k8pk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LBRHLyJwWaXJPiytSYfqz19WTkIxEOnolf/3hXk5F2vvwSYEHBfP+6NirL6Bf7yQRm239prhu5NpfKevZOfT7YmHdCZUZKCLwuwpLwqRVNkBSJ3FXSWGJ4pnb9UyukRYUSV1/Cv38SpczyBYA9so4b95dm++2Yr1vYL1n4IwRiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kaNhT2FZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kaNhT2FZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760376318; x=1791912318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LUz6lZrXABWBdmGIJHxo6Q2pijPy0RODmfzvta+k8pk=;
  b=kaNhT2FZoZvtQG7Ib8323wb5aTF817BjzlL3OyxlkmttRM3suBDjmhIs
   NgdCo1Y7LQl+gnN3Z0Rrncjsb97OhPlaXIU7nrECqzAbOdM4nh2IXUOmt
   InSNIIzMfG9h0Yh7d0OLNOFdoOgd7+/PVZC/d+NAEUPaS8bTmSdApbFHv
   bSdhY0vpM8FK63pPtDYWgmb4jZJaMvODWBElLs8ZHgDenh1s64hgij+OV
   /fY2ep18cn5Hm+OP2FT2Fnw2guRbGPDVmZxTwYqSVSHAxeohaqP72BwfG
   /YZKBsm27ul7CLHV3xWivBaHkBA3YEvTLQSptzjlm+eiwzR/Y75AtMvA3
   A==;
X-CSE-ConnectionGUID: hzMTnYwaRkyY78Xl1BVNVw==
X-CSE-MsgGUID: 9tG2sxAqQ1CkuvBKrsGG+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73971065"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="73971065"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 10:25:18 -0700
X-CSE-ConnectionGUID: 1pgETg8XTzq+QX6zHzkFuQ==
X-CSE-MsgGUID: NdMK7JqeQGSkuCQcrGq3ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="205347117"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 13 Oct 2025 10:25:16 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8MIL-0001ux-2X;
	Mon, 13 Oct 2025 17:25:13 +0000
Date: Tue, 14 Oct 2025 01:24:55 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/syzbot 5/5] fs/f2fs/xattr.h:156:13: warning:
 'f2fs_destroy_xattr_cache' defined but not used
Message-ID: <202510140134.TvEMgTHM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
head:   519a1cbfb1f287de5edded596f01a41af0cf25ec
commit: 519a1cbfb1f287de5edded596f01a41af0cf25ec [5/5] f2fs: use global inline_xattr_slab instead of per-sb slab cache
config: sparc-randconfig-002-20251013 (https://download.01.org/0day-ci/archive/20251014/202510140134.TvEMgTHM-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510140134.TvEMgTHM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510140134.TvEMgTHM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/file.c:31:
>> fs/f2fs/xattr.h:156:13: warning: 'f2fs_destroy_xattr_cache' defined but not used [-Wunused-function]
    static void f2fs_destroy_xattr_cache(void) { }
                ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/f2fs/xattr.h:155:19: warning: 'f2fs_init_xattr_cache' defined but not used [-Wunused-function]
    static int __init f2fs_init_xattr_cache(void) { return 0; }
                      ^~~~~~~~~~~~~~~~~~~~~


vim +/f2fs_destroy_xattr_cache +156 fs/f2fs/xattr.h

   140	
   141	#define f2fs_xattr_handlers	NULL
   142	#define f2fs_listxattr		NULL
   143	static inline int f2fs_setxattr(struct inode *inode, int index,
   144			const char *name, const void *value, size_t size,
   145			struct folio *folio, int flags)
   146	{
   147		return -EOPNOTSUPP;
   148	}
   149	static inline int f2fs_getxattr(struct inode *inode, int index,
   150				const char *name, void *buffer,
   151				size_t buffer_size, struct folio *dfolio)
   152	{
   153		return -EOPNOTSUPP;
   154	}
 > 155	static int __init f2fs_init_xattr_cache(void) { return 0; }
 > 156	static void f2fs_destroy_xattr_cache(void) { }
   157	#endif
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
