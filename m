Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770862AD2F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 17:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761411610; cv=none; b=jZmFhTz1Wj+WwVT/m9X8oYexhpcjKJcGh6hIIDX3InnqXqc8NAscIdRjDirm5cflczoiA7dpDQlqo9L2/rPVRFZUWzAxDGECD2Szr5aZ3aeZXlOoSOz/M2N0nywds6aepYLz5nL4RGf7xmb8Pvd2giGtP+1R8A0KJVALg6V0EF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761411610; c=relaxed/simple;
	bh=cTMtwhN+w1p7xM21t0Qrozo66CdB5eFoag7Yh6jEaWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=losSxhpYxzJ07/DIESC+hwzAcDBfvllTgBzOU9cpfGdhErRa8bpdrL0dnhwjsn9BK96mNdHHTh3V7Z8Ae29msnROxj4GpcGheM/00ZY5lfjxf/ZrdIsKTyEcJwrbKWrHS6X3yItM/1uPu9gspfShmU/6NUvcTSri0mzA4K90YJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JICGYdHR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JICGYdHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761411608; x=1792947608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cTMtwhN+w1p7xM21t0Qrozo66CdB5eFoag7Yh6jEaWs=;
  b=JICGYdHRtsCiE9sUbjFDgEzWlPKell20peEHJbk0mhp4DBergviWNgdw
   Qe+5mvD/u1NF/kNaxSmxKdGTs4IRk/s4GtgnkAqb5S5xx14/VW9nnm7wY
   PCsX5r2ecPuOzyiOYf4W/kyxq8jAW0WFLWGQdKB1fAo4lZXOI3x64Kf2Q
   cVS5xgppPTPA0Xga7bDXEEKKXgZHNXvjmO6wNYUWkmxJQFpILo3lhcnSN
   ruloTUTxzY8XDK3ocPdwCaPxwITvZIswMP3KrIYVjgST6jZZkrSvzSm9U
   r7yiC4ZWy18vYCpAeao5yhh3JxFNehOZdYghvBi+fgdzh0BFMpSUsaa0+
   Q==;
X-CSE-ConnectionGUID: xNYvYR+5Q5KP238VXmxDog==
X-CSE-MsgGUID: Zv3c1XGfS9aa2QvQ9jGvWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63598448"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="63598448"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 10:00:06 -0700
X-CSE-ConnectionGUID: INoAPQIzRrKfVr+rXTGiDg==
X-CSE-MsgGUID: gHJuIfK0SFqHFOIcAx2mAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="184745663"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Oct 2025 10:00:05 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vChbj-000FRr-0G;
	Sat, 25 Oct 2025 16:59:15 +0000
Date: Sun, 26 Oct 2025 00:58:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 include/trace/hooks/madvise.h:10:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202510260025.2TJX4BBI-lkp@intel.com>
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
commit: c9b85866c78e7e00085c89ee4fd3b93f54659682 [1/1] ANDROID: madvise: add vendor hook to bypass process madvise
config: x86_64-randconfig-121-20251025 (https://download.01.org/0day-ci/archive/20251026/202510260025.2TJX4BBI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260025.2TJX4BBI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510260025.2TJX4BBI-lkp@intel.com/

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
