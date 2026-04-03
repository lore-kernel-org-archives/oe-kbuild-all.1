Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B677E35A939
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205965; cv=none; b=qmv8TB0jHqs6gLKeHue00wkH7WXkt/S34SC8unAGNbnuzIO9mCcslk+QS6vkjxA2fxbgZuFi6cc1qVjPPzRSbVUWjeja0YsxrXKtd82ObVqbAl24t+w7oC9JpeVnFumgyWLsLoBrMLxb9P+vflxjCgsTQa03M/y/4Ki2Jf7alDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205965; c=relaxed/simple;
	bh=WF1tKvih/qkXduGe2ce9Jo5xVFyFUXNGNxAhabgbbV8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iCTRg3ZbZhf+QWgWqbfVOCri/YXQg9DHiZbFNtoqYRbX5jbglbOVLC0tBxISRMiFVqrmFKtVIWkmgepyng9shrlQumbyxI9dIaDKY/ibvagTvHqp2pMxWXGV4sHER1+7XsZvGwq8LSJOBTh6qCMcsi7WE37C8BnZeBNqG7WGWsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YaIUK6ZO; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YaIUK6ZO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205964; x=1806741964;
  h=date:from:to:cc:subject:message-id;
  bh=WF1tKvih/qkXduGe2ce9Jo5xVFyFUXNGNxAhabgbbV8=;
  b=YaIUK6ZOI9S5NblxPY6XtPHtodBRdxM7mVY11pd26PnV104uz3TkYhev
   H9I5pADtp8h2sLl9JcLNgFpDra9c1vjTbrzqn58H69CQClrm4DpeSX97L
   Q9DLxUV9ugE/PadlaeCgYfr9VVrERhCy9BgM/Do8DycJi68twLFMtopvA
   ljAEuqwZS/DSsU0VEZ8sS/WBKHd5fpIyZmMDwPlfIyZC9CJ2BFgV/7Ahq
   juFuvvcnaT305HB4KhtbPDOIJXsOzQ4PBmRGO8zY25IBibVBdCIOQ3OiH
   uV4U9i/3aKumsKlnwZJl+BsXQQ8+2mwWxpZbxx3+w7GNlH8uN+Bhamga4
   w==;
X-CSE-ConnectionGUID: tbulYH9FQWex6Slmbi88MA==
X-CSE-MsgGUID: 0QKMOjtYSueq2TIZJsHWAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86889036"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86889036"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:46:01 -0700
X-CSE-ConnectionGUID: h8GfsRsYSiG213uGgm+oGg==
X-CSE-MsgGUID: bu0ParqxSGuOhiESQY+B2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="226369006"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Apr 2026 01:45:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aA8-00000000169-2Jib;
	Fri, 03 Apr 2026 08:45:56 +0000
Date: Fri, 03 Apr 2026 16:45:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/2] fs/fuse/dir.c:365:13:
 warning: 'fuse_dentry_release' defined but not used
Message-ID: <202604031052.SQcKoebM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   5298296390b678b55d9e5d5e165ab0feb552f7dc
commit: be926e6761d28d105ba672242e81e911e0d7e5e0 [0/2] ANDROID: fuse-bpf: fuse-bpf v1.3
config: i386-buildonly-randconfig-003-20260403 (https://download.01.org/0day-ci/archive/20260403/202604031052.SQcKoebM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031052.SQcKoebM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031052.SQcKoebM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/dir.c:365:13: warning: 'fuse_dentry_release' defined but not used [-Wunused-function]
     365 | static void fuse_dentry_release(struct dentry *dentry)
         |             ^~~~~~~~~~~~~~~~~~~
>> fs/fuse/dir.c:358:12: warning: 'fuse_dentry_init' defined but not used [-Wunused-function]
     358 | static int fuse_dentry_init(struct dentry *dentry)
         |            ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHY_PACKAGE
   Depends on [n]: NETDEVICES [=n] && PHYLIB [=n]
   Selected by [y]:
   - GKI_HIDDEN_PHY_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/fuse_dentry_release +365 fs/fuse/dir.c

e5e5558e923f358 Miklos Szeredi     2005-09-09  356  
be926e6761d28d1 Paul Lawrence      2021-12-02  357  #if BITS_PER_LONG < 64 || defined(CONFIG_FUSE_BPF)
f75fdf22b0a8470 Miklos Szeredi     2016-10-01 @358  static int fuse_dentry_init(struct dentry *dentry)
f75fdf22b0a8470 Miklos Szeredi     2016-10-01  359  {
be926e6761d28d1 Paul Lawrence      2021-12-02  360  	dentry->d_fsdata = kzalloc(sizeof(struct fuse_dentry),
dc69e98c241e145 Khazhismel Kumykov 2019-09-17  361  				   GFP_KERNEL_ACCOUNT | __GFP_RECLAIMABLE);
f75fdf22b0a8470 Miklos Szeredi     2016-10-01  362  
f75fdf22b0a8470 Miklos Szeredi     2016-10-01  363  	return dentry->d_fsdata ? 0 : -ENOMEM;
f75fdf22b0a8470 Miklos Szeredi     2016-10-01  364  }
f75fdf22b0a8470 Miklos Szeredi     2016-10-01 @365  static void fuse_dentry_release(struct dentry *dentry)
f75fdf22b0a8470 Miklos Szeredi     2016-10-01  366  {
be926e6761d28d1 Paul Lawrence      2021-12-02  367  	struct fuse_dentry *fd = dentry->d_fsdata;
be926e6761d28d1 Paul Lawrence      2021-12-02  368  

:::::: The code at line 365 was first introduced by commit
:::::: f75fdf22b0a84702d1b72fc1ccd53dcdde121c16 fuse: don't use ->d_time

:::::: TO: Miklos Szeredi <mszeredi@redhat.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
