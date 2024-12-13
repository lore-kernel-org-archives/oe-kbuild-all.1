Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4598155398
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 04:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734063082; cv=none; b=nlwQAdQunX/IlDBAOt//ksrB0Nt5rPKfuLEQXBv3zyeeFLL99wkq97fGO0s1+IVLWOKWqov5h5fy7IxEHU3xUQvrkFtAsWQzJeJDHyZrYFMg48hL3432ELHknADW400/Q1c3qpr2BZwF+Sdfqis3x82doeeg3l8ICWq125uwzqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734063082; c=relaxed/simple;
	bh=PsHxZcpJ8i4c3wXAk47znTWvj9u0J/eM31vv6W5gnL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TgOJ+ltavAog6tqQ/013VqgJn1sEKMvACYH8gNDyFIE2ajWfq6cwoG2IA2k53XQ/epPLvb2OycNykPXxbofoAmI1bNkKogCIo13iIomtGs4CioYhOvKG5CeL1jRt3WUNDj4l4bNGJsWMsGhV0t8ZpLjcCtCKjrv7VokgbHB6qZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SNm5/RU7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SNm5/RU7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734063081; x=1765599081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PsHxZcpJ8i4c3wXAk47znTWvj9u0J/eM31vv6W5gnL4=;
  b=SNm5/RU7r7K6/dLYWF8obEkJGRuEq3HkOJt3Hsp1ZACc4vz2JluyWz9v
   bT3jzgQ+D6qrW7Bsxnpt7Os6p2FsyRWVcniIQQRehvfBBR/rWi3AqUnLx
   Mtf3QkXY4OdhBRTaV1BT1rxFuzr4+gCtNkx8/i1bViBAHEniW30HdjMKS
   Sigl1zhCgMzEJ7qs2AesHUdXpsDpDIqHyO8njFJu+yWi4El+07PRQBy1x
   9uNYvXLruuHIurPJqN1Zc8+LTk/15+1SbH7B5Y0ZAQXA1LgzIzCJIML0F
   Tm6OwX2RTI4KlaRWD412HSCLJKZCm3m4ip2/2ZQBjEYXyt1phUXZG4dZs
   A==;
X-CSE-ConnectionGUID: wig9eqE+SUuOYhzaz1PfXw==
X-CSE-MsgGUID: 9hPs2myfTBash/UgPdYgMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="22096968"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="22096968"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 20:11:20 -0800
X-CSE-ConnectionGUID: Cfub5BACRt2UtVHhpt/jPA==
X-CSE-MsgGUID: i6yQd+XXTB2oiy8yYJlpQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133803203"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Dec 2024 20:11:18 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLx1I-000BgF-2G;
	Fri, 13 Dec 2024 04:11:16 +0000
Date: Fri, 13 Dec 2024 12:10:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2579/2579] mm/share_pool.c:4221:30: error:
 implicit declaration of function 'huge_pte_none'; did you mean
 'huge_pte_lock'?
