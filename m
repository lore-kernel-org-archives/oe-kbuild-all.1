Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3CE1684B0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 02:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761185008; cv=none; b=Q192064xKpslpQWcVUmMb6N59k/qQ0fUsPY5LlqktymCu0N1RmSMLnP73s33A41pOHkUQjnYBfWJUKiJQSuRdLwAneWjiLXG0vcRh0j/T9RJpwIyI5cwuAq5nTxEyg/+CGBNZtrGXIs318S54QbB9guJj2/lEK8x9b6KD8CDv1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761185008; c=relaxed/simple;
	bh=UDBkeGS/oOH6qLp90L68mPlLvmPAzTQFO2JN+rYwNwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ay9lPZYGXKYHNm5Gp8u71NM8TKoGfIBadwZcB1mrVxyV3spMOj8mXWdJTi5xZvl8+sWjSCzrd1JpaY9CqBW9jd86/oAJpvJT9A/ohSxzAWdM1ef5vKWC4hcPiriFJV3XsNILmQMWCM9+N0SOxsk8FKbBrpy/yggcDUwjAnCU8wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mglZOnZp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mglZOnZp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761185007; x=1792721007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UDBkeGS/oOH6qLp90L68mPlLvmPAzTQFO2JN+rYwNwY=;
  b=mglZOnZpgNM8LIHyBIBL27mJZwEE45ILgkUQiwCYQLNgkWg0PanlybQr
   3tsStzH95rhTPzPiVLkIunWXsii8VaMi8k10qIla699nBx4XIO57VegeU
   ug4+Io1SD22UFk73EqtV2HBzoZXc65kES4KWwvfKRqRGXVgvnIen/YGRY
   5M/jokbC05F7EDw+ekhmHPrbIiaC4OcacYNKVOTP6CqaU9xiODsIaxLKA
   GL9G16VDaMtEKlYwgLa+marwxyx0gworKqYE0uIY9rJBI6j0BzMzvPI9r
   vzrfVVz1HEdBCkQuVdgDlEsUxfRvrPlUK3NUmgXqyFKDwFVfgNOBXRBHH
   g==;
X-CSE-ConnectionGUID: JAazw6qOQ9uM05yscrYwXA==
X-CSE-MsgGUID: U67Avy7oTCuGJ/Lf4q4rPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63267050"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63267050"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 19:03:26 -0700
X-CSE-ConnectionGUID: 0a2k5RyETFyB4Dddk+GgmQ==
X-CSE-MsgGUID: Hth7pneURyOJS4UHaIY8/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="189300061"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Oct 2025 19:03:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBkfj-000Cv9-0i;
	Thu, 23 Oct 2025 02:03:23 +0000
Date: Thu, 23 Oct 2025 10:03:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/single_direct_ops 5/9]
 kernel/trace/rv/../trace.h:907:24: error: dereferencing pointer to
 incomplete type 'struct ftrace_hash'
Message-ID: <202510230939.lbLOFaf3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/single_direct_ops
head:   3d31a310468694e4395d61e15c65edaa618fbb5c
commit: f8ebea380de850914a1a05fd98c4e7c683626424 [5/9] ftrace: Export some of hash related functions
config: riscv-randconfig-001-20251023 (https://download.01.org/0day-ci/archive/20251023/202510230939.lbLOFaf3-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230939.lbLOFaf3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230939.lbLOFaf3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/rv/../trace.h:13,
                    from kernel/trace/rv/rv.h:9,
                    from kernel/trace/rv/rv.c:151:
   include/linux/ftrace.h:575:5: warning: no previous prototype for 'update_ftrace_direct_add' [-Wmissing-prototypes]
    int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
        ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:580:5: warning: no previous prototype for 'update_ftrace_direct_del' [-Wmissing-prototypes]
    int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
        ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:585:5: warning: no previous prototype for 'modify_ftrace_direct_hash' [-Wmissing-prototypes]
    int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
        ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/trace/rv/rv.h:9,
                    from kernel/trace/rv/rv.c:151:
   kernel/trace/rv/../trace.h: In function 'ftrace_hash_empty':
>> kernel/trace/rv/../trace.h:907:24: error: dereferencing pointer to incomplete type 'struct ftrace_hash'
     return !hash || !(hash->count || (hash->flags & FTRACE_HASH_FL_MOD));
                           ^~


vim +907 kernel/trace/rv/../trace.h

4046bf023b0647 Namhyung Kim            2017-01-20  904  
eb583cd484f9a7 Arnd Bergmann           2017-01-23  905  static __always_inline bool ftrace_hash_empty(struct ftrace_hash *hash)
4046bf023b0647 Namhyung Kim            2017-01-20  906  {
8c08f0d5c6fb10 Steven Rostedt (VMware  2017-06-26 @907) 	return !hash || !(hash->count || (hash->flags & FTRACE_HASH_FL_MOD));
4046bf023b0647 Namhyung Kim            2017-01-20  908  }
4046bf023b0647 Namhyung Kim            2017-01-20  909  

:::::: The code at line 907 was first introduced by commit
:::::: 8c08f0d5c6fb10ff93ffb1cbf416f4f1c3a52a80 ftrace: Have cached module filters be an active filter

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
