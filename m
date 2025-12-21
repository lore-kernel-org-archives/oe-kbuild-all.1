Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D81305E01
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 23:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766360774; cv=none; b=Blr7Fwc1QSDfI79BJnTGE4Uo4Lf78B4GvxTnodtwiu0D6BSfAeOA7qA8YEnVXsv2L/w4RTBQjULkrVaX17Yr5ojTZE+7W6+hgLVcZ9dlEOmCUFvOM2kuA1N6mU64ZdRm+255jPFkvZpoDF23xr8HfyAuZWtXMNFSxWP+CG6pdRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766360774; c=relaxed/simple;
	bh=UO2bo9s5r8LgeO4/cLQYVh972Nh5q4iik3dZ9hlvpnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OfUU8pA5PE4erFVeSyJJ7wJQWxiFdAIhKIEcIdDaL6ZoU/kyZClXAGuhq9dyKeJ372mTKkYeTLv3EDoEtCt8M7fRh9hxKgwlWkHaWn5T7mSsrSYmqnbPVtOfDJFrUBInXVtKUUbD1+wzcugIaFn4ZFIvLkHNzUb9BXQ0XDreAro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nx0puEG2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nx0puEG2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766360772; x=1797896772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UO2bo9s5r8LgeO4/cLQYVh972Nh5q4iik3dZ9hlvpnY=;
  b=Nx0puEG2Lh3ZgNRT1ukkPFjQyb/hKQpvfeDYxbgSLWLQ+uxGYUt0b5oS
   kRZCnXHiNey1BerBJtDLo/qlTaJh1lqRza3rQJZggkTMm4Keh8gYLQnXV
   6QoIwiNGqRY6fAMzBun9l6p23VyRRIPS+ElFMP5jduMIe3vJ5HjkeVnxf
   DIbVPTrpAbZbCg3+Z7LGGCsJGJrludTznIiB8QpTm1bEXLRINbIj7Mz3H
   /NeY/6IOJUsVoWRq0ozLwMg8SAfBQmWsusoBJ2cb0j5lUfV3IlMkyw1/c
   HM79dTI2+FklNlFea91tnDurRjR7ozmSwU0sbhTkyH8fd2ierqLHpQ5YS
   A==;
X-CSE-ConnectionGUID: nOpHbR7kSIuC0wiPb51RoQ==
X-CSE-MsgGUID: Odgdrn6WQZuvqwRI+xhNRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68271194"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68271194"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 15:46:11 -0800
X-CSE-ConnectionGUID: uZL80fitSzWJsunpzGyxCw==
X-CSE-MsgGUID: fcH7ietZTyyOy9WhaSNb4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="198538304"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 21 Dec 2025 15:46:10 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXT7n-000000005HM-2mQI;
	Sun, 21 Dec 2025 23:46:07 +0000
Date: Mon, 22 Dec 2025 00:45:18 +0100
From: kernel test robot <lkp@intel.com>
To: pr-hung <bkedx0000@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:pr/26 1/1] drivers/net/netdevsim/fib.c:58:28:
 error: duplicate member 'fib_flush_work'
Message-ID: <202512220054.QSnSPPy9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa pr/26
head:   0c125b4fcef40ea2c876496f0e3b9b6e74dcebde
commit: 0c125b4fcef40ea2c876496f0e3b9b6e74dcebde [1/1] Fix potential vulnerability in cloned code (drivers/net/netdevsim/fib.c)
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251222/202512220054.QSnSPPy9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220054.QSnSPPy9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220054.QSnSPPy9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/net/netdevsim/fib.c:58:28: error: duplicate member 'fib_flush_work'
      58 |         struct work_struct fib_flush_work;
         |                            ^~~~~~~~~~~~~~
   drivers/net/netdevsim/fib.c: In function 'nsim_fib_flush_work':
