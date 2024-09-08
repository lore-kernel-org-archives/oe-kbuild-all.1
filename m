Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E525156243
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 15:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725810327; cv=none; b=DR/3+1LmN0u6LuSNqfIRXXb6M06Iguo3J1YjWcOuibtoaNNPT/uTSNmFpYpdlETMURYnJUyxDU7J6JN/DV0K60AkP499Sq+yijHa4SuycZbJsBT33wUxrAHi+jqH/VARUQrOGA6Z3cZdKY5XGTvEo7jALcLIGLj176K6ffDMuMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725810327; c=relaxed/simple;
	bh=FTSgibi0uIFJD2gvJoZs3Dxu0UgmxctVpLdnY0+ynLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nIB3jogEtCnBoViWT2sbRr/QdPFkHhbAuQT9WzJd6KeXiuWzjlNgEThmE1hOVvHy4DAXHq1qPLjMf4q/WScb5MMdKKDupQOiZWvGMPUHOSP50PhS9BdfXrtVqL8Qw0jAai7FKoOaPrDLuyDLJBPjbl5iZih5zKIXBQ7X3kVJbQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S2uXC72X; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S2uXC72X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725810324; x=1757346324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FTSgibi0uIFJD2gvJoZs3Dxu0UgmxctVpLdnY0+ynLU=;
  b=S2uXC72X+ar92TtDMtoJvd99cXbrOUV+MDQJ7VVgHYjoRyukvFOl9bIS
   t++4BfrygzSeF3okzykjVsELWnE49xQcQlY5UZO0OHMKd2MQBbTJ5A3jB
   VNOYSwIQWyvUDLwuWx2a5f3MQJXO0T3g+N9gw9xpqyjTp14wb2i/TLIO/
   X7BvO9wVsmWr9CTYesh9e6vP/odhxawZ1oIvlMsNpRM9bGd5xnsElLVxO
   RZa7BsXmG+xni+UawR8zOOPwdcK5qQvkyLqoEVseKFpqAeA7bPeqxpaYG
   dC1eev7r+ooAWVzvw4lv0qBpwKWkHc0aaXX7hgQlyWT53KtDR6sqNRyaw
   g==;
X-CSE-ConnectionGUID: Op4a9IDLSE6lKEF/T96g1g==
X-CSE-MsgGUID: J1pZRGJ+Qda382Ak8SR97A==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24697380"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="24697380"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 08:45:24 -0700
X-CSE-ConnectionGUID: w30VIu3ZRTOUd4aTnV1kfw==
X-CSE-MsgGUID: 0gESwr4fRqGXRe8sobDgfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="89698463"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Sep 2024 08:45:22 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snK6K-000Dgf-0m;
	Sun, 08 Sep 2024 15:45:20 +0000
Date: Sun, 8 Sep 2024 23:44:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 172/181]
 include/linux/compiler_types.h:510:45: error: call to
 '__compiletime_assert_335' declared with attribute error: Need native word
 sized stores/loads for atomicity.
Message-ID: <202409082305.CCja4jgQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   037c9eae885afb1ef8de16c94057f8bc527dc3ff
commit: 7e1c40e9677975ca89b3794d02e5f8d67574c1a5 [172/181] percpu: per_cpu_sum()
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240908/202409082305.CCja4jgQ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409082305.CCja4jgQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409082305.CCja4jgQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'percpu_u64_get',
       inlined from 'bch2_fs_alloc_debug_to_text' at fs/bcachefs/alloc_foreground.c:1703:2:
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_335' declared with attribute error: Need native word sized stores/loads for atomicity.
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
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_335' declared with attribute error: Need native word sized stores/loads for atomicity.
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
       inlined from '__bch2_disk_reservation_add' at fs/bcachefs/buckets.c:1201:35:
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_335' declared with attribute error: Need native word sized stores/loads for atomicity.
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
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_335' declared with attribute error: Need native word sized stores/loads for atomicity.
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
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_335' declared with attribute error: Need native word sized stores/loads for atomicity.
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
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_335' declared with attribute error: Need native word sized stores/loads for atomicity.
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
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_335' declared with attribute error: Need native word sized stores/loads for atomicity.
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
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_335' declared with attribute error: Need native word sized stores/loads for atomicity.
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
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_335' declared with attribute error: Need native word sized stores/loads for atomicity.
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
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_335' declared with attribute error: Need native word sized stores/loads for atomicity.
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
       inlined from 'bch2_fs_counters_to_text.isra' at fs/bcachefs/sysfs.c:549:2:
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_335' declared with attribute error: Need native word sized stores/loads for atomicity.
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
       inlined from 'bch2_compression_stats_to_text.isra' at fs/bcachefs/sysfs.c:278:3:
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_335' declared with attribute error: Need native word sized stores/loads for atomicity.
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
       inlined from 'dev_io_done_to_text' at fs/bcachefs/sysfs.c:763:4,
       inlined from 'bch2_dev_to_text.isra' at fs/bcachefs/sysfs.c:799:3:
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_335' declared with attribute error: Need native word sized stores/loads for atomicity.
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


vim +/__compiletime_assert_335 +510 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  496  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  497  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  498  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  499  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  500  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  501   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  502   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  503   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  504   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  505   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  506   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  507   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  508   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  509  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @510  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  511  

:::::: The code at line 510 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
