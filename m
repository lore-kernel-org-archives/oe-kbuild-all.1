Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F141A0BD6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 02:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764640854; cv=none; b=oMRqPvQcocYCnDm/W42s6MzXNnqLSs+r6vZGPX5LreJHUSZY7+WnN4fdunW5Q11Ki+5/U5CaPS0yu3GATvMLWBPNFxDOvwhmg3QbwjcTDxFST3K8Ohj+ftp76OyVvkTbyjYRd1aDPDujQqyDV3bP/NvSsfFCi7WSfCEAa0Nkzm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764640854; c=relaxed/simple;
	bh=lh4RtxWL1xj5Wy+RwBq6KTvjBUx26qZJy4BjRFtjVSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oW59PKe43mjCHBvXk6ZmCQsYfFFtfkz+GSkt8p67sW8Y6dzgGXD5g2jKMWjypPRVRvZLfkQxdFp01ngyBMwi9N9jAHR9DdRpHZWXdLIVyAUanj1yXd1ttJmFzOfHE5vzgqahrQrLKANzLWwBptMjFCq6esJM0IO5XmIdGnU4j5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=beGaCo/z; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="beGaCo/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764640853; x=1796176853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lh4RtxWL1xj5Wy+RwBq6KTvjBUx26qZJy4BjRFtjVSk=;
  b=beGaCo/zF9odllQXTo3PU4j8SBk9PHCpzlsvW9qRFO7M7+G17BkUL520
   9erKklCg90WGIt2XiX3pdmBYv1Y0OssKYMVMGLByOW/pYytLJa1bJU8OG
   rXu97tEfSB1ZN6Kr8N9xyBDH5MNgaPisY2m6yTC4qcLVbHkpCsqukAx/D
   XOsk1r2MnoRaFokkgH0KJbkgq/H+z0vb/LE8F2Dr6CPVobY5aMt6NRHL5
   JZ7xaEuxkd49jgF0lGwcOJiUx1knQXrVPsYBtKvUtTR7OgqAESJg+ZwdZ
   uGpdQ19l20aFFlhi7jjWPS9c/Hzhg0WDvN8k5O2LOMmCErSB6DHzXRd60
   A==;
X-CSE-ConnectionGUID: PU/md6EUR/u+qxinfVc3Qg==
X-CSE-MsgGUID: 3n8RDvZmTZyiR1km7Bwvdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66554610"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66554610"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 18:00:51 -0800
X-CSE-ConnectionGUID: RIuJdh4sQ0W8UsmYwQYTyg==
X-CSE-MsgGUID: nkFdu0zVSAmWChyI19AACw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="231546107"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Dec 2025 18:00:50 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQFh9-000000009JS-3HR9;
	Tue, 02 Dec 2025 02:00:47 +0000
Date: Tue, 2 Dec 2025 10:00:25 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ingo Molnar <mingo@kernel.org>
Subject: [mingo-tip:WIP.sched/misc 11/11] sh4-linux-ld: fair.c:undefined
 reference to `__BUILD_BUG_vruntime_cmp'
Message-ID: <202512020902.iibPnCGI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.sched/misc
head:   c8dd0a78e3b31f8103c11d5e775dfaaf204ef458
commit: c8dd0a78e3b31f8103c11d5e775dfaaf204ef458 [11/11] sched/fair: Introduce and use the vruntime_cmp() and vruntime_op() wrappers for wrapped-signed aritmetics
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20251202/202512020902.iibPnCGI-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020902.iibPnCGI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020902.iibPnCGI-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: kernel/sched/fair.o: in function `vruntime_eligible':
   fair.c:(.text+0x1c94): undefined reference to `__BUILD_BUG_vruntime_op'
   sh4-linux-ld: kernel/sched/fair.o: in function `min_vruntime_cb_propagate':
   fair.c:(.text+0x25b0): undefined reference to `__BUILD_BUG_vruntime_cmp'
   sh4-linux-ld: kernel/sched/fair.o: in function `min_vruntime_cb_rotate':
   fair.c:(.text+0x2898): undefined reference to `__BUILD_BUG_vruntime_cmp'
   sh4-linux-ld: kernel/sched/fair.o: in function `update_curr':
   fair.c:(.text+0x2c2c): undefined reference to `__BUILD_BUG_vruntime_cmp'
   sh4-linux-ld: kernel/sched/fair.o: in function `__pick_eevdf':
   fair.c:(.text+0x3108): undefined reference to `__BUILD_BUG_vruntime_cmp'
   sh4-linux-ld: kernel/sched/fair.o: in function `check_preempt_wakeup_fair':
   fair.c:(.text+0x3604): undefined reference to `__BUILD_BUG_vruntime_cmp'
   sh4-linux-ld: kernel/sched/fair.o:fair.c:(.text+0x3818): more undefined references to `__BUILD_BUG_vruntime_cmp' follow
   sh4-linux-ld: kernel/sched/fair.o: in function `cfs_avg_vruntime':
   fair.c:(.text+0x3fc4): undefined reference to `__BUILD_BUG_vruntime_op'
   sh4-linux-ld: kernel/sched/fair.o: in function `update_zero_vruntime.constprop.0':
   fair.c:(.text+0x41c4): undefined reference to `__BUILD_BUG_vruntime_op'
   sh4-linux-ld: kernel/sched/fair.o: in function `__enqueue_entity.constprop.0':
   fair.c:(.text+0x43f8): undefined reference to `__BUILD_BUG_vruntime_op'
>> sh4-linux-ld: fair.c:(.text+0x4400): undefined reference to `__BUILD_BUG_vruntime_cmp'
   sh4-linux-ld: kernel/sched/fair.o: in function `__dequeue_entity.constprop.0':
   fair.c:(.text+0x46a4): undefined reference to `__BUILD_BUG_vruntime_op'
   sh4-linux-ld: kernel/sched/fair.o: in function `set_next_task_fair':
   fair.c:(.text+0x4a2c): undefined reference to `__BUILD_BUG_vruntime_cmp'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
