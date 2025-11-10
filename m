Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A549309F08
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Nov 2025 11:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762774246; cv=none; b=tX0YdWLPyGvkOSfVt4LEGKBnc4+X9EVmvqxCFz6jyTFgqQR+0vcLsYOCDKYWZ9a8sS6GcYm4qZtefNaphjsMizkApRWv5e78ab2U+ydpvrT/pL5hoyQ1urd3yEZsdS4KC+GHzZD2O4hogMgiajDsH0mQybtie6E7uMkFZ/nWPNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762774246; c=relaxed/simple;
	bh=l3RX7fQG6S0g9hfl2inYEdMYBXBG92M0WZweaA3P/Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q6hcrPdy5wJHylxQuBdtjeBC68U/ySEa5J9skXWQGqgKGKz/l7EUfoudv480h7iKCpWrN0ecQHILU/bAP58jnNEv6egBiXo8CyVL7e3LsSGTl9xQBNL6gpxoSmJKjdKfgRA/X/QqYZh/YAWji6wMLrFUQx0gvox83V9bEO8867Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fhv7Nf17; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhv7Nf17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762774245; x=1794310245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l3RX7fQG6S0g9hfl2inYEdMYBXBG92M0WZweaA3P/Zs=;
  b=fhv7Nf17TulIo6Po+GfUhl++WxzrCnjyRdEVM3TGX7VibQlZgqLZ8V+w
   HXbXwRtJDkEdEUvEOQ8sIBA8a9YoTwfiIQ5xD/XJfTtroE9p6bteFQFnJ
   KGbJvomUiTrgZX2GPrThXfbTYynIvKHVQRYWYJLidRDruIWITvW3u/xB7
   3EIiiVgmX9+NUXUIey+E5xW136SnqMDiMZmGMKKu/uyzL5ZlcvScMIC1b
   8GTMP+iQVZ+nRcUJjvAlr1hzMibGPl6XAyoz7+za+QHqXwe20I0+HbAXP
   vGI6CBvasVZnjV5FRBGh22LZg1ep//42L/UHeW5T2RJaN+mHSYdW+pr0H
   g==;
X-CSE-ConnectionGUID: DRRmqhlLSxW9rnEPltAqkw==
X-CSE-MsgGUID: JJ5BtyJiTRWQUWnsKod4lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="82449071"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="82449071"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 03:30:35 -0800
X-CSE-ConnectionGUID: 1jxmuQSkTUq3knMoV6z0rA==
X-CSE-MsgGUID: TrrvAUY2QZ6jMvXkcsPMxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="188815862"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Nov 2025 03:30:34 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIQ6S-0000LO-1B;
	Mon, 10 Nov 2025 11:30:32 +0000
Date: Mon, 10 Nov 2025 19:29:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3126/3126] mm/shmem.c:1699:51: error: passing
 argument 3 of 'swap_cluster_readahead' from incompatible pointer type
Message-ID: <202511101911.9c0ewxw1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f750bb89c43eea8f7e0424615516674781c72f7b
commit: 2896144b31df6748c5d0e6df7991c4a31a54b371 [3126/3126] mempolicy: alloc_pages_mpol() for NUMA policy without vma
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251110/202511101911.9c0ewxw1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251110/202511101911.9c0ewxw1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511101911.9c0ewxw1-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/shmem.c: In function 'shmem_swapin_cluster':
>> mm/shmem.c:1699:51: error: passing argument 3 of 'swap_cluster_readahead' from incompatible pointer type [-Wincompatible-pointer-types]
    1699 |         folio = swap_cluster_readahead(swap, gfp, mpol, ilx);
         |                                                   ^~~~
         |                                                   |
         |                                                   struct mempolicy *
   In file included from mm/shmem.c:43:
   mm/swap.h:102:66: note: expected 'struct vm_fault *' but argument is of type 'struct mempolicy *'
     102 |                                 gfp_t gfp_mask, struct vm_fault *vmf)
         |                                                 ~~~~~~~~~~~~~~~~~^~~
>> mm/shmem.c:1699:17: error: too many arguments to function 'swap_cluster_readahead'; expected 3, have 4
    1699 |         folio = swap_cluster_readahead(swap, gfp, mpol, ilx);
         |                 ^~~~~~~~~~~~~~~~~~~~~~                  ~~~
   mm/swap.h:101:29: note: declared here
     101 | static inline struct folio *swap_cluster_readahead(swp_entry_t entry,
         |                             ^~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_SUPPORTS_SCHED_SOFT_QUOTA
   Depends on [n]: CGROUPS [=n]
   Selected by [y]:
   - ARM64 [=y]
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]


vim +/swap_cluster_readahead +1699 mm/shmem.c

  1687	
  1688	static struct mempolicy *shmem_get_pgoff_policy(struct shmem_inode_info *info,
  1689				pgoff_t index, unsigned int order, pgoff_t *ilx);
  1690	
  1691	static struct folio *shmem_swapin_cluster(swp_entry_t swap, gfp_t gfp,
  1692				struct shmem_inode_info *info, pgoff_t index)
  1693	{
  1694		struct mempolicy *mpol;
  1695		pgoff_t ilx;
  1696		struct folio *folio;
  1697	
  1698		mpol = shmem_get_pgoff_policy(info, index, 0, &ilx);
> 1699		folio = swap_cluster_readahead(swap, gfp, mpol, ilx);
  1700		mpol_cond_put(mpol);
  1701	
  1702		return folio;
  1703	}
  1704	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
