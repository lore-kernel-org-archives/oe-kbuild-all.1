Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11257472F83
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 12:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786622429; cv=none; b=vB9WF2JyMuaHbuayHr0sJ8r4rvj30t9Inr68w8dLfbva6VlK4NLxK0gAYxBP9kqOKQTsxxzDVJ2KqQfpXboHLJLM7bFxwG7kVqYh9kTgB8YbvbMLsH3syIintqW1FY+m5APHnzSaPT9oQiVZBQKo/jtzLGBMtMp8CiAL7Vz0C5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786622429; c=relaxed/simple;
	bh=7byvo0l+UlTWr1GfTqDb9NWmmwTHv4fa6wg7dtoCvIA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QAk8d4KJXMhzJi9CgyWjoUMVPATRlRv+/BebenNrDwFNgXcz+K2xVGV/Mk1/nw/EB30TYp6emgd0OtNsqqO0SWeDxqdDcvccrUR2pioB5WelJqTQKg4J+Lj0c5tRQCVMyF/gAidxap6ULueDbP6LmHT6NazX1xzaQCpGgwCVt4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xw36G7TR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xw36G7TR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786622428; x=1818158428;
  h=date:from:to:cc:subject:message-id;
  bh=7byvo0l+UlTWr1GfTqDb9NWmmwTHv4fa6wg7dtoCvIA=;
  b=Xw36G7TRMRY+UAac9KVHblsWVFnLQkqn+7RZFqti83HtPiVuoGJ9OwF7
   KkuPMQevc1MiPzmzeDS0vbUFjnhyZabmX7lvhRZPqc0/NBT/AtecSe+M1
   r709TRLMcM+CB7t7pPKfqDdHXpcxgMiV5ym+u5sq8pZh3y5/2oPvtN7Cc
   aeeGo/rKCkdKvcC+jsMJEgzliacfJU7ypgw4XVJ8nvhKiKUTEgZbJKLeU
   5MhMSjTmzdQN55II8yKNOYFyyrDQecvp3R+88NDKUZzW7eJXE+wWPXJP3
   jlhf/+IATjEQN3laGpBrAIv0sqIo614E/VlfGnTWkRsB/eE/bxUKyVsB+
   g==;
X-CSE-ConnectionGUID: NhD6ArUEQte25wnIYoCQPQ==
X-CSE-MsgGUID: b9/EMgwvTBu7L/OCEyvxSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86312193"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="86312193"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 05:00:25 -0700
X-CSE-ConnectionGUID: XHXJ21c7RL+pMlP5UesNjA==
X-CSE-MsgGUID: qrwAD6TyTES92ISLUDqGjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="263953235"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Aug 2026 05:00:24 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuU6f-00000000Tyg-2fnw;
	Thu, 13 Aug 2026 12:00:21 +0000
Date: Thu, 13 Aug 2026 20:00:18 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:arm64-bti-veneers 16/19]
 drivers/firmware/efi/fdtparams.c:148:8: warning: assignment to
 'efi_system_table_t *' {aka 'union <anonymous> *'} from 'int' makes pointer
 from integer without a cast
Message-ID: <202608131912.702Adcgl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-bti-veneers
head:   86ddd7b8abc1d6c5c6b58b302386c9a6ebde2d77
commit: 7b7e705d322908f785f10aa482dc9a75570bc831 [16/19] efi: Make the 'linux,uefi-boot-memmap' DT property optional
config: arm-randconfig-001-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131912.702Adcgl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131912.702Adcgl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131912.702Adcgl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/efi/fdtparams.c: In function 'efi_get_fdt_params':
   drivers/firmware/efi/fdtparams.c:148:10: error: implicit declaration of function 'early_memremap_ro'; did you mean 'arch_memremap_wb'? [-Werror=implicit-function-declaration]
        st = early_memremap_ro(systab, sizeof(*st));
             ^~~~~~~~~~~~~~~~~
             arch_memremap_wb
