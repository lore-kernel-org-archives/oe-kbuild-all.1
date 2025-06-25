Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEE0268C42
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jun 2025 13:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857059; cv=none; b=N0bwI8kSgUcGuU2fY7Wwl/kHPQE0/IL9d+L/JkXxCc3c/6NCw7ayCeQYh9s1JiZPWT4yoFg/ekJJ7MLRBS2kNeM6DnjH59UYbVuWTDAiRSxe3cb6ycq8vIZhFwUiEERLfJWrEa2IMGQM0a4AxTluKaje0jTfSpEFrgeE33gl+b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857059; c=relaxed/simple;
	bh=5AQ3dgSOrkrDa+1EZUWze611PwQzS76uR5UpEkZ7YHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DoDDKa1mIWhIoYgNlJYoQrkhMedBBrs49J2UbFlp+viUQy7nIJFbl9aZclitq9mZVukLZT5VbdxLHOEI9ahGyjOMPKQ3k2ry8tJOvj/kmI1iy3m3/31EhTkHF8DooSjMM80jOtBITLR/taiMsXKWEEsIL/xda/76b4iA5TokpFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JEOv3TpK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JEOv3TpK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750857057; x=1782393057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5AQ3dgSOrkrDa+1EZUWze611PwQzS76uR5UpEkZ7YHM=;
  b=JEOv3TpKGotdIF9FseDO3/I35t8oNuTWhu3EQCXV537Ll/o8/K2/V7tE
   6CyIJVx7KvM4hPg4xUTP7we4ULXrb6Phl+Pwbf4tOnffqXx56IYCQ6qkh
   KUXpUgqR1KfJdmkdf/mHXq5Bf2c3zSa3ELuAhhhXr8gGym+1Vpk7kfZG3
   jyowvhU771Ic6UEawFqPobzM4BaWmU3DZuIEnlDTOlsfKgY/WpkU7sgal
   KOzw3Kp8t3lrofDGXYpXGZc1dn0dlLXDLcggULSQxp9066T9hX5XnjtHB
   b7MYloVESPLCQc6f1duC+LoqD954Buo0XfM2Rl+i3MReqvhwbQOSiHS4K
   A==;
X-CSE-ConnectionGUID: kkW8Mxt+RZW28B6iPhmHog==
X-CSE-MsgGUID: mjEUQkUlT3CnmJMmynL78A==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="40745965"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="40745965"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 06:10:56 -0700
X-CSE-ConnectionGUID: bx3xvlhdT1m2TbvtqXlRhQ==
X-CSE-MsgGUID: PhFYvxBcRemukIlvXLF7lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="156786675"
Received: from igk-lkp-server01.igk.intel.com (HELO c09d3523614d) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 25 Jun 2025 06:10:55 -0700
Received: from kbuild by c09d3523614d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUPts-00003v-3C;
	Wed, 25 Jun 2025 13:10:52 +0000
Date: Wed, 25 Jun 2025 21:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2195/2195] mm/madvise.c:297:6: warning: no
 previous prototype for 'force_swapin_vma'
Message-ID: <202506252153.wdmbmJie-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3160da23afe10e66040ac00ed17174cb467c79b3
commit: 92a0eb9bde6c03412b39f9f3d20968c091ea3b46 [2195/2195] memcg: introduce per-memcg swapin interface
config: x86_64-randconfig-2005-20250501 (https://download.01.org/0day-ci/archive/20250625/202506252153.wdmbmJie-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506252153.wdmbmJie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506252153.wdmbmJie-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/madvise.c:297:6: warning: no previous prototype for 'force_swapin_vma' [-Wmissing-prototypes]
     297 | void force_swapin_vma(struct vm_area_struct *vma)
         |      ^~~~~~~~~~~~~~~~


vim +/force_swapin_vma +297 mm/madvise.c

   280	
   281	#ifdef CONFIG_MEMCG_SWAP_QOS
   282	void force_swapin_vma(struct vm_area_struct *vma)
   283	{
   284		struct file *file = vma->vm_file;
   285	
   286		if (!can_madv_lru_vma(vma))
   287			return;
   288	
   289		if (!file) {
   290			walk_page_vma(vma, &swapin_walk_ops, vma);
   291			lru_add_drain();
   292		} else if (shmem_mapping(file->f_mapping))
   293			shmem_swapin_range(vma, vma->vm_start,
   294				vma->vm_end, file->f_mapping);
   295	}
   296	#else
 > 297	void force_swapin_vma(struct vm_area_struct *vma)
   298	{
   299	}
   300	#endif
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
