Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0A22E3EB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 06:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725345108; cv=none; b=mBh7whRxQA03kfYrJCLBdM9h7uHRXmDTbUrhmLWqnSc8uGbsgvcWVQ5PWCI1WIR7m1zdR3Iunb+V/UdVTpx6JZrdB8ck2jFd5IwcSk81ExnGljJ83Jsa0WIvYgNrLd1j/FFEnmJhGk2iTOD7zcPLmM6LXWIt17LWoOQfE2S7Slo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725345108; c=relaxed/simple;
	bh=qZ5hx6aQHJ9nRQR7lj4ovg3hObrSF6q/xN9wK3lfNjI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=biFV8KcyRqleRS0AnN4v69KL/lQ/mt4LIeMVjjYV1QaU+MyRlj9hI096waYaGDVLaJzv6v12FkUpfKT6UiAkELB3ZRsbeLLvCcBMOKQ4Gsxybj8eCRtID9Cej9FKNuXwb365E5YZS+78pfim8WyAYj44wGWWus/hBnEh3RBvIc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3CQAlM4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W3CQAlM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725345106; x=1756881106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qZ5hx6aQHJ9nRQR7lj4ovg3hObrSF6q/xN9wK3lfNjI=;
  b=W3CQAlM4NNG9ZAei2O57Ud+74C/y6WoInM1cu/THrVW6Pb+QVVugTqgC
   SK9c2nBCKerduKFqNnZDZIJs7zVtu9dpyLHOl7qANfV3GALrrKhUfBfIO
   UJQ4YEfGsSOOnI3O5mCMfqXKUaDCxpV9dR3lQxEuaVBuAe6jKOm8ykO4M
   nnXKoa3t0v/I/sEl6Qd/9EAlq/6ipzXEm/4P6svffaH5sEveCav9lVjLS
   PS5WerF04HSOy0xr1ILWdzV6RUpPRVjSyym7gjazzhZi6k5nmBIFBt//f
   D9MQ5Zw5OuqKjSSf7xa+ngq08/3xHkA4b+IH71BLeMXIpWfNfasXLrS6i
   g==;
X-CSE-ConnectionGUID: B/B/FMM2SzCX92AK09ZfOw==
X-CSE-MsgGUID: NaqdRNe6SAKA4N/KgiQAEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="13338615"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="13338615"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 23:31:45 -0700
X-CSE-ConnectionGUID: fCwFOgv/Tge24w8vG+tbgw==
X-CSE-MsgGUID: 5mQd1pSNRgul46U9l70LHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="102241390"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Sep 2024 23:31:44 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slN4o-0006Ja-0E;
	Tue, 03 Sep 2024 06:31:42 +0000
Date: Tue, 3 Sep 2024 14:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 151/158]
 include/linux/compiler_types.h:510:45: error: call to
 '__compiletime_assert_389' declared with attribute error: Need native word
 sized stores/loads for atomicity.
Message-ID: <202409031407.4qRohlcH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   55f90d8db66f23e9ceb96dd8d25c905d2de218df
commit: c4773f36d3d05003aee600b6f38608725e936c18 [151/158] percpu: per_cpu_sum()
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20240903/202409031407.4qRohlcH-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409031407.4qRohlcH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409031407.4qRohlcH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'percpu_u64_get',
       inlined from 'bch2_fs_alloc_debug_to_text' at fs/bcachefs/alloc_foreground.c:1703:2:
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_389' declared with attribute error: Need native word sized stores/loads for atomicity.
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:491:25: note: in definition of macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:513:9: note: in expansion of macro 'compiletime_assert'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/percpu.h:169:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/util.h:589:16: note: in expansion of macro 'per_cpu_sum'
     589 |         return per_cpu_sum(*src);
         |                ^~~~~~~~~~~
