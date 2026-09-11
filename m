Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBAA15665C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 12:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130702; cv=none; b=fJRWmlQFgftO3BTkzs9XcNR5Qyo9M0AFPtnSuOqqmzgSk79wgWmhAhQXcrpjhr9x0RZOvomy5Q+sZ9GvMsahea538JcjOMkV+93Jd665h1MkpDI0R9SWINQaSln5URNALCgz+zZl6IgxJGwaNva5c2NK8ujCU0QP7wbJVdjyL/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130702; c=relaxed/simple;
	bh=Y3WkXVnH+nECM445tCxN0FjFyKOb0HRdbkcPd4DfML0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RyAps711jlxd7yTmASmaWmSYboGdt4Zqz3KOoWXbiDbunZuwSpAPbRFu99Bf8sw3sNZVo7DFopnqLvtVVkjxy6OxMe2MNDIM26CU0tS9QceaJt5dBc5UC0dSDxV0XyD+iCkFSI0ipgECKEp8GD8Z+Q0EnLi2uy9MGow3hsdvziM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQ2I63lY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQ2I63lY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789130700; x=1820666700;
  h=date:from:to:cc:subject:message-id;
  bh=Y3WkXVnH+nECM445tCxN0FjFyKOb0HRdbkcPd4DfML0=;
  b=KQ2I63lYB/I/2V8+KVfIBCaX8nAUjuyAYslpSkeO4OrZtNZhbXlQMAi0
   nunGRPc76dvSrZ9dYjpX3cJOEvO/t+UcfDGZpv2ToFLCFZl14Yrqo0KzG
   34cmWofEDANZht6WY3yaRzsUgaWwIdfM7Cw4mXWmjqtsb3CeX3ATjrDhw
   Y48M/5NcPGLgyxLsAsSz8j4W+IE77MyciGcQkEBnui9+m/QlPARwOSj4U
   F+2lEKAS7LLRJfmxgmwiyoXXznowuJv+sNVhThLf/o8XemYJGrrKzE7Sm
   ae8uH5GVQtRMVsLhh0Vo0gFH7GRMivmuCwOsCdCm0ZPGxrlbu8IZV4cA6
   A==;
X-CSE-ConnectionGUID: 3OxeiCWNRtqN6LwzRDN09Q==
X-CSE-MsgGUID: N3jKqe6ZQ+CEfgmVLUwsDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="99922574"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="99922574"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 05:45:00 -0700
X-CSE-ConnectionGUID: IwNghn9fTPWOYMNHJf3/Hw==
X-CSE-MsgGUID: AZdSSCQqQ+CED/Umnp6+eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="275670943"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 11 Sep 2026 05:44:59 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x50bj-000000001Xh-2T3o;
	Fri, 11 Sep 2026 12:44:14 +0000
Date: Fri, 11 Sep 2026 20:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3]
 include/trace/hooks/blk.h:51:1: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202609112037.gysgDT2Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   5f1f62fe597f49d26c02185b703da6b91bec3364
commit: 18fc3793db1db68c1a9db2c0300326ac1df1c47e [3/3] ANDROID: block: add vendor hooks to implement IO aggregation in DDK modules.
config: x86_64-randconfig-r131-20260911 (https://download.01.org/0day-ci/archive/20260911/202609112037.gysgDT2Y-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609112037.gysgDT2Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609112037.gysgDT2Y-lkp@intel.com/

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
