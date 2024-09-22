Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B01A23C9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 13:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727013298; cv=none; b=VbCHx9o5kXah9pJ0Qicux+LwqX4K2Mrm/50KQHcDg0gy0MaL3olDO+TPBZvD69gO3/F99ms8W5mFlpyrTiklx3dDoB7nVtxYmyt/jgvNLvUWkUCiwNZmaoWplDI+nqaH9wJTyidFqW4p0SJjHnb2so8TB+V1o52L5qMnnkl27lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727013298; c=relaxed/simple;
	bh=f03l8cdVvOxos0jBzwU7qPndpXzzNDazBpKPmxKUQ3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I4IyYhK3wmZb6J9mb7qGC5lH6c+ZhT0lPpGuE+vhC4tSuW0Rg1EGXleVC6FyzyJe1F0nu6X+SznJ70CcNK4RjXJQK+bHnq0zeLXbGbSR9DSiQmXWl4HehdjhHEYqoMjqZQ8W8GkOr+BjjW5XJsBIw+qqn02Jvanna/c9sF8k9nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NXd0C6MS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NXd0C6MS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727013296; x=1758549296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f03l8cdVvOxos0jBzwU7qPndpXzzNDazBpKPmxKUQ3Y=;
  b=NXd0C6MS2e8qrHOGjnPyRO/D2oadIBetPyHkqH9U6mOa5VHLV75b/kAi
   QhAzxpF87xpCoWPbbTE9fs1ytkXo4zWYZslwwTEd8vP90vOjuXON5a9k2
   91za0/mKRbIGrniGpQu4QXT+/N5S+gEmCy2izZz73vqhd6rcdhUyPFwq+
   iBvsy3yEFem7zLBPhW6NzTBmz0x9Ikjwev4WexzDfDXH0Ha76GpmIktts
   HRxNT3XIt0hwFmdPQ16YjIe5wM1HcaSVdNpI6T+4EQo18SC9B0y3Ncfzw
   5mPCnvKQoenpWAjCsDr1Q8jzvkAexKCBSDZEbVCuqfO8KMYZNgHva8RL4
   A==;
X-CSE-ConnectionGUID: Kkq7NQi2RSKX8r9/cmkNsA==
X-CSE-MsgGUID: QwXekYZTTjSQ3buBoMmkSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36628091"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="36628091"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 06:54:55 -0700
X-CSE-ConnectionGUID: LEQGjQnRRKChV++0pzo/NA==
X-CSE-MsgGUID: PTG1jjOMTECK49e2PMMASg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="71246433"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Sep 2024 06:54:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssN36-000GLc-0d;
	Sun, 22 Sep 2024 13:54:52 +0000
Date: Sun, 22 Sep 2024 21:54:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/14]
 include/trace/hooks/madvise.h:10:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202409222157.7ppsb2Fu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   a3c4f110f54b76cbd94691d217eac14144225136
commit: c9b85866c78e7e00085c89ee4fd3b93f54659682 [2/14] ANDROID: madvise: add vendor hook to bypass process madvise
config: i386-randconfig-r132-20240922 (https://download.01.org/0day-ci/archive/20240922/202409222157.7ppsb2Fu-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409222157.7ppsb2Fu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409222157.7ppsb2Fu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/madvise.c: note: in included file:
   include/trace/hooks/madvise.h:21:31: sparse: sparse: no newline at end of file
   mm/madvise.c:449:28: sparse: sparse: context imbalance in 'madvise_cold_or_pageout_pte_range' - unexpected unlock
   mm/madvise.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:817:9: sparse: sparse: context imbalance in 'madvise_free_pte_range' - unexpected unlock
   mm/madvise.c: note: in included file:
>> include/trace/hooks/madvise.h:10:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/madvise.h:10:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/madvise.h:10:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +10 include/trace/hooks/madvise.h

     9	
  > 10	DECLARE_RESTRICTED_HOOK(android_rvh_process_madvise_bypass,
    11		TP_PROTO(int pidfd, const struct iovec __user *vec, size_t vlen,
    12			int behavior, unsigned int flags, ssize_t *ret, bool *bypass),
    13		TP_ARGS(pidfd, vec, vlen, behavior, flags, ret, bypass), 1);
    14	struct vm_area_struct;
    15	DECLARE_HOOK(android_vh_update_vma_flags,
    16		TP_PROTO(struct vm_area_struct *vma),
    17		TP_ARGS(vma));
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
