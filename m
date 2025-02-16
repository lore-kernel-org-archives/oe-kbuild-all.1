Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3737E19A298
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 16:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739722530; cv=none; b=O9xG0qIYhuWmwiPrG8J/ahS0rRmIU2y2iEvVe+c2JWgaJo6iZu1yIiNFHTma4jr9243aLcYjlRiAar26Sw6LbTaDDNtPvjosj8mgVuLKE+92ynqBzZPCEBq2EHuHpjcYTjQsV5p8nJutxxeGhMtK/2XcX96T+lbMQX747e91Gxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739722530; c=relaxed/simple;
	bh=dnwfio05cXmMw96Kd4ju1kYi7a0zTl5aF7AWzvHjiME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FdWPfuSZbdT1mH7Clj1adNyqVn8XEPL4ZEIhmdmgAD8C0tpnWJw6f0gigGSYGuQEjN2FUsrDIQHxC9MOYb9WflN7OduLlN+iDBdDQ01Y1KM3MjsN0weYd/nBxNEcY6/Qd6pytzeNahKMNnCZogZMv4Y9Ecomzm9rdiW9aQcOVyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJLxMiUZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJLxMiUZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739722528; x=1771258528;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dnwfio05cXmMw96Kd4ju1kYi7a0zTl5aF7AWzvHjiME=;
  b=kJLxMiUZQQmW/ZufTPZ3WJct0eespjqGv8myKgtiyF/P6Ev/wk/kQx4a
   6j8olExgGy6ze1MwOufJGIhzVhTajt/GBEk8nh2pz3bp8zg8zZyCA8/1D
   ve6PU33MtaJ6eO4tKwX2StHoSoUdUMcZgpI3hVb+tuc3ZkpVJHa2s+6xA
   5NcBA+ENFmIUnnU7KqUKxtBlVEGmGhAxsAgFGmT4kAilBUuadMwNCdu0I
   j3wToY+GDWWYtMco8vqah1KfNr/GiJGCDdLeeHk5EOpaUw/YKVw159yrT
   gBT6186s+BtT1W+hCYR6qrcfwrGKp1Wo8sOn1bodsWgCnB2zSv6Rdp6T4
   g==;
X-CSE-ConnectionGUID: ZzEXL6fbSiexNadlT3rzPQ==
X-CSE-MsgGUID: mcqzpg8mSWKoHbwcvAtH9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="51037240"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="51037240"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 08:15:27 -0800
X-CSE-ConnectionGUID: 5rayKRGNRQGcGGkjN+dcjw==
X-CSE-MsgGUID: mkNBYH+zR7+DA3JocE57TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119130941"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Feb 2025 08:15:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjhIi-001C3P-0l;
	Sun, 16 Feb 2025 16:15:24 +0000
Date: Mon, 17 Feb 2025 00:14:30 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v10 17/18] mm: make vma cache SLAB_TYPESAFE_BY_RCU
Message-ID: <202502170049.sHfzQwpv-lkp@intel.com>
References: <20250213224655.1680278-18-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213224655.1680278-18-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build errors:

[auto build test ERROR on 47aa60e930fe7fc2a945e4406e3ad1dfa73bb47c]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/mm-introduce-vma_start_read_locked-_nested-helpers/20250214-065025
base:   47aa60e930fe7fc2a945e4406e3ad1dfa73bb47c
patch link:    https://lore.kernel.org/r/20250213224655.1680278-18-surenb%40google.com
patch subject: [PATCH v10 17/18] mm: make vma cache SLAB_TYPESAFE_BY_RCU
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502170049.sHfzQwpv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502170049.sHfzQwpv-lkp@intel.com/

All errors (new ones prefixed by >>):

     PERF_VERSION = 6.14.rc2.g7bbff59cf631
   In file included from cpumap.c:5:
   tools/include/linux/refcount.h: In function 'refcount_set_release':
>> tools/include/linux/refcount.h:65:9: error: implicit declaration of function 'atomic_set_release'; did you mean 'refcount_set_release'? [-Werror=implicit-function-declaration]
      65 |         atomic_set_release(&r->refs, n);
         |         ^~~~~~~~~~~~~~~~~~
         |         refcount_set_release
