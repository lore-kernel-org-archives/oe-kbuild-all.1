Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5EC7E1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 00:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725408644; cv=none; b=gX9npM7PqhPdVWyBVbVwH8gDZhMd8PtcXXwzgTRJLzdbgyLmetjLvGxgu3bHj+QCL6TAcvzyVQQc49cYeNpDe22bmKEYFpDswf7L73z3YVN5M5jE7z8REkZEmnsjNnmrDiJDpwgAJQwwvHxNcLHQiAfTl87zL4iAcMbYX2kAGTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725408644; c=relaxed/simple;
	bh=bHf9D64rNYMSTvAlVdfccmMa9/2VMw375pXDSlJvlNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EdfFeypquoExA7nvDubQ4xMyj8/SKGqplHqeRXQ9wmmf2ueObXZoRYehy3BurArzJFuXU2jD9/cARLyAJWAiJ73ZV4Ev9wHlI5QT1s6l1aDCIfHtu5eZWrnuqqS4UhYhZokfUtNBHy8HkhQYDYmHGUNbDRq1w7quwuWpjea0oCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3CPhQ6R; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3CPhQ6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725408643; x=1756944643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bHf9D64rNYMSTvAlVdfccmMa9/2VMw375pXDSlJvlNg=;
  b=P3CPhQ6RMVBCBYGeVjwmDGABY3DVOf4tatWicNLzV2s/4JEoB9xxfOpR
   dErg37UIMMw0d2fb2ulSZuOvJiVSp9E+SYQh3lMAg90A8Mpf9HHrzr4vc
   +21xbAl9ijaQG90lACn1U/0EFX8lkDMDBE7cTyjso7q2Il8sCmZzMz50f
   2Xp8j/xQu1VhIyJ7WRC7pDCHlVvds1mwnm1pHr/q8KLd1+G5ri/W6/cNK
   8j+7i2S4JMA9hQ1IvOSfg/2HzScRvg24ipk/kYxVm9R8w1RT+tBcZIjIl
   wkauPZ705G3IP+KqkPOdMy+aXHX6F59pwRVmVmYR+ih22QxqzS09xmYQO
   w==;
X-CSE-ConnectionGUID: kscwPOowQ3mnqyrI6NY79w==
X-CSE-MsgGUID: y+/G4vasQFeCNV8KkYzHbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24231605"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="24231605"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:10:42 -0700
X-CSE-ConnectionGUID: i4tl3yHFTq+emvvww4RHlQ==
X-CSE-MsgGUID: MxFLpF9+TDK0mUUHMMHp1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="95883441"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Sep 2024 17:10:41 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sldbb-0007Ma-1E;
	Wed, 04 Sep 2024 00:10:39 +0000
Date: Wed, 4 Sep 2024 08:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 29/31]
 tools/objtool/include/objtool/elf.h:16:10: fatal error: xxhash.h: No such
 file or directory
Message-ID: <202409040710.ZHyZWzdT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   b99f69f0fc6671bbc510435aadcf25aacf016c38
commit: ffe8cd49f291ab710573616ae1d9ff762405287e [29/31] objtool: Calculate function checksums
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240904/202409040710.ZHyZWzdT-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409040710.ZHyZWzdT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409040710.ZHyZWzdT-lkp@intel.com/

All errors (new ones prefixed by >>):

   check.c:11:10: fatal error: xxhash.h: No such file or directory
      11 | #include <xxhash.h>
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
                    from builtin-check.c:10:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: xxhash.h: No such file or directory
      16 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from weak.c:10:
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
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/check.o] Error 1
   make[5]: *** Waiting for unfinished jobs....
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
   In file included from elf.c:23:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: xxhash.h: No such file or directory
      16 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/special.o] Error 1
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/builtin-check.o] Error 1
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/orc_gen.o] Error 1
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/orc_dump.o] Error 1
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/weak.o] Error 1
   make[6]: *** [tools/build/Makefile.build:106: tools/objtool/arch/x86/special.o] Error 1
   make[6]: *** Waiting for unfinished jobs....
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/objtool.o] Error 1
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/elf.o] Error 1
   make[6]: *** [tools/build/Makefile.build:106: tools/objtool/arch/x86/orc.o] Error 1
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from tools/objtool/include/objtool/arch.h:11,
                    from tools/objtool/include/objtool/check.h:11,
                    from arch/x86/decode.c:18:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: xxhash.h: No such file or directory
      16 | #include <xxhash.h>
         |          ^~~~~~~~~~
   compilation terminated.
   make[6]: *** [tools/build/Makefile.build:106: tools/objtool/arch/x86/decode.o] Error 1
   make[5]: *** [tools/build/Makefile.build:158: arch/x86] Error 2
   make[4]: *** [Makefile:73: tools/objtool/objtool-in.o] Error 2
   make[3]: *** [Makefile:72: objtool] Error 2
   make[2]: *** [Makefile:1369: tools/objtool] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +16 tools/objtool/include/objtool/elf.h

     8	
     9	#include <stdio.h>
    10	#include <gelf.h>
    11	#include <linux/string.h>
    12	#include <linux/list.h>
    13	#include <linux/hashtable.h>
    14	#include <linux/rbtree.h>
    15	#include <linux/jhash.h>
  > 16	#include <xxhash.h>
    17	#include <arch/elf.h>
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
