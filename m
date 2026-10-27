Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793132687;
	b=cggQNVafeLuHrS3mABhvo9JZA7tutVoAV4CqORNvREr7qRl3o2mD2iG5Mj/B/fNghDXH
	 g9zZPg7xJZHhkJS1Bigg9MfySSYLFZELWa5wMVlpLM9eQjDGTCJKDIs9o8Ny6yQ9PNRUz
	 Edsi8T02Uv9Fo8UyKOEspIbP9+TI9hxQm4yrUrGQQrGcjVQzHGMGtmLD2jwX6Xy44ia1v
	 s3XTvIM8a09umW23msMgI1f3Sj1fWPsPh9czZzYdFNhXiPSNmyP/tfXVcbw/KGEnimwb8
	 g53y/MwbrIE9gGKWbaIkRU8s3bv9L1+/JpPn60Ig5fvuAui47KsWn2kF0hBJbx20XPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793132687;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=sxCWcsZZ64roCPH2WT1hpQGkvBZSi4A0rZ0hxg7kTGU=;
	b=iLYX/U960lkmfYUtaDHuxrraw75dn56djfs5Js34ZFTvtFUtjaYSMp+IcjepNXIt/g00
	 gT8SNVJkpIv4U3wocpbSda01lgKgsrmXfYETQD+5NU0Q2FJORyu1F6rf6R/up542Sg4pW
	 ksMjytIzhHD6RdibQhHWhA0j384oVhq3suuE0wkskR0YPzFQ+hqarxtWkJH2T76SlgT3B
	 QpsEa1m+ZnJ+XLIbrjvmDTp10ElAwHN9ltPraX1cYMuu6Zx8fu7Js68hCVl0igsXjwzTi
	 ZoHRdvNsmgn0PTVyrcVT8EVJBcJ9yYB7i2lYUhRD1drUwSqStK4ekWIgQSAYGT7dOPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h7lrTzUi;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D084606A325
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 20:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D084606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h7lrTzUi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793132686; x=1824668686;
  h=date:from:to:cc:subject:message-id;
  bh=iu9pnwY4wlFkl8iDyrf7h/L8A7m/BoSj/DD7syiwXN8=;
  b=h7lrTzUi+VH+bgZYjDboiOaFUGWNQ+sn+Cha+SDwp9gWaC9pDAzznmzJ
   w8UlacHi9jbhxQJ3f8HuC7yPtUunEL3du3ohjuzXDQnl8HQabbHlGVMTg
   1a2uHLQ/kh4wkcARC4rn9zJ8E16zNR+HdkQkec3bcUTK1Ys7Ihmd7POk1
   xf3i3HrE/ws0P6ovsv4+e79psX7GvoORrexoBUQPwNc2pcE7VObsua4Gr
   N9bpYKlk06i2//s9z9tjoL0eUpRBjchgeZhlxk99vrovWbQsezal/I0BE
   On08omhs/7CYt9AO9WIWYmmQ6L6BCRFywuTSf+2C+cUE5oMz8kbwtQqHm
   w==;
X-CSE-ConnectionGUID: 7ZW07HRcQVC4o79VWwqZ6A==
X-CSE-MsgGUID: krNd2wkgTiSVuQ0jVVO0pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1753179"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1753179"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 13:24:45 -0700
X-CSE-ConnectionGUID: KEFENOvWSp6s1chPmrEekg==
X-CSE-MsgGUID: QXxpi6KxRnKCN9kerZgkiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4590516"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 27 Oct 2026 13:24:44 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLnir-000000004cV-0Rm1;
	Tue, 27 Oct 2026 20:24:41 +0000
Date: Tue, 27 Oct 2026 21:24:17 +0100
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-thread-handoff.5 9/25]
 kernel/thread_handoff.c:382:9: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202610272139.wqcXidKp-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Jens,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-thread-handoff.5
