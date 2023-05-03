Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0624763B2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 May 2023 22:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683153638; x=1714689638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LMP/3s1NyeY5xRqQH+s9rqCdS+K6RmXYDsfH7x0+Rjw=;
  b=aIE/Gl+f9juE8lEMWxO+JDqffRE50J55TR9F+E6gvLEkNq6wDWG7b7Zh
   QGQ5snrse7zqQtxI8i/qGS4eMrwLeDH23qxgXvikghhSc3HG0tPmGmrb5
   aNcYJzq0GawYwW5K24NJV44TRubS2RVHyn1n6Pk6ODFUxBAPz575C+/mR
   ImqPf7fi29ji/WJe8FzNMiHvzgcmlx6nh8P7eXt6A1R1PDFg9EwqYm3tI
   fL/D9XOCS/wO4aZAQB0sjKVxQ0ibruzY0ccl0qsxNAWTExOQkkSqE/Tw/
   5Ie+9VbqDDnmrlbatENzOpYfrmrO6RQbLWrWtPZaxlc/70N3LZI2LRqFP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="435091503"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="435091503"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 15:40:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="840862446"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="840862446"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 May 2023 15:40:36 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puL9H-0002KL-36;
	Wed, 03 May 2023 22:40:35 +0000
Date: Thu, 4 May 2023 06:40:20 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efistub-cleanup 10/12]
 drivers/firmware/efi/libstub/x86-stub.c:853: Error: incorrect register
 `%eax' used with `w' suffix
Message-ID: <202305040620.THfjNpr2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efistub-cleanup
head:   d19cef90fb0bff9916366748b6bd1ac55247a86b
commit: df8c0dbe82d9b25c99e9dff452f92ed90362f70f [10/12] x86: efistub: Perform 4/5 level paging switch from the stub
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230504/202305040620.THfjNpr2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=df8c0dbe82d9b25c99e9dff452f92ed90362f70f
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb x86-efistub-cleanup
        git checkout df8c0dbe82d9b25c99e9dff452f92ed90362f70f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305040620.THfjNpr2-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/efi/libstub/x86-stub.c: Assembler messages:
>> drivers/firmware/efi/libstub/x86-stub.c:853: Error: incorrect register `%eax' used with `w' suffix
   drivers/firmware/efi/libstub/x86-stub.c:854: Error: incorrect register `%eax' used with `w' suffix


vim +853 drivers/firmware/efi/libstub/x86-stub.c

   811	
   812	static void efi_5level_switch(void)
   813	{
   814	#ifdef CONFIG_X86_64
   815		static const struct desc_struct gdt[] = {
   816			[GDT_ENTRY_KERNEL32_CS] = GDT_ENTRY_INIT(0xc09b, 0, 0xfffff),
   817			[GDT_ENTRY_KERNEL_CS]   = GDT_ENTRY_INIT(0xa09b, 0, 0xfffff),
   818			[GDT_ENTRY_KERNEL_DS]   = GDT_ENTRY_INIT(0xc093, 0, 0xfffff),
   819		};
   820	
   821		bool want_la57 = IS_ENABLED(CONFIG_X86_5LEVEL) && !efi_no5lvl;
   822		bool have_la57 = native_read_cr4() & X86_CR4_LA57;
   823		bool need_toggle = want_la57 ^ have_la57;
   824		u64 *pgt = (void *)la57_toggle + PAGE_SIZE;
   825		u64 *cr3 = (u64 *)__native_read_cr3();
   826		struct desc_ptr desc;
   827		u64 *new_cr3;
   828	
   829		if (!la57_toggle || !need_toggle)
   830			return;
   831	
   832		if (!have_la57) {
   833			/*
   834			 * We are going to enable 5 level paging, so we need to
   835			 * allocate a root level page from the 32-bit addressable
   836			 * physical region, and plug the existing hierarchy into it.
   837			 */
   838			new_cr3 = memset(pgt, 0, PAGE_SIZE);
   839			new_cr3[0] = (u64)cr3 | _PAGE_TABLE_NOENC;
   840		} else {
   841			// take the new root table pointer from the current entry #0
   842			new_cr3 = (u64 *)(cr3[0] & PAGE_MASK);
   843	
   844			// copy the new root level table if it is not 32-bit addressable
   845			if ((u64)new_cr3 > U32_MAX)
   846				new_cr3 = memcpy(pgt, new_cr3, PAGE_SIZE);
   847		}
   848	
   849		desc.size       = sizeof(gdt) - 1;
   850		desc.address    = (u64)gdt;
   851	
   852		asm("	lgdt	%[gdt]			\n\t"
 > 853		    "	movw	%[ds], %%ds		\n\t"
   854		    "	movw	%[ds], %%ss		\n\t"
   855		    :
   856		    :	[gdt]	"m"(desc),
   857			[ds]	"r"(__KERNEL_DS));
   858	
   859		la57_toggle(new_cr3, want_la57);
   860	#endif
   861	}
   862	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
