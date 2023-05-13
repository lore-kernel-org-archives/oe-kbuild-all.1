Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBF9806
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 00:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683939121; x=1715475121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oyub3jdq/Hv6Dm22i4E3vQhwFFJ8f4vxbH61Arm3R5g=;
  b=E2CviBkGSUztgyKneqHNFTICo0LHpNHPgMRqAw4Ha73u1coEtvf2TC21
   dPY3jn5hYBlS55cwSnTb5Uvr3KW3Mmi5eaO25g2VBuR5Yv+nz5xZ+Gi+1
   PbqXNFYCOsKRjbpmkVpgRsG0opdbZrRGvTq1xecpWp+refPvLARa7ZDeF
   4Kah6iOgYxrjIcbyxxpOt3HG+GsP3TJPD1xJjuYC22fwQewVwap9+zjpQ
   1wKrx2n4XZwPxkN3CjJIA0P27AeT7V/cdw3dmrZ53Na9giz0+fqqzEgYb
   ChCWEavU4bW54dts/VEGnPjMK8sSPTnkbAlFXgUI011mKmzo2Y5vpzS7V
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="353168946"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="353168946"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 17:52:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="790004397"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="790004397"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 12 May 2023 17:52:00 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxdUN-0005Ci-1y;
	Sat, 13 May 2023 00:51:59 +0000
Date: Sat, 13 May 2023 08:51:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:efi-remove-mixed-mode 25/30]
 drivers/firmware/efi/efi-init.c:108:61: warning: passing argument 1 of
 'efi_to_phys' makes integer from pointer without a cast
Message-ID: <202305130817.Xul61m8J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-remove-mixed-mode
head:   cd57f70012e67876ab331fb83fd05670727e44d1
commit: e078fe8a2777069c99a70bcfac840380d2bbf578 [25/30] efi: get rid of efi_table_attr()
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230513/202305130817.Xul61m8J-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=e078fe8a2777069c99a70bcfac840380d2bbf578
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb efi-remove-mixed-mode
        git checkout e078fe8a2777069c99a70bcfac840380d2bbf578
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/firmware/efi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130817.Xul61m8J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/efi/efi-init.c: In function 'uefi_init':
>> drivers/firmware/efi/efi-init.c:108:61: warning: passing argument 1 of 'efi_to_phys' makes integer from pointer without a cast [-Wint-conversion]
     108 |         config_tables = early_memremap_ro(efi_to_phys(systab->tables),
         |                                                       ~~~~~~^~~~~~~~
         |                                                             |
         |                                                             const efi_config_table_t *
   drivers/firmware/efi/efi-init.c:39:53: note: expected 'long unsigned int' but argument is of type 'const efi_config_table_t *'
      39 | static phys_addr_t __init efi_to_phys(unsigned long addr)
         |                                       ~~~~~~~~~~~~~~^~~~


vim +/efi_to_phys +108 drivers/firmware/efi/efi-init.c

801820bee9bccb drivers/firmware/efi/arm-init.c Ard Biesheuvel 2016-04-25   80  
8819ba39661efe drivers/firmware/efi/arm-init.c Ard Biesheuvel 2020-01-20   81  static int __init uefi_init(u64 efi_system_table)
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30   82  {
06c0bd93434c5b drivers/firmware/efi/arm-init.c Ard Biesheuvel 2020-01-22   83  	efi_config_table_t *config_tables;
8819ba39661efe drivers/firmware/efi/arm-init.c Ard Biesheuvel 2020-01-20   84  	efi_system_table_t *systab;
f7d92489426579 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30   85  	size_t table_size;
14fb4209094355 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2020-01-20   86  	int retval;
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30   87  
8819ba39661efe drivers/firmware/efi/arm-init.c Ard Biesheuvel 2020-01-20   88  	systab = early_memremap_ro(efi_system_table, sizeof(efi_system_table_t));
8819ba39661efe drivers/firmware/efi/arm-init.c Ard Biesheuvel 2020-01-20   89  	if (systab == NULL) {
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30   90  		pr_warn("Unable to map EFI system table.\n");
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30   91  		return -ENOMEM;
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30   92  	}
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30   93  
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30   94  	set_bit(EFI_BOOT, &efi.flags);
f7d92489426579 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30   95  	if (IS_ENABLED(CONFIG_64BIT))
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30   96  		set_bit(EFI_64BIT, &efi.flags);
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30   97  
234fa51db95f32 drivers/firmware/efi/efi-init.c Ard Biesheuvel 2023-02-03   98  	retval = efi_systab_check_header(&systab->hdr);
14fb4209094355 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2020-01-20   99  	if (retval)
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30  100  		goto out;
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30  101  
8819ba39661efe drivers/firmware/efi/arm-init.c Ard Biesheuvel 2020-01-20  102  	efi.runtime = systab->runtime;
8819ba39661efe drivers/firmware/efi/arm-init.c Ard Biesheuvel 2020-01-20  103  	efi.runtime_version = systab->hdr.revision;
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30  104  
8819ba39661efe drivers/firmware/efi/arm-init.c Ard Biesheuvel 2020-01-20  105  	efi_systab_report_header(&systab->hdr, efi_to_phys(systab->fw_vendor));
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30  106  
8819ba39661efe drivers/firmware/efi/arm-init.c Ard Biesheuvel 2020-01-20  107  	table_size = sizeof(efi_config_table_t) * systab->nr_tables;
8819ba39661efe drivers/firmware/efi/arm-init.c Ard Biesheuvel 2020-01-20 @108  	config_tables = early_memremap_ro(efi_to_phys(systab->tables),
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30  109  					  table_size);
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30  110  	if (config_tables == NULL) {
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30  111  		pr_warn("Unable to map EFI config table array.\n");
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30  112  		retval = -ENOMEM;
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30  113  		goto out;
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30  114  	}
8819ba39661efe drivers/firmware/efi/arm-init.c Ard Biesheuvel 2020-01-20  115  	retval = efi_config_parse_tables(config_tables, systab->nr_tables,
69e377b2893761 drivers/firmware/efi/efi-init.c Ard Biesheuvel 2022-09-16  116  					 efi_arch_tables);
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30  117  
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30  118  	early_memunmap(config_tables, table_size);
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30  119  out:
8819ba39661efe drivers/firmware/efi/arm-init.c Ard Biesheuvel 2020-01-20  120  	early_memunmap(systab, sizeof(efi_system_table_t));
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30  121  	return retval;
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30  122  }
e5bc22a42e4d46 drivers/firmware/efi/arm-init.c Ard Biesheuvel 2015-11-30  123  

:::::: The code at line 108 was first introduced by commit
:::::: 8819ba39661efec88efd11610988424cb1bf99f8 efi/arm: Drop unnecessary references to efi.systab

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
