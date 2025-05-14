Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1503B149C4D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 14:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747231295; cv=none; b=mzuHWcnjAJ6sK7IOUNnsEQ7y2FXTU75bSdf4m1cagc0+qWqvMeZFEZi5RupwpySP45nPwW1iIcUjWB/7Ul396+Atr92uegn9TuUgLJ/S60hXG+7LVFteGBXW0URvuYURVnnUdHVnbULBMFnrD7SYwRuKp1vDUkdIvQ0JMd6AHQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747231295; c=relaxed/simple;
	bh=5CmYZ6pVugCTX+GPKgqxE230CjlbhmkVc26h0MZ/KDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lsRETglhID663G5rV2vmIA95cjjt/5/T23IFHDsWj56eAlcVNWWDt+tNfiN6xF+Lyxb90gcJRlz9L32uhXNUNsphSTugZ+oreNeSvvN6HeYcb6BDXUndK5oMvdb/qFClgYieoJNtyCqHlDibD3mpR5TxJR8T/kSiaHseAGVXqDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9QJt4ED; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9QJt4ED"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747231294; x=1778767294;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5CmYZ6pVugCTX+GPKgqxE230CjlbhmkVc26h0MZ/KDs=;
  b=I9QJt4EDdcwkDOy4ygwk0eDB72A0qObkACtOm2GSdDvhcSnq1K5ijt3i
   rQn3RSPzXGTFgGKdDymnHdbemo9ULQMtDggMzIJ0AgLdTmIMWAYSqJ2Uy
   Kfa4BnEDeIsNIpPbWtxqVZO4VE8OBVAGUFUmoIVpYednV1YHLY6PZ6tLJ
   HDf245ROqA+Ahy4vEceUzCRk3zbyeZg1SOTVSyulVKhSSZVlMzk/5U0kI
   VbHL8ERdZII2nfiuGZI2s07yL9kpMSNw15OJgCP27ES7qrFdRvSaWuBH+
   EDx0FU9cQqAImU/kzm6FtS5H/Gzw9so+/62lz2nh/MxgeeOmYs2k2goMs
   w==;
X-CSE-ConnectionGUID: tNrd9d5bQNywPTzg/bCHOA==
X-CSE-MsgGUID: phkNidwKTyCqqMFD+/UgGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49293988"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="49293988"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 07:01:33 -0700
X-CSE-ConnectionGUID: g2WobeaKQduQEHAtO2WSgA==
X-CSE-MsgGUID: rot08kInRqGjgQZ5Hnup6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="142085981"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 May 2025 07:01:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFCfp-000HC3-0b;
	Wed, 14 May 2025 14:01:29 +0000
Date: Wed, 14 May 2025 22:00:46 +0800
From: kernel test robot <lkp@intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 07/17] KVM: guest_memfd: Allow host to map
 guest_memfd() pages
Message-ID: <202505142132.zUao2lub-lkp@intel.com>
References: <20250513163438.3942405-8-tabba@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513163438.3942405-8-tabba@google.com>

Hi Fuad,

kernel test robot noticed the following build errors:

[auto build test ERROR on 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3]

url:    https://github.com/intel-lab-lkp/linux/commits/Fuad-Tabba/KVM-Rename-CONFIG_KVM_PRIVATE_MEM-to-CONFIG_KVM_GMEM/20250514-003900
base:   82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
patch link:    https://lore.kernel.org/r/20250513163438.3942405-8-tabba%40google.com
patch subject: [PATCH v9 07/17] KVM: guest_memfd: Allow host to map guest_memfd() pages
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250514/202505142132.zUao2lub-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505142132.zUao2lub-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505142132.zUao2lub-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_bind':
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:588:13: error: implicit declaration of function 'kvm_gmem_supports_shared' [-Werror=implicit-function-declaration]
     588 |         if (kvm_gmem_supports_shared(inode) &&
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/kvm_gmem_supports_shared +588 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

   558	
   559	int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
   560			  unsigned int fd, loff_t offset)
   561	{
   562		loff_t size = slot->npages << PAGE_SHIFT;
   563		unsigned long start, end;
   564		struct kvm_gmem *gmem;
   565		struct inode *inode;
   566		struct file *file;
   567		int r = -EINVAL;
   568	
   569		BUILD_BUG_ON(sizeof(gfn_t) != sizeof(slot->gmem.pgoff));
   570	
   571		file = fget(fd);
   572		if (!file)
   573			return -EBADF;
   574	
   575		if (file->f_op != &kvm_gmem_fops)
   576			goto err;
   577	
   578		gmem = file->private_data;
   579		if (gmem->kvm != kvm)
   580			goto err;
   581	
   582		inode = file_inode(file);
   583	
   584		if (offset < 0 || !PAGE_ALIGNED(offset) ||
   585		    offset + size > i_size_read(inode))
   586			goto err;
   587	
 > 588		if (kvm_gmem_supports_shared(inode) &&
   589		    !kvm_arch_vm_supports_gmem_shared_mem(kvm))
   590			goto err;
   591	
   592		filemap_invalidate_lock(inode->i_mapping);
   593	
   594		start = offset >> PAGE_SHIFT;
   595		end = start + slot->npages;
   596	
   597		if (!xa_empty(&gmem->bindings) &&
   598		    xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT)) {
   599			filemap_invalidate_unlock(inode->i_mapping);
   600			goto err;
   601		}
   602	
   603		/*
   604		 * memslots of flag KVM_MEM_GUEST_MEMFD are immutable to change, so
   605		 * kvm_gmem_bind() must occur on a new memslot.  Because the memslot
   606		 * is not visible yet, kvm_gmem_get_pfn() is guaranteed to see the file.
   607		 */
   608		WRITE_ONCE(slot->gmem.file, file);
   609		slot->gmem.pgoff = start;
   610	
   611		xa_store_range(&gmem->bindings, start, end - 1, slot, GFP_KERNEL);
   612		filemap_invalidate_unlock(inode->i_mapping);
   613	
   614		/*
   615		 * Drop the reference to the file, even on success.  The file pins KVM,
   616		 * not the other way 'round.  Active bindings are invalidated if the
   617		 * file is closed before memslots are destroyed.
   618		 */
   619		r = 0;
   620	err:
   621		fput(file);
   622		return r;
   623	}
   624	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
