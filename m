Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3452415F34
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 06:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786601659; cv=none; b=cYM590hf92BudjVuFBoB9tFtXQ0BUmO+rZZYfmpxA4wXCp6CgrQnZf5a4nSEyzkNIqIY7By0spG6f/4eZ7oWg4L3PXMm9Yw4bRM62Nb+ki4FA3rGzF0ibISvyY8t62MTRDG1Eyt03UGNYTohOsjd9rL12nyUbcRK4VLlKFnYhA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786601659; c=relaxed/simple;
	bh=JthqzrPprzkVQkG+yLDiNmOfImZzgTacRArPxIQ4wlU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kkuL9DqYmt8htn10f7of9Sswmjpt76Q1a3xgE8FzUrkXDMHhvo4ONDblv3qz8DcHMfOx7qtA2I4SVK8T48MmQjtmjEqdLbszeDb6mn5SqMvW26m2JYj8ECnJsFXScjpAURAfFXwVmyeqbn3WRUfg4ilK8gHPzLRrrDiz7HAC8C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iu5HwAMk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iu5HwAMk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786601657; x=1818137657;
  h=date:from:to:cc:subject:message-id;
  bh=JthqzrPprzkVQkG+yLDiNmOfImZzgTacRArPxIQ4wlU=;
  b=iu5HwAMkQxXzkI8SnSN6dHM18IZhKtLdoe9r/wjeKhQ4n7yzCBAiU/ta
   /WKE0c86dEjETMHXQ5zRkTwBqVXidjrEIxtwXErQlczuvfxWm+vDrvwBS
   M+nvCiKkFw5e9b9epB5lIRePCeCfcSUGkk3TQxK91w4N1Y419dkXssNnr
   tMmUTg+vdB7S4w1I6dvyfvDsE2DAcDYPjIIWEcToaCREYP61vVNWfdvJK
   TpZU2jkjiNEu4uEUtcJ6GM18otWkpzBCTIqS0p2F3L+lPD84plmz0LW7V
   nhnB89WhFzEW1VGtqtO7nQ1jvp52slONmCzPWlw6xJdJr8J0rNMKmtGOn
   g==;
X-CSE-ConnectionGUID: bhuTYGTSTI+x57YnF06wHQ==
X-CSE-MsgGUID: 6oDgFMgiSDKnSoqTcH2S1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87049136"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="87049136"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 23:14:16 -0700
X-CSE-ConnectionGUID: CnziEd3lTsK4JN+O1o/uZw==
X-CSE-MsgGUID: LsmhEkTZRU6MYZps9mJYrQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Aug 2026 23:14:15 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuOhg-00000000T2k-2YcP;
	Thu, 13 Aug 2026 06:14:12 +0000
Date: Thu, 13 Aug 2026 14:13:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:arm64-bti-veneers 15/18]
 drivers/firmware/efi/fdtparams.c:140:9: error: implicit declaration of
 function 'early_memremap_ro'; did you mean 'arch_memremap_wb'?
Message-ID: <202608131437.YZdXNyK7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-bti-veneers
head:   82615c616e8cf0642701dd7adc233e43f761d580
commit: f973919abbc0179c7121f903d7b5d9495f2714a4 [15/18] efi: Pass EFI boot memmap struct address to core kernel
config: arm-randconfig-001-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131437.YZdXNyK7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131437.YZdXNyK7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131437.YZdXNyK7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/firmware/efi/fdtparams.c: In function 'efi_get_fdt_params':
>> drivers/firmware/efi/fdtparams.c:140:9: error: implicit declaration of function 'early_memremap_ro'; did you mean 'arch_memremap_wb'? [-Werror=implicit-function-declaration]
       bm = early_memremap_ro(memmap, sizeof(*bm));
            ^~~~~~~~~~~~~~~~~
            arch_memremap_wb
>> drivers/firmware/efi/fdtparams.c:140:7: warning: assignment to 'struct efi_boot_memmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
       bm = early_memremap_ro(memmap, sizeof(*bm));
          ^
>> drivers/firmware/efi/fdtparams.c:151:4: error: implicit declaration of function 'early_memunmap'; did you mean 'devm_memunmap'? [-Werror=implicit-function-declaration]
       early_memunmap(bm, sizeof(*bm));
       ^~~~~~~~~~~~~~
       devm_memunmap
   cc1: some warnings being treated as errors


vim +140 drivers/firmware/efi/fdtparams.c

    86	
    87	u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
    88	{
    89		const void *fdt = initial_boot_params;
    90		unsigned long systab, memmap;
    91		int i, j, node;
    92		struct {
    93			void	*var;
    94			int	size;
    95		} target[] = {
    96			[SYSTAB] = { &systab,		sizeof(systab) },
    97			[MEMMAP] = { &memmap,		sizeof(memmap) },
    98	#ifdef CONFIG_XEN
    99			[MMBASE] = { &mm->phys_map,	sizeof(mm->phys_map) },
   100			[MMSIZE] = { &mm->size,		sizeof(mm->size) },
   101			[DCSIZE] = { &mm->desc_size,	sizeof(mm->desc_size) },
   102			[DCVERS] = { &mm->desc_version,	sizeof(mm->desc_version) },
   103	#endif
   104		};
   105	
   106		BUILD_BUG_ON(ARRAY_SIZE(target) != ARRAY_SIZE(name));
   107		BUILD_BUG_ON(ARRAY_SIZE(target) != ARRAY_SIZE(dt_params[0].params));
   108	
   109		if (!fdt)
   110			return 0;
   111	
   112		for (i = 0; i < ARRAY_SIZE(dt_params); i++) {
   113			node = fdt_path_offset(fdt, dt_params[i].path);
   114			if (node < 0)
   115				continue;
   116	
   117			if (efi_enabled(EFI_DBG))
   118				pr_info("Getting UEFI parameters from %s in DT:\n",
   119					dt_params[i].path);
   120	
   121			for (j = 0; j < ARRAY_SIZE(target); j++) {
   122				const char *pname = dt_params[i].params[j];
   123	
   124				if (pname[0] == '\0')
   125					continue;
   126	
   127				if (!efi_get_fdt_prop(fdt, node, pname, name[j],
   128						      target[j].var, target[j].size))
   129					continue;
   130				if (!j)
   131					goto notfound;
   132				pr_err("Can't find property '%s' in DT!\n", pname);
   133				return 0;
   134			}
   135			if (IS_ENABLED(CONFIG_XEN) && dt_params[i].paravirt) {
   136				set_bit(EFI_PARAVIRT, &efi.flags);
   137			} else {
   138				struct efi_boot_memmap *bm;
   139	
 > 140				bm = early_memremap_ro(memmap, sizeof(*bm));
   141				if (!bm) {
   142					pr_err("Cannot remap EFI boot memory map\n");
   143					return 0;
   144				}
   145	
   146				mm->phys_map		= memmap + sizeof(*bm);
   147				mm->size		= bm->map_size;
   148				mm->desc_size		= bm->desc_size;
   149				mm->desc_version	= bm->desc_ver;
   150	
 > 151				early_memunmap(bm, sizeof(*bm));

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
