Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EFC26E6E8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jun 2025 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690234; cv=none; b=kokyO1xjKF4enRZDMZ37XRWf/QiZ7VBZilS5eRmb0cdTPsw2aPU63fZAj4FeiC8N3wE4rU7nmvU08GDY1xXAAUF75UdwBZffUySbeuK5SbR/JWodBDcKojaKmwBNYV1GJWJEPQKeivqDZTPpVP9rPoptDruj8fDgEJFptr5TRVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690234; c=relaxed/simple;
	bh=toZCzbK9U75e+9/9O6mkuIEVVG92U2rTtHTCl7wsUiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qYRePLB2ChyrgqfBar9WP+pvIJU9SWYvV/0ApQ1Mrs1iVrdQN++3tMXHfoxrkWjLICfB5MMIk9xN8UqnuGjJIEOmPBC2bo6pz0kee8Zzhr4P67I7eDCbJ+cfvwdhMdp0D2i9y/2l5ZmdzqbMvN54thYn1SWl6np5+g0NZ+B1WKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WlZW3FEy; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WlZW3FEy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750690232; x=1782226232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=toZCzbK9U75e+9/9O6mkuIEVVG92U2rTtHTCl7wsUiY=;
  b=WlZW3FEyAiyW31lYrtKbIUGTK1fw2LL/VnvOJ/79SIxnVVyepWFxGRcs
   FDUIQOKwgm2+0iWX8R9ntTLUr8yI9VJSN4tkiFZf9LFTFy5RRSNXbj/GW
   ppZpp5kGpXTnw8UuXr/ZhxDSjgJpJG+4PI5Cdo0v5QbS4h485Ez5sfAUy
   8HhTEwuUBoSH2fxYnk8bkOT+hxMiGy+kpZFlcM7UCSLq3I69wI3AHdCm3
   Vi0dUadfrfypZU8VBgGyBD1X562posGZl+FfrlqZPLyS9/cyUwqa/lUSP
   uwJ0W0QjMrGDo2ZE1C9yXjcb9BO8aGAnqfVBDVWP5P7SVDrhqciRn+DoO
   g==;
X-CSE-ConnectionGUID: qTOV3VP8QQ++kNNig4JJoA==
X-CSE-MsgGUID: DjjsU7tRQA+yADDwi58g3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56573038"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="56573038"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 07:50:32 -0700
X-CSE-ConnectionGUID: itGFDgx5QJ2HaUVd7e4LEQ==
X-CSE-MsgGUID: QW7IIK2XRlSAyDLEf/lwxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151920441"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jun 2025 07:50:31 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTiVA-000P0w-2g;
	Mon, 23 Jun 2025 14:50:28 +0000
Date: Mon, 23 Jun 2025 22:49:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_3 9/9] kernel/bpf/trampoline.c:35:12:
 warning: 'bpf_tramp_ftrace_ops_func' defined but not used
