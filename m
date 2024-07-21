Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716DE184E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 03:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721530865; cv=none; b=DNb8c4MYTJsTVDmbkAQ5fov98aL0t0CoBYxFgAxWhO+IiRztjMh6p5TskzMGN1n2fE/e56oNzW3wG5YBJMN/jE9dtQARq7k40vKj33Gx7zIdQAx8cKVOh40S8vgEIhe0qHPe4kXSXGPEMv+5PvGezOtizZayvVJH9R7ACPeMkFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721530865; c=relaxed/simple;
	bh=OMMt8FgVFmjlu9eJiCnVlNULbbUqzHPqnB6l4wbxt9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nQ/ISROSyJ/UvhewOzagvLXprDE4dXGzMs1adkfnrdukh+ewhkVE3wL/c4wDnY4WB7m3t0wmyB8+EkDYl1d1BZIvAef65ahYvm215O7DViq9gmUPxaBPYTiBKIRnSmKZWFoteBoi706I2gqq16tY+WnWp09oEHykNvviU3E94qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1oaMyf/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1oaMyf/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721530862; x=1753066862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OMMt8FgVFmjlu9eJiCnVlNULbbUqzHPqnB6l4wbxt9g=;
  b=k1oaMyf/4iQHp6Gg0mY+wSDSzxmbZAEkEKlH1tMPnPDuZjMhvl1t9B/C
   Qso5axVMuRlYnX1B9hWqECZyXpUVEzXh3j7tuQv2LRzH9VNeshZa+p6UY
   QZx4WR+WHgicYP3D5IOXfp/2pA69mRvwit25cnaCfXFRh8iBJh+BEDim/
   /Cx8MIqkjRx7zUYeIq9ZmrvqR4srCT4+njO1GVdYv8/WaLG23xg5mlD6G
   HFhJ8Dtpyd9exPZ/uDdwgAyV+jodoxA5zxJPdXGQqYyevS/eR6jo/Xq1p
   kkyOpCgqlpm3O+IUuHwmn0yR4l8v1j7591Y/1ghKYOvgHDg301S2U8PrA
   Q==;
X-CSE-ConnectionGUID: U6KqBmrPT6y82/kY9+e9lw==
X-CSE-MsgGUID: H3AsW4NKTsGSqlpSm75KHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="29737602"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="29737602"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 20:01:02 -0700
X-CSE-ConnectionGUID: HlN0Cdk7RuGe/AV9eYiHeA==
X-CSE-MsgGUID: nBEXssJvQXOsIjYh31wPAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="51476002"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Jul 2024 20:01:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVMol-000jrh-0F;
	Sun, 21 Jul 2024 03:00:59 +0000
Date: Sun, 21 Jul 2024 11:00:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 39/44]
 drivers/virt/gunyah/vm_mgr.c:887:5: sparse: sparse: symbol
 'gunyah_gup_reclaim_parcel' was not declared. Should it be static?
Message-ID: <202407211003.UA8WLm5M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   7b5e8812b147cc88f178851a17b21d05e67ab15d
commit: 296cceed084451decfd348415b1db9c833443713 [39/44] ANDROID: virt: gunyah: Add gup based demand paging support
config: arm64-randconfig-r113-20240716 (https://download.01.org/0day-ci/archive/20240721/202407211003.UA8WLm5M-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce: (https://download.01.org/0day-ci/archive/20240721/202407211003.UA8WLm5M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407211003.UA8WLm5M-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virt/gunyah/vm_mgr.c:887:5: sparse: sparse: symbol 'gunyah_gup_reclaim_parcel' was not declared. Should it be static?

vim +/gunyah_gup_reclaim_parcel +887 drivers/virt/gunyah/vm_mgr.c

   886	
 > 887	int gunyah_gup_reclaim_parcel(struct gunyah_vm *ghvm,
   888				       struct gunyah_rm_mem_parcel *parcel, u64 gfn,
   889				       u64 nr)
   890	{
   891		struct gunyah_rm_mem_entry *entry;
   892		struct folio *folio;
   893		pgoff_t i;
   894		int ret;
   895	
   896		if (parcel->mem_handle != GUNYAH_MEM_HANDLE_INVAL) {
   897			ret = gunyah_rm_mem_reclaim(ghvm->rm, parcel);
   898			if (ret) {
   899				dev_err(ghvm->parent, "Failed to reclaim parcel: %d\n",
   900					ret);
   901				/* We can't reclaim the pages -- hold onto the pages
   902				 * forever because we don't know what state the memory
   903				 * is in
   904				 */
   905				return ret;
   906			}
   907			parcel->mem_handle = GUNYAH_MEM_HANDLE_INVAL;
   908	
   909			for (i = 0; i < parcel->n_mem_entries; i++) {
   910				entry = &parcel->mem_entries[i];
   911	
   912				folio = pfn_folio(PHYS_PFN(le64_to_cpu(entry->phys_addr)));
   913	
   914				if (folio_test_private(folio))
   915					gunyah_folio_host_reclaim(folio);
   916	
   917				folio_put(folio);
   918			}
   919	
   920			kfree(parcel->mem_entries);
   921			kfree(parcel->acl_entries);
   922		}
   923	
   924		return 0;
   925	}
   926	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
