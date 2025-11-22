Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957807081F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 11:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763811972; cv=none; b=KgIlF11KuGq2tPOe6j9OuI1nhyNIb4+9qkJgVXWiT5kgFeR4pHED5+jrS4AdMSzdPoWmIiOa91KxYKBVBlJNEab4XMZ+fBZJJQ2kCQNANHtFFS9x0K8wdCZtsz+7YN1L/JC8bLWAbPBBG3pafpMh+VNv4y/IftCxY+AInTzmeoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763811972; c=relaxed/simple;
	bh=d0Q52RAMtjgqVGbpmzLWBtD5LNq0AWhQ+xHDKOW27+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c+IM291vI/9x87oaw1MjXdavEGUGSqGx3dV13o68fkJojatlh8Nqfd04JlXlH3c058q1uQ2lkrenVzp39dwzqtaDJJjXSd3cT4K0B4iOJdGsKaFC+FmhX6JCIiWnqsu4TZX9VRRQTlj4fCRzpoU4yLZkXvRyQ+d+rt4f62RfAA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nmu3ziiN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nmu3ziiN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763811968; x=1795347968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d0Q52RAMtjgqVGbpmzLWBtD5LNq0AWhQ+xHDKOW27+M=;
  b=Nmu3ziiNt8KvqpmElCa0XCmZSF/pL5LPsp55ZTRPMWKV0MmZRAy0/BnS
   fy/19Vo8qXaWiNzikksj48Hl9nUy3EO6gZ4bOX7JcndA08Og/RmSMib7w
   Qb7/s5Y2FhEH+wwasWZQXT9yel0XW5W4fpdeEO1F9MgL0Ijtdk4YqzupO
   FMy85yID2vr224ATELk/hD0+iQuQwoovtvtDsIat1LcQ/lKkc1H6MoQ9h
   HTXfKNxTpha80Fn0HmCjLgGYPG/chPKy2lLLn7fjuGYlu35h8UTNKBS00
   mBCJAM03ZsLGEUFxFx8uT+Dt42u0+tI+jjQJD1d2aZoAzmZKUovVzP1+F
   A==;
X-CSE-ConnectionGUID: cA/56pWWRq2fvzFZWHc+Hg==
X-CSE-MsgGUID: Mg+Et0svTn6o6k3bGL4mbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65825982"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="65825982"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 03:46:07 -0800
X-CSE-ConnectionGUID: EWyw6BffSmqcGQESxnrPIg==
X-CSE-MsgGUID: KOz8LM5eRMygpoLe0jYnIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="222544575"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Nov 2025 03:46:06 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMm43-0007SN-2D;
	Sat, 22 Nov 2025 11:46:03 +0000
Date: Sat, 22 Nov 2025 19:45:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:uffd+guestmemfd/v1 4/5]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:376:24: error:
 'VM_FAULT_USERFAULTFD' undeclared; did you mean 'CONFIG_USERFAULTFD'?
Message-ID: <202511221905.NUfiax0t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git uffd+guestmemfd/v1
head:   37911e172b33e52e4e224da52775c714483c8a90
commit: bf20f42e7ef8a03b1df8aca27e5159b87f7d40ea [4/5] guest_memfd: add support for userfaultfd minor mode
config: x86_64-randconfig-072-20251122 (https://download.01.org/0day-ci/archive/20251122/202511221905.NUfiax0t-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221905.NUfiax0t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511221905.NUfiax0t-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_fault_user_mapping':
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:376:24: error: 'VM_FAULT_USERFAULTFD' undeclared (first use in this function); did you mean 'CONFIG_USERFAULTFD'?
     376 |                 return VM_FAULT_USERFAULTFD;
         |                        ^~~~~~~~~~~~~~~~~~~~
         |                        CONFIG_USERFAULTFD
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:376:24: note: each undeclared identifier is reported only once for each function it appears in


vim +376 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

   350	
   351	static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
   352	{
   353		struct inode *inode = file_inode(vmf->vma->vm_file);
   354		struct folio *folio;
   355		vm_fault_t ret = VM_FAULT_LOCKED;
   356	
   357		if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
   358			return VM_FAULT_SIGBUS;
   359	
   360		if (!((u64)inode->i_private & GUEST_MEMFD_FLAG_INIT_SHARED))
   361			return VM_FAULT_SIGBUS;
   362	
   363		folio = kvm_gmem_get_folio(inode, vmf->pgoff);
   364		if (IS_ERR(folio)) {
   365			int err = PTR_ERR(folio);
   366	
   367			if (err == -EAGAIN)
   368				return VM_FAULT_RETRY;
   369	
   370			return vmf_error(err);
   371		}
   372	
   373		if (userfaultfd_minor(vmf->vma)) {
   374			folio_unlock(folio);
   375			folio_put(folio);
 > 376			return VM_FAULT_USERFAULTFD;
   377		}
   378	
   379		if (WARN_ON_ONCE(folio_test_large(folio))) {
   380			ret = VM_FAULT_SIGBUS;
   381			goto out_folio;
   382		}
   383	
   384		if (!folio_test_uptodate(folio)) {
   385			clear_highpage(folio_page(folio, 0));
   386			kvm_gmem_mark_prepared(folio);
   387		}
   388	
   389		vmf->page = folio_file_page(folio, vmf->pgoff);
   390	
   391	out_folio:
   392		if (ret != VM_FAULT_LOCKED) {
   393			folio_unlock(folio);
   394			folio_put(folio);
   395		}
   396	
   397		return ret;
   398	}
   399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