>> tools/include/linux/refcount.h:65:9: error: nested extern declaration of 'atomic_set_release' [-Werror=nested-externs]
   In file included from threadmap.c:4:
   tools/include/linux/refcount.h: In function 'refcount_set_release':
>> tools/include/linux/refcount.h:65:9: error: implicit declaration of function 'atomic_set_release'; did you mean 'refcount_set_release'? [-Werror=implicit-function-declaration]
      65 |         atomic_set_release(&r->refs, n);
         |         ^~~~~~~~~~~~~~~~~~
         |         refcount_set_release
>> tools/include/linux/refcount.h:65:9: error: nested extern declaration of 'atomic_set_release' [-Werror=nested-externs]
   In file included from tools/lib/perf/include/internal/cpumap.h:5,
                    from tools/lib/perf/include/internal/evlist.h:7,
                    from evlist.c:8:
   tools/include/linux/refcount.h: In function 'refcount_set_release':
>> tools/include/linux/refcount.h:65:9: error: implicit declaration of function 'atomic_set_release'; did you mean 'refcount_set_release'? [-Werror=implicit-function-declaration]
      65 |         atomic_set_release(&r->refs, n);
         |         ^~~~~~~~~~~~~~~~~~
         |         refcount_set_release
>> tools/include/linux/refcount.h:65:9: error: nested extern declaration of 'atomic_set_release' [-Werror=nested-externs]
   In file included from tools/lib/perf/include/internal/mmap.h:6,
                    from mmap.c:12:
   tools/include/linux/refcount.h: In function 'refcount_set_release':
   In file included from tools/lib/perf/include/internal/cpumap.h:5,
                    from tools/lib/perf/include/internal/evsel.h:9,
                    from evsel.c:10:
   tools/include/linux/refcount.h: In function 'refcount_set_release':
>> tools/include/linux/refcount.h:65:9: error: implicit declaration of function 'atomic_set_release'; did you mean 'refcount_set_release'? [-Werror=implicit-function-declaration]
      65 |         atomic_set_release(&r->refs, n);
         |         ^~~~~~~~~~~~~~~~~~
         |         refcount_set_release
>> tools/include/linux/refcount.h:65:9: error: nested extern declaration of 'atomic_set_release' [-Werror=nested-externs]
>> tools/include/linux/refcount.h:65:9: error: implicit declaration of function 'atomic_set_release'; did you mean 'refcount_set_release'? [-Werror=implicit-function-declaration]
      65 |         atomic_set_release(&r->refs, n);
         |         ^~~~~~~~~~~~~~~~~~
         |         refcount_set_release
>> tools/include/linux/refcount.h:65:9: error: nested extern declaration of 'atomic_set_release' [-Werror=nested-externs]
   cc1: all warnings being treated as errors
   cc1: all warnings being treated as errors
   make[7]: *** [tools/build/Makefile.build:86: tools/perf/libperf/threadmap.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[7]: *** [tools/build/Makefile.build:86: tools/perf/libperf/cpumap.o] Error 1
   cc1: all warnings being treated as errors
   make[7]: *** [tools/build/Makefile.build:85: tools/perf/libperf/mmap.o] Error 1
   cc1: all warnings being treated as errors
   make[7]: *** [tools/build/Makefile.build:85: tools/perf/libperf/evsel.o] Error 1
   cc1: all warnings being treated as errors
   make[7]: *** [tools/build/Makefile.build:85: tools/perf/libperf/evlist.o] Error 1
   make[6]: *** [Makefile:122: tools/perf/libperf/libperf-in.o] Error 2
   make[5]: *** [Makefile.perf:996: tools/perf/libperf/libperf.a] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:321: sub-make] Error 2
   make[3]: *** [Makefile:76: all] Error 2


vim +65 tools/include/linux/refcount.h

    62	
    63	static inline void refcount_set_release(refcount_t *r, unsigned int n)
    64	{
  > 65		atomic_set_release(&r->refs, n);
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
