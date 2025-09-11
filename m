Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70D833EAFD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Sep 2025 16:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757608990; cv=none; b=JG5auYK7dvs0Ktxdf6KZcZcvMv+STBaMKUXPoPXcm2bCosZnGcTURSa3h9KARR6bLzB0gqmRiwTIJe7IzOkQcsx01SPaAxomsQsnz0jgLUPBXu6PIH3ipNHEXDHxwwMQWmg9Bagdpup/hrNbOi8gXcRFygCsVsKnEX/CW6OkosI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757608990; c=relaxed/simple;
	bh=w7kQEN6EW+BoUjM7HT38VEHjYLkxYYGPXZ0NAIUiRg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BF4bC84ezV8o3xCpipyRjadUcZLelBJ2nQU8EWgKFLICbQpYDUclIWmWYEeXtkRpYz0dV4vmJ2byKcW0yn/4Z0pLSdhBY4F/6xqYaYNUNwupssUijC/+2F10IxSxhxZX7ITKFpfKfvy9bibYqoAaaX+e9DrstolCAL2ce+Ieamk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+Q7Qwkp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+Q7Qwkp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757608989; x=1789144989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w7kQEN6EW+BoUjM7HT38VEHjYLkxYYGPXZ0NAIUiRg8=;
  b=S+Q7QwkpQWOqqQpow8sIsUEBSe2J35NKufpDFF5Oj8Jg6tGR9jtY8W6Z
   aOddIi72jHZeVeCMtlA290VLXEvHaOXh14eMr2GMVZ9tbUkG8T41tROm6
   uMquLYTA+AgBn+mZt3bGwGrBzLZZBVT1lU+J2+sKdYltX5guL/pae9kz8
   NceTr5/poepmW5wN+gTnFDEuaMd++ym7+CV5/3BPMmJIe8os10ArwqZYw
   fQACC6aXXnLrLJVD1dh6MHc2c9yUe7ZpC0ADaPqod9zGV8ISRke8ZTbb4
   KBh90byzmhRip3B/XqamuFcXRbTPemWl+AHd12ss2tu0EK2rj4rrNXsO/
   w==;
X-CSE-ConnectionGUID: SUKM9hdBRg2e3OX++dcbyQ==
X-CSE-MsgGUID: VOcPuRYtRi2LYhmFmPLsSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="77404495"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="77404495"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 09:43:09 -0700
X-CSE-ConnectionGUID: FPE9zEW7QLewW9WpLQ0Eeg==
X-CSE-MsgGUID: kEemcgFQR0OSSJKUfcmRmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="174118434"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 11 Sep 2025 09:43:06 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwkNU-0000Tw-1e;
	Thu, 11 Sep 2025 16:42:42 +0000
