Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0755820E7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 01:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="joBj4Mfp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699321339; x=1730857339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sYYjdaVHi0L9b2Ip+acuxrsdNL32P6zG8D4UEm12HC8=;
  b=joBj4Mfp4eGpdbNNYg02gdN74STri+WCqRkZr3ABr3yir8KiGxNNp4Jv
   pofZD42oAav7VHsDUooSZIVAzLM/FLvu37+nunvAMzRDUHNwbnxHiPYD7
   hQnuhsHyNX4bFsWodItrbsQZL474s/OJ4vTeP2fpZvQ9c1CZzfIQIIJVw
   tXVe83KwPegD0623SWcRDNtbskEE/29pLKq21lMJze7v1QF88LhFWQcBx
   GkXzf+SSJNvof26fSOfcs+57rSot+z7yH7l1Vc0JGvhp6Wguxn1HnppmD
   PvQWzMhl+xur4+ZORVAPQs9HI+O0Ofnj60qPE78wuAbPxACueoP3rWjxi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="369605137"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="369605137"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 17:42:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="3810080"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Nov 2023 17:42:16 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0B6c-0006tP-0j;
	Tue, 07 Nov 2023 01:42:14 +0000
Date: Tue, 7 Nov 2023 09:41:47 +0800
From: kernel test robot <lkp@intel.com>
To: Zhimin Gu <kookoo.gu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Chen Yu <yu.c.chen@intel.com>
Subject: arch/x86/power/hibernate.c:46: warning: Function parameter or member
 'pfn' not described in 'pfn_is_nosave'