--
   In file included from <command-line>:
   In function 'percpu_u64_get',
       inlined from '__bch2_fs_usage_read_short' at fs/bcachefs/buckets.c:47:3,
       inlined from 'bch2_fs_usage_read_short' at fs/bcachefs/buckets.c:68:8:
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_389' declared with attribute error: Need native word sized stores/loads for atomicity.
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:491:25: note: in definition of macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:513:9: note: in expansion of macro 'compiletime_assert'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/percpu.h:169:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/util.h:589:16: note: in expansion of macro 'per_cpu_sum'
     589 |         return per_cpu_sum(*src);
         |                ^~~~~~~~~~~
   In function 'percpu_u64_get',
       inlined from '__bch2_fs_usage_read_short' at fs/bcachefs/buckets.c:47:3,
       inlined from '__bch2_disk_reservation_add' at fs/bcachefs/buckets.c:1191:35:
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_389' declared with attribute error: Need native word sized stores/loads for atomicity.
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:491:25: note: in definition of macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:513:9: note: in expansion of macro 'compiletime_assert'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/percpu.h:169:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/util.h:589:16: note: in expansion of macro 'per_cpu_sum'
     589 |         return per_cpu_sum(*src);
         |                ^~~~~~~~~~~
--
   In file included from <command-line>:
   In function 'percpu_u64_get',
       inlined from 'accounting_mem_entry_is_zero' at fs/bcachefs/disk_accounting.c:341:7,
       inlined from 'bch2_accounting_mem_gc' at fs/bcachefs/disk_accounting.c:356:7:
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_389' declared with attribute error: Need native word sized stores/loads for atomicity.
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:491:25: note: in definition of macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:513:9: note: in expansion of macro 'compiletime_assert'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/percpu.h:169:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/util.h:589:16: note: in expansion of macro 'per_cpu_sum'
     589 |         return per_cpu_sum(*src);
         |                ^~~~~~~~~~~
   In function 'percpu_u64_get',
       inlined from 'bch2_accounting_mem_read_counters' at fs/bcachefs/disk_accounting.h:185:10,
       inlined from 'bch2_fs_replicas_usage_read' at fs/bcachefs/disk_accounting.c:396:3:
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_389' declared with attribute error: Need native word sized stores/loads for atomicity.
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:491:25: note: in definition of macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:513:9: note: in expansion of macro 'compiletime_assert'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/percpu.h:169:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/util.h:589:16: note: in expansion of macro 'per_cpu_sum'
     589 |         return per_cpu_sum(*src);
         |                ^~~~~~~~~~~
   In function 'percpu_u64_get',
       inlined from 'bch2_accounting_mem_read_counters' at fs/bcachefs/disk_accounting.h:185:10,
       inlined from 'bch2_fs_accounting_read' at fs/bcachefs/disk_accounting.c:438:3:
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_389' declared with attribute error: Need native word sized stores/loads for atomicity.
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:491:25: note: in definition of macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:513:9: note: in expansion of macro 'compiletime_assert'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/percpu.h:169:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/util.h:589:16: note: in expansion of macro 'per_cpu_sum'
     589 |         return per_cpu_sum(*src);
         |                ^~~~~~~~~~~
   In function 'percpu_u64_get',
       inlined from 'bch2_accounting_mem_read_counters' at fs/bcachefs/disk_accounting.h:185:10,
       inlined from 'bch2_fs_accounting_to_text' at fs/bcachefs/disk_accounting.c:466:3:
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_389' declared with attribute error: Need native word sized stores/loads for atomicity.
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:491:25: note: in definition of macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:513:9: note: in expansion of macro 'compiletime_assert'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/percpu.h:169:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/util.h:589:16: note: in expansion of macro 'per_cpu_sum'
     589 |         return per_cpu_sum(*src);
         |                ^~~~~~~~~~~
   In function 'percpu_u64_get',
       inlined from 'bch2_accounting_mem_read_counters' at fs/bcachefs/disk_accounting.h:185:10,
       inlined from 'bch2_gc_accounting_done' at fs/bcachefs/disk_accounting.c:537:3:
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_389' declared with attribute error: Need native word sized stores/loads for atomicity.
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:491:25: note: in definition of macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:513:9: note: in expansion of macro 'compiletime_assert'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/percpu.h:169:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/util.h:589:16: note: in expansion of macro 'per_cpu_sum'
     589 |         return per_cpu_sum(*src);
         |                ^~~~~~~~~~~
   In function 'percpu_u64_get',
       inlined from 'bch2_accounting_mem_read_counters' at fs/bcachefs/disk_accounting.h:185:10,
       inlined from 'bch2_accounting_read' at fs/bcachefs/disk_accounting.c:685:3:
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_389' declared with attribute error: Need native word sized stores/loads for atomicity.
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:491:25: note: in definition of macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:513:9: note: in expansion of macro 'compiletime_assert'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/percpu.h:169:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/util.h:589:16: note: in expansion of macro 'per_cpu_sum'
     589 |         return per_cpu_sum(*src);
         |                ^~~~~~~~~~~
   In function 'percpu_u64_get',
       inlined from 'bch2_accounting_mem_read_counters' at fs/bcachefs/disk_accounting.h:185:10,
       inlined from 'bch2_accounting_mem_read' at fs/bcachefs/disk_accounting.h:195:2,
       inlined from 'bch2_verify_accounting_clean' at fs/bcachefs/disk_accounting.c:757:2:
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_389' declared with attribute error: Need native word sized stores/loads for atomicity.
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:491:25: note: in definition of macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:513:9: note: in expansion of macro 'compiletime_assert'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/percpu.h:169:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/util.h:589:16: note: in expansion of macro 'per_cpu_sum'
     589 |         return per_cpu_sum(*src);
         |                ^~~~~~~~~~~
