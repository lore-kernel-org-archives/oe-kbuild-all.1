Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE225808
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 04:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683692591; x=1715228591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h/acOLrIzpxNpF2kh1wPs1j5sOYOWNxkihbysBTJObY=;
  b=JGiOQMDq57uPjJy5+6qgd0KQ34sZON/Hnqjz4hR1HZHVae+aH7I5k7m+
   WBHmndU2/ZPJrn4+xgXCKAg7+81hLAVczy08FzS2JVLc74VB0vDebNu2K
   wvy4fKkP2Ga5cOMbitayo0txvPcOd/SU2hJUHqpIwu3jReac95x//V8hu
   oVn/MQqw0x2oTCxshjAYC1+Bs/TMDE+5iKW15EJtRlospwJH7b6RPTAAs
   S+LTkJDdhWh4c+bUknoagT8BFda4SMYn6S/s8b8Y360ET4GLXEx8uijyn
   Fbp3mbht/pnhoG+RWg3ob2lD++RJevEkDR83/xtd9AOfQcOhZ1I3YD52O
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="436447539"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="436447539"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 21:23:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="843368811"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="843368811"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 May 2023 21:23:10 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwbM5-0002si-1Z;
	Wed, 10 May 2023 04:23:09 +0000
Date: Wed, 10 May 2023 12:23:03 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/module-space-rework 2/6]
 arch/arm64/mm/kasan_init.c:217:31: warning: variable 'mod_shadow_end' set
 but not used
