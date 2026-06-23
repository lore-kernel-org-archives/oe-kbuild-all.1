Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EEF3D6465
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 14:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226511; cv=none; b=Z1Nj/dZr2jLlxCnP9o65/hq9pkOLtzNolp9hvye7PPFUWynJJC3YKEJCD7alG4ULgDpYRssrh0gaZyoHO7dncTHoI+SR2A6jluaFe91A87TrrEBvDwBVkTBE+iTYbJFiHn/TezJY4PjutOIgFxU92hbMUu/ULf9LhNjUYxpKKVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226511; c=relaxed/simple;
	bh=rqUXJYB/augbvPfPqaZDJDDrDnxbza2FTrZKSRyUADk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DkC0yUiJNSle3TU5x5mqe4lk802y0uM02pm+GwHRPHnem96QSqUwA0aESH5L+fMi0H7Q00AQnf6mbKAcOoOuwrU0D4F43Nkis+Lv6JnM6WN0EwOgfB89UsxDfFhbgictWjeQal9pyyneuEMZ2yT6+6ikIlr3ZKIToMiBYkDWWtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WLgww4v3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLgww4v3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782226510; x=1813762510;
  h=date:from:to:cc:subject:message-id;
  bh=rqUXJYB/augbvPfPqaZDJDDrDnxbza2FTrZKSRyUADk=;
  b=WLgww4v3tcNAnKS/knC5Ihadmcx+YdM/sLZJwPDTa40snyX2IlKu2S4Y
   t12V2ikWb2AfIy51kXPILDf/BzZ9p9sUnQHpuTqXu1ouQfzr5oXTad25H
   NE/rgeIa8xa6lSBg8rsKJWZuMmKaRqgXKOnzrkZ65xdLqDQuwToagGK7P
   lDeLtX1RWxMBlbNI18l7LdcZPNYLIMZmiup0UKAJF2FBdvkAZB6/u7mMg
   U1vaeFNWmc4JiTqZxIZzAapFQmdGhwh6SWZIOwHb3jaBPZBfhKvMq3HOU
   iqAOh45cLACDJJtMrpniOGIOnWOZqBPWuMPsrhA6Hls8EkYAU0/PzQk21
   A==;
X-CSE-ConnectionGUID: eoleI6oJQiSg597Krw28rg==
X-CSE-MsgGUID: DCsEWwkGSh24YEtxINwN3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83012554"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="83012554"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 07:55:10 -0700
X-CSE-ConnectionGUID: D/JMbvSZQmGHWjEUWo+LMg==
X-CSE-MsgGUID: fAohbtw9QBqoPvwSZZD2Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="249645517"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 Jun 2026 07:55:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wc2WC-000000002cN-1f5E;
	Tue, 23 Jun 2026 14:54:28 +0000
Date: Tue, 23 Jun 2026 22:53:56 +0800
From: kernel test robot <lkp@intel.com>
To: Youling Tang <tangyouling@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>
Subject: arch/loongarch/kernel/kexec_efi.c:64:22: sparse: sparse:
 cast to restricted __le64
Message-ID: <202606232219.vRSfyMAa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   502d801f0ab03e4f32f9a33d203154ce84887921
commit: 55d990f0084c2b8ab9321dc59fc11dce855b4d61 LoongArch: Add EFI binary support for kexec_file
date:   9 months ago
config: loongarch-randconfig-r112-20260623 (https://download.01.org/0day-ci/archive/20260623/202606232219.vRSfyMAa-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606232219.vRSfyMAa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 55d990f0084c ("LoongArch: Add EFI binary support for kexec_file")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606232219.vRSfyMAa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/kexec_efi.c:64:22: sparse: sparse: cast to restricted __le64
   arch/loongarch/kernel/kexec_efi.c:65:23: sparse: sparse: cast to restricted __le64

vim +64 arch/loongarch/kernel/kexec_efi.c

    37	
    38	static void *efi_kexec_load(struct kimage *image,
    39					char *kernel, unsigned long kernel_len,
    40					char *initrd, unsigned long initrd_len,
    41					char *cmdline, unsigned long cmdline_len)
    42	{
    43		int ret;
    44		unsigned long text_offset, kernel_segment_number;
    45		struct kexec_buf kbuf;
    46		struct kexec_segment *kernel_segment;
    47		struct loongarch_image_header *h;
    48	
    49		h = (struct loongarch_image_header *)kernel;
    50		if (!h->kernel_asize)
    51			return ERR_PTR(-EINVAL);
    52	
    53		/*
    54		 * Load the kernel
    55		 * FIXME: Non-relocatable kernel rejected for kexec_file (require CONFIG_RELOCATABLE)
    56		 */
    57		kbuf.image = image;
    58		kbuf.buf_max = ULONG_MAX;
    59		kbuf.top_down = false;
    60	
    61		kbuf.buffer = kernel;
    62		kbuf.bufsz = kernel_len;
    63		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
  > 64		kbuf.memsz = le64_to_cpu(h->kernel_asize);
    65		text_offset = le64_to_cpu(h->text_offset);
    66		kbuf.buf_min = text_offset;
    67		kbuf.buf_align = SZ_2M;
    68	
    69		kernel_segment_number = image->nr_segments;
    70	
    71		/*
    72		 * The location of the kernel segment may make it impossible to
    73		 * satisfy the other segment requirements, so we try repeatedly
    74		 * to find a location that will work.
    75		 */
    76		while ((ret = kexec_add_buffer(&kbuf)) == 0) {
    77			/* Try to load additional data */
    78			kernel_segment = &image->segment[kernel_segment_number];
    79			ret = load_other_segments(image, kernel_segment->mem,
    80						  kernel_segment->memsz, initrd,
    81						  initrd_len, cmdline, cmdline_len);
    82			if (!ret)
    83				break;
    84	
    85			/*
    86			 * We couldn't find space for the other segments; erase the
    87			 * kernel segment and try the next available hole.
    88			 */
    89			image->nr_segments -= 1;
    90			kbuf.buf_min = kernel_segment->mem + kernel_segment->memsz;
    91			kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
    92		}
    93	
    94		if (ret < 0) {
    95			pr_err("Could not find any suitable kernel location!");
    96			return ERR_PTR(ret);
    97		}
    98	
    99		kernel_segment = &image->segment[kernel_segment_number];
   100	
   101		/* Make sure the second kernel jumps to the correct "kernel_entry" */
   102		image->start = kernel_segment->mem + h->kernel_entry - text_offset;
   103	
   104		kexec_dprintk("Loaded kernel at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
   105			      kernel_segment->mem, kbuf.bufsz, kernel_segment->memsz);
   106	
   107		return NULL;
   108	}
   109	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
