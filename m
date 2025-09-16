Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633D826A1CF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 17:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758045101; cv=none; b=HO1DBvGERAsElJjnxNEKTWSgX2O6JWn6A1jbOmBBV1rR9bj03nfwrd+GyHMr/HvO/yQTrkJ/5ahU3zFS3B0sDGkbttEyKuO31zyxPRR5mQAWFaa+q6QcquSzHLOhURWrOtCwfhmDCQj5f+jJrH9/7zYfVIMKirLkIepecqBgDP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758045101; c=relaxed/simple;
	bh=IpXvG+zXT8eIfpoVfAH16aCKz/krlZqiMPUZIxZN7fk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ODUrSkXDAA8rU0PqC6hBdCRmJBoIrOfGrc1+L9AD2xL/4ajPWhP5VDst0Ocjczrnu1wxaZ6aOmM/hyLKZrnN6aJdECE0cJOzxkSwGTLaOdsqFMrrXKKyT4GSYCl5Mo7dFLjP8d+AtoJS6ZalmqkaT+3O0bQi4IOme7X74VUyal4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMwJo1qn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMwJo1qn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758045097; x=1789581097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IpXvG+zXT8eIfpoVfAH16aCKz/krlZqiMPUZIxZN7fk=;
  b=AMwJo1qnkuUgHgfuvu0HOZYdXNhZvBJA7/ChvpE1wbbtJReJg1FNvDTF
   5p+lDcU6Lz097eQ8j2uyzXzdSaZLTA72WIcsAb58WlEDfLXSheqpLd45Z
   lWMpGVgH6n6tn+FB4nO7hWJftNIVCc5Qmm8BA/73S23bdR7y+0O7HAOzk
   JQgv4Cc9jTJSfZQLALea9GWdsas3LWawt0rCE9IDCsAtw8Ew5YINUE3Zq
   NfdSE8HC6Bil740fqjH+JHquOVxScEkyzD9Te0VjxDIxZtwEQKXr5OaRS
   N+4L6B+MK/BpO1EJ+hsiM6yAnF2uo7GvvatCqyGJE+izjeX6UWjJZhx7Q
   g==;
X-CSE-ConnectionGUID: bkPb1VtoS+eYi7e0UAeyWw==
X-CSE-MsgGUID: f9ZnilGqQFa7hyIBzPOEuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64138284"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64138284"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 10:51:37 -0700
X-CSE-ConnectionGUID: AGgcSimaTNCpOEHZiaJbmQ==
X-CSE-MsgGUID: zsltECcES+udWeCk/29P1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="175417507"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2025 10:51:34 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyZq0-0000ct-2h;
	Tue, 16 Sep 2025 17:51:32 +0000
Date: Wed, 17 Sep 2025 01:51:27 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 36/36] kernel/sched/fair.c:8490:9: sparse:
 sparse: incorrect type in argument 1 (different base types)
