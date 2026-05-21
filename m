Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEDA380FD8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 10:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358212; cv=none; b=GL+Yz/OddpuwktPNG/MI3quFHsUQtnvQc9+V/ZpM0OvDu8M3YloS+Bl3OiI8zQDidlYoA0dSCCEoxW/O4zBn72ojuFoUy/jNsXytDts9LC2MNvk1mLGQSvcBkBuJtztVm8KOpWViuDpRDcCm8pHo5FIKQ/qukLNCthIMJBWEUgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358212; c=relaxed/simple;
	bh=YJDuQrLTpDuDOSxXeSutQoIt7+S9K3ml3HYIo5LIl6w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FWvnkhvGK9lQ/2tsH6cvySLOsrJgDt/jb+Rlk0ts4mjtFzbo7gy2VfSGTqAqYoSHnACMNyaMA9NyDdsz8kUYa0DV12hkE2SMEfukH+zrkNzTWv3fcJtajYz9vTcsleN5y20i4jypXA0CHTrAvefxR0yJSB3i+kfpS79XufehRKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WhpJikdE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WhpJikdE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779358211; x=1810894211;
  h=date:from:to:cc:subject:message-id;
  bh=YJDuQrLTpDuDOSxXeSutQoIt7+S9K3ml3HYIo5LIl6w=;
  b=WhpJikdEgD+Z4OF8t3g0FoaB9iBkd8KL/QDrzvX0Yr8fC136AA9MNfwM
   1Jc+e3wP99WrsYqTFRkBwdwbaIpiRzPD8ZnmD2GHGtrODE5abnYlEX/t+
   nXg6e7mMMjXkGLrKQg9jWcRKwQzZSS/ghzU7zWZ6Buqklz6GMpBYTARZt
   FoJrwBScd3Tvwl5FtuOSCWtjW8n3CqbIwg7wFKa+DL8lPtOA+dvaN7wQk
   +r1CjSheMATLiXs2PMEl2ZnDFIR1Ct+l+42fA1INr5i1bS5pLlpm3EhDT
   ERgyJ/Kkage/yTAqU0HkpGwclr8elqQfyFtrnLThrJ3eJp7/XgCBn0bvW
   A==;
X-CSE-ConnectionGUID: KiH3DlmERJ+YKJ0NsITnwg==
X-CSE-MsgGUID: tw0nKWJGTqSr08wRwBtKLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91665640"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="91665640"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 03:10:10 -0700
X-CSE-ConnectionGUID: 9T5j8MYAQh63BGMdQO+/9g==
X-CSE-MsgGUID: haDv5/2RTM+b337K/iIJ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="240513727"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 May 2026 03:10:09 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ0Lu-0000000005F-0qTR;
	Thu, 21 May 2026 10:10:06 +0000
Date: Thu, 21 May 2026 18:10:05 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 462/1130]
 net/bpf/bpf_dummy_struct_ops.c:43:18: warning: cast to pointer from integer
 of different size
Message-ID: <202605211729.sQVBdZ76-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: e2a0a8156299c5b87411fce4727f2871edaccf23 [462/1130] [CHERRY-PICK] bpf: use user pointer types in uAPI structs
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260521/202605211729.sQVBdZ76-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211729.sQVBdZ76-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211729.sQVBdZ76-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bpfptr.h:6,
                    from include/linux/bpf.h:28,
                    from include/linux/bpf_verifier.h:7,
                    from net/bpf/bpf_dummy_struct_ops.c:6:
   include/linux/compat.h:1119:9: warning: 'is_compat32_task' redefined
    1119 | #define is_compat32_task() (0)
         |         ^~~~~~~~~~~~~~~~
   In file included from include/linux/compat.h:22:
   arch/mips/include/asm/compat.h:157:9: note: this is the location of the previous definition
     157 | #define is_compat32_task is_compat_task
         |         ^~~~~~~~~~~~~~~~
   net/bpf/bpf_dummy_struct_ops.c: In function 'dummy_ops_init_args':
>> net/bpf/bpf_dummy_struct_ops.c:43:18: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      43 |         ctx_in = (void __user *)kattr->test.ctx_in;
         |                  ^
   net/bpf/bpf_dummy_struct_ops.c:48:19: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      48 |         u_state = (void __user *)args->args[0];
         |                   ^
   net/bpf/bpf_dummy_struct_ops.c: In function 'dummy_ops_copy_args':
   net/bpf/bpf_dummy_struct_ops.c:63:19: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      63 |         u_state = (void __user *)args->args[0];
         |                   ^
--
   In file included from include/linux/bpfptr.h:6,
                    from include/linux/bpf.h:28,
                    from drivers/media/rc/bpf-lirc.c:6:
   include/linux/compat.h:1119:9: warning: 'is_compat32_task' redefined
    1119 | #define is_compat32_task() (0)
         |         ^~~~~~~~~~~~~~~~
   In file included from include/linux/compat.h:22:
   arch/mips/include/asm/compat.h:157:9: note: this is the location of the previous definition
     157 | #define is_compat32_task is_compat_task
         |         ^~~~~~~~~~~~~~~~
   drivers/media/rc/bpf-lirc.c: In function 'lirc_prog_query':
>> drivers/media/rc/bpf-lirc.c:297:34: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     297 |         __u32 __user *prog_ids = (__u32 __user *)attr->query.prog_ids;
         |                                  ^


vim +43 net/bpf/bpf_dummy_struct_ops.c

    26	
    27	static struct bpf_dummy_ops_test_args *
    28	dummy_ops_init_args(const union bpf_attr *kattr, unsigned int nr)
    29	{
    30		__u32 size_in;
    31		struct bpf_dummy_ops_test_args *args;
    32		void __user *ctx_in;
    33		void __user *u_state;
    34	
    35		size_in = kattr->test.ctx_size_in;
    36		if (size_in != sizeof(u64) * nr)
    37			return ERR_PTR(-EINVAL);
    38	
    39		args = kzalloc(sizeof(*args), GFP_KERNEL);
    40		if (!args)
    41			return ERR_PTR(-ENOMEM);
    42	
  > 43		ctx_in = (void __user *)kattr->test.ctx_in;
    44		if (copy_from_user(args->args, ctx_in, size_in))
    45			goto out;
    46	
    47		/* args[0] is 0 means state argument of test_N will be NULL */
    48		u_state = (void __user *)args->args[0];
    49		if (u_state && copy_from_user(&args->state, u_state,
    50					      sizeof(args->state)))
    51			goto out;
    52	
    53		return args;
    54	out:
    55		kfree(args);
    56		return ERR_PTR(-EFAULT);
    57	}
    58	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
