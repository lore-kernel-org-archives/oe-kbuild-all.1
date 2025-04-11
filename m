Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD35802
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Apr 2025 04:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744346309; cv=none; b=EG8pdFQG+DAtWxO4pVLZjVbZv1DuUcm6z1IQJoBcRFeL6paMbMnz/N1C6KhW8LNFXv04nbbX3ABkcg+h8KXfFDbDFrjSj81PZRvG6xHG6AqgpYIE/Qed9fn+BRXrwHb9bDy7AdZ5wDy319lZYptZXB7FFqMQvVTKp/X/upP0ir4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744346309; c=relaxed/simple;
	bh=3mdfB+l9ylAPDZzpTlFJlbMyGtAp9/D+CV6KZZBzGZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rQcGWKBedo0e1jxYLWacjPg+tGQMvEFNMU9o7LaH0v2YlN96mDZwPU6E1zqNCnkfnzlRYkJMJPctVPFapIa/6AE4nEKuCnLka/xHZ2M7dsJtiqOI/1Qx5g6JbG8cSfuMIKHh6k6OLZXp1wNOoCywrEWZcLJNmzoLre4RedN0gL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UA3buDAH; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UA3buDAH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744346307; x=1775882307;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3mdfB+l9ylAPDZzpTlFJlbMyGtAp9/D+CV6KZZBzGZg=;
  b=UA3buDAHRASsvZ78KcGGkJZb/z0t5ng1u1PpWYesGTlMHHyfPM+q35dM
   2uDk9z586ejJstne6S7trOSsOvgCsh136kZVHF2XXh5eprnmeKj+U6bzx
   Mf8VvSYmcB27fgwT8KX0yQfmoGGfIuWUX1J4ZxUvI+ggqiOBLPKo0i2Ec
   7eoYo1x3sGpWzM+EYQeNG6JepAaueN8Zs+dkJ/YPiu1cS6fDhw/XJRISw
   eSHFD3jDLoO9gDcZ7M1OMXXtY9vFdxLLdDLkaGAvn1vshZzlfG7lK50kV
   gaiX4nOcH9LYw+yxTn7Ufxj6wcz2lgRb0/bRxqfUxrXuVJn+Fr9X8qwfr
   w==;
X-CSE-ConnectionGUID: 0Qcd0AtjSgS2mylvBp7lFg==
X-CSE-MsgGUID: 3DGtORg4TlSoH1G6n7wpyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45129014"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45129014"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 21:38:26 -0700
X-CSE-ConnectionGUID: S+mzGIvSSgiVVUJpgFI/Iw==
X-CSE-MsgGUID: zaYQB4yuSZ6nPXZF23czIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="133958161"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Apr 2025 21:38:25 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u369m-000ApR-1k;
	Fri, 11 Apr 2025 04:38:22 +0000
