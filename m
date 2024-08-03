Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F67F1ABEAF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722691966; cv=none; b=MLrrYrWYH/6K7dqko2v4wDPeZsBbu/Tj0elkpBqxq2TnALw+G/XTdFWKBQDnLquZcj5ndR7F2++gue5kXRyYXQe8QKyqM4CxyA/a0OrDY7UWcDSWZnFzG+YMM6pFyVm99tc7sc7tSI+/kUxWicMBe7Peo8HR8VIXSHmdxEE78dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722691966; c=relaxed/simple;
	bh=kTaWriIjBZymZv0HK8q0IMxFGCvdMHJFkHU4nGYfoUI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GFhGChkWGGEKLU8shT5imSRMxGySFlUDq0bMG9phU/0SsNfryxvukseQdY3QZcfkuz3h+io368iq0byptRlZV3xDG57vTqfel1/KABN6Pds6OnfTpZvqMw/DClVSFEw04Z/JOC/JGCPlfK+rDNqX5cwiaxlcT6BACau0CMUkipc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQnZyPgF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQnZyPgF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722691964; x=1754227964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kTaWriIjBZymZv0HK8q0IMxFGCvdMHJFkHU4nGYfoUI=;
  b=bQnZyPgF3/yFZfUArFcWFn91OFJMIEb6Qq3AhF1G+lNcKWoBjuU77UxC
   Ivl9lMAfdr59NkRX9SV5F59mxrSbiUCQTWXxR0zOuy8Uler/oW0XwqdA/
   qGdQ4vFLh+WdH3DzQnE0rgMBJRcsKYPWVKZsgz84tCqE86uweysTruVv1
   upoZiKJtxEBaEtZpwHKIYcBrvusSOaUs8CdLoMW+A0K63ev9sf1+Nw+ZG
   vVZiqACxc6mhgAkEe3eIgJEMB7xevzjgnknnlfCQgWiGvgSXg7UfXir9u
   OtHpnEgUUH+U85TrvWo2lu5/YMbFJwFUVOLhkQbX0ohLq4w50weDQjxuh
   g==;
X-CSE-ConnectionGUID: sOUymVXdTxWwiCPLdHW+ZQ==
X-CSE-MsgGUID: 3pNOWBRWT+i/pprHRMCOOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="38201373"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="38201373"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 06:32:31 -0700
X-CSE-ConnectionGUID: 7VHmLbXDTqaaK0M2Vti0KA==
X-CSE-MsgGUID: 5s/J15LvQkuPmIMy1HOJpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="55360807"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 03 Aug 2024 06:32:30 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saEs0-0000To-1e;
	Sat, 03 Aug 2024 13:32:28 +0000
Date: Sat, 3 Aug 2024 21:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 440/440] drivers/gpu/drm/drm_panic.c:690:18:
 error: initialization of 'unsigned int' from 'ssize_t (*)(struct file *,
 const char *, size_t,  loff_t *)' {aka 'int (*)(struct file *, const char *,
 unsigned int,  long long int *)'} makes integer from pointer without ...
Message-ID: <202408032143.nMHueCgb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   b9521a4573f2ff4bd91ee66d23e4c41e8e4fab6b
commit: b9521a4573f2ff4bd91ee66d23e4c41e8e4fab6b [440/440] fs: finally remove ->read() and ->write() from file_operations
config: nios2-randconfig-001-20240803 (https://download.01.org/0day-ci/archive/20240803/202408032143.nMHueCgb-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408032143.nMHueCgb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408032143.nMHueCgb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_panic.c:690:10: error: 'const struct file_operations' has no member named 'write'
     690 |         .write = debugfs_trigger_write,
         |          ^~~~~
   drivers/gpu/drm/drm_panic.c:690:18: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     690 |         .write = debugfs_trigger_write,
         |                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_panic.c:690:18: note: (near initialization for 'dbg_drm_panic_ops')
>> drivers/gpu/drm/drm_panic.c:690:18: error: initialization of 'unsigned int' from 'ssize_t (*)(struct file *, const char *, size_t,  loff_t *)' {aka 'int (*)(struct file *, const char *, unsigned int,  long long int *)'} makes integer from pointer without a cast [-Wint-conversion]
   drivers/gpu/drm/drm_panic.c:690:18: note: (near initialization for 'dbg_drm_panic_ops.fop_flags')
   cc1: some warnings being treated as errors


vim +690 drivers/gpu/drm/drm_panic.c

813ca3aa8fecac Jocelyn Falempe 2024-04-09  687  
813ca3aa8fecac Jocelyn Falempe 2024-04-09  688  static const struct file_operations dbg_drm_panic_ops = {
813ca3aa8fecac Jocelyn Falempe 2024-04-09  689  	.owner = THIS_MODULE,
813ca3aa8fecac Jocelyn Falempe 2024-04-09 @690  	.write = debugfs_trigger_write,
813ca3aa8fecac Jocelyn Falempe 2024-04-09  691  	.open = simple_open,
813ca3aa8fecac Jocelyn Falempe 2024-04-09  692  };
813ca3aa8fecac Jocelyn Falempe 2024-04-09  693  

:::::: The code at line 690 was first introduced by commit
:::::: 813ca3aa8fecaca9cf81f831d2e036d997ac3ee7 drm/panic: Add debugfs entry to test without triggering panic.

:::::: TO: Jocelyn Falempe <jfalempe@redhat.com>
:::::: CC: Jocelyn Falempe <jfalempe@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
