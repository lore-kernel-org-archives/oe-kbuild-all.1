Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA60322E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Feb 2023 21:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676843690; x=1708379690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iiBjTfTTC2v5WrzBQZLMRdks7yYvulBFjR4GPj0Og1U=;
  b=gfPJSJNBPDgzkIYdN0aCBnRX5/XiS4dCCA4R8OmVYKQe7xyJONX8PZLV
   R0FpTKgIgk18NUDZOTJlPmT9w1SxVNN/XJytYubDcHtRlMYAoO3iQPoTj
   XHYRAFqCvVjIoyKs2zgh+DD7yDqK69WlZomepVNMibTb/RVp2zClZEGj5
   jvLKGxosPApa0cs7YnYz4qh/a9jpOZy3bW2ta/sMt0+jaBQD4zDfEcesY
   ZfSY4NkUqLkLZ6TNbnt0ki5VyWfuippepe1HAQbMu0tCSAr72Ww0SaesN
   rCsyX2FlJv6HkSwvagEfjApbZtLwYUOWiSXs3eYEAofcRo8OU9NsyRewn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="334489717"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="334489717"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 13:54:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="759970391"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="759970391"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Feb 2023 13:54:48 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTrdw-000DT9-0R;
	Sun, 19 Feb 2023 21:54:48 +0000
Date: Mon, 20 Feb 2023 05:54:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:atcphy-20230219 47/54]
 protocol_adapter.c:(.init.text+0x0): multiple definition of `init_module';
 drivers/thunderbolt/nhi.o:nhi.c:(.init.text+0x0): first defined here
Message-ID: <202302200507.j4rrj08w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux atcphy-20230219
head:   9928386c36c8def0becc6ce2db8f18f2111f9b3c
commit: 2845c3ae937f4ede4d68ba7299c48b55100ba3f5 [47/54] thunderbolt: Add Apple Silicon support
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230220/202302200507.j4rrj08w-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/2845c3ae937f4ede4d68ba7299c48b55100ba3f5
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux atcphy-20230219
        git checkout 2845c3ae937f4ede4d68ba7299c48b55100ba3f5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200507.j4rrj08w-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/thunderbolt/protocol_adapter.o: in function `tb_protocol_adapter_init':
>> protocol_adapter.c:(.init.text+0x0): multiple definition of `init_module'; drivers/thunderbolt/nhi.o:nhi.c:(.init.text+0x0): first defined here
   riscv64-linux-ld: drivers/thunderbolt/protocol_adapter.o: in function `tb_protocol_adapter_exit':
>> protocol_adapter.c:(.exit.text+0x0): multiple definition of `cleanup_module'; drivers/thunderbolt/nhi.o:nhi.c:(.exit.text+0x0): first defined here
   riscv64-linux-ld: drivers/thunderbolt/nhi_apple.o: in function `apple_cio_driver_init':
   nhi_apple.c:(.init.text+0x0): multiple definition of `init_module'; drivers/thunderbolt/nhi.o:nhi.c:(.init.text+0x0): first defined here
   riscv64-linux-ld: drivers/thunderbolt/nhi_apple.o: in function `apple_cio_driver_exit':
   nhi_apple.c:(.exit.text+0x0): multiple definition of `cleanup_module'; drivers/thunderbolt/nhi.o:nhi.c:(.exit.text+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
