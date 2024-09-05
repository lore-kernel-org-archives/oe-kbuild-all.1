Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AE013A250
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 02:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725504449; cv=none; b=TnCsn9KJpJOu4/tHaH0qs1QieW8Ha7SKcdIQOytOqnalC/jOCUIPchiMeKHBwQrlXlYTtuQBCU+yvdcU4cAXnj0wNl1N6wGX1vsYv6X0jo9A4aU9h5l6S8sQ9CwsaRVurF089TXsXFizHwrAtd61Sra13sj0NxmGaSEZrvceLOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725504449; c=relaxed/simple;
	bh=fjYqVUh9lywIgj1PKuD+GzJa8OjFZmrn4BR0uh9P7Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=on+fl3vbqz3F0vzOIQaCGZKBgeWZRU+ywK7oTkDhfEnivNyKAf+0Fn0PmSQL3wku50Msfb28SB/phba3euzL5ksz5D1xpXRAHTcWF0XEc6owMIdK2RiA7COGT+qkJ2Dr50WQwo12HQZ1z3zzJuF+7+NhqIfOGLPkNjYJh9jWVxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VaD1tO1j; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VaD1tO1j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725504447; x=1757040447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fjYqVUh9lywIgj1PKuD+GzJa8OjFZmrn4BR0uh9P7Ss=;
  b=VaD1tO1jt5C/NZoX2GK10LiORxkrMiywqnIOifsNlpiEpCrk9q1Dm5WC
   LGStVvR6gR9MMWIJtHWTvAMcqO06QAKxKzI2vD4ND+ulXUQAowMKK8udV
   0XouOO7SSnbVca+lJ2X5yCOi+3oeZDkV7dtM5ZO6Kp6kdB2oIfci2zPO/
   DPMkAW1+YHo0ey6gols3idG6T3tBk7GuRRvxVpnNaE1wh1j8EMGkzbFuI
   tEn2ARI2Z/SwapUdUy3ZXBE+FVorN9kVykgvZJXI8esAybdmw4910L29L
   VU2m7DSCWYSL30aRkPQ3Sr/BNnokYhDVfdm/sfN3A00ycN7I0mAMd04kd
   Q==;
X-CSE-ConnectionGUID: 6rboNTneR1CdgLJ0aKmU+w==
X-CSE-MsgGUID: K9BfXvTtQumqAsF8rtcYKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24391709"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="24391709"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 19:47:25 -0700
X-CSE-ConnectionGUID: myPaLLdyR6OotFnU8FKjRA==
X-CSE-MsgGUID: Ab5iAA5cQZ+bIE8HSOtgAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="70273222"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Sep 2024 19:47:24 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sm2Wn-0008q3-0l;
	Thu, 05 Sep 2024 02:47:21 +0000
Date: Thu, 5 Sep 2024 10:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksa Sarai <cyphar@cyphar.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 5/8] clone3: add CHECK_FIELDS flag to usize argument
Message-ID: <202409051059.P2pkqK2s-lkp@intel.com>
References: <20240902-extensible-structs-check_fields-v1-5-545e93ede2f2@cyphar.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902-extensible-structs-check_fields-v1-5-545e93ede2f2@cyphar.com>

Hi Aleksa,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 431c1646e1f86b949fa3685efc50b660a364c2b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksa-Sarai/uaccess-add-copy_struct_to_user-helper/20240902-151229
base:   431c1646e1f86b949fa3685efc50b660a364c2b6
patch link:    https://lore.kernel.org/r/20240902-extensible-structs-check_fields-v1-5-545e93ede2f2%40cyphar.com
patch subject: [PATCH RFC 5/8] clone3: add CHECK_FIELDS flag to usize argument
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240905/202409051059.P2pkqK2s-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409051059.P2pkqK2s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409051059.P2pkqK2s-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/fork.c: In function 'copy_clone_args_from_user':
>> kernel/fork.c:2969:32: error: 'EEXTSYS_NOOP' undeclared (first use in this function)
    2969 |                 return err ?: -EEXTSYS_NOOP;
         |                                ^~~~~~~~~~~~
   kernel/fork.c:2969:32: note: each undeclared identifier is reported only once for each function it appears in