Date: Fri, 12 Sep 2025 00:42:15 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 15/16] fs/proc: update vmcore to use .proc_mmap_prepare
Message-ID: <202509120057.bt4ckSKn-lkp@intel.com>
References: <163fba3d7ec775ec3eb9a13bd641d3255e8ec96c.1757534913.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163fba3d7ec775ec3eb9a13bd641d3255e8ec96c.1757534913.git.lorenzo.stoakes@oracle.com>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[cannot apply to brauner-vfs/vfs.all char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus s390/features lwn/docs-next linus/master v6.17-rc5 next-20250911]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-shmem-update-shmem-to-use-mmap_prepare/20250911-042432
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/163fba3d7ec775ec3eb9a13bd641d3255e8ec96c.1757534913.git.lorenzo.stoakes%40oracle.com
patch subject: [PATCH v2 15/16] fs/proc: update vmcore to use .proc_mmap_prepare
config: x86_64-buildonly-randconfig-001-20250911 (https://download.01.org/0day-ci/archive/20250912/202509120057.bt4ckSKn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250912/202509120057.bt4ckSKn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509120057.bt4ckSKn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/proc/vmcore.c: In function 'mmap_prepare_action_vmcore':
>> fs/proc/vmcore.c:595:20: warning: variable 'end' set but not used [-Wunused-but-set-variable]
     595 |         u64 start, end, len, tsz;
         |                    ^~~


vim +/end +595 fs/proc/vmcore.c

0692dedcf64bf3 Vitaly Kuznetsov  2014-08-08  590  
a8a91e1ced449b Lorenzo Stoakes   2025-09-10  591  static int mmap_prepare_action_vmcore(struct vm_area_struct *vma)
83086978c63afd HATAYAMA Daisuke  2013-07-03  592  {
a8a91e1ced449b Lorenzo Stoakes   2025-09-10  593  	struct mmap_action action;
83086978c63afd HATAYAMA Daisuke  2013-07-03  594  	size_t size = vma->vm_end - vma->vm_start;
83086978c63afd HATAYAMA Daisuke  2013-07-03 @595  	u64 start, end, len, tsz;
819403c893551c David Hildenbrand 2024-12-04  596  	struct vmcore_range *m;
83086978c63afd HATAYAMA Daisuke  2013-07-03  597  
83086978c63afd HATAYAMA Daisuke  2013-07-03  598  	start = (u64)vma->vm_pgoff << PAGE_SHIFT;
83086978c63afd HATAYAMA Daisuke  2013-07-03  599  	end = start + size;
83086978c63afd HATAYAMA Daisuke  2013-07-03  600  	len = 0;
83086978c63afd HATAYAMA Daisuke  2013-07-03  601  
83086978c63afd HATAYAMA Daisuke  2013-07-03  602  	if (start < elfcorebuf_sz) {
83086978c63afd HATAYAMA Daisuke  2013-07-03  603  		u64 pfn;
83086978c63afd HATAYAMA Daisuke  2013-07-03  604  
83086978c63afd HATAYAMA Daisuke  2013-07-03  605  		tsz = min(elfcorebuf_sz - (size_t)start, size);
83086978c63afd HATAYAMA Daisuke  2013-07-03  606  		pfn = __pa(elfcorebuf + start) >> PAGE_SHIFT;
a8a91e1ced449b Lorenzo Stoakes   2025-09-10  607  
a8a91e1ced449b Lorenzo Stoakes   2025-09-10  608  		mmap_action_remap(&action, vma->vm_start, pfn, tsz,
a8a91e1ced449b Lorenzo Stoakes   2025-09-10  609  				  vma->vm_page_prot);
a8a91e1ced449b Lorenzo Stoakes   2025-09-10  610  		if (mmap_action_complete(&action, vma))
83086978c63afd HATAYAMA Daisuke  2013-07-03  611  			return -EAGAIN;
83086978c63afd HATAYAMA Daisuke  2013-07-03  612  		size -= tsz;
83086978c63afd HATAYAMA Daisuke  2013-07-03  613  		start += tsz;
83086978c63afd HATAYAMA Daisuke  2013-07-03  614  		len += tsz;
83086978c63afd HATAYAMA Daisuke  2013-07-03  615  
83086978c63afd HATAYAMA Daisuke  2013-07-03  616  		if (size == 0)
83086978c63afd HATAYAMA Daisuke  2013-07-03  617  			return 0;
83086978c63afd HATAYAMA Daisuke  2013-07-03  618  	}
83086978c63afd HATAYAMA Daisuke  2013-07-03  619  
83086978c63afd HATAYAMA Daisuke  2013-07-03  620  	if (start < elfcorebuf_sz + elfnotes_sz) {
83086978c63afd HATAYAMA Daisuke  2013-07-03  621  		void *kaddr;
83086978c63afd HATAYAMA Daisuke  2013-07-03  622  
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  623  		/* We add device dumps before other elf notes because the
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  624  		 * other elf notes may not fill the elf notes buffer
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  625  		 * completely and we will end up with zero-filled data
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  626  		 * between the elf notes and the device dumps. Tools will
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  627  		 * then try to decode this zero-filled data as valid notes
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  628  		 * and we don't want that. Hence, adding device dumps before
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  629  		 * the other elf notes ensure that zero-filled data can be
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  630  		 * avoided. This also ensures that the device dumps and
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  631  		 * other elf notes can be properly mmaped at page aligned
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  632  		 * address.
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  633  		 */
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  634  #ifdef CONFIG_PROC_VMCORE_DEVICE_DUMP
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  635  		/* Read device dumps */
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  636  		if (start < elfcorebuf_sz + vmcoredd_orig_sz) {
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  637  			u64 start_off;
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  638  
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  639  			tsz = min(elfcorebuf_sz + vmcoredd_orig_sz -
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  640  				  (size_t)start, size);
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  641  			start_off = start - elfcorebuf_sz;
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  642  			if (vmcoredd_mmap_dumps(vma, vma->vm_start + len,
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  643  						start_off, tsz))
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  644  				goto fail;
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  645  
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  646  			size -= tsz;
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  647  			start += tsz;
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  648  			len += tsz;
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  649  
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  650  			/* leave now if filled buffer already */
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  651  			if (!size)
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  652  				return 0;
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  653  		}
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  654  #endif /* CONFIG_PROC_VMCORE_DEVICE_DUMP */
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  655  
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  656  		/* Read remaining elf notes */
83086978c63afd HATAYAMA Daisuke  2013-07-03  657  		tsz = min(elfcorebuf_sz + elfnotes_sz - (size_t)start, size);
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  658  		kaddr = elfnotes_buf + start - elfcorebuf_sz - vmcoredd_orig_sz;
83086978c63afd HATAYAMA Daisuke  2013-07-03  659  		if (remap_vmalloc_range_partial(vma, vma->vm_start + len,
a8a91e1ced449b Lorenzo Stoakes   2025-09-10  660  				kaddr, 0, tsz, /* set_vma =*/false))
83086978c63afd HATAYAMA Daisuke  2013-07-03  661  			goto fail;
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  662  
83086978c63afd HATAYAMA Daisuke  2013-07-03  663  		size -= tsz;
83086978c63afd HATAYAMA Daisuke  2013-07-03  664  		start += tsz;
83086978c63afd HATAYAMA Daisuke  2013-07-03  665  		len += tsz;
83086978c63afd HATAYAMA Daisuke  2013-07-03  666  
83086978c63afd HATAYAMA Daisuke  2013-07-03  667  		if (size == 0)
83086978c63afd HATAYAMA Daisuke  2013-07-03  668  			return 0;
83086978c63afd HATAYAMA Daisuke  2013-07-03  669  	}
83086978c63afd HATAYAMA Daisuke  2013-07-03  670  
83086978c63afd HATAYAMA Daisuke  2013-07-03  671  	list_for_each_entry(m, &vmcore_list, list) {
83086978c63afd HATAYAMA Daisuke  2013-07-03  672  		if (start < m->offset + m->size) {
83086978c63afd HATAYAMA Daisuke  2013-07-03  673  			u64 paddr = 0;
83086978c63afd HATAYAMA Daisuke  2013-07-03  674  
0b50a2d86d8e9a Dave Young        2016-03-17  675  			tsz = (size_t)min_t(unsigned long long,
0b50a2d86d8e9a Dave Young        2016-03-17  676  					    m->offset + m->size - start, size);
83086978c63afd HATAYAMA Daisuke  2013-07-03  677  			paddr = m->paddr + start - m->offset;
0692dedcf64bf3 Vitaly Kuznetsov  2014-08-08  678  			if (vmcore_remap_oldmem_pfn(vma, vma->vm_start + len,
83086978c63afd HATAYAMA Daisuke  2013-07-03  679  						    paddr >> PAGE_SHIFT, tsz,
83086978c63afd HATAYAMA Daisuke  2013-07-03  680  						    vma->vm_page_prot))
83086978c63afd HATAYAMA Daisuke  2013-07-03  681  				goto fail;
83086978c63afd HATAYAMA Daisuke  2013-07-03  682  			size -= tsz;
83086978c63afd HATAYAMA Daisuke  2013-07-03  683  			start += tsz;
83086978c63afd HATAYAMA Daisuke  2013-07-03  684  			len += tsz;
83086978c63afd HATAYAMA Daisuke  2013-07-03  685  
83086978c63afd HATAYAMA Daisuke  2013-07-03  686  			if (size == 0)
83086978c63afd HATAYAMA Daisuke  2013-07-03  687  				return 0;
83086978c63afd HATAYAMA Daisuke  2013-07-03  688  		}
83086978c63afd HATAYAMA Daisuke  2013-07-03  689  	}
83086978c63afd HATAYAMA Daisuke  2013-07-03  690  
83086978c63afd HATAYAMA Daisuke  2013-07-03  691  	return 0;
83086978c63afd HATAYAMA Daisuke  2013-07-03  692  fail:
897ab3e0c49e24 Mike Rapoport     2017-02-24  693  	do_munmap(vma->vm_mm, vma->vm_start, len, NULL);
83086978c63afd HATAYAMA Daisuke  2013-07-03  694  	return -EAGAIN;
83086978c63afd HATAYAMA Daisuke  2013-07-03  695  }
a8a91e1ced449b Lorenzo Stoakes   2025-09-10  696  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
