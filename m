Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CE62D0C8F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 03:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783048873; cv=none; b=oWDRlsEVk/bS+FJCfzdA3yryzb4oN/TIP0j/FbQnJAGaBt3CsYN6idDiLqA41fwghceIyNg/OicMSmndnV4mm3zVUJHCbJl8UTINlm/Qt9SALw6IVeOSF0Busm3lvIGPQIpQQ80fQDZ/EXNUV66bfNU86t/KFv2VPD/QdVatf1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783048873; c=relaxed/simple;
	bh=QiBheeneoLQlCcM7PwSUwvDu8n47mUXj79D3/ZQ/qNE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q3xfF76iLFVMfK9P4yQwdVHeVh1L+Gp2P5ZfG93ZAAr1mMTz5X5oUq+3uCsksAIS9dJkN6S4S7GEr9oBop0q0liPv0WUxW/yTG0grrP5xVr7ljAAmQkNkMGEbhd3TsNfVHW4cvpI6reJJxa2r2DaKfIs1FLb4KhBL65wH52xwQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dhen1fQR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dhen1fQR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783048865; x=1814584865;
  h=date:from:to:cc:subject:message-id;
  bh=QiBheeneoLQlCcM7PwSUwvDu8n47mUXj79D3/ZQ/qNE=;
  b=Dhen1fQRhvOA7fwkqZLy4Fu9ATBtICIgKim13KeYZEkH8p2bsIJIR9af
   wRMZq7PiI2zFZHqAAppiLhldLWi42eJl6zdgiAItuI7oiIfCZR6iFV/3T
   FJQLm4oBHDSPvaSxqQ6jCKVLMr+c6ZBg0UEpu2EclWfAleUEJnKvgtM4o
   lHXM6jGFhsZ9aHFH/+6eh0ke5dgVN7mQ3FQ5ANI519C5qiTCiGQJYyWda
   KwWaFNf44WPdWUouC6aY0ZYPnaELS1Ww06/Nzt7OcAcDchxPdJeExVgBN
   9s2qVz3FOd8YH0w/2spjZUU2+6IUFpheY0VDefR4yP2SHU7gY1ThER51q
   w==;
X-CSE-ConnectionGUID: eGnYCZ6iTcCz/IY6KhO7/w==
X-CSE-MsgGUID: ppPWaM+aSL+6FTETOlUupw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101221515"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="101221515"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 20:21:05 -0700
X-CSE-ConnectionGUID: ngfrBqvJR4O4bb8ft689kg==
X-CSE-MsgGUID: G5CPb2/gR2OHEh2TeamfBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="276212439"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 02 Jul 2026 20:21:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfUSN-00000000Bbv-0zoF;
	Fri, 03 Jul 2026 03:20:51 +0000
Date: Fri, 03 Jul 2026 11:20:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-kminext 1/1]
 kernel/sched/rt.c:1655:45: sparse: sparse: incorrect type in argument 2
 (different address spaces)
