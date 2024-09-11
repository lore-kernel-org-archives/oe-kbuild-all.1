Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A5918754F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 10:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726052030; cv=none; b=beH85zwD3hc4rTSRKFk0BNWNePLmtW/e2sxngdKramQrQ2ZyTGJWd1u2OW4LJHD9bpMaGKVm6DNGyARaodEvHjOmjgV/lM5xsJV7mfSlHryQf/3OD7EwWyjRqnrDuYH8ZVjK3hTASWqWlODV1LRyXCYX/vGKprwD292zAgyOHsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726052030; c=relaxed/simple;
	bh=J7SAt5cCcdtdhph6xivGJMIswf0BVfq9F9BDYHHTpXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ibnMbpuOvLURuW1o4O5AtcaUEJa+SbQsBD9KR3nK8GuaqsTeV/AblwBF/0wxlIkbxBJHeVVpSVpJjvA8qg8bbPuT3ngXp5gEqKkUNOkbG+FFA3oJHnX40qGiGcYmlBYp3AjngRBcexamcjQqtqvTtkjQ1um3DqiJ3ZkMHg6hDi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GZCpLtAA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GZCpLtAA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726052029; x=1757588029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J7SAt5cCcdtdhph6xivGJMIswf0BVfq9F9BDYHHTpXs=;
  b=GZCpLtAAVTyImHhAJ0QG0Sdp1ZVI5QhT7A55b8gX/NcxqdMIZKN4WF7S
   99mKO0axq7wqnRdHWZIkDUPSKxyKoDZcFFQm7j71E0j524JAiSF17BRJa
   GjSSu3ufVt6tSUkudUL81t34AFlDT0Dz5Hfm5oumeRpqdGYqTaltfFKxV
   etGQObMSLYbtucPQSYKb81oAgr4eL9t/6Pdf+9gSG7PB/4YhbjKQ82Qkm
   CjQbfr0NI/jOBRYY5P+uijTdP9bOFBusl4fkDGlgCSgeVvrbvkLz8tB4E
   PFAY9TXye5NyeAtF9lmV5f95kK/Ubcwgh6nkx07CDe+KpfYcla5ZXRh8N
   A==;
X-CSE-ConnectionGUID: 0IehHU5sQKKAm4PuRwZTsw==
X-CSE-MsgGUID: LR0GhiIwSEGzTzlcQyVGYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="50257564"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="50257564"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 03:53:48 -0700
X-CSE-ConnectionGUID: nfnZ2hfeR4SpRE2npem75A==
X-CSE-MsgGUID: flQ3HborSZ6WR/F7LMDJkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="71705885"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Sep 2024 03:53:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soKyn-0003Pk-0e;
	Wed, 11 Sep 2024 10:53:45 +0000
Date: Wed, 11 Sep 2024 18:53:08 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build-v1.5 30/32] check.c:11:10: fatal error:
 xxhash.h: No such file or directory
Message-ID: <202409111810.gbOqW9I1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build-v1.5
head:   2abe29f4f173c4090c0030c43c30053694b1658a
commit: b28bcdc0e8e9cad411975854148e76e0957ad16c [30/32] objtool: Calculate function checksums
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240911/202409111810.gbOqW9I1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111810.gbOqW9I1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111810.gbOqW9I1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> check.c:11:10: fatal error: xxhash.h: No such file or directory
      11 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from weak.c:10:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: xxhash.h: No such file or directory
      16 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from builtin-check.c:10:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: xxhash.h: No such file or directory
      16 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from tools/objtool/include/objtool/arch.h:11,
                    from tools/objtool/include/objtool/check.h:11,
                    from tools/objtool/include/objtool/special.h:10,
                    from special.c:16:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: xxhash.h: No such file or directory
      16 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from tools/objtool/include/objtool/arch.h:11,
                    from tools/objtool/include/objtool/check.h:11,
                    from orc_gen.c:12:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: xxhash.h: No such file or directory
      16 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from objtool.c:18:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: xxhash.h: No such file or directory
      16 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from tools/objtool/include/objtool/arch.h:11,
                    from tools/objtool/include/objtool/check.h:11,
                    from arch/x86/orc.c:5:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: xxhash.h: No such file or directory
      16 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from tools/objtool/include/objtool/arch.h:11,
                    from tools/objtool/include/objtool/check.h:11,
                    from tools/objtool/include/objtool/special.h:10,
                    from arch/x86/special.c:4:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: xxhash.h: No such file or directory
      16 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from orc_dump.c:8:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: xxhash.h: No such file or directory
      16 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   In file included from elf.c:23:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: xxhash.h: No such file or directory
      16 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/check.o] Error 1
   make[5]: *** Waiting for unfinished jobs....
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from tools/objtool/include/objtool/arch.h:11,
                    from tools/objtool/include/objtool/check.h:11,
                    from arch/x86/decode.c:18:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: xxhash.h: No such file or directory
      16 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/weak.o] Error 1
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/special.o] Error 1
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/builtin-check.o] Error 1
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/orc_gen.o] Error 1
   make[6]: *** [tools/build/Makefile.build:106: tools/objtool/arch/x86/orc.o] Error 1
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/objtool.o] Error 1
   make[6]: *** Waiting for unfinished jobs....
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/orc_dump.o] Error 1
   make[6]: *** [tools/build/Makefile.build:106: tools/objtool/arch/x86/special.o] Error 1
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/elf.o] Error 1
   make[6]: *** [tools/build/Makefile.build:106: tools/objtool/arch/x86/decode.o] Error 1
   make[5]: *** [tools/build/Makefile.build:158: arch/x86] Error 2
   make[4]: *** [Makefile:77: tools/objtool/objtool-in.o] Error 2
   make[3]: *** [Makefile:72: objtool] Error 2
   make[2]: *** [Makefile:1361: tools/objtool] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