vim +/EEXTSYS_NOOP +2969 kernel/fork.c

  2930	
  2931	noinline static int copy_clone_args_from_user(struct kernel_clone_args *kargs,
  2932						      struct clone_args __user *uargs,
  2933						      size_t usize)
  2934	{
  2935		int err;
  2936		struct clone_args args;
  2937		pid_t *kset_tid = kargs->set_tid;
  2938	
  2939		BUILD_BUG_ON(offsetofend(struct clone_args, tls) !=
  2940			     CLONE_ARGS_SIZE_VER0);
  2941		BUILD_BUG_ON(offsetofend(struct clone_args, set_tid_size) !=
  2942			     CLONE_ARGS_SIZE_VER1);
  2943		BUILD_BUG_ON(offsetofend(struct clone_args, cgroup) !=
  2944			     CLONE_ARGS_SIZE_VER2);
  2945		BUILD_BUG_ON(sizeof(struct clone_args) != CLONE_ARGS_SIZE_VER2);
  2946	
  2947		if (unlikely(usize < CLONE_ARGS_SIZE_VER0))
  2948			return -EINVAL;
  2949	
  2950		if (unlikely(usize & CHECK_FIELDS)) {
  2951			usize &= ~CHECK_FIELDS;
  2952	
  2953			memset(&args, 0, sizeof(args));
  2954			args = (struct clone_args) {
  2955				.flags = CLONE3_VALID_FLAGS,
  2956				.pidfd = 0xFFFFFFFFFFFFFFFF,
  2957				.child_tid = 0xFFFFFFFFFFFFFFFF,
  2958				.parent_tid = 0xFFFFFFFFFFFFFFFF,
  2959				.exit_signal = (u64) CSIGNAL,
  2960				.stack = 0xFFFFFFFFFFFFFFFF,
  2961				.stack_size = 0xFFFFFFFFFFFFFFFF,
  2962				.tls = 0xFFFFFFFFFFFFFFFF,
  2963				.set_tid = 0xFFFFFFFFFFFFFFFF,
  2964				.set_tid_size = 0xFFFFFFFFFFFFFFFF,
  2965				.cgroup = 0xFFFFFFFFFFFFFFFF,
  2966			};
  2967	
  2968			err = copy_struct_to_user(uargs, usize, &args, sizeof(args), NULL);
> 2969			return err ?: -EEXTSYS_NOOP;
  2970		}
  2971	
  2972		if (unlikely(usize > PAGE_SIZE))
  2973			return -E2BIG;
  2974	
  2975		err = copy_struct_from_user(&args, sizeof(args), uargs, usize);
  2976		if (err)
  2977			return err;
  2978	
  2979		if (unlikely(args.set_tid_size > MAX_PID_NS_LEVEL))
  2980			return -EINVAL;
  2981	
  2982		if (unlikely(!args.set_tid && args.set_tid_size > 0))
  2983			return -EINVAL;
  2984	
  2985		if (unlikely(args.set_tid && args.set_tid_size == 0))
  2986			return -EINVAL;
  2987	
  2988		/*
  2989		 * Verify that higher 32bits of exit_signal are unset and that
  2990		 * it is a valid signal
  2991		 */
  2992		if (unlikely((args.exit_signal & ~((u64)CSIGNAL)) ||
  2993			     !valid_signal(args.exit_signal)))
  2994			return -EINVAL;
  2995	
  2996		if ((args.flags & CLONE_INTO_CGROUP) &&
  2997		    (args.cgroup > INT_MAX || usize < CLONE_ARGS_SIZE_VER2))
  2998			return -EINVAL;
  2999	
  3000		*kargs = (struct kernel_clone_args){
  3001			.flags		= args.flags,
  3002			.pidfd		= u64_to_user_ptr(args.pidfd),
  3003			.child_tid	= u64_to_user_ptr(args.child_tid),
  3004			.parent_tid	= u64_to_user_ptr(args.parent_tid),
  3005			.exit_signal	= args.exit_signal,
  3006			.stack		= args.stack,
  3007			.stack_size	= args.stack_size,
  3008			.tls		= args.tls,
  3009			.set_tid_size	= args.set_tid_size,
  3010			.cgroup		= args.cgroup,
  3011		};
  3012	
  3013		if (args.set_tid &&
  3014			copy_from_user(kset_tid, u64_to_user_ptr(args.set_tid),
  3015				(kargs->set_tid_size * sizeof(pid_t))))
  3016			return -EFAULT;
  3017	
  3018		kargs->set_tid = kset_tid;
  3019	
  3020		return 0;
  3021	}
  3022	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