Message-ID: <202607031125.epO7Q8C9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Tiffany,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android17-6.18-kminext
head:   005764abb0daff6b6c529f8e94989d90d8106a08
commit: a18faab7e7d04a637603ae34a4cc2376cd10b8eb [1/1] ANDROID: sched: remove SMP-related ifdefs around proxy_exec fns
config: i386-randconfig-r112-20260702 (https://download.01.org/0day-ci/archive/20260703/202607031125.epO7Q8C9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607031125.epO7Q8C9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031125.epO7Q8C9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:2488:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2488:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2488:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:985:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:985:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:985:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1525:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1525:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1525:31: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1917:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1917:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1917:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1575:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1575:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1575:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1576:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1576:15: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1576:15: sparse:     got struct task_struct [noderef] __rcu *
>> kernel/sched/rt.c:1655:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *sched_ctx @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1655:45: sparse:     expected struct task_struct *sched_ctx
   kernel/sched/rt.c:1655:45: sparse:     got struct task_struct [noderef] __rcu *donor
>> kernel/sched/rt.c:1655:56: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *exec_ctx @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1655:56: sparse:     expected struct task_struct *exec_ctx
   kernel/sched/rt.c:1655:56: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1686:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1686:35: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1686:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1712:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1712:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1712:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1731:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1731:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1731:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2167:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *sched_ctx @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2167:40: sparse:     expected struct task_struct *sched_ctx
   kernel/sched/rt.c:2167:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2167:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *exec_ctx @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2167:51: sparse:     expected struct task_struct *exec_ctx
   kernel/sched/rt.c:2167:51: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2190:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2190:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2190:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2539:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2539:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2539:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2541:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2541:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2541:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2541:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2541:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2541:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2751:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2751:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2751:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2761:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2761:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2761:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2867:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2867:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2867:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2307:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2307:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2307:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2317:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2317:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2317:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1194:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1194:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1194:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1194:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1194:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1194:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1292:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1292:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1292:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1590:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1590:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1590:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1590:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1590:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1590:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1703:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1703:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1703:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2526:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2526:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2526:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2181:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2181:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2181:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2182:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2182:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2182:15: sparse:     got struct task_struct [noderef] __rcu *
>> kernel/sched/deadline.c:2259:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *sched_ctx @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2259:43: sparse:     expected struct task_struct *sched_ctx
   kernel/sched/deadline.c:2259:43: sparse:     got struct task_struct [noderef] __rcu *donor
>> kernel/sched/deadline.c:2259:54: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *exec_ctx @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2259:54: sparse:     expected struct task_struct *exec_ctx
   kernel/sched/deadline.c:2259:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2283:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2283:35: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2283:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2912:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2912:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2912:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2914:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2914:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2914:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2916:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2916:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2916:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3110:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3110:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3110:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3156:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:210:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:210:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:210:22: sparse:    struct task_struct *
   kernel/sched/syscalls.c:1464:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/syscalls.c:1464:22: sparse:     expected struct task_struct *curr
   kernel/sched/syscalls.c:1464:22: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2310:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2310:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2310:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2310:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2310:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2310:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2310:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2509:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2509:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2509:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2509:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2509:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2509:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1316:6: sparse: sparse: context imbalance in 'sched_getaffinity' - different lock contexts for basic block
   kernel/sched/syscalls.c:1386:15: sparse: sparse: dereference of noderef expression
   kernel/sched/syscalls.c:1387:19: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1755:15: sparse: sparse: dereference of noderef expression
--
   kernel/sched/core.c:4243:29: sparse:     got struct rq *
   kernel/sched/core.c:4335:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4335:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4335:25: sparse:     got struct rq *
   kernel/sched/core.c:4383:31: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4383:31: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4383:31: sparse:     got struct rq *
   kernel/sched/core.c:4399:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4399:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4399:25: sparse:     got struct rq *
   kernel/sched/core.c:4411:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4411:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4411:25: sparse:     got struct rq *
   kernel/sched/core.c:4416:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:4416:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:4416:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:4520:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4520:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4520:25: sparse:     got struct rq *
   kernel/sched/core.c:4858:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4858:45: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4858:45: sparse:     got struct rq *
   kernel/sched/core.c:4879:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4879:34: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4879:34: sparse:     got struct rq *
   kernel/sched/core.c:4983:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4983:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4983:25: sparse:     got struct rq *
   kernel/sched/core.c:4989:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4989:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4989:13: sparse:     got struct rq *
   kernel/sched/core.c:4989:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4989:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4989:13: sparse:     got struct rq *
   kernel/sched/core.c:4989:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4989:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4989:13: sparse:     got struct rq *
   kernel/sched/core.c:4989:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4989:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4989:13: sparse:     got struct rq *
   kernel/sched/core.c:4989:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4989:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4989:13: sparse:     got struct rq *
   kernel/sched/core.c:4989:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4989:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4989:13: sparse:     got struct rq *
   kernel/sched/core.c:4989:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4989:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4989:13: sparse:     got struct rq *
   kernel/sched/core.c:4989:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4989:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4989:13: sparse:     got struct rq *
   kernel/sched/core.c:4989:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4989:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4989:13: sparse:     got struct rq *
   kernel/sched/core.c:4989:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4989:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4989:13: sparse:     got struct rq *
   kernel/sched/core.c:4989:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4989:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4989:13: sparse:     got struct rq *
   kernel/sched/core.c:4989:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4989:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4989:13: sparse:     got struct rq *
   kernel/sched/core.c:4989:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4989:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4989:13: sparse:     got struct rq *
   kernel/sched/core.c:4989:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4989:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4989:13: sparse:     got struct rq *
   kernel/sched/core.c:5781:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5781:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5781:25: sparse:     got struct rq *
   kernel/sched/core.c:5972:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5972:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5972:24: sparse:     got struct rq *
   kernel/sched/core.c:5993:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5993:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5993:16: sparse:     got struct rq *
   kernel/sched/core.c:5999:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5999:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5999:16: sparse:     got struct rq *
   kernel/sched/core.c:6008:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6008:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6008:24: sparse:     got struct rq *
   kernel/sched/core.c:6022:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6022:29: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6022:29: sparse:     got struct rq *
   kernel/sched/core.c:6212:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6212:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6212:25: sparse:     got struct rq *
   kernel/sched/core.c:6225:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:6225:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:6225:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7702:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:7702:14: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:7702:14: sparse:     got struct rq *
   kernel/sched/core.c:7703:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:7703:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:7703:14: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/core.c:7780:53: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:7780:53: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:7780:53: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7780:85: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:7780:85: sparse:     expected struct task_struct *p
   kernel/sched/core.c:7780:85: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7785:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:7785:58: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:7785:58: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7785:90: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:7785:90: sparse:     expected struct task_struct *p
   kernel/sched/core.c:7785:90: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7789:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:7789:48: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:7789:48: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7791:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:7791:45: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:7791:45: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:8302:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:8302:17: sparse:    struct task_struct *
   kernel/sched/core.c:8302:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:8901:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8901:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8901:25: sparse:     got struct rq *
   kernel/sched/core.c:9324:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:9324:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:9324:25: sparse:     got struct rq *
   kernel/sched/core.c:9362:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:9362:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:9362:25: sparse:     got struct rq *
   kernel/sched/core.c:9422:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:9422:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:9422:25: sparse:     got struct rq *
   kernel/sched/core.c:9643:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:9643:22: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:9643:22: sparse:     got struct rq *
   kernel/sched/core.c:11303:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:11303:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:11303:25: sparse:     got struct rq *
   kernel/sched/core.c:11303:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:11303:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:11303:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:715:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:741:6: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:765:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1804:9: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/sched.h:1804:9: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:117:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:117:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:117:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:970:11: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2462:35: sparse: sparse: context imbalance in 'wait_task_inactive' - different lock contexts for basic block
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2509:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2509:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2509:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2310:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct *
   kernel/sched/core.c:2344:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2344:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2344:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2532:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2532:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2532:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2532:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2532:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2532:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2509:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2509:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2509:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2509:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2509:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2509:9: sparse:    struct task_struct *

vim +1655 kernel/sched/rt.c

01603b5411396eb kernel/sched/rt.c Connor O'Brien     2022-05-10  1551  
0017d7350928441 kernel/sched_rt.c Peter Zijlstra     2010-03-24  1552  static int
3aef1551e942860 kernel/sched/rt.c Valentin Schneider 2020-11-02  1553  select_task_rq_rt(struct task_struct *p, int cpu, int flags)
e7693a362ec84bb kernel/sched_rt.c Gregory Haskins    2008-01-25  1554  {
af0c8b2bf67b257 kernel/sched/rt.c Peter Zijlstra     2024-10-09  1555  	struct task_struct *curr, *donor;
7608dec2ce2004c kernel/sched_rt.c Peter Zijlstra     2011-04-05  1556  	struct rq *rq;
0a7537e20fc27eb kernel/sched/rt.c J. Avila           2024-02-02  1557  	struct rq *this_cpu_rq;
804d402fb6f6487 kernel/sched/rt.c Qais Yousef        2019-10-09  1558  	bool test;
16330b35600f00c kernel/sched/rt.c Park Bumgyu        2020-06-22  1559  	int target_cpu = -1;
0a7537e20fc27eb kernel/sched/rt.c J. Avila           2024-02-02  1560  	bool sync = !!(flags & WF_SYNC);
0a7537e20fc27eb kernel/sched/rt.c J. Avila           2024-02-02  1561  	int this_cpu;
16330b35600f00c kernel/sched/rt.c Park Bumgyu        2020-06-22  1562  
0dd08d580104ee2 kernel/sched/rt.c Quentin Perret     2020-12-16  1563  	trace_android_rvh_select_task_rq_rt(p, cpu, flags & 0xF,
16330b35600f00c kernel/sched/rt.c Park Bumgyu        2020-06-22  1564  					flags, &target_cpu);
16330b35600f00c kernel/sched/rt.c Park Bumgyu        2020-06-22  1565  	if (target_cpu >= 0)
16330b35600f00c kernel/sched/rt.c Park Bumgyu        2020-06-22  1566  		return target_cpu;
c37495fd0f64fc1 kernel/sched_rt.c Steven Rostedt     2011-06-16  1567  
c37495fd0f64fc1 kernel/sched_rt.c Steven Rostedt     2011-06-16  1568  	/* For anything but wake ups, just return the task_cpu */
3aef1551e942860 kernel/sched/rt.c Valentin Schneider 2020-11-02  1569  	if (!(flags & (WF_TTWU | WF_FORK)))
c37495fd0f64fc1 kernel/sched_rt.c Steven Rostedt     2011-06-16  1570  		goto out;
c37495fd0f64fc1 kernel/sched_rt.c Steven Rostedt     2011-06-16  1571  
7608dec2ce2004c kernel/sched_rt.c Peter Zijlstra     2011-04-05  1572  	rq = cpu_rq(cpu);
7608dec2ce2004c kernel/sched_rt.c Peter Zijlstra     2011-04-05  1573  
7608dec2ce2004c kernel/sched_rt.c Peter Zijlstra     2011-04-05  1574  	rcu_read_lock();
316c1608d15c736 kernel/sched/rt.c Jason Low          2015-04-28 @1575  	curr = READ_ONCE(rq->curr); /* unlocked access */
af0c8b2bf67b257 kernel/sched/rt.c Peter Zijlstra     2024-10-09  1576  	donor = READ_ONCE(rq->donor);
0a7537e20fc27eb kernel/sched/rt.c J. Avila           2024-02-02  1577  	this_cpu = smp_processor_id();
0a7537e20fc27eb kernel/sched/rt.c J. Avila           2024-02-02  1578  	this_cpu_rq = cpu_rq(this_cpu);
7608dec2ce2004c kernel/sched_rt.c Peter Zijlstra     2011-04-05  1579  
318e0893ce3f524 kernel/sched_rt.c Gregory Haskins    2008-01-25  1580  	/*
65c99af98ba6f6b kernel/sched/rt.c Greg Kroah-Hartman 2022-03-31  1581  	 * If the current task on @p's runqueue is an RT task, then
e1f47d891c0f007 kernel/sched_rt.c Steven Rostedt     2008-01-25  1582  	 * try to see if we can wake this RT task up on another
e1f47d891c0f007 kernel/sched_rt.c Steven Rostedt     2008-01-25  1583  	 * runqueue. Otherwise simply start this RT task
e1f47d891c0f007 kernel/sched_rt.c Steven Rostedt     2008-01-25  1584  	 * on its current runqueue.
e1f47d891c0f007 kernel/sched_rt.c Steven Rostedt     2008-01-25  1585  	 *
43fa5460fe60dea kernel/sched_rt.c Steven Rostedt     2010-09-20  1586  	 * We want to avoid overloading runqueues. If the woken
43fa5460fe60dea kernel/sched_rt.c Steven Rostedt     2010-09-20  1587  	 * task is a higher priority, then it will stay on this CPU
43fa5460fe60dea kernel/sched_rt.c Steven Rostedt     2010-09-20  1588  	 * and the lower prio task should be moved to another CPU.
43fa5460fe60dea kernel/sched_rt.c Steven Rostedt     2010-09-20  1589  	 * Even though this will probably make the lower prio task
43fa5460fe60dea kernel/sched_rt.c Steven Rostedt     2010-09-20  1590  	 * lose its cache, we do not want to bounce a higher task
43fa5460fe60dea kernel/sched_rt.c Steven Rostedt     2010-09-20  1591  	 * around just because it gave up its CPU, perhaps for a
43fa5460fe60dea kernel/sched_rt.c Steven Rostedt     2010-09-20  1592  	 * lock?
43fa5460fe60dea kernel/sched_rt.c Steven Rostedt     2010-09-20  1593  	 *
43fa5460fe60dea kernel/sched_rt.c Steven Rostedt     2010-09-20  1594  	 * For equal prio tasks, we just let the scheduler sort it out.
7608dec2ce2004c kernel/sched_rt.c Peter Zijlstra     2011-04-05  1595  	 *
402de7fc880fef0 kernel/sched/rt.c Ingo Molnar        2024-05-27  1596  	 * Otherwise, just let it ride on the affine RQ and the
7608dec2ce2004c kernel/sched_rt.c Peter Zijlstra     2011-04-05  1597  	 * post-schedule router will push the preempted task away
7608dec2ce2004c kernel/sched_rt.c Peter Zijlstra     2011-04-05  1598  	 *
7608dec2ce2004c kernel/sched_rt.c Peter Zijlstra     2011-04-05  1599  	 * This test is optimistic, if we get it wrong the load-balancer
7608dec2ce2004c kernel/sched_rt.c Peter Zijlstra     2011-04-05  1600  	 * will have to sort it out.
804d402fb6f6487 kernel/sched/rt.c Qais Yousef        2019-10-09  1601  	 *
01603b5411396eb kernel/sched/rt.c Connor O'Brien     2022-05-10  1602  	 * We use rt_task_fits_cpu() to evaluate if the CPU is busy with
01603b5411396eb kernel/sched/rt.c Connor O'Brien     2022-05-10  1603  	 * potentially long-running softirq work, as well as take into
01603b5411396eb kernel/sched/rt.c Connor O'Brien     2022-05-10  1604  	 * account the capacity of the CPU to ensure it fits the
01603b5411396eb kernel/sched/rt.c Connor O'Brien     2022-05-10  1605  	 * requirement of the task - which is only important on
01603b5411396eb kernel/sched/rt.c Connor O'Brien     2022-05-10  1606  	 * heterogeneous systems like big.LITTLE.
318e0893ce3f524 kernel/sched_rt.c Gregory Haskins    2008-01-25  1607  	 */
65c99af98ba6f6b kernel/sched/rt.c Greg Kroah-Hartman 2022-03-31  1608  	test = curr &&
af0c8b2bf67b257 kernel/sched/rt.c Peter Zijlstra     2024-10-09  1609  	       unlikely(rt_task(donor)) &&
af0c8b2bf67b257 kernel/sched/rt.c Peter Zijlstra     2024-10-09  1610  	       (curr->nr_cpus_allowed < 2 || donor->prio <= p->prio);
804d402fb6f6487 kernel/sched/rt.c Qais Yousef        2019-10-09  1611  
0a7537e20fc27eb kernel/sched/rt.c J. Avila           2024-02-02  1612  	/*
0a7537e20fc27eb kernel/sched/rt.c J. Avila           2024-02-02  1613  	 * Respect the sync flag as long as the task can run on this CPU.
0a7537e20fc27eb kernel/sched/rt.c J. Avila           2024-02-02  1614  	 */
0a7537e20fc27eb kernel/sched/rt.c J. Avila           2024-02-02  1615  	if (should_honor_rt_sync(this_cpu_rq, p, sync) &&
0a7537e20fc27eb kernel/sched/rt.c J. Avila           2024-02-02  1616  	    cpumask_test_cpu(this_cpu, p->cpus_ptr)) {
0a7537e20fc27eb kernel/sched/rt.c J. Avila           2024-02-02  1617  		cpu = this_cpu;
0a7537e20fc27eb kernel/sched/rt.c J. Avila           2024-02-02  1618  		goto out_unlock;
0a7537e20fc27eb kernel/sched/rt.c J. Avila           2024-02-02  1619  	}
0a7537e20fc27eb kernel/sched/rt.c J. Avila           2024-02-02  1620  
01603b5411396eb kernel/sched/rt.c Connor O'Brien     2022-05-10  1621  	if (test || !rt_task_fits_cpu(p, cpu)) {
c621dead3a640a6 kernel/sched/rt.c Connor O'Brien     2023-11-08  1622  		int target = find_lowest_rq(p, p);
318e0893ce3f524 kernel/sched_rt.c Gregory Haskins    2008-01-25  1623  
b28bc1e002c23ff kernel/sched/rt.c Qais Yousef        2020-03-02  1624  		/*
b28bc1e002c23ff kernel/sched/rt.c Qais Yousef        2020-03-02  1625  		 * Bail out if we were forcing a migration to find a better
b28bc1e002c23ff kernel/sched/rt.c Qais Yousef        2020-03-02  1626  		 * fitting CPU but our search failed.
b28bc1e002c23ff kernel/sched/rt.c Qais Yousef        2020-03-02  1627  		 */
01603b5411396eb kernel/sched/rt.c Connor O'Brien     2022-05-10  1628  		if (!test && target != -1 && !rt_task_fits_cpu(p, target))
b28bc1e002c23ff kernel/sched/rt.c Qais Yousef        2020-03-02  1629  			goto out_unlock;
b28bc1e002c23ff kernel/sched/rt.c Qais Yousef        2020-03-02  1630  
80e3d87b2c5582d kernel/sched/rt.c Tim Chen           2014-12-12  1631  		/*
65c99af98ba6f6b kernel/sched/rt.c Greg Kroah-Hartman 2022-03-31  1632  		 * Don't bother moving it if the destination CPU is
80e3d87b2c5582d kernel/sched/rt.c Tim Chen           2014-12-12  1633  		 * not running a lower priority task.
80e3d87b2c5582d kernel/sched/rt.c Tim Chen           2014-12-12  1634  		 */
80e3d87b2c5582d kernel/sched/rt.c Tim Chen           2014-12-12  1635  		if (target != -1 &&
65c99af98ba6f6b kernel/sched/rt.c Greg Kroah-Hartman 2022-03-31  1636  		    p->prio < cpu_rq(target)->rt.highest_prio.curr)
7608dec2ce2004c kernel/sched_rt.c Peter Zijlstra     2011-04-05  1637  			cpu = target;
318e0893ce3f524 kernel/sched_rt.c Gregory Haskins    2008-01-25  1638  	}
b28bc1e002c23ff kernel/sched/rt.c Qais Yousef        2020-03-02  1639  
b28bc1e002c23ff kernel/sched/rt.c Qais Yousef        2020-03-02  1640  out_unlock:
7608dec2ce2004c kernel/sched_rt.c Peter Zijlstra     2011-04-05  1641  	rcu_read_unlock();
318e0893ce3f524 kernel/sched_rt.c Gregory Haskins    2008-01-25  1642  
c37495fd0f64fc1 kernel/sched_rt.c Steven Rostedt     2011-06-16  1643  out:
7608dec2ce2004c kernel/sched_rt.c Peter Zijlstra     2011-04-05  1644  	return cpu;
e7693a362ec84bb kernel/sched_rt.c Gregory Haskins    2008-01-25  1645  }
7ebefa8ceefed44 kernel/sched_rt.c Dmitry Adamushko   2008-07-01  1646  
7ebefa8ceefed44 kernel/sched_rt.c Dmitry Adamushko   2008-07-01  1647  static void check_preempt_equal_prio(struct rq *rq, struct task_struct *p)
7ebefa8ceefed44 kernel/sched_rt.c Dmitry Adamushko   2008-07-01  1648  {
c621dead3a640a6 kernel/sched/rt.c Connor O'Brien     2023-11-08  1649  	struct task_struct *exec_ctx = p;
c621dead3a640a6 kernel/sched/rt.c Connor O'Brien     2023-11-08  1650  	/*
c621dead3a640a6 kernel/sched/rt.c Connor O'Brien     2023-11-08  1651  	 * Current can't be migrated, useless to reschedule,
c621dead3a640a6 kernel/sched/rt.c Connor O'Brien     2023-11-08  1652  	 * let's hope p can move out.
c621dead3a640a6 kernel/sched/rt.c Connor O'Brien     2023-11-08  1653  	 */
4b53a3412d66632 kernel/sched/rt.c Ingo Molnar        2017-02-05  1654  	if (rq->curr->nr_cpus_allowed == 1 ||
c621dead3a640a6 kernel/sched/rt.c Connor O'Brien     2023-11-08 @1655  	    !cpupri_find(&rq->rd->cpupri, rq->donor, rq->curr, NULL))
7ebefa8ceefed44 kernel/sched_rt.c Dmitry Adamushko   2008-07-01  1656  		return;
7ebefa8ceefed44 kernel/sched_rt.c Dmitry Adamushko   2008-07-01  1657  
57d50e9d7fc2f22 kernel/sched/rt.c Connor O'Brien     2023-11-08  1658  	/* No reason to preempt since rq->curr wouldn't change anyway */
57d50e9d7fc2f22 kernel/sched/rt.c Connor O'Brien     2023-11-08  1659  	exec_ctx = find_exec_ctx(rq, p);
57d50e9d7fc2f22 kernel/sched/rt.c Connor O'Brien     2023-11-08  1660  	if (task_current(rq, exec_ctx))
57d50e9d7fc2f22 kernel/sched/rt.c Connor O'Brien     2023-11-08  1661  		return;
57d50e9d7fc2f22 kernel/sched/rt.c Connor O'Brien     2023-11-08  1662  
308a623a40ce168 kernel/sched/rt.c Wanpeng Li         2014-10-31  1663  	/*
308a623a40ce168 kernel/sched/rt.c Wanpeng Li         2014-10-31  1664  	 * p is migratable, so let's not schedule it and
308a623a40ce168 kernel/sched/rt.c Wanpeng Li         2014-10-31  1665  	 * see if it is pushed or pulled somewhere else.
308a623a40ce168 kernel/sched/rt.c Wanpeng Li         2014-10-31  1666  	 */
804d402fb6f6487 kernel/sched/rt.c Qais Yousef        2019-10-09  1667  	if (p->nr_cpus_allowed != 1 &&
c621dead3a640a6 kernel/sched/rt.c Connor O'Brien     2023-11-08  1668  	    cpupri_find(&rq->rd->cpupri, p, exec_ctx, NULL))
13b8bd0a5713bdf kernel/sched_rt.c Rusty Russell      2009-03-25  1669  		return;
24600ce89a819a8 kernel/sched_rt.c Rusty Russell      2008-11-25  1670  
7ebefa8ceefed44 kernel/sched_rt.c Dmitry Adamushko   2008-07-01  1671  	/*
97fb7a0a8944bd6 kernel/sched/rt.c Ingo Molnar        2018-03-03  1672  	 * There appear to be other CPUs that can accept
97fb7a0a8944bd6 kernel/sched/rt.c Ingo Molnar        2018-03-03  1673  	 * the current task but none can run 'p', so lets reschedule
97fb7a0a8944bd6 kernel/sched/rt.c Ingo Molnar        2018-03-03  1674  	 * to try and push the current task away:
7ebefa8ceefed44 kernel/sched_rt.c Dmitry Adamushko   2008-07-01  1675  	 */
7ebefa8ceefed44 kernel/sched_rt.c Dmitry Adamushko   2008-07-01  1676  	requeue_task_rt(rq, p, 1);
8875125efe8402c kernel/sched/rt.c Kirill Tkhai       2014-06-29  1677  	resched_curr(rq);
7ebefa8ceefed44 kernel/sched_rt.c Dmitry Adamushko   2008-07-01  1678  }
7ebefa8ceefed44 kernel/sched_rt.c Dmitry Adamushko   2008-07-01  1679  

:::::: The code at line 1655 was first introduced by commit
:::::: c621dead3a640a6055afcb80a78a16be3eff3b8b ANDROID: sched: Push execution and scheduler context split into deadline and rt

:::::: TO: Connor O'Brien <connoro@google.com>
:::::: CC: John Stultz <jstultz@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
