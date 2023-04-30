Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C9E644
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Apr 2023 08:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682843425; x=1714379425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xHtJVUpepZ/08IQR0gZg205bEVCM3PAELJoyRRLzmjI=;
  b=lBI49zC1FTyQ9GkXAR3aJU00Lx8K1Jt7LvqJogWcvcTgS9e5etHgdAV6
   EzQZ32KhQznavC4U5qilCnbEJtTInlQlr4xXzCKILGaQApv4CeA+aGLJ7
   eYKcYVgbc7mcDnkSZ2sW5kMFQHU5yhraqcrGQRM1yAVsQ6szCVUkuVVb0
   T52ojZP7QsTaGhuBjFd/a4W0s341Xa6j7hR94Lj/kD2lbSSRw27FdkPeg
   dGNEcInd+uEbdMmNAsvRecpmXxJOjsTfR6wsAzSXPoazMcwoBrCJPPQOw
   6XwqvZLmq7fBELoCcst3voJUmWG1qWp4iF+5mo+NxN/wLF6WrU2hbM2bv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="376034467"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="376034467"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 01:30:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="839493108"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="839493108"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 30 Apr 2023 01:30:22 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pt2Rp-0001Zp-3D;
	Sun, 30 Apr 2023 08:30:22 +0000
Date: Sun, 30 Apr 2023 16:30:07 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: riscv64-linux-ld: warning: orphan section `.init.data.rel.ro.local'
 from `arch/riscv/kernel/pi/lib-fdt.pi.o' being placed in section
 `.init.data.rel.ro.local'
Message-ID: <202304301606.Cgp113Ha-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   825a0714d2b3883d4f8ff64f6933fb73ee3f1834
commit: 26e7aacb83dfd04330673c5c9ac336560da52bb3 riscv: Allow to downgrade paging mode from the command line
date:   4 days ago
config: riscv-randconfig-r005-20230430 (https://download.01.org/0day-ci/archive/20230430/202304301606.Cgp113Ha-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=26e7aacb83dfd04330673c5c9ac336560da52bb3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 26e7aacb83dfd04330673c5c9ac336560da52bb3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304301606.Cgp113Ha-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> riscv64-linux-ld: warning: orphan section `.init.data.rel.ro.local' from `arch/riscv/kernel/pi/lib-fdt.pi.o' being placed in section `.init.data.rel.ro.local'
>> riscv64-linux-ld: warning: orphan section `.init.printk_index' from `arch/riscv/kernel/pi/lib-fdt.pi.o' being placed in section `.init.printk_index'
>> riscv64-linux-ld: warning: orphan section `.init.data.rel.ro.local' from `arch/riscv/kernel/pi/lib-fdt.pi.o' being placed in section `.init.data.rel.ro.local'
>> riscv64-linux-ld: warning: orphan section `.init.printk_index' from `arch/riscv/kernel/pi/lib-fdt.pi.o' being placed in section `.init.printk_index'
>> riscv64-linux-ld: warning: orphan section `.init.data.rel.ro.local' from `arch/riscv/kernel/pi/lib-fdt.pi.o' being placed in section `.init.data.rel.ro.local'
>> riscv64-linux-ld: warning: orphan section `.init.printk_index' from `arch/riscv/kernel/pi/lib-fdt.pi.o' being placed in section `.init.printk_index'
>> riscv64-linux-ld: warning: orphan section `.init.data.rel.ro.local' from `arch/riscv/kernel/pi/lib-fdt.pi.o' being placed in section `.init.data.rel.ro.local'
>> riscv64-linux-ld: warning: orphan section `.init.printk_index' from `arch/riscv/kernel/pi/lib-fdt.pi.o' being placed in section `.init.printk_index'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
