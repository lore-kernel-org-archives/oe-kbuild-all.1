Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0338AB672
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 May 2024 09:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716714402; cv=none; b=Ij0ys8ELeE4rudpPpD2HnbmjyAtdFLRZJJME0Gi/8b1acT5soM7mcvWxR+rfSdRFnUNZGD7Xc85ZzFSntJTC/sEyjeZEZFu46+8Ff4NkxjeyJxeoTk1QdgJdf3zm6dQi4GMLLIp7xqH2ddm5kkxSGjy+saWaXrtydk62MY7VLLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716714402; c=relaxed/simple;
	bh=6q5hqEbbvnTZCkhT42Um0mfV4qDX6yYGXTWa6QV6CMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OqmI+bedLpjxVQLHEDO4WPlPnNfbNzPPalr5eC2TXCIiP31ywlqEDrS1PQnbWR8m6Mk5wPR7UoYyShgh0gZzoxsFUdbFcsUiFGQUun7ntX4da9UiP4uEXkibgjk+zSBrGEa/Qv7gPnfXHHuEcSdLBu3WxF72FlCHE6cnjQRumck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GlEA7D0j; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GlEA7D0j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716714401; x=1748250401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6q5hqEbbvnTZCkhT42Um0mfV4qDX6yYGXTWa6QV6CMU=;
  b=GlEA7D0jsRZio6SUcQnsgzAKuDQAiuigToD8wJyv4OVxBIBY4blNHu28
   5sHQN3zb12PMcXaiHGjbRw+oenREeUMI4jCP67QpsBHc09xWvGQyVFLBv
   rMBZFMw18ebSSKCKUG3j0uLK+ANmwW8j+0v7GFJuIb0+POdsXvAhzGLOC
   7VcDO75xudeXBjLGyRbB2pbve+7Ut+4bzb1/wUNSZInbs7qWNYqwmI7LB
   2at1ZwKO/tw5obFSTiYAeyvNsYscavk0W/FZcv90wH3fJfkBYC4AzKD9+
   YXubxONYGGfCBoWvhbCm9aJ3mpFx9tUFRXOQ4rPjhAxt4ziXk2h4UCEJv
   A==;
X-CSE-ConnectionGUID: CoR8juqfT9qancW4WJlrnw==
X-CSE-MsgGUID: IUZJIQpAQrq4eSbwKjX4Ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="13265337"
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; 
   d="scan'208";a="13265337"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 02:06:40 -0700
X-CSE-ConnectionGUID: TdgD+Um9TQStnJChkStOkQ==
X-CSE-MsgGUID: pKJrXE7VRt2l0y38zzkLNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; 
   d="scan'208";a="39441373"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 May 2024 02:06:39 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sB9ps-0007w6-12;
	Sun, 26 May 2024 09:06:36 +0000
Date: Sun, 26 May 2024 17:06:15 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 12103/13737]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:540:18: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202405261716.tWWnavqi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3689b0ef08b70e4e03b82ebd37730a03a672853a
commit: 17573fd971f9e31ddee420eca8359ceff87e9e51 [12103/13737] KVM: guest_memfd: extract __kvm_gmem_get_pfn()
config: x86_64-randconfig-121-20240526 (https://download.01.org/0day-ci/archive/20240526/202405261716.tWWnavqi-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240526/202405261716.tWWnavqi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405261716.tWWnavqi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:540:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:540:18: sparse:    struct file *
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:540:18: sparse:    struct file [noderef] __rcu *
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
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
