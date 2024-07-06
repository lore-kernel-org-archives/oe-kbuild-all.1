Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BA62837F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jul 2024 11:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264428; cv=none; b=tEelO/OnV7B50hVJF4oXEZGHWeGEron59LlXsFoQ209CjSjnbXTDMFF0LZYg7/1nPVhU8KQRna1869m81iRJ/GHmctQNqQ4ftSXue5ObaweJGw0UTh3uyswgEgjWbodOGNpELxJrNsmVP5mPQpaspjId9X1EK3kUocyozjU/kuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264428; c=relaxed/simple;
	bh=aSob7rQhE8A5VIM8JhZOwpu894SOGAYcYFrMgktad/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mneHJ+qty7krSOU643Sagle7+OXqjCHtDoohEAngF3wMAWl2V6nIsZzyyIUVMuaBAuSXF81QkdEEfBCMJwnmTvsUCqelwjjLKKYYwB9bISeRjO0EMOJ5hH3kQR7JS+3qcv/w2VyD8tCuQeYM1NrXSPtzG7s1Zu0qkTiFvnO/Les=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RGRiX45R; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RGRiX45R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720264426; x=1751800426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aSob7rQhE8A5VIM8JhZOwpu894SOGAYcYFrMgktad/c=;
  b=RGRiX45R5x2qjQ/cVvvQ509EdzK8YC+F73S5CCpwGparuhX2ugMMyxiP
   obQgspQrs2UT4zVWwsg/mLbO33jAOQWZ8ThOV1/gJDYhq5yzopZGIgWL+
   Ap4/BbhWEXmoS84N225PuS2vHEsEyhPWpz5TReS3FG9X8Jfdh4PLtVx5B
   WTIcPV4cIac7o5jGBVlxtHj56V+/CfjKBRngd46LVriSJpU8Wxs+PKt9v
   M3PWY/bbvOnQMtsC1Fpcu5pKrbyty3CEzzs3Hqd+SC2SDhIP3vLW3ZaN3
   7Z1CgZisdV9ynczNvkI5WE1VuvskQmkiw2A94ohhjWKqgE5ZYNIGo2pOT
   Q==;
X-CSE-ConnectionGUID: yzL63LqfSWWpUX+90ewHCA==
X-CSE-MsgGUID: KKPbvqDNSJm8XsxcX+iCYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="21343296"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="21343296"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 04:13:45 -0700
X-CSE-ConnectionGUID: iB9nWKtwSd+YZZhcKYnqIA==
X-CSE-MsgGUID: e8J1n0z0QbyVz2d6PZsbqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="47185351"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Jul 2024 04:13:45 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQ3ML-000Thi-2o;
	Sat, 06 Jul 2024 11:13:41 +0000
Date: Sat, 6 Jul 2024 19:13:01 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:numa/cleanups 4/5] include/linux/topology.h:245:9: error: call
 to undeclared function 'cpumask_of_node'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202407061951.UGEIDCki-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git numa/cleanups
head:   8847d013f881e4173b0d759fd9a02418548c27ea
commit: 32648bd86c675b79c12f80ccced0ffdbd14eac3a [4/5] arch, mm: move defintion of node_data to generic code
config: riscv-randconfig-r062-20240706 (https://download.01.org/0day-ci/archive/20240706/202407061951.UGEIDCki-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407061951.UGEIDCki-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407061951.UGEIDCki-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:8:
>> include/linux/topology.h:245:9: error: call to undeclared function 'cpumask_of_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     245 |         return cpumask_of_node(cpu_to_node(cpu));
         |                ^
>> include/linux/topology.h:245:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'const struct cpumask *' [-Wint-conversion]
     245 |         return cpumask_of_node(cpu_to_node(cpu));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:


vim +/cpumask_of_node +245 include/linux/topology.h

143e1e28cb40be Vincent Guittot 2014-04-11  242  
143e1e28cb40be Vincent Guittot 2014-04-11  243  static inline const struct cpumask *cpu_cpu_mask(int cpu)
143e1e28cb40be Vincent Guittot 2014-04-11  244  {
143e1e28cb40be Vincent Guittot 2014-04-11 @245  	return cpumask_of_node(cpu_to_node(cpu));
143e1e28cb40be Vincent Guittot 2014-04-11  246  }
143e1e28cb40be Vincent Guittot 2014-04-11  247  

:::::: The code at line 245 was first introduced by commit
:::::: 143e1e28cb40bed836b0a06567208bd7347c9672 sched: Rework sched_domain topology definition

:::::: TO: Vincent Guittot <vincent.guittot@linaro.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