>> drivers/firmware/efi/fdtparams.c:148:8: warning: assignment to 'efi_system_table_t *' {aka 'union <anonymous> *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
        st = early_memremap_ro(systab, sizeof(*st));
           ^
   drivers/firmware/efi/fdtparams.c:157:5: error: implicit declaration of function 'early_memunmap'; did you mean 'devm_memunmap'? [-Werror=implicit-function-declaration]
        early_memunmap(st, sizeof(*st));
        ^~~~~~~~~~~~~~
        devm_memunmap
>> drivers/firmware/efi/fdtparams.c:159:9: warning: assignment to 'efi_config_table_t *' {aka 'union <anonymous> *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
        tbl = early_memremap_ro(tables, sizeof(*tbl) * nr_tables);
            ^
   drivers/firmware/efi/fdtparams.c:174:7: warning: assignment to 'struct efi_boot_memmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
       bm = early_memremap_ro(memmap, sizeof(*bm));
          ^
   cc1: some warnings being treated as errors


vim +148 drivers/firmware/efi/fdtparams.c

    86	
    87	u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
    88	{
    89		const void *fdt = initial_boot_params;
    90		unsigned long systab, memmap = 0;
    91		int i, j, node;
    92		struct {
    93			void	*var;
    94			int	size;
    95			int	optional;
    96		} target[] = {
    97			[SYSTAB] = { &systab,		sizeof(systab) },
    98			[MEMMAP] = { &memmap,		sizeof(memmap), 1 },
    99	#ifdef CONFIG_XEN
   100			[MMBASE] = { &mm->phys_map,	sizeof(mm->phys_map) },
   101			[MMSIZE] = { &mm->size,		sizeof(mm->size) },
   102			[DCSIZE] = { &mm->desc_size,	sizeof(mm->desc_size) },
   103			[DCVERS] = { &mm->desc_version,	sizeof(mm->desc_version) },
   104	#endif
   105		};
   106	
   107		BUILD_BUG_ON(ARRAY_SIZE(target) != ARRAY_SIZE(name));
   108		BUILD_BUG_ON(ARRAY_SIZE(target) != ARRAY_SIZE(dt_params[0].params));
   109	
   110		if (!fdt)
   111			return 0;
   112	
   113		for (i = 0; i < ARRAY_SIZE(dt_params); i++) {
   114			node = fdt_path_offset(fdt, dt_params[i].path);
   115			if (node < 0)
   116				continue;
   117	
   118			if (efi_enabled(EFI_DBG))
   119				pr_info("Getting UEFI parameters from %s in DT:\n",
   120					dt_params[i].path);
   121	
   122			for (j = 0; j < ARRAY_SIZE(target); j++) {
   123				const char *pname = dt_params[i].params[j];
   124	
   125				if (pname[0] == '\0')
   126					continue;
   127	
   128				if (!efi_get_fdt_prop(fdt, node, pname, name[j],
   129						      target[j].var, target[j].size))
   130					continue;
   131				if (!j)
   132					goto notfound;
   133				if (!target[j].optional) {
   134					pr_err("Can't find property '%s' in DT!\n", pname);
   135					return 0;
   136				}
   137			}
   138			if (IS_ENABLED(CONFIG_XEN) && dt_params[i].paravirt) {
   139				set_bit(EFI_PARAVIRT, &efi.flags);
   140			} else {
   141				struct efi_boot_memmap *bm;
   142	
   143				if (!memmap) {
   144					unsigned long tables, nr_tables;
   145					efi_system_table_t *st;
   146					efi_config_table_t *tbl;
   147	
 > 148					st = early_memremap_ro(systab, sizeof(*st));
   149					if (!st) {
   150						pr_err("Cannot remap EFI system table\n");
   151						return 0;
   152					}
   153	
   154					tables		= st->tables;
   155					nr_tables	= st->nr_tables;
   156	
   157					early_memunmap(st, sizeof(*st));
   158	
 > 159					tbl = early_memremap_ro(tables, sizeof(*tbl) * nr_tables);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
