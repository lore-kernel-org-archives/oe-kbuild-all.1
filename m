Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43841A949
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 06:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687330021; x=1718866021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IcPWc3+kNtV6KHFjiciFksS255H6lfowUCvfoywr47E=;
  b=PeHsS9y6SBHtXsgV3rYO1lAUFZGiFPYZLmfGeYy3M5oLD8lMBNXt0w8g
   u8mDClxYGksX+yTI3+MgZgrj2O+zYyeKRn4i+D02VF2QAiAxzWJW5Bw68
   BxZHQPlW+hd/mQIR/87SXeIoU5eo+ihOMPplsiayEuIENTaJmt0DIyzse
   rCH7NpMR45I542qyDB3PUXLPGRrMhkVZmXLtfswyHofLyONH1RRk8mYRu
   MKnfjmK2GPPh6oRRLdG+gSFiE0Bbhh6GsXEy5MPEpPSA2kRsXBnofoIay
   rse6Wuwr+lWXvIVwGMzHbSvQdtywCb+5BkHVeGBdAJ+2bjqKyctABlRUC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="340428820"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="340428820"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 23:47:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="717511707"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="717511707"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jun 2023 23:46:59 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBrcI-0006cd-1S;
	Wed, 21 Jun 2023 06:46:58 +0000
Date: Wed, 21 Jun 2023 14:46:02 +0800
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:pr/159 3/3] error: include/uapi/drm/ane_accel.h: missing
 "WITH Linux-syscall-note" for SPDX-License-Identifier
Message-ID: <202306211423.Jacr8riU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux pr/159
head:   26d8a0ff3ba04a8aed94e1ebf8390c80c34a2d72
commit: 26d8a0ff3ba04a8aed94e1ebf8390c80c34a2d72 [3/3] accel: ane: add driver for the Apple Neural Engine
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230621/202306211423.Jacr8riU-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306211423.Jacr8riU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306211423.Jacr8riU-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-gcc: error: unrecognized command-line option '-mexplicit-relocs'
   /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
   /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
   /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
   /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
   /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
   /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
   /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> error: include/uapi/drm/ane_accel.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
   make[2]: *** [scripts/Makefile.headersinst:63: usr/include/drm/ane_accel.h] Error 1
   make[2]: Target '__headers' not remade because of errors.
   make[1]: *** [Makefile:1382: headers] Error 2
   /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
   loongarch64-linux-gcc: error: unrecognized command-line option '-mexplicit-relocs'
   loongarch64-linux-gcc: error: unrecognized command-line option '-mexplicit-relocs'
   loongarch64-linux-gcc: error: unrecognized command-line option '-mdirect-extern-access'
   make[2]: *** [scripts/Makefile.build:252: scripts/mod/empty.o] Error 1
   loongarch64-linux-gcc: error: unrecognized command-line option '-mdirect-extern-access'
   make[2]: *** [scripts/Makefile.build:114: scripts/mod/devicetable-offsets.s] Error 1
   make[2]: Target 'scripts/mod/' not remade because of errors.
   make[1]: *** [Makefile:1285: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