--
   In file included from <command-line>:
   In function 'percpu_u64_get',
       inlined from 'bch2_fs_counters_to_text.isra' at fs/bcachefs/sysfs.c:544:2:
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_389' declared with attribute error: Need native word sized stores/loads for atomicity.
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:491:25: note: in definition of macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:513:9: note: in expansion of macro 'compiletime_assert'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/percpu.h:169:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/util.h:589:16: note: in expansion of macro 'per_cpu_sum'
     589 |         return per_cpu_sum(*src);
         |                ^~~~~~~~~~~
   In function 'percpu_u64_get',
       inlined from 'bch2_accounting_mem_read_counters' at fs/bcachefs/disk_accounting.h:185:10,
       inlined from 'bch2_accounting_mem_read' at fs/bcachefs/disk_accounting.h:195:2,
       inlined from 'bch2_compression_stats_to_text.isra' at fs/bcachefs/sysfs.c:274:3:
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_389' declared with attribute error: Need native word sized stores/loads for atomicity.
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:491:25: note: in definition of macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:513:9: note: in expansion of macro 'compiletime_assert'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/percpu.h:169:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/util.h:589:16: note: in expansion of macro 'per_cpu_sum'
     589 |         return per_cpu_sum(*src);
         |                ^~~~~~~~~~~
   In function 'percpu_u64_get',
       inlined from 'dev_io_done_to_text' at fs/bcachefs/sysfs.c:758:4,
       inlined from 'bch2_dev_to_text' at fs/bcachefs/sysfs.c:794:3:
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_389' declared with attribute error: Need native word sized stores/loads for atomicity.
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:491:25: note: in definition of macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:513:9: note: in expansion of macro 'compiletime_assert'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/percpu.h:169:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     169 |         compiletime_assert_atomic_type(__sum);                          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/util.h:589:16: note: in expansion of macro 'per_cpu_sum'
     589 |         return per_cpu_sum(*src);
         |                ^~~~~~~~~~~


vim +/__compiletime_assert_389 +510 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  496  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  497  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  498  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  499  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  500  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  501   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  502   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  503   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  504   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  505   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  506   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  507   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  508   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  509  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @510  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  511  

:::::: The code at line 510 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
