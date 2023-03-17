Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6343179D6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 21:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679089342; x=1710625342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qIZg7iLGEmTP3NUcODrGTRm2a0eySbnfBc32iQIKEDs=;
  b=PMoeMBEA14jKCz4L/DEv4GDPgQhJRdY0YRlfxA3AJ7zHVourhYDHbuVd
   FA5Ug2BrLbatLuxmx+NCmhmavw4SaAV86wYUzCb2PoD6iOn0Z2OGrlRJm
   HyTgbQKZCydX/3x7JtNIvA4G51Y5PM9NOn6EuHHF/yTvRWwY/8ZXacif1
   /xg5/6Qhv2bC+x/MGtUeS4P+EfhQOjWAazVQSeO3MGuT4LRAiJXOstf0c
   FYljQP4AJV0lYOz0hkfmHs5VkjnULtm4UFLU58LhGpOpwQKBFVcUJUM2d
   aby7UhZ+trEr4BISMvCYD0XR3Dp38/5ikbDTG3zWvJJXX0iF7BwfB0PZh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="340725195"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="340725195"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 14:42:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="744686526"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="744686526"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 Mar 2023 14:42:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdHq7-0009aQ-1v;
	Fri, 17 Mar 2023 21:42:19 +0000
Date: Sat, 18 Mar 2023 05:41:21 +0800
From: kernel test robot <lkp@intel.com>
To: Viktor Malik <vmalik@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [bpf-next:master 1/2] verifier.c:undefined reference to
 `find_kallsyms_symbol_value'
Message-ID: <202303180542.lcl3k5Vu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   0f10f647f45545004ea50b73a7a7c5c3309ff286
commit: bd5314f8dd2d41330eecb60f0490c3fcfe1fc99d [1/2] kallsyms, bpf: Move find_kallsyms_symbol_value out of internal header
config: m68k-randconfig-r016-20230312 (https://download.01.org/0day-ci/archive/20230318/202303180542.lcl3k5Vu-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=bd5314f8dd2d41330eecb60f0490c3fcfe1fc99d
        git remote add bpf-next https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
        git fetch --no-tags bpf-next master
        git checkout bd5314f8dd2d41330eecb60f0490c3fcfe1fc99d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303180542.lcl3k5Vu-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 1294
   kernel/bpf/verifier.o: in function `bpf_check_attach_target':
>> verifier.c:(.text+0x158dc): undefined reference to `find_kallsyms_symbol_value'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
