Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853E81B266
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696435095; x=1727971095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o2BZjXohgp2ief24ewXz2jYnX/fxdkg0hZvQleQ1REY=;
  b=buATsFDx8SvNjMJ0qHEjuPq/HKFjiy2/wfiuYa2CWmUSPPb9rosTGmsd
   r8i6GMuk8q80XQo30mHAO5tHWCz/PvHcDsMQM20nmjaoqZUZDsx0dRbTv
   mkyQ9P9DMe9a78L3JJYHLKhGnVz8FfxBPiqROY5DIEhB/Y0JHM56niZEv
   P0mIa9ZtSUkvIYUaIqD3vXKqVZ3uyAzPsC/hWQOKJG+LdxWev7bx5qPpE
   iP671fl0P+QAA3G9lAjjqIYPy/bafC+RSYGw+EBHO449qY+3uv2wVKauL
   90XE1JQRdQxnvpK2bmkxoJCi6Zfe7uoqagte7zHqAm2C7zmf6O6pW6jBs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="362567227"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="362567227"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 08:58:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="998508492"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="998508492"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 04 Oct 2023 08:58:12 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qo4GI-000KN0-2j;
	Wed, 04 Oct 2023 15:58:10 +0000
Date: Wed, 4 Oct 2023 23:57:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 228/237] kernel/sched/fair.c:188:1: sparse:
 sparse: symbol 'sched_aggressive_next_balance' was not declared. Should it
 be static?
Message-ID: <202310042324.i9uT1ZEC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   2997321405e398cda3e34ca2a3f82bd156660722
commit: 918f229ba2ff720f5dfae4768469acbb6ea39fe2 [228/237] CHROMIUM: sched/fair: Raise SCHED_SOFTIRQ less aggressively
config: i386-randconfig-061-20231004 (https://download.01.org/0day-ci/archive/20231004/202310042324.i9uT1ZEC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310042324.i9uT1ZEC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310042324.i9uT1ZEC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/fair.c:188:1: sparse: sparse: symbol 'sched_aggressive_next_balance' was not declared. Should it be static?
   kernel/sched/fair.c:949:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:949:34: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:949:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:11814:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11814:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11814:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:5518:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5518:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:5518:22: sparse:    struct task_struct *
   kernel/sched/fair.c:6044:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6044:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:6044:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:7326:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7326:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:7326:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7557:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7557:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:7557:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7734:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7734:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:7734:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8032:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8032:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8032:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9028:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9028:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9028:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:9666:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9666:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:9666:22: sparse:    struct task_struct *
   kernel/sched/fair.c:11086:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11086:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11086:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:10745:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:10745:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:10745:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11182:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11182:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11182:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2077:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2077:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2077:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2231:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2077:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2077:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2077:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2077:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2077:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2077:25: sparse:    struct task_struct *

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
