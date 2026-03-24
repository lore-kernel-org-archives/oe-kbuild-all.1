Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091C33A3810
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 04:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774325280; cv=none; b=O4D+WEYerz+qvm4USd1PXj9LSCW3IQHKqlO9VyR6gc6m2aIYrYM3zYIAYcdcB/0no81oIti4VICRkPmrk5LabtuSI6sGJSOIT5bMcUBYroB7IoIzmPXEJAndyhKJ/iMNnRQMEU+uVmwsPMxrt68/kkmdQH8dVUFOmVlpv2L6Ywg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774325280; c=relaxed/simple;
	bh=ZxwP0MrVph+E3CcWuL8OLj8MnOwuGjcItcXwtVYboG4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bailnzN4FBV6W7oZngRBDTUcizEc56zcVhKVSzZ4tPLoXBWB0nLtkcJOwBPfUxN6cKiG1lIZbxhlYWL76K8h/y+iArTbpFjvRbkIZZOOPWbuqR9zEvPdcHayZxtJPJOlr5vIajqL1GUJea9o5pcGBi6m+p49zoUVLBGeH39IcRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRWm1XNK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRWm1XNK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774325278; x=1805861278;
  h=date:from:to:cc:subject:message-id;
  bh=ZxwP0MrVph+E3CcWuL8OLj8MnOwuGjcItcXwtVYboG4=;
  b=XRWm1XNKGS0at7j6s3Q/EKLgWVO9uy2mqKUcpMFXg/9c16qY2pUt8PaM
   aqN1wXgDsHk2ij4KbTRchkecvjfZD7ldZtNr2ydAk8UMAeLprH2VIHojw
   hn/XPhCz+UZHqQyJQLrTXcglOkNu/xeE0mOEvxRsYdovoc9jhwcw4zO9V
   RKNosAWWysDGZeYyxp7IV3PPcLNEhKhKa1oHNObwMmcCkk31GbHlzJRgB
   4kM3o5W0oCKf4HXd64flksOPqYOdQiueVzeS47XbB7uPGmJT15qEeNV+K
   ynf5thWbSguOCRfFjnFb8JYxorW0R7CEj0bJtwIFAgPqXiq0/OfJnWHuJ
   Q==;
X-CSE-ConnectionGUID: WNxNNZ2vQ1CLoU0zoZR41A==
X-CSE-MsgGUID: zu6qzsTxS8qxrcgZCozYTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75525715"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75525715"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 21:07:58 -0700
X-CSE-ConnectionGUID: CAfnw1DQQ+2pD/UOfenZDQ==
X-CSE-MsgGUID: ZddBwP1aTZm2HKSMCQHDbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224453235"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Mar 2026 21:07:55 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4t3U-000000003lj-19kJ;
	Tue, 24 Mar 2026 04:07:48 +0000
Date: Tue, 24 Mar 2026 12:06:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 5/5]
 kernel/sched/core.c:6878:56: sparse: sparse: incorrect type in argument 3
 (different address spaces)
