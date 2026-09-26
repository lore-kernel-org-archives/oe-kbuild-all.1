Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F5836074F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 02:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790388816; cv=none; b=uIguhxY8xxY9ezE/AupModj0F1LADxxeHs5mdoeVG/hn3sZ5/inX47GFP+gLq1wzZPNGQ5CAe3a2FG4D8d8B/PJOOU5rNYl0iIyo1SKp10km0VX7PNMsuObfmehoZyw8uJMdzlMMdKV9RX/o+oomQT7O3LzWVpSzFW9YQ55J4Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790388816; c=relaxed/simple;
	bh=f26kOBn3fk1JX/sS/qf1joAjBwlsa0IPdyAdmUF5d+U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=outg5/eo0/Cj75mqWQnPiSDMdoC55KEhEdnscOR4ZtdAW54eIu3qsQsU9K+cID5bQfT+hn+qR9xl727bsRapzu1tog/QanVSxrBNuFY8IIZj/dfrKIOz0miUvvONI+KA3cvrzVDOKMt3oOSZ7Evg/hbQHYuEpL4WvqSoqtTf4uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HsUwQ7Q8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HsUwQ7Q8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790388810; x=1821924810;
  h=date:from:to:cc:subject:message-id;
  bh=f26kOBn3fk1JX/sS/qf1joAjBwlsa0IPdyAdmUF5d+U=;
  b=HsUwQ7Q8orEcbtQOXlrIdbHxAJw9/We8PE6pGRPunG4wXkEiGr4WnRZB
   84tEfAIezt3uMSTKQWCnBCq5acKSDrrYqxKsMKeOVlJjG4jsLBQ9LykRx
   xmzPS1413n1R4/ht+SPLOfnPqKUd4SGVgZz1e1pjEap+5HkB2KY7HmkPA
   L727RzBGrOReh5/BNf7AxaxT7YsZOwfnqS9wC0PwVV5vlp/+9dH1cIxKr
   xMEJhTCaTTeHhAXXFZidYaZQ276cuD1w02s6oH10T7bbflcBkJUpnlx0K
   l7sApV4h6OMRdPn9FgkLQRjjh6VRZdB6eJbWSLx+GjyqRMiqyjbBV6GFl
   w==;
X-CSE-ConnectionGUID: qYffdv4ASk65X/MwGSeNIQ==
X-CSE-MsgGUID: xXBDobPHTrOb2BeN5lNgfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="78738325"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="78738325"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 19:13:25 -0700
X-CSE-ConnectionGUID: /USvCuOySUq1wkpMg0Pyyg==
X-CSE-MsgGUID: zNkYDPadRaiZG1+YTCqviQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="274016072"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Sep 2026 19:13:23 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAHuj-00000000LRf-06F1;
	Sat, 26 Sep 2026 02:13:21 +0000
Date: Sat, 26 Sep 2026 10:13:06 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/prjc 651/779] kernel/sched/alt_sched.h:334:25:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202609261040.f3HIs68E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/prjc
head:   998c50092be8097be2939c7272c5cb9f0d143081
commit: add9dba34cde0a2265b292326f8318bf0fd733ef [651/779] sched/alt: [Sync] 6199f9999a9b sched/cputime: Handle dyntick-idle steal time correctly
config: arc-randconfig-r1307-20260926 (https://download.01.org/0day-ci/archive/20260926/202609261040.f3HIs68E-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261040.f3HIs68E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609261040.f3HIs68E-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file (through kernel/sched/sched.h):
>> kernel/sched/alt_sched.h:334:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:334:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:334:25: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, include/linux/sched/cputime.h):
   arch/arc/include/asm/uaccess.h:592:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char *d_char @@     got void [noderef] __user *to @@
   arch/arc/include/asm/uaccess.h:592:33: sparse:     expected unsigned char *d_char
   arch/arc/include/asm/uaccess.h:592:33: sparse:     got void [noderef] __user *to

vim +334 kernel/sched/alt_sched.h

2f7ec82370cbb7 Alfred Chen 2019-08-19  331  
e6d6a4e78f98f6 Alfred Chen 2026-01-19  332  static inline bool idle_rq(struct rq *rq)
e6d6a4e78f98f6 Alfred Chen 2026-01-19  333  {
e6d6a4e78f98f6 Alfred Chen 2026-01-19 @334  	return rq->curr == rq->idle && !rq->nr_running && !rq->ttwu_pending;
e6d6a4e78f98f6 Alfred Chen 2026-01-19  335  }
e6d6a4e78f98f6 Alfred Chen 2026-01-19  336  

:::::: The code at line 334 was first introduced by commit
:::::: e6d6a4e78f98f667774453eb1b15379f06183e1f sched/alt: [Sync] 1e0a2ba7afb1 sched: Provide idle_rq() helper

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
