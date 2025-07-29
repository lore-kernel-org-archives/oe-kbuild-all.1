Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F18C264F8A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 10:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753785277; cv=none; b=gTUciZ1OO7fqMmdO2SrqNwAxgP0KqH+E8lLgFnAuZuB3IPR+KqIp5T4mEIZ7VF4nZGqCM2uUDcXZHrUQN+OZ4FLaDBUfAL81V0esy8s/gw6fu5sXuZDmIGlRX7+sJZTwocNMDw99xd050VZYX2CSw0HYRgcllic624f643x2uzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753785277; c=relaxed/simple;
	bh=diRkQCL+1zrvYLduh8rkZtia//sq9ClK8OnrgorY/4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZmfPGB9pfca647sDXD69L7jFWtu1rngVY+PWNWSB98YZ2udZwNA1eeTmQHq6zvWjoDeh5kkrpgeC4HyMLCF9ww9laTG7GSLWq/ebhTjkxMbjcRN7aFuzEVsJsrwOyFti5lJi2H/8XzDsqBI7hBt8kjdL4yEZDswh3WGJlmnj9tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jPG1UtZY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jPG1UtZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753785276; x=1785321276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=diRkQCL+1zrvYLduh8rkZtia//sq9ClK8OnrgorY/4Q=;
  b=jPG1UtZY0ISkTN1ykBuy5yDvL6geYfyBMi/ahE2f6qAo1Sj85Kj3rjWk
   Uf/ci3CU3YgLgH0CPTkwa+hUdAiSOniombn1II/vb/BJ9RyOYir/ri3Ip
   rGJ0A9X2mhyXAeLhzneCXRRzzz4SLXQDszXuvPo2BAtHUXQ+j0Degrvgf
   jnUjtjBW1XA0Tu9XW+u7BepeeHPdYtsiFZgu3yn3kPIILLO26ANSNTrVZ
   D3f/stIz4O9KaMdOFHHMfcPc9NaTjmCFeA6WGsUrpNk+A7DrrJyFSzMGl
   NPcpotT8VakuQEu068LTt+adGNF3EmK11pUk/7O4LPHHzdI1iUkdy+bTy
   w==;
X-CSE-ConnectionGUID: cN9UiRldSLOZV+jUhq9fCw==
X-CSE-MsgGUID: PIGggnE2ShuGdwQ62vbrOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="56020959"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="56020959"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 03:34:35 -0700
X-CSE-ConnectionGUID: ymB73beiRWuEXoj41dXqYw==
X-CSE-MsgGUID: BfgulAbzQTiuuVlhjqWYGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="163010972"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 29 Jul 2025 03:34:33 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ughfD-0000db-12;
	Tue, 29 Jul 2025 10:34:31 +0000
Date: Tue, 29 Jul 2025 12:34:04 +0200
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/92] net/bpf/bpf_dummy_struct_ops.c:36:11:
 warning: default initialization of an object of type 'typeof
 ((kattr->test.ctx_in))' (aka 'const unsigned long long') leaves the object
 uninitialized
Message-ID: <202507291249.2TD46HJE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   c71e88ad12bfbc44f855b681ef923e1acc2e984a
commit: 4f78bb6527470bdf3309b62e7767279657a265c0 [0/92] bpf: Add dummy BPF STRUCT_OPS for test purpose
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250729/202507291249.2TD46HJE-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507291249.2TD46HJE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507291249.2TD46HJE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/bpf/bpf_dummy_struct_ops.c:36:11: warning: default initialization of an object of type 'typeof ((kattr->test.ctx_in))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
      36 |         ctx_in = u64_to_user_ptr(kattr->test.ctx_in);
         |                  ^
   include/linux/kernel.h:50:2: note: expanded from macro 'u64_to_user_ptr'
      50 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   1 warning generated.


vim +36 net/bpf/bpf_dummy_struct_ops.c

    19	
    20	static struct bpf_dummy_ops_test_args *
    21	dummy_ops_init_args(const union bpf_attr *kattr, unsigned int nr)
    22	{
    23		__u32 size_in;
    24		struct bpf_dummy_ops_test_args *args;
    25		void __user *ctx_in;
    26		void __user *u_state;
    27	
    28		size_in = kattr->test.ctx_size_in;
    29		if (size_in != sizeof(u64) * nr)
    30			return ERR_PTR(-EINVAL);
    31	
    32		args = kzalloc(sizeof(*args), GFP_KERNEL);
    33		if (!args)
    34			return ERR_PTR(-ENOMEM);
    35	
  > 36		ctx_in = u64_to_user_ptr(kattr->test.ctx_in);
    37		if (copy_from_user(args->args, ctx_in, size_in))
    38			goto out;
    39	
    40		/* args[0] is 0 means state argument of test_N will be NULL */
    41		u_state = u64_to_user_ptr(args->args[0]);
    42		if (u_state && copy_from_user(&args->state, u_state,
    43					      sizeof(args->state)))
    44			goto out;
    45	
    46		return args;
    47	out:
    48		kfree(args);
    49		return ERR_PTR(-EFAULT);
    50	}
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
