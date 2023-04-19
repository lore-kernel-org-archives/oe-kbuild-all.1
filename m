Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16644179
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 00:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681864161; x=1713400161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4lY3yf9peW62M5biuC6oYJ1jv0q+LIf5OAjCneGSEFQ=;
  b=WA7c3we8tzSHNDZ9sbzdxAX0CbW2I8HVALqUXfUfKMvYjaIbW/toVOAX
   teHndDgStn2WSxN8w6lnUS6ZZunV48zpnOBUvQur17hj+uPdW/7H95czB
   H6lY4zG81SAjFVFBlGvJlg4HoSeFYkMUv94loo8QHrj5HaajXw4WonMQR
   qq3Z8F8FRLfh+eP38y5ttwPaTOPalEM2jCe3zrqaG7NRkC3IqSZsF7N4e
   3vOwVK8p+7bYxxffuExvO6dAunjNt55hNqSUas00vrBIA//BjyaVspZ/J
   fk4dryLIBzHWJHnvz5txEJ+OrXGlkI/SVCRwJZ/1yWY+2wAQwAtGv+V+q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="324935988"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="324935988"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 17:29:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="835078633"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="835078633"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Apr 2023 17:29:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1povhG-000eH9-2d;
	Wed, 19 Apr 2023 00:29:18 +0000
Date: Wed, 19 Apr 2023 08:29:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi 1/17] vcpu.c:(.text+0x1c8): multiple
 definition of `bpf_uprobe_multi_link_attach';
 arch/riscv/kvm/../../../virt/kvm/eventfd.o:eventfd.c:(.text+0x3e4): first
 defined here
Message-ID: <202304190800.GAHIMXru-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi
head:   663cc4c067c5af744475e3a7573e3cd5b4647ef3
commit: fe88ac2cbf6177d5ed19dd8a6f4cf7e066d6aa95 [1/17] bpf: Add multi uprobe link
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230419/202304190800.GAHIMXru-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=fe88ac2cbf6177d5ed19dd8a6f4cf7e066d6aa95
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi
        git checkout fe88ac2cbf6177d5ed19dd8a6f4cf7e066d6aa95
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304190800.GAHIMXru-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: arch/riscv/kvm/vcpu.o: in function `bpf_uprobe_multi_link_attach':
>> vcpu.c:(.text+0x1c8): multiple definition of `bpf_uprobe_multi_link_attach'; arch/riscv/kvm/../../../virt/kvm/eventfd.o:eventfd.c:(.text+0x3e4): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