Message-ID: <202311070957.GrEjtFym-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhimin,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   be3ca57cfb777ad820c6659d52e60bbdd36bf5ff
commit: 25862a049e6f04cc982f4bed25ed3e6f0a0a5a61 x86, hibernate: Extract the common code of 64/32 bit system
date:   5 years ago
config: x86_64-randconfig-r011-20230712 (https://download.01.org/0day-ci/archive/20231107/202311070957.GrEjtFym-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311070957.GrEjtFym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311070957.GrEjtFym-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/power/hibernate.c:45:5: warning: no previous prototype for 'pfn_is_nosave' [-Wmissing-prototypes]
      45 | int pfn_is_nosave(unsigned long pfn)
         |     ^~~~~~~~~~~~~
   arch/x86/power/hibernate.c:150:5: warning: no previous prototype for 'arch_hibernation_header_save' [-Wmissing-prototypes]
     150 | int arch_hibernation_header_save(void *addr, unsigned int max_size)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/power/hibernate.c:187:5: warning: no previous prototype for 'arch_hibernation_header_restore' [-Wmissing-prototypes]
     187 | int arch_hibernation_header_restore(void *addr)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/power/hibernate.c:46: warning: Function parameter or member 'pfn' not described in 'pfn_is_nosave'
>> arch/x86/power/hibernate.c:151: warning: Function parameter or member 'max_size' not described in 'arch_hibernation_header_save'
   arch/x86/power/hibernate.o: warning: objtool: arch_hibernation_header_restore()+0x31: sibling call from callable instruction with modified stack frame


vim +46 arch/x86/power/hibernate.c

    41	
    42	/**
    43	 *	pfn_is_nosave - check if given pfn is in the 'nosave' section
    44	 */
    45	int pfn_is_nosave(unsigned long pfn)
  > 46	{
    47		unsigned long nosave_begin_pfn;
    48		unsigned long nosave_end_pfn;
    49	
    50		nosave_begin_pfn = __pa_symbol(&__nosave_begin) >> PAGE_SHIFT;
    51		nosave_end_pfn = PAGE_ALIGN(__pa_symbol(&__nosave_end)) >> PAGE_SHIFT;
    52	
    53		return pfn >= nosave_begin_pfn && pfn < nosave_end_pfn;
    54	}
    55	
    56	#ifdef CONFIG_X86_64
    57	
    58	#define MD5_DIGEST_SIZE 16
    59	
    60	struct restore_data_record {
    61		unsigned long jump_address;
    62		unsigned long jump_address_phys;
    63		unsigned long cr3;
    64		unsigned long magic;
    65		u8 e820_digest[MD5_DIGEST_SIZE];
    66	};
    67	
    68	#if IS_BUILTIN(CONFIG_CRYPTO_MD5)
    69	/**
    70	 * get_e820_md5 - calculate md5 according to given e820 table
    71	 *
    72	 * @table: the e820 table to be calculated
    73	 * @buf: the md5 result to be stored to
    74	 */
    75	static int get_e820_md5(struct e820_table *table, void *buf)
    76	{
    77		struct crypto_shash *tfm;
    78		struct shash_desc *desc;
    79		int size;
    80		int ret = 0;
    81	
    82		tfm = crypto_alloc_shash("md5", 0, 0);
    83		if (IS_ERR(tfm))
    84			return -ENOMEM;
    85	
    86		desc = kmalloc(sizeof(struct shash_desc) + crypto_shash_descsize(tfm),
    87			       GFP_KERNEL);
    88		if (!desc) {
    89			ret = -ENOMEM;
    90			goto free_tfm;
    91		}
    92	
    93		desc->tfm = tfm;
    94		desc->flags = 0;
    95	
    96		size = offsetof(struct e820_table, entries) +
    97			sizeof(struct e820_entry) * table->nr_entries;
    98	
    99		if (crypto_shash_digest(desc, (u8 *)table, size, buf))
   100			ret = -EINVAL;
   101	
   102		kzfree(desc);
   103	
   104	free_tfm:
   105		crypto_free_shash(tfm);
   106		return ret;
   107	}
   108	
   109	static int hibernation_e820_save(void *buf)
   110	{
   111		return get_e820_md5(e820_table_firmware, buf);
   112	}
   113	
   114	static bool hibernation_e820_mismatch(void *buf)
   115	{
   116		int ret;
   117		u8 result[MD5_DIGEST_SIZE];
   118	
   119		memset(result, 0, MD5_DIGEST_SIZE);
   120		/* If there is no digest in suspend kernel, let it go. */
   121		if (!memcmp(result, buf, MD5_DIGEST_SIZE))
   122			return false;
   123	
   124		ret = get_e820_md5(e820_table_firmware, result);
   125		if (ret)
   126			return true;
   127	
   128		return memcmp(result, buf, MD5_DIGEST_SIZE) ? true : false;
   129	}
   130	#else
   131	static int hibernation_e820_save(void *buf)
   132	{
   133		return 0;
   134	}
   135	
   136	static bool hibernation_e820_mismatch(void *buf)
   137	{
   138		/* If md5 is not builtin for restore kernel, let it go. */
   139		return false;
   140	}
   141	#endif
   142	
   143	#define RESTORE_MAGIC	0x23456789ABCDEF01UL
   144	
   145	/**
   146	 *	arch_hibernation_header_save - populate the architecture specific part
   147	 *		of a hibernation image header
   148	 *	@addr: address to save the data at
   149	 */
   150	int arch_hibernation_header_save(void *addr, unsigned int max_size)
 > 151	{
   152		struct restore_data_record *rdr = addr;
   153	
   154		if (max_size < sizeof(struct restore_data_record))
   155			return -EOVERFLOW;
   156		rdr->magic = RESTORE_MAGIC;
   157		rdr->jump_address = (unsigned long)restore_registers;
   158		rdr->jump_address_phys = __pa_symbol(restore_registers);
   159	
   160		/*
   161		 * The restore code fixes up CR3 and CR4 in the following sequence:
   162		 *
   163		 * [in hibernation asm]
   164		 * 1. CR3 <= temporary page tables
   165		 * 2. CR4 <= mmu_cr4_features (from the kernel that restores us)
   166		 * 3. CR3 <= rdr->cr3
   167		 * 4. CR4 <= mmu_cr4_features (from us, i.e. the image kernel)
   168		 * [in restore_processor_state()]
   169		 * 5. CR4 <= saved CR4
   170		 * 6. CR3 <= saved CR3
   171		 *
   172		 * Our mmu_cr4_features has CR4.PCIDE=0, and toggling
   173		 * CR4.PCIDE while CR3's PCID bits are nonzero is illegal, so
   174		 * rdr->cr3 needs to point to valid page tables but must not
   175		 * have any of the PCID bits set.
   176		 */
   177		rdr->cr3 = restore_cr3 & ~CR3_PCID_MASK;
   178	
   179		return hibernation_e820_save(rdr->e820_digest);
   180	}
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
