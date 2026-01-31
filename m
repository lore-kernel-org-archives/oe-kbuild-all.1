Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AA52DD5E2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 05:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769837512; cv=none; b=mVlz9g9FmDs2tt+hMOushRMgeNt5Rd33Yb1L8V2YaYeeUjVXs2p6L3aguZeJGeJC0Q+Vs38W7oWaEsN7LXhUbMsqjZhA8X6od4Nnb5o/G9LY9M5fAKYPJljNHN5wnYRTLlKYHhhsDhK7TmqnKuGxKL5aK4wLUfK4knhF/JUFpsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769837512; c=relaxed/simple;
	bh=5d4Admf820HQD9dRNbOtSdf7MvVilrfwV6f6etrwhnw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=udv4Brzv9b0446o+vh0Fx60CnEY1XVm6p1u6f/5fOwCJDQarig+SaQDAbeX14gyHPEONyzRNScgtW00vjECBGOl7vdecQOuffma+h2xbmBqxKf2xuhi66/KwSIaramlTDtfiRjkkD5uu1zsTsY4oHSmveUfUYr8geeX2uvic6Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Njn1GGrr; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Njn1GGrr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769837511; x=1801373511;
  h=date:from:to:cc:subject:message-id;
  bh=5d4Admf820HQD9dRNbOtSdf7MvVilrfwV6f6etrwhnw=;
  b=Njn1GGrr6NZavgQ8ee+uUy20Xq7uuvd2MkT5DTMJEWhdKEcDCqM/z0uv
   zoL77HQNRV+3zMlagL+OcqlzSn9EjzQJXl0IoRMWfSswiI60fNVPMBTt9
   EapAf2hTGR4z0r6mdP94N6DaxVY/ToSdts7EPj7ya3Jl/5vU4VTIVeLxO
   +OxaKxB4XxPgt2oP7XfUle4Nfo6ZkhKLuTcdRw7iqX3nuUGhVW7VnjJDi
   5PtNYKqG19p0/tE3SO1FpZg745E42SMiAdaG7IvazJyp62J2cKJ5w6SWQ
   xSxAQ69cCmUzBl3Z7mx1/GUXlHstnTSdhKKXX11tQb6c1lUZhjwiZdZBb
   g==;
X-CSE-ConnectionGUID: g8iqKQNVRbOQaNt+qkcD4w==
X-CSE-MsgGUID: YbKlLfWtQ02Z9n9bXpWbkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="73685755"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="73685755"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 21:31:48 -0800
X-CSE-ConnectionGUID: Tn5Hk/03QumbWrCRRa2x8A==
X-CSE-MsgGUID: BYR+deyVRjW1092His7dWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="246638267"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Jan 2026 21:31:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm3aC-00000000dfw-27MT;
	Sat, 31 Jan 2026 05:31:44 +0000
Date: Sat, 31 Jan 2026 13:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_9 3/12]
 kernel/bpf/syscall.c:3497:42: error: incompatible pointer types passing
 'struct bpf_tramp_node *' to parameter of type 'struct bpf_tramp_link *'
Message-ID: <202601311315.nMWUIIfg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_9
head:   4a1d38e3df06743886a06b547187aec8023ef27d
commit: 79e86aac9eaf3b5bdb4db339fb6082022ef69eb9 [3/12] bpf: Add struct bpf_tramp_node object
config: x86_64-randconfig-161-20260131 (https://download.01.org/0day-ci/archive/20260131/202601311315.nMWUIIfg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311315.nMWUIIfg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311315.nMWUIIfg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/syscall.c:5:
   include/linux/bpf.h:1544:51: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1544 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^
   include/linux/bpf.h:1550:53: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1550 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^
>> kernel/bpf/syscall.c:3497:42: error: incompatible pointer types passing 'struct bpf_tramp_node *' to parameter of type 'struct bpf_tramp_link *' [-Werror,-Wincompatible-pointer-types]
    3497 |         WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link.node,
         |                                                 ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:25: note: expanded from macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/bpf.h:1550:69: note: passing argument to parameter 'link' here
    1550 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                                     ^
   kernel/bpf/syscall.c:3731:33: error: incompatible pointer types passing 'struct bpf_tramp_node *' to parameter of type 'struct bpf_tramp_link *' [-Werror,-Wincompatible-pointer-types]
    3731 |         err = bpf_trampoline_link_prog(&link->link.node, tr, tgt_prog);
         |                                        ^~~~~~~~~~~~~~~~
   include/linux/bpf.h:1544:67: note: passing argument to parameter 'link' here
    1544 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                                   ^
   2 warnings and 2 errors generated.


vim +3497 kernel/bpf/syscall.c

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
