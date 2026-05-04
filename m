Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEF72C859
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 May 2026 06:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877345; cv=none; b=oUrKO95wYJie4e7OnOuGBO5OJbBZoE6SQVEPVMdpjFJN0tNXvEJ3bS1PYRzofSdzhm+60Z7hL7WHRXzcHYRMYMCe/XfbSxX0nVaZI1lyEzv8oAJbPtqAX6ilZsSUe5D1zj7zzdI3K5re++ak8ObdgpKEk1/dnWdDi9Qh1kDUL9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877345; c=relaxed/simple;
	bh=qguzGRMNAItQFdX8KuAP7CHFcK5WNoeHaurKFXSr9Yo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m3kEqFyWpAxUPOvj0S1cn3WdGan/7OAZe9I0HwclNV8VtGOtaoXN6qDy1a32gGegj3ggSxbuxjsLzafJKbIjFcnbJ+myWbaJKLM/0roc3s/i1Nypp/GffjJWVKWvsY41eV/Fp3O2stDyCV0iesCBgm9yVFPl/+9UXjS97hv9qNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BuBJGmOE; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BuBJGmOE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777877344; x=1809413344;
  h=date:from:to:cc:subject:message-id;
  bh=qguzGRMNAItQFdX8KuAP7CHFcK5WNoeHaurKFXSr9Yo=;
  b=BuBJGmOEocMrqYZGk27AEGoMXm4sbBHmBjhmDNErsX5Fed0naRjp8Bf2
   3XW1KV5ycTKHSNkICSV2XU7TMB96bG+hHazNqr6ZzpZrxX+JeK/CL+Gdn
   hQmwPcKfkOcVrsWYZ2skG27vjYrqf4g0LNkHs+zAAd+JsVLz27EIUTAUz
   JDX8T2q0qQnOk6eOA0fzQ6Xbbd5+1Do7VMgeTTDFbVw+bmNj0h6Mow+jb
   NDFBR5uJABFLeU/L0m+P3q1jczUHY6FGzlKgAicudgVt0x4jXa4tOM1nT
   hRFlzShUeBdY+53yuckfFEdrGJbPAMyAfzLr0/nYEqDBabnlE1OX+zdb7
   A==;
X-CSE-ConnectionGUID: C0hYauLrTOGFkai0ZI+IhA==
X-CSE-MsgGUID: 0a5WpnHhSSOf4ptcDNy9wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78923721"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="78923721"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 23:49:04 -0700
X-CSE-ConnectionGUID: 08JoUU73SlarxF1Bvw5vFQ==
X-CSE-MsgGUID: +XPqx2phTm2tqDpvFOd8RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="232283200"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 May 2026 23:49:02 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJn6r-000000003ZN-1lgi;
	Mon, 04 May 2026 06:48:55 +0000
Date: Mon, 04 May 2026 14:48:43 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [boqun:rust-sync 9/12] include/linux/hardirq.h:128:16:
 warning: unused variable 'nesting'
