Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A911E834B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Sep 2025 04:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759033928; cv=none; b=EejWzVX7+ca0ASYcSgD5M5nHBVTflKVRDaFXWd5cEMoB9kkC6qhY0AVrZo0/EgurpfznOf7nHXQCjmPiDDztavJ0/+RZoL1ZEtSezQxk7qHGx2havB9V/fJyp55BJEqWbKJkgFRx6KAVWwxwHB9xpPK1MuNSgXMgrTCq/0lemr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759033928; c=relaxed/simple;
	bh=zNY1xgHovVzr+ZWUzsH/9pyzxN57MfSscTD51XjfTyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F7MMF3rFnbONi5dz9GsLDH2kxuxr9qAYlocu4rCfxbNy94aslll0TQ5nZqWY9wfu1Pkt/TZil8dPkYiANfIzc1lyD6olgbfB49ULoBI55wn0+XK8xI8ynm4jlj8HThDxnasfFFfsMXyTzeEpwEvxgU+UhFxod1dHLYWFKhcfRtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bln71tm0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bln71tm0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759033926; x=1790569926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zNY1xgHovVzr+ZWUzsH/9pyzxN57MfSscTD51XjfTyk=;
  b=bln71tm0dwT6zgAj/s22W97bOx/sEigxTJHTG0sadw0K0IC986P3xcvf
   mjPRu9VZ3XZWto//OAXZqiMH6MlL32H/34CJlU+bg6th7hcN/KRd2jpDy
   0cAFuq14AHlBb1XlNCuu/HL/RxDoobBqlLJbhGS2QLwJRfArw3UVWoAAk
   yZtSUcN5RjgjZBCCkviMsJHkGMzCWy01YRWV6r6Tt7y+PitBhLzsLWvFN
   3TT9sLotZi1/oKIpDSG3QeU573WLikADKkpAyW6hU+hV8ME7ZeRrx64P4
   27S1EWRR0pL4G+qkJ9pFJj/JYplCLyDk+G1bOqfTd7Bua+orQPXtROHk3
   w==;
X-CSE-ConnectionGUID: 78fZ8+8rS4+zV4v/K25zuA==
X-CSE-MsgGUID: mDImjkD4S4qjKTRh5IzZIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="72747557"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="72747557"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 21:32:05 -0700
X-CSE-ConnectionGUID: hcdnbwL3QmKyNnrDaKblLA==
X-CSE-MsgGUID: J/nv3NYDT4edolSobMySMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="182237018"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 27 Sep 2025 21:32:03 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2j4q-0007Wj-2g;
	Sun, 28 Sep 2025 04:32:00 +0000
Date: Sun, 28 Sep 2025 12:31:18 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:x86/gmem_inplace 29/30]
 arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:199:22: error: invalid
 storage class for function 'kvm_gmem_get_folio'
