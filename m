Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99B464A8F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 09:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733045759; cv=none; b=J/CvuzSbgY+igK2PTxcdnk9VcdCOMOJUaU0oDn2uGpGPG/qg+z7/59bRs8ZboifLsHBhIpPGrMFOON8/YszIA7tIL1z1QZE5cwRkjbGX5I0dEDn/ypYaaeW+uxxa4wpIvW33KBxsZkt28svqEUCd+ZXMWlhLdMQloMyAa5Kce28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733045759; c=relaxed/simple;
	bh=Stho1LITp7cgqHUmCplR2naLR5n8smAKlOObDrZXyhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XiJXV9KBiu+ikXRpsbrMKI6HwcNhErR/7qpAmCV954ADNA4OTWLH6UZaIlH7Pl3yBpOKtsI2NzYpGPlWJUigw46jghVdVl3YqKz4QptUpT7Uag+2yUHHdkGx+PPrFZmk64SpIYKJp6jSHPgHVEHOlY9lBsZc1UFKmflead1ADAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5/tcdG/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5/tcdG/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733045758; x=1764581758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Stho1LITp7cgqHUmCplR2naLR5n8smAKlOObDrZXyhA=;
  b=M5/tcdG/lvwWndAqKdKDjNAS4Qw/UBDhkbg7s8kIGbJ/z2db7N9wXzbh
   NWU5uqbCYlq7drqiEDTBy3ZrMrGrxb95JMdK5itg00mvbXSSFIVBvElyl
   +kuivCpfcwbGe3UlTul0twE0zUsEvYd4UX/tpKAkxRxRyBN+5suwj68Pr
   WuqEy4+hScZNB/GDSdQzO20MOS34jG93T9a+yukaP/596P3MJ7lG0B3Eu
   6EBWBT36vEBtxWrbG0Uij7KaxbYnT1KCIhUZsmpg1rpZlFYNItD5ZW2/l
   FYtJN4LazIlOkesJAF2cmqnhSeV6ggWJXOfCcNMM/XMfkzQ47wNHtqABN
   Q==;
X-CSE-ConnectionGUID: xN/taRJzSXGgyg2NX85RIQ==
X-CSE-MsgGUID: GJHvIkOjQs2ukNJhJYS/rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="32575895"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="32575895"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 01:35:57 -0800
X-CSE-ConnectionGUID: ccCwIqkbQq2lhZC6L9Omeg==
X-CSE-MsgGUID: vF2GWBjISLisA95SML3dAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="92745875"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Dec 2024 01:35:56 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHgL6-0001Qh-2i;
	Sun, 01 Dec 2024 09:35:03 +0000
Date: Sun, 1 Dec 2024 17:29:50 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/x86/kvm/../../../virt/kvm/guest_memfd.c:540:18: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202412011712.1CoGhyrO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcc8eda6d34934d80b96adb8dc4ff5dfc632a53a
commit: 17573fd971f9e31ddee420eca8359ceff87e9e51 KVM: guest_memfd: extract __kvm_gmem_get_pfn()
date:   7 months ago
config: x86_64-randconfig-122-20241116 (https://download.01.org/0day-ci/archive/20241201/202412011712.1CoGhyrO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412011712.1CoGhyrO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011712.1CoGhyrO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:540:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:540:18: sparse:    struct file *
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:540:18: sparse:    struct file [noderef] __rcu *
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:121:17: sparse: sparse: context imbalance in 'kvm_gmem_invalidate_begin' - different lock contexts for basic block
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:293:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file **f @@     got struct file [noderef] __rcu ** @@
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:293:33: sparse:     expected struct file **f
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:293:33: sparse:     got struct file [noderef] __rcu **
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:293:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file **f @@     got struct file [noderef] __rcu ** @@
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:293:33: sparse:     expected struct file **f
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:293:33: sparse:     got struct file [noderef] __rcu **

vim +540 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

   530	
   531	static int __kvm_gmem_get_pfn(struct file *file, struct kvm_memory_slot *slot,
   532			       gfn_t gfn, kvm_pfn_t *pfn, int *max_order, bool prepare)
   533	{
   534		pgoff_t index = gfn - slot->base_gfn + slot->gmem.pgoff;
   535		struct kvm_gmem *gmem = file->private_data;
   536		struct folio *folio;
   537		struct page *page;
   538		int r;
   539	
 > 540		if (file != slot->gmem.file) {
   541			WARN_ON_ONCE(slot->gmem.file);
   542			return -EFAULT;
   543		}
   544	
   545		gmem = file->private_data;
   546		if (xa_load(&gmem->bindings, index) != slot) {
   547			WARN_ON_ONCE(xa_load(&gmem->bindings, index));
   548			return -EIO;
   549		}
   550	
   551		folio = kvm_gmem_get_folio(file_inode(file), index, prepare);
   552		if (IS_ERR(folio))
   553			return PTR_ERR(folio);
   554	
   555		if (folio_test_hwpoison(folio)) {
   556			r = -EHWPOISON;
   557			goto out_unlock;
   558		}
   559	
   560		page = folio_file_page(folio, index);
   561	
   562		*pfn = page_to_pfn(page);
   563		if (max_order)
   564			*max_order = 0;
   565	
   566		r = 0;
   567	
   568	out_unlock:
   569		folio_unlock(folio);
   570	
   571		return r;
   572	}
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
