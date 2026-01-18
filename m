Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F0474BE1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 05:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768713131; cv=none; b=WK2PxEwicY55TJRHOiMDwzNcDsPAmv8fWukCOlla8CY6Ym6vViLyAKJOJQGbEuQ15N3wwr32pD54pRmJhBgGhiNJ6EE/h6E42HLUoNIrJCTxADvNBG/I9iSnoMMi5grbfheQJL36Hhg5rmQZ6ayHeTa/pxIGAx+vo/noMjMuMK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768713131; c=relaxed/simple;
	bh=5rg+PZlpX/AmbAcM/W3rLkstUc98vQwI02ZxRKXbWkg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T2vKj22dmJBrr/9nezpi4YPM0SSk06kIVjYjvzTSRWj0Gde1aoHLQJQ7NHZebbp/nxYB3+VHZ07ZmVHtkJOPgShOB/3uaxdI9On/whKvryl4QyBgydOsRk217JvZXMhMqd2+YpS56i6CaJBL0f/ALxJlC9NuDYCLyCZau3bksPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IAxMxLYy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IAxMxLYy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768713128; x=1800249128;
  h=date:from:to:cc:subject:message-id;
  bh=5rg+PZlpX/AmbAcM/W3rLkstUc98vQwI02ZxRKXbWkg=;
  b=IAxMxLYy5aPxpliZToGJZIQtEYHQPlfa2tYS26Mdi8F9/FvQbObjFLTN
   jKFS9oPPky/LTugkyzYE2FefalvH24ISkHrr2K8bIXE0iD9J5q+5oHWWW
   9v+Is5kE69/vYidE2EPHBMjQwwMnZSNP0PpN7Jt+fqp9Fkoj5CXGe4L3L
   A2E6N3zVt0xpbr/cY7JUItbymq7Y9khYKJC7oXHyj8V6Ru/Lk9LhdAHtX
   GNcFyj88/cGKElPJaiLcaXchdg2td3LUgtdkdTYfZ/bDwig9gJbEcwq/6
   8JrfOXQonyl6QO2TNyOs+6sp2kSu4eyA0Rv6o/V4OEoVFt+FkRImBHYV2
   g==;
X-CSE-ConnectionGUID: EOJ8LhDgTOq9MbvgOt8qZw==
X-CSE-MsgGUID: /FGAeUDLTECMkIVeoUU6Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="95440687"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="95440687"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 21:12:07 -0800
X-CSE-ConnectionGUID: oE0GX65KQK+yj1lw9VcUQg==
X-CSE-MsgGUID: 2mfC/hAcS++Hu8WVV2W4GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="209713344"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jan 2026 21:12:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhL50-00000000MgA-0eSx;
	Sun, 18 Jan 2026 05:12:02 +0000
Date: Sun, 18 Jan 2026 13:11:04 +0800
From: kernel test robot <lkp@intel.com>
To: Youling Tang <tangyouling@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>
Subject: arch/loongarch/kernel/kexec_efi.c:64:22: sparse: sparse:
 cast to restricted __le64
Message-ID: <202601181333.zqNzFF6o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e84d960149e71e8d5e4db69775ce31305898ed0c
commit: 55d990f0084c2b8ab9321dc59fc11dce855b4d61 LoongArch: Add EFI binary support for kexec_file
date:   4 months ago
config: loongarch-randconfig-r122-20260118 (https://download.01.org/0day-ci/archive/20260118/202601181333.zqNzFF6o-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601181333.zqNzFF6o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601181333.zqNzFF6o-lkp@intel.com/

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
