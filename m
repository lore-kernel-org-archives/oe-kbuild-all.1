Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288374F20A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 21:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710019004; cv=none; b=quwFoGjLdCnE4LSOOT4spLi2vyFL1+P6SFiMLxLXnlf1ppLQM/+Pq/yF2oGFkLGcZXSBtGBYJCk7UrrAvEfv3gtMba1teOBt/bwsbraTAOGpreDDCpQvG0LtgmRw7qvXZh731ZIJ+ZH5soTvxIFN60895tK0eyfD6vqsUzEeQ3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710019004; c=relaxed/simple;
	bh=jDZibul79JDpWJRPyBcKZ+nUQUJsuxzuhyrtmfL5uZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i5s+y4Wqg9GlFzWoifEpG4I/TQVcFNsm6vW2HIrl2EdawbFVGGZKG2ZdP5ZaOUpV7ehHYIa3OxbxfuC4N90+9zumFvQM0cq+bIIOm7d5onf88pZJxV+EgHfQA493FO2kpHmCqwdpH8pLgjK9XZ0oGfSNfGxgkvbBagGzX/8h3kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQgeC8Z9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQgeC8Z9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710019002; x=1741555002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jDZibul79JDpWJRPyBcKZ+nUQUJsuxzuhyrtmfL5uZE=;
  b=gQgeC8Z9XL6cs/a1OgRnQpOL5svZO5w9ub6vEjfiOAJL8A5ZVWmGBynp
   gYnWM00AMbIfh1PSqBd5Bffgap7vM5bAPAyr3hHryq+lGTsAn4TOcByaa
   nnbArhqIAhb0iUzadjiFvzYF+HL7hBLCZjVmfxR5LkprvhonOBkZi2p5l
   5sP72Jke9mpcn1UCSQ9gsOCguQFeoa6mByxpvDSPh/Cn5NnEwovnQpf62
   pBS9WGHxOXGtIufCVbYqvUEEgYK6FCrFJhyXklQmsywqoH3Bjlu0ggm4c
   yLyMNxDNPxGffKb9MxT4j52Y7Ve27Q/cRVUg2961KiCsRkwUJ+VYSJnd+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="4573161"
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="4573161"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 13:16:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="15390918"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Mar 2024 13:16:40 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rj43a-0007f5-0z;
	Sat, 09 Mar 2024 21:16:38 +0000
Date: Sun, 10 Mar 2024 05:16:02 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:pfn_cow 1/8] arch/x86/mm/pat/memtype.c:977:65:
 error: 'struct vma_pfnmap_ctx' has no member named 'pat_cachemode'
Message-ID: <202403100513.f6gAapN1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux pfn_cow
head:   00b7acecadc66f73e664b6bffeb7a237a9c0a47a
commit: abd1306234acff20b98e11f44f3dfaadc40a15c5 [1/8] x86/mm/pat: don't rely on PTE information in COW mappings
config: i386-buildonly-randconfig-003-20240309 (https://download.01.org/0day-ci/archive/20240310/202403100513.f6gAapN1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403100513.f6gAapN1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403100513.f6gAapN1-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/mm/pat/memtype.c: In function 'track_pfn_copy':
>> arch/x86/mm/pat/memtype.c:977:65: error: 'struct vma_pfnmap_ctx' has no member named 'pat_cachemode'
     977 |                         prot = cachemode2protval(vma->pfnmap_ctx.pat_cachemode);
         |                                                                 ^
   arch/x86/mm/pat/memtype.c: In function 'track_pfn_remap':
   arch/x86/mm/pat/memtype.c:1009:40: error: 'struct vma_pfnmap_ctx' has no member named 'pat_cachemode'
    1009 |                         vma->pfnmap_ctx.pat_cachemode = pgprot2cachemode(*prot);
         |                                        ^


vim +977 arch/x86/mm/pat/memtype.c

   952	
   953	/*
   954	 * track_pfn_copy is called when vma that is covering the pfnmap gets
   955	 * copied through copy_page_range().
   956	 *
   957	 * If the vma has a linear pfn mapping for the entire range, we get the prot
   958	 * from pte and reserve the entire vma range with single reserve_pfn_range call.
   959	 */
   960	int track_pfn_copy(struct vm_area_struct *vma)
   961	{
   962		resource_size_t paddr;
   963		unsigned long prot;
   964		unsigned long vma_size = vma->vm_end - vma->vm_start;
   965		pgprot_t pgprot;
   966	
   967		if (vma->vm_flags & VM_PAT) {
   968			/*
   969			 * reserve the whole chunk covered by vma. We need the
   970			 * starting address and protection from pte.
   971			 *
   972			 * For COW mappings, we have the PFN in vma->vm_pgoff, see
   973			 * remap_pfn_range_notrack().
   974			 */
   975			if (is_cow_mapping(vma->vm_flags)) {
   976				paddr = (resource_size_t)vma->vm_pgoff << PAGE_SHIFT;
 > 977				prot = cachemode2protval(vma->pfnmap_ctx.pat_cachemode);
   978			} else if (follow_phys(vma, vma->vm_start, 0, &prot, &paddr)) {
   979				WARN_ON_ONCE(1);
   980				return -EINVAL;
   981			}
   982			pgprot = __pgprot(prot);
   983			return reserve_pfn_range(paddr, vma_size, &pgprot, 1);
   984		}
   985	
   986		return 0;
   987	}
   988	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
