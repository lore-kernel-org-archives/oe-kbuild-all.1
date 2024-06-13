Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327F657C8D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jun 2024 20:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718309296; cv=none; b=IHChV/uzuo1CM/M72dC6uvM4j7zwnzNxsN3rGCg+f0wUb/kE/88k+bQPdSqD/aozzkZkexbbgOSo57+Qyv+AoP7VZ+h3IBKdgbchbc3Gk16Yt/dYPKkfnpgz1ylfUbuq0jsCn3ukQnbhpsT+X9IVXiiiihGX7XkUijBpfpRayeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718309296; c=relaxed/simple;
	bh=5b8ZN62h82iRiu4OBK1Tsk9gOFzFSAi8D8XxmjA9nq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mt8zQfJTQVCrCLu5rkbZkWBVP0Z27KOaXxxfIb06IzcWOsFcago29hwBw0WNLkdOjqdb5hq7YEY4WM0BxKEwJSPieHQgrU8F67Z5jEtVxnAvKcJBP6+vcPRyBZMGR8//UoqZfDE6FmIL0RJyDjZ+/XVLMte2YDHDlqd1LymTcZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BvKNFrhd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BvKNFrhd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718309294; x=1749845294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5b8ZN62h82iRiu4OBK1Tsk9gOFzFSAi8D8XxmjA9nq0=;
  b=BvKNFrhdxVLRpp/QNjwUGhRMAIg5qUQaq2wiHNgPKI8a6NW4vZeaXO6U
   3qegUC6Ydg9pkZdnOyP2XfMFLTLn4rOff5YdzuuqWTP7H+9xY+ON6YCH0
   bcGSfWI7oot8ELhIWH00+xmVzvehKxkExqXbszDkH2uWfKtnpVIGpQkQt
   L6U4j6ComcFqzxlRdFHaVq/V2hKrgXcRbNJ9nduEy3arwCMBFt5PaF9XP
   NC0y53M7sJAw3uSwFOwcbtptc3yf784/htp416SE2xv7MHq8Cmks9ad8v
   HniwYY0l7YVvc3BNnqzGRiGfuUBPtor/m5JKZDjw8HhX5FA05EveWWTAU
   w==;
X-CSE-ConnectionGUID: jglcHoc1SE2VhSN/G3Zrcw==
X-CSE-MsgGUID: fo3vcC6VSUqzVURRnL6yjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="40576856"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="40576856"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 13:08:13 -0700
X-CSE-ConnectionGUID: SACGkGHgTmaiZpUz41muhw==
X-CSE-MsgGUID: Mkj4y+BuQLOa73X4Mpsg7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="44790673"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Jun 2024 13:08:12 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHqjy-0000MO-0z;
	Thu, 13 Jun 2024 20:08:10 +0000
Date: Fri, 14 Jun 2024 04:07:13 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 2/2] check.c:11:10: fatal error: 'xxhash.h'
 file not found
Message-ID: <202406140428.CQoj83Ht-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   77b952c11556f38dbdc95c25a04ff72c8fd20a1b
commit: 77b952c11556f38dbdc95c25a04ff72c8fd20a1b [2/2] todo
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240614/202406140428.CQoj83Ht-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406140428.CQoj83Ht-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406140428.CQoj83Ht-lkp@intel.com/

All errors (new ones prefixed by >>):

>> check.c:11:10: fatal error: 'xxhash.h' file not found
      11 | #include <xxhash.h>
         |          ^~~~~~~~~~
   In file included from arch/x86/special.c:4:
   In file included from tools/objtool/include/objtool/special.h:10:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   1 error generated.
   make[6]: *** [tools/build/Makefile.build:106: tools/objtool/arch/x86/special.o] Error 1
   make[6]: *** Waiting for unfinished jobs....
   In file included from weak.c:10:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   In file included from diff.c:1:
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
   In file included from arch/x86/orc.c:5:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/weak.o] Error 1
   make[5]: *** Waiting for unfinished jobs....
   In file included from objtool.c:16:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   1 error generated.
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/objtool.o] Error 1
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/special.o] Error 1
   In file included from orc_gen.c:12:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   1In file included from orc_dump.c:8:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
    error generated.
   In file included from builtin-check.c:10:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   make[6]: *** [tools/build/Makefile.build:106: tools/objtool/arch/x86/orc.o] Error 1
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/diff.o] Error 1
   1 error generated.
   In file included from elf.c:23:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/orc_gen.o] Error 1
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/orc_dump.o] Error 1
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/builtin-check.o] Error 1
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/check.o] Error 1
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/elf.o] Error 1
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
