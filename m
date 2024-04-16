Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8631617E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 00:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713226059; cv=none; b=bMb1KG4myGS3T0ITSLE8L7W3jpbc2A75uKb5kmbFdnIFEIjfXw3Sx08ao4KNFQCsNBRzFJAxr5HUuOEo63L9eyNcEn/+SFG6IgEO7ao5Voo3OwAXi2vb9+ewRALSjOkEq6teBKp3T10ByyV9M/tw4qeROx+jKji2d0GVLgmxh1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713226059; c=relaxed/simple;
	bh=1JhqrHuoFXbkS14UQC/yxMDZfe1QHhiapywqG6RRkYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q1DC15GXH2LUqBdIB0Pc32PMURk+zYwvZqQmFQR/Ue8GOreZ5B+MA93x0kn0WnEum9Gh9GqWDVaoX9OTvQQbOnqEPi4AQx6qKpZGHYwg60VO/Ll77wMes4N20lA4XEZ1tfAkerVPsRFjTTICr/OF9UF8KI3/fW2b/qu8flP5bbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBpwkxYy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBpwkxYy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713226057; x=1744762057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1JhqrHuoFXbkS14UQC/yxMDZfe1QHhiapywqG6RRkYQ=;
  b=BBpwkxYyM/DMbdsB3nJZoKo+GTEHek96yM/Y5eFSHUrYz+ZkaGJgvajY
   aSwV7R/CSWebTAoQVU5vRctNai5vH004VfOhmuwMNsq1OqN6OUqOxGLz/
   0jMmidsXTNQKV8NxHAizAXLQfe1lK4gQsrYYINGmQoBRpOsQJcEAt16/m
   lPV5bf5J6lWP7dFL0HNRDbKHa3o+56hXGpe1QGjtcVpHcpdDL2zlLCm24
   4K16NSpqpbBQLCwFu6B8pgeUOkK0PCNHxSk9iOYCZOB26rK20BgEXNM0R
   UaYI/6bJmf5Cx7r7g5DtBMIvECAKrIUbzIVfsAauRpSOj2Y8p3uQsVj8P
   A==;
X-CSE-ConnectionGUID: /3M9S1BjSempIZ8jlKL9YA==
X-CSE-MsgGUID: Rh0HGU6lTYa/F6Z+UQKk3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="12421768"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="12421768"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 17:07:37 -0700
X-CSE-ConnectionGUID: OKZJ3R/CTWeq7hIZVhy6wg==
X-CSE-MsgGUID: g1vUdGEVTpCxJF8N8yin3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="22158214"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 15 Apr 2024 17:07:36 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwWMI-0004k0-0H;
	Tue, 16 Apr 2024 00:07:34 +0000
Date: Tue, 16 Apr 2024 08:06:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 5/5] fs/proc/task_mmu.c:872:43:
 warning: cast between incompatible function types from 'int (*)(struct
 seq_file *, void *)' to 'void (*)(struct seq_file *, struct vm_area_struct
 *)'
Message-ID: <202404160719.mid1Spn8-lkp@intel.com>
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
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240416/202404160719.mid1Spn8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404160719.mid1Spn8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404160719.mid1Spn8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/proc/task_mmu.c: In function 'show_smap':
>> fs/proc/task_mmu.c:872:43: warning: cast between incompatible function types from 'int (*)(struct seq_file *, void *)' to 'void (*)(struct seq_file *, struct vm_area_struct *)' [-Wcast-function-type]
     872 |         show_map_pad_vma(vma, pad_vma, m, (show_pad_vma_fn)show_smap);
         |                                           ^


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
