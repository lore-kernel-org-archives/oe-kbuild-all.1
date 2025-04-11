Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F88627BF85
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Apr 2025 07:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744356826; cv=none; b=Tzku94UL5MFNJt8OnfgEAass8j9gGgIVT4FpdXl2dqAVSs8Z4tRWdxLD7kvo5zejyxnsoXeIpmfF/1PSgGdOC7TNx7otCsfrTjDDvgNPiOZ4GzOQwj8VgxnUAcNeIz42GhbTLVPwnDFI/IInl/PN3BP9q97mFesHtQdSCQX1UFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744356826; c=relaxed/simple;
	bh=PYn2m9HBYhXkqSSCtbGoSvZDBhotjmKyeohpJptPCrA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AX0GnV3vyueb9g9h9twb+GrkgZX2ajLHSCcDv3K2t2WDKGTFGVxJo2MPMI/UYQCJEkH194nlqfQKehi7Ew+j6ZEa9tfgviFKs8nrPmZ8AeVTtrxS3BKKwoHFf85PqkXgKo7nEkmazaToXLlwPNp6cfbReSxpWFNx3LoJM/PXvN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gnGCbng9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gnGCbng9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744356823; x=1775892823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PYn2m9HBYhXkqSSCtbGoSvZDBhotjmKyeohpJptPCrA=;
  b=gnGCbng9eGgDehsEG4mJzwjJlyVapznszxokD3ASlnX3GbnZAgMTB4P6
   QdAuOtxm6qzGgvKh7bAhF7QfmWXFrUJpHJ7xglAo2CIN27+2TjWcKfBBj
   vM1utWe4ztdLYRqzaJiD3gALUFIyqFsrOA/989P1gz5cDPK8E65YZufB6
   zdkIEcTJiPQOAC08Dzr4D1ClLqCm5oAHBt2Sg9lARoeKmQ/6UV6PP2jHl
   6KHvfSMamrhwAH92n2xASn5cz4vr+2I4GYbwCm2pVlTmYBRP5fk5VNYGX
   ecIh7vf+5I7bsh6Rv2ev2DCSXVFvERk/pn+OZ5cBi1gl3ZBN9TpjUHcNo
   A==;
X-CSE-ConnectionGUID: /PXi6mj5QUm9FCwAbBguoA==
X-CSE-MsgGUID: GA2Kkio+QvCuI15kHc3e5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56545999"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="56545999"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 00:33:42 -0700
X-CSE-ConnectionGUID: Sg+Tn1lhTmSxSEj2J4PsYw==
X-CSE-MsgGUID: Lck7lhCtSFi96clKDYZLiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="128894935"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Apr 2025 00:33:41 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u38tP-000AwI-0f;
	Fri, 11 Apr 2025 07:33:39 +0000
Date: Fri, 11 Apr 2025 15:32:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xia Fukun <xiafukun@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2117/2117] kernel/sched/fair.c:8988:1: sparse:
 sparse: symbol 'qos_smt_expell_switch' was not declared. Should it be
 static?