Message-ID: <202603241106.Gsk66gBT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   487e818b8c0f11de2d03896c8cb09695003a2f59
commit: e4239ea599c633d8a2bc0440ffd64f96a7bfac1c [5/5] ANDROID: sched: Handle blocked-waiter migration (and return migration)
config: i386-randconfig-r111-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241106.Gsk66gBT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241106.Gsk66gBT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241106.Gsk66gBT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:3983:31: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3983:31: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:3983:31: sparse:     got struct rq *
   kernel/sched/core.c:3999:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3999:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:3999:25: sparse:     got struct rq *
   kernel/sched/core.c:4009:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4009:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4009:25: sparse:     got struct rq *
   kernel/sched/core.c:4014:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:4014:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:4014:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:4127:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4127:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4127:25: sparse:     got struct rq *
   kernel/sched/core.c:4468:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4468:45: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4468:45: sparse:     got struct rq *
   kernel/sched/core.c:4587:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4587:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4587:25: sparse:     got struct rq *
   kernel/sched/core.c:4593:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4593:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4593:13: sparse:     got struct rq *
   kernel/sched/core.c:4593:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4593:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4593:13: sparse:     got struct rq *
   kernel/sched/core.c:4593:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4593:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4593:13: sparse:     got struct rq *
   kernel/sched/core.c:4593:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4593:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4593:13: sparse:     got struct rq *
   kernel/sched/core.c:4593:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4593:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4593:13: sparse:     got struct rq *
   kernel/sched/core.c:4593:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4593:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4593:13: sparse:     got struct rq *
   kernel/sched/core.c:4593:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4593:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4593:13: sparse:     got struct rq *
   kernel/sched/core.c:4593:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4593:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4593:13: sparse:     got struct rq *
   kernel/sched/core.c:4593:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4593:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4593:13: sparse:     got struct rq *
   kernel/sched/core.c:4593:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4593:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4593:13: sparse:     got struct rq *
   kernel/sched/core.c:4593:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4593:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4593:13: sparse:     got struct rq *
   kernel/sched/core.c:4593:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4593:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4593:13: sparse:     got struct rq *
   kernel/sched/core.c:4593:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4593:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4593:13: sparse:     got struct rq *
   kernel/sched/core.c:4593:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4593:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4593:13: sparse:     got struct rq *
   kernel/sched/core.c:8523:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:8523:43: sparse:     expected struct task_struct *push_task
   kernel/sched/core.c:8523:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:8536:42: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8536:42: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8536:42: sparse:     got struct rq *
   kernel/sched/core.c:5400:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5400:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5400:25: sparse:     got struct rq *
   kernel/sched/core.c:5585:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5585:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5585:24: sparse:     got struct rq *
   kernel/sched/core.c:5605:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5605:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5605:16: sparse:     got struct rq *
   kernel/sched/core.c:5611:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5611:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5611:16: sparse:     got struct rq *
   kernel/sched/core.c:5620:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5620:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5620:24: sparse:     got struct rq *
   kernel/sched/core.c:5634:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5634:29: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5634:29: sparse:     got struct rq *
   kernel/sched/core.c:5832:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5832:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5832:25: sparse:     got struct rq *
   kernel/sched/core.c:5845:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:5845:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:5845:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6857:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6857:21: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6857:21: sparse:     got struct rq *
   kernel/sched/core.c:6878:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:6878:45: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6878:45: sparse:     got struct task_struct [noderef] __rcu *donor
>> kernel/sched/core.c:6878:56: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *next @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6878:56: sparse:     expected struct task_struct *next
   kernel/sched/core.c:6878:56: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6879:29: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:6879:29: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6879:29: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6880:28: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *t @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6880:28: sparse:     expected struct task_struct *t
   kernel/sched/core.c:6880:28: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6881:29: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *next @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6881:29: sparse:     expected struct task_struct *next
   kernel/sched/core.c:6881:29: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6883:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6883:9: sparse:    struct task_struct *
   kernel/sched/core.c:6883:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7202:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:7202:14: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:7202:14: sparse:     got struct rq *
   kernel/sched/core.c:7203:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:7203:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:7203:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7261:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:7261:37: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:7261:37: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7772:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7772:17: sparse:    struct task_struct *
   kernel/sched/core.c:7772:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:8320:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8320:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8320:25: sparse:     got struct rq *
   kernel/sched/core.c:8478:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8478:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8478:9: sparse:     got struct rq *
   kernel/sched/core.c:8491:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8491:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8491:25: sparse:     got struct rq *
   kernel/sched/core.c:8500:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8500:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8500:13: sparse:     got struct rq *
   kernel/sched/core.c:8586:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8586:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8586:25: sparse:     got struct rq *
   kernel/sched/core.c:8607:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8607:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8607:25: sparse:     got struct rq *
   kernel/sched/core.c:8753:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8753:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8753:25: sparse:     got struct rq *
   kernel/sched/core.c:8791:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8791:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8791:25: sparse:     got struct rq *
   kernel/sched/core.c:8854:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8854:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8854:25: sparse:     got struct rq *
   kernel/sched/core.c:8926:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8926:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8926:25: sparse:     got struct rq *
   kernel/sched/core.c:9081:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:9081:22: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:9081:22: sparse:     got struct rq *
   kernel/sched/core.c:10678:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:10678:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:10678:25: sparse:     got struct rq *
   kernel/sched/core.c:10678:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10678:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10678:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:628:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:654:6: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:678:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1767:9: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/sched.h:1767:9: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:106:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:106:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:106:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2289:35: sparse: sparse: context imbalance in 'wait_task_inactive' - different lock contexts for basic block
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2491:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2491:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2491:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2281:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct *
   kernel/sched/core.c:2171:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2171:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2171:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2281:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2491:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2491:9: sparse:    struct task_struct [noderef] __rcu *

