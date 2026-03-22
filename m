Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82076199385
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 03:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774151447; cv=none; b=SYGJ/tsPI+FNCbXcUAwUrzPtGcKan4MTFCauHdRW6q5VAOVij/4m0J2HX1g7+psjUxJ/HcobaelWyB6PE9ysbKI+K4UCJociWVnQguKknXKrW/gwEWQ28ywzFSM3TUSy4tmXCqMqu8YGooLuJho13y1i1iTeOsU+EjsLbVH6sdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774151447; c=relaxed/simple;
	bh=UztUcMPc2co4Ql4Q1IiG8wKfYIPwnGjZw9nmPv6SJug=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YjapTSMd/qCtpgGWOLe83SoEAz7gi1cdMoFGpQhWtA30qpWaM1q2DXmUJsUH0s5LGalPUZBepYcLhpp7kEF1YAVAhZKBtZmfuYZ8h+GwNQbHcs6f3ASv6PNkKokfSK5Ah6nRcvJJMixZamyogA4765JH+z80VbftQUIScUutRXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSIQPn7a; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSIQPn7a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774151446; x=1805687446;
  h=date:from:to:cc:subject:message-id;
  bh=UztUcMPc2co4Ql4Q1IiG8wKfYIPwnGjZw9nmPv6SJug=;
  b=CSIQPn7ak+SgCFffi86eTslZ3atWrjU60XONFUKddz6UdjmjN5Va346Z
   nZ3DM3+GPs1+oCELRKOTngLyH5IrpAotvFXFRIBhIJY8DhM2O1QrOM3kO
   rNOIRyXLWYllgjAANyy7tJh2GV7oRaNYXWR4ZLVk0So8gORb3zF4HUN72
   jSawfwVgXw1SP7Zx7xEPOBd4BpCQGIvkgSGMyKkfAD18KQn2pRefjjIuw
   vna+BBuRo0VQKkoOvjAvw9yQy3cetD4p9xz6kZP8/nqA4HGgrOJqz3Qe+
   vvIWI0Ci4pPcTjgGr7sgGgDNGFdR/2Rj5tDtt69QIV78imMTHJZC0rPp+
   Q==;
X-CSE-ConnectionGUID: cwt92l6MQFW1dwuAbkeqQA==
X-CSE-MsgGUID: 4p7AIp57Q6GBeJaJYS1Q8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="75159126"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="75159126"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 20:50:45 -0700
X-CSE-ConnectionGUID: u8zYuHTvQLe4g2sbEOf1xw==
X-CSE-MsgGUID: UJ2qCS4+Qw6SiPF+p6Reyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="220501347"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Mar 2026 20:50:44 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w49ph-000000001bb-1JYg;
	Sun, 22 Mar 2026 03:50:37 +0000
Date: Sun, 22 Mar 2026 11:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fengshui 11/15] kernel/bpf/helpers.c:2332:18:
 sparse: sparse: symbol 'bpf_coro_frame_free' was not declared. Should it be
 static?
Message-ID: <202603221134.wHzo18Rw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fengshui
head:   29fa493f6bcc221b898cc49a92186879f48aa8b4
commit: cd60d50e932f34c6900cb57c8ac53ebb5da770f7 [11/15] bpf: Add PTR_TO_CORO_FRAME runtime and verifier support
config: arm-randconfig-r132-20260322 (https://download.01.org/0day-ci/archive/20260322/202603221134.wHzo18Rw-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603221134.wHzo18Rw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603221134.wHzo18Rw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/helpers.c:1212:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long ( *[usertype] callback_fn )( ... ) @@     got void [noderef] __rcu * @@
   kernel/bpf/helpers.c:1212:21: sparse:     expected unsigned long long ( *[usertype] callback_fn )( ... )
   kernel/bpf/helpers.c:1212:21: sparse:     got void [noderef] __rcu *
>> kernel/bpf/helpers.c:2332:18: sparse: sparse: symbol 'bpf_coro_frame_free' was not declared. Should it be static?
   kernel/bpf/helpers.c:2614:18: sparse: sparse: symbol 'bpf_task_release_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c:2644:18: sparse: sparse: symbol 'bpf_cgroup_release_dtor' was not declared. Should it be static?

vim +/bpf_coro_frame_free +2332 kernel/bpf/helpers.c

  2331	
> 2332	__bpf_kfunc void bpf_coro_frame_free(void *p)
  2333	{
  2334		kfree_nolock(p);
  2335	}
  2336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