Message-ID: <202412131234.abo5dw1q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ff5378fff024fcb2552e6da22811cf933fe4a4c0
commit: c533562a2802206135467a06384ba33cff42b18a [2579/2579] share_pool: Use sharepool_no_page to alloc hugepage
config: arm64-randconfig-004-20241213 (https://download.01.org/0day-ci/archive/20241213/202412131234.abo5dw1q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412131234.abo5dw1q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412131234.abo5dw1q-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/share_pool.c: In function 'mg_sp_group_id_by_pid':
   mm/share_pool.c:858:29: warning: ordered comparison of pointer with integer zero [-Wextra]
     858 |         if (!spg_ids || num <= 0)
         |                             ^~
   mm/share_pool.c: In function 'sp_compact_nodes':
   mm/share_pool.c:1851:9: error: implicit declaration of function 'sysctl_compaction_handler' [-Werror=implicit-function-declaration]
    1851 |         sysctl_compaction_handler(NULL, 1, NULL, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c: In function 'sp_hugetlb_entry':
   mm/share_pool.c:3014:21: error: implicit declaration of function 'huge_ptep_get' [-Werror=implicit-function-declaration]
    3014 |         pte_t pte = huge_ptep_get(ptep);
         |                     ^~~~~~~~~~~~~
   mm/share_pool.c:3014:21: error: invalid initializer
   mm/share_pool.c: In function 'sp_unshare_kva':
   mm/share_pool.c:3394:14: warning: variable 'is_hugepage' set but not used [-Wunused-but-set-variable]
    3394 |         bool is_hugepage = true;
         |              ^~~~~~~~~~~
   mm/share_pool.c: At top level:
   mm/share_pool.c:3691:6: warning: no previous prototype for 'sp_proc_stat_drop' [-Wmissing-prototypes]
    3691 | void sp_proc_stat_drop(struct sp_proc_stat *stat)
         |      ^~~~~~~~~~~~~~~~~
   mm/share_pool.c:3922:6: warning: no previous prototype for 'spa_overview_show' [-Wmissing-prototypes]
    3922 | void spa_overview_show(struct seq_file *seq)
         |      ^~~~~~~~~~~~~~~~~
   mm/share_pool.c:4004:6: warning: no previous prototype for 'spg_overview_show' [-Wmissing-prototypes]
    4004 | void spg_overview_show(struct seq_file *seq)
         |      ^~~~~~~~~~~~~~~~~
   mm/share_pool.c: In function 'sharepool_no_page':
>> mm/share_pool.c:4221:30: error: implicit declaration of function 'huge_pte_none'; did you mean 'huge_pte_lock'? [-Werror=implicit-function-declaration]
    4221 |                         if (!huge_pte_none(huge_ptep_get(ptep))) {
         |                              ^~~~~~~~~~~~~
         |                              huge_pte_lock
>> mm/share_pool.c:4234:23: error: implicit declaration of function 'huge_add_to_page_cache'; did you mean 'add_to_page_cache'? [-Werror=implicit-function-declaration]
    4234 |                 err = huge_add_to_page_cache(page, mapping, idx);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
         |                       add_to_page_cache
>> mm/share_pool.c:4256:9: error: implicit declaration of function 'set_huge_pte_at'; did you mean 'set_huge_swap_pte_at'? [-Werror=implicit-function-declaration]
    4256 |         set_huge_pte_at(mm, haddr, ptep, new_pte);
         |         ^~~~~~~~~~~~~~~
         |         set_huge_swap_pte_at
>> mm/share_pool.c:4258:9: error: implicit declaration of function 'hugetlb_count_add'; did you mean 'hugetlb_count_sub'? [-Werror=implicit-function-declaration]
    4258 |         hugetlb_count_add(pages_per_huge_page(h), mm);
         |         ^~~~~~~~~~~~~~~~~
         |         hugetlb_count_sub
   mm/share_pool.c: At top level:
   mm/share_pool.c:4136:12: warning: 'proc_overview_show' defined but not used [-Wunused-function]
    4136 | static int proc_overview_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~~~~~
   mm/share_pool.c:4093:12: warning: 'proc_stat_show' defined but not used [-Wunused-function]
    4093 | static int proc_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~
   mm/share_pool.c:4029:12: warning: 'spa_stat_show' defined but not used [-Wunused-function]
    4029 | static int spa_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +4221 mm/share_pool.c

  4179	
  4180	vm_fault_t sharepool_no_page(struct mm_struct *mm,
  4181				struct vm_area_struct *vma,
  4182				struct address_space *mapping, pgoff_t idx,
  4183				unsigned long address, pte_t *ptep, unsigned int flags)
  4184	{
  4185		struct hstate *h = hstate_vma(vma);
  4186		vm_fault_t ret = VM_FAULT_SIGBUS;
  4187		unsigned long size;
  4188		struct page *page;
  4189		pte_t new_pte;
  4190		spinlock_t *ptl;
  4191		unsigned long haddr = address & huge_page_mask(h);
  4192		bool new_page = false;
  4193		int err;
  4194		int node_id;
  4195		struct sp_area *spa;
  4196	
  4197		spa = __find_sp_area(vma->vm_start);
  4198		if (!spa) {
  4199			pr_err("share pool: vma is invalid, not from sp mmap\n");
  4200			return ret;
  4201		}
  4202		node_id = spa->node_id;
  4203		__sp_area_drop(spa);
  4204	
  4205	retry:
  4206		page = find_lock_page(mapping, idx);
  4207		if (!page) {
  4208			size = i_size_read(mapping->host) >> huge_page_shift(h);
  4209			if (idx >= size)
  4210				goto out;
  4211	
  4212			page = alloc_huge_page(vma, haddr, 0);
  4213			if (IS_ERR(page)) {
  4214				page = alloc_huge_page_nodemask(hstate_file(vma->vm_file),
  4215							    node_id, NULL, GFP_KERNEL);
  4216				if (!page)
  4217					page = ERR_PTR(-ENOMEM);
  4218			}
  4219			if (IS_ERR(page)) {
  4220				ptl = huge_pte_lock(h, mm, ptep);
> 4221				if (!huge_pte_none(huge_ptep_get(ptep))) {
  4222					ret = 0;
  4223					spin_unlock(ptl);
  4224					goto out;
  4225				}
  4226				spin_unlock(ptl);
  4227				ret = vmf_error(PTR_ERR(page));
  4228				goto out;
  4229			}
  4230			__SetPageUptodate(page);
  4231			new_page = true;
  4232	
  4233			/* sharepool pages are all shared */
> 4234			err = huge_add_to_page_cache(page, mapping, idx);
  4235			if (err) {
  4236				put_page(page);
  4237				if (err == -EEXIST)
  4238					goto retry;
  4239				goto out;
  4240			}
  4241		}
  4242	
  4243	
  4244		ptl = huge_pte_lock(h, mm, ptep);
  4245		size = i_size_read(mapping->host) >> huge_page_shift(h);
  4246		if (idx >= size)
  4247			goto backout;
  4248	
  4249		ret = 0;
  4250		if (!huge_pte_none(huge_ptep_get(ptep)))
  4251			goto backout;
  4252	
  4253		page_dup_rmap(page, true);
  4254		new_pte = make_huge_pte(vma, page, ((vma->vm_flags & VM_WRITE)
  4255					&& (vma->vm_flags & VM_SHARED)));
> 4256		set_huge_pte_at(mm, haddr, ptep, new_pte);
  4257	
> 4258		hugetlb_count_add(pages_per_huge_page(h), mm);
  4259	
  4260		spin_unlock(ptl);
  4261	
  4262		if (new_page) {
  4263			SetPagePrivate(&page[1]);
  4264		}
  4265	
  4266		unlock_page(page);
  4267	out:
  4268		return ret;
  4269	
  4270	backout:
  4271		spin_unlock(ptl);
  4272		unlock_page(page);
  4273		put_page(page);
  4274		goto out;
  4275	}
  4276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
