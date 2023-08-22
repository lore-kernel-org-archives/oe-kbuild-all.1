Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BEF2B540
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 16:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692723039; x=1724259039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DkfhQMjHf2r9JMPGAZ7xL/RWClFyc+TNn7Yo26I+6AE=;
  b=W6S2btXaQ92YyRBOGyNvEingqgNCwgfcxO5+R138YA4ABOw8D/Lel5LI
   77F73VgvrmuKl0/22fV4Ie3S8qjvqyxjoe6FmYKSH+4xFUoe6Y5BXmxsH
   7H2fMbngghb37qxjuz3davdUlOXzchG0/hyguNLCVpxNAcCGLpQMe3+d7
   OoWX9NhEnwDgthFM52hacHxkPb6hcY14vdCVnJ4EALs99Gh8tAQ5a0t1S
   2PGesMl2y92K0YGkRfxnvsM0eFqOyzTAxfFZmO8roNArrZdPLQA+QomQP
   WNe2ofeCbCWJFr+ymNNUxsBExg8CVLEHQsfSvPS+PLe8HOsqlPvNBfXh8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="371354307"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="371354307"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 09:50:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="982968983"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="982968983"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 22 Aug 2023 09:50:37 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYUaT-0000M1-0Y;
	Tue, 22 Aug 2023 16:50:37 +0000
Date: Wed, 23 Aug 2023 00:50:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 21099/29943] gcc-7: error:
 unrecognized command line option '-ftrivial-auto-var-init=pattern'
Message-ID: <202308230038.xdemkgNl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi glider,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   6904826e1ac9739626b937fd85e37cf539fec91b
commit: a7eda6eddca559c1c3a897a35692f9d49d46c9dd [21099/29943] BACKPORT: security: allow using Clang's zero initialization for stack variables
config: i386-randconfig-r004-20230822 (https://download.01.org/0day-ci/archive/20230823/202308230038.xdemkgNl-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230038.xdemkgNl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230038.xdemkgNl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> gcc-7: error: unrecognized command line option '-ftrivial-auto-var-init=pattern'
   make[2]: *** [./Kbuild:22: kernel/bounds.s] Error 1 shuffle=3103413277
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1214: prepare0] Error 2 shuffle=3103413277
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:146: sub-make] Error 2 shuffle=3103413277
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
