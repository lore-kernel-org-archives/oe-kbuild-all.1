Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09FA2F31
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 12:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676031817; x=1707567817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f8KdOm6y99T6gnOphsgVBCjs3EXT0H7dVvkSi/ZyqZc=;
  b=UFt+IUINO4qe8aPgzr1DyFLBKzuqySeSPjBpp3jJn+WFShuXIrNvJ8pu
   udVBXcMK98k6x+ZlHliTO/tK2t9tJROV43+zRdAf6KTMsh0pHPMxbOAto
   q4Kz/FsmN/G+lVwuyBvpM1u53obSgelPuCO1q+Ea1CbMyQqwzPoP21SBh
   ms+8TYSEB8qJd0jW5Mv+MMLv/P5L4C7lGDMbGK1xc6+nMTf+sNPPYUj5N
   wq7uAbj32HfPvxfJukkj1pKbntDU/KjOUaCFDx2UFSS+IznEWYw6/twYN
   Mlei94thH2jlVUO0t/8VWuT4CmDw7FYy1EScm9kjTKNnvmkYIqR6avJTK
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="330414542"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="330414542"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 04:23:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="810802494"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="810802494"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2023 04:23:35 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQSRC-0005nR-2R;
	Fri, 10 Feb 2023 12:23:34 +0000
Date: Fri, 10 Feb 2023 20:23:05 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: alt-syscall.c:undefined reference to `__sys_socket'
Message-ID: <202302102054.X6zTKnGZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrew,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: d7a6fd5725bab52c70e0582a8f449d5619c8df51 CHROMIUM: ARM64: Add alt-syscall support
date:   2 years, 2 months ago
config: arm64-randconfig-c033-20230210 (https://download.01.org/0day-ci/archive/20230210/202302102054.X6zTKnGZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=d7a6fd5725bab52c70e0582a8f449d5619c8df51
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout d7a6fd5725bab52c70e0582a8f449d5619c8df51
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302102054.X6zTKnGZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In function 'alt_syscall_init_one',
       inlined from 'chromiumos_alt_syscall_init' at security/chromiumos/alt-syscall.c:530:9,
       inlined from 'chromiumos_alt_syscall_init' at security/chromiumos/alt-syscall.c:514:12:
>> security/chromiumos/alt-syscall.c:491:9: warning: 'strncpy' specified bound 33 equals destination size [-Wstringop-truncation]
     491 |         strncpy(t->name, wl->name, sizeof(t->name));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   aarch64-linux-ld: warning: -z norelro ignored
   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: security/chromiumos/alt-syscall.o: in function `android_socket':
>> alt-syscall.c:(.text+0xe0): undefined reference to `__sys_socket'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
