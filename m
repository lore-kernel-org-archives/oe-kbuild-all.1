Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEC83B840B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 15:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756443; cv=none; b=e2R5wKGQFmIwbCLSdm3RQ8rxiow76+wVqSTnWtG5EAVAk3oSgYX5o7UVEpkL6PUvS+HkZ9YrlKZ7fYpvUReCdPW2ExtMgazx2AveCOxybvAn6p4ptenyLfE+VdyRPo4DafeWPgpuHZ63KL4Qq1lF57MNWsI+vyeT7qt0WFd5F+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756443; c=relaxed/simple;
	bh=rqSKNCrUwy0ETAnorvduwfOPd4TNkFqQLTXg4sBUpxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ETKMUtltVIuJ+MCwMM5lATLDUKCHIutz6H/bQqdYuSAph+Ht6bsl5jLXVrUVY8/IoZAOvHJRVFtm9pLcElrQdhvEQ9eTmCQECVqwEAnJGqDJ5DDPIG1j61uXfvhIqesjJZIH+tWA56tBo7WCJnVbWput5CX5JRXKcxtT6slr/gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oj5lFiYx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oj5lFiYx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787756442; x=1819292442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rqSKNCrUwy0ETAnorvduwfOPd4TNkFqQLTXg4sBUpxU=;
  b=Oj5lFiYxaRxPRb4D46MvBqSRsEd3C6ApOsun9AFA74kKIiNaaeOQ3+Rw
   LY9RtNztQPQh2MgHoWnRanaSpG7/Dv98h5/nHJrjD5pe0hA+60259qPWx
   4VHjZi8A384589Hut+VzxZHQXXc2V0Y9MJS9sPlEzHWFU1KMvzfzQMFQl
   exUi5yl7bxPwrRVeU26cVUNY3RJUJ8bVR1wGlhnBCR42NRmxA4T9oofT0
   Laa1uQokoiwAdGwdZhyXnMHjH0Y1sxWiPPsGkGsAIrXO06kqW+SM9fIxr
   1elElEA/JjkgoW4TjsR9jFLlSixFGqyPKnzGrP3We1RGBnkbOX/7etz5s
   g==;
X-CSE-ConnectionGUID: bbU4bzHpTzKHdnmcY2S9bw==
X-CSE-MsgGUID: 8rwrb+dMQrmIo73EGDZf8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="87182500"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="87182500"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 08:00:41 -0700
X-CSE-ConnectionGUID: l3wpOPR6QuWQ7VhJcMxUaA==
X-CSE-MsgGUID: Tvt/d4coTMe3dK5KLHokFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="271100452"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Aug 2026 08:00:39 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzF7F-000000007bF-1mKW;
	Wed, 26 Aug 2026 15:00:37 +0000
Date: Wed, 26 Aug 2026 23:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 41/41]
 kernel/time/timekeeping.c:148:54: warning: integer overflow in expression of
 type 'long int' results in '568041472'
Message-ID: <202608262236.Pb5WjY8b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   87c2db12ba44bf5bea44868e32bd8df048af5586
commit: 87c2db12ba44bf5bea44868e32bd8df048af5586 [41/41] reciprocal
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260826/202608262236.Pb5WjY8b-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260826/202608262236.Pb5WjY8b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608262236.Pb5WjY8b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/nodemask.h:92,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/interrupt_rc.h:17,
                    from include/linux/spinlock.h:60,
                    from include/linux/sched.h:38,
                    from include/linux/audit.h:12,
                    from kernel/time/timekeeping.c:6:
   kernel/time/timekeeping.c: In function 'ktime_mono_from_to_aux':
