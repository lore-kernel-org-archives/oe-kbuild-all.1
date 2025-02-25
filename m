Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD26425A625
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 07:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740470292; cv=none; b=VSXEREQsubiOSZRDgoaPf4y30u7sR1mC99gNYP1uVUVRavepXhrm7SC6PmR9wOT8MeGnyg80Cd04xQZ3C1YdpVleAacVUcPCPSa2rvzR8YIXKmHamvRO26OSTaev2Q97eAmPjREchY0NA0XxNBT/NlKPxPSdw2p1tJ0HsnBilTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740470292; c=relaxed/simple;
	bh=4301NCyVHhkKgy6nKTjLJLAPS7RCjguEFX8EKdfkB90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ajhmLrTmUiHuAZoHpmdvKDvMXAKYj+UJ6ny6fYkdtKneIqHdnsJUYWMZM1l5B4vS73rTx4v8cMrHDiTl0ACUgU/4aPPiBJeodjKz4hKmFMejjVCEI+LIaPprsqzlVJCEp0+3tcLYKP6TLnb8IENSH/rVXY37MKfsZHX6JtF8cBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h2Mr9Qfd; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h2Mr9Qfd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740470290; x=1772006290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4301NCyVHhkKgy6nKTjLJLAPS7RCjguEFX8EKdfkB90=;
  b=h2Mr9Qfd/2dcT5Z2g/hI+WW+7QYdAI4VcL6ot3tVgA+qPgNjmqToIgV3
   pobuHlw7Q+pHuHag3GtJZw2n2ZXccRkWNGyo2W1sXlUJE0yAZEbd5Kde0
   d2yuOLdXuyE4PFc4MRShqVqrk5wMUA4zSxQeNPUvdO8OTgH+dcbmIKVHs
   Gj22yoV0IyW7lmHkU2wSmfEKy1HfNDunijiS9HgFbt7zTtC+9qnZlqg8f
   5zQxDWLlaI+pMnw++aLNVv6s+NGORRYXe+UV+XgYMCTZCPSkDLDxHoq6K
   rywydA/1zGsnflRrWQQgxZrMjeyEc9/6n9g9ljRJ6FLhiImrWUg3t7iQO
   w==;
X-CSE-ConnectionGUID: mg4gn6MVSCmo3LlV8SHzfg==
X-CSE-MsgGUID: EikPLYldTGiLgQinp8jPKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41465890"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41465890"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 23:58:09 -0800
X-CSE-ConnectionGUID: ekF8OImkQruwzZJhz6Ml7g==
X-CSE-MsgGUID: 9d1YV3NJS7iFp9LRqfWlAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="121256204"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 24 Feb 2025 23:58:09 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmppO-0009v3-2H;
	Tue, 25 Feb 2025 07:58:06 +0000
Date: Tue, 25 Feb 2025 15:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:microq 1/1] kernel/sched/debug.c:938:6: warning: no
 previous prototype for function 'print_microq_rq'
Message-ID: <202502251503.28uuqpNC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux microq
head:   00a569cb6069576a53081ef9112cf361497c009b
commit: 00a569cb6069576a53081ef9112cf361497c009b [1/1] sched: Add micro quanta scheduling class
config: hexagon-randconfig-001-20250225 (https://download.01.org/0day-ci/archive/20250225/202502251503.28uuqpNC-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 204dcafec0ecf0db81d420d2de57b02ada6b09ec)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502251503.28uuqpNC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502251503.28uuqpNC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:72:
>> kernel/sched/debug.c:938:6: warning: no previous prototype for function 'print_microq_rq' [-Wmissing-prototypes]
     938 | void print_microq_rq(struct seq_file *m, int cpu, struct microq_rq *microq_rq)
         |      ^
   kernel/sched/debug.c:938:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     938 | void print_microq_rq(struct seq_file *m, int cpu, struct microq_rq *microq_rq)
         | ^
         | static 
   1 warning generated.


vim +/print_microq_rq +938 kernel/sched/debug.c

   936	
   937	#ifdef CONFIG_SCHED_CLASS_MICROQ
 > 938	void print_microq_rq(struct seq_file *m, int cpu, struct microq_rq *microq_rq)
   939	{
   940		SEQ_printf(m, "\nmicroq_rq[%d]:\n", cpu);
   941	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
