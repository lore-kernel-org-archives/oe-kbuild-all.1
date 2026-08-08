Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BEA2D9EE4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Aug 2026 01:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786154124; cv=none; b=mj2XeSb0mddUav+7daaCYwXFXvUamaNAg8CALK099DzuMdUUhO/NKey7OWc/huf9kmJs3dEApwxcp/trN69WCuJcysbChATHwCRg6fHs4oRm8UKQ9dRNztFV5NnKionxsvL7EizvBU1UBx5ZVBdubJt+iHydVSmWVaUeynS1iI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786154124; c=relaxed/simple;
	bh=VB9kbIurVGfSB1xjGecApsY4Uw8ovStF8OAOziXjn8k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GMOmJFbl28qtxOTRyMwtH8ADAz0FxSs737MIpCx6O95thK81N2Zre2raHexvFEpDx/1RMqnvv0RNsk8ofhkeal3q5aWl/iUR+LXjZv291H7kB43nXmMZ8znQG7eBY3xTLysj5un6rJVMcsAgUA2yyE1UkNQhTxNij0tXXk7i9NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lYeSD5dp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYeSD5dp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786154123; x=1817690123;
  h=date:from:to:cc:subject:message-id;
  bh=VB9kbIurVGfSB1xjGecApsY4Uw8ovStF8OAOziXjn8k=;
  b=lYeSD5dp3a3/4QMOp0LgfL0tc8jf0AVJeMwXLCg4vojysYgmvmzQI5Cj
   R3CQIYOFghH8VHVoK1qOOCkfWjWZYxJhAswULo3b7FL3WSG9U9vyNOiwx
   KnfWirIExsNkaHWu3ZnSUERh9QmRWEj/pGJ1SXghBnujDmrwkiIr2HnOf
   cwvjYGjcd9i9vwFWBz+XaTwf5JSXerjyZoAfWLE5yMKicpwsJfBwjF2XG
   GihieyHyS0+RZdeJLk26nSJZDp+kcXh16nshre7a4jvZGfaKJzZan3wMB
   qqxrFjO+b2DR+qxZ8ruFvVuZl052PVmis0djNMK0gTWnoCDgaokUIpIo0
   w==;
X-CSE-ConnectionGUID: VqbnZpXGROqL96uSZON4Aw==
X-CSE-MsgGUID: N62nMk78REmLnd5EIua4WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86843453"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="86843453"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 18:55:23 -0700
X-CSE-ConnectionGUID: EyiVHcESTEWsXQFVINGCwA==
X-CSE-MsgGUID: EBOtqMcAQ0SRApkmxAubmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="258686652"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2026 18:55:21 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsWHP-00000000Jck-0DoZ;
	Sat, 08 Aug 2026 01:55:19 +0000
Date: Sat, 08 Aug 2026 09:54:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 19/21] kernel/bpf/helpers.c:2412:18:
 sparse: sparse: symbol 'bpf_coro_suspend' was not declared. Should it be
 static?
Message-ID: <202608080939.QXQUGeBF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fermata
head:   0ebfd4123c6b1719f428de91a4e4eeca34f557f6
commit: d615082a1c50f83ded136b8c3131f41db54ba025 [19/21] bpf: Add no-op bpf_coro_suspend() kfunc
config: csky-randconfig-r113-20260807 (https://download.01.org/0day-ci/archive/20260808/202608080939.QXQUGeBF-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608080939.QXQUGeBF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608080939.QXQUGeBF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/helpers.c:1228:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long ( *[usertype] callback_fn )( ... ) @@     got void [noderef] __rcu * @@
   kernel/bpf/helpers.c:1228:21: sparse:     expected unsigned long long ( *[usertype] callback_fn )( ... )
   kernel/bpf/helpers.c:1228:21: sparse:     got void [noderef] __rcu *
   kernel/bpf/helpers.c:2407:18: sparse: sparse: symbol 'bpf_coro_frame_free' was not declared. Should it be static?
>> kernel/bpf/helpers.c:2412:18: sparse: sparse: symbol 'bpf_coro_suspend' was not declared. Should it be static?
   kernel/bpf/helpers.c:2869:18: sparse: sparse: symbol 'bpf_task_release_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c:2899:18: sparse: sparse: symbol 'bpf_cgroup_release_dtor' was not declared. Should it be static?

vim +/bpf_coro_suspend +2412 kernel/bpf/helpers.c

  2411	
> 2412	__bpf_kfunc void bpf_coro_suspend(void *p__ign)
  2413	{
  2414	}
  2415	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
