Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6867B3191CA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 18:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776190869; cv=none; b=N6hxj16U0FtTB2NkCArYcGjlBioGU3f87qn/mKYuOQFxdUy+A2iKYrfaSZQ8r2YGR0Z+FKpUDkeQzeY4GUvJz18fJeldF7+RpFRZOoAWZp9EkozcvTMooCvMjDTegfI9HXVSl5rnJ0RA1uOIRRtOL6XDB0ehmMZ56BdfBMDc8vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776190869; c=relaxed/simple;
	bh=YJTqwUx5Tvl2nl59QLikCmTmYk0GsptMiCD8GsttmC4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KTnuV/CAjmmCto5SnmvGSnIM7GYxgELD34zvMZzlvDoOhVidCf9WgL124OXc0HiL302PaU8t5bFI42Nv0JkdG5UVbXl4C/tsp7wnWlCZk8nUmW1vEJjDFvGzQ/ml0e7KOrqBTyraZhUPyruhFvPHSi/74w+QClbMubLcETzRJfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mj6kqsG2; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mj6kqsG2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776190867; x=1807726867;
  h=date:from:to:cc:subject:message-id;
  bh=YJTqwUx5Tvl2nl59QLikCmTmYk0GsptMiCD8GsttmC4=;
  b=Mj6kqsG2kMIk9bFGbtxICsbr4+4FFyl8qUo5l3g2MaqGgIXbRvt1wb19
   eLVYfE7Ve5QEUt7bd4ldrHsH12tEl50UvUXIMe0ZK2HXGPR03geEc8Xbn
   8njQG+S2mNnJxo9/HqLx42xH0KvC+Z4Vyep2BuwYZqx5rwJ8gGz8ccAml
   UbzbbsMlDY2TzgJl5Ta5ETf8kJY2guldQcIo8Fa/P6D/rTxws71GTYGsk
   QaSeRT2NCNkOU72Uk+FuNo7orZUT0lDNs/nYyZhpYIcCchooHFlaWpXgh
   KonHc4yTWxmDozCYq59zItz7ndqeX36traV/uVlHC6nqdtY5JMKB0H3la
   w==;
X-CSE-ConnectionGUID: IW4lOuRGQ+2cv+hH5PxINg==
X-CSE-MsgGUID: I7QQU15pQqSZxpM9p3sP3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77129727"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77129727"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 11:21:04 -0700
X-CSE-ConnectionGUID: Vne5Hc6sSPevk6qh07ihNQ==
X-CSE-MsgGUID: IFsVWicKSnqjsZYxNYmDfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="225455897"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Apr 2026 11:21:04 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCiNg-000000001kT-0e2z;
	Tue, 14 Apr 2026 18:21:00 +0000
Date: Wed, 15 Apr 2026 02:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-06 0/3]
 mm/pgsize_migration.c:284:7-14: WARNING opportunity for kmemdup
