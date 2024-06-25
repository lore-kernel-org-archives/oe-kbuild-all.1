Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ADD149C69
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 21:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719349415; cv=none; b=dWOBILQORS8xE4/C7AJlEhNvk6bShv2H5I8+OEXfOhRicbFCaWmX71ljWvcCoejG6xJF4NfwJLJz/e0w24f17u7Hdr19JhNhvhdVZF9hOob0pimt2diiAFxqSUvhawVg55ilzrd12+De8d5eULKHjqawPsh6Mhz54w4C8mGoaV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719349415; c=relaxed/simple;
	bh=AZrUrf1+jPL2ILDhdUiR72xgQrMkyWbkoPYov4VWgDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kA7+gl8Dwx686vS6K952ZMLC54VHdxk1I+ZPzwdY1FHz8EyIKahL/pBMeOD1bkIOTjactoSy2dTYDyc/pKW4DgQdMma2P9p6P+B1mluvmZi8H4VpsJy16nqNjN6Cgapc9pPlLAxkBBa83Jkku5nHHHi7WyJ80KZvWSBTKBui9lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8zvo2zS; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8zvo2zS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719349413; x=1750885413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AZrUrf1+jPL2ILDhdUiR72xgQrMkyWbkoPYov4VWgDA=;
  b=X8zvo2zSsRrCFDt7OxLxuM9gLPzuWzgIVGsbdaf9HLtW2jVOHm9kZpNl
   9ubTPJ6fh7Z8WGFI9P7fer3LweHrPfaWwuNKoNBqaMjBhm+rbriop9rOV
   S4YT1F3HZRoopYhgNIorhF9uuiJdpmfJhH7XV7Nqo14pRXQS/2txR02mo
   VjU8bAoMNLig4MGp0yHC/dTWqlj9K0/PEn3lZrG2sVn8zr8X8/A3EZmxu
   swJSzF5Py1zLLaOfVPPz3jjinanjyX9aR1KMnLL9ubWoTOWXPlSlAT9LV
   wUcrDNi5o3DgnNDYfNAk1QAi1Zxn1/EKvB+riHqa1cD/WcsZFx6/ElPB+
   g==;
X-CSE-ConnectionGUID: qTlqiXFSQxe0kP/Hl37Zrw==
X-CSE-MsgGUID: zyCuWbTWT8mfFZSiJhNn2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="33928140"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="33928140"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 14:03:32 -0700
X-CSE-ConnectionGUID: MCjG4YS9TAS0olbScW5lrQ==
X-CSE-MsgGUID: vL/vkJlgTtegwp4iavADaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="43842352"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Jun 2024 14:03:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMDK4-000Ej4-1I;
	Tue, 25 Jun 2024 21:03:28 +0000
Date: Wed, 26 Jun 2024 05:02:56 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Vernet <dvernet@meta.com>, Josh Don <joshdon@google.com>
Subject: [linux-next:master 5987/8232] kernel/sched/ext.c:2399:56: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202406260418.amYwHKB1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
commit: 7b0888b7cc1924b74ce660e02f6211df8dd46e7b [5987/8232] sched_ext: Implement core-sched support
config: x86_64-randconfig-122-20240625 (https://download.01.org/0day-ci/archive/20240626/202406260418.amYwHKB1-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406260418.amYwHKB1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406260418.amYwHKB1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:916:70: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:916:70: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:916:70: sparse:    struct task_struct *
   kernel/sched/rt.c:2364:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2364:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2364:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:532:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:532:54: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:532:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1002:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1002:38: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1002:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1536:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1536:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1536:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1876:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1876:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1876:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1556:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1556:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1556:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1621:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1621:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1621:45: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1682:67: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1682:67: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1682:67: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2044:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2044:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2044:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2067:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2067:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2067:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2417:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2417:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2417:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2419:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2419:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2419:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2419:61: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2419:61: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2419:61: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2401:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2401:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2401:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2411:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2411:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2411:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2519:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2519:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2519:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2026:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2026:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2026:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2037:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2037:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2037:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1220:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1220:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1220:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1444:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1444:38: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1444:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2262:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2262:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2262:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:1911:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:1911:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1911:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:1987:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1987:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1987:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2566:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2566:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2566:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2568:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2568:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2568:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2570:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2570:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2570:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2745:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2745:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2745:22: sparse:    struct task_struct *
   kernel/sched/deadline.c:2794:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext.c:772:25: sparse: sparse: symbol 'scx_has_op' was not declared. Should it be static?
   kernel/sched/ext.c:876:22: sparse: sparse: symbol 'scx_dump_data' was not declared. Should it be static?
   kernel/sched/ext.c:1334:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1406:56: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1406:56: sparse:    struct task_struct *
   kernel/sched/ext.c:1406:56: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:1799:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1799:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:1799:35: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:1809:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1809:38: sparse:     expected struct task_struct *from
   kernel/sched/ext.c:1809:38: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/ext.c:2399:56: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *sprev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2399:56: sparse:     expected struct task_struct *sprev
   kernel/sched/ext.c:2399:56: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2625:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2625:38: sparse:     expected struct task_struct *curr
   kernel/sched/ext.c:2625:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:4206:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:4206:52: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:4206:52: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:4914:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:4914:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:4914:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:5905:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:5905:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:5905:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/syscalls.c:253:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:253:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:253:48: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file (through include/linux/smp.h, include/linux/sched/clock.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2234:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2234:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2234:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2234:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2234:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2234:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2234:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2234:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2234:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2234:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2409:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2409:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2409:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2234:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2409:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2409:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2409:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1426:6: sparse: sparse: context imbalance in 'sched_getaffinity' - different lock contexts for basic block
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1707:15: sparse: sparse: dereference of noderef expression

vim +2399 kernel/sched/ext.c

  2378	
  2379	static int balance_scx(struct rq *rq, struct task_struct *prev,
  2380			       struct rq_flags *rf)
  2381	{
  2382		int ret;
  2383	
  2384		ret = balance_one(rq, prev, rf, true);
  2385	
  2386	#ifdef CONFIG_SCHED_SMT
  2387		/*
  2388		 * When core-sched is enabled, this ops.balance() call will be followed
  2389		 * by put_prev_scx() and pick_task_scx() on this CPU and pick_task_scx()
  2390		 * on the SMT siblings. Balance the siblings too.
  2391		 */
  2392		if (sched_core_enabled(rq)) {
  2393			const struct cpumask *smt_mask = cpu_smt_mask(cpu_of(rq));
  2394			int scpu;
  2395	
  2396			for_each_cpu_andnot(scpu, smt_mask, cpumask_of(cpu_of(rq))) {
  2397				struct rq *srq = cpu_rq(scpu);
  2398				struct rq_flags srf;
> 2399				struct task_struct *sprev = srq->curr;
  2400	
  2401				/*
  2402				 * While core-scheduling, rq lock is shared among
  2403				 * siblings but the debug annotations and rq clock
  2404				 * aren't. Do pinning dance to transfer the ownership.
  2405				 */
  2406				WARN_ON_ONCE(__rq_lockp(rq) != __rq_lockp(srq));
  2407				rq_unpin_lock(rq, rf);
  2408				rq_pin_lock(srq, &srf);
  2409	
  2410				update_rq_clock(srq);
  2411				balance_one(srq, sprev, &srf, false);
  2412	
  2413				rq_unpin_lock(srq, &srf);
  2414				rq_repin_lock(rq, rf);
  2415			}
  2416		}
  2417	#endif
  2418		return ret;
  2419	}
  2420	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
