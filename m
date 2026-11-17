Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921224;
	b=E70rQq/dbOzYZ/rh78x9G6r5ET6er63eOMjTxn59zl0s+i8fPkHQsWEQTG4hcpYHWlLY
	 88PfdUddWjDTqjmPlA3GHRPqIrvhzQO/TsYQ+S5lH+vqgb9uc+oSosNWCUYYMIy0E7375
	 SnPx5ks8daxqDG+wirHe9vrI5RvYCGclZyPIbEe9w58U87xCqOm6Ar32PgpqrvdYCHHzG
	 I4P4dFCfWqgmKoOok7SXX8mLJKVq4JOwCFDUyq5rXKWqUdOvYY1VY6rb9VqU/waRQOYy9
	 1O6+iydJjrC32j5/6DUHw1Mv8VL5W3yW0RGYfoS0+A+6iimte1gpPEVTDHpNZsifeGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921224;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fR610oslRwReyCJAGeAHAMGBK3HkB+YOlAi4TT6Ufk8=;
	b=UYAJGD1Txzuuaxu65hgEhDiSQDo/927KH5CJgm6PF3NlQlVCLl6az7UxGivlWhTYTP0v
	 1GEdUPRz27/dFJbpkj/EJ1iuhci2Jfz6fRlRsBv8d8B6hgEkkwwiAWjHOsskOMoWEo3O5
	 Q2dN3qxZic3cTpwunKRhKCC0KvW1Zn8lOBrndPXp9il8wmbJ8LMwLGv7eEFWFw65cPl26
	 fzoOghOeru23tCEWPdkZ5jit5OCTlv8AEIWfaqj0v6XgDtwKiFF3f9Qr9pNtkemLJMOfl
	 GuUK+u+5ssoboe50uRx6/erT9ODb6F2jxfsVJDpbWx5Yq0Z9/FrgH0bpIa66rCayALw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JWtBGwjY;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7DC606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 13:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E7DC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JWtBGwjY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794921224; x=1826457224;
  h=date:from:to:cc:subject:message-id;
  bh=mi76xKZ7iYIhh7cjZuSwRRNtPxEjs4Ha9qWVvO/Kc2Q=;
  b=JWtBGwjYxPWJ32JTUrpLy3KQ4oniaNdQRB+zoCiPkTqhGgj1F7NeRzxE
   MoZNma4Q4s9lZjVW0xQrbJzJ0meZ2KC4LaCdOE5pmfVcuvslHRhuRhYRb
   78hO+ZSMGT0iSIC1VZyciVidUgKN7S83zlgwRYNbGCWs2Xgp2f7TltDia
   0eOauqjFtm6NdgiCbUI1kn3OWN39tW0G+fT7sh7Wuex+7OdBJ/uemDn7j
   2A5BkH/ALljjbQFaWLGSynecnVzwELugpruCAnuuLZez1FKtB+6oJTaot
   8y28evU/5YsC6Mydj5ntVoVOgH/OGEktVxA1YhgD2zSGLPT+yFY5B8/NF
   w==;
X-CSE-ConnectionGUID: c86yf++rSnabuFI2PhNZ5w==
X-CSE-MsgGUID: 0Fm4QtXGTu2X49AkTTh3EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3712628"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3712628"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 05:11:52 -0800
X-CSE-ConnectionGUID: DHCuf2bURFy7lpeCdOQ+2Q==
X-CSE-MsgGUID: mfP9/R4eT02aiZ72cvKZZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10193326"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 17 Nov 2026 05:11:50 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTIyS-0000000037O-1EQi;
	Tue, 17 Nov 2026 13:11:48 +0000
Date: Tue, 17 Nov 2026 14:10:59 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android18-7.3 12/12]
 kernel/sched/core.c:9042:32: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <20261117140404.dK3eHAKM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android18-7.3
