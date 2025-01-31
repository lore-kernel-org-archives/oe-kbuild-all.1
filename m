Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72EC4174A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 05:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738301422; cv=none; b=s6y1XsLyptC8/KtkVwnuw5uXTyhjwMGYs8UkMsj1GjjTYnJzQGZSfmy43Nq0YFnPXFphBlyz/5kk3ACwu8XJj6qm36QaG1Ip5127nN1i6maRfmz+KhOsafM8PFP2gxPcmmsHqUraz+DctED7qk97JEk2yWhNZMfqZPfD5usgkFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738301422; c=relaxed/simple;
	bh=SyYKu4BB43VyePhrgbsXhXJUCXetN1DTUFIFTnkvqaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MR4Diz6/GraXVnS4yYyQfvRQ4RSHdZB29SDmzcz6tuR8L6XDvbs4rfiUm9OwAjSIRbQxIjat9dqERYXud6y3//FksjlxrMKvRg/Y5OKaG1gJTOuvPSapoSdwujNf6YaU6NvBc5cKb0Al0MTe94pXoiIdbOhGRJcFhZCATxxUclE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mamCHQui; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mamCHQui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738301421; x=1769837421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SyYKu4BB43VyePhrgbsXhXJUCXetN1DTUFIFTnkvqaE=;
  b=mamCHQuidufgr1rqT1Shjn2JtK65VTW8mWs2qMHJv6ytRoHVIUEpYaBK
   ZB9+4FfOHv3aiLz12sjUe+5pKAREmgV2esDdCyfVGA/945aOUda6W6AOO
   6lBlMNEUzWTwFh7myiTRE8IY43sBz/zdzZP/15LUjcGL4/0O5hEo3BwW4
   n6RO95m3h+bXuQSNvgwnscf8WuvxecnpMoHAQMiiixTj3ddzzy4/chWim
   POy+lpb90QZuDzrURzwWNgc+J+DpG+TaOIMtd01pckcE0zpPcTT/v1j9m
   VXLAbqRK9PT7rIwh1C9/B+LjcOWSgCsm5M7gGa8hmTZlWdfHDp2RtGd3U
   A==;
X-CSE-ConnectionGUID: uh6IRD15SdS7l63uaLg02A==
X-CSE-MsgGUID: vrldqQSpSBmPYCUNmD7ybw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38068350"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; 
   d="scan'208";a="38068350"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 21:30:20 -0800
X-CSE-ConnectionGUID: d6n344mKT6GaVqNhHMp59A==
X-CSE-MsgGUID: saVzjQbNQk2MM+XVfG1kVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; 
   d="scan'208";a="140428023"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Jan 2025 21:30:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdjbc-000m1L-1c;
	Fri, 31 Jan 2025 05:30:16 +0000
Date: Fri, 31 Jan 2025 13:29:18 +0800
From: kernel test robot <lkp@intel.com>
To: Frank van der Linden <fvdl@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 77/88] mm/hugetlb_vmemmap.c:704:17: error:
 label 'out' used but not defined
Message-ID: <202501311312.ZTWda9Ip-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Frank,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   495206a68b359eb6117d0860861578113bbb94e7
commit: 383ad37bda9ba2414ce6abff61fecdc09afc623a [77/88] mm/hugetlb: add pre-HVO framework
config: x86_64-buildonly-randconfig-001-20250131 (https://download.01.org/0day-ci/archive/20250131/202501311312.ZTWda9Ip-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501311312.ZTWda9Ip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501311312.ZTWda9Ip-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/hugetlb_vmemmap.c: In function '__hugetlb_vmemmap_optimize_folios':
>> mm/hugetlb_vmemmap.c:704:17: error: label 'out' used but not defined
     704 |                 goto out;
         |                 ^~~~


vim +/out +704 mm/hugetlb_vmemmap.c

   651	
   652	static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
   653						      struct list_head *folio_list,
   654						      bool boot)
   655	{
   656		struct folio *folio;
   657		int nr_to_optimize;
   658		LIST_HEAD(vmemmap_pages);
   659		unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH | VMEMMAP_SYNCHRONIZE_RCU;
   660	
   661		nr_to_optimize = 0;
   662		list_for_each_entry(folio, folio_list, lru) {
   663			int ret;
   664			unsigned long spfn, epfn;
   665	
   666			if (boot && folio_test_hugetlb_vmemmap_optimized(folio)) {
   667				/*
   668				 * Already optimized by pre-HVO, just map the
   669				 * mirrored tail page structs RO.
   670				 */
   671				spfn = (unsigned long)&folio->page;
   672				epfn = spfn + pages_per_huge_page(h);
   673				vmemmap_wrprotect_hvo(spfn, epfn, folio_nid(folio),
   674						HUGETLB_VMEMMAP_RESERVE_SIZE);
   675				register_page_bootmem_memmap(pfn_to_section_nr(spfn),
   676						&folio->page,
   677						HUGETLB_VMEMMAP_RESERVE_SIZE);
   678				static_branch_inc(&hugetlb_optimize_vmemmap_key);
   679				continue;
   680			}
   681	
   682			nr_to_optimize++;
   683	
   684			ret = hugetlb_vmemmap_split_folio(h, folio);
   685	
   686			/*
   687			 * Spliting the PMD requires allocating a page, thus lets fail
   688			 * early once we encounter the first OOM. No point in retrying
   689			 * as it can be dynamically done on remap with the memory
   690			 * we get back from the vmemmap deduplication.
   691			 */
   692			if (ret == -ENOMEM)
   693				break;
   694		}
   695	
   696		if (!nr_to_optimize)
   697			/*
   698			 * All pre-HVO folios, nothing left to do. It's ok if
   699			 * there is a mix of pre-HVO and not yet HVO-ed folios
   700			 * here, as __hugetlb_vmemmap_optimize_folio() will
   701			 * skip any folios that already have the optimized flag
   702			 * set, see vmemmap_should_optimize_folio().
   703			 */
 > 704			goto out;
   705	
   706		flush_tlb_all();
   707	
   708		list_for_each_entry(folio, folio_list, lru) {
   709			int ret;
   710	
   711			ret = __hugetlb_vmemmap_optimize_folio(h, folio, &vmemmap_pages, flags);
   712			/* only need to synchronize_rcu() once for each batch */
   713			flags &= ~VMEMMAP_SYNCHRONIZE_RCU;
   714	
   715			/*
   716			 * Pages to be freed may have been accumulated.  If we
   717			 * encounter an ENOMEM,  free what we have and try again.
   718			 * This can occur in the case that both spliting fails
   719			 * halfway and head page allocation also failed. In this
   720			 * case __hugetlb_vmemmap_optimize_folio() would free memory
   721			 * allowing more vmemmap remaps to occur.
   722			 */
   723			if (ret == -ENOMEM && !list_empty(&vmemmap_pages)) {
   724				flush_tlb_all();
   725				free_vmemmap_page_list(&vmemmap_pages);
   726				INIT_LIST_HEAD(&vmemmap_pages);
   727				__hugetlb_vmemmap_optimize_folio(h, folio, &vmemmap_pages, flags);
   728			}
   729		}
   730	
   731		flush_tlb_all();
   732		free_vmemmap_page_list(&vmemmap_pages);
   733	}
   734	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
