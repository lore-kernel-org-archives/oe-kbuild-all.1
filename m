Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB2E7B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 03:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682394436; x=1713930436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QPwJ9fmppHYUOwHfouuJ6mc6y+IWZMsHUYPlHBtoj08=;
  b=FevMCucdv+O3hsRvY8R4zvY38OdsYl73r1eaAeO9Zq5jmWv02sHMHrHC
   fMcIrMaqJiYcBBleNVf8C0eonfzWbKqqgmmBQML0eVtYhrXQA2ZKkqTtt
   /JJlCXx9pAHsEhqBCEeetdHIYXHO0568QI4Wwx6thqe02EH5CK7IWKfqV
   +DXRfV0bz1gdn1OXbTYBcmFsWu1mWqQchTk6oqCeHPEbznIcKtfqgJgA1
   XDzumAc10YgPZDLveD3m/b+DBkpd0dPY/F7h7QzoqU2tV+w+gmjX3kpq/
   C/wzzKWPLsBAi3XZC973L4PKd9XGmF3aH6p6ZanFK3hbY9KNGY4vyqphO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="409582332"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="409582332"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 20:47:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="757948016"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="757948016"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Apr 2023 20:47:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pr9e6-000iwC-18;
	Tue, 25 Apr 2023 03:47:14 +0000
Date: Tue, 25 Apr 2023 11:46:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efistub-cleanup 6/6]
 drivers/firmware/efi/libstub/x86-stub.c:721:35: sparse: sparse: cast
 truncates bits from constant value (fffff becomes ffff)
Message-ID: <202304251112.lAwJVRGf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ard,

First bad commit (maybe != root cause):

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efistub-cleanup
head:   31f2f213bc1b8f5975bdc5c56fcd72cd6a8faf8a
commit: ee9e4c5ff43781c5490c88f74767d37b34fe9806 [6/6] x86: efistub: Avoid legacy decompressor when doing EFI boot
config: x86_64-randconfig-s022 (https://download.01.org/0day-ci/archive/20230425/202304251112.lAwJVRGf-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=ee9e4c5ff43781c5490c88f74767d37b34fe9806
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb x86-efistub-cleanup
        git checkout ee9e4c5ff43781c5490c88f74767d37b34fe9806
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/firmware/efi/libstub/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304251112.lAwJVRGf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/efi/libstub/x86-stub.c:721:35: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   drivers/firmware/efi/libstub/x86-stub.c:722:35: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   drivers/firmware/efi/libstub/x86-stub.c:723:35: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)

vim +721 drivers/firmware/efi/libstub/x86-stub.c

cb112503d30143 Ard Biesheuvel 2023-04-24  719  
cb112503d30143 Ard Biesheuvel 2023-04-24  720  static const struct desc_struct gdt[] = {
cb112503d30143 Ard Biesheuvel 2023-04-24 @721  	[GDT_ENTRY_KERNEL32_CS] = GDT_ENTRY_INIT(0xc09b, 0, 0xfffff),
cb112503d30143 Ard Biesheuvel 2023-04-24  722  	[GDT_ENTRY_KERNEL_CS]   = GDT_ENTRY_INIT(0xa09b, 0, 0xfffff),
cb112503d30143 Ard Biesheuvel 2023-04-24  723  	[GDT_ENTRY_KERNEL_DS]   = GDT_ENTRY_INIT(0xc093, 0, 0xfffff),
cb112503d30143 Ard Biesheuvel 2023-04-24  724  };
cb112503d30143 Ard Biesheuvel 2023-04-24  725  

:::::: The code at line 721 was first introduced by commit
:::::: cb112503d301433d95343a7a2081c5d617f63973 x86: efistub: Perform 4/5 level paging switch from the stub

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
