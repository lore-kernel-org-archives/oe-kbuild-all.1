Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20A510F6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 16:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676997573; x=1708533573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q4yjG6+d4H5pzc4zI7a1W4/L/bB47dwVNihMnNdY7WI=;
  b=W1oKkqbePqzRsP7+J+l3tcH4r7d1Z4rFRH+a1es0WTh3G9dcm41npLbD
   ZLKThe71g+uw+tVUOVI/WilFMrdXa40s0UZFbNfks+hwri3msmeyF+F4g
   fMzwJi6YzVNkPKq67sp8TB8T33VqCB/mRD+90rLXOIOF7occuP9wur3oB
   Bqtr5lqhPGyEe7V4XM8QfjxWHxvDLha3WL+52rPMVVl1ogMWdYlXM8SAP
   umLH0DsOfhErXnQtVlJ4/StQCzF2vr3vZh4pjvZg/Yl+PERnPKhW9wwnQ
   6fJJC9fYaXwFt+sp/qzto05qGk6dQAsCYCisHXLkUYY0n7m45Vd6fx/10
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334877887"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="334877887"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 08:39:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="814564771"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="814564771"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2023 08:39:28 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUVfr-00002f-1Q;
	Tue, 21 Feb 2023 16:39:27 +0000
Date: Wed, 22 Feb 2023 00:39:11 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:dev-6.1 58/91] mips-linux-ld: aspeed-sbc.c:undefined
 reference to `arch_debugfs_dir'
Message-ID: <202302220005.dzB2RsYJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux dev-6.1
head:   cac6306557586ba4479dab12c3e5efcb67e63388
commit: 41fc60d981ec602b7330c941e426e94298b98f2c [58/91] ARM: soc: aspeed: Add secure boot controller support
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230222/202302220005.dzB2RsYJ-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/shenki/linux/commit/41fc60d981ec602b7330c941e426e94298b98f2c
        git remote add shenki https://github.com/shenki/linux
        git fetch --no-tags shenki dev-6.1
        git checkout 41fc60d981ec602b7330c941e426e94298b98f2c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302220005.dzB2RsYJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kernel/head.o: in function `kernel_entry':
   (.ref.text+0xac): relocation truncated to fit: R_MIPS_26 against `start_kernel'
   init/main.o: in function `set_reset_devices':
   main.c:(.init.text+0x20): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x30): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `debug_kernel':
   main.c:(.init.text+0xa4): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0xb4): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `quiet_kernel':
   main.c:(.init.text+0x128): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x138): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `warn_bootconfig':
   main.c:(.init.text+0x1ac): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x1bc): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `init_setup':
   main.c:(.init.text+0x234): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x254): additional relocation overflows omitted from the output
   mips-linux-ld: drivers/soc/aspeed/aspeed-sbc.o: in function `aspeed_sbc_init':
   aspeed-sbc.c:(.init.text+0x20c): undefined reference to `arch_debugfs_dir'
>> mips-linux-ld: aspeed-sbc.c:(.init.text+0x210): undefined reference to `arch_debugfs_dir'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
