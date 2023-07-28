Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A0017EC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 03:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690514339; x=1722050339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JcqAkRRIKRMlhH9i1Xbe8qKxlthS6MbUxC2xLUlxj0E=;
  b=NT3uKhv4MoRR9j7sA9ZZy04UJ6Ij0vu+CCzK2waX1ljufAK0Ue3dmnlS
   DNwXvvRoCw41TqshJ70H73KjWhk5xzb+1RoQMgSuCAZgU4ijAXVIg6WJE
   xP5bF7UDQzfRvruSyuUVQBRBmFdodYNTN6VuHL37Zis46mlPqLgsg9dQB
   Brt4pRe/eLpg//7wUpP7Tvhos8LYPP8Iyixo43Yvq4ko623b/zb6QVcan
   +J8qule2ZXctlyGxN2E6XJZzwcK1wgFkWNZLdD0oOokgLATYTQNOdo/27
   ag6mdJm8GMhTjo0F0c2yZultAlVsZ+QaEsO/BEnMuALxgjkHE4UsB/FvO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434780597"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="434780597"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 20:18:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="704369130"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="704369130"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Jul 2023 20:18:57 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPE0G-0002pr-22;
	Fri, 28 Jul 2023 03:18:56 +0000
Date: Fri, 28 Jul 2023 11:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efistub-cleanup-v7 14/21]
 drivers/firmware/efi/libstub/x86-5lvl.c:16:35: sparse: sparse: cast
 truncates bits from constant value (fffff becomes ffff)
Message-ID: <202307281149.ICPcyneq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efistub-cleanup-v7
head:   bbe59c53d3a01c8e34fd0d0fc979f3f352d3b7e1
commit: 73e83be41856b38dfd7e417492697721ea61bb5c [14/21] x86/efistub: Perform 4/5 level paging switch from the stub
config: x86_64-randconfig-r071-20230727 (https://download.01.org/0day-ci/archive/20230728/202307281149.ICPcyneq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281149.ICPcyneq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307281149.ICPcyneq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/efi/libstub/x86-5lvl.c:16:35: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   drivers/firmware/efi/libstub/x86-5lvl.c:17:35: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)

vim +16 drivers/firmware/efi/libstub/x86-5lvl.c

    14	
    15	static const struct desc_struct gdt[] = {
  > 16		[GDT_ENTRY_KERNEL32_CS] = GDT_ENTRY_INIT(0xc09b, 0, 0xfffff),
    17		[GDT_ENTRY_KERNEL_CS]   = GDT_ENTRY_INIT(0xa09b, 0, 0xfffff),
    18	};
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
