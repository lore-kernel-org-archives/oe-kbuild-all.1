Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D46A1DDE6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 16:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692721827; x=1724257827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F8gV5GNo0ezrjvrBbIaoFSMoTHof3O/Sl4eblcSDVq0=;
  b=cDSakEQH4ErpjzmW3gux29uNxKR0mRqfvaY7ugqCE8YqZdPPtc4rW7Jn
   Gjxu9S6lD06PkbBFoTXYzaIRmta0ZS9OCxE9niZkDH0hTj1Z30fTcrk+n
   XAKwzMhx/TdvkPOEww+CopLJY9EChTLI+BNuh3HfW13mYa8MEmIL/j0lS
   deTzl3Ij+RpmJnmB0HnAFEp4j/Nq80uiss8BqITz635G7dIniNEtABhb2
   yaj5X3WMq19E8V/SuCcxQOocTqA1BG5rjmsuSRnX9wrxH1i2bvZK1HzAI
   +fiRYI1WN96r4ZqBMIY5suns1G+4BOH4jwT2E+Qwnetg0eoNZCGBvfOqX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="364108529"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="364108529"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 09:29:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="806357753"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="806357753"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2023 09:29:48 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYUG4-0000L8-14;
	Tue, 22 Aug 2023 16:29:38 +0000
Date: Wed, 23 Aug 2023 00:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 13509/29943] aarch64-linux-gcc:
 error: unrecognized argument to -fsanitize= option: 'kernel-hwaddress'; did
 you mean 'kernel-address'?
Message-ID: <202308230024.BdrYqnQt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrey,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   6904826e1ac9739626b937fd85e37cf539fec91b
commit: 7b34bf934ffd12c171001edd3d6f0c70abb6ae47 [13509/29943] UPSTREAM: kasan, arm64: select HAVE_ARCH_KASAN_SW_TAGS
config: arm64-randconfig-r033-20230822 (https://download.01.org/0day-ci/archive/20230823/202308230024.BdrYqnQt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230024.BdrYqnQt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230024.BdrYqnQt-lkp@intel.com/

All errors (new ones prefixed by >>):

   ../libexec/gcc/aarch64-linux/7.5.0/cc1: error while loading shared libraries: libmpfr.so.4: cannot open shared object file: No such file or directory
   ../libexec/gcc/aarch64-linux/7.5.0/cc1: error while loading shared libraries: libmpfr.so.4: cannot open shared object file: No such file or directory
   ../libexec/gcc/aarch64-linux/7.5.0/cc1: error while loading shared libraries: libmpfr.so.4: cannot open shared object file: No such file or directory
   ../libexec/gcc/aarch64-linux/7.5.0/cc1: error while loading shared libraries: libmpfr.so.4: cannot open shared object file: No such file or directory
>> aarch64-linux-gcc: error: unrecognized argument to -fsanitize= option: 'kernel-hwaddress'; did you mean 'kernel-address'?
   aarch64-linux-gcc: error: unrecognized command line option '-mllvm'
   aarch64-linux-gcc: error: unrecognized command line option '-mllvm'
   make[2]: *** [./Kbuild:22: kernel/bounds.s] Error 1 shuffle=3805320597
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1157: prepare0] Error 2 shuffle=3805320597
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:146: sub-make] Error 2 shuffle=3805320597
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
