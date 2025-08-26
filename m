Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFE02DC35F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Aug 2025 17:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756228031; cv=none; b=P0nn8idMzSqhFqKPVNvn/xd6dypjcX9QLC75KkOE2E039ijnxX0F9UMQuQHdUG8fGGxrrL7rWETqz4DdpIGmVcO2TQYzp9l1ULhJ6WiBcqbNnYNkTkV3sfHt71UGhIpyRNoxuHmUfX7BD8xr12XktCnRN+rpOaGUcGvlQN4R6TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756228031; c=relaxed/simple;
	bh=Xim6uq+1U5KRge/G8NjQ7QH9Y4Ln6m7wN1iOQxDfl44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cWb65SJlCOp7fAsfb4lRD4Y9Hbm5gASajjAt+hB8ir/LcKJZ10TwJNYuf+viiYZmyVTUO1W1Fh4saeWDGZbBO+KSLxiQRGzH7vJeRewiRn0ox1mxxZf8LLYW9BaAskpfN41r98HiM6lur1M3w4STRZUJbEYAQkm7Tc63GlDoDTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jw8q9ZKn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jw8q9ZKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756228030; x=1787764030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xim6uq+1U5KRge/G8NjQ7QH9Y4Ln6m7wN1iOQxDfl44=;
  b=jw8q9ZKnuBusXNBFBX8FDndrcoqe4/1BnY1EYJ1BEIxfwvHuuPwpx4sA
   PEP0xGaNRY4kLT1aZNl9RS5iDxbC1TwjuEJUEOiYEqNIB0dgn5yurwhSo
   IRE1t4O/YzZY1RiviKKFqdeLTm11DxQ5PBb/oxQ/tlf1i3wqv1ySZqFud
   5r5QcBktJXepDDE3rqZYcWxlEfuEVtr3eBvhNB2kazdCuFgrSQ10E6TbY
   WzvCpfevI0VqmJ+PzwBoBQQqQ6qD/Z6WLApBqaRftly/SOuyKSzvDKASa
   CWEJDb1BvxatTgL+oehMJMfx/3M/HtJjNHZ3fbHWIPK+GpJTNfdqAtbHZ
   w==;
X-CSE-ConnectionGUID: i+tKceXmR6CFCLB0BcpwTQ==
X-CSE-MsgGUID: LpfOD4s7ShiP4rzmnzhBlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62307066"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62307066"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 10:07:10 -0700
X-CSE-ConnectionGUID: rSUJ+LV/RFOGFzOpJACbOQ==
X-CSE-MsgGUID: yAa0CKbXRqy/yTvxK6l9gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="174931831"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 26 Aug 2025 10:07:07 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqx8R-000SFH-2I;
	Tue, 26 Aug 2025 17:07:05 +0000
Date: Wed, 27 Aug 2025 01:06:09 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 23/220] arch/arm64/kernel/kexec_image.c:79:6:
 error: 'struct kexec_buf' has no member named 'random'
