Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B94202F87
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Apr 2025 23:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744413548; cv=none; b=Pbi+QlBw8xv+KIQgYNetZXWSH78vE4kC6Gl/hlgHypxftnOUqkQ0X1kmUWhuGo2024Eaxg5pootp8jNNbizTjyMVT875faRasdzHgN9DegbRtUTW8yTbM6PuB6y26ETkAmhGtnp2mCV32PqnAZzAMXtdZCAqrRC3XFUqN7MajWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744413548; c=relaxed/simple;
	bh=uFdAK24YxGSt561GSBauAnveNNzqdVdmrQrxTKowc8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rybzfveaJkORd1+kq9zWvkQww4S1JheV99EPbwIIzK6EQZYGs5XXvV+6vN/NyXHOLnQkas7GOlozTmE71mOn9HbPvrLEHkxT3mJ19xw8mRiKCBH58u3ompy4pKQObySKLmu83NykT8skXNdnxoIhKB0GY/N4GQvIkqahR6a/4wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUN968Fa; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUN968Fa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744413547; x=1775949547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uFdAK24YxGSt561GSBauAnveNNzqdVdmrQrxTKowc8U=;
  b=bUN968Fa1U6wRUbnBcNtiHV01mmGhfjBZ3qgEA6YgKU4gM3AzuIxSiks
   MqyLT7IipX7Xa9RHwFmPTQz3gGvFjYA6MG5kESusf7ZXTs+Je10J/4bUB
   9Hfvwaf/mjodZbwnyVPmr7KDnn3F1blPFlgdOw3q6ze4v6a8IRE8fHdeg
   RRrcMppQ8ZQpIUqBj2syUidfVdTqm+cTyHsEjoQjbamjKHM1tenWyCC0p
   ZvKDNAbzIi29PagY2rxXqF3EK4OJynqS5JNhIqgwPraLNh7aTEfi6DIsy
   4w0yfe3vvAKqGMFeslDL/GllNnkoJa7HnvkB5I4JYTX9CiZTh7pCNySqz
   A==;
X-CSE-ConnectionGUID: ecdsdV/7TWqYbzrm13E3IA==
X-CSE-MsgGUID: 3tvOCe1MRQ2QCqfVqDUwzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="56637695"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="56637695"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 16:19:06 -0700
X-CSE-ConnectionGUID: 5QzpeZR/T9qjBaxKsXh13w==
X-CSE-MsgGUID: ATAfOqbpTPGfroJZkWBQjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="134408411"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Apr 2025 16:19:05 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3NeI-000BQo-2e;
	Fri, 11 Apr 2025 23:19:02 +0000
Date: Sat, 12 Apr 2025 07:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] memcg: decouple memcg_hotplug_cpu_dead from stock_lock
Message-ID: <202504120739.K2ifymlR-lkp@intel.com>
References: <20250410210623.1016767-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410210623.1016767-1-shakeel.butt@linux.dev>

Hi Shakeel,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[cannot apply to linus/master v6.15-rc1 next-20250411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shakeel-Butt/memcg-decouple-memcg_hotplug_cpu_dead-from-stock_lock/20250411-050829
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250410210623.1016767-1-shakeel.butt%40linux.dev
patch subject: [PATCH] memcg: decouple memcg_hotplug_cpu_dead from stock_lock
config: x86_64-buildonly-randconfig-001-20250412 (https://download.01.org/0day-ci/archive/20250412/202504120739.K2ifymlR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504120739.K2ifymlR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504120739.K2ifymlR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/bitops.h:7,
                    from include/linux/radix-tree.h:11,
                    from include/linux/idr.h:15,
                    from include/linux/cgroup-defs.h:13,
                    from mm/memcontrol.c:28:
   mm/memcontrol.c: In function 'memcg_hotplug_cpu_dead':
>> mm/memcontrol.c:1967:24: error: 'flag' undeclared (first use in this function); did you mean 'flags'?
    1967 |         local_irq_save(flag);
         |                        ^~~~
   include/linux/typecheck.h:11:16: note: in definition of macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                ^
   include/linux/irqflags.h:239:38: note: in expansion of macro 'raw_local_irq_save'
     239 | #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while (0)
         |                                      ^~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:1967:9: note: in expansion of macro 'local_irq_save'
    1967 |         local_irq_save(flag);
         |         ^~~~~~~~~~~~~~
   mm/memcontrol.c:1967:24: note: each undeclared identifier is reported only once for each function it appears in
    1967 |         local_irq_save(flag);
         |                        ^~~~
   include/linux/typecheck.h:11:16: note: in definition of macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                ^
   include/linux/irqflags.h:239:38: note: in expansion of macro 'raw_local_irq_save'
     239 | #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while (0)
         |                                      ^~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:1967:9: note: in expansion of macro 'local_irq_save'
    1967 |         local_irq_save(flag);
         |         ^~~~~~~~~~~~~~
>> include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   include/linux/irqflags.h:172:17: note: in expansion of macro 'typecheck'
     172 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:239:38: note: in expansion of macro 'raw_local_irq_save'
     239 | #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while (0)
         |                                      ^~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:1967:9: note: in expansion of macro 'local_irq_save'
    1967 |         local_irq_save(flag);
         |         ^~~~~~~~~~~~~~
>> include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   include/linux/irqflags.h:177:17: note: in expansion of macro 'typecheck'
     177 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:240:39: note: in expansion of macro 'raw_local_irq_restore'
     240 | #define local_irq_restore(flags) do { raw_local_irq_restore(flags); } while (0)
         |                                       ^~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:1970:9: note: in expansion of macro 'local_irq_restore'
    1970 |         local_irq_restore(flag);
         |         ^~~~~~~~~~~~~~~~~
>> mm/memcontrol.c:1963:23: warning: unused variable 'flags' [-Wunused-variable]
    1963 |         unsigned long flags;
         |                       ^~~~~


vim +1967 mm/memcontrol.c

  1959	
  1960	static int memcg_hotplug_cpu_dead(unsigned int cpu)
  1961	{
  1962		struct memcg_stock_pcp *stock;
> 1963		unsigned long flags;
  1964	
  1965		stock = &per_cpu(memcg_stock, cpu);
  1966	
> 1967		local_irq_save(flag);
  1968		/* stock of a remote dead cpu, no need for stock_lock. */
  1969		__drain_obj_stock(stock);
  1970		local_irq_restore(flag);
  1971	
  1972		drain_stock(stock);
  1973	
  1974		return 0;
  1975	}
  1976	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
