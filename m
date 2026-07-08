Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F2E42CB02
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 12:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513846; cv=none; b=FRIdFZYF31g3NkJfhlRyLRc9h9jJKr0avY8kjnEJiV3E7q4RelLbTfscpCJogMBuvhZdSXh0/ozDafq3DWuhu+MLV/yER9Qkig7QxUcHHZVZ/mnpkqC+Bu3PgGGc7ZgfPI3vAR/Tn3jcZGSFy7Bm1LXG+nlrdcVeW60B30VD784=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513846; c=relaxed/simple;
	bh=9LVoEupIC5pzN2PWP1VjhVI2iZ0xyckzBYzzITTQmh0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sef5G59uJ5nZziT1icKbJiuqYow8fVWSXaoeNRw4sYiOUsbLP4XpiT3pLrfqh+jx5+9EXTywUdsBSAE2RJoOfQR/Iwtk9hq1PMKkndr8eMIQ7LpvWTB3oCrefEc9DU0ewiSmRvuj5EsbgGNN9KiTUpib+nsANBVy7LuegcAoamU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D0nk/XmT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0nk/XmT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783513844; x=1815049844;
  h=date:from:to:cc:subject:message-id;
  bh=9LVoEupIC5pzN2PWP1VjhVI2iZ0xyckzBYzzITTQmh0=;
  b=D0nk/XmT9LPzK37MgO3Nod7BZYY8sJYHBQR1c7oaISmiPnDfQDaEqvxN
   IeQKegotNRvX/w21LFy5ZSusW5175HV9a87DGxh+IiUEYSl1gwosZpvSB
   irfHg876UrZ9Jn05R5ZkmSE6j0Lm8yke9sqefz8sVoOwEB2UkLnUpI33Q
   rnVfqMJKN2O4cFyC4oZIXz4lsRChZbqtYUhsfrz0McpniHYZVKqmzHWKq
   6HyZxRnMsOJahrLXbUeCOkjZxjKKpz1PHJxvJ53jZE0NurRsAXVWEt4TS
   bGwSyXI21ZV+FPvvRBGH8qfeZpFQCQ8vKlZhee4tqLsiWio8Q/tJObYTP
   Q==;
X-CSE-ConnectionGUID: b9sA8Au8QOePhS/c3L3o2w==
X-CSE-MsgGUID: 2PtpUHtVQD6hb1u5CrOjjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83952785"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83952785"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 05:30:27 -0700
X-CSE-ConnectionGUID: /+3L6hGSSQOfRd7HTfkd6A==
X-CSE-MsgGUID: j3KlBnSpTrOllu0JQOGAKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="251619089"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jul 2026 05:30:25 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whRPv-00000000GMR-33hC;
	Wed, 08 Jul 2026 12:30:20 +0000
Date: Wed, 08 Jul 2026 20:30:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-07 1/1]
 kernel/trace/bpf_trace.c:3146:13: warning: default initialization of an
 object of type 'typeof ((attr->link_create.uprobe_multi.cookies))' (aka
 'const unsigned long long') leaves the object uninitialized
Message-ID: <202607082059.PnP9KOqG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jiri,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-07
head:   d3bef8209a47d6064d1b9568f3c7a50d06fd283f
commit: 0b779b61f651851df5c5c42938a6c441eb1b5100 [1/1] bpf: Add cookies support for uprobe_multi link
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260708/202607082059.PnP9KOqG-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607082059.PnP9KOqG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0b779b61f651 ("bpf: Add cookies support for uprobe_multi link")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607082059.PnP9KOqG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/bpf_trace.c:3138:10: warning: default initialization of an object of type 'typeof ((attr->link_create.uprobe_multi.path))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
    3138 |         upath = u64_to_user_ptr(attr->link_create.uprobe_multi.path);
         |                 ^
   include/linux/kernel.h:62:2: note: expanded from macro 'u64_to_user_ptr'
      62 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   kernel/trace/bpf_trace.c:3139:13: warning: default initialization of an object of type 'typeof ((attr->link_create.uprobe_multi.offsets))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
    3139 |         uoffsets = u64_to_user_ptr(attr->link_create.uprobe_multi.offsets);
         |                    ^
   include/linux/kernel.h:62:2: note: expanded from macro 'u64_to_user_ptr'
      62 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   kernel/trace/bpf_trace.c:3145:21: warning: default initialization of an object of type 'typeof ((attr->link_create.uprobe_multi.ref_ctr_offsets))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
    3145 |         uref_ctr_offsets = u64_to_user_ptr(attr->link_create.uprobe_multi.ref_ctr_offsets);
         |                            ^
   include/linux/kernel.h:62:2: note: expanded from macro 'u64_to_user_ptr'
      62 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
>> kernel/trace/bpf_trace.c:3146:13: warning: default initialization of an object of type 'typeof ((attr->link_create.uprobe_multi.cookies))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
    3146 |         ucookies = u64_to_user_ptr(attr->link_create.uprobe_multi.cookies);
         |                    ^
   include/linux/kernel.h:62:2: note: expanded from macro 'u64_to_user_ptr'
      62 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   4 warnings generated.


vim +3146 kernel/trace/bpf_trace.c

  3107	
  3108	int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
  3109	{
  3110		struct bpf_uprobe_multi_link *link = NULL;
  3111		unsigned long __user *uref_ctr_offsets;
  3112		unsigned long *ref_ctr_offsets = NULL;
  3113		struct bpf_link_primer link_primer;
  3114		struct bpf_uprobe *uprobes = NULL;
  3115		unsigned long __user *uoffsets;
  3116		u64 __user *ucookies;
  3117		void __user *upath;
  3118		u32 flags, cnt, i;
  3119		struct path path;
  3120		char *name;
  3121		int err;
  3122	
  3123		/* no support for 32bit archs yet */
  3124		if (sizeof(u64) != sizeof(void *))
  3125			return -EOPNOTSUPP;
  3126	
  3127		if (prog->expected_attach_type != BPF_TRACE_UPROBE_MULTI)
  3128			return -EINVAL;
  3129	
  3130		flags = attr->link_create.uprobe_multi.flags;
  3131		if (flags & ~BPF_F_UPROBE_MULTI_RETURN)
  3132			return -EINVAL;
  3133	
  3134		/*
  3135		 * path, offsets and cnt are mandatory,
  3136		 * ref_ctr_offsets and cookies are optional
  3137		 */
  3138		upath = u64_to_user_ptr(attr->link_create.uprobe_multi.path);
  3139		uoffsets = u64_to_user_ptr(attr->link_create.uprobe_multi.offsets);
  3140		cnt = attr->link_create.uprobe_multi.cnt;
  3141	
  3142		if (!upath || !uoffsets || !cnt)
  3143			return -EINVAL;
  3144	
  3145		uref_ctr_offsets = u64_to_user_ptr(attr->link_create.uprobe_multi.ref_ctr_offsets);
> 3146		ucookies = u64_to_user_ptr(attr->link_create.uprobe_multi.cookies);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