Message-ID: <202508270141.fyzLcWqi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   f279bb633c0aace9bb737f2cfcd7e91deef13356
commit: d2567dc490b0051381940a31f95c98d76ea0e5c1 [23/220] kexec/arm64: initialize the random field of kbuf to zero in the image loader
config: arm64-randconfig-004-20250826 (https://download.01.org/0day-ci/archive/20250827/202508270141.fyzLcWqi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508270141.fyzLcWqi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508270141.fyzLcWqi-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/kexec_image.c: In function 'image_load':
>> arch/arm64/kernel/kexec_image.c:79:6: error: 'struct kexec_buf' has no member named 'random'
     kbuf.random = 0;
         ^


vim +79 arch/arm64/kernel/kexec_image.c

    35	
    36	static void *image_load(struct kimage *image,
    37					char *kernel, unsigned long kernel_len,
    38					char *initrd, unsigned long initrd_len,
    39					char *cmdline, unsigned long cmdline_len)
    40	{
    41		struct arm64_image_header *h;
    42		u64 flags, value;
    43		bool be_image, be_kernel;
    44		struct kexec_buf kbuf;
    45		unsigned long text_offset, kernel_segment_number;
    46		struct kexec_segment *kernel_segment;
    47		int ret;
    48	
    49		/*
    50		 * We require a kernel with an unambiguous Image header. Per
    51		 * Documentation/arch/arm64/booting.rst, this is the case when image_size
    52		 * is non-zero (practically speaking, since v3.17).
    53		 */
    54		h = (struct arm64_image_header *)kernel;
    55		if (!h->image_size)
    56			return ERR_PTR(-EINVAL);
    57	
    58		/* Check cpu features */
    59		flags = le64_to_cpu(h->flags);
    60		be_image = arm64_image_flag_field(flags, ARM64_IMAGE_FLAG_BE);
    61		be_kernel = IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
    62		if ((be_image != be_kernel) && !system_supports_mixed_endian())
    63			return ERR_PTR(-EINVAL);
    64	
    65		value = arm64_image_flag_field(flags, ARM64_IMAGE_FLAG_PAGE_SIZE);
    66		if (((value == ARM64_IMAGE_FLAG_PAGE_SIZE_4K) &&
    67				!system_supports_4kb_granule()) ||
    68		    ((value == ARM64_IMAGE_FLAG_PAGE_SIZE_64K) &&
    69				!system_supports_64kb_granule()) ||
    70		    ((value == ARM64_IMAGE_FLAG_PAGE_SIZE_16K) &&
    71				!system_supports_16kb_granule()))
    72			return ERR_PTR(-EINVAL);
    73	
    74		/* Load the kernel */
    75		kbuf.image = image;
    76		kbuf.buf_min = 0;
    77		kbuf.buf_max = ULONG_MAX;
    78		kbuf.top_down = false;
  > 79		kbuf.random = 0;
    80	
    81		kbuf.buffer = kernel;
    82		kbuf.bufsz = kernel_len;
    83		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
    84		kbuf.memsz = le64_to_cpu(h->image_size);
    85		text_offset = le64_to_cpu(h->text_offset);
    86		kbuf.buf_align = MIN_KIMG_ALIGN;
    87	
    88		/* Adjust kernel segment with TEXT_OFFSET */
    89		kbuf.memsz += text_offset;
    90	
    91		kernel_segment_number = image->nr_segments;
    92	
    93		/*
    94		 * The location of the kernel segment may make it impossible to satisfy
    95		 * the other segment requirements, so we try repeatedly to find a
    96		 * location that will work.
    97		 */
    98		while ((ret = kexec_add_buffer(&kbuf)) == 0) {
    99			/* Try to load additional data */
   100			kernel_segment = &image->segment[kernel_segment_number];
   101			ret = load_other_segments(image, kernel_segment->mem,
   102						  kernel_segment->memsz, initrd,
   103						  initrd_len, cmdline);
   104			if (!ret)
   105				break;
   106	
   107			/*
   108			 * We couldn't find space for the other segments; erase the
   109			 * kernel segment and try the next available hole.
   110			 */
   111			image->nr_segments -= 1;
   112			kbuf.buf_min = kernel_segment->mem + kernel_segment->memsz;
   113			kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
   114		}
   115	
   116		if (ret) {
   117			pr_err("Could not find any suitable kernel location!");
   118			return ERR_PTR(ret);
   119		}
   120	
   121		kernel_segment = &image->segment[kernel_segment_number];
   122		kernel_segment->mem += text_offset;
   123		kernel_segment->memsz -= text_offset;
   124		image->start = kernel_segment->mem;
   125	
   126		kexec_dprintk("Loaded kernel at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
   127			      kernel_segment->mem, kbuf.bufsz,
   128			      kernel_segment->memsz);
   129	
   130		return NULL;
   131	}
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