Message-ID: <202506232234.W7j9JUxn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_3
head:   35d06af545c69978148f7e43479a888892de1ed1
commit: 35d06af545c69978148f7e43479a888892de1ed1 [9/9] bpf: Remove ftrace_ops from bpf_trampoline object
config: i386-buildonly-randconfig-002-20250621 (https://download.01.org/0day-ci/archive/20250623/202506232234.W7j9JUxn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506232234.W7j9JUxn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506232234.W7j9JUxn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/trampoline.c: In function 'unregister_fentry':
   kernel/bpf/trampoline.c:174:50: error: 'struct bpf_trampoline' has no member named 'fops'
     174 |                 ret = unregister_ftrace_direct(tr->fops, (unsigned long) ip, (long)old_addr, false);
         |                                                  ^~
   kernel/bpf/trampoline.c: In function 'modify_fentry':
   kernel/bpf/trampoline.c:188:46: error: 'struct bpf_trampoline' has no member named 'fops'
     188 |                 ret = modify_ftrace_direct(tr->fops, (unsigned long) ip, (long)new_addr, lock_direct_mutex);
         |                                              ^~
   kernel/bpf/trampoline.c: In function 'register_fentry':
   kernel/bpf/trampoline.c:207:48: error: 'struct bpf_trampoline' has no member named 'fops'
     207 |                 ret = register_ftrace_direct(tr->fops, (unsigned long)ip, (long)new_addr);
         |                                                ^~
   kernel/bpf/trampoline.c: At top level:
>> kernel/bpf/trampoline.c:35:12: warning: 'bpf_tramp_ftrace_ops_func' defined but not used [-Wunused-function]
      35 | static int bpf_tramp_ftrace_ops_func(struct ftrace_ops *ops, enum ftrace_ops_cmd cmd)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_tramp_ftrace_ops_func +35 kernel/bpf/trampoline.c

00963a2e75a872 Song Liu       2022-07-19   34  
00963a2e75a872 Song Liu       2022-07-19  @35  static int bpf_tramp_ftrace_ops_func(struct ftrace_ops *ops, enum ftrace_ops_cmd cmd)
00963a2e75a872 Song Liu       2022-07-19   36  {
00963a2e75a872 Song Liu       2022-07-19   37  	struct bpf_trampoline *tr = ops->private;
00963a2e75a872 Song Liu       2022-07-19   38  	int ret = 0;
00963a2e75a872 Song Liu       2022-07-19   39  
00963a2e75a872 Song Liu       2022-07-19   40  	if (cmd == FTRACE_OPS_CMD_ENABLE_SHARE_IPMODIFY_SELF) {
00963a2e75a872 Song Liu       2022-07-19   41  		/* This is called inside register_ftrace_direct_multi(), so
00963a2e75a872 Song Liu       2022-07-19   42  		 * tr->mutex is already locked.
00963a2e75a872 Song Liu       2022-07-19   43  		 */
00963a2e75a872 Song Liu       2022-07-19   44  		lockdep_assert_held_once(&tr->mutex);
00963a2e75a872 Song Liu       2022-07-19   45  
00963a2e75a872 Song Liu       2022-07-19   46  		/* Instead of updating the trampoline here, we propagate
da8bdfbd422333 Florent Revest 2023-03-21   47  		 * -EAGAIN to register_ftrace_direct(). Then we can
da8bdfbd422333 Florent Revest 2023-03-21   48  		 * retry register_ftrace_direct() after updating the
00963a2e75a872 Song Liu       2022-07-19   49  		 * trampoline.
00963a2e75a872 Song Liu       2022-07-19   50  		 */
00963a2e75a872 Song Liu       2022-07-19   51  		if ((tr->flags & BPF_TRAMP_F_CALL_ORIG) &&
00963a2e75a872 Song Liu       2022-07-19   52  		    !(tr->flags & BPF_TRAMP_F_ORIG_STACK)) {
00963a2e75a872 Song Liu       2022-07-19   53  			if (WARN_ON_ONCE(tr->flags & BPF_TRAMP_F_SHARE_IPMODIFY))
00963a2e75a872 Song Liu       2022-07-19   54  				return -EBUSY;
00963a2e75a872 Song Liu       2022-07-19   55  
00963a2e75a872 Song Liu       2022-07-19   56  			tr->flags |= BPF_TRAMP_F_SHARE_IPMODIFY;
00963a2e75a872 Song Liu       2022-07-19   57  			return -EAGAIN;
00963a2e75a872 Song Liu       2022-07-19   58  		}
00963a2e75a872 Song Liu       2022-07-19   59  
00963a2e75a872 Song Liu       2022-07-19   60  		return 0;
00963a2e75a872 Song Liu       2022-07-19   61  	}
00963a2e75a872 Song Liu       2022-07-19   62  
00963a2e75a872 Song Liu       2022-07-19   63  	/* The normal locking order is
00963a2e75a872 Song Liu       2022-07-19   64  	 *    tr->mutex => direct_mutex (ftrace.c) => ftrace_lock (ftrace.c)
00963a2e75a872 Song Liu       2022-07-19   65  	 *
00963a2e75a872 Song Liu       2022-07-19   66  	 * The following two commands are called from
00963a2e75a872 Song Liu       2022-07-19   67  	 *
00963a2e75a872 Song Liu       2022-07-19   68  	 *   prepare_direct_functions_for_ipmodify
00963a2e75a872 Song Liu       2022-07-19   69  	 *   cleanup_direct_functions_after_ipmodify
00963a2e75a872 Song Liu       2022-07-19   70  	 *
00963a2e75a872 Song Liu       2022-07-19   71  	 * In both cases, direct_mutex is already locked. Use
00963a2e75a872 Song Liu       2022-07-19   72  	 * mutex_trylock(&tr->mutex) to avoid deadlock in race condition
00963a2e75a872 Song Liu       2022-07-19   73  	 * (something else is making changes to this same trampoline).
00963a2e75a872 Song Liu       2022-07-19   74  	 */
00963a2e75a872 Song Liu       2022-07-19   75  	if (!mutex_trylock(&tr->mutex)) {
00963a2e75a872 Song Liu       2022-07-19   76  		/* sleep 1 ms to make sure whatever holding tr->mutex makes
00963a2e75a872 Song Liu       2022-07-19   77  		 * some progress.
00963a2e75a872 Song Liu       2022-07-19   78  		 */
00963a2e75a872 Song Liu       2022-07-19   79  		msleep(1);
00963a2e75a872 Song Liu       2022-07-19   80  		return -EAGAIN;
00963a2e75a872 Song Liu       2022-07-19   81  	}
00963a2e75a872 Song Liu       2022-07-19   82  
00963a2e75a872 Song Liu       2022-07-19   83  	switch (cmd) {
00963a2e75a872 Song Liu       2022-07-19   84  	case FTRACE_OPS_CMD_ENABLE_SHARE_IPMODIFY_PEER:
00963a2e75a872 Song Liu       2022-07-19   85  		tr->flags |= BPF_TRAMP_F_SHARE_IPMODIFY;
00963a2e75a872 Song Liu       2022-07-19   86  
00963a2e75a872 Song Liu       2022-07-19   87  		if ((tr->flags & BPF_TRAMP_F_CALL_ORIG) &&
00963a2e75a872 Song Liu       2022-07-19   88  		    !(tr->flags & BPF_TRAMP_F_ORIG_STACK))
00963a2e75a872 Song Liu       2022-07-19   89  			ret = bpf_trampoline_update(tr, false /* lock_direct_mutex */);
00963a2e75a872 Song Liu       2022-07-19   90  		break;
00963a2e75a872 Song Liu       2022-07-19   91  	case FTRACE_OPS_CMD_DISABLE_SHARE_IPMODIFY_PEER:
00963a2e75a872 Song Liu       2022-07-19   92  		tr->flags &= ~BPF_TRAMP_F_SHARE_IPMODIFY;
00963a2e75a872 Song Liu       2022-07-19   93  
00963a2e75a872 Song Liu       2022-07-19   94  		if (tr->flags & BPF_TRAMP_F_ORIG_STACK)
00963a2e75a872 Song Liu       2022-07-19   95  			ret = bpf_trampoline_update(tr, false /* lock_direct_mutex */);
00963a2e75a872 Song Liu       2022-07-19   96  		break;
00963a2e75a872 Song Liu       2022-07-19   97  	default:
00963a2e75a872 Song Liu       2022-07-19   98  		ret = -EINVAL;
00963a2e75a872 Song Liu       2022-07-19   99  		break;
14250fa4839b3a Yang Li        2022-07-26  100  	}
00963a2e75a872 Song Liu       2022-07-19  101  
00963a2e75a872 Song Liu       2022-07-19  102  	mutex_unlock(&tr->mutex);
00963a2e75a872 Song Liu       2022-07-19  103  	return ret;
00963a2e75a872 Song Liu       2022-07-19  104  }
00963a2e75a872 Song Liu       2022-07-19  105  #endif
00963a2e75a872 Song Liu       2022-07-19  106  

:::::: The code at line 35 was first introduced by commit
:::::: 00963a2e75a872e5fce4d0115ac2786ec86b57a6 bpf: Support bpf_trampoline on functions with IPMODIFY (e.g. livepatch)

:::::: TO: Song Liu <song@kernel.org>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