head:   e6f867e5fafd3e1ed5cde549c80bebe309105f22
commit: a8a8087e465a4a6370c96cec61c4da0e868abb64 [12/12] Merge 2cbf335f8ccc ("Merge tag 'sched-core-2026-06-14' of gitolite.kernel.org:pub/scm/linux/kernel/git/tip/tip") into android-mainline
config: arm-randconfig-r2300-20261117 (https://download.01.org/0day-ci/archive/20261117/20261117140404.dK3eHAKM-lkp@intel.com/config)
compiler: clang version 21.1.6 (https://github.com/llvm/llvm-project a832a5222e489298337fbb5876f8dcaf072c5cca)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117140404.dK3eHAKM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261117140404.dK3eHAKM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:4036:25: sparse:     got struct rq *
   kernel/sched/core.c:4041:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:4041:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:4041:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:4147:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4147:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4147:25: sparse:     got struct rq *
   kernel/sched/core.c:4480:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4480:45: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4480:45: sparse:     got struct rq *
   kernel/sched/core.c:4605:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4605:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4605:25: sparse:     got struct rq *
   kernel/sched/core.c:4611:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4611:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4611:13: sparse:     got struct rq *
   kernel/sched/core.c:4611:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4611:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4611:13: sparse:     got struct rq *
   kernel/sched/core.c:4611:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4611:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4611:13: sparse:     got struct rq *
   kernel/sched/core.c:4611:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4611:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4611:13: sparse:     got struct rq *
   kernel/sched/core.c:4611:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4611:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4611:13: sparse:     got struct rq *
   kernel/sched/core.c:4611:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4611:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4611:13: sparse:     got struct rq *
   kernel/sched/core.c:4611:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4611:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4611:13: sparse:     got struct rq *
   kernel/sched/core.c:4611:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4611:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4611:13: sparse:     got struct rq *
   kernel/sched/core.c:4611:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4611:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4611:13: sparse:     got struct rq *
   kernel/sched/core.c:4611:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4611:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4611:13: sparse:     got struct rq *
   kernel/sched/core.c:4611:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4611:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4611:13: sparse:     got struct rq *
   kernel/sched/core.c:4611:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4611:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4611:13: sparse:     got struct rq *
   kernel/sched/core.c:4611:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4611:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4611:13: sparse:     got struct rq *
   kernel/sched/core.c:5617:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5617:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5617:24: sparse:     got struct rq *
   kernel/sched/core.c:5637:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5637:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5637:16: sparse:     got struct rq *
   kernel/sched/core.c:5643:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5643:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5643:16: sparse:     got struct rq *
   kernel/sched/core.c:5652:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5652:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5652:24: sparse:     got struct rq *
   kernel/sched/core.c:5666:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5666:29: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5666:29: sparse:     got struct rq *
   kernel/sched/core.c:5860:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5860:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5860:25: sparse:     got struct rq *
   kernel/sched/core.c:5873:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:5873:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:5873:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7180:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:7180:14: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:7180:14: sparse:     got struct rq *
   kernel/sched/core.c:7181:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:7181:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:7181:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7252:52: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev_donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:7252:52: sparse:     expected struct task_struct *prev_donor
   kernel/sched/core.c:7252:52: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7267:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7267:31: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7267:31: sparse:    struct task_struct *
   kernel/sched/core.c:7781:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7781:17: sparse:    struct task_struct *
   kernel/sched/core.c:7781:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:8361:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8361:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8361:25: sparse:     got struct rq *
   kernel/sched/core.c:8767:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8767:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8767:25: sparse:     got struct rq *
   kernel/sched/core.c:8805:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8805:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8805:25: sparse:     got struct rq *
   kernel/sched/core.c:8866:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8866:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8866:25: sparse:     got struct rq *
>> kernel/sched/core.c:9042:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cfs_rq [noderef] __percpu *extern [addressable] [toplevel] cfs_rq @@     got struct cfs_rq * @@
   kernel/sched/core.c:9042:32: sparse:     expected struct cfs_rq [noderef] __percpu *extern [addressable] [toplevel] cfs_rq
   kernel/sched/core.c:9042:32: sparse:     got struct cfs_rq *
   kernel/sched/core.c:9080:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:9080:22: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:9080:22: sparse:     got struct rq *
   kernel/sched/core.c:10738:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:10738:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:10738:25: sparse:     got struct rq *
   kernel/sched/core.c:10738:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10738:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10738:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:11331:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:11331:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:11331:25: sparse:     got struct rq *
   kernel/sched/core.c:11378:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:11378:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:11378:25: sparse:     got struct rq *
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:109:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:109:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:109:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2479:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2479:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2479:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2468:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2468:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2468:25: sparse:    struct task_struct *
   kernel/sched/core.c:2316:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2316:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2316:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2479:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2479:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2479:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2781:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2781:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2781:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2781:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2781:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2781:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2479:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2479:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2479:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2758:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2758:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2758:9: sparse:    struct task_struct *

vim +9042 kernel/sched/core.c

c3a340f7e7eada kernel/sched/core.c Steven Rostedt (VMware  2019-12-19  9038) 
5822a454d6d222 kernel/sched/core.c Ingo Molnar             2017-03-05  9039  	wait_bit_init();
9dcb8b685fc308 kernel/sched/core.c Linus Torvalds          2016-10-26  9040  
434d53b00d6bb7 kernel/sched.c      Mike Travis             2008-04-04  9041  #ifdef CONFIG_FAIR_GROUP_SCHED
b8fea7af0e40fe kernel/sched/core.c Zecheng Li              2026-05-22 @9042  	root_task_group.cfs_rq = &runqueues.cfs;
eff766a65c6023 kernel/sched.c      Peter Zijlstra          2008-04-19  9043  
b1d1779e5ef7a6 kernel/sched/core.c Wei Yang                2020-04-23  9044  	root_task_group.shares = ROOT_TASK_GROUP_LOAD;
c98c18270be115 kernel/sched/core.c Phil Auld               2023-07-14  9045  	init_cfs_bandwidth(&root_task_group.cfs_bandwidth, NULL);
6d6bc0ad867c46 kernel/sched.c      Dhaval Giani            2008-05-30  9046  #endif /* CONFIG_FAIR_GROUP_SCHED */
8195136669661f kernel/sched/core.c Tejun Heo               2024-09-04  9047  #ifdef CONFIG_EXT_GROUP_SCHED
33796b91871ad4 kernel/sched/core.c Tejun Heo               2025-06-16  9048  	scx_tg_init(&root_task_group);
8195136669661f kernel/sched/core.c Tejun Heo               2024-09-04  9049  #endif /* CONFIG_EXT_GROUP_SCHED */
434d53b00d6bb7 kernel/sched.c      Mike Travis             2008-04-04  9050  #ifdef CONFIG_RT_GROUP_SCHED
b8fea7af0e40fe kernel/sched/core.c Zecheng Li              2026-05-22  9051  	ptr += 2 * nr_cpu_ids * sizeof(void **);
b8fea7af0e40fe kernel/sched/core.c Zecheng Li              2026-05-22  9052  	ptr = (unsigned long)kzalloc(ptr, GFP_NOWAIT);
07e06b011db2b3 kernel/sched.c      Yong Zhang              2011-01-07  9053  	root_task_group.rt_se = (struct sched_rt_entity **)ptr;
434d53b00d6bb7 kernel/sched.c      Mike Travis             2008-04-04  9054  	ptr += nr_cpu_ids * sizeof(void **);
434d53b00d6bb7 kernel/sched.c      Mike Travis             2008-04-04  9055  
07e06b011db2b3 kernel/sched.c      Yong Zhang              2011-01-07  9056  	root_task_group.rt_rq = (struct rt_rq **)ptr;
eff766a65c6023 kernel/sched.c      Peter Zijlstra          2008-04-19  9057  	ptr += nr_cpu_ids * sizeof(void **);
eff766a65c6023 kernel/sched.c      Peter Zijlstra          2008-04-19  9058  

:::::: The code at line 9042 was first introduced by commit
:::::: b8fea7af0e40feb6d9cbbd60b66ff0ec265e868f sched/fair: Allocate cfs_tg_state with percpu allocator

:::::: TO: Zecheng Li <zecheng@google.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