Message-ID: <202305101210.uMGAIxV9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/module-space-rework
head:   b1ddffd7866863b67c3d18109762de1c07318442
commit: 09c6adef03b99a3d1fea6aaa2210b0c664127ebd [2/6] arm64: kasan: remove !KASAN_VMALLOC remnants
config: arm64-randconfig-c031-20230509 (https://download.01.org/0day-ci/archive/20230510/202305101210.uMGAIxV9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=09c6adef03b99a3d1fea6aaa2210b0c664127ebd
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark arm64/module-space-rework
        git checkout 09c6adef03b99a3d1fea6aaa2210b0c664127ebd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305101210.uMGAIxV9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/mm/kasan_init.c: In function 'kasan_init_shadow':
>> arch/arm64/mm/kasan_init.c:217:31: warning: variable 'mod_shadow_end' set but not used [-Wunused-but-set-variable]
     217 |         u64 mod_shadow_start, mod_shadow_end;
         |                               ^~~~~~~~~~~~~~


vim +/mod_shadow_end +217 arch/arm64/mm/kasan_init.c

39d114ddc68223 Andrey Ryabinin  2015-10-12  213  
afe6ef80dcecf2 Andrey Konovalov 2020-12-22  214  static void __init kasan_init_shadow(void)
39d114ddc68223 Andrey Ryabinin  2015-10-12  215  {
f9040773b7bbbd Ard Biesheuvel   2016-02-16  216  	u64 kimg_shadow_start, kimg_shadow_end;
f80fb3a3d50843 Ard Biesheuvel   2016-01-26 @217  	u64 mod_shadow_start, mod_shadow_end;
9a0732efa77418 Lecopzer Chen    2021-03-24  218  	u64 vmalloc_shadow_end;
b10d6bca87204c Mike Rapoport    2020-10-13  219  	phys_addr_t pa_start, pa_end;
b10d6bca87204c Mike Rapoport    2020-10-13  220  	u64 i;
39d114ddc68223 Andrey Ryabinin  2015-10-12  221  
7d7b88ff5f8fd7 Lecopzer Chen    2021-03-24  222  	kimg_shadow_start = (u64)kasan_mem_to_shadow(KERNEL_START) & PAGE_MASK;
7d7b88ff5f8fd7 Lecopzer Chen    2021-03-24  223  	kimg_shadow_end = PAGE_ALIGN((u64)kasan_mem_to_shadow(KERNEL_END));
f9040773b7bbbd Ard Biesheuvel   2016-02-16  224  
f80fb3a3d50843 Ard Biesheuvel   2016-01-26  225  	mod_shadow_start = (u64)kasan_mem_to_shadow((void *)MODULES_VADDR);
f80fb3a3d50843 Ard Biesheuvel   2016-01-26  226  	mod_shadow_end = (u64)kasan_mem_to_shadow((void *)MODULES_END);
f80fb3a3d50843 Ard Biesheuvel   2016-01-26  227  
9a0732efa77418 Lecopzer Chen    2021-03-24  228  	vmalloc_shadow_end = (u64)kasan_mem_to_shadow((void *)VMALLOC_END);
9a0732efa77418 Lecopzer Chen    2021-03-24  229  
39d114ddc68223 Andrey Ryabinin  2015-10-12  230  	/*
39d114ddc68223 Andrey Ryabinin  2015-10-12  231  	 * We are going to perform proper setup of shadow memory.
0293c8ba807c86 Kyrylo Tkachov   2018-10-04  232  	 * At first we should unmap early shadow (clear_pgds() call below).
39d114ddc68223 Andrey Ryabinin  2015-10-12  233  	 * However, instrumented code couldn't execute without shadow memory.
39d114ddc68223 Andrey Ryabinin  2015-10-12  234  	 * tmp_pg_dir used to keep early shadow mapped until full shadow
39d114ddc68223 Andrey Ryabinin  2015-10-12  235  	 * setup will be finished.
39d114ddc68223 Andrey Ryabinin  2015-10-12  236  	 */
39d114ddc68223 Andrey Ryabinin  2015-10-12  237  	memcpy(tmp_pg_dir, swapper_pg_dir, sizeof(tmp_pg_dir));
c1a88e9124a499 Mark Rutland     2016-01-25  238  	dsb(ishst);
1682c45b920643 Ard Biesheuvel   2022-06-24  239  	cpu_replace_ttbr1(lm_alias(tmp_pg_dir), idmap_pg_dir);
39d114ddc68223 Andrey Ryabinin  2015-10-12  240  
39d114ddc68223 Andrey Ryabinin  2015-10-12  241  	clear_pgds(KASAN_SHADOW_START, KASAN_SHADOW_END);
39d114ddc68223 Andrey Ryabinin  2015-10-12  242  
e17d8025f07e4f Will Deacon      2017-11-15  243  	kasan_map_populate(kimg_shadow_start, kimg_shadow_end,
7d7b88ff5f8fd7 Lecopzer Chen    2021-03-24  244  			   early_pfn_to_nid(virt_to_pfn(lm_alias(KERNEL_START))));
f9040773b7bbbd Ard Biesheuvel   2016-02-16  245  
77ad4ce69321ab Mark Rutland     2019-08-14  246  	kasan_populate_early_shadow(kasan_mem_to_shadow((void *)PAGE_END),
f80fb3a3d50843 Ard Biesheuvel   2016-01-26  247  				   (void *)mod_shadow_start);
9a0732efa77418 Lecopzer Chen    2021-03-24  248  
9a0732efa77418 Lecopzer Chen    2021-03-24  249  	BUILD_BUG_ON(VMALLOC_START != MODULES_END);
9a0732efa77418 Lecopzer Chen    2021-03-24  250  	kasan_populate_early_shadow((void *)vmalloc_shadow_end,
9a0732efa77418 Lecopzer Chen    2021-03-24  251  				    (void *)KASAN_SHADOW_END);
f80fb3a3d50843 Ard Biesheuvel   2016-01-26  252  
b10d6bca87204c Mike Rapoport    2020-10-13  253  	for_each_mem_range(i, &pa_start, &pa_end) {
b10d6bca87204c Mike Rapoport    2020-10-13  254  		void *start = (void *)__phys_to_virt(pa_start);
b10d6bca87204c Mike Rapoport    2020-10-13  255  		void *end = (void *)__phys_to_virt(pa_end);
39d114ddc68223 Andrey Ryabinin  2015-10-12  256  
39d114ddc68223 Andrey Ryabinin  2015-10-12  257  		if (start >= end)
39d114ddc68223 Andrey Ryabinin  2015-10-12  258  			break;
39d114ddc68223 Andrey Ryabinin  2015-10-12  259  
e17d8025f07e4f Will Deacon      2017-11-15  260  		kasan_map_populate((unsigned long)kasan_mem_to_shadow(start),
3f9ec80f7b22ec Andrey Ryabinin  2017-07-10  261  				   (unsigned long)kasan_mem_to_shadow(end),
800cb2e553d445 Mark Rutland     2018-04-16  262  				   early_pfn_to_nid(virt_to_pfn(start)));
39d114ddc68223 Andrey Ryabinin  2015-10-12  263  	}
39d114ddc68223 Andrey Ryabinin  2015-10-12  264  
7b1af9795773d7 Ard Biesheuvel   2016-01-11  265  	/*
9577dd74864877 Andrey Konovalov 2018-12-28  266  	 * KAsan may reuse the contents of kasan_early_shadow_pte directly,
9577dd74864877 Andrey Konovalov 2018-12-28  267  	 * so we should make sure that it maps the zero page read-only.
7b1af9795773d7 Ard Biesheuvel   2016-01-11  268  	 */
7b1af9795773d7 Ard Biesheuvel   2016-01-11  269  	for (i = 0; i < PTRS_PER_PTE; i++)
9577dd74864877 Andrey Konovalov 2018-12-28  270  		set_pte(&kasan_early_shadow_pte[i],
9577dd74864877 Andrey Konovalov 2018-12-28  271  			pfn_pte(sym_to_pfn(kasan_early_shadow_page),
9577dd74864877 Andrey Konovalov 2018-12-28  272  				PAGE_KERNEL_RO));
7b1af9795773d7 Ard Biesheuvel   2016-01-11  273  
080eb83f54cf5b Andrey Konovalov 2018-12-28  274  	memset(kasan_early_shadow_page, KASAN_SHADOW_INIT, PAGE_SIZE);
1682c45b920643 Ard Biesheuvel   2022-06-24  275  	cpu_replace_ttbr1(lm_alias(swapper_pg_dir), idmap_pg_dir);
afe6ef80dcecf2 Andrey Konovalov 2020-12-22  276  }
afe6ef80dcecf2 Andrey Konovalov 2020-12-22  277  

:::::: The code at line 217 was first introduced by commit
:::::: f80fb3a3d50843a401dac4b566b3b131da8077a2 arm64: add support for kernel ASLR

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
