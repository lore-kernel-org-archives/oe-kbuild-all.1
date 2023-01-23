Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC632FAF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 14:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674483312; x=1706019312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q4Q6A0JYx7HywmnqMTJ30S1kOKDvdbjrEW2HNCPmWe0=;
  b=IY49SKZwSqt+ds6Ql9XdqgrjR5kdGibYeTOcGbc1tag7nxS3bw6LUSRL
   FYpV9iM2nlda+whJgEoi/wwxFqSEF0V/5yxHveqXHLHK0IFPkDC79RWe5
   l+WdgGYAzZiKj6zFYeUM+mQwNOJT6yLbtrC7fOfFMYQW5aFhZfR8jBKoJ
   MAmK2DDGjOZgdxpRMj+++ENgQSgURKGkAkWlz2WCXl9vEwyMVKLObA83U
   5lSCRKa2A2kuFfSMfWvQ3yRvgIk/dYYDmQgHUzf9PJQSsFFeCR/U7iN4H
   8d/T62Zp9NN7+xTffk/wzu6w0RV2XoPYR6kR5AOMDQKenYnzfT47RpvIl
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="305706168"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="305706168"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 06:15:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="692167642"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="692167642"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Jan 2023 06:15:10 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJxbJ-0005gT-0i;
	Mon, 23 Jan 2023 14:15:09 +0000
Date: Mon, 23 Jan 2023 22:14:30 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:legacy-direct-io 1/1] ld.lld: error: undefined symbol:
 sb_init_dio_done_wq
Message-ID: <202301232231.PuhYUDAK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git legacy-direct-io
head:   bc6e6c029aad6a0ca0f9eec20b4759073d452519
commit: bc6e6c029aad6a0ca0f9eec20b4759073d452519 [1/1] fs: allow to compile out the legacy direct I/O code
config: arm-colibri_pxa300_defconfig (https://download.01.org/0day-ci/archive/20230123/202301232231.PuhYUDAK-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add hch-misc git://git.infradead.org/users/hch/misc.git
        git fetch --no-tags hch-misc legacy-direct-io
        git checkout bc6e6c029aad6a0ca0f9eec20b4759073d452519
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: sb_init_dio_done_wq
   >>> referenced by direct-io.c:591 (fs/iomap/direct-io.c:591)
   >>>               fs/iomap/direct-io.o:(__iomap_dio_rw) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
