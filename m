Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2276101
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 06:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SiP1HRET"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698389295; x=1729925295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yv5raT0WqsG2NPkm+6lWR+Ix7TBhR5sfBmjna8WPkPs=;
  b=SiP1HRETtZ+vHx81QdpQJOoa/Xp/KUQFDPSKDFQAQ1N7JHGqE79rTH6d
   UL8hnwDHhjcEECvpmg3ZvTBwC5wYtQNts9nVo1wQx1a4kGKosDqR6lRPI
   MLkHPFphpRyIVC6CK58mQ8y/lnG4MFCGiXwvcwFww9ozQhhNkRd0ACfIs
   1XgLSSd/RVK+vBCby+GsbsCOatNPugKrA2U9yU93oE7Kiv6Kmm0PVttwN
   EyFs2W6g9DvZA600o/F/uIOFkR1SHsGOIoH2B9tuZVsMgsFON4Dlp6064
   MorSV92d6t99TKU8+EFVF5u321HWjGvygS2G1ZCTqC4kZUGOLD1pGfLtU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="9260001"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="9260001"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 23:48:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="740960"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Oct 2023 23:48:00 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwGde-000AYY-16;
	Fri, 27 Oct 2023 06:48:10 +0000
Date: Fri, 27 Oct 2023 14:47:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4-lts 9622/29903]
 include/trace/hooks/sched.h:19:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202310271424.z0Ti4bMg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4-lts
head:   fcdc8d9a71cdda01c736bb52ad5d494e5b0937a3
commit: 5aeda5a3ccb1823eec337c21c1e56e19e16b8e94 [9622/29903] ANDROID: sched: add vendor hooks to handle scheduling priority
config: x86_64-randconfig-122-20231027 (https://download.01.org/0day-ci/archive/20231027/202310271424.z0Ti4bMg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310271424.z0Ti4bMg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271424.z0Ti4bMg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:4079:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:4079:17: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/sched/core.c:4079:17: sparse:    struct task_struct *
   kernel/sched/core.c:6071:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6071:9: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/sched/core.c:6071:9: sparse:    struct task_struct *
   kernel/sched/core.c: note: in included file:
>> include/trace/hooks/sched.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] <asn:4> *funcs @@
   include/trace/hooks/sched.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:19:1: sparse:     got struct tracepoint_func [noderef] <asn:4> *funcs
   include/trace/hooks/sched.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] <asn:4> *funcs @@
   include/trace/hooks/sched.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:23:1: sparse:     got struct tracepoint_func [noderef] <asn:4> *funcs
   include/trace/hooks/sched.h:27:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] <asn:4> *funcs @@
   include/trace/hooks/sched.h:27:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:27:1: sparse:     got struct tracepoint_func [noderef] <asn:4> *funcs
   include/trace/hooks/sched.h:31:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] <asn:4> *funcs @@
   include/trace/hooks/sched.h:31:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:31:1: sparse:     got struct tracepoint_func [noderef] <asn:4> *funcs
   include/trace/hooks/sched.h:35:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] <asn:4> *funcs @@
   include/trace/hooks/sched.h:35:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:35:1: sparse:     got struct tracepoint_func [noderef] <asn:4> *funcs

vim +19 include/trace/hooks/sched.h

  > 19	DECLARE_RESTRICTED_HOOK(android_rvh_prepare_prio_fork,
    20		TP_PROTO(struct task_struct *p),
    21		TP_ARGS(p), 1);
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
