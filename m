Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7438282E2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Aug 2024 07:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723534217; cv=none; b=hn72k/c6JLtXwCAQ9/5sQLK8kohJzh8qe8Fk6lPQtcBQRMHD2izOIGbfH40DMnsanTAOyU+YxL9S6wK+KqBLjMzOX3gqhVYjO1K2BgpiHFnnfCByErFInh5mOYnYfI4W6liF37skkHg14v9Z5hoeYy2ybl14fvvOVsJ5SGqbX2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723534217; c=relaxed/simple;
	bh=YY9s0IzOzjODQ9cNGnvgp37qD5r3ZCgWEHfWLesMFE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKC7jwULekZWkj4Bd7t7s0ujEL+lzEnA8+kwybgtVEt/dBcqaUoddeNKxCh7uWRWOqnDsFeeZCm/Y629Ni04Px9Sfz40aQmxbOfiAzoz5Esr1nFaSqPhMixRZ5BwpFiXJJ9SPMafDo5n9K7zjoIAFOQYhRu4jx54ik2YnhIgZaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bM9Rbp4f; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bM9Rbp4f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723534215; x=1755070215;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YY9s0IzOzjODQ9cNGnvgp37qD5r3ZCgWEHfWLesMFE0=;
  b=bM9Rbp4fQtNu4vNYXJNQY7sDqI8NueyGuDswBBVluR/nQGbm7E7qHGdq
   LH2eNyVtW+niU3sBi+1gGpqForDbMDkX3HhNTkaUZ3XzGjs6OYvG/s+yr
   i3C0wA6nZ7B4YJEacWABAuBxTHnOIgbUIFXQVWVmAp9+NYHDo0VA+p73B
   U30T3iEV/QqRyjrj7joGarZuRz1bb2suxwPNKS2XVnimvVjUfOsn8OxNm
   uIOScI8K7aS3UCCaNm54qGfk/GZFN3SMYqfMu7tShTZLkaedjzlAfgDls
   Ngi7TLmSApBxlorA7/zr91SZJc9T1jW8fflQNeoSWXlY8c80tQfbHrNlt
   Q==;
X-CSE-ConnectionGUID: ror9FpfORZWvJchYmIziZw==
X-CSE-MsgGUID: lvW8O23/SsC7Rn/rSvwZWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21239070"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21239070"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 00:30:14 -0700
X-CSE-ConnectionGUID: l67S+55ZQTS389Yy9e4Vvw==
X-CSE-MsgGUID: gs/ceP0qRY6yqarZJ9rx3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="96119419"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Aug 2024 00:30:12 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdlys-0000Gg-0w;
	Tue, 13 Aug 2024 07:30:10 +0000
Date: Tue, 13 Aug 2024 15:29:31 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Damato <jdamato@fastly.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 5/5] eventpoll: Control irq suspension for
 prefer_busy_poll
Message-ID: <202408131513.0GyuANII-lkp@intel.com>
References: <20240812125717.413108-6-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812125717.413108-6-jdamato@fastly.com>

Hi Joe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Joe-Damato/net-Add-sysfs-parameter-irq_suspend_timeout/20240812-210114
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240812125717.413108-6-jdamato%40fastly.com
patch subject: [RFC net-next 5/5] eventpoll: Control irq suspension for prefer_busy_poll
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240813/202408131513.0GyuANII-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408131513.0GyuANII-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408131513.0GyuANII-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/eventpoll.c: In function 'ep_free':
>> fs/eventpoll.c:805:44: error: 'struct eventpoll' has no member named 'napi_id'
     805 |         unsigned int napi_id = READ_ONCE(ep->napi_id);
         |                                            ^~
   include/linux/compiler_types.h:490:23: note: in definition of macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/eventpoll.c:805:32: note: in expansion of macro 'READ_ONCE'
     805 |         unsigned int napi_id = READ_ONCE(ep->napi_id);
         |                                ^~~~~~~~~
