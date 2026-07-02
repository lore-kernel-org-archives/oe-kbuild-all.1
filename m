Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F354F4C6F08
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 14:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783001951; cv=none; b=apxAQf0KjsO3XPx+Nn811zeQupx5vSbxljrARoszuqb0pxl1yP4ECjCxF+DJwNa8TWNNGwyauQgq9k+V433Aon/6c3SVqndKWb2de7ZhERdv7vouCvqo8w0WWELtri3veDxlBda/J4VSIyBUWhi0UusTadj19GSwFZbi55cDJ2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783001951; c=relaxed/simple;
	bh=S0aoO2aeJ0R1OodO7GDCBxUoLr++87iSK1I1gU/jKxs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CXi3HHmwOKkgwD3ySUUVxyt/Vg7zVQNQlusO/BMogbLRF3zlaECsM5lGqR9nB1ndxXoGSw4vsjhTkFyk5MhhEMQuUiPKeapzTDPk0Te0GODhK6ekhcYRmT5KsQ00iKBvav0uvMPReivOVJAnlI3C9H6X5Qir42TvI/ROp258EOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aflrU7DQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aflrU7DQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783001949; x=1814537949;
  h=date:from:to:cc:subject:message-id;
  bh=S0aoO2aeJ0R1OodO7GDCBxUoLr++87iSK1I1gU/jKxs=;
  b=aflrU7DQRSFC8N1dbc1dHyJqmZbncs5EA1YqAJcC+mxA0Mm8Dsq3Rcj9
   XXE1Bkr+1ucDA6rSoTWfj/tyeoHbXJFh0kvDxygmRVABEGQuCUKmRy/n3
   u9UVJU1napI4xoBFF5diJOhFHfbAsYIE+d4ZtoOeqalQ6zS+guHcDN7wa
   Ri1KJSmBFl1NgkRcEbXMduo8tmtWX7S98HnoDSXyVIanmPrE7aOp34w3t
   AGT4ntZkf4bViWtiZ+AEEnWD17uBbdcQ/yFtLnbjw/Ww9OxfXqIFD8WHo
   YZUDWDLeQIHaS6joT3hBLTSOJFE+iO9SDk3cL7xMxIZHVTMAHwQKfiLHL
   Q==;
X-CSE-ConnectionGUID: ayq/zHKET4mK7TXxMMFaIA==
X-CSE-MsgGUID: odkO2Pl8RZyOHVP1cyYFoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94412170"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="94412170"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 07:19:07 -0700
X-CSE-ConnectionGUID: Xo6C5sIcQHyOEo8sf9WbCQ==
X-CSE-MsgGUID: rcmNHlWST/uAPZaAitGaGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="256462688"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Jul 2026 07:19:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfIFq-00000000Aqf-3MEN;
	Thu, 02 Jul 2026 14:19:02 +0000
Date: Thu, 02 Jul 2026 22:18:11 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrea Righi <arighi@nvidia.com>
Subject: kernel/sched/ext/ext.c:5803:50: sparse: sparse: incorrect
 type in initializer (different address spaces)
