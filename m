Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F703793BC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 18:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774894536; cv=none; b=NMYBEeVCFQwcODcdiHgdY+lJUGKFQBiDqLcgKDLExbudKvVSngj3KY06y/Zjl7uBdB9Ea42kNa1PcFOpBg8Yq8N5OG9CmZS/54NguEGnVNM0t1mAb4zG5OpSDAAHPIjCs+mw8eQ/s4Nprz+Bmu7zbeDAYbpU/eK8PsOoRisnJo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774894536; c=relaxed/simple;
	bh=vrZAIkCyruR1diMhMmup9YwQcIZNNuyOOcyP8PL5E+w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B4C0pCMJP9Sjinnq6+QUqryVkEzpc9afitZO6bD1ZBGjk2dMsH4HaiO2hwftHx/DjDSJRpiLwp4JcSTBq277P4EMq46JuNrDayobK1Drqc/lbFtmjMNCx1I+tPM3MdFoPSYwabb/QqTUP9UV/k8GKPqY/ug5sGPqyQmKalC/aKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dGF8lyFk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGF8lyFk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774894534; x=1806430534;
  h=date:from:to:cc:subject:message-id;
  bh=vrZAIkCyruR1diMhMmup9YwQcIZNNuyOOcyP8PL5E+w=;
  b=dGF8lyFkLW2JLs+DNlVLLxpghBbfR7hnKC52tc6IoyhR8Y9sj4qKw7r0
   doYcQmNcau7y7AdBdmZYn1mSBbN2QS93VjxJmlzD9kerzo8nxdxkBp+yL
   GDNolVT4DWcapKGcLgNtO5KE6fIB6Z+ZKNHk7bwWi4/wHGGcU8mxntHWa
   TfEystJA/035+qAV3F6OWtbVJS+PcV1bLrNCEneO1VjvOtmxTlBDL6RaR
   O8QdhlEXjieuExULcZ5nfEzgEANGpSGFyFj0WsYbVx+mUmQ/xL/Hn3For
   Sn8fDdCKLXiTeHdxvkfkHZvtzYWMy4AgPpTsEH+H2QnewYhN0lostsALV
   g==;
X-CSE-ConnectionGUID: 9KOpB07pTTm6o6AzjQ5w3w==
X-CSE-MsgGUID: nnjLWXZHRImQYMBRC+XZhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="78491810"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="78491810"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 11:15:33 -0700
X-CSE-ConnectionGUID: sLMb5szzRtC5WrCDoQPVJg==
X-CSE-MsgGUID: Geqg7FX7Q82BAB1+R+jGGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="230938084"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Mar 2026 11:15:32 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7H97-000000001UT-2rEN;
	Mon, 30 Mar 2026 18:15:29 +0000
Date: Tue, 31 Mar 2026 02:14:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 drivers/virt/gunyah/vm_mgr.c:887:5: sparse: sparse: symbol
 'gunyah_gup_reclaim_parcel' was not declared. Should it be static?
Message-ID: <202603310204.jPov6ka9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5fdbbd61a3cbdca7ac1034dc16723bdbc7ece8cc
commit: 296cceed084451decfd348415b1db9c833443713 [2/2] ANDROID: virt: gunyah: Add gup based demand paging support
config: arm64-randconfig-r122-20260330 (https://download.01.org/0day-ci/archive/20260331/202603310204.jPov6ka9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310204.jPov6ka9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310204.jPov6ka9-lkp@intel.com/

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