Date: Fri, 11 Apr 2025 12:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xia Fukun <xiafukun@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2117/2117] kernel/sched/fair.c:9005:51: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202504111253.jKd4DxgW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   62b846e657553d00552c1c71b6ecc26017eb1a9a
commit: c52c17a85f1fa9cde2bcb15359096634cfd9eb7c [2117/2117] sched: Add tracepoint for qos smt expeller
config: loongarch-randconfig-r121-20250411 (https://download.01.org/0day-ci/archive/20250411/202504111253.jKd4DxgW-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250411/202504111253.jKd4DxgW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504111253.jKd4DxgW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:7685:9: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:7685:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:7685:9: sparse:     expected void *ptr
   kernel/sched/fair.c:7685:9: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:7685:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:7685:9: sparse:     expected void *ptr
   kernel/sched/fair.c:7685:9: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:1283:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1283:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1283:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:13203:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13203:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13203:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:5161:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5161:25: sparse:    struct sparsemask [noderef] __rcu *
   kernel/sched/fair.c:5161:25: sparse:    struct sparsemask *
   kernel/sched/fair.c:5178:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5178:25: sparse:    struct sparsemask [noderef] __rcu *
   kernel/sched/fair.c:5178:25: sparse:    struct sparsemask *
   kernel/sched/fair.c:13559:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:13559:25: sparse:    struct sparsemask [noderef] __rcu *
   kernel/sched/fair.c:13559:25: sparse:    struct sparsemask *
   kernel/sched/fair.c:6012:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6012:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:6012:22: sparse:    struct task_struct *
   kernel/sched/fair.c:6754:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6754:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:6754:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:7489:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7489:32: sparse:     expected void *ptr
   kernel/sched/fair.c:7489:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7489:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7489:32: sparse:     expected void *ptr
   kernel/sched/fair.c:7489:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7489:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7489:32: sparse:     expected void *ptr
   kernel/sched/fair.c:7489:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7489:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7489:32: sparse:     expected void *ptr
   kernel/sched/fair.c:7489:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7592:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7592:16: sparse:     expected void *ptr
   kernel/sched/fair.c:7592:16: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7592:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7592:16: sparse:     expected void *ptr
   kernel/sched/fair.c:7592:16: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7592:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7592:16: sparse:     expected void *ptr
   kernel/sched/fair.c:7592:16: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7592:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7592:16: sparse:     expected void *ptr
   kernel/sched/fair.c:7592:16: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:8097:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:8097:32: sparse:     expected void *ptr
   kernel/sched/fair.c:8097:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:8097:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:8097:32: sparse:     expected void *ptr
   kernel/sched/fair.c:8097:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:8097:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:8097:32: sparse:     expected void *ptr
   kernel/sched/fair.c:8097:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:8097:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:8097:32: sparse:     expected void *ptr
   kernel/sched/fair.c:8097:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:8121:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8121:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8121:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8436:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8436:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8436:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8548:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8548:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8548:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8774:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:8774:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:8774:22: sparse:    struct task_struct *
   kernel/sched/fair.c:8839:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8839:16: sparse:     expected void *ptr
   kernel/sched/fair.c:8839:16: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:8839:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8839:16: sparse:     expected void *ptr
   kernel/sched/fair.c:8839:16: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:8839:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8839:16: sparse:     expected void *ptr
   kernel/sched/fair.c:8839:16: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:8839:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8839:16: sparse:     expected void *ptr
   kernel/sched/fair.c:8839:16: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:8896:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8896:13: sparse:     expected void *ptr
   kernel/sched/fair.c:8896:13: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:8896:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8896:13: sparse:     expected void *ptr
   kernel/sched/fair.c:8896:13: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:8896:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8896:13: sparse:     expected void *ptr
   kernel/sched/fair.c:8896:13: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:8896:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8896:13: sparse:     expected void *ptr
   kernel/sched/fair.c:8896:13: sparse:     got int [noderef] __percpu *
>> kernel/sched/fair.c:9005:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *sibling_p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9005:51: sparse:     expected struct task_struct *sibling_p
   kernel/sched/fair.c:9005:51: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9010:30: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9010:30: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:9010:30: sparse:    struct task_struct *
   kernel/sched/fair.c:9084:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9332:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:10403:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:11040:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:11040:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:11040:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12481:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12481:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12481:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12065:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:12065:36: sparse:     expected void *ptr
   kernel/sched/fair.c:12065:36: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:12065:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:12065:36: sparse:     expected void *ptr
   kernel/sched/fair.c:12065:36: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:12065:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:12065:36: sparse:     expected void *ptr
   kernel/sched/fair.c:12065:36: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:12065:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:12065:36: sparse:     expected void *ptr
   kernel/sched/fair.c:12065:36: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:12138:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12138:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:12138:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12142:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:12142:32: sparse:     expected void *ptr
   kernel/sched/fair.c:12142:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:12142:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:12142:32: sparse:     expected void *ptr
   kernel/sched/fair.c:12142:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:12142:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:12142:32: sparse:     expected void *ptr
   kernel/sched/fair.c:12142:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:12142:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:12142:32: sparse:     expected void *ptr
   kernel/sched/fair.c:12142:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:12577:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12577:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12577:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2174:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2174:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2174:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2338:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2338:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2338:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2338:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2338:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2338:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2174:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2174:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2174:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2174:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2174:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2174:25: sparse:    struct task_struct *

vim +9005 kernel/sched/fair.c

  8984	
  8985	static bool _qos_smt_check_need_resched(int this_cpu, struct rq *rq)
  8986	{
  8987		int cpu;
  8988	
  8989		if (!sched_smt_active())
  8990			return false;
  8991	
  8992		for_each_cpu(cpu, cpu_smt_mask(this_cpu)) {
  8993			if (cpu == this_cpu)
  8994				continue;
  8995	
  8996			/*
  8997			* There are two cases rely on the set need_resched to drive away
  8998			* offline task：
  8999			* a) The qos_smt_status of siblings cpu is online, the task of curr cpu is offline;
  9000			* b) The qos_smt_status of siblings cpu is offline, the task of curr cpu is idle,
  9001			*    and current cpu only has SCHED_IDLE tasks enqueued.
  9002			*/
  9003			if (per_cpu(qos_smt_status, cpu) == QOS_LEVEL_ONLINE &&
  9004			    task_group(current)->qos_level < QOS_LEVEL_ONLINE) {
> 9005				trace_sched_qos_smt_expel(cpu_curr(cpu), per_cpu(qos_smt_status, cpu));
  9006				return true;
  9007			}
  9008	
  9009			if (per_cpu(qos_smt_status, cpu) == QOS_LEVEL_OFFLINE &&
  9010			    rq->curr == rq->idle && sched_idle_cpu(this_cpu)) {
  9011				trace_sched_qos_smt_expel(cpu_curr(cpu), per_cpu(qos_smt_status, cpu));
  9012				return true;
  9013			}
  9014		}
  9015	
  9016		return false;
  9017	}
  9018	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