>> drivers/net/netdevsim/fib.c:1504:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1504 | {
         | ^
   drivers/net/netdevsim/fib.c:1540:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1540 | {
         | ^
   drivers/net/netdevsim/fib.c:1567:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1567 | {
         | ^
   drivers/net/netdevsim/fib.c:1573:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1573 | {
         | ^
   drivers/net/netdevsim/fib.c:1665:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1665 | {
         | ^
>> drivers/net/netdevsim/fib.c:1692: error: expected '{' at end of input
   drivers/net/netdevsim/fib.c: At top level:
>> drivers/net/netdevsim/fib.c:1502:13: warning: 'nsim_fib_flush_work' defined but not used [-Wunused-function]
    1502 | static void nsim_fib_flush_work(struct work_struct *work)
         |             ^~~~~~~~~~~~~~~~~~~
>> drivers/net/netdevsim/fib.c:1479:13: warning: 'nsim_fib_event_work' defined but not used [-Wunused-function]
    1479 | static void nsim_fib_event_work(struct work_struct *work)
         |             ^~~~~~~~~~~~~~~~~~~
>> drivers/net/netdevsim/fib.c:1458:13: warning: 'nsim_fib_set_max_all' defined but not used [-Wunused-function]
    1458 | static void nsim_fib_set_max_all(struct nsim_fib_data *data,
         |             ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/netdevsim/fib.c:1451:12: warning: 'nsim_fib_nexthops_res_occ_get' defined but not used [-Wunused-function]
    1451 | static u64 nsim_fib_nexthops_res_occ_get(void *priv)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/netdevsim/fib.c:1444:12: warning: 'nsim_fib_ipv6_rules_res_occ_get' defined but not used [-Wunused-function]
    1444 | static u64 nsim_fib_ipv6_rules_res_occ_get(void *priv)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/netdevsim/fib.c:1437:12: warning: 'nsim_fib_ipv6_resource_occ_get' defined but not used [-Wunused-function]
    1437 | static u64 nsim_fib_ipv6_resource_occ_get(void *priv)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/netdevsim/fib.c:1430:12: warning: 'nsim_fib_ipv4_rules_res_occ_get' defined but not used [-Wunused-function]
    1430 | static u64 nsim_fib_ipv4_rules_res_occ_get(void *priv)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/netdevsim/fib.c:1423:12: warning: 'nsim_fib_ipv4_resource_occ_get' defined but not used [-Wunused-function]
    1423 | static u64 nsim_fib_ipv4_resource_occ_get(void *priv)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/netdevsim/fib.c:1417:37: warning: 'nsim_nexthop_bucket_activity_fops' defined but not used [-Wunused-const-variable=]
    1417 | static const struct file_operations nsim_nexthop_bucket_activity_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/netdevsim/fib.c:1353:13: warning: 'nsim_nexthop_free' defined but not used [-Wunused-function]
    1353 | static void nsim_nexthop_free(void *ptr, void *arg)
         |             ^~~~~~~~~~~~~~~~~
>> drivers/net/netdevsim/fib.c:1323:12: warning: 'nsim_nexthop_event_nb' defined but not used [-Wunused-function]
    1323 | static int nsim_nexthop_event_nb(struct notifier_block *nb, unsigned long event,
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/netdevsim/fib.c:1091:13: warning: 'nsim_fib_dump_inconsistent' defined but not used [-Wunused-function]
    1091 | static void nsim_fib_dump_inconsistent(struct notifier_block *nb)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/netdevsim/fib.c:1027:12: warning: 'nsim_fib_event_nb' defined but not used [-Wunused-function]
    1027 | static int nsim_fib_event_nb(struct notifier_block *nb, unsigned long event,
         |            ^~~~~~~~~~~~~~~~~


vim +/fib_flush_work +58 drivers/net/netdevsim/fib.c

    44	
    45	struct nsim_fib_data {
    46		struct notifier_block fib_nb;
    47		struct nsim_per_fib_data ipv4;
    48		struct nsim_per_fib_data ipv6;
    49		struct nsim_fib_entry nexthops;
    50		struct rhashtable fib_rt_ht;
    51		struct list_head fib_rt_list;
    52		struct mutex fib_lock; /* Protects FIB HT and list */
    53		struct notifier_block nexthop_nb;
    54		struct rhashtable nexthop_ht;
    55		struct devlink *devlink;
    56		struct work_struct fib_event_work;
    57		struct work_struct fib_flush_work;
  > 58		struct work_struct fib_flush_work;
    59		struct list_head fib_event_queue;
    60		spinlock_t fib_event_queue_lock; /* Protects fib event queue list */
    61		struct mutex nh_lock; /* Protects NH HT */
    62		struct dentry *ddir;
    63		bool fail_route_offload;
    64		bool fail_res_nexthop_group_replace;
    65		bool fail_nexthop_bucket_replace;
    66		bool fail_route_delete;
    67	};
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