Message-ID: <202605041421.ncVmab1u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   25f8ae3956f6e747f0eedaca70ed975a79068ec4
commit: 06213534538c49fcab99613e767100580c940910 [9/12] preempt: x86: Avoid tracking NMI separately when 64BIT=y
config: sh-randconfig-001-20260504 (https://download.01.org/0day-ci/archive/20260504/202605041421.ncVmab1u-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605041421.ncVmab1u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605041421.ncVmab1u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/sh/kernel/traps.c:11:
   arch/sh/kernel/traps.c: In function 'nmi_trap_handler':
>> include/linux/hardirq.h:128:16: warning: unused variable 'nesting' [-Wunused-variable]
     128 |   unsigned int nesting;    \
         |                ^~~~~~~
   include/linux/hardirq.h:142:3: note: in expansion of macro '__nmi_exit'
     142 |   __nmi_exit();     \
         |   ^~~~~~~~~~
   arch/sh/kernel/traps.c:195:2: note: in expansion of macro 'nmi_exit'
     195 |  nmi_exit();
         |  ^~~~~~~~


vim +/nesting +128 include/linux/hardirq.h

5870970b9a828d Julien Thierry      2019-01-31   96  
f93524eb9c54f4 Peter Zijlstra      2020-02-12   97  /*
f93524eb9c54f4 Peter Zijlstra      2020-02-12   98   * NMI vs Tracing
f93524eb9c54f4 Peter Zijlstra      2020-02-12   99   * --------------
f93524eb9c54f4 Peter Zijlstra      2020-02-12  100   *
f93524eb9c54f4 Peter Zijlstra      2020-02-12  101   * We must not land in a tracer until (or after) we've changed preempt_count
f93524eb9c54f4 Peter Zijlstra      2020-02-12  102   * such that in_nmi() becomes true. To that effect all NMI C entry points must
f93524eb9c54f4 Peter Zijlstra      2020-02-12  103   * be marked 'notrace' and call nmi_enter() as soon as possible.
f93524eb9c54f4 Peter Zijlstra      2020-02-12  104   */
f93524eb9c54f4 Peter Zijlstra      2020-02-12  105  
69ea03b56ed2c7 Peter Zijlstra      2020-02-19  106  /*
4992bfffa2b713 Joel Fernandes      2026-01-21  107   * nmi_enter() can nest - nesting is tracked in a per-CPU counter.
69ea03b56ed2c7 Peter Zijlstra      2020-02-19  108   */
ba1f2b2eaa2a52 Peter Zijlstra      2020-05-27  109  #define __nmi_enter()						\
17666f02b11809 Steven Rostedt      2008-10-30  110  	do {							\
ba1f2b2eaa2a52 Peter Zijlstra      2020-05-27  111  		lockdep_off();					\
5870970b9a828d Julien Thierry      2019-01-31  112  		arch_nmi_enter();				\
06213534538c49 Boqun Feng          2026-05-03  113  		__preempt_count_nmi_enter();			\
ba1f2b2eaa2a52 Peter Zijlstra      2020-05-27  114  	} while (0)
ba1f2b2eaa2a52 Peter Zijlstra      2020-05-27  115  
ba1f2b2eaa2a52 Peter Zijlstra      2020-05-27  116  #define nmi_enter()						\
ba1f2b2eaa2a52 Peter Zijlstra      2020-05-27  117  	do {							\
ba1f2b2eaa2a52 Peter Zijlstra      2020-05-27  118  		__nmi_enter();					\
2502ec37a7b228 Thomas Gleixner     2020-03-20  119  		lockdep_hardirq_enter();			\
493c1822825f00 Frederic Weisbecker 2022-06-08  120  		ct_nmi_enter();					\
2ab70319bc1f79 Thomas Gleixner     2020-05-21  121  		instrumentation_begin();			\
2ab70319bc1f79 Thomas Gleixner     2020-05-21  122  		ftrace_nmi_enter();				\
2ab70319bc1f79 Thomas Gleixner     2020-05-21  123  		instrumentation_end();				\
17666f02b11809 Steven Rostedt      2008-10-30  124  	} while (0)
5f34fe1cfc1bdd Linus Torvalds      2008-12-30  125  
ba1f2b2eaa2a52 Peter Zijlstra      2020-05-27  126  #define __nmi_exit()						\
ba1f2b2eaa2a52 Peter Zijlstra      2020-05-27  127  	do {							\
4992bfffa2b713 Joel Fernandes      2026-01-21 @128  		unsigned int nesting;				\
ba1f2b2eaa2a52 Peter Zijlstra      2020-05-27  129  		BUG_ON(!in_nmi());				\
06213534538c49 Boqun Feng          2026-05-03  130  		__preempt_count_nmi_exit();			\
ba1f2b2eaa2a52 Peter Zijlstra      2020-05-27  131  		arch_nmi_exit();				\
ba1f2b2eaa2a52 Peter Zijlstra      2020-05-27  132  		lockdep_on();					\
ba1f2b2eaa2a52 Peter Zijlstra      2020-05-27  133  	} while (0)
ba1f2b2eaa2a52 Peter Zijlstra      2020-05-27  134  

:::::: The code at line 128 was first introduced by commit
:::::: 4992bfffa2b713f3aa95ef4b933fd40ec2e6f8a7 preempt: Track NMI nesting to separate per-CPU counter

:::::: TO: Joel Fernandes <joelagnelf@nvidia.com>
:::::: CC: Boqun Feng <boqun@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
