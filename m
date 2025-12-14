Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A90C72627
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 06:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765693850; cv=none; b=LMRWwe7MOOrTC+jumfZehmEIONW6xzkbU/8c/xNG/QRSWNb38t1tZf2ScaGH3XU7eCLHkCf6EEcS2DQt+RZpbRNQtAXLdOtLexujAajExKn/B40/B0hQP2ezHETNqpC0/W44GEKbXJRE6yagwa/xuySZFeAkeKoDnI8EygpPj1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765693850; c=relaxed/simple;
	bh=uxii76RbyIKXktHIGzfZYCuppSqau80JWKaQIWI9bEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IdWk2ytSNfASjf0KOkiyHM82QAUJsxotwAma86bEzn+Ms9xlJMYKqsiyhMye52iyrbXeBUgo0YhoWjNMwch8RY7lj0Is5JoIBLF0ovCfeVQeXiTa5CM6napO6NkCQ7SdPboGM4O26+j6wNCEqz2VCbJVTOU/lK5kBGZRtAXkLNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rb+faAWq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rb+faAWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765693849; x=1797229849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uxii76RbyIKXktHIGzfZYCuppSqau80JWKaQIWI9bEA=;
  b=Rb+faAWqIz453GXNcKSK7RgtNe/+y4A3p+G+XeOvv8WfZkb8jCE4XqVB
   z92bDXjSds/AzENsonZgKJfIBQ/1ZjDr7dFtcDl/sf1uQsnWurd/cZ2hL
   rTQ1pjGDwMh0c/IJBoNkcvuwiqAGJbgy05dDCkkyXU/sv6w4c/CFSZk/R
   MT1tf/AVonQjjNPjRWoiIuv0MYpz0AhA2S5wfZWSSMYeoODtjdS5R1el7
   gpmQcxTSfLX7MZUSDCPoyFKX3phjs2kJYrN0SkeiTqVtLkKxfnyyLR8p7
   gQY0AeaDNVDcTOf3BNDDEgmsDIrqxW1lbSseTTy8kzpr38JbPeCYdh3hD
   Q==;
X-CSE-ConnectionGUID: 2pYXZpC1QJaprw4Vx/YABw==
X-CSE-MsgGUID: HgAugsj8TkeEt1AIsPG/Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67790834"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67790834"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 22:30:49 -0800
X-CSE-ConnectionGUID: SorT45cNT2uMUXb31MYFeg==
X-CSE-MsgGUID: m2g+mp5oRa2XxYYqB+Tujg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197727147"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Dec 2025 22:30:46 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUfcy-000000008g8-03gN;
	Sun, 14 Dec 2025 06:30:44 +0000
Date: Sun, 14 Dec 2025 14:30:07 +0800
From: kernel test robot <lkp@intel.com>
To: Youling Tang <tangyouling@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: arch/loongarch/kernel/kexec_efi.c:64:22: sparse: sparse: cast to
 restricted __le64
Message-ID: <202512141450.vbW57SvC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 55d990f0084c2b8ab9321dc59fc11dce855b4d61 LoongArch: Add EFI binary support for kexec_file
date:   2 months ago
config: loongarch-randconfig-r134-20251214 (https://download.01.org/0day-ci/archive/20251214/202512141450.vbW57SvC-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141450.vbW57SvC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141450.vbW57SvC-lkp@intel.com/

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
