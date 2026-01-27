Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66B5313E0A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 03:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769485713; cv=none; b=eVZWQ/pyfjnn0/yV50n/VUO3nj0KUps2ntHO7Qbe5JavjC1X8k3jUyAWjJkFyPiWiN88o0vlGRCg1CyzBfbhXm9Ca7XUQIItC/IANOPtiHlzqDo38JnH2Phdj2TqHKpE0RHvMpkZrSxMNJVCC11jE7xM76dJqX4DJ4h7XNlhj0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769485713; c=relaxed/simple;
	bh=yWYPLXeBPbqevAQ0odirLhK4lDFGi0qTxfetSaTPJdM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r7cYJ6gPi+wtpoCp/XI5M1f1lIAoxvsRT18goAVrSp/tUpbV5GCtxyZ6NqFJVL04kcic/wMFDAk/c4kklgtjFk7lLc1F7iw6Bfwx89TjcQEHO53BXfz5g5/0CVBoPF7CcZ7cMyjnFZRu4bNVsq1L7CSXwS5M1eY/EuAUo/Dd10c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nvNWU9i2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nvNWU9i2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769485712; x=1801021712;
  h=date:from:to:cc:subject:message-id;
  bh=yWYPLXeBPbqevAQ0odirLhK4lDFGi0qTxfetSaTPJdM=;
  b=nvNWU9i2DRYk+nBu/gy37baw/OeyDZtdyM85GqLwtPalD4g+P4w6Y38k
   Zdd/3KUupVBvagzhnyor1zQWLyCVyu74uxbmvV7aVzyhZHy97DmWUc4dd
   OWewhNQSLUoly3c5Tx9W0jjxbbANRJp6u8Krt1lzRkPU5eDTY7cUpI5fs
   x+25u4McFClhJY0DUluWbLpTogMlezBV97CTdAH+di0kVTDvju40i1h9Q
   r/UT3+27QdfvQyIJipmqq/deJ4V1U52IN2AidJZSTevKZgK6kAX1CDUvU
   T1l8M0Nxsux3O8aYuhiIfwr4Hp/kOx4E/Aw41AD06x7FWqQCiyV8KRTXJ
   A==;
X-CSE-ConnectionGUID: 8rkR8kB2QvCYLUVf4R66HQ==
X-CSE-MsgGUID: 9MffE0deTwqKKZ5fdTgLRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="69871400"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="69871400"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 19:48:31 -0800
X-CSE-ConnectionGUID: FsWQPszIQ62TZr2tieW0/w==
X-CSE-MsgGUID: ykUcGdIJQxiUeT7X27/RgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="245464175"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 26 Jan 2026 19:48:30 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vka43-000000001iT-06YZ;
	Tue, 27 Jan 2026 03:48:27 +0000
Date: Tue, 27 Jan 2026 04:47:52 +0100
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <fustini@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [fustini:b4/ssqosid-cbqri 14/18]
 include/linux/acpi.h:1582:16: error: returning 'int' from a function with
 return type 'struct acpi_pptt_cache *' makes pointer from integer without a
 cast
Message-ID: <202601270423.YC9lmDyF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri
head:   8182dddb709d03a64b99b430d05f8f21103aa9b3
commit: 60aed9e92fe0ca93b56a46ae251eb1ff851d572f [14/18] acpi: pptt: Add helper to find a cache from id
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260127/202601270423.YC9lmDyF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270423.YC9lmDyF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270423.YC9lmDyF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from init/main.c:31:
   include/linux/acpi.h: In function 'find_acpi_cache_from_id':
>> include/linux/acpi.h:1582:16: error: returning 'int' from a function with return type 'struct acpi_pptt_cache *' makes pointer from integer without a cast [-Wint-conversion]
    1582 |         return -EINVAL;
         |                ^
--
   In file included from sound/hda/controllers/intel.c:38:
   include/linux/acpi.h: In function 'find_acpi_cache_from_id':
>> include/linux/acpi.h:1582:16: error: returning 'int' from a function with return type 'struct acpi_pptt_cache *' makes pointer from integer without a cast [-Wint-conversion]
    1582 |         return -EINVAL;
         |                ^
   In file included from include/asm-generic/div64.h:27,
                    from arch/x86/include/asm/div64.h:100,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:12,
                    from sound/hda/controllers/intel.c:23:
   sound/hda/controllers/intel.c: At top level:
   include/linux/compiler.h:201:82: error: expression in static assertion is not an integer
     201 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:206:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     206 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:541:20: note: in expansion of macro 'ARRAY_SIZE'
     541 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:525:9: note: in expansion of macro 'module_param_array_named'
     525 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/hda/controllers/intel.c:125:1: note: in expansion of macro 'module_param_array'
     125 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
   sound/hda/controllers/intel.c:104:12: warning: 'index' defined but not used [-Wunused-variable]
     104 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~


vim +1582 include/linux/acpi.h

  1579	
  1580	static inline struct acpi_pptt_cache *find_acpi_cache_from_id(u32 cache_id)
  1581	{
> 1582		return -EINVAL;
  1583	}
  1584	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
