Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2346535E926
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 17:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788631196; cv=none; b=XZ7+r6KhyD34GRkmwGQm+m/OPI0Lqp5kemLwrb93Nb6LcGifI8r+CrAmKXf0EnzSGtLO1cvgA9hHZyoXZWOlCirilenRwzSjOBFDBIMDLS+Frfx5N7S9pDCrsSrFvnWZ5ln3pAIceBvMnl3Kdpes+F6ml0j+L4BLPrH6klZUuEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788631196; c=relaxed/simple;
	bh=DbF7YtE2FPgWzqKItePIzOPtjW59QrTd8TEE5LnRd3A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SHRSlVsz4OuGFocIPeH9+8TLwykVToV6T2iSJ8h3zqlRcpz4mIHi8uCsFSZ6TKIi1E94PicK1g0+QbX1PA45YnEPTSCg9z4VWlzQnchBzVCUSMStHQ6/hY+3tXa8YxYuzdue902xoOJJDTZmy04z6ckimCrtZSya13COr8cAuy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCZBWhSg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCZBWhSg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788631194; x=1820167194;
  h=date:from:to:cc:subject:message-id;
  bh=DbF7YtE2FPgWzqKItePIzOPtjW59QrTd8TEE5LnRd3A=;
  b=YCZBWhSgzrdmHgyVT5DGKR+4tMOxlfe0rmlnbM+oTlPikHitAsKZxp6i
   VyiCXHONkPoADiYAQlUQUHALgByzkv5V5/t51yxH82wckwCMPdfV4klAq
   Kg+FTgNcb4SmyQ+fI4UGF6/L0TjsfJI9KHObUmE6a27JnIPGbyFCdl3R2
   lTkvAw5u5H6uJ+LMDFgk0o2fFUn4lQBP8qaO4ewrlQXxBlYc0IO6wlgdh
   jzjtkfi9NHf/Q/YWsmugo2LXzLpG2bolx7G1i+ktIlPkVWV9Jt6VXBYUk
   b2A/s16ZPUSbY1X+4iw42csdsLZdbWNMkiXx5d3NoTLRzTxHXCKEJ+S9U
   w==;
X-CSE-ConnectionGUID: OV/16KveTSOvKK7FIDqSOQ==
X-CSE-MsgGUID: ISgIT/GdSuOEWjqsNBJ2/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="91614088"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="91614088"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 10:59:54 -0700
X-CSE-ConnectionGUID: Awte+OREQFmydI4xoxm74w==
X-CSE-MsgGUID: vbdYFvT3ROKMVuXu/kvEdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="268588311"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Sep 2026 10:59:53 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2ugA-000000000v1-0HBp;
	Sat, 05 Sep 2026 17:59:50 +0000
Date: Sun, 06 Sep 2026 01:59:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-06 0/1]
 fs/fuse/fuse_bpf_backing.c:156:16: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202609060108.q8MKmXJY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-06
head:   de2fe859a26ac8b782d8d325668854871edb9f6d
commit: be926e6761d28d105ba672242e81e911e0d7e5e0 [0/1] ANDROID: fuse-bpf: fuse-bpf v1.3
config: i386-randconfig-061-20260904 (https://download.01.org/0day-ci/archive/20260906/202609060108.q8MKmXJY-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260906/202609060108.q8MKmXJY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609060108.q8MKmXJY-lkp@intel.com/

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
