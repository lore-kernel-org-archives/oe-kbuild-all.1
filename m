Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78F51849
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 08:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718354271; cv=none; b=VUXbFKp6Q8kPl4MoZ1B1em56jT3QwLrvDcgWSML0fKQYeja6F/XOjmzde6030tVWRZbL/b8g4xreM/UI2mZNRMzUfZLpyKLunjEH0tV90SwXxwv6qWoA3QYAxuh3yOt/f3oqqZL+4nKzHB5pIZywKYIS4pGK+1a0ZeX7GKz7aZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718354271; c=relaxed/simple;
	bh=dvYPMurV6JqmF/veAdXAQLrbLeKX0uHYTavsea+mSMk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DHOMJHgdUN9fCkmJw5cQI9vizyC/RBypl8Ieitg8xDSHue1/Z+UYDJDIPNY+PZiFCnYawLTgeQtlk84F9B9DfdMFiMUbPvKfaS5Y3yczJyfzNaCfsFH27mlROnmC3hFSLMlm9u8cfC4TMWuM7Igr7Dn5fcP0IefDoOGImvoz6dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AgC6naBu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AgC6naBu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718354270; x=1749890270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dvYPMurV6JqmF/veAdXAQLrbLeKX0uHYTavsea+mSMk=;
  b=AgC6naBunYglwl2u03ne8N714CaQ2bXbwNOn9TJICafRETQUtrH3/onA
   KKliysrynyPqMw6FUDv/KY025S+UXlyiVRo1nTcFa7Gq/2f5UJ6tPTWBZ
   xhrNiEc1mUjwgNZgqlWuO8trpdSAY0G1EaJUttN+Y86AfJPtRNup19LAR
   4kiHFgUIiQM/HMvDeoYQwud+UuXqt4lk7ZasGJYpxVOwjEcstsoJWGq7b
   kad8mEyb7WtzgaPL7CgS0ICs0FXfKJ6bm7OmFztWhHoOKY7p6WqbaGPSG
   zUi7wtglir5NcTZz2KR+cLuPSxtGRXRNSV9GLS+U65kKSKgKv1onMPHdi
   g==;
X-CSE-ConnectionGUID: Yfbmqm4WTi+gaAEb4HmKkw==
X-CSE-MsgGUID: HX+wZHI1Ss+MIKAl9/BXvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26649415"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="26649415"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 01:37:48 -0700
X-CSE-ConnectionGUID: X5ccP7GHTOmncCxBzU7Jgg==
X-CSE-MsgGUID: nbWFH9DCRP+xNpiNBfGMIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="44809612"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Jun 2024 01:37:46 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI2RL-00011y-3A;
	Fri, 14 Jun 2024 08:37:43 +0000
Date: Fri, 14 Jun 2024 16:37:29 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 2/2] check.c:11:10: fatal error: 'xxhash.h'
 file not found
Message-ID: <202406141634.3yMBYcDe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   cd5c807b4be90882e7b15d95233f31122e12d6b0
commit: cd5c807b4be90882e7b15d95233f31122e12d6b0 [2/2] todo
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240614/202406141634.3yMBYcDe-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406141634.3yMBYcDe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406141634.3yMBYcDe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> check.c:11:10: fatal error: 'xxhash.h' file not found
      11 | #include <xxhash.h>
         |          ^~~~~~~~~~
   In file included from builtin-check.c:10:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   In file included from special.c:16:
   In file included from tools/objtool/include/objtool/special.h:10:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   In file included from arch/x86/special.c:4:
   In file included from tools/objtool/include/objtool/special.h:10:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   In file included from diff.c:1:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   In file included from weak.c:10:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   In file included from orc_gen.c:12:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   1 error generated.
   1 error generated.
   In file included from arch/x86/orc.c:5:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   In file included from orc_dump.c:8:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/builtin-check.o] Error 1
   make[6]: *** [tools/build/Makefile.build:106: tools/objtool/arch/x86/special.o] Error 1
   make[5]: *** Waiting for unfinished jobs....
   make[6]: *** Waiting for unfinished jobs....
   In file included from objtool.c:16:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   In file included from elf.c:23:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      1 error generated.
   17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/special.o] Error 1
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/weak.o] Error 1
   1 error generated.
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/orc_gen.o] Error 1
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/objtool.o] Error 1
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/diff.o] Error 1
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/orc_dump.o] Error 1
   make[6]: *** [tools/build/Makefile.build:106: tools/objtool/arch/x86/orc.o] Error 1
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/elf.o] Error 1
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/check.o] Error 1
   In file included from arch/x86/decode.c:18:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   1 error generated.
   make[6]: *** [tools/build/Makefile.build:106: tools/objtool/arch/x86/decode.o] Error 1
   make[5]: *** [tools/build/Makefile.build:158: arch/x86] Error 2
   make[4]: *** [Makefile:73: tools/objtool/objtool-in.o] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
