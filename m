Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999AA3A542D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 May 2026 10:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777892382; cv=none; b=q4SOsXav5isJHP4ZnZPd9M2MrwZ43D8rjfe+9SXShJdnJLjlpkStyfUys6VRJdUSpgCH86fMpWZuWqlntkY72kcwQDoxmMN3napFu9Is4FeHGNJFzDo/DsbxX+7d60l9VuAV6ip+GUcSK3EREjbVbUvv4YJQ2iylRVaoyA1cTbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777892382; c=relaxed/simple;
	bh=+aOSE/HCB7/4ckK4LfQVWRv598z9kt0tR4/7uWlfqP0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cg5lG3xGjZ9LYQrtnNdeBCX9HRbhRIn7ZNdEL88mRLf41wz53fukN1DwcS1peQtbbxZyVDItMHfyonBIujsKfUJ+EyP0K/JQ03P11k8jhbLbFInw6dDUaTVFYhHT97aTVMFPdBQJ2HRZ4vVX4nOAJnd2ZYynqZuM7Ox9J+DvbzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSQPxU6U; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSQPxU6U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777892381; x=1809428381;
  h=date:from:to:cc:subject:message-id;
  bh=+aOSE/HCB7/4ckK4LfQVWRv598z9kt0tR4/7uWlfqP0=;
  b=YSQPxU6Uz6j7hoWcCZA0jAk0krYZSM6ozHqcmCJgFDKz0NDmAmy8/4oA
   twr6c0hJMaIOmjABbvptnCgbRTcpdtzMQDXZFZY4hGsapcPCfpqL9nlfP
   4SPh+z5eF830eM0pOdXjLVaGlyliBkCoCsY3k1AJSdig5WhZkSxJ43Wl4
   tYKW/s76GLk+7FT/mtuXy4CimXXTAw50yOirOmU7FMAHEAY5yqYmUItNT
   TmjBYnmEd4oZ0hrmnLRKFWm4Ks7wpFiNDldZKtpghJs1zEfcIl508vIQq
   aVTSvovVnRQV+YaRYCmOD/qX9EtIehqGPkruQFYyBJ8nbbcAznux0F8XB
   w==;
X-CSE-ConnectionGUID: ZnkiBzKkQtuPjZPxYcD+tw==
X-CSE-MsgGUID: j+QHFr1zRt2w5SJfPuj97w==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="90205534"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="90205534"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 03:59:41 -0700
X-CSE-ConnectionGUID: jxy4a2vvRJOkPKkm+5mbKA==
X-CSE-MsgGUID: xhZaAxrxSuii0/drYuJq5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="235542336"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 May 2026 03:59:38 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJr1M-000000003gv-3gz2;
	Mon, 04 May 2026 10:59:30 +0000
Date: Mon, 04 May 2026 18:58:29 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrea Righi <arighi@nvidia.com>
Subject: kernel/sched/ext.c:4349:13: sparse: sparse: incorrect type
 in assignment (different address spaces)
Message-ID: <202605041857.k9Gr1VQC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6d35786de28116ecf78797a62b84e6bf3c45aa5a
commit: 80afd4c84bc8f5e80145ce35279f5ce53f6043db sched_ext: Read scx_root under scx_cgroup_ops_rwsem in cgroup setters
date:   9 days ago
config: arm64-randconfig-r113-20260503 (https://download.01.org/0day-ci/archive/20260504/202605041857.k9Gr1VQC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605041857.k9Gr1VQC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 80afd4c84bc8 ("sched_ext: Read scx_root under scx_cgroup_ops_rwsem in cgroup setters")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605041857.k9Gr1VQC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/deadline.c:2947:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3053:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3053:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:3053:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2540:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2540:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2540:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2550:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2550:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2550:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1188:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1188:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1188:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1188:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1188:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1188:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1286:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1286:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1286:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1810:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1810:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1810:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1810:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1810:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1810:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1938:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1938:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1938:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2759:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2759:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2759:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2420:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2420:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2420:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2421:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2421:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2421:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2495:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2495:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2495:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3098:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:3098:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:3098:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:3100:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:3100:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:3100:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3102:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:3102:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:3102:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3355:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3355:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3355:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3408:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext.c:1274:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1408:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1408:48: sparse:    struct task_struct *
   kernel/sched/ext.c:1408:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:1558:66: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1558:66: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:1558:66: sparse:    struct task_struct *
   kernel/sched/ext.c:2089:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext.c:2089:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:2089:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext.c:2100:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext.c:2100:38: sparse:     expected struct task_struct *from
   kernel/sched/ext.c:2100:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext.c:2772:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2772:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2772:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:2908:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2908:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2908:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:3050:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:3050:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:3050:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:3279:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3279:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3279:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:3705:62: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/ext.c:3705:62: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3705:62: sparse:     got struct scx_sched [noderef] __rcu *scx_sched
   kernel/sched/ext.c:4187:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:4187:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:4187:35: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:4220:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:4220:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4220:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:4249:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:4249:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4249:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:4261:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:4261:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4261:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:4309:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:4309:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4309:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:4328:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:4328:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4328:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
>> kernel/sched/ext.c:4349:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:4349:13: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4349:13: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:4365:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:4365:13: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4365:13: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:4382:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:4382:13: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4382:13: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:5488:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext.c:5488:50: sparse:     expected struct scx_kick_syncs **ksyncs
   kernel/sched/ext.c:5488:50: sparse:     got struct scx_kick_syncs [noderef] __rcu **
   kernel/sched/ext.c:5491:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:5491:27: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:5491:27: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:5491:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:5491:27: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:5491:27: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:6297:65: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:6297:65: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:6297:65: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:6298:57: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:6298:57: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:6298:57: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:6380:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext.c:6380:50: sparse:     expected struct scx_kick_syncs **ksyncs
   kernel/sched/ext.c:6380:50: sparse:     got struct scx_kick_syncs [noderef] __rcu **
   kernel/sched/ext.c:6383:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:6383:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:6383:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:6392:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:6392:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:6392:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:6904:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *parent @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/ext.c:6904:40: sparse:     expected struct scx_sched *parent
   kernel/sched/ext.c:6904:40: sparse:     got struct scx_sched [noderef] __rcu *scx_sched
   kernel/sched/ext.c:7192:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/ext.c:7192:38: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:7192:38: sparse:     got struct scx_sched [noderef] __rcu *scx_sched
   kernel/sched/ext.c:7611:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:7611:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:7611:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:8960:18: sparse: sparse: symbol 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
   kernel/sched/ext.c:9288:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:9288:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:9288:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext_idle.c:755:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext_idle.c:775:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@

vim +4349 kernel/sched/ext.c

  4343	
  4344	void scx_group_set_weight(struct task_group *tg, unsigned long weight)
  4345	{
  4346		struct scx_sched *sch;
  4347	
  4348		percpu_down_read(&scx_cgroup_ops_rwsem);
> 4349		sch = scx_root;
  4350	
  4351		if (scx_cgroup_enabled && SCX_HAS_OP(sch, cgroup_set_weight) &&
  4352		    tg->scx.weight != weight)
  4353			SCX_CALL_OP(sch, cgroup_set_weight, NULL, tg_cgrp(tg), weight);
  4354	
  4355		tg->scx.weight = weight;
  4356	
  4357		percpu_up_read(&scx_cgroup_ops_rwsem);
  4358	}
  4359	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
