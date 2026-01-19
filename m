Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5315733B6E7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 08:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768811666; cv=none; b=nGuQydjVusKEZlkZkUB6seepL3G7AVCpYHs/TB92oszUPH4s4B51N5eFcOeh9kZ9dpXaKd7iBmkOIfyOSxht2F1ADfNtPD6FfaS9OvBofwxBy3g2F/D/VAPVlAF4yfLabGjBaLzR0BlHZaidJ19s3HKH38mrsKQFjAF+quZJvIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768811666; c=relaxed/simple;
	bh=1iX0MIpEFQnW8doHsm/UYrnHu9wSPq01dIkazAmz0n4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpMU8f11roWRCveoXBAG2CTf62+FZ8jZU6oDj81nkJdt/pdtCekyQlNwbogGGJUvBDrj0oQ1m2qj0dmnLoFrs98TFyHo9p45Ze8FPDCa7pddDa0ud8TEDJ32hv67o23ne1rIOf6M9B/FQyW5+SscsGMmjDTKwCnsv52v+qFT2nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i97U+/kU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i97U+/kU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768811664; x=1800347664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1iX0MIpEFQnW8doHsm/UYrnHu9wSPq01dIkazAmz0n4=;
  b=i97U+/kU6j7J368Jmhwnd3pGh3CycTuqsn2KePd74ayFCw7u1frEkqZG
   I3WnMGGZ5R6jSEOH52woVCkBFrXhSlcZ21rISMlRgrx4O5LJbQXEFgozC
   pFiLbq79SYoN5jUlno+I1ZpUyQno9nP1IJ1kMwVoYIg4UUgCKVPrO/wV9
   Upa/r8Ww3vPijDC9DkLfgnR4LbPM7WKgimOGfawxMgSlPX9ir7atyFrLm
   bxXXgSplu+SnQlaw/qnv8sjXBGRk7n3l4X/gu8tu4BXGrSqX8LWsQxnWf
   IG+fFATaPBn04oNvEoP3InrMzIy7+0WD8eyumdE/FOF9qGtVGapCIGvCq
   g==;
X-CSE-ConnectionGUID: IWLRWZrjQ0uzbhhUHNjc7g==
X-CSE-MsgGUID: 8ZccWPX3TX248Z2lW3a1WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69929920"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="69929920"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 00:34:23 -0800
X-CSE-ConnectionGUID: jasbcX8aT52Rzex+I+0oIg==
X-CSE-MsgGUID: X3yUOlNfSG+8qKEaHou0EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="210665756"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Jan 2026 00:34:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhkiG-00000000NbZ-2plC;
	Mon, 19 Jan 2026 08:34:16 +0000
Date: Mon, 19 Jan 2026 16:34:05 +0800
From: kernel test robot <lkp@intel.com>
To: Zhiguo Zhou <zhiguo.zhou@intel.com>, linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, willy@infradead.org,
	akpm@linux-foundation.org, david@kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	muchun.song@linux.dev, osalvador@suse.de,
	linux-kernel@vger.kernel.org, tianyou.li@intel.com,
	tim.c.chen@linux.intel.com, gang.deng@intel.com,
	Zhiguo Zhou <zhiguo.zhou@intel.com>
Subject: Re: [PATCH 1/2] mm/filemap: refactor __filemap_add_folio to separate
 critical section
Message-ID: <202601191644.IqmJBjDM-lkp@intel.com>
References: <20260119065027.918085-2-zhiguo.zhou@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119065027.918085-2-zhiguo.zhou@intel.com>

Hi Zhiguo,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhiguo-Zhou/mm-filemap-refactor-__filemap_add_folio-to-separate-critical-section/20260119-143737
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260119065027.918085-2-zhiguo.zhou%40intel.com
patch subject: [PATCH 1/2] mm/filemap: refactor __filemap_add_folio to separate critical section
config: i386-randconfig-002-20260119 (https://download.01.org/0day-ci/archive/20260119/202601191644.IqmJBjDM-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191644.IqmJBjDM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601191644.IqmJBjDM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from include/linux/log2.h:12,
                    from arch/x86/include/asm/div64.h:8,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/dax.h:5,
                    from mm/filemap.c:15:
   mm/filemap.c: In function '__filemap_add_folio_xa_locked':
>> include/linux/lockdep.h:252:61: error: invalid type argument of '->' (have 'spinlock_t' {aka 'struct spinlock'})
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                             ^~
   include/asm-generic/bug.h:110:32: note: in definition of macro 'WARN_ON'
     110 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/lockdep.h:285:9: note: in expansion of macro 'lockdep_assert'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^~~~~~~~~~~~~~
   include/linux/lockdep.h:285:24: note: in expansion of macro 'lockdep_is_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |                        ^~~~~~~~~~~~~~~
   mm/filemap.c:861:9: note: in expansion of macro 'lockdep_assert_held'
     861 |         lockdep_assert_held(xas->xa->xa_lock);
         |         ^~~~~~~~~~~~~~~~~~~
   mm/filemap.c: In function '__filemap_add_folio':
>> include/linux/lockdep.h:252:61: error: invalid type argument of '->' (have 'spinlock_t' {aka 'struct spinlock'})
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                             ^~
   include/asm-generic/bug.h:110:32: note: in definition of macro 'WARN_ON'
     110 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/lockdep.h:285:9: note: in expansion of macro 'lockdep_assert'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^~~~~~~~~~~~~~
   include/linux/lockdep.h:285:24: note: in expansion of macro 'lockdep_is_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |                        ^~~~~~~~~~~~~~~
   mm/filemap.c:941:17: note: in expansion of macro 'lockdep_assert_held'
     941 |                 lockdep_assert_held(xas->xa->xa_lock);
         |                 ^~~~~~~~~~~~~~~~~~~
>> include/linux/lockdep.h:252:61: error: invalid type argument of '->' (have 'spinlock_t' {aka 'struct spinlock'})
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                             ^~
   include/asm-generic/bug.h:110:32: note: in definition of macro 'WARN_ON'
     110 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/lockdep.h:288:9: note: in expansion of macro 'lockdep_assert'
     288 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_HELD)
         |         ^~~~~~~~~~~~~~
   include/linux/lockdep.h:288:24: note: in expansion of macro 'lockdep_is_held'
     288 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_HELD)
         |                        ^~~~~~~~~~~~~~~
   mm/filemap.c:944:17: note: in expansion of macro 'lockdep_assert_not_held'
     944 |                 lockdep_assert_not_held(xas->xa->xa_lock);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~


vim +252 include/linux/lockdep.h

f607c668577481 Peter Zijlstra 2009-07-20  251  
f8319483f57f1c Peter Zijlstra 2016-11-30 @252  #define lockdep_is_held(lock)		lock_is_held(&(lock)->dep_map)
f8319483f57f1c Peter Zijlstra 2016-11-30  253  #define lockdep_is_held_type(lock, r)	lock_is_held_type(&(lock)->dep_map, (r))
f607c668577481 Peter Zijlstra 2009-07-20  254  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