Message-ID: <202504111549.QczZh25x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   62b846e657553d00552c1c71b6ecc26017eb1a9a
commit: a62d532da0b51fe39f726c4c08f3debc8b3bc5d7 [2117/2117] sched/fair: Add cmdline nosmtexpell
config: loongarch-randconfig-r121-20250411 (https://download.01.org/0day-ci/archive/20250411/202504111549.QczZh25x-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250411/202504111549.QczZh25x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504111549.QczZh25x-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:7727:9: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:7727:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:7727:9: sparse:     expected void *ptr
   kernel/sched/fair.c:7727:9: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:7727:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:7727:9: sparse:     expected void *ptr
   kernel/sched/fair.c:7727:9: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:1284:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1284:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1284:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:13325:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13325:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13325:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:5162:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5162:25: sparse:    struct sparsemask [noderef] __rcu *
   kernel/sched/fair.c:5162:25: sparse:    struct sparsemask *
   kernel/sched/fair.c:5179:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5179:25: sparse:    struct sparsemask [noderef] __rcu *
   kernel/sched/fair.c:5179:25: sparse:    struct sparsemask *
   kernel/sched/fair.c:13681:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:13681:25: sparse:    struct sparsemask [noderef] __rcu *
   kernel/sched/fair.c:13681:25: sparse:    struct sparsemask *
   kernel/sched/fair.c:6038:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6038:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:6038:22: sparse:    struct task_struct *
   kernel/sched/fair.c:6780:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6780:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:6780:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:7531:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7531:32: sparse:     expected void *ptr
   kernel/sched/fair.c:7531:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7531:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7531:32: sparse:     expected void *ptr
   kernel/sched/fair.c:7531:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7531:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7531:32: sparse:     expected void *ptr
   kernel/sched/fair.c:7531:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7531:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7531:32: sparse:     expected void *ptr
   kernel/sched/fair.c:7531:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7634:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7634:16: sparse:     expected void *ptr
   kernel/sched/fair.c:7634:16: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7634:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7634:16: sparse:     expected void *ptr
   kernel/sched/fair.c:7634:16: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7634:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7634:16: sparse:     expected void *ptr
   kernel/sched/fair.c:7634:16: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7634:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7634:16: sparse:     expected void *ptr
   kernel/sched/fair.c:7634:16: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:8139:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:8139:32: sparse:     expected void *ptr
   kernel/sched/fair.c:8139:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:8139:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:8139:32: sparse:     expected void *ptr
   kernel/sched/fair.c:8139:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:8139:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:8139:32: sparse:     expected void *ptr
   kernel/sched/fair.c:8139:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:8139:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:8139:32: sparse:     expected void *ptr
   kernel/sched/fair.c:8139:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:8163:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8163:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8163:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8478:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8478:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8478:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8590:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8590:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8590:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8910:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8910:16: sparse:     expected void *ptr
   kernel/sched/fair.c:8910:16: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:8910:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8910:16: sparse:     expected void *ptr
   kernel/sched/fair.c:8910:16: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:8910:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8910:16: sparse:     expected void *ptr
   kernel/sched/fair.c:8910:16: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:8910:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8910:16: sparse:     expected void *ptr
   kernel/sched/fair.c:8910:16: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:8936:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:8936:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:8936:22: sparse:    struct task_struct *
   kernel/sched/fair.c:8972:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8972:13: sparse:     expected void *ptr
   kernel/sched/fair.c:8972:13: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:8972:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8972:13: sparse:     expected void *ptr
   kernel/sched/fair.c:8972:13: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:8972:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8972:13: sparse:     expected void *ptr
   kernel/sched/fair.c:8972:13: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:8972:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8972:13: sparse:     expected void *ptr
   kernel/sched/fair.c:8972:13: sparse:     got int [noderef] __percpu *
>> kernel/sched/fair.c:8988:1: sparse: sparse: symbol 'qos_smt_expell_switch' was not declared. Should it be static?
   kernel/sched/fair.c:9122:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *sibling_p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9122:51: sparse:     expected struct task_struct *sibling_p
   kernel/sched/fair.c:9122:51: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9127:30: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9127:30: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:9127:30: sparse:    struct task_struct *
   kernel/sched/fair.c:9205:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9454:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:10525:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:11162:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:11162:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:11162:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12603:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12603:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12603:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12187:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:12187:36: sparse:     expected void *ptr
   kernel/sched/fair.c:12187:36: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:12187:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:12187:36: sparse:     expected void *ptr
   kernel/sched/fair.c:12187:36: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:12187:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:12187:36: sparse:     expected void *ptr
   kernel/sched/fair.c:12187:36: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:12187:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:12187:36: sparse:     expected void *ptr
   kernel/sched/fair.c:12187:36: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:12260:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12260:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:12260:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12264:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:12264:32: sparse:     expected void *ptr
   kernel/sched/fair.c:12264:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:12264:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:12264:32: sparse:     expected void *ptr
   kernel/sched/fair.c:12264:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:12264:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:12264:32: sparse:     expected void *ptr
   kernel/sched/fair.c:12264:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:12264:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:12264:32: sparse:     expected void *ptr
   kernel/sched/fair.c:12264:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:12699:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12699:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12699:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2182:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2182:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2182:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2346:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2346:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2346:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2346:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2346:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2346:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2182:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2182:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2182:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2182:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2182:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2182:25: sparse:    struct task_struct *

vim +/qos_smt_expell_switch +8988 kernel/sched/fair.c

  8986	
  8987	#ifdef CONFIG_QOS_SCHED_SMT_EXPELLER
> 8988	DEFINE_STATIC_KEY_TRUE(qos_smt_expell_switch);
  8989	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
