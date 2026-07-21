Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7A43750CA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jul 2026 13:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641774; cv=none; b=Eb0E1bZyHlm7i8comTwlrng35gJiSOw+DZWKkr7xTjdmcLni9NK+VsMtXm8NiBU0ecNH1ZEdPMUnGFpEPrhFIMOpBGMfEPliE4OTBUZbi1kxyObkyiH0Bcp6Cpv6zHlrQs2IkqJtnUkzh8ZZ74pU2/L8EprmRh12D3oWdsPFSCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641774; c=relaxed/simple;
	bh=v/y29VJ2iiyaFEZQ3Q+9gPiAmZdhM1tSYps0CcXCf18=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XyxgpQ1KYlsf/CQVwCAvE4/3ZT1jw7OuyQQ8YRlLTbjjRiV20TWoG4Q+08I8reC9cyy8McyswirtevgJBidLEf8IxeyQgNH2sm63Wr9YHYVmT6htYdZOWWVb4SHgxoPehUlsIDaTA4/ePhA0j+LEkgje1OR+tp/cGF5nicn4HsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MoYyM2Ay; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MoYyM2Ay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784641773; x=1816177773;
  h=date:from:to:cc:subject:message-id;
  bh=v/y29VJ2iiyaFEZQ3Q+9gPiAmZdhM1tSYps0CcXCf18=;
  b=MoYyM2AyeMaLIOI5eVtv07fEP0JZbfGjSYhLVv6mSq1CXHhfbFA6lt4Y
   H8EjkostwrRyIcG/qrOrboAxManlK3imYNo5lCuGTy6A4aVsa3Rt3Qped
   S+a3Y9ox8UO9Vi5PrEn8DtSLcafo7M1/3FdnJL3s+2zT+zZ/TnYqwLg4K
   DrTUbd2tgkq3cLCwmu3Jsz2LN4B+YwDH1G/VLlyRralLsOGs0xhJHC534
   ma3FOAu8kYabhAStxuXGFm62qOdhpK123W982rxJR/KwSJj98Lyt6OMMd
   vu7dkdF9IwyRzs5D5rPRXULo5gCMa8qy+176pyAmYEoX4oHZ3/E5z1wjj
   A==;
X-CSE-ConnectionGUID: lSIRMc/KSZOVsg9R70oHwQ==
X-CSE-MsgGUID: EJ3tjzDITYq3eSWq64SyuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85360191"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="85360191"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 06:49:32 -0700
X-CSE-ConnectionGUID: uxNlzew8SGagFbrw2IHmeA==
X-CSE-MsgGUID: FjUI1ME4RPyxsIwH56STDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="255130578"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 21 Jul 2026 06:49:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmAqe-00000000Xc7-13NQ;
	Tue, 21 Jul 2026 13:49:28 +0000
Date: Tue, 21 Jul 2026 21:49:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-04 14/14]
 fs/fuse/dir.c:365:13: warning: 'fuse_dentry_release' defined but not used
Message-ID: <202607212136.NJMMrW69-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Paul,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-04
head:   bbf6a2e83ab5d0b5043355d606cd75cc141d23a0
commit: be926e6761d28d105ba672242e81e911e0d7e5e0 [14/14] ANDROID: fuse-bpf: fuse-bpf v1.3
config: i386-randconfig-141-20260721 (https://download.01.org/0day-ci/archive/20260721/202607212136.NJMMrW69-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260721/202607212136.NJMMrW69-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607212136.NJMMrW69-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/dir.c:365:13: warning: 'fuse_dentry_release' defined but not used [-Wunused-function]
     365 | static void fuse_dentry_release(struct dentry *dentry)
         |             ^~~~~~~~~~~~~~~~~~~
>> fs/fuse/dir.c:358:12: warning: 'fuse_dentry_init' defined but not used [-Wunused-function]
     358 | static int fuse_dentry_init(struct dentry *dentry)
         |            ^~~~~~~~~~~~~~~~


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
