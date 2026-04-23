Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6B63BBA1D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Apr 2026 21:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776979362; cv=none; b=AnhLPs3/hHXDQCnggI7NvSFpGbKtawqYY+SKCDsqkdimaizNvkUeE/Uapn5CR6eyCxw8FRbOOSYzx/slh5Gh1jAaP+xHH6Yi+wIPYUV3nUJP3IWyvuiHVgThg3JL0R2CkqzHutTTI91H31IbOSewwmfS/KeSFO01AIm4PNjcyMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776979362; c=relaxed/simple;
	bh=D+dVB4P+QbntolW8KUEhJbrlOj9IlhcuIK8dhKvhRcI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aj74mTlqDbCymLLD7CUv76Wot14gGVgCiEjF9RsIfpL4RX9yI2H/n1Tg3LmY7FNs7M3SSv4ZGaVRXUauT15n6k0ee/8EC4UCWbmymSl3/IUmsOep65xahoGNIbCh1GHw0uNboovtuUeFT3g2WtBHonQHxQdwLiBWCC5wAUN8rEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SUxe2ymj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUxe2ymj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776979360; x=1808515360;
  h=date:from:to:cc:subject:message-id;
  bh=D+dVB4P+QbntolW8KUEhJbrlOj9IlhcuIK8dhKvhRcI=;
  b=SUxe2ymjf3q2/YAmUR4BpCRU9rUxwrpx+FZ/vTEl7Bj0Kz27h03aCgrL
   xkaGFa0iQp7OMIa1PM8YX3iI6s+a+7qgQbyJYNvMePrcPvR9OjisG6vJX
   f40F5S05zEjUiJZIMdSoy/goiF44srbWeXtihitHz54Bnc7nm75RM5wGl
   hYSJltcjWwEMKfm1/NjuotGzS6g8VNsxA9VVBsAihuAYgcmiibqvq1ArL
   V5oTAYqpk2W8R5KDQ0V12r+rbWYxEGcjO2GZsZW3CqlUjHYZ0QDX1+Dp1
   7091PWjvoFMuxX0xDbrQMmZtHiD+grOCJA9DnuyhpYDbKGD9AalbbNhRW
   w==;
X-CSE-ConnectionGUID: UWWr0QlRRK6hOEofx0Ig8A==
X-CSE-MsgGUID: N+BboAJSQPSHHPLGdwQ03A==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="76989711"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="76989711"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 14:22:39 -0700
X-CSE-ConnectionGUID: DnqbVSq0Toeum+3hGUnCig==
X-CSE-MsgGUID: Adbc19hFTJKOVP2iZymDWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="234550456"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Apr 2026 14:22:38 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wG1VL-000000004c9-2co8;
	Thu, 23 Apr 2026 21:22:35 +0000
Date: Fri, 24 Apr 2026 05:22:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/2]
 fs/fuse/fuse_bpf_backing.c:156:16: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202604240551.3VkFZ8kZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   dc4edd19a04926e66ac2e06938920ce8ed523344
commit: be926e6761d28d105ba672242e81e911e0d7e5e0 [0/2] ANDROID: fuse-bpf: fuse-bpf v1.3
config: i386-randconfig-062-20260423 (https://download.01.org/0day-ci/archive/20260424/202604240551.3VkFZ8kZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260424/202604240551.3VkFZ8kZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604240551.3VkFZ8kZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fuse/fuse_bpf_backing.c:156:16: sparse: sparse: Using plain integer as NULL pointer
   fs/fuse/fuse_bpf_backing.c:315:16: sparse: sparse: Using plain integer as NULL pointer
>> fs/fuse/fuse_bpf_backing.c:862:48: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __kernel_rwf_t [usertype] flags @@     got int @@
   fs/fuse/fuse_bpf_backing.c:862:48: sparse:     expected restricted __kernel_rwf_t [usertype] flags
   fs/fuse/fuse_bpf_backing.c:862:48: sparse:     got int
   fs/fuse/fuse_bpf_backing.c:949:59: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __kernel_rwf_t [usertype] flags @@     got int @@
   fs/fuse/fuse_bpf_backing.c:949:59: sparse:     expected restricted __kernel_rwf_t [usertype] flags
   fs/fuse/fuse_bpf_backing.c:949:59: sparse:     got int
>> fs/fuse/fuse_bpf_backing.c:2142:18: sparse: sparse: Initializer entry defined twice
   fs/fuse/fuse_bpf_backing.c:2143:18: sparse:   also defined here

vim +156 fs/fuse/fuse_bpf_backing.c

   145	
   146	void *fuse_open_finalize(struct fuse_bpf_args *fa,
   147			       struct inode *inode, struct file *file, bool isdir)
   148	{
   149		struct fuse_file *ff = file->private_data;
   150		struct fuse_open_out *foo = fa->out_args[0].value;
   151	
   152		if (ff) {
   153			ff->fh = foo->fh;
   154			ff->nodeid = get_fuse_inode(inode)->nodeid;
   155		}
 > 156		return 0;
   157	}
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