head:   f88f795ff68ef7f7c12e12e26ae4fa4d5995db42
commit: a533e11ab54f485017bf7de1530b0eb3f0f8348b [9/25] arm64: implement thread identity handoff
config: arm64-randconfig-r2302-20261027 (https://download.01.org/0day-ci/archive/20261027/202610272139.wqcXidKp-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610272139.wqcXidKp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610272139.wqcXidKp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/thread_handoff.c:382:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/thread_handoff.c:382:9: sparse:    struct cred const [noderef] __rcu *
   kernel/thread_handoff.c:382:9: sparse:    struct cred const *
   kernel/thread_handoff.c:390:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/thread_handoff.c:390:9: sparse:    struct cred const [noderef] __rcu *
   kernel/thread_handoff.c:390:9: sparse:    struct cred const *
   kernel/thread_handoff.c: note: in included file (through arch/arm64/include/asm/spectre.h, arch/arm64/include/asm/processor.h, include/linux/sched.h, include/linux/thread_handoff.h):
   arch/arm64/include/asm/percpu.h:261:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
   arch/arm64/include/asm/percpu.h:261:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)

vim +382 kernel/thread_handoff.c

25e9c2e68556051 Jens Axboe 2026-08-30  370  
25e9c2e68556051 Jens Axboe 2026-08-30  371  /*
25e9c2e68556051 Jens Axboe 2026-08-30  372   * Adopt the source's creds. Not commit_creds(), the process isn't changing
25e9c2e68556051 Jens Axboe 2026-08-30  373   * credentials, an existing identity is just moving between two of its tasks.
25e9c2e68556051 Jens Axboe 2026-08-30  374   */
25e9c2e68556051 Jens Axboe 2026-08-30  375  static void thread_handoff_creds(struct task_struct *dst,
25e9c2e68556051 Jens Axboe 2026-08-30  376  				 struct task_struct *src)
25e9c2e68556051 Jens Axboe 2026-08-30  377  {
25e9c2e68556051 Jens Axboe 2026-08-30  378  	/* neither side changes its own creds while a handoff is in flight */
25e9c2e68556051 Jens Axboe 2026-08-30  379  	const struct cred *old = rcu_dereference_protected(dst->real_cred, true);
25e9c2e68556051 Jens Axboe 2026-08-30  380  	const struct cred *new = rcu_dereference_protected(src->real_cred, true);
25e9c2e68556051 Jens Axboe 2026-08-30  381  
25e9c2e68556051 Jens Axboe 2026-08-30 @382  	WARN_ON_ONCE(rcu_dereference_protected(dst->cred, true) != old);
25e9c2e68556051 Jens Axboe 2026-08-30  383  	if (new == old)
25e9c2e68556051 Jens Axboe 2026-08-30  384  		return;
25e9c2e68556051 Jens Axboe 2026-08-30  385  
25e9c2e68556051 Jens Axboe 2026-08-30  386  	get_cred_many(new, 2);
25e9c2e68556051 Jens Axboe 2026-08-30  387  	if (new->user != old->user)
25e9c2e68556051 Jens Axboe 2026-08-30  388  		inc_rlimit_ucounts(new->ucounts, UCOUNT_RLIMIT_NPROC, 1);
25e9c2e68556051 Jens Axboe 2026-08-30  389  	rcu_assign_pointer(dst->real_cred, new);
25e9c2e68556051 Jens Axboe 2026-08-30  390  	rcu_assign_pointer(dst->cred, new);
25e9c2e68556051 Jens Axboe 2026-08-30  391  	if (new->user != old->user)
25e9c2e68556051 Jens Axboe 2026-08-30  392  		dec_rlimit_ucounts(old->ucounts, UCOUNT_RLIMIT_NPROC, 1);
25e9c2e68556051 Jens Axboe 2026-08-30  393  	put_cred_many(old, 2);
25e9c2e68556051 Jens Axboe 2026-08-30  394  }
25e9c2e68556051 Jens Axboe 2026-08-30  395  

:::::: The code at line 382 was first introduced by commit
:::::: 25e9c2e6855605108b9168bf44e404f9722c9dd4 kernel: add thread identity handoff

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
