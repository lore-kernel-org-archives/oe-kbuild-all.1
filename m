Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1023EBF2C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 10:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890908; cv=none; b=a9ITshpBz+XC/dehjLp/AXIKYnB4ZCUblL8op/Nj3k4plCXaT5dUkgVneMff3JqIxtxv2kJgS+FLRQBtsEVebiMGcr1gqwQKbjvfvYnD2VMxHVrpKeP84R0qXN7r3zjaCYY5eDb6Ium8UlKqYSegGevleyQvTiFPdwRJZ0H9MLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890908; c=relaxed/simple;
	bh=RVHZiiiJhz2hq7g/Lzhc1U11tFpzQJCmWwzWmtjLizg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YjmuR1G4sRfua7daHG8DmvRnUVnrYAca59d76CUD3Zgz/tOZjgRXqy/xY1yT/TvlwGUmA6C28/LFRl2bAJwzN6EA+9aS2GlWD8g5kawJ5CAeCuaOhJaPrwmF0zE7rXVQlyUxceJ1tXrCCGYl6vDrrDMDeElqDoHmJjNQiWEbIo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WJxqYLHj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJxqYLHj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770890905; x=1802426905;
  h=date:from:to:cc:subject:message-id;
  bh=RVHZiiiJhz2hq7g/Lzhc1U11tFpzQJCmWwzWmtjLizg=;
  b=WJxqYLHj5GJhzYdu9m4tMbRuMtfWxqfQq9wN8RMpPcCLYBNf9/8kVazL
   Tr/xBmKX7BEEZvgRhi0t8oJnCiWHxu7fVMkLSzGwv+M3sCebFqypoOs3V
   Lk/4p9Y+AR7z9jFgBY69CFMtWeEzNq4SuvPLQrH7plbTLqBO15j8IGm/v
   016LidYl4Mg/XKelDYcmZootHu/QhKGUHDXx90FipTm39kvVr6mxRseS/
   HPrLou1CwGJsfN0XzlGLQG8R+WHQR79vDSoJO1jhpeRyGavU4En/XCHNS
   /jpcvOcBqJwyHM+WdEklTvDXVVuJnRuFqFetFS17Pr7MCVQAKw7DM6nv4
   w==;
X-CSE-ConnectionGUID: RczH6uUSRYqg3brcZEHALQ==
X-CSE-MsgGUID: RvxsTdEkTqe3HfA4YmEFUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="75684172"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="75684172"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:08:24 -0800
X-CSE-ConnectionGUID: SSSE/lD4TM6av3eEM/a08Q==
X-CSE-MsgGUID: q7CFZNX3RYu2g/QA6hGkWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="212660880"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Feb 2026 02:08:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqTcT-00000000r1s-0jTd;
	Thu, 12 Feb 2026 10:08:21 +0000
Date: Thu, 12 Feb 2026 18:08:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_4 5/13]
 kernel/bpf/syscall.c:3513:49: error: passing argument 1 of
 'bpf_trampoline_unlink_prog' from incompatible pointer type
Message-ID: <202602121715.MbWdl9qA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_4
head:   a3f496c783e26237e1a9a5b1f5e6661d4e3c5f25
commit: bb32c63cae9103f6e7f0c7d4e907490b7bef89f4 [5/13] bpf: Add struct bpf_tramp_node object
config: sparc64-randconfig-r063-20260212 (https://download.01.org/0day-ci/archive/20260212/202602121715.MbWdl9qA-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602121715.MbWdl9qA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602121715.MbWdl9qA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/syscall.c:5:
   include/linux/bpf.h:1543:51: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1543 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^~~~~~~~~~~~~~
   include/linux/bpf.h:1549:53: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1549 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^~~~~~~~~~~~~~
   In file included from arch/sparc/include/asm/bug.h:25,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11:
   kernel/bpf/syscall.c: In function 'bpf_tracing_link_release':
>> kernel/bpf/syscall.c:3513:49: error: passing argument 1 of 'bpf_trampoline_unlink_prog' from incompatible pointer type [-Wincompatible-pointer-types]
    3513 |         WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link.node,
         |                                                 ^~~~~~~~~~~~~~~~~~~
         |                                                 |
         |                                                 struct bpf_tramp_node *
   include/asm-generic/bug.h:205:32: note: in definition of macro 'WARN_ON'
     205 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   kernel/bpf/syscall.c:3513:9: note: in expansion of macro 'WARN_ON_ONCE'
    3513 |         WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link.node,
         |         ^~~~~~~~~~~~
   include/linux/bpf.h:1549:69: note: expected 'struct bpf_tramp_link *' but argument is of type 'struct bpf_tramp_node *'
    1549 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/bpf/syscall.c: In function 'bpf_tracing_prog_attach':
>> kernel/bpf/syscall.c:3745:40: error: passing argument 1 of 'bpf_trampoline_link_prog' from incompatible pointer type [-Wincompatible-pointer-types]
    3745 |         err = bpf_trampoline_link_prog(&link->link.node, tr, tgt_prog);
         |                                        ^~~~~~~~~~~~~~~~
         |                                        |
         |                                        struct bpf_tramp_node *
   include/linux/bpf.h:1543:67: note: expected 'struct bpf_tramp_link *' but argument is of type 'struct bpf_tramp_node *'
    1543 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                            ~~~~~~~~~~~~~~~~~~~~~~~^~~~


vim +/bpf_trampoline_unlink_prog +3513 kernel/bpf/syscall.c

  3507	
  3508	static void bpf_tracing_link_release(struct bpf_link *link)
  3509	{
  3510		struct bpf_tracing_link *tr_link =
  3511			container_of(link, struct bpf_tracing_link, link.link);
  3512	
> 3513		WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link.node,
  3514							tr_link->trampoline,
  3515							tr_link->tgt_prog));
  3516	
  3517		bpf_trampoline_put(tr_link->trampoline);
  3518	
  3519		/* tgt_prog is NULL if target is a kernel function */
  3520		if (tr_link->tgt_prog)
  3521			bpf_prog_put(tr_link->tgt_prog);
  3522	}
  3523	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
