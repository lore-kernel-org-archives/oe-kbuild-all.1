Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C5D25228C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 15:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781279278; cv=none; b=Eb51wGwmZQYUn1Dpb9bseNekyUPa7XMnIHg7oj9t/ydn5NpqKFXxL/Zu8/RIJJ0T//ToZIBC4fnWDnr/BLL4TaXnUuS1YEkLPpgR3eFOLb9OiMKx8IPfU6d6wiKvss8RyuM4sthASAl7SV10XN5ni5kgd16JkLl/CjhsWdYLhGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781279278; c=relaxed/simple;
	bh=3BhgG0L2s2q9KrSI3YKY1bXDgHYQml2LdSZeghEAvEU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rwzcgqp11RFvSsGOjnNf+zhKBX/ceABq1sHbG2CA+KVBg1W0pyrFpPVmDa17YH6O93ZFDlpn/3xnhjEmx8T3bNI/JZg8omMGjeqfl+qnYqrz0EDHgsA2pEEgpB0uGeZuzlgalhMjNaNh5iCI3PwWVfIPyVSGsE9KD8+dmleIbMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7ezAUXS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7ezAUXS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781279277; x=1812815277;
  h=date:from:to:cc:subject:message-id;
  bh=3BhgG0L2s2q9KrSI3YKY1bXDgHYQml2LdSZeghEAvEU=;
  b=A7ezAUXSJuh8vWTgXCSeI6AJsmAF8689hrfPdmXYrcx7EsK/8GFMAd/u
   5oWf5qeoFpUjnF3efixgOHB8R5Cwgq5zMfzepswIBY4lDEypD0KIdUwVu
   pX9CVmiMGpzFP2fmK75mdHY0fypaVbk43C7rbmF0200OhXCZTKyd4A1+y
   pU/l48rwP2Iy4SHYgqp4aQ6HsxSembU6dt93E/93VIe19sed4bQ+rzP3w
   +vCyX8AVBLGkukqQeO6MhKaguvUjQMPecIVAwQfKkQyetKRZWLDiazO9S
   mX5FBAve63KwpBqzZ760Pdc+Aqi6HIFz3slqtID/Bn0DUFkoFai3QeU6w
   g==;
X-CSE-ConnectionGUID: +jIOy7znRtqZgY9ahr4ZhQ==
X-CSE-MsgGUID: wXcpenY0S6+y8PUBz9taeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="107544789"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="107544789"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 08:47:56 -0700
X-CSE-ConnectionGUID: 5AeYS3QiQDui3GMeeY4cnw==
X-CSE-MsgGUID: u8pl00IsTUO6Se+snRer+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="245952024"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Jun 2026 08:47:54 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY46p-00000000OxZ-21e9;
	Fri, 12 Jun 2026 15:47:51 +0000
Date: Fri, 12 Jun 2026 23:47:35 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrea Righi <arighi@nvidia.com>
Subject: kernel/sched/ext.c:3898:50: sparse: sparse: incorrect type
 in initializer (different address spaces)
Message-ID: <202606122315.pbnDHP0n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Tejun,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
commit: 987e00035c0e68bc0d44dec811cc9c26310b5bff sched_ext: Rename pnt_seq to kick_sync
date:   8 months ago
config: arm64-randconfig-r111-20260612 (https://download.01.org/0day-ci/archive/20260612/202606122315.pbnDHP0n-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6a8ad9d1b5c2efc07899796d41956761bd4247b8)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606122315.pbnDHP0n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 987e00035c0e ("sched_ext: Rename pnt_seq to kick_sync")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606122315.pbnDHP0n-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/ext.c:1022:56: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:1047:66: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1047:66: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:1047:66: sparse:    struct task_struct *
   kernel/sched/ext.c:1237:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1237:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1237:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1355:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1355:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1355:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1402:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1402:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1402:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1451:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1451:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1451:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1495:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1495:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1495:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1496:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1496:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:1496:35: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:1506:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1506:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1506:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1507:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1507:38: sparse:     expected struct task_struct *from
   kernel/sched/ext.c:1507:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2061:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2061:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2061:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2204:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2204:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2204:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2260:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2260:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2260:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2301:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2301:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2301:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2355:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2355:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:2355:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2468:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2468:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2468:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2529:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2529:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2529:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2548:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2548:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2548:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2670:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2670:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2670:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2749:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2749:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2749:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2802:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2802:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2802:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2830:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2830:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2830:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2843:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2843:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2843:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2973:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2973:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2973:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2989:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2989:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2989:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3025:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:3025:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:3025:35: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:3057:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3057:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3057:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3086:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3086:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3086:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3099:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3099:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3099:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3148:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3148:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3148:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3167:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3167:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3167:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3185:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3185:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3185:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3201:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3201:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3201:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3218:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3218:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3218:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
>> kernel/sched/ext.c:3898:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext.c:3898:50: sparse:     expected struct scx_kick_syncs **ksyncs
   kernel/sched/ext.c:3898:50: sparse:     got struct scx_kick_syncs [noderef] __rcu **
   kernel/sched/ext.c:3901:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:3901:27: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:3901:27: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:3901:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:3901:27: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:3901:27: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:4182:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:4182:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4182:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:4225:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:4225:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4225:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:4336:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:4336:52: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:4336:52: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:4413:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext.c:4413:50: sparse:     expected struct scx_kick_syncs **ksyncs
   kernel/sched/ext.c:4413:50: sparse:     got struct scx_kick_syncs [noderef] __rcu **
   kernel/sched/ext.c:4416:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4416:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:4416:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:4425:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4425:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:4425:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:5119:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5119:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:5119:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:5246:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:5246:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:5246:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:5573:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:5573:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:5573:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:6537:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:6537:15: sparse:    struct scx_sched [noderef] __rcu *
   kernel/sched/ext.c:6537:15: sparse:    struct scx_sched *
   kernel/sched/ext.c:6632:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:6632:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:6632:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext_idle.c:736:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext_idle.c:756:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:185:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:185:22: sparse:    struct task_struct [noderef] __rcu *

vim +3898 kernel/sched/ext.c

  3892	
  3893	static void free_kick_syncs(void)
  3894	{
  3895		int cpu;
  3896	
  3897		for_each_possible_cpu(cpu) {
> 3898			struct scx_kick_syncs **ksyncs = per_cpu_ptr(&scx_kick_syncs, cpu);
  3899			struct scx_kick_syncs *to_free;
  3900	
  3901			to_free = rcu_replace_pointer(*ksyncs, NULL, true);
  3902			if (to_free)
  3903				call_rcu(&to_free->rcu, free_kick_syncs_rcu);
  3904		}
  3905	}
  3906	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
