Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A70A161
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 04:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689483497; x=1721019497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mZYiFAmuQ47iHryn0rZuR/uk3odtrLp7t6OOiYxvWDY=;
  b=SV8zI2qTxHUn3IkDeFjkdf9DC0K3wPBmabAP0ViRKKUdd54ThcEVT/Kn
   F0TpRskpenZvbcnd/n29lgqfpHvEhTXM91Vcrk/fzZEDp5/wV7sE0zSuu
   hTSNxMCqBKb0MuWOOoW6iJ/fNyyEvTn3S51H+pIrP6wIcAEuqeiPKC0qG
   QdRa2XbViN0/1ZDOZuLIEcP2jvJi8bR1HA7gl3d+XoMjzgk+BybWMGhky
   PxTTK9e6cb4BJS5fjjxsvgRn+ugdMspfoFe1ZqyWEaV+/5zt8S4esPFkk
   TRel7NQoQIXzyVanCae7/kWyHxOmOAUhGu1inK4HW+Uowx3wvnwjGly5r
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="368371597"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="368371597"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 21:58:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="722832801"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="722832801"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 15 Jul 2023 21:58:15 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKtpm-0008b5-1a;
	Sun, 16 Jul 2023 04:58:14 +0000
Date: Sun, 16 Jul 2023 12:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 354/365] mm/hugetlb.c:2869:6:
 warning: no previous prototype for 'restore_reserve_on_error_vma'
Message-ID: <202307161238.2Z1mRUa3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   da8c3aa0cbb638a0dff13401bc17f817272110e6
commit: 27fdf54746324a06d6bbef1c4157b16d4ec5b864 [354/365] mm: hugetlb: Use restore_reserve_on_error directly in filesystems
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230716/202307161238.2Z1mRUa3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161238.2Z1mRUa3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161238.2Z1mRUa3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/hugetlb.c:2869:6: warning: no previous prototype for 'restore_reserve_on_error_vma' [-Wmissing-prototypes]
    2869 | void restore_reserve_on_error_vma(struct hstate *h, struct vm_area_struct *vma,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/restore_reserve_on_error_vma +2869 mm/hugetlb.c

96b96a96ddee4b Mike Kravetz 2016-11-10  2868  
a7a68b18143922 Ackerley Tng 2023-06-06 @2869  void restore_reserve_on_error_vma(struct hstate *h, struct vm_area_struct *vma,
a7a68b18143922 Ackerley Tng 2023-06-06  2870  				  unsigned long address, struct folio *folio)
a7a68b18143922 Ackerley Tng 2023-06-06  2871  {
a7a68b18143922 Ackerley Tng 2023-06-06  2872  	struct resv_map *resv = vma_resv_map(vma);
a7a68b18143922 Ackerley Tng 2023-06-06  2873  	pgoff_t resv_index = vma_hugecache_offset(h, vma, address);
a7a68b18143922 Ackerley Tng 2023-06-06  2874  	bool may_share = vma->vm_flags & VM_MAYSHARE;
a7a68b18143922 Ackerley Tng 2023-06-06  2875  
a7a68b18143922 Ackerley Tng 2023-06-06  2876  	restore_reserve_on_error(resv, resv_index, may_share, folio);
a7a68b18143922 Ackerley Tng 2023-06-06  2877  }
a7a68b18143922 Ackerley Tng 2023-06-06  2878  

:::::: The code at line 2869 was first introduced by commit
:::::: a7a68b181439229e22e4cb82895a129cf52cc3e2 mm: hugetlb: Refactor restore_reserve_on_error

:::::: TO: Ackerley Tng <ackerleytng@google.com>
:::::: CC: Isaku Yamahata <isaku.yamahata@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
