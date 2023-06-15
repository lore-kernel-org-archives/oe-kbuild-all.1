Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FA6567B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 08:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686817831; x=1718353831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QskzszjrhogeOl1D0645DmGzlntmUlbWhrL18KNhaqQ=;
  b=VToY40PdlmBUinWsdgT3qEucb5KpSEPMMEo41g8SL9tGj9roVFw79Z3I
   sZFb/cpx6jn8SKCBsYUBwuacRMWSj+uXW3AdDXZIS6MPV8tL3HsAEbuqB
   W7Fi0MRJ25qjdIB4qk+n7sciI5S3UZoeelLc0W6ZytBeCtp9xrcuY9tp9
   GQJa4xVNY1h361Y6abWXFhH/YSpMQcVG4P5mrgqDXz9qNS4Seg9o2RBTK
   WpQPc4mdupWUl8jC9oHcEHcPQBL+kBx4mbjZpuOfsULT/CH9lBnNIpTBn
   PHCzcyfRhym5IQ+kBXTjE0vI3QoeqhhuU9HqEQSZktx01L2S+6lX+VIkY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="348520853"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="348520853"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 01:30:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="706568777"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="706568777"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Jun 2023 01:30:27 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9iMs-0001eR-2G;
	Thu, 15 Jun 2023 08:30:15 +0000
Date: Thu, 15 Jun 2023 16:29:27 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: riscv64-linux-ld: section .init.pi.text LMA
 [000000000197e820,0000000001981733] overlaps section .data..percpu LMA
 [0000000001951000,0000000001b219d7]
Message-ID: <202306151631.3uZmHI1c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b6dad5178ceaf23f369c3711062ce1f2afc33644
commit: 3b90b09af5be42491a8a74a549318cfa265b3029 riscv: Fix orphan section warnings caused by kernel/pi
date:   5 weeks ago
config: riscv-randconfig-r004-20230615 (https://download.01.org/0day-ci/archive/20230615/202306151631.3uZmHI1c-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3b90b09af5be42491a8a74a549318cfa265b3029
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3b90b09af5be42491a8a74a549318cfa265b3029
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151631.3uZmHI1c-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: section .data LMA [0000000000261000,00000000007d98cf] overlaps section .text LMA [00000000000a7a50,000000000197e81f]
>> riscv64-linux-ld: section .init.pi.text LMA [000000000197e820,0000000001981733] overlaps section .data..percpu LMA [0000000001951000,0000000001b219d7]
>> riscv64-linux-ld: section .init.pi.rodata.str1.8 VMA [ffffffff821f3ed0,ffffffff821f3f3a] overlaps section .data VMA [ffffffff82000000,ffffffff825788cf]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