>> fs/eventpoll.c:805:44: error: 'struct eventpoll' has no member named 'napi_id'
     805 |         unsigned int napi_id = READ_ONCE(ep->napi_id);
         |                                            ^~
   include/linux/compiler_types.h:490:23: note: in definition of macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/eventpoll.c:805:32: note: in expansion of macro 'READ_ONCE'
     805 |         unsigned int napi_id = READ_ONCE(ep->napi_id);
         |                                ^~~~~~~~~
>> fs/eventpoll.c:805:44: error: 'struct eventpoll' has no member named 'napi_id'
     805 |         unsigned int napi_id = READ_ONCE(ep->napi_id);
         |                                            ^~
   include/linux/compiler_types.h:490:23: note: in definition of macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/eventpoll.c:805:32: note: in expansion of macro 'READ_ONCE'
     805 |         unsigned int napi_id = READ_ONCE(ep->napi_id);
         |                                ^~~~~~~~~
>> fs/eventpoll.c:805:44: error: 'struct eventpoll' has no member named 'napi_id'
     805 |         unsigned int napi_id = READ_ONCE(ep->napi_id);
         |                                            ^~
   include/linux/compiler_types.h:490:23: note: in definition of macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/eventpoll.c:805:32: note: in expansion of macro 'READ_ONCE'
     805 |         unsigned int napi_id = READ_ONCE(ep->napi_id);
         |                                ^~~~~~~~~
>> fs/eventpoll.c:805:44: error: 'struct eventpoll' has no member named 'napi_id'
     805 |         unsigned int napi_id = READ_ONCE(ep->napi_id);
         |                                            ^~
   include/linux/compiler_types.h:490:23: note: in definition of macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/eventpoll.c:805:32: note: in expansion of macro 'READ_ONCE'
     805 |         unsigned int napi_id = READ_ONCE(ep->napi_id);
         |                                ^~~~~~~~~
>> fs/eventpoll.c:805:44: error: 'struct eventpoll' has no member named 'napi_id'
     805 |         unsigned int napi_id = READ_ONCE(ep->napi_id);
         |                                            ^~
   include/linux/compiler_types.h:466:27: note: in definition of macro '__unqual_scalar_typeof'
     466 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   fs/eventpoll.c:805:32: note: in expansion of macro 'READ_ONCE'
     805 |         unsigned int napi_id = READ_ONCE(ep->napi_id);
         |                                ^~~~~~~~~
   In file included from ./arch/openrisc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:314,
                    from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from fs/eventpoll.c:9:
>> fs/eventpoll.c:805:44: error: 'struct eventpoll' has no member named 'napi_id'
     805 |         unsigned int napi_id = READ_ONCE(ep->napi_id);
         |                                            ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   fs/eventpoll.c:805:32: note: in expansion of macro 'READ_ONCE'
     805 |         unsigned int napi_id = READ_ONCE(ep->napi_id);
         |                                ^~~~~~~~~
>> fs/eventpoll.c:807:51: error: 'struct eventpoll' has no member named 'prefer_busy_poll'
     807 |         if (napi_id >= MIN_NAPI_ID && READ_ONCE(ep->prefer_busy_poll))
         |                                                   ^~
   include/linux/compiler_types.h:490:23: note: in definition of macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/eventpoll.c:807:39: note: in expansion of macro 'READ_ONCE'
     807 |         if (napi_id >= MIN_NAPI_ID && READ_ONCE(ep->prefer_busy_poll))
         |                                       ^~~~~~~~~
>> fs/eventpoll.c:807:51: error: 'struct eventpoll' has no member named 'prefer_busy_poll'
     807 |         if (napi_id >= MIN_NAPI_ID && READ_ONCE(ep->prefer_busy_poll))
         |                                                   ^~
   include/linux/compiler_types.h:490:23: note: in definition of macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/eventpoll.c:807:39: note: in expansion of macro 'READ_ONCE'
     807 |         if (napi_id >= MIN_NAPI_ID && READ_ONCE(ep->prefer_busy_poll))
         |                                       ^~~~~~~~~
