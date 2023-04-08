Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AA61101
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Apr 2023 00:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680915257; x=1712451257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jLkkDk2jTfxMxwGmyzk7CPKubQgnm1R2n67JTiOsc2s=;
  b=mWLCjJs3zjVZsKVZhsrbactwebXX2Lqp7852l9rP7jQqqbjStgx6evDQ
   GiV8mQ4HZrFNMyqYgJ5EWULFwKzbz+9W2HqmCtz0yscJtALcplIVxaDak
   /t14JIfwmNpb1FLGcN9lUnGEKnhLdsLk+1cbpc84+v+iEu0JX2oumqMSP
   2xo/4nmV1yocBw5ZqUpeTvbrX+UUKwk/kKmTRWmwV3eItg6upd9RqOq6o
   aHh/+JP8+BHNZc+EKLMosF3aZRxWxC6azJiTBoGsi5xQN8wMxRkAy6sI5
   CmUL/IvyT9MdkYrRJ6yOPJZ5GZqniOUOOgaQtWUr2E8KnjI5/HDuw0XdZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="331751871"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="331751871"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 17:54:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="637867070"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="637867070"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Apr 2023 17:54:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkwqN-000T65-2o;
	Sat, 08 Apr 2023 00:54:15 +0000
Date: Sat, 8 Apr 2023 08:54:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Jiri Olsa <jolsa@kernel.org>
Subject: [jolsa-perf:bpf/kfunc_test_kmod_11 1/10] core.c:undefined reference
 to `bpf_get_kfunc_addr'
Message-ID: <202304080818.O5hnbZXr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/kfunc_test_kmod_11
head:   800be1c788532a9d97d80d4cd247f57a4ca33c15
commit: 520e119ba3943421840724d587f99ed86b83262c [1/10] bpf: Support 64-bit pointers to kfuncs
config: arm-randconfig-r046-20230408 (https://download.01.org/0day-ci/archive/20230408/202304080818.O5hnbZXr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=520e119ba3943421840724d587f99ed86b83262c
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf bpf/kfunc_test_kmod_11
        git checkout 520e119ba3943421840724d587f99ed86b83262c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080818.O5hnbZXr-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/bpf/core.o: in function `bpf_jit_get_func_addr':
>> core.c:(.text+0x5c04): undefined reference to `bpf_get_kfunc_addr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
