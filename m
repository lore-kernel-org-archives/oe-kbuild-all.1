Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7D11EF39F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 18:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761417255; cv=none; b=c0IdKdFurS/nL6KL6yfOWef4C+D2umvPasONn8bqAPFzFWFKmqLIgOh4ExFea8oBrfx6Z/bPT0mw+qBnwd4XB5IBCJPJlYxHa72eXH4rMLhbZicMUq9Eo+XsrGdbMebM0ZCwHMmNoZzwsAo6KW1PxZnRCuDNBMW7sOfJ6efOTT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761417255; c=relaxed/simple;
	bh=bNjAk1bTLe38ofSuNM5CIg/RJTh8H9LjfXPlRnNmnOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lCWJ3JFnLYnRGW8ABLLqktRDWGzwfBql65Ezdm2raS3WVMxX55bJA2VMBqbVl4aCH+5LrhqrPL6fl/CsYXyO8LP8gROjRhIz12zJ/c/SNZrLdg1RXZIOgveveILL4NkFK9XKlP1xoeIrNMMu1SCiHp8I5tOAPbaquQgOlyDhzEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5Ykul4c; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5Ykul4c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761417253; x=1792953253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bNjAk1bTLe38ofSuNM5CIg/RJTh8H9LjfXPlRnNmnOc=;
  b=G5Ykul4cQI2/Hbfz3UPPoXeHbQpzw3JWraPN4QZTJAO7h6L4ltMTghaG
   7M9i+2b3y4WkgKGCEGS/QFljY/+UKWxXETgP0yZ3y5sZTEtYy50aR9Cvg
   gytZFxSO3EfO12ACiRNcT5bWJCAIj5xwQUfBi9bfqXrOqP6+ZATw9Gz1D
   ecSFiqnAqL2v2se+Vz9SJuszeBPRET3luH1tPlBJbBmwXQAfYWn1i3XSg
   JJZm2C9EQF/gOlKbt/WP8fT8hirIqBPkwLTZgr0tQ193q+jldDJ6vKubL
   dCR6kmPVqJ9lnjJJnu5R673guILqVVGkQ3HzQCvJqh2c2z7zmwAARU8o8
   g==;
X-CSE-ConnectionGUID: SyYJ+5kbS86dUiTRtE27iA==
X-CSE-MsgGUID: /Jz9aiwxRZCBYVT7zjPCnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74237315"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="74237315"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 11:34:12 -0700
X-CSE-ConnectionGUID: iJdiPZVHT0eH4jHEGn1d0Q==
X-CSE-MsgGUID: FHyMCQRZS0qW7YEcrz9sgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="184295291"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Oct 2025 11:34:11 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCj5W-000FVl-1j;
	Sat, 25 Oct 2025 18:34:03 +0000
Date: Sun, 26 Oct 2025 02:33:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] include/trace/hooks/fs.h:19:1:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202510260243.qWRKALoV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   cf7e6e9ee1a5d1be5002e412a58ed3a45bb8e892
commit: 29429c25a600ea41fc44db5d8de0f65bce2872ac [1/1] ANDROID: vendor_hooks: add hooks for f2fs down read
config: x86_64-randconfig-121-20251025 (https://download.01.org/0day-ci/archive/20251026/202510260243.qWRKALoV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260243.qWRKALoV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510260243.qWRKALoV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/f2fs/checkpoint.c: note: in included file:
>> include/trace/hooks/fs.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fs.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fs.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +19 include/trace/hooks/fs.h

    11	
    12	DECLARE_RESTRICTED_HOOK(android_rvh_ksys_umount,
    13			TP_PROTO(char __user *name, int flags),
    14			TP_ARGS(name, flags), 1);
    15	DECLARE_HOOK(android_vh_f2fs_file_open,
    16		TP_PROTO(struct inode *inode, struct file *filp),
    17		TP_ARGS(inode, filp));
    18	
  > 19	DECLARE_RESTRICTED_HOOK(android_rvh_f2fs_down_read,
    20		TP_PROTO(wait_queue_head_t *read_waiters, struct rw_semaphore *rwsem, bool *skip),
    21		TP_ARGS(read_waiters, rwsem, skip), 1);
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
