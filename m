Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8571A3D3B3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718622; cv=none; b=nhns5r1ZxlJgwm/qIKl6Li/OtfcbcHs0BTJ/yMywTIfBZ6Z39g5CN5ANTsjz42lgS99y2hdPmv/jDkgEPcK7znyl4Gzmb154lK4ij3ybLMD58lzuMJU1tZErh6cl3nv4g2W8e/kisCmPaDlla4tGX+akzNvvqGHfhXPWNFZIaec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718622; c=relaxed/simple;
	bh=y3Tryxd1VPNUwqI1fS6y/j9iWmS6sOTO2ttr6p8zH6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A+xVu558KJAY/Wmwv7nLq/8d7eTm4rHEfvq8b5esC4zBWn+49P7SM6lJL+I13CXiQKYKScE3HjcOdhm8XDF9D5B4emOCow/TPy+/ZaxizJsoj0EjOaRvqdQJjBS1NqCVAEhYNYsUCXGCUoVAdDvihpHWrVJUH1wQs+zh467bHk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nvi1Kami; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nvi1Kami"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718620; x=1765254620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y3Tryxd1VPNUwqI1fS6y/j9iWmS6sOTO2ttr6p8zH6U=;
  b=Nvi1Kamiigsk7pnLwecsnQt+zHnoYJDg968WSGvc/iAXGLfGXX/PmqzD
   rA84AjJcAoX15ZdNGHpgC6A+7g9yOjrC7gnzEk/csrOvr4zHhmu9J+ddl
   etrKBTnTO1FbtFaqIAMp0NhM8vp6M10ZpUiM03lcXN7GHP4XonU2FcwEd
   /gkRDd/VqYUjVSCZvdfB7AabcV/8dPoK2nujKX6aiqzPBsgLgpuNdAYag
   AOIP53j+mFWqrYud0ZXOLXaxrzwvQG8yI/kGG3Pt1j74QM0kCFSbyrYx5
   c1g+FoQJHShncbITG962AfVykWCtlZmSE6YMW/LdQ0jp5H6scJzSkQKK4
   w==;
X-CSE-ConnectionGUID: EmMtrNjjRw+R1lSV8Srbgg==
X-CSE-MsgGUID: nr73WlINQqGWvOwbwD3Uug==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="37930977"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="37930977"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:30:19 -0800
X-CSE-ConnectionGUID: uOx/POTARnm1vFzsoDj6Cw==
X-CSE-MsgGUID: uFTub0S1QMe3Db585HcTJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95751348"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Dec 2024 20:30:19 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVPU-0003rj-0A;
	Mon, 09 Dec 2024 04:30:16 +0000
Date: Mon, 9 Dec 2024 12:29:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 2/2]
 include/trace/hooks/fs.h:19:1: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202412080500.PIkPOr1T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   b33907aaffd86a2d5926a449f6073258355e5273
commit: ffd2387988408b090e8f1d3496196e3490b20259 [2/2] ANDROID: f2fs: Place read_waiters usage under conditional check
config: x86_64-randconfig-122 (https://download.01.org/0day-ci/archive/20241208/202412080500.PIkPOr1T-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412080500.PIkPOr1T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412080500.PIkPOr1T-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/f2fs/checkpoint.c: note: in included file:
>> include/trace/hooks/fs.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fs.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fs.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   fs/f2fs/checkpoint.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +19 include/trace/hooks/fs.h

446570771ee30b5 Yang Yang    2024-05-29  11  
fe38da361cd9e20 Sooyong Suk  2024-07-23  12  DECLARE_RESTRICTED_HOOK(android_rvh_ksys_umount,
fe38da361cd9e20 Sooyong Suk  2024-07-23  13  		TP_PROTO(char __user *name, int flags),
fe38da361cd9e20 Sooyong Suk  2024-07-23  14  		TP_ARGS(name, flags), 1);
446570771ee30b5 Yang Yang    2024-05-29  15  DECLARE_HOOK(android_vh_f2fs_file_open,
446570771ee30b5 Yang Yang    2024-05-29  16  	TP_PROTO(struct inode *inode, struct file *filp),
446570771ee30b5 Yang Yang    2024-05-29  17  	TP_ARGS(inode, filp));
446570771ee30b5 Yang Yang    2024-05-29  18  
29429c25a600ea4 yipeng xiang 2024-10-08 @19  DECLARE_RESTRICTED_HOOK(android_rvh_f2fs_down_read,
29429c25a600ea4 yipeng xiang 2024-10-08  20  	TP_PROTO(wait_queue_head_t *read_waiters, struct rw_semaphore *rwsem, bool *skip),
29429c25a600ea4 yipeng xiang 2024-10-08  21  	TP_ARGS(read_waiters, rwsem, skip), 1);
29429c25a600ea4 yipeng xiang 2024-10-08  22  

:::::: The code at line 19 was first introduced by commit
:::::: 29429c25a600ea41fc44db5d8de0f65bce2872ac ANDROID: vendor_hooks: add hooks for f2fs down read

:::::: TO: yipeng xiang <yipengxiang@honor.corp-partner.google.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
