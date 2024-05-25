Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753B010F1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 03:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716606666; cv=none; b=RjgSMzGnP1GsdpuQ100i2iCh0f3plrn3aPk25YahmrxFnPz7ZvuL1wrLP2ibeQ2IcbG+UhzpdRlNhdLo2kiRXcgCIOvtah1EifC6S6CqHceuCHxOwHKegUHvUVFykgI2DzI4cKQIh69/yWfLBFsSGLI4c2SZfDZmYNozxJVfTrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716606666; c=relaxed/simple;
	bh=13C1F7nZTNhdrBT1tzHODXew2xrKRv+vIcCPkhJU0FU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WNAjH8RxnIEsjZq1boJczvsf6G/XWPwhY/Q4sO9s9ZsoQDBYluIo7KnZwJqtmv60lDg1J6IysbpTNkQMfttF5nu/vb6G9qKdnjLlZIWJk/K7zm1PRz4kLArSQpwsveMr8sOLhVMNkmsEsBF2AHNdB5/gQ69DpEYlXh0bSQ0/0FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFQcAeEK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFQcAeEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716606665; x=1748142665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=13C1F7nZTNhdrBT1tzHODXew2xrKRv+vIcCPkhJU0FU=;
  b=hFQcAeEKUvMm6lhIqfVa0xKt4HVysWtjzETlLKd0ycZYxJev846VLs/O
   UFg1qO4BjT7YEf1koTKCUpM41rNaemwknuvrFyDVTt8dNUwe3Am3OcTDO
   MhdJA9aSOyrH9BwO8HMe8PUeCq6LNVf0SqFLhgnW7y1xVHQSY908YuAm1
   V2RHZddmJGkwi3xtGSBRweoiACfcd0+omX5ZbUaBmd8ifdoL7Dj7ABQOD
   18RPMFv07BMKvi1UtfU9rhZbyjHEgU9nTg+Y69KEuOehljlsCzo2FUYEm
   Nnzowfi7qYlOMmbW2sa8D1uqffUz+LQ+Unri7TX7ZRoMA7krlI3ZhK8BA
   g==;
X-CSE-ConnectionGUID: Xm2ljMRVTPODLjU/prqU7Q==
X-CSE-MsgGUID: WIO9Io3DStiG/j66qNPvxw==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12933529"
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="12933529"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 20:11:04 -0700
X-CSE-ConnectionGUID: psHFDuXQSSO67MtKvFDkDQ==
X-CSE-MsgGUID: ouWt2Fr6S0OipC9/EHCfzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="34706267"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 May 2024 20:11:03 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAhoC-0006QK-2c;
	Sat, 25 May 2024 03:11:00 +0000
Date: Sat, 25 May 2024 11:10:52 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 1/2] check.c:11:10: fatal error: xxhash.h: No
 such file or directory
Message-ID: <202405251147.LTjPvHzG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   745009dc796e56fc87e911138d801679ecd3576e
commit: 8603978b6c309a0184ea26eb1cc822f889ec4654 [1/2] todo
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240525/202405251147.LTjPvHzG-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405251147.LTjPvHzG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405251147.LTjPvHzG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> check.c:11:10: fatal error: xxhash.h: No such file or directory
      11 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from weak.c:10:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: xxhash.h: No such file or directory
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/check.o] Error 1
   make[5]: *** Waiting for unfinished jobs....
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/weak.o] Error 1
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from builtin-check.c:10:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: xxhash.h: No such file or directory
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/builtin-check.o] Error 1
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from tools/objtool/include/objtool/arch.h:11,
                    from tools/objtool/include/objtool/check.h:11,
                    from arch/loongarch/decode.c:3:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: xxhash.h: No such file or directory
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from tools/objtool/include/objtool/arch.h:11,
                    from tools/objtool/include/objtool/check.h:11,
                    from tools/objtool/include/objtool/special.h:10,
                    from arch/loongarch/special.c:2:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: xxhash.h: No such file or directory
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   make[6]: *** [tools/build/Makefile.build:106: tools/objtool/arch/loongarch/special.o] Error 1
   make[6]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:106: tools/objtool/arch/loongarch/decode.o] Error 1
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from tools/objtool/include/objtool/arch.h:11,
                    from tools/objtool/include/objtool/check.h:11,
                    from arch/loongarch/orc.c:5:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: xxhash.h: No such file or directory
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   make[6]: *** [tools/build/Makefile.build:106: tools/objtool/arch/loongarch/orc.o] Error 1
   make[5]: *** [tools/build/Makefile.build:158: arch/loongarch] Error 2
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from diff.c:1:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: xxhash.h: No such file or directory
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/diff.o] Error 1
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from tools/objtool/include/objtool/arch.h:11,
                    from tools/objtool/include/objtool/check.h:11,
                    from tools/objtool/include/objtool/special.h:10,
                    from special.c:16:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: xxhash.h: No such file or directory
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from tools/objtool/include/objtool/arch.h:11,
                    from tools/objtool/include/objtool/check.h:11,
                    from orc_gen.c:12:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: xxhash.h: No such file or directory
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/orc_gen.o] Error 1
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/special.o] Error 1
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from objtool.c:16:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: xxhash.h: No such file or directory
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/objtool.o] Error 1
   In file included from elf.c:23:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: xxhash.h: No such file or directory
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/elf.o] Error 1
   make[4]: *** [Makefile:73: tools/objtool/objtool-in.o] Error 2
   make[3]: *** [Makefile:72: objtool] Error 2
   make[2]: *** [Makefile:1358: tools/objtool] Error 2
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
