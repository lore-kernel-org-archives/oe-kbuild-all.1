Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0265C13D53D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 02:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729822719; cv=none; b=H2PEFPHbvsrLjsO9gbb0cuaa74J3XM09zk3BqW0dYBeo14cHAV3s8WiT7kUX/eDO+vmUOuOKfIOuunACV9WXl+TLydILmN+VR1TzhoQVR1C2+6d9OU/ZCIHlafrl7dwwLSNH3ZP45I4Og7ogihBmXP1Tm18SibXIMrZmejPWUsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729822719; c=relaxed/simple;
	bh=BaJKg9hyzyGMcO0NLPCUYrxmRmyBpqEZ9VB9ewB55SM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xlax8KCtcnlOJls1/J9PRxbvCbyb/qFzRm9hjrcUcTibA7ErqkkRH79Xp3ROoMT1v8GdrJ3AaNGU9pp3Nl2xS4th69Ct2JDCAA9nJIxrXk9y8u3mp+vUUSLIkViw92SKM+mQYs+oBTiedGBhIImwu0TV9M/cKqtgxs6D9plAcug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iL1+UScb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iL1+UScb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729822717; x=1761358717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BaJKg9hyzyGMcO0NLPCUYrxmRmyBpqEZ9VB9ewB55SM=;
  b=iL1+UScbKmTJ4eryQtBYm9WVrBH7bg2VYOVax6NUyqTvO5Lb/3W0eCL0
   XZzb3hm+EX1560RnrHQPdH5LRZBE4/fH4OaJSonegU31+NTJvUnx8aOz7
   rCtD25Rg9y4Vk4notgmH/R4sduW25cXtE0jXYwooM1pF9vY0yfRRP4eae
   kqB5b6uiqcFTDNjsWLiKoEqAh5jo0VJr70tGb8u4l+jozPAXD4Y9WuS0V
   azXkl6zXjaIL0hlnfUwRYaYTg+gsCsj/z/UIpcXlBa/y3Rn/os1dhvaH4
   l6fh0DG5sQh12HTM+PqisG6ppEWTU7UOcw1Krv7xaMp9o8ZeQhJPqjT36
   w==;
X-CSE-ConnectionGUID: DhcNKkRoR0i3jZgW9kk+1w==
X-CSE-MsgGUID: 7rG2wFmrT5uxRL4Paia1hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="54885881"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="54885881"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 19:18:37 -0700
X-CSE-ConnectionGUID: LQ0NvaGoTBmk4BEVLzD8Zg==
X-CSE-MsgGUID: behdr9x2Siadix2g6eQg5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="81088913"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Oct 2024 19:18:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t49uL-000XSQ-0U;
	Fri, 25 Oct 2024 02:18:33 +0000
Date: Fri, 25 Oct 2024 10:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Subject: [jarkko-tpmdd:lgp-v2 2/4] mm/madvise.c:1098:10: error: 'const struct
 mm_walk_ops' has no member named 'install_pte'
Message-ID: <202410251042.SfLMse1o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git lgp-v2
head:   7ed651841db9f18744191e575637d69239102a73
commit: 94de21c76e54641539032105ccd3f36801fa9d85 [2/4] mm: madvise: implement lightweight guard page mechanism
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241025/202410251042.SfLMse1o-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251042.SfLMse1o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251042.SfLMse1o-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/madvise.c:1098:10: error: 'const struct mm_walk_ops' has no member named 'install_pte'
    1098 |         .install_pte            = guard_poison_install_pte,
         |          ^~~~~~~~~~~
>> mm/madvise.c:1098:35: error: initialization of 'int (*)(long unsigned int,  long unsigned int,  int,  struct mm_walk *)' from incompatible pointer type 'int (*)(long unsigned int,  long unsigned int,  pte_t *, struct mm_walk *)' [-Werror=incompatible-pointer-types]
    1098 |         .install_pte            = guard_poison_install_pte,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/madvise.c:1098:35: note: (near initialization for 'guard_poison_walk_ops.pte_hole')
   mm/madvise.c: In function 'madvise_guard_poison':
>> mm/madvise.c:1130:23: error: implicit declaration of function 'walk_page_range_mm'; did you mean 'walk_page_range_vma'? [-Werror=implicit-function-declaration]
    1130 |                 err = walk_page_range_mm(vma->vm_mm, start, end,
         |                       ^~~~~~~~~~~~~~~~~~
         |                       walk_page_range_vma
   cc1: some warnings being treated as errors


vim +1098 mm/madvise.c

  1093	
  1094	static const struct mm_walk_ops guard_poison_walk_ops = {
  1095		.pud_entry		= guard_poison_pud_entry,
  1096		.pmd_entry		= guard_poison_pmd_entry,
  1097		.pte_entry		= guard_poison_pte_entry,
> 1098		.install_pte		= guard_poison_install_pte,
  1099		.walk_lock		= PGWALK_RDLOCK,
  1100	};
  1101	
  1102	static long madvise_guard_poison(struct vm_area_struct *vma,
  1103					 struct vm_area_struct **prev,
  1104					 unsigned long start, unsigned long end)
  1105	{
  1106		long err;
  1107	
  1108		*prev = vma;
  1109		if (!is_valid_guard_vma(vma, /* allow_locked = */false))
  1110			return -EINVAL;
  1111	
  1112		/*
  1113		 * If we install poison markers, then the range is no longer
  1114		 * empty from a page table perspective and therefore it's
  1115		 * appropriate to have an anon_vma.
  1116		 *
  1117		 * This ensures that on fork, we copy page tables correctly.
  1118		 */
  1119		err = anon_vma_prepare(vma);
  1120		if (err)
  1121			return err;
  1122	
  1123		/*
  1124		 * Optimistically try to install the guard poison pages first. If any
  1125		 * non-guard pages are encountered, give up and zap the range before
  1126		 * trying again.
  1127		 */
  1128		while (true) {
  1129			/* Returns < 0 on error, == 0 if success, > 0 if zap needed. */
> 1130			err = walk_page_range_mm(vma->vm_mm, start, end,
  1131						 &guard_poison_walk_ops, NULL);
  1132			if (err <= 0)
  1133				return err;
  1134	
  1135			/*
  1136			 * OK some of the range have non-guard pages mapped, zap
  1137			 * them. This leaves existing guard pages in place.
  1138			 */
  1139			zap_page_range_single(vma, start, end - start, NULL);
  1140	
  1141			if (fatal_signal_pending(current))
  1142				return -EINTR;
  1143			cond_resched();
  1144		}
  1145	}
  1146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
