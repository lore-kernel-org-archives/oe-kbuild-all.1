Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AC28F68
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 19:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682020314; x=1713556314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JVMN+HfWItjr5UXurPVR7GLTYbHTHBh/otec95MSzMQ=;
  b=VlweNR6E5IRuRJXt4ub5hJ0ehNMrs2yiI4WMNwfgGy59P6sEX24NKLiW
   B9IKPke9p0/EoUB1B02q+D4BncX9Z4Cyki3dBpiaxbZlzPu10jE2pAVsO
   7p4KoqusHB756btjezgsiqxXTWwXxn7K+TDZ0ilFP9FhKYVPtOCuMJNCG
   NuinnIBmhVYrVf9jPp0m/1t8QM+sW53WYNoMlrna+d19bgawzxYW/5H0u
   6xFIO0wrBx8SR2tY9kNURuxKcpzbAGFjMHcfUJdZqkdNvPUHznpgjlpbH
   dZMI41eOyfSE14CPhkZKK6zCg4fZ4EP3Xy9WnKjCPIEenzLrjqfusYRql
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="334706074"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="334706074"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 12:51:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="724550538"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="724550538"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Apr 2023 12:51:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppaJs-000g2u-0g;
	Thu, 20 Apr 2023 19:51:52 +0000
Date: Fri, 21 Apr 2023 03:51:18 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 256/300] dma-buf-phys.c:undefined
 reference to `dma_buf_unmap_attachment'
Message-ID: <202304210316.fGSu9IFF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   df3af5f1d7a8b852d828b75273b02e5654106a5c
commit: a6d074da1a95aa77f6d6315d7c454623ff578a7e [256/300] HACK: misc: Add dma-buf to physical address exporter
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230421/202304210316.fGSu9IFF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout a6d074da1a95aa77f6d6315d7c454623ff578a7e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304210316.fGSu9IFF-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/misc/dma-buf-phys.o: in function `dma_buf_phys_release':
>> dma-buf-phys.c:(.text+0x32): undefined reference to `dma_buf_unmap_attachment'
>> m68k-linux-ld: dma-buf-phys.c:(.text+0x4c): undefined reference to `dma_buf_detach'
>> m68k-linux-ld: dma-buf-phys.c:(.text+0x5c): undefined reference to `dma_buf_put'
   m68k-linux-ld: drivers/misc/dma-buf-phys.o: in function `dma_buf_phys_ioctl':
>> dma-buf-phys.c:(.text+0x120): undefined reference to `dma_buf_get'
>> m68k-linux-ld: dma-buf-phys.c:(.text+0x13a): undefined reference to `dma_buf_attach'
   m68k-linux-ld: dma-buf-phys.c:(.text+0x14e): undefined reference to `dma_buf_put'
>> m68k-linux-ld: dma-buf-phys.c:(.text+0x15c): undefined reference to `dma_buf_map_attachment'
>> m68k-linux-ld: dma-buf-phys.c:(.text+0x188): undefined reference to `dma_buf_unmap_attachment'
   m68k-linux-ld: dma-buf-phys.c:(.text+0x19a): undefined reference to `dma_buf_detach'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
