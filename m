Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209F914E2C2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 23:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728083331; cv=none; b=GZWsZqZS/WpsRklfVDBnCx9NyTm6/LDtaHWfWPs5XfiYiPI3YJ7XZqZkgcbzz8J0tGj06FUzsvtfwn11a+Y3ITFbn977cIFlgV6wvzBVd/gicPnDEWztblzgHpS3rGP028YSmnq8qM2d7KkVWamH5zTjJW4plaMCEnPfC3398Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728083331; c=relaxed/simple;
	bh=SjL/BaSlyJKc4ZHI7VSRNPQ6RbAWlHbzoeUMyz4E140=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IPy0iiSfJyxtRnISIEMRDr63wD7OZZFO1D07rPXZZySp83GavEDIPjeo7cDxouQ2FErOaq9iY5htJnPq0RSp5XWznfjqJkwZlhNMZ073ev+b12OCA4X/By89ygY9fLoUtXJ+pW96K30ELizoMsAY0NFR4E2LZ7a5hrpiBmEQ9Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJxAeAZP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJxAeAZP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728083329; x=1759619329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SjL/BaSlyJKc4ZHI7VSRNPQ6RbAWlHbzoeUMyz4E140=;
  b=kJxAeAZPqcf7Ll4dy+X38YN1LoNrh8SLWfPBDbejZloap6Eea+wx2rdS
   9HGta+UazksWpeUfT3kpXeWRhm1zLesJTFKe/OW2wejO0YlY7ldFpNJEp
   tR/yYCERnn3qJZ2zMHTqmBWfNB4aC7iO505/b91GGBttUq0P9mxnGfG34
   F4mmVCzaCCQSwYd8mh/rbS8I2IXVdiioR8CxjvnDf3k3gl2sw9Ual1d+J
   J6lgiubCVAcKonXrqc/PoLBt/YEWh1A1hx59luePwgQ1ldFdKU4vqvrHu
   DMnqYHXcjPg6pSWFt34VgaUBNOJ71qIh3ZEA/5HrWD3qRFYNGsLxVtVMw
   Q==;
X-CSE-ConnectionGUID: 5zlOUtahS9Op0LeoSnePmQ==
X-CSE-MsgGUID: IBq+kqhxTG2EFrY20JM3DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="38683820"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="38683820"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 16:08:47 -0700
X-CSE-ConnectionGUID: fOoFMJCCSsaIdiOUMqpivQ==
X-CSE-MsgGUID: BnO6vsYCQcaSLOJZBW+bOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="79622434"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Oct 2024 16:08:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swrPe-0002Je-2n;
	Fri, 04 Oct 2024 23:08:42 +0000
