Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A089144F579
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 12:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789129936; cv=none; b=GULoX4ovrBpphw/7OpkaVnYDPmn/jEB6TLKi4vkN5KrecN5paVPZYSrfkzY5fzrJy2FWtmiJpn5h5WQHDz+0IySmE1Lld3VMzM7R1LvGKYuOvMpsaCcpmD5JY/17LJ/PGA6E8vcs6PDR8OCZUaNzRlIUx3gktrbQtW6z6Nh0zCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789129936; c=relaxed/simple;
	bh=N0HSJ198XkA3bbYRGyuBddnmhOQwAkAO+xz68UVxBAo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qRE4TNkfV97CyLGpBbtBL8N0jm6H3Ont880zAvOz0zDz2SKLWeLt9b14LtiQJ23+pNeKRDCtOGJ0gxdSYFrO1oH4SNunKOq5Hwv7vaRJKh94PrAYOyTCCdXRgqkI0l7SJtsSkzyeJtkhG8pUuLwKnB4s0uQbMcFjPlC2Iohdras=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPRcpEiG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPRcpEiG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789129929; x=1820665929;
  h=date:from:to:cc:subject:message-id;
  bh=N0HSJ198XkA3bbYRGyuBddnmhOQwAkAO+xz68UVxBAo=;
  b=JPRcpEiGnyfDuefA3U/CxjNciWbURFmdtw4hpCaPZYQ7bU9Ji2ARZd3X
   B52r93sSFQk5WORCOsxl9pzR6YKq8LJt78jKQ79nsQK8ipKyyDqCcgKI0
   Vnyfx+hsoJpqM7HvEqdC+BqSRrFSUmOeTYv8z+6IALvMFeXe8eGMa1/5T
   g7WIMpMWIphkMttnebw2PkLKGA8taMtypZAcZcv0CXP5ROtnbjkiEprtK
   m2hqSfKT46nXsMTJCKDuqf7e7DMk15rU0y81EX9kcLOkZ+3xvDD1vbrKb
   2rp6SNF4cvhhpAl1TkvMSqF2WzZK8vORitzFSJoYMyXWkfrvTwCO+1RNW
   w==;
X-CSE-ConnectionGUID: mAxxCm2JTaiemGhsQXKDaQ==
X-CSE-MsgGUID: 5HaqhI3sQpaRYFXKOY+j9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100254958"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100254958"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 05:32:02 -0700
X-CSE-ConnectionGUID: zBtsUvRwRSyKqXxeRmWxvQ==
X-CSE-MsgGUID: utsFYSjnRuum6jglk+opQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="271883208"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 11 Sep 2026 05:32:01 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x50Q0-000000001Wt-0GA4;
	Fri, 11 Sep 2026 12:31:53 +0000
Date: Fri, 11 Sep 2026 20:29:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3]
 include/trace/hooks/blk.h:51:1: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202609112025.QEuYxpAp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   5f1f62fe597f49d26c02185b703da6b91bec3364
commit: 18fc3793db1db68c1a9db2c0300326ac1df1c47e [3/3] ANDROID: block: add vendor hooks to implement IO aggregation in DDK modules.
config: x86_64-randconfig-r131-20260911 (https://download.01.org/0day-ci/archive/20260911/202609112025.QEuYxpAp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609112025.QEuYxpAp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609112025.QEuYxpAp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   block/blk-mq.c: note: in included file:
>> include/trace/hooks/blk.h:51:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/blk.h:51:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/blk.h:51:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/blk.h:55:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/blk.h:55:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/blk.h:55:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/blk.h:55:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/blk.h:55:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/blk.h:55:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/blk.h:55:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/blk.h:55:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/blk.h:55:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +51 include/trace/hooks/blk.h

    46	
    47	DECLARE_HOOK(android_vh_f2fs_ra_op_flags,
    48		TP_PROTO(blk_opf_t *op_flag, struct readahead_control *rac),
    49		TP_ARGS(op_flag, rac));
    50	
  > 51	DECLARE_RESTRICTED_HOOK(android_rvh_submit_bio_pre,
    52		TP_PROTO(struct bio *bio, struct request *rq),
    53		TP_ARGS(bio, rq), 1);
    54	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