>> kernel/time/timekeeping.c:148:54: warning: integer overflow in expression of type 'long int' results in '568041472' [-Woverflow]
     148 | #define TK_AUX_MONO_CONV_MAX_DELTA_NS           (400 * NSEC_PER_SEC)
         |                                                      ^
   include/linux/minmax.h:187:21: note: in definition of macro '__clamp_once'
     187 |         type uhi = (hi);                                                        \
         |                     ^~
   include/linux/minmax.h:206:28: note: in expansion of macro '__careful_clamp'
     206 | #define clamp(val, lo, hi) __careful_clamp(auto, val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   kernel/time/timekeeping.c:185:22: note: in expansion of macro 'clamp'
     185 |         this_delta = clamp(this_delta, 0, TK_AUX_MONO_CONV_MAX_DELTA_NS);
         |                      ^~~~~
   kernel/time/timekeeping.c:185:43: note: in expansion of macro 'TK_AUX_MONO_CONV_MAX_DELTA_NS'
     185 |         this_delta = clamp(this_delta, 0, TK_AUX_MONO_CONV_MAX_DELTA_NS);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/timekeeping.c: In function 'tk_aux_mono_conv_too_old':
   kernel/time/timekeeping.c:149:54: warning: integer overflow in expression of type 'long int' results in '-647710720' [-Woverflow]
     149 | #define TK_AUX_MONO_CONV_FORCE_UPDATE_DELTA_NS  (300 * NSEC_PER_SEC)
         |                                                      ^
   kernel/time/timekeeping.c:234:61: note: in expansion of macro 'TK_AUX_MONO_CONV_FORCE_UPDATE_DELTA_NS'
     234 |         return ktime_sub(mono_now, mono_conv->mono_base) >= TK_AUX_MONO_CONV_FORCE_UPDATE_DELTA_NS;
         |                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +148 kernel/time/timekeeping.c

    84	
    85	/*
    86	 * Conversion between auxiliary and monotonic clock timestamps.
    87	 *
    88	 * ktime_mono_to_aux() and ktime_aux_to_mono() utilize conversion factors
    89	 * for converting from one clock to another. These conversion factors are
    90	 * updated periodically and are based on a common base time stamp derived
    91	 * from a clocksource readout:
    92	 *
    93	 *     cs_base	   = read_clock()
    94	 *     mono_base_ns  = tk_cs_to_ns(MONO, cs_base)
    95	 *     aux_base_ns   = tk_cs_to_ns(AUX, cs_base)
    96	 *
    97	 * The progression of the clocks relative to the base time is determined
    98	 * by their conversion factors, which are constant for a given conversion
    99	 * period:
   100	 *
   101	 *     cs_delta = read_clock() - cs_base
   102	 *     delta_mono_ns = cs_delta * fMONO
   103	 *     delta_aux_ns  = cs_delta * fAUX
   104	 *
   105	 * Ergo:
   106	 *
   107	 *     delta_mono_ns - delta_aux_ns = cs_delta * (fMONO - fAUX)
   108	 *
   109	 * Substituting cs_delta yields:
   110	 *                                                    fMONO - fAUX
   111	 *     delta_mono_ns - delta_aux_ns = delta_mono_ns * ------------
   112	 *                                                       fMONO
   113	 * Resolving to delta_aux_ns:
   114	 *                                                    fMONO - fAUX
   115	 *     delta_aux_ns = delta_mono_ns - delta_mono_ns * ------------
   116	 *                                                       fMONO
   117	 * Which simplifies to:
   118	 *                                    fAUX
   119	 *     delta_aux_ns = delta_mono_ns * -----
   120	 *                                    fMONO
   121	 *
   122	 * So a MONOTONIC time value can be converted to an AUX time value by:
   123	 *
   124	 *                                                 fAUX
   125	 *     aux_ts = aux_base + (mono_ts - mono_base) * -----
   126	 *                                                 fMONO
   127	 * The opposite conversion is:
   128	 *                                                 fMONO
   129	 *     mono_ts = mono_base + (aux_ts - aux_base) * -----
   130	 *                                                 fAUX
   131	 *
   132	 * To avoid a division the ratios are converted to scaled math. As both
   133	 * factors are guaranteed to have the same scaled math shift value the
   134	 * ratio is the ratio of the scaled math multipliers:
   135	 *
   136	 *     conv_mult_aux = (AUX_mult << conv_shift) / MONO_mult
   137	 *     conv_mult_mono = (MONO_mult << conv_shift) / AUX_mult
   138	 *
   139	 * The actual conversions become:
   140	 *
   141	 *     aux_ts = aux_base + (((mono_ts - mono_base) * conv_mult_aux) >> conv_shift)
   142	 *     mono_ts = mono_base + (((aux_ts - aux_base) * conv_mult_mono) >> conv_shift)
   143	 */
   144	
   145	#define TK_AUX_UPDATE_DEVIATION_THRESHOLD_NS 25
   146	#define TK_AUX_MONO_CONV_SHIFT			24
   147	/* Together 700 seconds */
 > 148	#define TK_AUX_MONO_CONV_MAX_DELTA_NS		(400 * NSEC_PER_SEC)
   149	#define TK_AUX_MONO_CONV_FORCE_UPDATE_DELTA_NS	(300 * NSEC_PER_SEC)
   150	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
