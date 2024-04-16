Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189061C10
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 00:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713226659; cv=none; b=jkWevydZL1il7rdhGpRVGC9zl/ccYZM18exM+EFUo7EUwxsX1WnP3aNXDvCjQhYwEGk7C9uAmzMvc97L1O+73/Vf43lrmrwnHuQedIZXDXxkPoyzLlwhTR/8CoZ5umshS70yWJn/jvZe7d8sATyWR3Ncff6QiXbi22VxTKaw9T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713226659; c=relaxed/simple;
	bh=yoCyZU9+iuuiS6aIfT/Au7G0wZ4ky4Nz/fUnFMZUZK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IXNAQTzQkUSTX70wfeM/EEF5iXL0nehDq5s9oKUYkFBv4jBPttWL0uRLRRePjbaUWyTbHsCkZ22RPGONj7ndygExuVVjUuxre1mvkJ5yw/g/sUeNF+3f7Fbva8NBVaMRGzsMJxOQ9BdfYraEzOf0gdeJFSV3/ZJcbxixJBWnxmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JqjDSLkA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JqjDSLkA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713226658; x=1744762658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yoCyZU9+iuuiS6aIfT/Au7G0wZ4ky4Nz/fUnFMZUZK8=;
  b=JqjDSLkAx9lV1WJ1ctyf+hA1UTD63Tm1gDAlGKxmA0T7XxCp0FDC7hRv
   hv9580b5RsbZ1Wdv86Pa99NnF09znJ+cm4XiQlNhwfycduF5eePx7hNV5
   Orvz0T4UJOFrKOayaw+thVdpGtqRaG7NR/hzO6ftDY5McKwiCmvJYS9yX
   LQVMX2AM1Q+5sZUO6Zo759frMsFxfARYinfyTz33qkZP4i1YLlUMg1j3G
   7FISWVm2TEKDUaFjgGxAz6KqQg7EOxci3rTeUYxRmx90LP0bOkwk0oE2E
   9qNG55fmgcwB7dyRlecQ9ul9a6ZwUfRuRvWtZtaTbkLaK9DfPWFlRC8Y6
   A==;
X-CSE-ConnectionGUID: dqWu6kW1RCyccWx0cD+hOA==
X-CSE-MsgGUID: jDbphiMeQd2ihUPt/tNoeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="31119901"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="31119901"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 17:17:38 -0700
X-CSE-ConnectionGUID: 2/1T97d1QtGKni5FeJi9Ug==
X-CSE-MsgGUID: diceEUzqQlKzDh4dj2yT/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="26741087"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 15 Apr 2024 17:17:37 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwWVy-0004ke-1M;
	Tue, 16 Apr 2024 00:17:34 +0000
Date: Tue, 16 Apr 2024 08:17:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 5/5] fs/proc/task_mmu.c:872:36:
 warning: cast from 'int (*)(struct seq_file *, void *)' to 'show_pad_vma_fn'
 (aka 'void (*)(struct seq_file *, struct vm_area_struct *)') converts to
 incompatible function type
Message-ID: <202404160850.ar5pSy1e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   084d22016ccabe60338ea69b0a1c4c264551bd4c
commit: 084d22016ccabe60338ea69b0a1c4c264551bd4c [5/5] ANDROID: 16K: Separate padding from ELF LOAD segment mappings
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240416/202404160850.ar5pSy1e-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404160850.ar5pSy1e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404160850.ar5pSy1e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/task_mmu.c:872:36: warning: cast from 'int (*)(struct seq_file *, void *)' to 'show_pad_vma_fn' (aka 'void (*)(struct seq_file *, struct vm_area_struct *)') converts to incompatible function type [-Wcast-function-type]
           show_map_pad_vma(vma, pad_vma, m, (show_pad_vma_fn)show_smap);
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +872 fs/proc/task_mmu.c

   845	
   846	static int show_smap(struct seq_file *m, void *v)
   847	{
   848		struct vm_area_struct *pad_vma = get_pad_vma(v);
   849		struct vm_area_struct *vma = get_data_vma(v);
   850		struct mem_size_stats mss;
   851	
   852		memset(&mss, 0, sizeof(mss));
   853	
   854		smap_gather_stats(vma, &mss, 0);
   855	
   856		show_map_vma(m, vma);
   857	
   858		SEQ_PUT_DEC("Size:           ", vma->vm_end - vma->vm_start);
   859		SEQ_PUT_DEC(" kB\nKernelPageSize: ", vma_kernel_pagesize(vma));
   860		SEQ_PUT_DEC(" kB\nMMUPageSize:    ", vma_mmu_pagesize(vma));
   861		seq_puts(m, " kB\n");
   862	
   863		__show_smap(m, &mss, false);
   864	
   865		seq_printf(m, "THPeligible:    %d\n",
   866			   transparent_hugepage_active(vma));
   867	
   868		if (arch_pkeys_enabled())
   869			seq_printf(m, "ProtectionKey:  %8u\n", vma_pkey(vma));
   870		show_smap_vma_flags(m, vma);
   871	
 > 872		show_map_pad_vma(vma, pad_vma, m, (show_pad_vma_fn)show_smap);
   873	
   874		return 0;
   875	}
   876	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
