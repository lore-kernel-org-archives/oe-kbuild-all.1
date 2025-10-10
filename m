Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D0B2FBDE7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 16:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760112239; cv=none; b=R9mnjKlcShTr1nyq7X8BMx8i/nPpaBbSxF28XLwXrduKgGQX9KCTVvOf8fainN25LqyqpTNHhx5wkh9DOZM2Tuj75bKo8eox/M9yW9HMbs+pCZKt89Z2gsOgHiK5MiplnxvnBFPN9b5qOpJPaCCBNg1FaqjrLsP+Pwpb4Mo/gMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760112239; c=relaxed/simple;
	bh=3FNS9eqB9ZaMQo5W6MhyLxFt6LGTmOvn1MUj4GEd1as=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jpKOPvB7Wqj3MekckjobLFl92xwwIsdEuv1t2FBI2dGGKEjTev4qtUqIWmeWwTUDw7iYaORHfL1GHRDcmMPNFzL4InwAxPODXJ/kflttHfwJwmkM4meQOxGge+oOA8hUtkouyUCN51gBJkbjujbJ8msuSKshBoIge2p1cWdxNnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpMfUX1I; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpMfUX1I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760112238; x=1791648238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3FNS9eqB9ZaMQo5W6MhyLxFt6LGTmOvn1MUj4GEd1as=;
  b=MpMfUX1IkPsWHSWFNTMbIVWtt6nctsx2IzBLSis0jugZIhJkwb+W0/fG
   7v+PWd59dRitq81B+oyYhDZZeypNzXAzWJlVQw9zb6C8JjGHXybSR6yJB
   1wQsQOvNcYKGn5fMmn/Pkjw1o8JsrMzzLR3G8D41yV05tVS1wb15+NelT
   tL8Ow+AonpyoO53aB1Dw5t1O9+8joQ2zmas9HWgq1/jdMKQBWWfug9BHI
   Ik2atNd0HAskj/dK50vt6dYOz1l8dDfeGAjOnQy3CVWsbAD81mr84+Npy
   WW2WshwdpcsP14f2iUyIGVDrcsCCGz4KSVtG/hAhF7gPU+0D5JL9qRDSf
   A==;
X-CSE-ConnectionGUID: ZEEJ19MlQfiTU3PErFdrpA==
X-CSE-MsgGUID: tLsUBYiXRiaWjX9rtPeDLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66164314"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66164314"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 09:03:58 -0700
X-CSE-ConnectionGUID: Ajf2OlqRQkyAkGylHbGNfA==
X-CSE-MsgGUID: p992tqy6TBGYnR2B4070oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="185261395"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Oct 2025 09:03:56 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7Fb0-0002vr-0n;
	Fri, 10 Oct 2025 16:03:54 +0000
Date: Sat, 11 Oct 2025 00:03:18 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [trace:faultable-syscalls 8/9] include/linux/trace_seq.h:171:19:
 error: redefinition of 'trace_seq_pop'
Message-ID: <202510102320.VvQjyBtY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace faultable-syscalls
head:   2b3c554d04e82aaec351ffa5d6c40f3a9420bb22
commit: 1306b578ffef31ceeb6231d954934c60f3bb80ec [8/9] tracing: Add trace_seq_pop() and seq_buf_pop()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20251010/202510102320.VvQjyBtY-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510102320.VvQjyBtY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510102320.VvQjyBtY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/trace_events.h:7,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/sched.h:61,
                    from kernel/sched/rq-offsets.c:5:
>> include/linux/trace_seq.h:171:19: error: redefinition of 'trace_seq_pop'
     171 | static inline int trace_seq_pop(struct trace_seq *s)
         |                   ^~~~~~~~~~~~~
   include/linux/trace_seq.h:91:19: note: previous definition of 'trace_seq_pop' with type 'int(struct trace_seq *)'
      91 | static inline int trace_seq_pop(struct trace_seq *s)
         |                   ^~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/trace_seq_pop +171 include/linux/trace_seq.h

   139	
   140	static inline int trace_print_seq(struct seq_file *m, struct trace_seq *s)
   141	{
   142		return 0;
   143	}
   144	static inline int trace_seq_to_user(struct trace_seq *s, char __user *ubuf,
   145					    int cnt)
   146	{
   147		return 0;
   148	}
   149	static inline void trace_seq_puts(struct trace_seq *s, const char *str)
   150	{
   151	}
   152	static inline void trace_seq_putc(struct trace_seq *s, unsigned char c)
   153	{
   154	}
   155	static inline void
   156	trace_seq_putmem(struct trace_seq *s, const void *mem, unsigned int len)
   157	{
   158	}
   159	static inline void trace_seq_putmem_hex(struct trace_seq *s, const void *mem,
   160					       unsigned int len)
   161	{
   162	}
   163	static inline int trace_seq_path(struct trace_seq *s, const struct path *path)
   164	{
   165		return 0;
   166	}
   167	static inline char *trace_seq_acquire(struct trace_seq *s, unsigned int len)
   168	{
   169		return NULL;
   170	}
 > 171	static inline int trace_seq_pop(struct trace_seq *s)
   172	{
   173		return -1;
   174	}
   175	#endif /* CONFIG_TRACING */
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