Date: Sat, 5 Oct 2024 07:07:52 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Vernet <dvernet@meta.com>, Josh Don <joshdon@google.com>
Subject: kernel/sched/ext.c:1334:38: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202410050752.3Fxar6j4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ac308609567d31fe44be80ab757a5ddf062362ef
commit: 7b0888b7cc1924b74ce660e02f6211df8dd46e7b sched_ext: Implement core-sched support
date:   4 months ago
config: s390-randconfig-r132-20241004 (https://download.01.org/0day-ci/archive/20241005/202410050752.3Fxar6j4-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce: (https://download.01.org/0day-ci/archive/20241005/202410050752.3Fxar6j4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050752.3Fxar6j4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:916:70: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:916:70: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:916:70: sparse:    struct task_struct *
   kernel/sched/rt.c:2364:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2364:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2364:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1002:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1002:38: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1002:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1536:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1536:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1536:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1876:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1876:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1876:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1556:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1556:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1556:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1621:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1621:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1621:45: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1682:67: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1682:67: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1682:67: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2044:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2044:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2044:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2067:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2067:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2067:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2417:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2417:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2417:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2419:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2419:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2419:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2419:61: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2419:61: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2419:61: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2401:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2401:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2401:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2411:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2411:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2411:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2519:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2519:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2519:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2026:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2026:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2026:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2037:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2037:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2037:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1220:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1220:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1220:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1444:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1444:38: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1444:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2262:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2262:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2262:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:1911:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:1911:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1911:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:1987:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1987:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1987:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2566:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2566:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2566:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2568:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2568:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2568:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2570:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2570:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2570:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2745:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2745:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2745:22: sparse:    struct task_struct *
   kernel/sched/deadline.c:2794:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext.c:772:25: sparse: sparse: symbol 'scx_has_op' was not declared. Should it be static?
   kernel/sched/ext.c:876:22: sparse: sparse: symbol 'scx_dump_data' was not declared. Should it be static?
>> kernel/sched/ext.c:1334:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/ext.c:1406:56: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1406:56: sparse:    struct task_struct *
   kernel/sched/ext.c:1406:56: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/ext.c:1799:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1799:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:1799:35: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/ext.c:1809:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1809:38: sparse:     expected struct task_struct *from
   kernel/sched/ext.c:1809:38: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/ext.c:2399:56: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *sprev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2399:56: sparse:     expected struct task_struct *sprev
   kernel/sched/ext.c:2399:56: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2625:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2625:38: sparse:     expected struct task_struct *curr
   kernel/sched/ext.c:2625:38: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/ext.c:4206:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:4206:52: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:4206:52: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/ext.c:4914:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:4914:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:4914:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:5905:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:5905:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:5905:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/syscalls.c:253:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:253:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:253:48: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2234:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2234:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2234:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2234:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2234:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2234:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2234:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2234:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2234:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2234:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2409:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2409:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2409:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2234:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2409:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2409:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2409:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1426:6: sparse: sparse: context imbalance in 'sched_getaffinity' - different lock contexts for basic block
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1707:15: sparse: sparse: dereference of noderef expression

vim +1334 kernel/sched/ext.c

7b0888b7cc1924 Tejun Heo 2024-06-18  1331  
f0e1a0643a59bf Tejun Heo 2024-06-18  1332  static void update_curr_scx(struct rq *rq)
f0e1a0643a59bf Tejun Heo 2024-06-18  1333  {
f0e1a0643a59bf Tejun Heo 2024-06-18 @1334  	struct task_struct *curr = rq->curr;
f0e1a0643a59bf Tejun Heo 2024-06-18  1335  	u64 now = rq_clock_task(rq);
f0e1a0643a59bf Tejun Heo 2024-06-18  1336  	u64 delta_exec;
f0e1a0643a59bf Tejun Heo 2024-06-18  1337  
f0e1a0643a59bf Tejun Heo 2024-06-18  1338  	if (time_before_eq64(now, curr->se.exec_start))
f0e1a0643a59bf Tejun Heo 2024-06-18  1339  		return;
f0e1a0643a59bf Tejun Heo 2024-06-18  1340  
f0e1a0643a59bf Tejun Heo 2024-06-18  1341  	delta_exec = now - curr->se.exec_start;
f0e1a0643a59bf Tejun Heo 2024-06-18  1342  	curr->se.exec_start = now;
f0e1a0643a59bf Tejun Heo 2024-06-18  1343  	curr->se.sum_exec_runtime += delta_exec;
f0e1a0643a59bf Tejun Heo 2024-06-18  1344  	account_group_exec_runtime(curr, delta_exec);
f0e1a0643a59bf Tejun Heo 2024-06-18  1345  	cgroup_account_cputime(curr, delta_exec);
f0e1a0643a59bf Tejun Heo 2024-06-18  1346  
7b0888b7cc1924 Tejun Heo 2024-06-18  1347  	if (curr->scx.slice != SCX_SLICE_INF) {
f0e1a0643a59bf Tejun Heo 2024-06-18  1348  		curr->scx.slice -= min(curr->scx.slice, delta_exec);
7b0888b7cc1924 Tejun Heo 2024-06-18  1349  		if (!curr->scx.slice)
7b0888b7cc1924 Tejun Heo 2024-06-18  1350  			touch_core_sched(rq, curr);
7b0888b7cc1924 Tejun Heo 2024-06-18  1351  	}
f0e1a0643a59bf Tejun Heo 2024-06-18  1352  }
f0e1a0643a59bf Tejun Heo 2024-06-18  1353  
f0e1a0643a59bf Tejun Heo 2024-06-18  1354  static void dsq_mod_nr(struct scx_dispatch_q *dsq, s32 delta)
f0e1a0643a59bf Tejun Heo 2024-06-18  1355  {
f0e1a0643a59bf Tejun Heo 2024-06-18  1356  	/* scx_bpf_dsq_nr_queued() reads ->nr without locking, use WRITE_ONCE() */
f0e1a0643a59bf Tejun Heo 2024-06-18  1357  	WRITE_ONCE(dsq->nr, dsq->nr + delta);
f0e1a0643a59bf Tejun Heo 2024-06-18  1358  }
f0e1a0643a59bf Tejun Heo 2024-06-18  1359  
f0e1a0643a59bf Tejun Heo 2024-06-18  1360  static void dispatch_enqueue(struct scx_dispatch_q *dsq, struct task_struct *p,
f0e1a0643a59bf Tejun Heo 2024-06-18  1361  			     u64 enq_flags)
f0e1a0643a59bf Tejun Heo 2024-06-18  1362  {
f0e1a0643a59bf Tejun Heo 2024-06-18  1363  	bool is_local = dsq->id == SCX_DSQ_LOCAL;
f0e1a0643a59bf Tejun Heo 2024-06-18  1364  
f0e1a0643a59bf Tejun Heo 2024-06-18  1365  	WARN_ON_ONCE(p->scx.dsq || !list_empty(&p->scx.dsq_node));
f0e1a0643a59bf Tejun Heo 2024-06-18  1366  
f0e1a0643a59bf Tejun Heo 2024-06-18  1367  	if (!is_local) {
f0e1a0643a59bf Tejun Heo 2024-06-18  1368  		raw_spin_lock(&dsq->lock);
f0e1a0643a59bf Tejun Heo 2024-06-18  1369  		if (unlikely(dsq->id == SCX_DSQ_INVALID)) {
f0e1a0643a59bf Tejun Heo 2024-06-18  1370  			scx_ops_error("attempting to dispatch to a destroyed dsq");
f0e1a0643a59bf Tejun Heo 2024-06-18  1371  			/* fall back to the global dsq */
f0e1a0643a59bf Tejun Heo 2024-06-18  1372  			raw_spin_unlock(&dsq->lock);
f0e1a0643a59bf Tejun Heo 2024-06-18  1373  			dsq = &scx_dsq_global;
f0e1a0643a59bf Tejun Heo 2024-06-18  1374  			raw_spin_lock(&dsq->lock);
f0e1a0643a59bf Tejun Heo 2024-06-18  1375  		}
f0e1a0643a59bf Tejun Heo 2024-06-18  1376  	}
f0e1a0643a59bf Tejun Heo 2024-06-18  1377  
81aae789181b58 Tejun Heo 2024-06-18  1378  	if (enq_flags & (SCX_ENQ_HEAD | SCX_ENQ_PREEMPT))
f0e1a0643a59bf Tejun Heo 2024-06-18  1379  		list_add(&p->scx.dsq_node, &dsq->list);
f0e1a0643a59bf Tejun Heo 2024-06-18  1380  	else
f0e1a0643a59bf Tejun Heo 2024-06-18  1381  		list_add_tail(&p->scx.dsq_node, &dsq->list);
f0e1a0643a59bf Tejun Heo 2024-06-18  1382  
f0e1a0643a59bf Tejun Heo 2024-06-18  1383  	dsq_mod_nr(dsq, 1);
f0e1a0643a59bf Tejun Heo 2024-06-18  1384  	p->scx.dsq = dsq;
f0e1a0643a59bf Tejun Heo 2024-06-18  1385  
f0e1a0643a59bf Tejun Heo 2024-06-18  1386  	/*
f0e1a0643a59bf Tejun Heo 2024-06-18  1387  	 * scx.ddsp_dsq_id and scx.ddsp_enq_flags are only relevant on the
f0e1a0643a59bf Tejun Heo 2024-06-18  1388  	 * direct dispatch path, but we clear them here because the direct
f0e1a0643a59bf Tejun Heo 2024-06-18  1389  	 * dispatch verdict may be overridden on the enqueue path during e.g.
f0e1a0643a59bf Tejun Heo 2024-06-18  1390  	 * bypass.
f0e1a0643a59bf Tejun Heo 2024-06-18  1391  	 */
f0e1a0643a59bf Tejun Heo 2024-06-18  1392  	p->scx.ddsp_dsq_id = SCX_DSQ_INVALID;
f0e1a0643a59bf Tejun Heo 2024-06-18  1393  	p->scx.ddsp_enq_flags = 0;
f0e1a0643a59bf Tejun Heo 2024-06-18  1394  
f0e1a0643a59bf Tejun Heo 2024-06-18  1395  	/*
f0e1a0643a59bf Tejun Heo 2024-06-18  1396  	 * We're transitioning out of QUEUEING or DISPATCHING. store_release to
f0e1a0643a59bf Tejun Heo 2024-06-18  1397  	 * match waiters' load_acquire.
f0e1a0643a59bf Tejun Heo 2024-06-18  1398  	 */
f0e1a0643a59bf Tejun Heo 2024-06-18  1399  	if (enq_flags & SCX_ENQ_CLEAR_OPSS)
f0e1a0643a59bf Tejun Heo 2024-06-18  1400  		atomic_long_set_release(&p->scx.ops_state, SCX_OPSS_NONE);
f0e1a0643a59bf Tejun Heo 2024-06-18  1401  
f0e1a0643a59bf Tejun Heo 2024-06-18  1402  	if (is_local) {
f0e1a0643a59bf Tejun Heo 2024-06-18  1403  		struct rq *rq = container_of(dsq, struct rq, scx.local_dsq);
81aae789181b58 Tejun Heo 2024-06-18  1404  		bool preempt = false;
81aae789181b58 Tejun Heo 2024-06-18  1405  
81aae789181b58 Tejun Heo 2024-06-18 @1406  		if ((enq_flags & SCX_ENQ_PREEMPT) && p != rq->curr &&
81aae789181b58 Tejun Heo 2024-06-18  1407  		    rq->curr->sched_class == &ext_sched_class) {
81aae789181b58 Tejun Heo 2024-06-18  1408  			rq->curr->scx.slice = 0;
81aae789181b58 Tejun Heo 2024-06-18  1409  			preempt = true;
81aae789181b58 Tejun Heo 2024-06-18  1410  		}
f0e1a0643a59bf Tejun Heo 2024-06-18  1411  
81aae789181b58 Tejun Heo 2024-06-18  1412  		if (preempt || sched_class_above(&ext_sched_class,
81aae789181b58 Tejun Heo 2024-06-18  1413  						 rq->curr->sched_class))
f0e1a0643a59bf Tejun Heo 2024-06-18  1414  			resched_curr(rq);
f0e1a0643a59bf Tejun Heo 2024-06-18  1415  	} else {
f0e1a0643a59bf Tejun Heo 2024-06-18  1416  		raw_spin_unlock(&dsq->lock);
f0e1a0643a59bf Tejun Heo 2024-06-18  1417  	}
f0e1a0643a59bf Tejun Heo 2024-06-18  1418  }
f0e1a0643a59bf Tejun Heo 2024-06-18  1419  

:::::: The code at line 1334 was first introduced by commit
:::::: f0e1a0643a59bf1f922fa209cec86a170b784f3f sched_ext: Implement BPF extensible scheduler class

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
