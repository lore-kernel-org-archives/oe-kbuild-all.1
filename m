Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75AE2D7DCF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 17:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777569882; cv=none; b=OKmKD5IhHuk7rnjfKAyCoyUybboqhCA5uckB7f60rq0MMO7tShu6QhyyO4SJv+DegMr0BY73+2jZwAE2kH3Q4u82yKpiWo/loiCV7sojWtPohSHOCkE2n7WlyS/Ya+qY+YhcdnXVVnDLYYQbOr89yHF5ZX8LoGuMVH3jDPjmmDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777569882; c=relaxed/simple;
	bh=HW9Apt1RUtPFJEfCazcPESpZLA+IJh2343tEt4yHf+8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d8Xr7o7HK/HVRxPc52k5g0QUw5o4efGndNEGguulTXWslP9w+rWH1JmZN4kl/gucScVDRrLKM+UJWygJzeeKiNqCjXEXW5AHtnHh+9nCroLRingJOp7LeSQbWJl6LknMt8iWE8v0PaZqBsUdh/kg5sTeIMcYj7Zl+RSVdeErxc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCpTdh5O; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCpTdh5O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777569880; x=1809105880;
  h=date:from:to:cc:subject:message-id;
  bh=HW9Apt1RUtPFJEfCazcPESpZLA+IJh2343tEt4yHf+8=;
  b=PCpTdh5O1IIzR+8Sn1uwEznw0ln+Pve+Bp05pc4o3tWmUnzA2zOvSQ0K
   mkIncgX8rrQGqFo5FnNJw9TYrROHt9cRA94oYXDxoRxV1u+doPBGwbwym
   xOHTaMA8A8tlXI+zf2JuM4cYQjhA09ggQS6iEIvQRjwxg2k84D83CzHa5
   emMRZyRRxv9KMw34XXRLV/TM7+yBrmSiRjDH8+QASjP0rzeml8t+D3eAj
   UcTuIIQ85QC5/Woo/WXsHrxQRyow0KLoZQNQ22dcBXIR82UvcSz3gkB7G
   WZhYMoaN8Bib4P/aYAYms6PpDXJgJPbAkHc0vPzwWNhbEM/avTXGHwy9Y
   g==;
X-CSE-ConnectionGUID: 8khn+8F4RTuJiLicxCE/mA==
X-CSE-MsgGUID: aO733YMfRO+UxBnPhU2Hyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="77560127"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="77560127"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 10:24:40 -0700
X-CSE-ConnectionGUID: G3QRTFxVTlS9We8I5hEsRw==
X-CSE-MsgGUID: f5frPtQmQqaBporztdnypw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="234531401"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 30 Apr 2026 10:24:38 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIV7s-000000004rt-3811;
	Thu, 30 Apr 2026 17:24:36 +0000
Date: Thu, 30 Apr 2026 19:24:05 +0200
From: kernel test robot <lkp@intel.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: fs/proc/task_mmu.c:1139:31: warning: unused variable
 'curr_addr'
Message-ID: <202604301935.VvtowdCY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Oscar-Salvador/mm-Add-softleaf_from_pud/20260427-233610
head:   a50a24d8da5140888004ac6386c0a0f6b4d0dd9a
commit: 90dce2a662135115d3afedef7ca80af4cd869414 mm: Make /proc/pid/smaps use the new generic pagewalk API
date:   3 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260430/202604301935.VvtowdCY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301935.VvtowdCY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301935.VvtowdCY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/proc/task_mmu.c: In function 'smap_gather_stats':
>> fs/proc/task_mmu.c:1139:31: warning: unused variable 'curr_addr' [-Wunused-variable]
    1139 |                 unsigned long curr_addr = ptw.curr_addr;
         |                               ^~~~~~~~~


