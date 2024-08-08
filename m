Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C7015E5CD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Aug 2024 22:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723155472; cv=none; b=rEAWrutXX1gTPvRippKFaQF/ti/efTc4DnFCkfP+mTah1VSSu9UiSQTttea9xAUjA228M8m/+gkLmsyqcdRgwC8joGD2UGltImsQoCq9O7EnUHSbuEPS4JRUfLLrTRg6Ik+VXvkCpJimgB6JskoZ/Nl+vvM1MLTMs4I1XPcUxis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723155472; c=relaxed/simple;
	bh=uCXaVgB3CobZA96qOIAhlM+fTsG1j9flEfkGDzZ1vN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6CdtSQV1z1E1Z/3dprlkw/hiCminbQYcwxSXr6f37zqNwoWijr257J847EqUuIWOUi6iNxQ2cFnE/yrGGfyRRiEsyEjZ1fXK3Q7cf5ib0NJBdvRfV56j3xnRYbORgIBELtTVMYGGEBkOKmCwoRuesVhHaxBIDFJLnaMcDOVPU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbjKyOFG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbjKyOFG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723155471; x=1754691471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uCXaVgB3CobZA96qOIAhlM+fTsG1j9flEfkGDzZ1vN8=;
  b=HbjKyOFGW6EJ229gbMs67t5/QYVChi9U2C6clyzGE04ZzhFsHM5E83bv
   QqwfuQmeBTh5ZZQHzGY8w2sBTmv2nJTDN5AB0SrAMaJMiGlVFCqvGgw/u
   M6wfBPweW8ByUeocY4nR51vYgkbphUFAEwLf4oGxFb6ZJ3y9neHDACfVv
   TWRe5fHdfVmhtrm/JdjRPjnC7Loy3oIAWQ7D4UJaqofPgHCPjr0MM4EHz
   uGzz2cNnbiwRVfiN4YA6VyHy/Vy761lQXOYeNx0ZgzANeLbeLpVEs8OAz
   RYNmkkcZxzHLH3YatssNm7idCj9afvM5aCHPbJFk9+F1eWIBhL5O5vBXg
   g==;
X-CSE-ConnectionGUID: z7k56FBPQZ++vwMmrPc+LQ==
X-CSE-MsgGUID: H+Iqn679TTqHowe7KxLzHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="43827902"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="43827902"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 15:17:47 -0700
X-CSE-ConnectionGUID: lhxA8DXXTFmnPvsnXeY5Qg==
X-CSE-MsgGUID: zEN2DOxERBaWdAbKD1Z0WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="57604305"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 08 Aug 2024 15:17:45 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scBS2-0006Yw-1v;
	Thu, 08 Aug 2024 22:17:42 +0000
Date: Fri, 9 Aug 2024 06:17:16 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>, Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-nfs@vger.kernel.org
Subject: Re: [PATCH] SQUASH nfsd: don't allocate the versions array
Message-ID: <202408090618.Emrg9UsT-lkp@intel.com>
References: <172298840561.6062.13050352142637689126@noble.neil.brown.name>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172298840561.6062.13050352142637689126@noble.neil.brown.name>

