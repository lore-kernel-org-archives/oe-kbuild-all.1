Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DBD158D82
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 15:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718984744; cv=none; b=D0U02yTpzV06JRo6QBA/W3TWI4xsejWBBOG2VhaWquHACxxme4FZ2/vIwM8k1PK4t+qJmt1H5Z3IWFXPlos6en5nipQekXb1ib3pOWLw98KptSubo9W8wTp6odqdTcSZKGmNpJMdegMJCMMo/JCe6bTSFo00bjqo2tNV5xzqVZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718984744; c=relaxed/simple;
	bh=4V/fxPfzmdl9IWDVtyoJCfj8ADgwZmH5R4YBAoAEet8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DCMgKj4X8x7U7ecXD5QfR9wuRXZAS/ZGYcFwiIJNr+VLSqPfGerBralFAx4WN7h15wBFp5g6wpLVq3H3Sci3HcpsTGobrPEPH3T/Z0ljjvABZBA7bB/Rz/zBk2rfnTUPdsj//L1q/GrK3wSvza9/KX/qEpt/pit+J4WG021wmLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YoQ7xGiJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YoQ7xGiJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718984742; x=1750520742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4V/fxPfzmdl9IWDVtyoJCfj8ADgwZmH5R4YBAoAEet8=;
  b=YoQ7xGiJYtj2gF1kmLYcWV6VuWdWaMdOyXuJWMMGaPbsH2XsOGvh8xBb
   Nk2g0qIUMKnwVQcUHd6TiGkxP262IbgwK7H5mi0dp0bRk9EPXRywT+gY9
   Rr7MA3YEKay2OwGE5GIKD+Br8LYnZxV2n/eKNkLSKkQTj0ne+RIR753Ku
   QlbOwk49kKEpCuqnhVqXSs8LWVr+MSYF/tPwFE1p1CRI8q1PEGljauexc
   xNCBPj+kRe9d+CCvB8AkjOTDUhRXNeqIzXCRk35MOByiLORx2him51PcQ
   l/fabDjW+Tt5F+CFOeMRijJsq2QI28sPxgFi1eKN58QAM//tSG8oDt4+5
   Q==;
X-CSE-ConnectionGUID: sXVnbqfZTrKDZ1VoYhJIWw==
X-CSE-MsgGUID: 5cYKB1sETlWYV7hRVr2OzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15855293"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="15855293"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 08:45:12 -0700
X-CSE-ConnectionGUID: GsHIdT0yQtqdUWBWIrTFVQ==
X-CSE-MsgGUID: 5pR5Np3ASImZQqAbNsFXjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="42721375"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Jun 2024 08:45:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKgRo-0008i9-1S;
	Fri, 21 Jun 2024 15:45:08 +0000
Date: Fri, 21 Jun 2024 23:44:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master 16/108] lib/closure.c:21:18: warning: format '%lu'
 expects argument of type 'long unsigned int', but argument 6 has type 'int'
Message-ID: <202406212351.m2FOlpMW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   1fc1956483665158853d3d1d5f5f54e9c0416758
commit: e5dbf4c912b9e0bae5b19460eba000bbeafc4b3f [16/108] closures: Change BUG_ON() to WARN_ON()
config: sparc64-randconfig-002-20240621 (https://download.01.org/0day-ci/archive/20240621/202406212351.m2FOlpMW-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406212351.m2FOlpMW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406212351.m2FOlpMW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/bug.h:25,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/sparc/include/asm/current.h:15,
                    from include/linux/sched.h:12,
                    from include/linux/closure.h:6,
                    from lib/closure.c:9:
   lib/closure.c: In function 'closure_put_after_sub':
>> lib/closure.c:21:18: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'int' [-Wformat=]
      21 |                  "closure has guard bits set: %x (%lu)",
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                  flags & CLOSURE_GUARD_MASK, __fls(r)))
         |                                              ~~~~~~~~
         |                                              |
         |                                              int
   include/asm-generic/bug.h:99:62: note: in definition of macro '__WARN_printf'
      99 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   lib/closure.c:20:13: note: in expansion of macro 'WARN'
      20 |         if (WARN(flags & CLOSURE_GUARD_MASK,
         |             ^~~~
   lib/closure.c:21:53: note: format string is defined here
      21 |                  "closure has guard bits set: %x (%lu)",
         |                                                   ~~^
         |                                                     |
         |                                                     long unsigned int
         |                                                   %u
   lib/closure.c:29:22: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'int' [-Wformat=]
      29 |                      "closure ref hit 0 with incorrect flags set: %x (%lu)",
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      30 |                      flags & ~CLOSURE_DESTRUCTOR, __fls(flags));
         |                                                   ~~~~~~~~~~~~
         |                                                   |
         |                                                   int
   include/asm-generic/bug.h:99:62: note: in definition of macro '__WARN_printf'
      99 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   lib/closure.c:28:17: note: in expansion of macro 'WARN'
      28 |                 WARN(flags & ~CLOSURE_DESTRUCTOR,
         |                 ^~~~
   lib/closure.c:29:73: note: format string is defined here
      29 |                      "closure ref hit 0 with incorrect flags set: %x (%lu)",
         |                                                                       ~~^
         |                                                                         |
         |                                                                         long unsigned int
         |                                                                       %u


vim +21 lib/closure.c

    15	
    16	static inline void closure_put_after_sub(struct closure *cl, int flags)
    17	{
    18		int r = flags & CLOSURE_REMAINING_MASK;
    19	
    20		if (WARN(flags & CLOSURE_GUARD_MASK,
  > 21			 "closure has guard bits set: %x (%lu)",
    22			 flags & CLOSURE_GUARD_MASK, __fls(r)))
    23			r &= ~CLOSURE_GUARD_MASK;
    24	
    25		if (!r) {
    26			smp_acquire__after_ctrl_dep();
    27	
    28			WARN(flags & ~CLOSURE_DESTRUCTOR,
    29			     "closure ref hit 0 with incorrect flags set: %x (%lu)",
    30			     flags & ~CLOSURE_DESTRUCTOR, __fls(flags));
    31	
    32			cl->closure_get_happened = false;
    33	
    34			if (cl->fn && !(flags & CLOSURE_DESTRUCTOR)) {
    35				atomic_set(&cl->remaining,
    36					   CLOSURE_REMAINING_INITIALIZER);
    37				closure_queue(cl);
    38			} else {
    39				struct closure *parent = cl->parent;
    40				closure_fn *destructor = cl->fn;
    41	
    42				closure_debug_destroy(cl);
    43	
    44				if (destructor)
    45					destructor(&cl->work);
    46	
    47				if (parent)
    48					closure_put(parent);
    49			}
    50		}
    51	}
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
