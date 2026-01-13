Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05320387370
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 09:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295879; cv=none; b=SSLim1UlNRew57sXz84ueiJ65wqF+JWRPBM1TfH2cw87MrJlUMmron4p3OhUohkiK8FU7lqNMBr9NpgWZ70WIRXxCW4cJHX1xyAOlbZR2HLopovIfSTXDsOvgX04ReKuiZg0iVk5hfn0iNWHl2H7Kxk8/tmrg1hW2Qstk97TW8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295879; c=relaxed/simple;
	bh=PH+FZG01qB/KZXS23hMKgFDECHum02Ep0bOBYmI3MDI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qG9/CJa2IRsIAFMoU2878XC68XXy75TtwBQiKddI23XMFqpJj3H4+4G2t5udTZYU3pKZQvACyXzGQFPUcE5GSen6awHGlpKZG0DVir+y+KmghkmpGCGHCipQdPIW9Tip/x2ASWkPVbNwVP8fzmzYFZnIlm4bUd+VbwqeyNVMJnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJgEQPtx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJgEQPtx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768295876; x=1799831876;
  h=date:from:to:cc:subject:message-id;
  bh=PH+FZG01qB/KZXS23hMKgFDECHum02Ep0bOBYmI3MDI=;
  b=XJgEQPtxJuRmM0IoMD3pntXr3k54ipR0huPmD1dPfLhWP0H3EDWzcvA6
   qkrmJE6SWdUICb2JK9HaZpNJ7ht3y8g2VBxd0HWIwyZjdnDnkckitT0t9
   HLW9rYZUgAe6beoe45Be6YJumfV1gTKF9t2xAH+rTSXZXMkb+ZZ7Upv/B
   MGXfC8AGxeqVHn1l+q8DOW/lkK0NlpGjNqxaXvYLRVMcfl4y7pZx3CpkX
   SV7WCP1ZorO6XDLSGDwwSOVgnCL/4UhMWhvEOZttzD1tQgzG5UhSYzFwd
   C01Vl03HJPpzZixWlklu1uPFWRkRPfL18vwifoUadkPvRi6iHe/VGlpdL
   A==;
X-CSE-ConnectionGUID: I5Kf+YZKRHeekIlIkH/o3w==
X-CSE-MsgGUID: I0FW9mPvSsyubhuwcmVnsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69498674"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69498674"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 01:17:46 -0800
X-CSE-ConnectionGUID: XThDw5/fQl+9HN2HWG72zA==
X-CSE-MsgGUID: yQ3iOORnRsqTV8zGdbOo1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204230240"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jan 2026 01:17:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfaX0-00000000EWm-3YhR;
	Tue, 13 Jan 2026 09:17:42 +0000
Date: Tue, 13 Jan 2026 17:17:20 +0800
From: kernel test robot <lkp@intel.com>
To: Mykyta Yatsenko <yatsenko@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>
Subject: kernel/trace/bpf_trace.c:3619:52: sparse: sparse: cast
 removes address space '__user' of expression
Message-ID: <202601131740.6C3BdBaB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: a498ee7576de24b4b0916ce56cf2686e261a29f7 bpf: Implement dynptr copy kfuncs
date:   8 months ago
config: i386-randconfig-063-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131740.6C3BdBaB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131740.6C3BdBaB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131740.6C3BdBaB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/bpf_trace.c:835:41: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *[addressable] [assigned] [usertype] sival_ptr @@     got void * @@
   kernel/trace/bpf_trace.c:835:41: sparse:     expected void [noderef] __user *[addressable] [assigned] [usertype] sival_ptr
   kernel/trace/bpf_trace.c:835:41: sparse:     got void *
>> kernel/trace/bpf_trace.c:3619:52: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c:3633:56: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c:3647:52: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c:3654:56: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c:3662:52: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c:3670:56: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:871:25: sparse: sparse: context imbalance in 'uprobe_prog_run' - unexpected unlock

vim +/__user +3619 kernel/trace/bpf_trace.c

  3615	
  3616	__bpf_kfunc int bpf_probe_read_user_dynptr(struct bpf_dynptr *dptr, u32 off,
  3617						   u32 size, const void __user *unsafe_ptr__ign)
  3618	{
> 3619		return __bpf_dynptr_copy(dptr, off, size, (const void *)unsafe_ptr__ign,
  3620					 copy_user_data_nofault, NULL);
  3621	}
  3622	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