Message-ID: <202604150228.kWAaHEcU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-06
head:   aa5af24ea4d01a5c57de26e52f270b381405ab60
commit: 04053bc99f3d7705906a3a6c7df5680c6d575635 [0/3] ANDROID: 16K: Don't copy data vma for maps/smaps output
config: i386-randconfig-052-20260414 (https://download.01.org/0day-ci/archive/20260415/202604150228.kWAaHEcU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604150228.kWAaHEcU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/pgsize_migration.c:284:7-14: WARNING opportunity for kmemdup

vim +284 mm/pgsize_migration.c

8c2a805a857914 Kalesh Singh 2024-04-04  272  
8c2a805a857914 Kalesh Singh 2024-04-04  273  /*
04053bc99f3d77 Kalesh Singh 2025-04-09  274   * Returns a new VMA representing the padding in @vma;
04053bc99f3d77 Kalesh Singh 2025-04-09  275   * returns NULL if no padding in @vma or allocation failed.
8c2a805a857914 Kalesh Singh 2024-04-04  276   */
04053bc99f3d77 Kalesh Singh 2025-04-09  277  static struct vm_area_struct *get_pad_vma(struct vm_area_struct *vma)
8c2a805a857914 Kalesh Singh 2024-04-04  278  {
8c2a805a857914 Kalesh Singh 2024-04-04  279  	struct vm_area_struct *pad;
8c2a805a857914 Kalesh Singh 2024-04-04  280  
8c2a805a857914 Kalesh Singh 2024-04-04  281  	if (!is_pgsize_migration_enabled() || !(vma->vm_flags & VM_PAD_MASK))
8c2a805a857914 Kalesh Singh 2024-04-04  282  		return NULL;
8c2a805a857914 Kalesh Singh 2024-04-04  283  
8c2a805a857914 Kalesh Singh 2024-04-04 @284  	pad = kzalloc(sizeof(struct vm_area_struct), GFP_KERNEL);
04053bc99f3d77 Kalesh Singh 2025-04-09  285  	if (!pad) {
04053bc99f3d77 Kalesh Singh 2025-04-09  286  		pr_warn("Page size migration: Failed to allocate padding VMA");
04053bc99f3d77 Kalesh Singh 2025-04-09  287  		return NULL;
04053bc99f3d77 Kalesh Singh 2025-04-09  288  	}
8c2a805a857914 Kalesh Singh 2024-04-04  289  
8c2a805a857914 Kalesh Singh 2024-04-04  290  	memcpy(pad, vma, sizeof(struct vm_area_struct));
8c2a805a857914 Kalesh Singh 2024-04-04  291  
8c2a805a857914 Kalesh Singh 2024-04-04  292  	/* Remove file */
8c2a805a857914 Kalesh Singh 2024-04-04  293  	pad->vm_file = NULL;
8c2a805a857914 Kalesh Singh 2024-04-04  294  
8c2a805a857914 Kalesh Singh 2024-04-04  295  	/* Add vm_ops->name */
8c2a805a857914 Kalesh Singh 2024-04-04  296  	pad->vm_ops = &pad_vma_ops;
8c2a805a857914 Kalesh Singh 2024-04-04  297  
8c2a805a857914 Kalesh Singh 2024-04-04  298  	/* Adjust the start to begin at the start of the padding section */
8c2a805a857914 Kalesh Singh 2024-04-04  299  	pad->vm_start = VMA_PAD_START(pad);
8c2a805a857914 Kalesh Singh 2024-04-04  300  
dd9c02ccfe2715 Kalesh Singh 2024-06-17  301  	/*
dd9c02ccfe2715 Kalesh Singh 2024-06-17  302  	 * The below modifications to vm_flags don't need mmap write lock,
dd9c02ccfe2715 Kalesh Singh 2024-06-17  303  	 * since, pad does not belong to the VMA tree.
dd9c02ccfe2715 Kalesh Singh 2024-06-17  304  	 */
8c2a805a857914 Kalesh Singh 2024-04-04  305  	/* Make the pad vma PROT_NONE */
dd9c02ccfe2715 Kalesh Singh 2024-06-17  306  	__vm_flags_mod(pad, 0, VM_READ|VM_WRITE|VM_EXEC);
8c2a805a857914 Kalesh Singh 2024-04-04  307  	/* Remove padding bits */
dd9c02ccfe2715 Kalesh Singh 2024-06-17  308  	__vm_flags_mod(pad, 0, VM_PAD_MASK);
8c2a805a857914 Kalesh Singh 2024-04-04  309  
8c2a805a857914 Kalesh Singh 2024-04-04  310  	return pad;
8c2a805a857914 Kalesh Singh 2024-04-04  311  }
8c2a805a857914 Kalesh Singh 2024-04-04  312  

:::::: The code at line 284 was first introduced by commit
:::::: 8c2a805a857914324b077708b45c31c2f20d02da ANDROID: 16K: Separate padding from ELF LOAD segment mappings

:::::: TO: Kalesh Singh <kaleshsingh@google.com>
:::::: CC: Kalesh Singh <kaleshsingh@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
