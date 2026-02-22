Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39904154425
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Feb 2026 09:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771754021; cv=none; b=GIKvOuOwKtWyuDswPeGFsabSzR44iCR1Xa348U1ubzRKzNpTFsQNcxKhTfrmIXJFln+J4rD6A16P6M+6vloWDGgnn/pvbhI21UiVJlktfTUfYs4kIuUmJbTNqTXmLvVPEzRCYRzNgd1LtskF06i9il5WH+5XBX6DlZzlAPQtZ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771754021; c=relaxed/simple;
	bh=nP0hwfiu4lBNHHR4vV+xKY0TF/GiYkbIuUzoIcZVXRY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E3tGMvIrRqjI75IDXXTGcd6q+OZyr1QMmJA0aqFqdP+hKM4dBtHY1anZN4oSPfNjL+KjN65ZKK07VUtFXqLbw4GO5clRX98lCaJKsvoV9D/KtaKyt8SRQDVSlqZ1KS5oWWMRn1l6ubUqNs+XdhF9/Ts+1advgCt9Gs0V0AfWyMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VkDG1G7o; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VkDG1G7o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771754019; x=1803290019;
  h=date:from:to:cc:subject:message-id;
  bh=nP0hwfiu4lBNHHR4vV+xKY0TF/GiYkbIuUzoIcZVXRY=;
  b=VkDG1G7ovOPvQE9uj1oJkMeZQVp16oy2iUdsvRlTtalPHlfnOUBVXCoC
   MGU8kGDaopX6FrN/XkTY463VWA5GjNef1vTEDWRGp1xCS2QLJPWvZPYtK
   kN7HYebEADkDB2/t5P0TcuW8n7Zf0hEF2jwQQIC8RiGU1hhuKcDhGBR4l
   WQCmnF1ke4y4z8xCNCS/asmdUp/ajFjqG4hJnrzzm922mtI9Ve6WkoGDN
   gSzqmhL74k3nlgQkLX7/T61JzFKCJcopZGcvGc9G04WIr4sEZxK1mM9a6
   TT5Ax6XiFCOlmZoYD+SLFu8IHa4ouf3+NvMiqkew8jCJpo/gJenzUjDHl
   A==;
X-CSE-ConnectionGUID: 2HrZmGsrQkec+4adhwaPDg==
X-CSE-MsgGUID: 4fUaN0KrTsGG1SzAa8ph8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="72482144"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="72482144"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 01:53:39 -0800
X-CSE-ConnectionGUID: ffwVfEokSi+W4OEyPaJnoA==
X-CSE-MsgGUID: T8drcTNUT4+djkI32hXUOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="238233013"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Feb 2026 01:53:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vu69e-000000015QI-2dj8;
	Sun, 22 Feb 2026 09:53:34 +0000
Date: Sun, 22 Feb 2026 17:53:09 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:private_compression 48/60]
 mm/internal.h:1535:33: error: implicit declaration of function
 'make_writable_device_private_entry'
Message-ID: <202602221734.cCodFOSw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux private_compression
head:   9fa5ffee4fd4726e31f05deebb938cccfa0b460f
commit: 48a8ea8dcaa2781e2ab529cf440334d15dca5512 [48/60] mm/mprotect: NP_OPS_PROTECT_WRITE - gate PTE/PMD write-upgrades
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20260222/202602221734.cCodFOSw-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602221734.cCodFOSw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602221734.cCodFOSw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:54:
   mm/internal.h: In function 'folio_managed_fixup_migration_pte':
>> mm/internal.h:1535:33: error: implicit declaration of function 'make_writable_device_private_entry' [-Wimplicit-function-declaration]
    1535 |                         entry = make_writable_device_private_entry(
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/internal.h:1535:33: error: incompatible types when assigning to type 'softleaf_t' {aka 'swp_entry_t'} from type 'int'
>> mm/internal.h:1538:33: error: implicit declaration of function 'make_readable_device_private_entry' [-Wimplicit-function-declaration]
    1538 |                         entry = make_readable_device_private_entry(
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/internal.h:1538:33: error: incompatible types when assigning to type 'softleaf_t' {aka 'swp_entry_t'} from type 'int'
>> mm/internal.h:1540:23: error: implicit declaration of function 'softleaf_to_pte' [-Wimplicit-function-declaration]
    1540 |                 pte = softleaf_to_pte(entry);
         |                       ^~~~~~~~~~~~~~~
>> mm/internal.h:1540:23: error: incompatible types when assigning to type 'pte_t' from type 'int'
>> mm/internal.h:1543:21: error: implicit declaration of function 'pte_swp_uffd_wp'; did you mean 'pte_swp_uffd_wp_any'? [-Wimplicit-function-declaration]
    1543 |                 if (pte_swp_uffd_wp(old_pte))
         |                     ^~~~~~~~~~~~~~~
         |                     pte_swp_uffd_wp_any
>> mm/internal.h:1544:31: error: implicit declaration of function 'pte_swp_mkuffd_wp'; did you mean 'pte_swp_uffd_wp_any'? [-Wimplicit-function-declaration]
    1544 |                         pte = pte_swp_mkuffd_wp(pte);
         |                               ^~~~~~~~~~~~~~~~~
         |                               pte_swp_uffd_wp_any
   mm/internal.h:1544:31: error: incompatible types when assigning to type 'pte_t' from type 'int'


vim +/make_writable_device_private_entry +1535 mm/internal.h

  1509	
  1510	/**
  1511	 * folio_managed_fixup_migration_pte - Fixup PTE after migration for
  1512	 *                                     managed memory pages.
  1513	 * @new: the destination page
  1514	 * @pte: the PTE being installed (normal PTE built by caller)
  1515	 * @old_pte: the original PTE (before migration, for swap entry flags)
  1516	 * @vma: the VMA
  1517	 *
  1518	 * For MEMORY_DEVICE_PRIVATE pages: replaces the PTE with a device-private
  1519	 * swap entry, preserving soft_dirty and uffd_wp from old_pte.
  1520	 *
  1521	 * For N_MEMORY_PRIVATE pages with NP_OPS_PROTECT_WRITE: strips the write
  1522	 * bit so the next write triggers the fault handler for promotion.
  1523	 *
  1524	 * For normal pages: returns pte unmodified.
  1525	 */
  1526	static inline pte_t folio_managed_fixup_migration_pte(struct page *new,
  1527							      pte_t pte,
  1528							      pte_t old_pte,
  1529							      struct vm_area_struct *vma)
  1530	{
  1531		if (unlikely(is_device_private_page(new))) {
  1532			softleaf_t entry;
  1533	
  1534			if (pte_write(pte))
> 1535				entry = make_writable_device_private_entry(
  1536							page_to_pfn(new));
  1537			else
> 1538				entry = make_readable_device_private_entry(
  1539							page_to_pfn(new));
> 1540			pte = softleaf_to_pte(entry);
  1541			if (pte_swp_soft_dirty(old_pte))
  1542				pte = pte_swp_mksoft_dirty(pte);
> 1543			if (pte_swp_uffd_wp(old_pte))
> 1544				pte = pte_swp_mkuffd_wp(pte);
  1545		} else if (folio_managed_wrprotect(page_folio(new))) {
  1546			pte = pte_wrprotect(pte);
  1547		}
  1548		return pte;
  1549	}
  1550	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
