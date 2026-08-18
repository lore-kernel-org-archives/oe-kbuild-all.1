Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D073447DF95
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 17:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787072418; cv=none; b=Dzmmfx9MZLsGPCdviCGjItF7FmBdUOXoY/MKvzz3bMEgcoX32bK2kVo2cl+APYjkqXoArkJWDeKKG933AGS1rLE70xh3R6wPiu9WyK57vC9UpjZsZ01W9TpuKNjqfMrZmHd3ksbmDNAcTblsBAU9OVXTcsWv7MTktfAcKxHCoKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787072418; c=relaxed/simple;
	bh=MFAEx0xXfGvwsgnM+yyN42w6682diLzEqi0ebUuDth8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WKW6SRNXLDpoJZ3VnpDq5T7FyIbA2cMivdYDUAZq5qLtlxsfjwNI8kqQoH0fmyFlXXWkG5qcvJFcwIT/7pwYPxGAtnXZ0mpEozBXJuEwDYocsGmIRa80E5yZsCrUmujgSrs/P/UFPxSIwVFch8kyWZ/NI7b/g32zVkjGCBy/jTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqYd0kFZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqYd0kFZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787072416; x=1818608416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MFAEx0xXfGvwsgnM+yyN42w6682diLzEqi0ebUuDth8=;
  b=VqYd0kFZOwXrWB593rKfQRVzFXrhYphzNzoUWPPQyzeT4YWQV4YUkBTm
   PtKhEyChN6G2N1AowYwwyw7TdoD1esUWFlJ2TiLn0vQa0F57RlQU2IrAa
   17QdJDTPLdeqFLzKul1EzLlcgZQw85CB11iBALSykrKmrgWUgttHhxpmE
   ZEezbqoyj/FEL5hbwIJLkSxrW6K8uo3jfxbn6r1fMAXSxFGvIu3UBVn27
   eZLtCOaE4nZiDQYlU0Z5Ii0NdFyFZew9LzciHFTX54ICuDHwZADj8QaHv
   tu7T6MXNDRWsHwvaY68pxoK4GKPhPjjyrz6t4LkJuFh/8BvNHLU626UTX
   Q==;
X-CSE-ConnectionGUID: B9MdCHpRSSeGsTcNilQW4w==
X-CSE-MsgGUID: Z6WMC2cWS1mvcDU79BF3Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="91255819"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="91255819"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 10:00:15 -0700
X-CSE-ConnectionGUID: WZR6zdtSTjqQYjzeOmVfeA==
X-CSE-MsgGUID: d49gsvwhSx2bWFBu3/M0Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="261075760"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Aug 2026 10:00:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwNAY-00000000eSS-2chU;
	Tue, 18 Aug 2026 17:00:10 +0000
Date: Wed, 19 Aug 2026 00:59:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:folio-pool-v2-lockdep 16/21]
 kernel/locking/lockdep_internals.h:248:16: error: use of undeclared
 identifier 'lock_classes'; did you mean 'nr_lock_classes'?
Message-ID: <202608190057.bYkKmEhm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git folio-pool-v2-lockdep
head:   e77ee8289ea0755b0ee299348504d4568f942d71
commit: 9e99b37a40c36adbf813b758582f9b57aa5e41e3 [16/21] locking/lockdep: Migrate lock_classes array to 2-level dynamic folio chunks
config: powerpc-randconfig-002-20260818 (https://download.01.org/0day-ci/archive/20260819/202608190057.bYkKmEhm-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608190057.bYkKmEhm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608190057.bYkKmEhm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/locking/lockdep.c:84:
>> kernel/locking/lockdep_internals.h:248:16: error: use of undeclared identifier 'lock_classes'; did you mean 'nr_lock_classes'?
     248 |         idx = class - lock_classes;
         |                       ^~~~~~~~~~~~
         |                       nr_lock_classes
   kernel/locking/lockdep_internals.h:139:22: note: 'nr_lock_classes' declared here
     139 | extern unsigned long nr_lock_classes;
         |                      ^
>> kernel/locking/lockdep_internals.h:248:6: error: incompatible pointer to integer conversion assigning to 'int' from 'struct lock_class *' [-Wint-conversion]
     248 |         idx = class - lock_classes;
         |             ^ ~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep_internals.h:257:16: error: use of undeclared identifier 'lock_classes'; did you mean 'nr_lock_classes'?
     257 |         idx = class - lock_classes;
         |                       ^~~~~~~~~~~~
         |                       nr_lock_classes
   kernel/locking/lockdep_internals.h:139:22: note: 'nr_lock_classes' declared here
     139 | extern unsigned long nr_lock_classes;
         |                      ^
   kernel/locking/lockdep_internals.h:257:6: error: incompatible pointer to integer conversion assigning to 'int' from 'struct lock_class *' [-Wint-conversion]
     257 |         idx = class - lock_classes;
         |             ^ ~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +248 kernel/locking/lockdep_internals.h

8ca2b56cd7da98 Waiman Long 2018-10-03  243  
8ca2b56cd7da98 Waiman Long 2018-10-03  244  static inline void debug_class_ops_inc(struct lock_class *class)
8ca2b56cd7da98 Waiman Long 2018-10-03  245  {
8ca2b56cd7da98 Waiman Long 2018-10-03  246  	int idx;
8ca2b56cd7da98 Waiman Long 2018-10-03  247  
8ca2b56cd7da98 Waiman Long 2018-10-03 @248  	idx = class - lock_classes;
8ca2b56cd7da98 Waiman Long 2018-10-03  249  	__debug_atomic_inc(lock_class_ops[idx]);
8ca2b56cd7da98 Waiman Long 2018-10-03  250  }
8ca2b56cd7da98 Waiman Long 2018-10-03  251  

:::::: The code at line 248 was first introduced by commit
:::::: 8ca2b56cd7da98fc8f8d787bb706b9d6c8674a3b locking/lockdep: Make class->ops a percpu counter and move it under CONFIG_DEBUG_LOCKDEP=y

:::::: TO: Waiman Long <longman@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