Message-ID: <202607022235.IeMjcmO2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a50a141f05a8d1737661b19ee22ff8455b94409
commit: bba2c3615bd6cfee7456d1130f2e6b01b3f4e9ba sched_ext: Move sources under kernel/sched/ext/
date:   10 days ago
config: powerpc64-randconfig-r113-20260702 (https://download.01.org/0day-ci/archive/20260702/202607022235.IeMjcmO2-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607022235.IeMjcmO2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bba2c3615bd6 ("sched_ext: Move sources under kernel/sched/ext/")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607022235.IeMjcmO2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/deadline.c:3151:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3161:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3161:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:3161:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3267:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3267:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:3267:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2744:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2744:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2744:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2754:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2754:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2754:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1188:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1188:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1188:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1188:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1188:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1188:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1286:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1286:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1286:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1815:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1815:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1815:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1815:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1815:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1815:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2130:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2130:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2130:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2973:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2973:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2973:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2618:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2618:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2618:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2619:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2619:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2619:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2693:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2693:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2693:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2713:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2713:35: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2713:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3312:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:3312:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:3312:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:3314:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:3314:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:3314:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3316:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:3316:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:3316:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3578:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3578:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3578:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3631:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/ext.c:1451:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:1622:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:1622:48: sparse:    struct task_struct *
   kernel/sched/ext/ext.c:1622:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext/ext.c:1771:66: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:1771:66: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext/ext.c:1771:66: sparse:    struct task_struct *
   kernel/sched/ext/ext.c:2315:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:2315:35: sparse:     expected struct task_struct *p
   kernel/sched/ext/ext.c:2315:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext/ext.c:2326:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:2326:38: sparse:     expected struct task_struct *from
   kernel/sched/ext/ext.c:2326:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext/ext.c:3000:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:3000:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:3000:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:3136:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:3136:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:3136:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:3278:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:3278:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext/ext.c:3278:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext/ext.c:3509:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:3509:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:3509:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:3917:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:3917:41: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:3917:41: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:5757:14: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:5757:14: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:5757:14: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:5762:18: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:5762:18: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:5762:18: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:5763:19: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:5763:19: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:5763:19: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:5764:20: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:5764:20: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:5764:20: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
>> kernel/sched/ext/ext.c:5803:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext/ext.c:5803:50: sparse:     expected struct scx_kick_syncs **ksyncs
   kernel/sched/ext/ext.c:5803:50: sparse:     got struct scx_kick_syncs [noderef] __rcu **
   kernel/sched/ext/ext.c:5806:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:5806:27: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext/ext.c:5806:27: sparse:    struct scx_kick_syncs *
   kernel/sched/ext/ext.c:5806:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:5806:27: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext/ext.c:5806:27: sparse:    struct scx_kick_syncs *
   kernel/sched/ext/ext.c:6626:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:6627:51: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:6784:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext/ext.c:6787:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:6787:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext/ext.c:6787:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext/ext.c:6789:30: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:6789:30: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:6789:30: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:6796:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:6796:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext/ext.c:6796:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext/ext.c:6814:17: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:6814:17: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:6814:17: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:6857:15: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:6857:15: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:6857:15: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:6873:22: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:6873:22: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:6873:22: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:8379:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:8379:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext/ext.c:8379:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext/ext.c:9314:15: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:9314:15: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:9314:15: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/ext.c:9751:18: sparse: sparse: symbol 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10196:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:10196:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext/ext.c:10196:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/cid.c:53:22: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/cid.c:53:22: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/cid.c:53:22: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/cid.c:54:22: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/cid.c:54:22: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/cid.c:54:22: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/cid.c:55:20: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/cid.c:55:20: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/ext/cid.c:55:20: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'

vim +5803 kernel/sched/ext/ext.c

f0e1a0643a59bf kernel/sched/ext.c Tejun Heo 2024-06-18  5797  
987e00035c0e68 kernel/sched/ext.c Tejun Heo 2025-10-22  5798  static void free_kick_syncs(void)
14c1da3895a116 kernel/sched/ext.c Tejun Heo 2025-10-08  5799  {
14c1da3895a116 kernel/sched/ext.c Tejun Heo 2025-10-08  5800  	int cpu;
14c1da3895a116 kernel/sched/ext.c Tejun Heo 2025-10-08  5801  
14c1da3895a116 kernel/sched/ext.c Tejun Heo 2025-10-08  5802  	for_each_possible_cpu(cpu) {
987e00035c0e68 kernel/sched/ext.c Tejun Heo 2025-10-22 @5803  		struct scx_kick_syncs **ksyncs = per_cpu_ptr(&scx_kick_syncs, cpu);
987e00035c0e68 kernel/sched/ext.c Tejun Heo 2025-10-22  5804  		struct scx_kick_syncs *to_free;
14c1da3895a116 kernel/sched/ext.c Tejun Heo 2025-10-08  5805  
987e00035c0e68 kernel/sched/ext.c Tejun Heo 2025-10-22  5806  		to_free = rcu_replace_pointer(*ksyncs, NULL, true);
14c1da3895a116 kernel/sched/ext.c Tejun Heo 2025-10-08  5807  		if (to_free)
348d3c587ac6fa kernel/sched/ext.c Zqiang    2025-11-17  5808  			kvfree_rcu(to_free, rcu);
14c1da3895a116 kernel/sched/ext.c Tejun Heo 2025-10-08  5809  	}
14c1da3895a116 kernel/sched/ext.c Tejun Heo 2025-10-08  5810  }
14c1da3895a116 kernel/sched/ext.c Tejun Heo 2025-10-08  5811  

:::::: The code at line 5803 was first introduced by commit
:::::: 987e00035c0e68bc0d44dec811cc9c26310b5bff sched_ext: Rename pnt_seq to kick_sync

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
