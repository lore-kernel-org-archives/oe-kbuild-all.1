Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E38330D22
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 05:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769837512; cv=none; b=gr9+K/8kUkJEe/MxtwbAGMtScrFYty43+hQmYuI2SxYtTNfLRNgTU/uIh2CMd+lAxHocYckdRSy10nw9xb0Inj9+iJSToRUshWyLBBgMErWUmVd6NT3sgoigsGNEJhP6GorP2747NR4NBHgXKxTJInngZajUTLS70zTdghwN0Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769837512; c=relaxed/simple;
	bh=ur73aX5yl93ujpVjOYakV/LUmFyGsigFhztbFN+iIJk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EononSROnnl1ZYTQJRSUFsuuyvCve+alDIWpagJV61ys3rEPaeneX1EivI8TZznGKN8TvmIrg86Ag9KeQb83i5fM8niTdeNkk/t018HBvN1h9+oGvrkx7uey8q2WcoxwfdgSamcPxRNMDrrYzeoN/LdN5di0uRjSkPy/vjGZS+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XThpsvdo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XThpsvdo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769837511; x=1801373511;
  h=date:from:to:cc:subject:message-id;
  bh=ur73aX5yl93ujpVjOYakV/LUmFyGsigFhztbFN+iIJk=;
  b=XThpsvdoEJN6MXV+3qttf7vEeHmlpVyNFxRghybSxdEk4AmM9yY353ia
   r6EJk8rcfQHmxV/TyScL/1d79ePHw3NopnMajyHdmRmkPehUK9UJDQKkV
   kN9QJgCPHNxlXqQ33ue8Ou3YenURHnb9iIPK1lK71i8F9Ci4woYdcWHwx
   YCP7E4c9+N0NgeKlfzu6cIxJ3NX5uzy84pdxxy1eb/vlTKGY9PpBpwCC5
   AXTRdDdIn9a90Dl4/21HhMP2p2UilFPnySN8k3mc3+XpgEchNkdGwOqdv
   eN9diJtp6eCy7iXWCx4On7Qfyt5KeV3RPy+fLrQFU61KdEsjhZpoXkXsW
   w==;
X-CSE-ConnectionGUID: NLDTQQRrTcS9gJ4WKBFa5Q==
X-CSE-MsgGUID: K3Wf3upVQh+r8Vu+ASdQPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="73685754"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="73685754"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 21:31:48 -0800
X-CSE-ConnectionGUID: g5IyYpbgSoWYp2DRpIlSKg==
X-CSE-MsgGUID: 3uWQXrxrQ6C+NXMxHd7I+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="246638265"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Jan 2026 21:31:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm3aC-00000000dfy-2DeM;
	Sat, 31 Jan 2026 05:31:44 +0000
Date: Sat, 31 Jan 2026 13:31:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_9 3/12]
 kernel/bpf/syscall.c:3497:42: error: passing argument 1 of
 'bpf_trampoline_unlink_prog' from incompatible pointer type
Message-ID: <202601311313.9feC7ekx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_9
head:   4a1d38e3df06743886a06b547187aec8023ef27d
commit: 79e86aac9eaf3b5bdb4db339fb6082022ef69eb9 [3/12] bpf: Add struct bpf_tramp_node object
config: arc-randconfig-r072-20260131 (https://download.01.org/0day-ci/archive/20260131/202601311313.9feC7ekx-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311313.9feC7ekx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311313.9feC7ekx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/syscall.c:5:
   include/linux/bpf.h:1544:51: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
                                                      ^~~~~~~~~~~~~~
   include/linux/bpf.h:1550:53: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
                                                        ^~~~~~~~~~~~~~
   In file included from arch/arc/include/asm/bug.h:30,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from kernel/bpf/syscall.c:5:
   kernel/bpf/syscall.c: In function 'bpf_tracing_link_release':
>> kernel/bpf/syscall.c:3497:42: error: passing argument 1 of 'bpf_trampoline_unlink_prog' from incompatible pointer type [-Werror=incompatible-pointer-types]
     WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link.node,
                                             ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:205:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   kernel/bpf/syscall.c:3497:2: note: in expansion of macro 'WARN_ON_ONCE'
     WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link.node,
     ^~~~~~~~~~~~
   In file included from kernel/bpf/syscall.c:5:
   include/linux/bpf.h:1550:69: note: expected 'struct bpf_tramp_link *' but argument is of type 'struct bpf_tramp_node *'
    static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
                                                 ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/bpf/syscall.c: In function 'bpf_tracing_prog_attach':
>> kernel/bpf/syscall.c:3731:33: error: passing argument 1 of 'bpf_trampoline_link_prog' from incompatible pointer type [-Werror=incompatible-pointer-types]
     err = bpf_trampoline_link_prog(&link->link.node, tr, tgt_prog);
                                    ^~~~~~~~~~~~~~~~
   In file included from kernel/bpf/syscall.c:5:
   include/linux/bpf.h:1544:67: note: expected 'struct bpf_tramp_link *' but argument is of type 'struct bpf_tramp_node *'
    static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
                                               ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/bpf_trampoline_unlink_prog +3497 kernel/bpf/syscall.c

  3491	
  3492	static void bpf_tracing_link_release(struct bpf_link *link)
  3493	{
  3494		struct bpf_tracing_link *tr_link =
  3495			container_of(link, struct bpf_tracing_link, link.link);
  3496	
> 3497		WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link.node,
  3498							tr_link->trampoline,
  3499							tr_link->tgt_prog));
  3500	
  3501		bpf_trampoline_put(tr_link->trampoline);
  3502	
  3503		/* tgt_prog is NULL if target is a kernel function */
  3504		if (tr_link->tgt_prog)
  3505			bpf_prog_put(tr_link->tgt_prog);
  3506	}
  3507	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