>> fs/eventpoll.c:807:51: error: 'struct eventpoll' has no member named 'prefer_busy_poll'
     807 |         if (napi_id >= MIN_NAPI_ID && READ_ONCE(ep->prefer_busy_poll))
         |                                                   ^~
   include/linux/compiler_types.h:490:23: note: in definition of macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/eventpoll.c:807:39: note: in expansion of macro 'READ_ONCE'
     807 |         if (napi_id >= MIN_NAPI_ID && READ_ONCE(ep->prefer_busy_poll))
         |                                       ^~~~~~~~~
>> fs/eventpoll.c:807:51: error: 'struct eventpoll' has no member named 'prefer_busy_poll'
     807 |         if (napi_id >= MIN_NAPI_ID && READ_ONCE(ep->prefer_busy_poll))
         |                                                   ^~
   include/linux/compiler_types.h:490:23: note: in definition of macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/eventpoll.c:807:39: note: in expansion of macro 'READ_ONCE'
     807 |         if (napi_id >= MIN_NAPI_ID && READ_ONCE(ep->prefer_busy_poll))
         |                                       ^~~~~~~~~
>> fs/eventpoll.c:807:51: error: 'struct eventpoll' has no member named 'prefer_busy_poll'
     807 |         if (napi_id >= MIN_NAPI_ID && READ_ONCE(ep->prefer_busy_poll))
         |                                                   ^~
   include/linux/compiler_types.h:490:23: note: in definition of macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/eventpoll.c:807:39: note: in expansion of macro 'READ_ONCE'
     807 |         if (napi_id >= MIN_NAPI_ID && READ_ONCE(ep->prefer_busy_poll))
         |                                       ^~~~~~~~~
>> fs/eventpoll.c:807:51: error: 'struct eventpoll' has no member named 'prefer_busy_poll'
     807 |         if (napi_id >= MIN_NAPI_ID && READ_ONCE(ep->prefer_busy_poll))
         |                                                   ^~
   include/linux/compiler_types.h:466:27: note: in definition of macro '__unqual_scalar_typeof'
     466 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   fs/eventpoll.c:807:39: note: in expansion of macro 'READ_ONCE'
     807 |         if (napi_id >= MIN_NAPI_ID && READ_ONCE(ep->prefer_busy_poll))
         |                                       ^~~~~~~~~
>> fs/eventpoll.c:807:51: error: 'struct eventpoll' has no member named 'prefer_busy_poll'
     807 |         if (napi_id >= MIN_NAPI_ID && READ_ONCE(ep->prefer_busy_poll))
         |                                                   ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   fs/eventpoll.c:807:39: note: in expansion of macro 'READ_ONCE'
     807 |         if (napi_id >= MIN_NAPI_ID && READ_ONCE(ep->prefer_busy_poll))
         |                                       ^~~~~~~~~
>> fs/eventpoll.c:808:17: error: implicit declaration of function 'napi_resume_irqs' [-Wimplicit-function-declaration]
     808 |                 napi_resume_irqs(napi_id);
         |                 ^~~~~~~~~~~~~~~~


vim +805 fs/eventpoll.c

   802	
   803	static void ep_free(struct eventpoll *ep)
   804	{
 > 805		unsigned int napi_id = READ_ONCE(ep->napi_id);
   806	
 > 807		if (napi_id >= MIN_NAPI_ID && READ_ONCE(ep->prefer_busy_poll))
 > 808			napi_resume_irqs(napi_id);
   809		mutex_destroy(&ep->mtx);
   810		free_uid(ep->user);
   811		wakeup_source_unregister(ep->ws);
   812		kfree(ep);
   813	}
   814	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
