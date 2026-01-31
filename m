Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A9B18859B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 05:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769836192; cv=none; b=EGzOGje/jbh7dkj0x2riAySxmQtzj6PJ2C0YHWdhRxbrmUYkRUvI3W069FrmnUkuTKgqellGgpoba2PPrqvGZ8R6L2XwEZlDFeawY20WVCX4wmfYQWGAUWui4J+mOrYqsqxJygHXcQFGggDDNSSAmUu95N5np/lZ7hF5MGkWS34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769836192; c=relaxed/simple;
	bh=ztQk+YZ220b504yW4B5Ld0V4wEeGqO1+Z5F414n9M7U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CXPWwqsPVt8tsZleQOEN7LAV7KjDDMAD8JdjjDAoxd4fPvJKgimtaSR9h8RufggWy/lMfQh6WM4jhze3TIH1rki2ZjGUkWRqO6WmaOHJVnmAS8VTmrSnkCWaf3SWFMab+dAWZpy7HXoN2s6SloFkilpjzI8cJwk1E4Ozw5PWkQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CmFRhQoq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CmFRhQoq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769836188; x=1801372188;
  h=date:from:to:cc:subject:message-id;
  bh=ztQk+YZ220b504yW4B5Ld0V4wEeGqO1+Z5F414n9M7U=;
  b=CmFRhQoqjpUQlBkLkLq9A+qcaqyJsyCOCvzMjl6Vf1C8l/usW9Pm+1p6
   XGDGIkUgoQLOHcsLlbczzLuYEdl20Ws1GDn11QbnyiipAqBJswS8msYno
   k4S50ON4WV3C9s/J8MI+pVxOP24tMF8iYY7yFqbAUjUA9qYJMjjBIc7Rq
   w53oHnxVLM9ZAN0imcy692Zb6KVvBhVM2a07VvjKPIt8+3gqk6AdgCaRB
   8Wd4njBct2PEsXdAKysCH6+24RlYn/TkFpOe6yfftRlZZjWgDJa03qLdW
   sAi674DbWHvsic0DX4Hd8WSvvKD1csbLk6CNmkAJQ6uo+mWRbIkmZuVIr
   A==;
X-CSE-ConnectionGUID: oVxp+7eqTdKxuON+gRPTmw==
X-CSE-MsgGUID: IsxIu1fUQZGDiqSqJJeiMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70980137"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="70980137"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 21:09:48 -0800
X-CSE-ConnectionGUID: XZT2VqL/Sce5DLeqIRsOcw==
X-CSE-MsgGUID: 1p1qSV6+SY2U1gK+inqRaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="209256972"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Jan 2026 21:09:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm3Et-00000000df0-2nHf;
	Sat, 31 Jan 2026 05:09:43 +0000
Date: Sat, 31 Jan 2026 13:09:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_9 1/12]
 kernel/bpf/trampoline.c:740:12: warning: 'bpf_trampoline_update' defined but
 not used
Message-ID: <202601311349.Yr6mO1xp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_9
head:   4a1d38e3df06743886a06b547187aec8023ef27d
commit: 9ecb3af28fc9354376aac0f9645ff70b637c067b [1/12] bpf: Add struct bpf_trampoline_ops object
config: x86_64-buildonly-randconfig-002-20260131 (https://download.01.org/0day-ci/archive/20260131/202601311349.Yr6mO1xp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311349.Yr6mO1xp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311349.Yr6mO1xp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/trampoline.c:448:15: error: variable 'trampoline_ops' has initializer but incomplete type
     448 | static struct bpf_trampoline_ops trampoline_ops = {
         |               ^~~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:449:10: error: 'struct bpf_trampoline_ops' has no member named 'register_fentry'
     449 |         .register_fentry   = register_fentry,
         |          ^~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:449:30: warning: excess elements in struct initializer
     449 |         .register_fentry   = register_fentry,
         |                              ^~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:449:30: note: (near initialization for 'trampoline_ops')
   kernel/bpf/trampoline.c:450:10: error: 'struct bpf_trampoline_ops' has no member named 'unregister_fentry'
     450 |         .unregister_fentry = unregister_fentry,
         |          ^~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:450:30: warning: excess elements in struct initializer
     450 |         .unregister_fentry = unregister_fentry,
         |                              ^~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:450:30: note: (near initialization for 'trampoline_ops')
   kernel/bpf/trampoline.c:451:10: error: 'struct bpf_trampoline_ops' has no member named 'modify_fentry'
     451 |         .modify_fentry     = modify_fentry,
         |          ^~~~~~~~~~~~~
   kernel/bpf/trampoline.c:451:30: warning: excess elements in struct initializer
     451 |         .modify_fentry     = modify_fentry,
         |                              ^~~~~~~~~~~~~
   kernel/bpf/trampoline.c:451:30: note: (near initialization for 'trampoline_ops')
   kernel/bpf/trampoline.c: In function 'bpf_trampoline_update_ops':
   kernel/bpf/trampoline.c:710:26: error: invalid use of undefined type 'struct bpf_trampoline_ops'
     710 |                 err = ops->register_fentry(tr, im->image, data);
         |                          ^~
   kernel/bpf/trampoline.c: At top level:
   kernel/bpf/trampoline.c:448:34: error: storage size of 'trampoline_ops' isn't known
     448 | static struct bpf_trampoline_ops trampoline_ops = {
         |                                  ^~~~~~~~~~~~~~
>> kernel/bpf/trampoline.c:740:12: warning: 'bpf_trampoline_update' defined but not used [-Wunused-function]
     740 | static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mutex)
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/bpf_trampoline_update +740 kernel/bpf/trampoline.c

   739	
 > 740	static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mutex)
   741	{
   742		return bpf_trampoline_update_ops(tr, lock_direct_mutex, &trampoline_ops, NULL);
   743	}
   744	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