Hi NeilBrown,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11-rc2]
[cannot apply to next-20240808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/SQUASH-nfsd-don-t-allocate-the-versions-array/20240807-075516
base:   linus/master
patch link:    https://lore.kernel.org/r/172298840561.6062.13050352142637689126%40noble.neil.brown.name
patch subject: [PATCH] SQUASH nfsd: don't allocate the versions array
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240809/202408090618.Emrg9UsT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090618.Emrg9UsT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090618.Emrg9UsT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/nfsd/nfssvc.c:109:47: error: 'NFSD_MAXVERS' undeclared here (not in a function); did you mean 'NFS4_MAX_OPS'?
     109 | static const struct svc_version *nfsd_version[NFSD_MAXVERS+1] = {
         |                                               ^~~~~~~~~~~~
         |                                               NFS4_MAX_OPS
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/rculist.h:10,
                    from include/linux/sched/signal.h:5,
                    from fs/nfsd/nfssvc.c:10:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:243:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   fs/nfsd/nfssvc.c:120:33: note: in expansion of macro 'ARRAY_SIZE'
     120 | #define NFSD_NRVERS             ARRAY_SIZE(nfsd_version)
         |                                 ^~~~~~~~~~
   fs/nfsd/nfssvc.c:127:35: note: in expansion of macro 'NFSD_NRVERS'
     127 |         .pg_nvers               = NFSD_NRVERS,          /* nr of entries in nfsd_version */
         |                                   ^~~~~~~~~~~
   fs/nfsd/nfssvc.c: In function 'nfsd_support_version':
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:243:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   fs/nfsd/nfssvc.c:120:33: note: in expansion of macro 'ARRAY_SIZE'
     120 | #define NFSD_NRVERS             ARRAY_SIZE(nfsd_version)
         |                                 ^~~~~~~~~~
   fs/nfsd/nfssvc.c:138:44: note: in expansion of macro 'NFSD_NRVERS'
     138 |         if (vers >= NFSD_MINVERS && vers < NFSD_NRVERS)
         |                                            ^~~~~~~~~~~
   In file included from include/linux/percpu.h:5,
                    from arch/x86/include/asm/msr.h:15,
                    from arch/x86/include/asm/tsc.h:10,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/jiffies.h:10,
                    from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from include/linux/workqueue.h:9,
                    from include/linux/srcu.h:21,
                    from include/linux/notifier.h:16,
                    from arch/x86/include/asm/uprobes.h:13,
                    from include/linux/uprobes.h:49,
                    from include/linux/mm_types.h:16,
                    from arch/x86/include/asm/uaccess.h:10,
                    from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9:
   fs/nfsd/nfssvc.c: In function 'nfsd_alloc_versions':
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/alloc_tag.h:206:16: note: in definition of macro 'alloc_hooks_tag'
     206 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                ^~~~~~~~~
   include/linux/slab.h:728:49: note: in expansion of macro 'alloc_hooks'
     728 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   fs/nfsd/nfssvc.c:146:22: note: in expansion of macro 'kmalloc_array'
     146 |         bool *vers = kmalloc_array(NFSD_NRVERS, sizeof(bool), GFP_KERNEL);
         |                      ^~~~~~~~~~~~~
   include/linux/compiler.h:243:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   fs/nfsd/nfssvc.c:120:33: note: in expansion of macro 'ARRAY_SIZE'
     120 | #define NFSD_NRVERS             ARRAY_SIZE(nfsd_version)
         |                                 ^~~~~~~~~~
   fs/nfsd/nfssvc.c:146:36: note: in expansion of macro 'NFSD_NRVERS'
     146 |         bool *vers = kmalloc_array(NFSD_NRVERS, sizeof(bool), GFP_KERNEL);
         |                                    ^~~~~~~~~~~
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/alloc_tag.h:206:34: note: in definition of macro 'alloc_hooks_tag'
     206 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                                  ^~~~~~~~~
   include/linux/slab.h:728:49: note: in expansion of macro 'alloc_hooks'
     728 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   fs/nfsd/nfssvc.c:146:22: note: in expansion of macro 'kmalloc_array'
     146 |         bool *vers = kmalloc_array(NFSD_NRVERS, sizeof(bool), GFP_KERNEL);
         |                      ^~~~~~~~~~~~~
   include/linux/compiler.h:243:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   fs/nfsd/nfssvc.c:120:33: note: in expansion of macro 'ARRAY_SIZE'
     120 | #define NFSD_NRVERS             ARRAY_SIZE(nfsd_version)
         |                                 ^~~~~~~~~~
   fs/nfsd/nfssvc.c:146:36: note: in expansion of macro 'NFSD_NRVERS'
     146 |         bool *vers = kmalloc_array(NFSD_NRVERS, sizeof(bool), GFP_KERNEL);
         |                                    ^~~~~~~~~~~
>> include/linux/alloc_tag.h:212:1: warning: initialization of 'bool *' {aka '_Bool *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     212 | ({                                                                      \
         | ^
   include/linux/slab.h:728:49: note: in expansion of macro 'alloc_hooks'
     728 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   fs/nfsd/nfssvc.c:146:22: note: in expansion of macro 'kmalloc_array'
     146 |         bool *vers = kmalloc_array(NFSD_NRVERS, sizeof(bool), GFP_KERNEL);
         |                      ^~~~~~~~~~~~~
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:243:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   fs/nfsd/nfssvc.c:120:33: note: in expansion of macro 'ARRAY_SIZE'
     120 | #define NFSD_NRVERS             ARRAY_SIZE(nfsd_version)
         |                                 ^~~~~~~~~~
   fs/nfsd/nfssvc.c:151:33: note: in expansion of macro 'NFSD_NRVERS'
     151 |                 for (i = 0; i < NFSD_NRVERS; i++)
         |                                 ^~~~~~~~~~~
   fs/nfsd/nfssvc.c: In function 'nfsd_vers':
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:243:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   fs/nfsd/nfssvc.c:120:33: note: in expansion of macro 'ARRAY_SIZE'
     120 | #define NFSD_NRVERS             ARRAY_SIZE(nfsd_version)
         |                                 ^~~~~~~~~~
   fs/nfsd/nfssvc.c:194:44: note: in expansion of macro 'NFSD_NRVERS'
     194 |         if (vers < NFSD_MINVERS || vers >= NFSD_NRVERS)
         |                                            ^~~~~~~~~~~
   fs/nfsd/nfssvc.c: In function 'nfsd_reset_versions':
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:243:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   fs/nfsd/nfssvc.c:120:33: note: in expansion of macro 'ARRAY_SIZE'
     120 | #define NFSD_NRVERS             ARRAY_SIZE(nfsd_version)
         |                                 ^~~~~~~~~~
   fs/nfsd/nfssvc.c:571:25: note: in expansion of macro 'NFSD_NRVERS'
     571 |         for (i = 0; i < NFSD_NRVERS; i++)
         |                         ^~~~~~~~~~~
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:243:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   fs/nfsd/nfssvc.c:120:33: note: in expansion of macro 'ARRAY_SIZE'
     120 | #define NFSD_NRVERS             ARRAY_SIZE(nfsd_version)
         |                                 ^~~~~~~~~~
   fs/nfsd/nfssvc.c:575:25: note: in expansion of macro 'NFSD_NRVERS'
     575 |         for (i = 0; i < NFSD_NRVERS; i++)
         |                         ^~~~~~~~~~~
   fs/nfsd/nfssvc.c: In function 'nfsd_init_request':
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:243:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   fs/nfsd/nfssvc.c:120:33: note: in expansion of macro 'ARRAY_SIZE'
     120 | #define NFSD_NRVERS             ARRAY_SIZE(nfsd_version)
         |                                 ^~~~~~~~~~
   fs/nfsd/nfssvc.c:908:32: note: in expansion of macro 'NFSD_NRVERS'
     908 |         ret->mismatch.lovers = NFSD_NRVERS;
         |                                ^~~~~~~~~~~
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:243:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   fs/nfsd/nfssvc.c:120:33: note: in expansion of macro 'ARRAY_SIZE'
     120 | #define NFSD_NRVERS             ARRAY_SIZE(nfsd_version)
         |                                 ^~~~~~~~~~
   fs/nfsd/nfssvc.c:909:36: note: in expansion of macro 'NFSD_NRVERS'
     909 |         for (i = NFSD_MINVERS; i < NFSD_NRVERS; i++) {
         |                                    ^~~~~~~~~~~
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:243:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   fs/nfsd/nfssvc.c:120:33: note: in expansion of macro 'ARRAY_SIZE'
     120 | #define NFSD_NRVERS             ARRAY_SIZE(nfsd_version)
         |                                 ^~~~~~~~~~
   fs/nfsd/nfssvc.c:915:37: note: in expansion of macro 'NFSD_NRVERS'
     915 |         if (ret->mismatch.lovers == NFSD_NRVERS)
         |                                     ^~~~~~~~~~~
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:243:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   fs/nfsd/nfssvc.c:120:33: note: in expansion of macro 'ARRAY_SIZE'
     120 | #define NFSD_NRVERS             ARRAY_SIZE(nfsd_version)
         |                                 ^~~~~~~~~~
   fs/nfsd/nfssvc.c:918:18: note: in expansion of macro 'NFSD_NRVERS'
     918 |         for (i = NFSD_NRVERS - 1; i >= NFSD_MINVERS; i--) {
         |                  ^~~~~~~~~~~
   fs/nfsd/nfssvc.c: At top level:
>> fs/nfsd/nfssvc.c:109:34: warning: 'nfsd_version' defined but not used [-Wunused-variable]
     109 | static const struct svc_version *nfsd_version[NFSD_MAXVERS+1] = {
         |                                  ^~~~~~~~~~~~


vim +109 fs/nfsd/nfssvc.c

   108	
 > 109	static const struct svc_version *nfsd_version[NFSD_MAXVERS+1] = {
   110	#if defined(CONFIG_NFSD_V2)
   111		[2] = &nfsd_version2,
   112	#endif
   113		[3] = &nfsd_version3,
   114	#if defined(CONFIG_NFSD_V4)
   115		[4] = &nfsd_version4,
   116	#endif
   117	};
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
