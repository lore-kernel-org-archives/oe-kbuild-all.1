Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABE1101E1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jul 2023 17:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688405060; x=1719941060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zoqHDr5wLGUz/p66SxgIlMXUC9CGpxNAmEXt0GDB5es=;
  b=mc2AmeP3dx6heUY993o28PQn761KNvqefP9BJzJ+dVXZoqWRK3hCavQN
   GcQrsK0ovcrz/229ytHHXbs7xOjKME0rwYVXq24OOM+/dy6BcorQQ7xK0
   O7GIwxGmoyhjO2hCfPOtMKaZ4OPN9TuyFx1IKQtNyJIuNFW8AXVYRAl5Y
   /+m24Nzf/3lK/vjWG4uAQb31tk+enBxuD9uJC5gz4jczKbDXV2pOEHgOx
   Q87TJTy+S1V+9Nbc6QOdgkpemUNsUvcqtDMXtSWvaxwhHsFD1bsSx9LyS
   F8qDH69+oaAAjgcJSfu1+gdposbfcU1U3Mlqni59oQBzBjUqp1E/Zevzh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="347722222"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="347722222"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 10:24:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="1049148768"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="1049148768"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Jul 2023 10:24:17 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGNHc-000HWC-24;
	Mon, 03 Jul 2023 17:24:16 +0000
Date: Tue, 4 Jul 2023 01:24:09 +0800
From: kernel test robot <lkp@intel.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 67/89]
 kernel/kexec_core.c:(.text.__crash_kexec+0x88): undefined reference to
 `machine_crash_shutdown'
Message-ID: <202307040141.Pk8IMwgE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   f30ee81787a5abee6c7c72b0fcc30d428319c449
commit: 1b0ee7ecbaebf3d7b9e31b529ed94f4880c495f5 [67/89] mips/kexec: refactor for kernel/Kconfig.kexec
config: mips-randconfig-r062-20230703 (https://download.01.org/0day-ci/archive/20230704/202307040141.Pk8IMwgE-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307040141.Pk8IMwgE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307040141.Pk8IMwgE-lkp@intel.com/

All errors (new ones prefixed by >>):

   mipsel-linux-ld: kernel/kexec_core.o: in function `__crash_kexec':
>> kernel/kexec_core.c:(.text.__crash_kexec+0x88): undefined reference to `machine_crash_shutdown'
>> mipsel-linux-ld: kernel/kexec_core.c:(.text.__crash_kexec+0x90): undefined reference to `machine_kexec'
   mipsel-linux-ld: kernel/kexec_core.o: in function `kernel_kexec':
>> kernel/kexec_core.c:(.text.kernel_kexec+0x98): undefined reference to `machine_shutdown'
>> mipsel-linux-ld: kernel/kexec_core.c:(.text.kernel_kexec+0xa0): undefined reference to `machine_kexec'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