vim +6878 kernel/sched/core.c

  6837	
  6838	#ifdef CONFIG_SMP
  6839	/*
  6840	 * If the blocked-on relationship crosses CPUs, migrate @p to the
  6841	 * owner's CPU.
  6842	 *
  6843	 * This is because we must respect the CPU affinity of execution
  6844	 * contexts (owner) but we can ignore affinity for scheduling
  6845	 * contexts (@p). So we have to move scheduling contexts towards
  6846	 * potential execution contexts.
  6847	 *
  6848	 * Note: The owner can disappear, but simply migrate to @target_cpu
  6849	 * and leave that CPU to sort things out.
  6850	 */
  6851	static void proxy_migrate_task(struct rq *rq, struct rq_flags *rf,
  6852				       struct task_struct *p, int target_cpu)
  6853	{
  6854		struct rq *target_rq;
  6855	
  6856		lockdep_assert_rq_held(rq);
  6857		target_rq = cpu_rq(target_cpu);
  6858	
  6859		/*
  6860		 * Since we're going to drop @rq, we have to put(@rq->donor) first,
  6861		 * otherwise we have a reference that no longer belongs to us.
  6862		 *
  6863		 * Additionally, as we put_prev_task(prev) earlier, its possible that
  6864		 * prev will migrate away as soon as we drop the rq lock, however we
  6865		 * still have it marked as rq->curr, as we've not yet switched tasks.
  6866		 *
  6867		 * After the migration, we are going to pick_again in the __schedule
  6868		 * logic, so backtrack a bit before we release the lock:
  6869		 * Put rq->donor, and set rq->curr as rq->donor and set_next_task,
  6870		 * so that we're close to the situation we had entering __schedule
  6871		 * the first time.
  6872		 *
  6873		 * Then when we re-aquire the lock, we will re-put rq->curr then
  6874		 * rq_set_donor(rq->idle) and set_next_task(rq->idle), before
  6875		 * picking again.
  6876		 */
  6877		/* XXX - Added to address problems with changed dl_server semantics - double check */
> 6878		__put_prev_set_next_dl_server(rq, rq->donor, rq->curr);
  6879		put_prev_task(rq, rq->donor);
  6880		rq_set_donor(rq, rq->curr);
  6881		set_next_task(rq, rq->curr);
  6882	
  6883		WARN_ON(p == rq->curr);
  6884	
  6885		deactivate_task(rq, p, 0);
  6886		proxy_set_task_cpu(p, target_cpu);
  6887	
  6888		zap_balance_callbacks(rq);
  6889		rq_unpin_lock(rq, rf);
  6890		raw_spin_rq_unlock(rq);
  6891		raw_spin_rq_lock(target_rq);
  6892	
  6893		activate_task(target_rq, p, 0);
  6894		wakeup_preempt(target_rq, p, 0);
  6895	
  6896		raw_spin_rq_unlock(target_rq);
  6897		raw_spin_rq_lock(rq);
  6898		rq_repin_lock(rq, rf);
  6899	
  6900		/*
  6901		 * Ok, now we have the lock again, put rq->curr and
  6902		 * set_next_task() to idle
  6903		 */
  6904		proxy_resched_idle(rq);
  6905	}
  6906	#else /* !CONFIG_SMP */
  6907	static inline
  6908	void proxy_migrate_task(struct rq *rq, struct rq_flags *rf,
  6909				struct task_struct *p, int target_cpu)
  6910	{
  6911	}
  6912	#endif /* CONFIG_SMP */
  6913	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
