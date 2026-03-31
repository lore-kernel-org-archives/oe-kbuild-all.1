Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF642749D6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 02:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774925940; cv=none; b=WE4RwRWXTugysGPsPPUgDeingghNGFUMYTJmpMqujn33lkpr68HpK+skffHdiWYfXrz08jdxGzvtCxNAkmftfPnseyh52sDHlxV5SPR9P4gRrFvvEAyO7HXbMRh++dCW8wugs7kcl9f8UL3S+NuLvwB9y24bi52nDNcvBOuwNb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774925940; c=relaxed/simple;
	bh=Ok7frTD76nsh33ZNUfhJmjKFKU2d78j2G8R/o5M6lJo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pkOB9Sb2vtjg3fLgq4cdnGn3R1D2KNknRZv515pIOLmpTqK59Vo0NYdYsRLH/ccZTBldZ+a5igMfUb2rxHGke3+ZqxNSnDIHXfY+ap5Pn4FPHT5pUaXXnu71QWZpMtxX/W9o5S+H3KRYvWw9yRRnxuX1ChDoK/rTlrqQJdCJm5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X43MzY3g; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X43MzY3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774925939; x=1806461939;
  h=date:from:to:cc:subject:message-id;
  bh=Ok7frTD76nsh33ZNUfhJmjKFKU2d78j2G8R/o5M6lJo=;
  b=X43MzY3gGR8MmBU1V+N5byITz1jjlkU+/mcyWHKTSUjtW6KJLBRmnXN6
   djl7Y6na++RvCRfcWhULrKNJ4qzRMOpUOwP1SN4JyqZ/Un/8adwY8Lr8Q
   t23ylwrXyK5T+XAjGOMYOuk1i+ZasaXI1taR2IOBTHvhNx54vraghno37
   ViidLjqE9Vqq/6UYsW8GL6lLXVRuqZFMy2dOb+B2VbyeXB8x4R8mXqOkB
   9r54nQ0pPWO2p2nV26iZb5GXDpohl7oiUCuX4mDm1DgOv631UA+CC9s4D
   sD4Yl/PLeEBg7/3qyPOLoSsdTI3G/opg/Ia043t/jehdagChpe7utmJ1q
   w==;
X-CSE-ConnectionGUID: qztcYxaqRCGjeHOmK8fPsw==
X-CSE-MsgGUID: EluzCUoLSqee4txSTgdTVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="76118525"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="76118525"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 19:58:58 -0700
X-CSE-ConnectionGUID: mE4K7uyZT4OVTEoesDrZFw==
X-CSE-MsgGUID: gRxo1+n5SfeSudC84hx8gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="221826237"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Mar 2026 19:58:54 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7PJc-0000000024b-069F;
	Tue, 31 Mar 2026 02:58:52 +0000
Date: Tue, 31 Mar 2026 10:58:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 drivers/dma-buf/heaps/deferred-free-helper.c:21:19: sparse: sparse: symbol
 'freelist_waitqueue' was not declared. Should it be static?
Message-ID: <202603311012.yO47aeSO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Isaac,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5fdbbd61a3cbdca7ac1034dc16723bdbc7ece8cc
commit: 2df543ce54490fb84ff4186ea24db1d9e13bb0c0 [2/2] ANDROID: Allow the deferred-free library heap to be compiled into the GKI
config: i386-randconfig-r133-20260331 (https://download.01.org/0day-ci/archive/20260331/202603311012.yO47aeSO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311012.yO47aeSO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311012.yO47aeSO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/heaps/deferred-free-helper.c:21:19: sparse: sparse: symbol 'freelist_waitqueue' was not declared. Should it be static?
   drivers/dma-buf/heaps/deferred-free-helper.c:22:20: sparse: sparse: symbol 'freelist_task' was not declared. Should it be static?

vim +/freelist_waitqueue +21 drivers/dma-buf/heaps/deferred-free-helper.c

1080a8505ff8bb John Stultz 2020-12-09  18  
1080a8505ff8bb John Stultz 2020-12-09  19  static LIST_HEAD(free_list);
1080a8505ff8bb John Stultz 2020-12-09  20  static size_t list_nr_pages;
1080a8505ff8bb John Stultz 2020-12-09 @21  wait_queue_head_t freelist_waitqueue;
1080a8505ff8bb John Stultz 2020-12-09  22  struct task_struct *freelist_task;
1080a8505ff8bb John Stultz 2020-12-09  23  static DEFINE_SPINLOCK(free_list_lock);
1080a8505ff8bb John Stultz 2020-12-09  24  

:::::: The code at line 21 was first introduced by commit
:::::: 1080a8505ff8bb21b7a554fda7b29e12d6ce5933 ANDROID: dma-buf: heaps: Add deferred-free-helper library code

:::::: TO: John Stultz <john.stultz@linaro.org>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
