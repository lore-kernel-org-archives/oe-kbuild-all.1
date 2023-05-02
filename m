Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C395A7E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 06:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683010217; x=1714546217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ztAK8ZWHCZIgy7zFVBRCxIKxEVTa7UuYRJ6a2knQErg=;
  b=V7K3XL+6/ml5yUIXYeW+1W9sX6SAU2BPjmgav1xlbLoKlLmfApu1B84Y
   iV5Atxs/U8pc5BFc6mWeWNVPtLT2VGQLeY4NPs51YOGnK/xsxv+qqqgJc
   lICzRf2XIB1/C41dVJaNL4WO8bVFRhtA1eRHKb54O5nTsZJfwBwxsaq4i
   tf4uMJVoZuWLaDO7CmYoh9LQFWDHVO8jrD1Cvx4KodQS7wWmiUb59VxXI
   fwWCWqclbNHj8JO9aZh3OzX6F6ESwgysGJmsTCQLxA90i/0d4w+2+4m+L
   FtoSg0FhW0vhM63efNiltOkzZHSrUgz0iycd601AndfSe56Z4vnVqYHKH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="411456299"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="411456299"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 23:50:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="765647735"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="765647735"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 May 2023 23:50:15 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptjq2-0000tU-11;
	Tue, 02 May 2023 06:50:14 +0000
Date: Tue, 2 May 2023 14:49:14 +0800
From: kernel test robot <lkp@intel.com>
To: Evan Green <evan@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: arch/riscv/kernel/cpufeature.c:34:1: sparse: sparse: symbol
 '__pcpu_scope_misaligned_access_speed' was not declared. Should it be
 static?
Message-ID: <202305021414.EuPdM9kv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   865fdb08197e657c59e74a35fa32362b12397f58
commit: 62a31d6e38bd0faef7c956b358d651f7bdc4ae0c RISC-V: hwprobe: Support probing of misaligned access performance
date:   13 days ago
config: riscv-randconfig-s052-20230430 (https://download.01.org/0day-ci/archive/20230502/202305021414.EuPdM9kv-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=62a31d6e38bd0faef7c956b358d651f7bdc4ae0c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 62a31d6e38bd0faef7c956b358d651f7bdc4ae0c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305021414.EuPdM9kv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
>> arch/riscv/kernel/cpufeature.c:34:1: sparse: sparse: symbol '__pcpu_scope_misaligned_access_speed' was not declared. Should it be static?

vim +/__pcpu_scope_misaligned_access_speed +34 arch/riscv/kernel/cpufeature.c

    30	
    31	/**
    32	 * riscv_isa_extension_base() - Get base extension word
    33	 *
  > 34	 * @isa_bitmap: ISA bitmap to use
    35	 * Return: base extension word as unsigned long value
    36	 *
    37	 * NOTE: If isa_bitmap is NULL then Host ISA bitmap will be used.
    38	 */
    39	unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap)
    40	{
    41		if (!isa_bitmap)
    42			return riscv_isa[0];
    43		return isa_bitmap[0];
    44	}
    45	EXPORT_SYMBOL_GPL(riscv_isa_extension_base);
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
