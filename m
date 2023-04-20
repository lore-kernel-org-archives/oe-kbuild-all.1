Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C948F68
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 19:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682017854; x=1713553854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5dWQSrdDhk3uXINvg2TJSPTopspo5jLMRbVoYb1SusA=;
  b=N6x397WJ/V5ovHUSegTrEyFEdkrF1h6vYMK52QE+0gbxjDYDJDG5UM6V
   ME2tWYT9PN4cpJhMC0uxw+pllgpH1k1OM4GDby+tip1eda9b5WLYAjBkr
   Wz7S4kn85O4j09ZNeg5hzexCNKA4mo1X6/rd3KmeYfjBMJeTe+VKipZha
   Bv/ACNiN8/FjHxYa9Pqi97wTyrMjCPJoQlQ1wrG0S7xyxbJJ5AK5hMC1a
   259SejcB4BpI7c83BBc8bbAdVeO1GxQn+DrFLpJCAKf/gszx/OXt48DED
   D2UTKAS25MkNC4aVu7slKo/ktEypappE9yuuGdooAQSY1uQlNSByyFSiM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="325433024"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="325433024"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 12:10:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="816140841"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="816140841"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 20 Apr 2023 12:10:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppZgB-000g1y-1n;
	Thu, 20 Apr 2023 19:10:51 +0000
Date: Fri, 21 Apr 2023 03:10:22 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-linux-6.1.y-wip 246/288] undefined reference to
 `dma_buf_unmap_attachment'
Message-ID: <202304210345.qT25d5bL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   e249b4f6431ccee4c4b2f3b95e5f47fb6600f35f
commit: a6d074da1a95aa77f6d6315d7c454623ff578a7e [246/288] HACK: misc: Add dma-buf to physical address exporter
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20230421/202304210345.qT25d5bL-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-linux-6.1.y-wip
        git checkout a6d074da1a95aa77f6d6315d7c454623ff578a7e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304210345.qT25d5bL-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/misc/dma-buf-phys.o: in function `dma_buf_phys_release':
>> (.text+0x58): undefined reference to `dma_buf_unmap_attachment'
>> hppa-linux-ld: (.text+0x74): undefined reference to `dma_buf_put'
>> hppa-linux-ld: (.text+0xa8): undefined reference to `dma_buf_detach'
   hppa-linux-ld: drivers/misc/dma-buf-phys.o: in function `dma_buf_phys_ioctl':
>> (.text+0x1e4): undefined reference to `dma_buf_get'
>> hppa-linux-ld: (.text+0x1f8): undefined reference to `dma_buf_attach'
>> hppa-linux-ld: (.text+0x20c): undefined reference to `dma_buf_map_attachment'
>> hppa-linux-ld: (.text+0x278): undefined reference to `dma_buf_unmap_attachment'
   hppa-linux-ld: (.text+0x28c): undefined reference to `dma_buf_detach'
   hppa-linux-ld: (.text+0x29c): undefined reference to `dma_buf_put'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