vim +/curr_addr +1139 fs/proc/task_mmu.c

  1091	
  1092	/*
  1093	 * Gather mem stats from @vma with the indicated beginning
  1094	 * address @start, and keep them in @mss.
  1095	 *
  1096	 * Use vm_start of @vma as the beginning address if @start is 0.
  1097	 */
  1098	static void smap_gather_stats(struct vm_area_struct *vma,
  1099					  struct mem_size_stats *mss,
  1100					  unsigned long start)
  1101	{
  1102		struct pt_range_walk ptw = {
  1103			.mm = vma->vm_mm
  1104		};
  1105		enum pt_range_walk_type type;
  1106		pt_type_flags_t flags = PT_TYPE_ALL;
  1107	
  1108		if (start >= vma->vm_end)
  1109			return;
  1110	
  1111		flags &= ~(PT_TYPE_NONE|PT_TYPE_PFN);
  1112	
  1113		if (vma->vm_file && shmem_mapping(vma->vm_file->f_mapping)) {
  1114			/*
  1115			 * For shared or readonly shmem mappings we know that all
  1116			 * swapped out pages belong to the shmem object, and we can
  1117			 * obtain the swap value much more efficiently. For private
  1118			 * writable mappings, we might have COW pages that are
  1119			 * not affected by the parent swapped out pages of the shmem
  1120			 * object, so we have to distinguish them during the page walk.
  1121			 * Unless we know that the shmem object (or the part mapped by
  1122			 * our VMA) has no swapped out pages at all.
  1123			 */
  1124			unsigned long shmem_swapped = shmem_swap_usage(vma);
  1125	
  1126			if (!start && (!shmem_swapped || (vma->vm_flags & VM_SHARED) ||
  1127			    !(vma->vm_flags & VM_WRITE))) {
  1128				mss->swap += shmem_swapped;
  1129			} else {
  1130				flags |= PT_TYPE_NONE;
  1131			}
  1132		}
  1133	
  1134		if (!start)
  1135			start = vma->vm_start;
  1136	
  1137		type = pt_range_walk_start(&ptw, vma, start, vma->vm_end, flags);
  1138		while (type != PTW_DONE) {
> 1139			unsigned long curr_addr = ptw.curr_addr;
  1140			bool locked = !!(vma->vm_flags & VM_LOCKED);
  1141			bool compound = false, account = false;
  1142			unsigned long swap_size;
  1143			int mapcount;
  1144	
  1145			switch (type) {
  1146			case PTW_FOLIO:
  1147			case PTW_MIGRATION:
  1148			case PTW_HWPOISON:
  1149			case PTW_DEVICE:
  1150				/*
  1151				 * We either have a folio because vm_normal_folio was
  1152				 * successful, or because we had a special swap entry
  1153				 * and could retrieve it with softleaf_to_page.
  1154				 */
  1155				if (is_vm_hugetlb_page(vma)) {
  1156					/* HugeTLB */
  1157					unsigned long size = huge_page_size(hstate_vma(ptw.vma));
  1158	
  1159					if (!ptw.present || folio_maybe_mapped_shared(ptw.folio) ||
  1160					    ptw.pmd_shared)
  1161						mss->shared_hugetlb += size;
  1162					else
  1163						mss->private_hugetlb += size;
  1164				} else {
  1165					account = true;
  1166					if (ptw.level == PTW_PMD_LEVEL) {
  1167						/* THP */
  1168						compound = true;
  1169						if (folio_test_anon(ptw.folio))
  1170							mss->anonymous_thp += ptw.size;
  1171						else if (folio_test_swapbacked(ptw.folio))
  1172							mss->shmem_thp += ptw.size;
  1173						else if (folio_is_zone_device(ptw.folio))
  1174							/* pass */;
  1175						else
  1176							mss->file_thp += ptw.size;
  1177					} else if (ptw.level == PTW_PTE_LEVEL && ptw.nr_entries > 1) {
  1178						compound = true;
  1179					}
  1180				}
  1181				break;
  1182			case PTW_SWAP:
  1183				account = true;
  1184				swap_size = PAGE_SIZE * ptw.nr_entries;
  1185				mss->swap += swap_size;
  1186				mapcount = swp_swapcount(ptw.softleaf_entry);
  1187				if (mapcount >= 2) {
  1188					u64 pss_delta = (u64)swap_size << PSS_SHIFT;
  1189	
  1190					do_div(pss_delta, mapcount);
  1191					mss->swap_pss += pss_delta;
  1192				} else {
  1193					mss->swap_pss += (u64)swap_size << PSS_SHIFT;
  1194				}
  1195				break;
  1196			case PTW_NONE:
  1197	#ifdef CONFIG_SHMEM
  1198				unsigned long addr = ptw.curr_addr;
  1199				unsigned long end = ptw.next_addr;
  1200	
  1201				if (ptw.level == PTW_PMD_LEVEL || ptw.level == PTW_PTE_LEVEL)
  1202					mss->swap += shmem_partial_swap_usage(vma->vm_file->f_mapping,
  1203								      linear_page_index(vma, addr),
  1204								      linear_page_index(vma, end));
  1205	#endif
  1206				break;
  1207			default:
  1208				/* Ooops */
  1209				break;
  1210			}
  1211	
  1212			if (account && ptw.folio)
  1213				smaps_account(mss, ptw.page, compound, ptw.young,
  1214					      ptw.dirty, locked, ptw.present, ptw.size);
  1215			type = pt_range_walk_next(&ptw, vma, start, vma->vm_end, flags);
  1216		}
  1217	
  1218		pt_range_walk_done(&ptw);
  1219	}
  1220	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