Message-ID: <202509170140.jOdZDXHs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   219a75ef543244c4335b6c050df8426ac8e15845
commit: 219a75ef543244c4335b6c050df8426ac8e15845 [36/36] sched: Enable capability analysis for core.c and fair.c
config: hexagon-randconfig-r121-20250916 (https://download.01.org/0day-ci/archive/20250917/202509170140.jOdZDXHs-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 65ad21d730d25789454d18e811f8ff5db79cb5d4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170140.jOdZDXHs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509170140.jOdZDXHs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:322:40: sparse: sparse: multiple definitions for function '__this_cpu_local_lock'
   include/linux/local_lock_internal.h:316:37: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_cap'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_cap'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/mm_api.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/mm_api.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/mm_api.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/mm_api.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/mm_api.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_cap'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/mm_api.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/mm_api.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_cap'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/mm_api.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c:1167:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *running @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1167:49: sparse:     expected struct task_struct *running
   kernel/sched/fair.c:1167:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:1201:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1201:33: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1201:33: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:1259:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1259:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1259:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12759:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12759:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12759:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6718:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:6718:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:6718:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:6923:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6923:58: sparse:     expected struct task_struct *p
   kernel/sched/fair.c:6923:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8305:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8305:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8305:20: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/fair.c:8490:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:8490:9: sparse:     expected struct __capability_bitlock const *var
   kernel/sched/fair.c:8490:9: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:8509:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8509:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8509:9: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/fair.c:8585:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/fair.c:8585:22: sparse:     expected struct __capability_bitlock const *var
   kernel/sched/fair.c:8585:22: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/fair.c:8652:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8652:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:8652:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:8684:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8684:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:8684:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8906:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8906:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8906:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9931:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9931:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9931:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10559:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10559:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10559:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12004:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12004:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12004:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11654:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11654:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11654:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12119:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12119:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12119:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:13235:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:13235:9: sparse:     expected struct __capability_bitlock const *var
   kernel/sched/fair.c:13235:9: sparse:     got struct raw_spinlock *
>> kernel/sched/fair.c:13401:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct mutex * @@
   kernel/sched/fair.c:13401:9: sparse:     expected struct __capability_bitlock const *var
   kernel/sched/fair.c:13401:9: sparse:     got struct mutex *
   kernel/sched/fair.c: note: in included file:
>> kernel/sched/sched.h:1518:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1518:9: sparse:     expected struct __capability_bitlock const *var
   kernel/sched/sched.h:1518:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1518:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1518:9: sparse:     expected struct __capability_bitlock const *var
   kernel/sched/sched.h:1518:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1518:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1518:9: sparse:     expected struct __capability_bitlock const *var
   kernel/sched/sched.h:1518:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/fair.c:6640:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/sched.h:2281:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2489:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2489:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2489:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2281:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2270:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2270:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2270:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2281:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2281:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2281:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct *
--
   include/linux/seqlock_types.h:84:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_cap'
   kernel/sched/core.c: note: in included file (through include/linux/seqlock.h, include/linux/dcache.h, include/linux/fs.h, ...):
   include/linux/seqlock_types.h:84:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   kernel/sched/core.c: note: in included file (through include/linux/seqlock.h, include/linux/dcache.h, include/linux/fs.h, ...):
   include/linux/seqlock_types.h:84:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_cap'
   kernel/sched/core.c: note: in included file (through include/linux/seqlock.h, include/linux/dcache.h, include/linux/fs.h, ...):
   include/linux/seqlock_types.h:84:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   kernel/sched/core.c: note: in included file (through include/linux/seqlock.h, include/linux/dcache.h, include/linux/fs.h, ...):
   include/linux/seqlock_types.h:84:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_cap'
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_cap'
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:322:40: sparse: sparse: multiple definitions for function '__this_cpu_local_lock'
   include/linux/local_lock_internal.h:316:37: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_cap'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_cap'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
>> kernel/sched/core.c:703:41: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:703:41: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:703:41: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/core.c:715:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:715:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:715:9: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:883:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:883:49: sparse:     expected struct task_struct *p
   kernel/sched/core.c:883:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1103:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1103:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1103:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1209:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:1209:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:1209:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:2208:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:2208:39: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:2208:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:2219:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2219:65: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2219:65: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2300:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:2300:22: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:2300:22: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:2766:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:2766:17: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:2766:17: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:3195:14: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:3195:14: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:3195:14: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:3240:14: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:3240:14: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:3240:14: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:3706:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3706:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3706:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3813:14: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:3813:14: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:3813:14: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:3911:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3911:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3911:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:4405:33: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:4405:33: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:4405:33: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:4878:14: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:4878:14: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:4878:14: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:5563:14: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:5563:14: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:5563:14: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:5645:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:5645:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:5645:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6864:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6864:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6864:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6930:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:6930:37: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6930:37: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7404:14: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:7404:14: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:7404:14: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:7437:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7437:17: sparse:    struct task_struct *
   kernel/sched/core.c:7437:17: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/core.c:7587:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct spinlock [usertype] *lock @@
   kernel/sched/core.c:7587:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:7587:9: sparse:     got struct spinlock [usertype] *lock
>> kernel/sched/core.c:7605:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct rwlock [usertype] *lock @@
   kernel/sched/core.c:7605:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:7605:9: sparse:     got struct rwlock [usertype] *lock
   kernel/sched/core.c:7623:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct rwlock [usertype] *lock @@
   kernel/sched/core.c:7623:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:7623:9: sparse:     got struct rwlock [usertype] *lock
   kernel/sched/core.c:8777:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:8777:17: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:8777:17: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:9118:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct task_struct * @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:9118:16: sparse:     expected struct task_struct *
   kernel/sched/core.c:9118:16: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:9194:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:9194:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:9194:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/core.c:9194:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct spinlock * @@
   kernel/sched/core.c:9194:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:9194:9: sparse:     got struct spinlock *
   kernel/sched/core.c:9238:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:9238:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:9238:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:9238:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct spinlock * @@
   kernel/sched/core.c:9238:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:9238:9: sparse:     got struct spinlock *
   kernel/sched/core.c:10394:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10394:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10394:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file:
>> kernel/sched/sched.h:1518:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1518:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1518:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:102:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:102:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:102:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file:
>> kernel/sched/sched.h:1518:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1518:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1518:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1518:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1518:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1518:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1518:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1518:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1518:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1518:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1518:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1518:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:883:11: sparse: sparse: dereference of noderef expression
>> kernel/sched/sched.h:1518:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1518:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1518:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1518:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1518:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1518:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1518:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1518:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1518:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1518:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1518:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1518:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1518:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1518:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1518:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1518:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1518:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1518:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1518:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1518:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1518:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1518:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1518:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1518:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1518:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1518:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1518:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1518:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1518:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1518:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/sched.h:3014:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:3014:17: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:3014:17: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/sched.h:2281:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2466:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2466:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2466:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2281:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2270:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2270:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2270:25: sparse:    struct task_struct *
   kernel/sched/core.c:2172:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2172:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2172:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2281:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2489:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2489:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2489:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2489:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2489:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2489:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2489:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2489:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2489:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2489:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2489:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2489:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2489:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2489:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2489:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2281:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2281:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2281:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2466:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2466:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2466:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2281:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2466:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2466:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2466:9: sparse:    struct task_struct *

vim +8490 kernel/sched/fair.c

732cd75b8c920d kernel/sched/fair.c Quentin Perret     2018-12-03  8465  
e7693a362ec84b kernel/sched_fair.c Gregory Haskins    2008-01-25  8466  /*
de91b9cb97fe68 kernel/sched/fair.c Morten Rasmussen   2014-02-18  8467   * select_task_rq_fair: Select target runqueue for the waking task in domains
3aef1551e94286 kernel/sched/fair.c Valentin Schneider 2020-11-02  8468   * that have the relevant SD flag set. In practice, this is SD_BALANCE_WAKE,
de91b9cb97fe68 kernel/sched/fair.c Morten Rasmussen   2014-02-18  8469   * SD_BALANCE_FORK, or SD_BALANCE_EXEC.
aaee1203ca52b9 kernel/sched_fair.c Peter Zijlstra     2009-09-10  8470   *
97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar        2018-03-03  8471   * Balances load by selecting the idlest CPU in the idlest group, or under
97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar        2018-03-03  8472   * certain conditions an idle sibling CPU if the domain has SD_WAKE_AFFINE set.
aaee1203ca52b9 kernel/sched_fair.c Peter Zijlstra     2009-09-10  8473   *
97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar        2018-03-03  8474   * Returns the target CPU number.
e7693a362ec84b kernel/sched_fair.c Gregory Haskins    2008-01-25  8475   */
0017d735092844 kernel/sched_fair.c Peter Zijlstra     2010-03-24  8476  static int
3aef1551e94286 kernel/sched/fair.c Valentin Schneider 2020-11-02  8477  select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
aaee1203ca52b9 kernel/sched_fair.c Peter Zijlstra     2009-09-10  8478  {
3aef1551e94286 kernel/sched/fair.c Valentin Schneider 2020-11-02  8479  	int sync = (wake_flags & WF_SYNC) && !(current->flags & PF_EXITING);
f1d88b4468188d kernel/sched/fair.c Viresh Kumar       2018-04-26  8480  	struct sched_domain *tmp, *sd = NULL;
c88d5910890ad3 kernel/sched_fair.c Peter Zijlstra     2009-09-10  8481  	int cpu = smp_processor_id();
63b0e9edceec10 kernel/sched/fair.c Mike Galbraith     2015-07-14  8482  	int new_cpu = prev_cpu;
99bd5e2f245d8c kernel/sched_fair.c Suresh Siddha      2010-03-31  8483  	int want_affine = 0;
3aef1551e94286 kernel/sched/fair.c Valentin Schneider 2020-11-02  8484  	/* SD_flags and WF_flags share the first nibble */
3aef1551e94286 kernel/sched/fair.c Valentin Schneider 2020-11-02  8485  	int sd_flag = wake_flags & 0xF;
098fb9db2c74cf kernel/sched_fair.c Ingo Molnar        2008-03-16  8486  
9099a14708ce1d kernel/sched/fair.c Peter Zijlstra     2020-11-17  8487  	/*
9099a14708ce1d kernel/sched/fair.c Peter Zijlstra     2020-11-17  8488  	 * required for stable ->cpus_allowed
9099a14708ce1d kernel/sched/fair.c Peter Zijlstra     2020-11-17  8489  	 */
9099a14708ce1d kernel/sched/fair.c Peter Zijlstra     2020-11-17 @8490  	lockdep_assert_held(&p->pi_lock);
dc824eb898534c kernel/sched/fair.c Valentin Schneider 2020-11-02  8491  	if (wake_flags & WF_TTWU) {
c58d25f371f5e4 kernel/sched/fair.c Peter Zijlstra     2016-05-12  8492  		record_wakee(p);
732cd75b8c920d kernel/sched/fair.c Quentin Perret     2018-12-03  8493  
ab83f455f04df5 kernel/sched/fair.c Peter Oskolkov     2023-03-07  8494  		if ((wake_flags & WF_CURRENT_CPU) &&
ab83f455f04df5 kernel/sched/fair.c Peter Oskolkov     2023-03-07  8495  		    cpumask_test_cpu(cpu, p->cpus_ptr))
ab83f455f04df5 kernel/sched/fair.c Peter Oskolkov     2023-03-07  8496  			return cpu;
ab83f455f04df5 kernel/sched/fair.c Peter Oskolkov     2023-03-07  8497  
902e786c4a54a2 kernel/sched/fair.c Shrikanth Hegde    2024-03-26  8498  		if (!is_rd_overutilized(this_rq()->rd)) {
732cd75b8c920d kernel/sched/fair.c Quentin Perret     2018-12-03  8499  			new_cpu = find_energy_efficient_cpu(p, prev_cpu);
732cd75b8c920d kernel/sched/fair.c Quentin Perret     2018-12-03  8500  			if (new_cpu >= 0)
732cd75b8c920d kernel/sched/fair.c Quentin Perret     2018-12-03  8501  				return new_cpu;
732cd75b8c920d kernel/sched/fair.c Quentin Perret     2018-12-03  8502  			new_cpu = prev_cpu;
732cd75b8c920d kernel/sched/fair.c Quentin Perret     2018-12-03  8503  		}
732cd75b8c920d kernel/sched/fair.c Quentin Perret     2018-12-03  8504  
000619680c3714 kernel/sched/fair.c Morten Rasmussen   2020-02-06  8505  		want_affine = !wake_wide(p) && cpumask_test_cpu(cpu, p->cpus_ptr);
c58d25f371f5e4 kernel/sched/fair.c Peter Zijlstra     2016-05-12  8506  	}
e7693a362ec84b kernel/sched_fair.c Gregory Haskins    2008-01-25  8507  
dce840a08702bd kernel/sched_fair.c Peter Zijlstra     2011-04-07  8508  	rcu_read_lock();
aaee1203ca52b9 kernel/sched_fair.c Peter Zijlstra     2009-09-10  8509  	for_each_domain(cpu, tmp) {
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra     2009-11-12  8510  		/*
97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar        2018-03-03  8511  		 * If both 'cpu' and 'prev_cpu' are part of this domain,
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra     2009-11-12  8512  		 * cpu is a valid SD_WAKE_AFFINE target.
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra     2009-11-12  8513  		 */
99bd5e2f245d8c kernel/sched_fair.c Suresh Siddha      2010-03-31  8514  		if (want_affine && (tmp->flags & SD_WAKE_AFFINE) &&
99bd5e2f245d8c kernel/sched_fair.c Suresh Siddha      2010-03-31  8515  		    cpumask_test_cpu(prev_cpu, sched_domain_span(tmp))) {
f1d88b4468188d kernel/sched/fair.c Viresh Kumar       2018-04-26  8516  			if (cpu != prev_cpu)
f1d88b4468188d kernel/sched/fair.c Viresh Kumar       2018-04-26  8517  				new_cpu = wake_affine(tmp, p, cpu, prev_cpu, sync);
f1d88b4468188d kernel/sched/fair.c Viresh Kumar       2018-04-26  8518  
f1d88b4468188d kernel/sched/fair.c Viresh Kumar       2018-04-26  8519  			sd = NULL; /* Prefer wake_affine over balance flags */
29cd8bae396583 kernel/sched_fair.c Peter Zijlstra     2009-09-17  8520  			break;
f03542a7019c60 kernel/sched/fair.c Alex Shi           2012-07-26  8521  		}
29cd8bae396583 kernel/sched_fair.c Peter Zijlstra     2009-09-17  8522  
2917406c352757 kernel/sched/fair.c Barry Song         2021-10-16  8523  		/*
2917406c352757 kernel/sched/fair.c Barry Song         2021-10-16  8524  		 * Usually only true for WF_EXEC and WF_FORK, as sched_domains
2917406c352757 kernel/sched/fair.c Barry Song         2021-10-16  8525  		 * usually do not have SD_BALANCE_WAKE set. That means wakeup
2917406c352757 kernel/sched/fair.c Barry Song         2021-10-16  8526  		 * will usually go to the fast path.
2917406c352757 kernel/sched/fair.c Barry Song         2021-10-16  8527  		 */
f03542a7019c60 kernel/sched/fair.c Alex Shi           2012-07-26  8528  		if (tmp->flags & sd_flag)
c88d5910890ad3 kernel/sched_fair.c Peter Zijlstra     2009-09-10  8529  			sd = tmp;
63b0e9edceec10 kernel/sched/fair.c Mike Galbraith     2015-07-14  8530  		else if (!want_affine)
63b0e9edceec10 kernel/sched/fair.c Mike Galbraith     2015-07-14  8531  			break;
c88d5910890ad3 kernel/sched_fair.c Peter Zijlstra     2009-09-10  8532  	}
4ae7d5cefd4aa3 kernel/sched_fair.c Ingo Molnar        2008-03-19  8533  
f1d88b4468188d kernel/sched/fair.c Viresh Kumar       2018-04-26  8534  	if (unlikely(sd)) {
f1d88b4468188d kernel/sched/fair.c Viresh Kumar       2018-04-26  8535  		/* Slow path */
686d148cbb5a1c kernel/sched/fair.c Ingo Molnar        2024-03-08  8536  		new_cpu = sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
dc824eb898534c kernel/sched/fair.c Valentin Schneider 2020-11-02  8537  	} else if (wake_flags & WF_TTWU) { /* XXX always ? */
f1d88b4468188d kernel/sched/fair.c Viresh Kumar       2018-04-26  8538  		/* Fast path */
772bd008cd9a1d kernel/sched/fair.c Morten Rasmussen   2016-06-22  8539  		new_cpu = select_idle_sibling(p, prev_cpu, new_cpu);
32e839dda3ba57 kernel/sched/fair.c Mel Gorman         2018-01-30  8540  	}
dce840a08702bd kernel/sched_fair.c Peter Zijlstra     2011-04-07  8541  	rcu_read_unlock();
e7693a362ec84b kernel/sched_fair.c Gregory Haskins    2008-01-25  8542  
c88d5910890ad3 kernel/sched_fair.c Peter Zijlstra     2009-09-10  8543  	return new_cpu;
e7693a362ec84b kernel/sched_fair.c Gregory Haskins    2008-01-25  8544  }
0a74bef8bed18d kernel/sched/fair.c Paul Turner        2012-10-04  8545  
0a74bef8bed18d kernel/sched/fair.c Paul Turner        2012-10-04  8546  /*
97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar        2018-03-03  8547   * Called immediately before a task is migrated to a new CPU; task_cpu(p) and
0a74bef8bed18d kernel/sched/fair.c Paul Turner        2012-10-04  8548   * cfs_rq_of(p) references at time of call are still valid and identify the
97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar        2018-03-03  8549   * previous CPU. The caller guarantees p->pi_lock or task_rq(p)->lock is held.
0a74bef8bed18d kernel/sched/fair.c Paul Turner        2012-10-04  8550   */
3f9672baaa70fc kernel/sched/fair.c Srikar Dronamraju  2018-09-21  8551  static void migrate_task_rq_fair(struct task_struct *p, int new_cpu)
0a74bef8bed18d kernel/sched/fair.c Paul Turner        2012-10-04  8552  {
e2f3e35f1f5a4d kernel/sched/fair.c Vincent Donnefort  2022-06-21  8553  	struct sched_entity *se = &p->se;
e2f3e35f1f5a4d kernel/sched/fair.c Vincent Donnefort  2022-06-21  8554  
e1f078f50478a5 kernel/sched/fair.c Chengming Zhou     2022-08-18  8555  	if (!task_on_rq_migrating(p)) {
e2f3e35f1f5a4d kernel/sched/fair.c Vincent Donnefort  2022-06-21  8556  		remove_entity_load_avg(se);
e2f3e35f1f5a4d kernel/sched/fair.c Vincent Donnefort  2022-06-21  8557  
144d8487bc6e9b kernel/sched/fair.c Peter Zijlstra     2017-05-11  8558  		/*
e2f3e35f1f5a4d kernel/sched/fair.c Vincent Donnefort  2022-06-21  8559  		 * Here, the task's PELT values have been updated according to
e2f3e35f1f5a4d kernel/sched/fair.c Vincent Donnefort  2022-06-21  8560  		 * the current rq's clock. But if that clock hasn't been
e2f3e35f1f5a4d kernel/sched/fair.c Vincent Donnefort  2022-06-21  8561  		 * updated in a while, a substantial idle time will be missed,
e2f3e35f1f5a4d kernel/sched/fair.c Vincent Donnefort  2022-06-21  8562  		 * leading to an inflation after wake-up on the new rq.
e2f3e35f1f5a4d kernel/sched/fair.c Vincent Donnefort  2022-06-21  8563  		 *
e2f3e35f1f5a4d kernel/sched/fair.c Vincent Donnefort  2022-06-21  8564  		 * Estimate the missing time from the cfs_rq last_update_time
e2f3e35f1f5a4d kernel/sched/fair.c Vincent Donnefort  2022-06-21  8565  		 * and update sched_avg to improve the PELT continuity after
e2f3e35f1f5a4d kernel/sched/fair.c Vincent Donnefort  2022-06-21  8566  		 * migration.
aff3e498844441 kernel/sched/fair.c Paul Turner        2012-10-04  8567  		 */
e2f3e35f1f5a4d kernel/sched/fair.c Vincent Donnefort  2022-06-21  8568  		migrate_se_pelt_lag(se);
144d8487bc6e9b kernel/sched/fair.c Peter Zijlstra     2017-05-11  8569  	}
9d89c257dfb9c5 kernel/sched/fair.c Yuyang Du          2015-07-15  8570  
9d89c257dfb9c5 kernel/sched/fair.c Yuyang Du          2015-07-15  8571  	/* Tell new CPU we are migrated */
e2f3e35f1f5a4d kernel/sched/fair.c Vincent Donnefort  2022-06-21  8572  	se->avg.last_update_time = 0;
3944a9274ef6cd kernel/sched/fair.c Ben Segall         2014-05-15  8573  
3f9672baaa70fc kernel/sched/fair.c Srikar Dronamraju  2018-09-21  8574  	update_scan_period(p, new_cpu);
0a74bef8bed18d kernel/sched/fair.c Paul Turner        2012-10-04  8575  }
1269557889b477 kernel/sched/fair.c Yuyang Du          2015-07-15  8576  
1269557889b477 kernel/sched/fair.c Yuyang Du          2015-07-15  8577  static void task_dead_fair(struct task_struct *p)
1269557889b477 kernel/sched/fair.c Yuyang Du          2015-07-15  8578  {
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra     2024-05-23  8579  	struct sched_entity *se = &p->se;
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra     2024-05-23  8580  
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra     2024-05-23  8581  	if (se->sched_delayed) {
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra     2024-05-23  8582  		struct rq_flags rf;
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra     2024-05-23  8583  		struct rq *rq;
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra     2024-05-23  8584  
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra     2024-05-23 @8585  		rq = task_rq_lock(p, &rf);
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra     2024-05-23  8586  		if (se->sched_delayed) {
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra     2024-05-23  8587  			update_rq_clock(rq);
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra     2024-05-23  8588  			dequeue_entities(rq, se, DEQUEUE_SLEEP | DEQUEUE_DELAYED);
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra     2024-05-23  8589  		}
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra     2024-05-23  8590  		task_rq_unlock(rq, p, &rf);
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra     2024-05-23  8591  	}
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra     2024-05-23  8592  
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra     2024-05-23  8593  	remove_entity_load_avg(se);
1269557889b477 kernel/sched/fair.c Yuyang Du          2015-07-15  8594  }
6e2df0581f5690 kernel/sched/fair.c Peter Zijlstra     2019-11-08  8595  

:::::: The code at line 8490 was first introduced by commit
:::::: 9099a14708ce1dfecb6002605594a0daa319b555 sched/fair: Add a few assertions

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