Message-ID: <202509281216.SkZREJzb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/gmem_inplace
head:   5140bf8b78f718d7df0eaf7d93420afeeb012afa
commit: 2cfe30d929b53ebc7c8a32a3ae884290024f90c1 [29/30] KVM: guest_memfd: Skip LRU for guest_memfd folios
config: arm64-randconfig-002-20250928 (https://download.01.org/0day-ci/archive/20250928/202509281216.SkZREJzb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509281216.SkZREJzb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509281216.SkZREJzb-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c: In function '__kvm_gmem_get_folio':
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:169:26: error: expected ';' before 'err'
     169 |   return ERR_PTR(-ENOMEM)
         |                          ^
         |                          ;
     170 | 
     171 |  err = mem_cgroup_charge(folio, NULL, gfp, false);
         |  ~~~                      
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:172:6: error: 'err' undeclared (first use in this function)
     172 |  if (err)
         |      ^~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:172:6: note: each undeclared identifier is reported only once for each function it appears in
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:199:22: error: invalid storage class for function 'kvm_gmem_get_folio'
     199 | static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
         |                      ^~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:224:13: error: invalid storage class for function 'kvm_gmem_invalidate_begin'
     224 | static void kvm_gmem_invalidate_begin(struct inode *inode, struct gmem_file *f,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:264:13: error: invalid storage class for function 'kvm_gmem_invalidate_end'
     264 | static void kvm_gmem_invalidate_end(struct gmem_file *f, pgoff_t start,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:276:13: error: invalid storage class for function 'kvm_gmem_punch_hole'
     276 | static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
         |             ^~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:302:13: error: invalid storage class for function 'kvm_gmem_allocate'
     302 | static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
         |             ^~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:349:13: error: invalid storage class for function 'kvm_gmem_fallocate'
     349 | static long kvm_gmem_fallocate(struct file *file, int mode, loff_t offset,
         |             ^~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:373:12: error: invalid storage class for function 'kvm_gmem_release'
     373 | static int kvm_gmem_release(struct inode *inode, struct file *file)
         |            ^~~~~~~~~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:422:28: error: invalid storage class for function 'kvm_gmem_get_file'
     422 | static inline struct file *kvm_gmem_get_file(struct kvm_memory_slot *slot)
         |                            ^~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:432:16: error: invalid storage class for function 'kvm_gmem_get_index'
     432 | static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
         |                ^~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:437:19: error: invalid storage class for function 'kvm_gmem_fault_user_mapping'
     437 | static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:508:12: error: initializer element is not constant
     508 |  .fault  = kvm_gmem_fault_user_mapping,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:508:12: note: (near initialization for 'kvm_gmem_vm_ops.fault')
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:515:12: error: invalid storage class for function 'kvm_gmem_mmap'
     515 | static int kvm_gmem_mmap(struct file *file, struct vm_area_struct *vma)
         |            ^~~~~~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:530:13: error: invalid storage class for function 'kvm_gmem_is_safe_for_conversion'
     530 | static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:566:12: error: invalid storage class for function 'kvm_gmem_mas_preallocate'
     566 | static int kvm_gmem_mas_preallocate(struct ma_state *mas, u64 attributes,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:587:12: error: invalid storage class for function '__kvm_gmem_set_attributes'
     587 | static int __kvm_gmem_set_attributes(struct inode *inode,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:647:12: error: invalid storage class for function 'kvm_gmem_supported_mem_attributes'
     647 | static u64 kvm_gmem_supported_mem_attributes(struct gmem_file *f)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:655:13: error: invalid storage class for function 'kvm_gmem_set_attributes'
     655 | static long kvm_gmem_set_attributes(struct file *file, void __user *argp)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:691:13: error: invalid storage class for function 'kvm_gmem_ioctl'
     691 | static long kvm_gmem_ioctl(struct file *file, unsigned int ioctl,
         |             ^~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_is_private':
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:716:8: error: implicit declaration of function 'kvm_gmem_shareability_get' [-Werror=implicit-function-declaration]
     716 |  ret = kvm_gmem_shareability_get(inode, index) == SHAREABILITY_GUEST;
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:716:51: error: 'SHAREABILITY_GUEST' undeclared (first use in this function)
     716 |  ret = kvm_gmem_shareability_get(inode, index) == SHAREABILITY_GUEST;
         |                                                   ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:18,
                    from include/linux/backing-dev.h:12,
                    from arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:3:
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c: In function '__kvm_gmem_get_folio':
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:722:19: error: non-static declaration of 'kvm_gmem_is_private' follows static declaration
     722 | EXPORT_SYMBOL_GPL(kvm_gmem_is_private);
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/export.h:76:21: note: in definition of macro '__EXPORT_SYMBOL'
      76 |  extern typeof(sym) sym;     \
         |                     ^~~
   include/linux/export.h:90:33: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)  _EXPORT_SYMBOL(sym, "GPL")
         |                                 ^~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:722:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     722 | EXPORT_SYMBOL_GPL(kvm_gmem_is_private);
         | ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:701:6: note: previous definition of 'kvm_gmem_is_private' was here
     701 | bool kvm_gmem_is_private(struct kvm_memory_slot *slot, gfn_t gfn)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:725:11: error: initializer element is not constant
     725 |  .mmap  = kvm_gmem_mmap,
         |           ^~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:725:11: note: (near initialization for 'kvm_gmem_fops.mmap')
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:727:13: error: initializer element is not constant
     727 |  .release = kvm_gmem_release,
         |             ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:727:13: note: (near initialization for 'kvm_gmem_fops.release')
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:728:15: error: initializer element is not constant
     728 |  .fallocate = kvm_gmem_fallocate,
         |               ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:728:15: note: (near initialization for 'kvm_gmem_fops.fallocate')
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:729:20: error: initializer element is not constant
     729 |  .unlocked_ioctl = kvm_gmem_ioctl,
         |                    ^~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:729:20: note: (near initialization for 'kvm_gmem_fops.unlocked_ioctl')
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:732:12: error: invalid storage class for function 'kvm_gmem_migrate_folio'
     732 | static int kvm_gmem_migrate_folio(struct address_space *mapping,
         |            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:740:12: error: invalid storage class for function 'kvm_gmem_error_folio'
     740 | static int kvm_gmem_error_folio(struct address_space *mapping, struct folio *folio)
         |            ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:770:13: error: invalid storage class for function 'kvm_gmem_free_folio'
     770 | static void kvm_gmem_free_folio(struct folio *folio)
         |             ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:783:19: error: initializer element is not constant
     783 |  .migrate_folio = kvm_gmem_migrate_folio,
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:783:19: note: (near initialization for 'kvm_gmem_aops.migrate_folio')
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:784:24: error: initializer element is not constant
     784 |  .error_remove_folio = kvm_gmem_error_folio,
         |                        ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:784:24: note: (near initialization for 'kvm_gmem_aops.error_remove_folio')
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:785:16: error: initializer element is not constant
     785 |  .free_folio = kvm_gmem_free_folio,
         |                ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:785:16: note: (near initialization for 'kvm_gmem_aops.free_folio')
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:788:12: error: invalid storage class for function 'kvm_gmem_setattr'
     788 | static int kvm_gmem_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
         |            ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:794:13: error: initializer element is not constant
     794 |  .setattr = kvm_gmem_setattr,
         |             ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:794:13: note: (near initialization for 'kvm_gmem_iops.setattr')
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:797:13: error: weak declaration of 'kvm_arch_supports_gmem_mmap' must be public
     797 | bool __weak kvm_arch_supports_gmem_mmap(struct kvm *kvm)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:802:12: error: invalid storage class for function 'kvm_gmem_init_inode'
     802 | static int kvm_gmem_init_inode(struct inode *inode, loff_t size, u64 flags)
         |            ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:839:12: error: invalid storage class for function '__kvm_gmem_create'
     839 | static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
         |            ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:1015:22: error: invalid storage class for function '__kvm_gmem_get_pfn'
    1015 | static struct folio *__kvm_gmem_get_pfn(struct file *file,
         |                      ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:18,
                    from include/linux/backing-dev.h:12,
                    from arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:3:
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:1089:19: error: non-static declaration of 'kvm_gmem_get_pfn' follows static declaration
    1089 | EXPORT_SYMBOL_GPL(kvm_gmem_get_pfn);
         |                   ^~~~~~~~~~~~~~~~
   include/linux/export.h:76:21: note: in definition of macro '__EXPORT_SYMBOL'
      76 |  extern typeof(sym) sym;     \
         |                     ^~~
   include/linux/export.h:90:33: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)  _EXPORT_SYMBOL(sym, "GPL")
         |                                 ^~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:1089:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1089 | EXPORT_SYMBOL_GPL(kvm_gmem_get_pfn);


vim +/kvm_gmem_get_folio +199 arch/arm64/kvm/../../../virt/kvm/guest_memfd.c

3dfa99b7260008 Shivank Garg        2025-08-27  155  
2cfe30d929b53e Ackerley Tng        2025-08-11  156  static struct folio *__kvm_gmem_get_folio(struct address_space *mapping,
2cfe30d929b53e Ackerley Tng        2025-08-11  157  					  pgoff_t index,
2cfe30d929b53e Ackerley Tng        2025-08-11  158  					  struct mempolicy *policy)
2cfe30d929b53e Ackerley Tng        2025-08-11  159  {
2cfe30d929b53e Ackerley Tng        2025-08-11  160  	const gfp_t gfp = mapping_gfp_mask(mapping);
2cfe30d929b53e Ackerley Tng        2025-08-11  161  	struct folio *folio;
2cfe30d929b53e Ackerley Tng        2025-08-11  162  
2cfe30d929b53e Ackerley Tng        2025-08-11  163  	folio = filemap_lock_folio(mapping, index);
2cfe30d929b53e Ackerley Tng        2025-08-11  164  	if (!IS_ERR(folio))
2cfe30d929b53e Ackerley Tng        2025-08-11  165  		return folio;
2cfe30d929b53e Ackerley Tng        2025-08-11  166  
2cfe30d929b53e Ackerley Tng        2025-08-11  167  	folio = filemap_alloc_folio(gfp, 0, policy);
2cfe30d929b53e Ackerley Tng        2025-08-11  168  	if (!folio) {
2cfe30d929b53e Ackerley Tng        2025-08-11 @169  		return ERR_PTR(-ENOMEM)
2cfe30d929b53e Ackerley Tng        2025-08-11  170  
2cfe30d929b53e Ackerley Tng        2025-08-11  171  	err = mem_cgroup_charge(folio, NULL, gfp, false);
2cfe30d929b53e Ackerley Tng        2025-08-11 @172  	if (err)
2cfe30d929b53e Ackerley Tng        2025-08-11  173  		goto err_put;
2cfe30d929b53e Ackerley Tng        2025-08-11  174  
2cfe30d929b53e Ackerley Tng        2025-08-11  175  	__folio_set_locked(folio);
2cfe30d929b53e Ackerley Tng        2025-08-11  176  
2cfe30d929b53e Ackerley Tng        2025-08-11  177  	err = __filemap_add_folio(mapping, folio, index, gfp, NULL);
2cfe30d929b53e Ackerley Tng        2025-08-11  178  	if (err) {
2cfe30d929b53e Ackerley Tng        2025-08-11  179  		__folio_clear_locked(folio);
2cfe30d929b53e Ackerley Tng        2025-08-11  180  		goto err_put;
2cfe30d929b53e Ackerley Tng        2025-08-11  181  	}
2cfe30d929b53e Ackerley Tng        2025-08-11  182  
2cfe30d929b53e Ackerley Tng        2025-08-11  183  	return folio;
2cfe30d929b53e Ackerley Tng        2025-08-11  184  
2cfe30d929b53e Ackerley Tng        2025-08-11  185  err_put:
2cfe30d929b53e Ackerley Tng        2025-08-11  186  	folio_put(folio);
2cfe30d929b53e Ackerley Tng        2025-08-11  187  	return ERR_PTR(err);
2cfe30d929b53e Ackerley Tng        2025-08-11  188  }
2cfe30d929b53e Ackerley Tng        2025-08-11  189  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  190  /*
b85524314a3db6 Paolo Bonzini       2024-07-11  191   * Returns a locked folio on success.  The caller is responsible for
b85524314a3db6 Paolo Bonzini       2024-07-11  192   * setting the up-to-date flag before the memory is mapped into the guest.
b85524314a3db6 Paolo Bonzini       2024-07-11  193   * There is no backing storage for the memory, so the folio will remain
b85524314a3db6 Paolo Bonzini       2024-07-11  194   * up-to-date until it's removed.
b85524314a3db6 Paolo Bonzini       2024-07-11  195   *
a7800aa80ea4d5 Sean Christopherson 2023-11-13  196   * Ignore accessed, referenced, and dirty flags.  The memory is
a7800aa80ea4d5 Sean Christopherson 2023-11-13  197   * unevictable and there is no storage to write back to.
a7800aa80ea4d5 Sean Christopherson 2023-11-13  198   */
b85524314a3db6 Paolo Bonzini       2024-07-11 @199  static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
b85524314a3db6 Paolo Bonzini       2024-07-11  200  {
b85524314a3db6 Paolo Bonzini       2024-07-11  201  	/* TODO: Support huge pages. */
2cfe30d929b53e Ackerley Tng        2025-08-11  202  	struct address_space *mapping = inode->i_mapping;
3dfa99b7260008 Shivank Garg        2025-08-27  203  	struct mempolicy *policy;
3dfa99b7260008 Shivank Garg        2025-08-27  204  	struct folio *folio;
3dfa99b7260008 Shivank Garg        2025-08-27  205  
3dfa99b7260008 Shivank Garg        2025-08-27  206  	/*
3dfa99b7260008 Shivank Garg        2025-08-27  207  	 * Fast-path: See if folio is already present in mapping to avoid
3dfa99b7260008 Shivank Garg        2025-08-27  208  	 * policy_lookup.
3dfa99b7260008 Shivank Garg        2025-08-27  209  	 */
2cfe30d929b53e Ackerley Tng        2025-08-11  210  	folio = filemap_lock_folio(mapping, index);
3dfa99b7260008 Shivank Garg        2025-08-27  211  	if (!IS_ERR(folio))
3dfa99b7260008 Shivank Garg        2025-08-27  212  		return folio;
3dfa99b7260008 Shivank Garg        2025-08-27  213  
3dfa99b7260008 Shivank Garg        2025-08-27  214  	policy = kvm_gmem_get_folio_policy(GMEM_I(inode), index);
3dfa99b7260008 Shivank Garg        2025-08-27  215  
2cfe30d929b53e Ackerley Tng        2025-08-11  216  	do {
2cfe30d929b53e Ackerley Tng        2025-08-11  217  		folio = __kvm_gmem_get_folio(mapping, index, policy);
2cfe30d929b53e Ackerley Tng        2025-08-11  218  	} while (IS_ERR(folio) && PTR_ERR(folio) == -EEXIST);
2cfe30d929b53e Ackerley Tng        2025-08-11  219  
2cfe30d929b53e Ackerley Tng        2025-08-11  220  	mpol_cond_put(policy);
3dfa99b7260008 Shivank Garg        2025-08-27  221  	return folio;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  222  }
a7800aa80ea4d5 Sean Christopherson 2023-11-13  223  
6f762e7b6c4d22 Ackerley Tng        2025-05-06 @224  static void kvm_gmem_invalidate_begin(struct inode *inode, struct gmem_file *f,
6f762e7b6c4d22 Ackerley Tng        2025-05-06  225  				      pgoff_t start, pgoff_t end)
a7800aa80ea4d5 Sean Christopherson 2023-11-13  226  {
a7800aa80ea4d5 Sean Christopherson 2023-11-13  227  	bool flush = false, found_memslot = false;
6f762e7b6c4d22 Ackerley Tng        2025-05-06  228  	enum kvm_gfn_range_filter filter;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  229  	struct kvm_memory_slot *slot;
dbce6277852792 Sean Christopherson 2025-09-25  230  	struct kvm *kvm = f->kvm;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  231  	unsigned long index;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  232  
6f762e7b6c4d22 Ackerley Tng        2025-05-06  233  	filter = KVM_FILTER_PRIVATE;
6f762e7b6c4d22 Ackerley Tng        2025-05-06  234  	if (WARN_ON_ONCE(!inode) || kvm_gmem_supports_mmap(inode))
6f762e7b6c4d22 Ackerley Tng        2025-05-06  235  		filter |= KVM_FILTER_SHARED;
6f762e7b6c4d22 Ackerley Tng        2025-05-06  236  
dbce6277852792 Sean Christopherson 2025-09-25  237  	xa_for_each_range(&f->bindings, index, slot, start, end - 1) {
a7800aa80ea4d5 Sean Christopherson 2023-11-13  238  		pgoff_t pgoff = slot->gmem.pgoff;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  239  		struct kvm_gfn_range gfn_range = {
a7800aa80ea4d5 Sean Christopherson 2023-11-13  240  			.start = slot->base_gfn + max(pgoff, start) - pgoff,
a7800aa80ea4d5 Sean Christopherson 2023-11-13  241  			.end = slot->base_gfn + min(pgoff + slot->npages, end) - pgoff,
a7800aa80ea4d5 Sean Christopherson 2023-11-13  242  			.slot = slot,
a7800aa80ea4d5 Sean Christopherson 2023-11-13  243  			.may_block = true,
6f762e7b6c4d22 Ackerley Tng        2025-05-06  244  			.attr_filter = filter,
a7800aa80ea4d5 Sean Christopherson 2023-11-13  245  		};
a7800aa80ea4d5 Sean Christopherson 2023-11-13  246  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  247  		if (!found_memslot) {
a7800aa80ea4d5 Sean Christopherson 2023-11-13  248  			found_memslot = true;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  249  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  250  			KVM_MMU_LOCK(kvm);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  251  			kvm_mmu_invalidate_begin(kvm);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  252  		}
a7800aa80ea4d5 Sean Christopherson 2023-11-13  253  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  254  		flush |= kvm_mmu_unmap_gfn_range(kvm, &gfn_range);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  255  	}
a7800aa80ea4d5 Sean Christopherson 2023-11-13  256  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  257  	if (flush)
a7800aa80ea4d5 Sean Christopherson 2023-11-13  258  		kvm_flush_remote_tlbs(kvm);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  259  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  260  	if (found_memslot)
a7800aa80ea4d5 Sean Christopherson 2023-11-13  261  		KVM_MMU_UNLOCK(kvm);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  262  }
a7800aa80ea4d5 Sean Christopherson 2023-11-13  263  
dbce6277852792 Sean Christopherson 2025-09-25 @264  static void kvm_gmem_invalidate_end(struct gmem_file *f, pgoff_t start,
a7800aa80ea4d5 Sean Christopherson 2023-11-13  265  				    pgoff_t end)
a7800aa80ea4d5 Sean Christopherson 2023-11-13  266  {
dbce6277852792 Sean Christopherson 2025-09-25  267  	struct kvm *kvm = f->kvm;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  268  
dbce6277852792 Sean Christopherson 2025-09-25  269  	if (xa_find(&f->bindings, &start, end - 1, XA_PRESENT)) {
a7800aa80ea4d5 Sean Christopherson 2023-11-13  270  		KVM_MMU_LOCK(kvm);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  271  		kvm_mmu_invalidate_end(kvm);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  272  		KVM_MMU_UNLOCK(kvm);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  273  	}
a7800aa80ea4d5 Sean Christopherson 2023-11-13  274  }
a7800aa80ea4d5 Sean Christopherson 2023-11-13  275  
a7800aa80ea4d5 Sean Christopherson 2023-11-13 @276  static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
a7800aa80ea4d5 Sean Christopherson 2023-11-13  277  {
06a24b09b03050 Sean Christopherson 2025-09-25  278  	struct address_space *mapping = inode->i_mapping;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  279  	pgoff_t start = offset >> PAGE_SHIFT;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  280  	pgoff_t end = (offset + len) >> PAGE_SHIFT;
dbce6277852792 Sean Christopherson 2025-09-25  281  	struct gmem_file *f;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  282  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  283  	/*
a7800aa80ea4d5 Sean Christopherson 2023-11-13  284  	 * Bindings must be stable across invalidation to ensure the start+end
a7800aa80ea4d5 Sean Christopherson 2023-11-13  285  	 * are balanced.
a7800aa80ea4d5 Sean Christopherson 2023-11-13  286  	 */
06a24b09b03050 Sean Christopherson 2025-09-25  287  	filemap_invalidate_lock(mapping);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  288  
06a24b09b03050 Sean Christopherson 2025-09-25  289  	kvm_gmem_for_each_file(f, mapping)
6f762e7b6c4d22 Ackerley Tng        2025-05-06  290  		kvm_gmem_invalidate_begin(inode, f, start, end);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  291  
06a24b09b03050 Sean Christopherson 2025-09-25  292  	truncate_inode_pages_range(mapping, offset, offset + len - 1);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  293  
06a24b09b03050 Sean Christopherson 2025-09-25  294  	kvm_gmem_for_each_file(f, mapping)
dbce6277852792 Sean Christopherson 2025-09-25  295  		kvm_gmem_invalidate_end(f, start, end);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  296  
06a24b09b03050 Sean Christopherson 2025-09-25  297  	filemap_invalidate_unlock(mapping);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  298  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  299  	return 0;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  300  }
a7800aa80ea4d5 Sean Christopherson 2023-11-13  301  
a7800aa80ea4d5 Sean Christopherson 2023-11-13 @302  static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
a7800aa80ea4d5 Sean Christopherson 2023-11-13  303  {
a7800aa80ea4d5 Sean Christopherson 2023-11-13  304  	struct address_space *mapping = inode->i_mapping;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  305  	pgoff_t start, index, end;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  306  	int r;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  307  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  308  	/* Dedicated guest is immutable by default. */
a7800aa80ea4d5 Sean Christopherson 2023-11-13  309  	if (offset + len > i_size_read(inode))
a7800aa80ea4d5 Sean Christopherson 2023-11-13  310  		return -EINVAL;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  311  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  312  	filemap_invalidate_lock_shared(mapping);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  313  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  314  	start = offset >> PAGE_SHIFT;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  315  	end = (offset + len) >> PAGE_SHIFT;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  316  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  317  	r = 0;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  318  	for (index = start; index < end; ) {
a7800aa80ea4d5 Sean Christopherson 2023-11-13  319  		struct folio *folio;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  320  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  321  		if (signal_pending(current)) {
a7800aa80ea4d5 Sean Christopherson 2023-11-13  322  			r = -EINTR;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  323  			break;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  324  		}
a7800aa80ea4d5 Sean Christopherson 2023-11-13  325  
b85524314a3db6 Paolo Bonzini       2024-07-11  326  		folio = kvm_gmem_get_folio(inode, index);
70623723778a51 Paolo Bonzini       2024-02-14  327  		if (IS_ERR(folio)) {
70623723778a51 Paolo Bonzini       2024-02-14  328  			r = PTR_ERR(folio);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  329  			break;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  330  		}
a7800aa80ea4d5 Sean Christopherson 2023-11-13  331  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  332  		index = folio_next_index(folio);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  333  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  334  		folio_unlock(folio);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  335  		folio_put(folio);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  336  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  337  		/* 64-bit only, wrapping the index should be impossible. */
a7800aa80ea4d5 Sean Christopherson 2023-11-13  338  		if (WARN_ON_ONCE(!index))
a7800aa80ea4d5 Sean Christopherson 2023-11-13  339  			break;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  340  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  341  		cond_resched();
a7800aa80ea4d5 Sean Christopherson 2023-11-13  342  	}
a7800aa80ea4d5 Sean Christopherson 2023-11-13  343  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  344  	filemap_invalidate_unlock_shared(mapping);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  345  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  346  	return r;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  347  }
a7800aa80ea4d5 Sean Christopherson 2023-11-13  348  
a7800aa80ea4d5 Sean Christopherson 2023-11-13 @349  static long kvm_gmem_fallocate(struct file *file, int mode, loff_t offset,
a7800aa80ea4d5 Sean Christopherson 2023-11-13  350  			       loff_t len)
a7800aa80ea4d5 Sean Christopherson 2023-11-13  351  {
a7800aa80ea4d5 Sean Christopherson 2023-11-13  352  	int ret;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  353  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  354  	if (!(mode & FALLOC_FL_KEEP_SIZE))
a7800aa80ea4d5 Sean Christopherson 2023-11-13  355  		return -EOPNOTSUPP;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  356  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  357  	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE))
a7800aa80ea4d5 Sean Christopherson 2023-11-13  358  		return -EOPNOTSUPP;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  359  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  360  	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
a7800aa80ea4d5 Sean Christopherson 2023-11-13  361  		return -EINVAL;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  362  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  363  	if (mode & FALLOC_FL_PUNCH_HOLE)
a7800aa80ea4d5 Sean Christopherson 2023-11-13  364  		ret = kvm_gmem_punch_hole(file_inode(file), offset, len);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  365  	else
a7800aa80ea4d5 Sean Christopherson 2023-11-13  366  		ret = kvm_gmem_allocate(file_inode(file), offset, len);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  367  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  368  	if (!ret)
a7800aa80ea4d5 Sean Christopherson 2023-11-13  369  		file_modified(file);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  370  	return ret;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  371  }
a7800aa80ea4d5 Sean Christopherson 2023-11-13  372  
a7800aa80ea4d5 Sean Christopherson 2023-11-13 @373  static int kvm_gmem_release(struct inode *inode, struct file *file)
a7800aa80ea4d5 Sean Christopherson 2023-11-13  374  {
dbce6277852792 Sean Christopherson 2025-09-25  375  	struct gmem_file *f = file->private_data;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  376  	struct kvm_memory_slot *slot;
dbce6277852792 Sean Christopherson 2025-09-25  377  	struct kvm *kvm = f->kvm;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  378  	unsigned long index;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  379  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  380  	/*
a7800aa80ea4d5 Sean Christopherson 2023-11-13  381  	 * Prevent concurrent attempts to *unbind* a memslot.  This is the last
a7800aa80ea4d5 Sean Christopherson 2023-11-13  382  	 * reference to the file and thus no new bindings can be created, but
a7800aa80ea4d5 Sean Christopherson 2023-11-13  383  	 * dereferencing the slot for existing bindings needs to be protected
a7800aa80ea4d5 Sean Christopherson 2023-11-13  384  	 * against memslot updates, specifically so that unbind doesn't race
a7800aa80ea4d5 Sean Christopherson 2023-11-13  385  	 * and free the memslot (kvm_gmem_get_file() will return NULL).
67b43038ce14d6 Yan Zhao            2024-11-04  386  	 *
67b43038ce14d6 Yan Zhao            2024-11-04  387  	 * Since .release is called only when the reference count is zero,
67b43038ce14d6 Yan Zhao            2024-11-04  388  	 * after which file_ref_get() and get_file_active() fail,
67b43038ce14d6 Yan Zhao            2024-11-04  389  	 * kvm_gmem_get_pfn() cannot be using the file concurrently.
67b43038ce14d6 Yan Zhao            2024-11-04  390  	 * file_ref_put() provides a full barrier, and get_file_active() the
67b43038ce14d6 Yan Zhao            2024-11-04  391  	 * matching acquire barrier.
a7800aa80ea4d5 Sean Christopherson 2023-11-13  392  	 */
a7800aa80ea4d5 Sean Christopherson 2023-11-13  393  	mutex_lock(&kvm->slots_lock);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  394  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  395  	filemap_invalidate_lock(inode->i_mapping);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  396  
dbce6277852792 Sean Christopherson 2025-09-25  397  	xa_for_each(&f->bindings, index, slot)
67b43038ce14d6 Yan Zhao            2024-11-04  398  		WRITE_ONCE(slot->gmem.file, NULL);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  399  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  400  	/*
a7800aa80ea4d5 Sean Christopherson 2023-11-13  401  	 * All in-flight operations are gone and new bindings can be created.
a7800aa80ea4d5 Sean Christopherson 2023-11-13  402  	 * Zap all SPTEs pointed at by this file.  Do not free the backing
a7800aa80ea4d5 Sean Christopherson 2023-11-13  403  	 * memory, as its lifetime is associated with the inode, not the file.
a7800aa80ea4d5 Sean Christopherson 2023-11-13  404  	 */
6f762e7b6c4d22 Ackerley Tng        2025-05-06  405  	kvm_gmem_invalidate_begin(inode, f, 0, -1ul);
dbce6277852792 Sean Christopherson 2025-09-25  406  	kvm_gmem_invalidate_end(f, 0, -1ul);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  407  
dbce6277852792 Sean Christopherson 2025-09-25  408  	list_del(&f->entry);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  409  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  410  	filemap_invalidate_unlock(inode->i_mapping);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  411  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  412  	mutex_unlock(&kvm->slots_lock);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  413  
dbce6277852792 Sean Christopherson 2025-09-25  414  	xa_destroy(&f->bindings);
dbce6277852792 Sean Christopherson 2025-09-25  415  	kfree(f);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  416  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  417  	kvm_put_kvm(kvm);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  418  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  419  	return 0;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  420  }
a7800aa80ea4d5 Sean Christopherson 2023-11-13  421  

:::::: The code at line 199 was first introduced by commit
:::::: b85524314a3db687a87b190fd878aa1206b94b52 KVM: guest_memfd: delay kvm_gmem_prepare_folio() until the memory is passed to the guest

:::::: TO: Paolo Bonzini <pbonzini@redhat.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
