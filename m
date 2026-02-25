Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7246627B353
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 17:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772042269; cv=none; b=Q9rT0puhkZsUwxovkKwVyaKt2puQ8X8JCb5X8Yh/Ch1xNnC1mlUWEGVA6oqoOa9BYqwzONNSWOvSGKhVXF9Lpm1ZMc3FlCBLqK8AAoKgYTcX6fQmkXTMesoJiIfHbz5Yr/wCJTq6rz/JtuiVyaaYPhNLxCKtVw3iN6dxACkEOpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772042269; c=relaxed/simple;
	bh=0TQqBZjAfxG5TqNrJow9HjuFDUoCUGrKxrx2MhtAVNo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=akdCnZUFH6KXogjTzmZ9MXrKfiiuuUZ73JIeOcdsIgQXx95rZEbIi8PMaafknNEQLOxs1bNc5G/9tDJe9pt3d2DeeCNuBVekXkZvxjhMPkslyg+FjjhNUjl5FMreLnyDFT3w8OMJnCVfndCMjDHmOZV1JfKHJ1+aXwDnIUE8Fog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JqoO58GE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JqoO58GE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772042267; x=1803578267;
  h=date:from:to:cc:subject:message-id;
  bh=0TQqBZjAfxG5TqNrJow9HjuFDUoCUGrKxrx2MhtAVNo=;
  b=JqoO58GEFEnSnop0210hcu3pkx/beo8L61djEV14FHCo1uWHlfLuTQC3
   NUWsQhpp+ZGuR0Ozkj0hZ04w/WdNti1tyR29sbIRwC0jQgL+pp9UnRsQh
   aXktW/rYDr4WFCnoDxepZqI6V037C+yXl6qQpvs9r0gph0a+t7zchBu7C
   v5dpJhGUWFGnqqjYf+yo8MIDGzG8IQozvK44z45ULPou/H5FZ05rAVP9O
   XZTuIzQ8XB+JKgO7hBesOqnd760CmrUodw+w9g4ifiWsAS0/tCgaAr389
   R4R6QBvfXcGoGoCgvYy2l1Mg5/z7XPtaSKX4JgObwrjGOxeQO6DdTVt9X
   w==;
X-CSE-ConnectionGUID: hBHfyVUkQbeeWGNOkoX4Vw==
X-CSE-MsgGUID: ID58fWlZT5K1g/DrEFCvTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="75696425"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="75696425"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 09:57:46 -0800
X-CSE-ConnectionGUID: SymyqQnqRBGkTANffxooxA==
X-CSE-MsgGUID: R7Ulnz8MQKisBWhryfvbeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="216451448"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 25 Feb 2026 09:57:45 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvJ8p-000000006u8-0q7c;
	Wed, 25 Feb 2026 17:57:43 +0000
Date: Thu, 26 Feb 2026 01:57:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 6/23]
 kernel/bpf/syscall.c:3514:49: error: passing argument 1 of
 'bpf_trampoline_unlink_prog' from incompatible pointer type
Message-ID: <202602260113.doKuRGW0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_5
head:   2e9ff5967a4f3cb4d96c1fd04944036d9961099d
commit: 8f7a9302fcb5575b82514340a6ceed2c5592a014 [6/23] bpf: Add struct bpf_tramp_node object
config: csky-randconfig-r072-20260226 (https://download.01.org/0day-ci/archive/20260226/202602260113.doKuRGW0-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602260113.doKuRGW0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602260113.doKuRGW0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/syscall.c:5:
   include/linux/bpf.h:1543:51: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1543 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^~~~~~~~~~~~~~
   include/linux/bpf.h:1549:53: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1549 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^~~~~~~~~~~~~~
   In file included from include/asm-generic/bug.h:7,
                    from arch/csky/include/asm/bug.h:18,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11:
   kernel/bpf/syscall.c: In function 'bpf_tracing_link_release':
>> kernel/bpf/syscall.c:3514:49: error: passing argument 1 of 'bpf_trampoline_unlink_prog' from incompatible pointer type [-Wincompatible-pointer-types]
    3514 |         WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link.node,
         |                                                 ^~~~~~~~~~~~~~~~~~~
         |                                                 |
         |                                                 struct bpf_tramp_node *
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   kernel/bpf/syscall.c:3514:9: note: in expansion of macro 'WARN_ON_ONCE'
    3514 |         WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link.node,
         |         ^~~~~~~~~~~~
   include/linux/bpf.h:1549:69: note: expected 'struct bpf_tramp_link *' but argument is of type 'struct bpf_tramp_node *'
    1549 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/bpf/syscall.c: In function 'bpf_tracing_prog_attach':
>> kernel/bpf/syscall.c:3746:40: error: passing argument 1 of 'bpf_trampoline_link_prog' from incompatible pointer type [-Wincompatible-pointer-types]
    3746 |         err = bpf_trampoline_link_prog(&link->link.node, tr, tgt_prog);
         |                                        ^~~~~~~~~~~~~~~~
         |                                        |
         |                                        struct bpf_tramp_node *
   include/linux/bpf.h:1543:67: note: expected 'struct bpf_tramp_link *' but argument is of type 'struct bpf_tramp_node *'
    1543 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                            ~~~~~~~~~~~~~~~~~~~~~~~^~~~


vim +/bpf_trampoline_unlink_prog +3514 kernel/bpf/syscall.c

  3508	
  3509	static void bpf_tracing_link_release(struct bpf_link *link)
  3510	{
  3511		struct bpf_tracing_link *tr_link =
  3512			container_of(link, struct bpf_tracing_link, link.link);
  3513	
> 3514		WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link.node,
  3515							tr_link->trampoline,
  3516							tr_link->tgt_prog));
  3517	
  3518		bpf_trampoline_put(tr_link->trampoline);
  3519	
  3520		/* tgt_prog is NULL if target is a kernel function */
  3521		if (tr_link->tgt_prog)
  3522			bpf_prog_put(tr_link->tgt_prog);
  3523	}
  3524	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
