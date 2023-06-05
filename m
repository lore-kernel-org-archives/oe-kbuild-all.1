Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89329443A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 11:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685962803; x=1717498803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qHJ+zF9GU9U7yWRv7eQnX4xD5tv/1oI2pujDln2M5RY=;
  b=J9u0BHpyxBkbrbuQsowJ93yqJoouR7ha6D7/wQ5ZoD4A3DPTyF4kB3rm
   VijgoL06PxmWZpd+UOoOIqjnkjlUdql1DBEzI+vWaAApOMj8J8i9UgxCo
   Mm9Tn7EhVbvXwzwuAXcgUNrjP4zSDv0NFbOtwFrQGJpJDtKByt5hlFwo7
   kQihVbNttHr9p8Oe6Fv/skeiLyMhK/b5NqWCzA2p6s+jdhTSfIR+nyzkm
   Rg8vOng7cbsbIcNs62KJNyig0Z/J57V0SA9VgT4BpwnXA3NbV4jHFKeko
   qP5Z1PtIKYfLJmT/6kO/CkRe5d0jgolF4NIw9X94YObSwku7CKBhJi7J5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="358787356"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="358787356"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 04:00:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="659050185"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="659050185"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 05 Jun 2023 04:00:01 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q67wP-00048D-00;
	Mon, 05 Jun 2023 11:00:01 +0000
Date: Mon, 5 Jun 2023 18:59:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6907/6966]
 arch/x86/tests/amd-ibs-via-core-pmu.c:48:17: error: implicit declaration of
 function 'perf_pmu__scan'; did you mean 'perf_pmus__scan'?
Message-ID: <202306051823.Gbzkjb7e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9ca10bfb8aa8fbf19ee22e702c8cf9b66ea73a54
commit: f41a380e890d578d239157189f6edf5ddeed3897 [6907/6966] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=f41a380e890d578d239157189f6edf5ddeed3897
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout f41a380e890d578d239157189f6edf5ddeed3897
        make O=/tmp/kselftest headers
        make O=/tmp/kselftest -C tools/testing/selftests

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306051823.Gbzkjb7e-lkp@intel.com/

All errors (new ones prefixed by >>):

   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differs from latest version at 'include/uapi/drm/i915_drm.h'
   Warning: Kernel ABI header at 'tools/include/uapi/linux/fcntl.h' differs from latest version at 'include/uapi/linux/fcntl.h'
   Warning: Kernel ABI header at 'tools/include/uapi/linux/mount.h' differs from latest version at 'include/uapi/linux/mount.h'
   Warning: Kernel ABI header at 'tools/include/uapi/linux/perf_event.h' differs from latest version at 'include/uapi/linux/perf_event.h'
   Warning: Kernel ABI header at 'tools/include/uapi/sound/asound.h' differs from latest version at 'include/uapi/sound/asound.h'
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/perf_regs.h' differs from latest version at 'arch/arm64/include/uapi/asm/perf_regs.h'
   Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' differs from latest version at 'include/uapi/asm-generic/unistd.h'
   Warning: Kernel ABI header at 'tools/arch/arm64/include/asm/cputype.h' differs from latest version at 'arch/arm64/include/asm/cputype.h'
   Warning: Kernel ABI header at 'tools/include/uapi/linux/mman.h' differs from latest version at 'include/uapi/linux/mman.h'
   Warning: Kernel ABI header at 'tools/perf/arch/x86/entry/syscalls/syscall_64.tbl' differs from latest version at 'arch/x86/entry/syscalls/syscall_64.tbl'
   Warning: Kernel ABI header at 'tools/perf/arch/powerpc/entry/syscalls/syscall.tbl' differs from latest version at 'arch/powerpc/kernel/syscalls/syscall.tbl'
   Warning: Kernel ABI header at 'tools/perf/arch/s390/entry/syscalls/syscall.tbl' differs from latest version at 'arch/s390/kernel/syscalls/syscall.tbl'
   Warning: Kernel ABI header at 'tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl' differs from latest version at 'arch/mips/kernel/syscalls/syscall_n64.tbl'
   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/socket.h' differs from latest version at 'include/linux/socket.h'
   Makefile.config:1149: libpfm4 not found, disables libpfm4 support. Please install libpfm4-dev
     PERF_VERSION = 6.4.rc5.gf41a380e890d
   arch/x86/tests/amd-ibs-via-core-pmu.c: In function 'test__amd_ibs_via_core_pmu':
>> arch/x86/tests/amd-ibs-via-core-pmu.c:47:25: error: 'pmus' undeclared (first use in this function)
      47 |         if (list_empty(&pmus))
         |                         ^~~~
   arch/x86/tests/amd-ibs-via-core-pmu.c:47:25: note: each undeclared identifier is reported only once for each function it appears in
>> arch/x86/tests/amd-ibs-via-core-pmu.c:48:17: error: implicit declaration of function 'perf_pmu__scan'; did you mean 'perf_pmus__scan'? [-Werror=implicit-function-declaration]
      48 |                 perf_pmu__scan(NULL);
         |                 ^~~~~~~~~~~~~~
         |                 perf_pmus__scan
>> arch/x86/tests/amd-ibs-via-core-pmu.c:50:19: error: implicit declaration of function 'perf_pmu__find'; did you mean 'perf_pmus__find'? [-Werror=implicit-function-declaration]
      50 |         ibs_pmu = perf_pmu__find("ibs_op");
         |                   ^~~~~~~~~~~~~~
         |                   perf_pmus__find
>> arch/x86/tests/amd-ibs-via-core-pmu.c:50:17: error: assignment to 'struct perf_pmu *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
      50 |         ibs_pmu = perf_pmu__find("ibs_op");
         |                 ^
   cc1: all warnings being treated as errors
   make[8]: *** [tools/build/Makefile.build:97: tools/perf/arch/x86/tests/amd-ibs-via-core-pmu.o] Error 1
   make[8]: *** Waiting for unfinished jobs....
   make[7]: *** [tools/build/Makefile.build:140: tests] Error 2
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:140: x86] Error 2
   make[5]: *** [tools/build/Makefile.build:140: arch] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:675: tools/perf/perf-in.o] Error 2
   make[4]: *** Waiting for unfinished jobs....
   make[3]: *** [Makefile.perf:235: sub-make] Error 2
   make[2]: *** [Makefile:70: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
