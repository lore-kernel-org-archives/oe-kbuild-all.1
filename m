Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4D6390
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 01:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682127274; x=1713663274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fVWAu4q5KVwrGGABzuv9jmqZlUUlabfniLT/unwlLWk=;
  b=ET6wJ6JOLIzbsrXtk17fVr7KWZ/iZWOLFOzI4WZEURGCf0x5EyfMiqo/
   n3RB9zY9jZgcoZzwklvmWbR4RGC6YuipgG11h5jClmLNdseVTerXen6fb
   r0inJz3AYTw53dV20pBa0s3Yb0ATCTSVQCN4/78k6BGa6eG5S4bbsV6Qr
   p2G7sUlGqnIqDzJ1Vo4bUGPZBmhrHADdjCtCaOxLjVbpZf2KLIf2FR89P
   9rPpBfv+Dj9fl9PD7ta2fYKj/qsR3aLCfqHl8suPElSniQ4Yq5MIGWYrE
   xJ8a1G6uacrI1CYPjg07mfD9vRqTt4XNFUag7KWVYNqRZfvFIYwgrEXg0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="330321012"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="330321012"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 18:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="669887649"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="669887649"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Apr 2023 18:34:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq28z-000gzA-19;
	Sat, 22 Apr 2023 01:34:29 +0000
Date: Sat, 22 Apr 2023 09:33:43 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
Subject: [bpf-next:master 4/32] microblaze-linux-ld:
 kernel/bpf/syscall.o:undefined reference to `netfilter_prog_ops'
Message-ID: <202304220903.fRZTJtxe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   4db10a8243df665ced10b027c2d4862173a7a3ec
commit: fd9c663b9ad67dedfc9a3fd3429ddd3e83782b4d [4/32] bpf: minimal support for programs hooked into netfilter framework
config: microblaze-randconfig-r013-20230421 (https://download.01.org/0day-ci/archive/20230422/202304220903.fRZTJtxe-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=fd9c663b9ad67dedfc9a3fd3429ddd3e83782b4d
        git remote add bpf-next https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
        git fetch --no-tags bpf-next master
        git checkout fd9c663b9ad67dedfc9a3fd3429ddd3e83782b4d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220903.fRZTJtxe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> microblaze-linux-ld: kernel/bpf/syscall.o:(.rodata+0xc6c): undefined reference to `netfilter_prog_ops'
>> microblaze-linux-ld: kernel/bpf/verifier.o:(.rodata+0x6dcc): undefined reference to `netfilter_verifier_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
