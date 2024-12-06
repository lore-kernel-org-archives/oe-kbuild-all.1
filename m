Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9CA1D61BF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 18:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733510291; cv=none; b=mfv8SPzsE3B7XnBA2p29H1pV1BaKrB5F5r7RrMk2aSnr5sl869IZhmuw+5yofFlOcOLdnR/TASSyxQiQTR7JmP5gry4y3+yIQnJIWOBm/m30/NZsGYGaZoPrrv/6qhNUsFdrLRqtL5GF11OMiCnmxRdX721FKKKPi/x2DWJb3RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733510291; c=relaxed/simple;
	bh=GA6us+GVYJxTNfnOwsTIOjQVni218eA9+F4h74tdXG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UUP7fK156CFPw7bpFoyR8pKxHRo9oTxXiWijnWLtwJCEW4rg2QMOonugW6M9dTlGRjbk+24i6WeXbwzjD2sYVRMA4h8EjgilQRK5+YRaq8vbVWxwp//usfMMNNquPwjm9wN20flTJt3GjXu0AmWmlqsn04FJaYi4esCOJnhx+tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9LEOTvJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9LEOTvJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733510289; x=1765046289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GA6us+GVYJxTNfnOwsTIOjQVni218eA9+F4h74tdXG8=;
  b=U9LEOTvJQrx+RQlo1iLeZj3HmKq7f1IiANNgWj91dG+5cr77yCt9Be5y
   qPKfci/Px0aBrdAGsUWtaVzfLeFAR0WC0fZmrcdPxS39GMLTm5v+0DJp6
   TF8dc91rfQ+J7tXXBwTawE08fFPI6JHHf4JHMj2xToGpxNY7gcuo6KQBY
   IZL5w7mYqdAcjpT1uy1pEnZffRt7rdKJboRsdYN/eG3aCq6jf+DG6OGh/
   J7/COVUQxwoq6N0GmRQbtc/GxwklVmEdx2qu4AA8siW9+9UHdG3WVOlMw
   ZE02u11Al4qaHO897Y0gx58gV484fwHBntAaimKiHZ9u0kQXwpdroEJj+
   A==;
X-CSE-ConnectionGUID: ipUwq98HTba1Zqg8kWt6sw==
X-CSE-MsgGUID: 3efxaPh0R9K/6HX1uuNjtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33606750"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="33606750"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 10:38:09 -0800
X-CSE-ConnectionGUID: 3oWFxEioTx67vNoReAdYOg==
X-CSE-MsgGUID: mwdZCAJ9SxiYhg8RGimSRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="99521914"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Dec 2024 10:38:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJdDJ-0002AT-2Q;
	Fri, 06 Dec 2024 18:38:05 +0000
Date: Sat, 7 Dec 2024 02:37:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 8/9] include/trace/hooks/sys.h:24:1:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202412070225.VQM9TBVt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   af57217229d320ec7829d770b8fe3529cde04e87
commit: e41b8e8e59bf118ee5eb422d531390a141117dd0 [8/9] ANDROID: vendor_hooks: add hooks in prctl_set_vma
config: i386-randconfig-062 (https://download.01.org/0day-ci/archive/20241207/202412070225.VQM9TBVt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070225.VQM9TBVt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070225.VQM9TBVt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sys.c:1104:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/sys.c:1104:32: sparse:     expected struct task_struct *p1
   kernel/sys.c:1104:32: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/sys.c: note: in included file (through include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs.h, ...):
   include/linux/sched/signal.h:757:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:757:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:757:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/sys.c: note: in included file:
>> include/trace/hooks/sys.h:24:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sys.h:24:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sys.h:24:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   kernel/sys.c:2813:25: sparse: sparse: self-comparison always evaluates to false

vim +24 include/trace/hooks/sys.h

     9	
    10	struct task_struct;
    11	DECLARE_HOOK(android_vh_syscall_prctl_finished,
    12		TP_PROTO(int option, struct task_struct *task),
    13		TP_ARGS(option, task));
    14	
    15	struct mm_struct;
    16	struct anon_vma_name;
    17	DECLARE_HOOK(android_vh_anon_vma_name_recog,
    18		TP_PROTO(struct mm_struct *mm, struct anon_vma_name *anon_name),
    19		TP_ARGS(mm, anon_name));
    20	DECLARE_HOOK(android_vh_restore_mm_flags,
    21		TP_PROTO(struct mm_struct *mm),
    22		TP_ARGS(mm));
    23	
  > 24	DECLARE_RESTRICTED_HOOK(android_rvh_pr_set_vma_name_bypass,
    25		TP_PROTO(struct mm_struct *mm, unsigned long addr, unsigned long size,
    26			      struct anon_vma_name *anon_name, int *error, bool *bypass),
    27		TP_ARGS(mm, addr, size, anon_name, error, bypass), 1);
    28	#endif
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
