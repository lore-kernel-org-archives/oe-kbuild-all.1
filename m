Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A352393
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 06:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718345503; cv=none; b=fj7QYVfvrxaksHDyiZ+3PpO9gU9ys4JjzcDPf/sX2lbG0TiaSER7snGZbUqd9kIVmUMKnPdB3JS25hURrLuy79HL4wzu4BQvx8ZNafwCYi13hbRa/Ufc2G5zJHSLOK0lccSMn6/hkcorx+QEOyDAkHmpxdYcGv3dmAC/zeiT/mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718345503; c=relaxed/simple;
	bh=aRIKCsMVyWtl0DiuuyFyRi+BRLDW+0sksHN9GotFmyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rzPyyjkt8UTAfzfq9eq9uQV+HG++RKmUz1Ul7dcHLv5ATX+ngrSGbdMXmN+RjpNXFXxmW9Eo8d7ESGjG7ZN3wWOk6ruQk+RxouoAIjp1DFY1Y4qMRr7l2kQ5J9pcllixJYAozDl662/inPZIvOyNG6FKzfri+6q1PIPQuWNQtBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SBLPXVmP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SBLPXVmP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718345502; x=1749881502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aRIKCsMVyWtl0DiuuyFyRi+BRLDW+0sksHN9GotFmyk=;
  b=SBLPXVmPJif2XGttShjCEKL4Plo0CO1nO4tdaMY58HbAg3GZkpQIy2fT
   EvK9UIcU9TY+KwqRlOli1dludEkHMP4gDJg2t93QxRFh79TC5ol0lR9uO
   W5y1Wv8X3MkDj/hpeu+Hk5FNw/lOGt+suhm7gxEFT+vDlcWHWC0gwqkc9
   7q8Glwew93dgltp4FKfrLmB5JZ5Ih1hC5nGmq2s7Wc6zQP+gCCnDYNUdN
   3Hjopqh/6fjhcuRTSu5sXqfQExlbu52xHD2MJ4iV9OtVutSfi1pjxHoTs
   +zDjbEEqVjXeKeIr8W1P8ja7J/FVf6qqexxSb75cwHzdj6CZsi6b/fyhk
   A==;
X-CSE-ConnectionGUID: SRog6wxNQm+Tl6ltHExUdw==
X-CSE-MsgGUID: Jes74MmqQc+J7PR5tP8v+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15050991"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="15050991"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 23:11:41 -0700
X-CSE-ConnectionGUID: Q2RTQFn/RdGQowDBqf6KsA==
X-CSE-MsgGUID: xlySmov5R4qA8+f2ua+CfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="40247569"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jun 2024 23:11:39 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI09x-0000uS-2p;
	Fri, 14 Jun 2024 06:11:37 +0000
Date: Fri, 14 Jun 2024 14:11:03 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 2/2] check.c:11:10: fatal error: 'xxhash.h'
 file not found
Message-ID: <202406141437.SLYm5DNK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   af4575990fb869acf3622d8c5509239c66778742
commit: af4575990fb869acf3622d8c5509239c66778742 [2/2] todo
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240614/202406141437.SLYm5DNK-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406141437.SLYm5DNK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406141437.SLYm5DNK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> check.c:11:10: fatal error: 'xxhash.h' file not found
      11 | #include <xxhash.h>
         |          ^~~~~~~~~~
   In file included from weak.c:10:
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
   In file included from diff.c:1:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   1 error generated.
   In file included from orc_gen.c:12:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:13:
   tools/objtool/include/objtool/elf.h:17:builtin-check.c10::10 :
   fatal error: In file included from 'xxhash.h' file not foundtools/objtool/include/objtool/objtool.h
   :13:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhas   h17. | h#>i
   n      c| l         ^~~~~~~~~~u
   de <xxhash.h>
         |          ^~~~~~~~~~
   In file included from arch/x86/special.c:4:
   In file included from tools/objtool/include/objtool/special.h:10:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/weak.o] Error 1
   make[5]: *** Waiting for unfinished jobs....
   In file included from arch/x86/orc.c:5:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   In file included from elf.c:23:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   In file included from objtool.c:16:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   In file included from orc_dump.c:8:
   In file included from tools/objtool/include/objtool/objtool.h:13:
   1 error generated.
>> tools/objtool/include/objtool/elf.h:17:10: fatal error: 'xxhash.h' file not found
      17 | #include <xxhash.h>
         |          ^~~~~~~~~~
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/special.o] Error 1
   1 error generated.
   1 error generated.
   1 error generated.
   make[6]: *** [tools/build/Makefile.build:106: tools/objtool/arch/x86/special.o] Error 1
   make[6]: *** Waiting for unfinished jobs....
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/builtin-check.o] Error 1
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/orc_gen.o] Error 1
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/objtool.o] Error 1
   1 error generated.
   make[6]: *** [tools/build/Makefile.build:106: tools/objtool/arch/x86/orc.o] Error 1
   1 error generated.
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/diff.o] Error 1
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/orc_dump.o] Error 1
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
