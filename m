Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D009523B61B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 17:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768672094; cv=none; b=bsaknTYEpkHR8mVSEunVaQzPhsGqD/k+jQrjmjyLDDLUKaXB0QS3HCVEvTbluD8Khq0Laepg7QHnxnlEiz2HW5/HYHOYnk0zuIiXl1VxcQmRbX1hSBJROwusm0Wk7R4Wkwtvk2R1Z4GgG93RY8bKo2W1zcXorF3uD5aA5gsPdHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768672094; c=relaxed/simple;
	bh=zRMnDmGHCuppV6i/YySFAMXy54j4BcEB078IhZ5cE2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hVTQIdjkMbUnT001vIJRkM48bltwJqtTajw1VMEcrK0JSz0FS4oKzA8wJbUjioWwLCH+BbVBDptpAsjiLFbLyT0AQMnaFUHUjiIxkT1uo9lgc6SQeQt2bEe/QQLXRLNJdgk3ajXANEQecQUl6v6itBfQQGAdRLOoiS+OgszgW1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RtmhOb8Q; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RtmhOb8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768672093; x=1800208093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zRMnDmGHCuppV6i/YySFAMXy54j4BcEB078IhZ5cE2M=;
  b=RtmhOb8QFSzmPEY58H6ryPn+EDsFTIhYZwZnXPE0lFl+4bjaBdfO5tec
   yPMf92R2+DnMU/V2iio1qYalTxY35KZCVSNGgh6E2p81+hm81txSwzkYL
   4JwNExsSXY6hyN1FksichNNpjB3Oh25ODGo6XfxMbgG9O3nKOKbxevFg7
   5teyV8OThrniu39C4tqfUqQBRQWlzPSRi76p/48VS5SSq0/75wY2amCmj
   wTShqYaRMvnE20k1IzGe4cIH9hiSl/iAaU5qtx1lv6RElJWLu3Q9YB1xz
   AZIgFu6ZTHAD8bWzvbGfDVw0BBcTlWZOQkMjAuTlD46st6+CZHlpqppHj
   g==;
X-CSE-ConnectionGUID: 9dlJstFTTvS3dTINvsLABA==
X-CSE-MsgGUID: amMTeRoHTw2JCQtsGQ6sXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="70118427"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="70118427"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 09:48:13 -0800
X-CSE-ConnectionGUID: EVLLMM8cQKm/peEq830ZlQ==
X-CSE-MsgGUID: QVonKlYxTUGa1hLKrxiahQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="205298418"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jan 2026 09:48:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhAP9-00000000M69-4Apg;
	Sat, 17 Jan 2026 17:48:07 +0000
Date: Sun, 18 Jan 2026 01:47:58 +0800
From: kernel test robot <lkp@intel.com>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?utf-8?Q?"Bj=C3=B6rn?= =?utf-8?Q?_T=C3=B6pel"?= <bjorn@rivosinc.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: arch/riscv/kernel/kexec_image.c:55:17: sparse: sparse: cast
 to restricted __le64
Message-ID: <202601180149.7a0ePZCr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d3eeb99bbc99cc5eb94a4a75ed4415a0272254ef
commit: 809a11eea8e8c80491e3ba3a286af25409c072d5 riscv: kexec_file: Support loading Image binary file
date:   8 months ago
config: riscv-randconfig-r111-20260117 (https://download.01.org/0day-ci/archive/20260118/202601180149.7a0ePZCr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601180149.7a0ePZCr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601180149.7a0ePZCr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> arch/riscv/kernel/kexec_image.c:55:17: sparse: sparse: cast to restricted __le64
   arch/riscv/kernel/kexec_image.c:72:22: sparse: sparse: cast to restricted __le64
   arch/riscv/kernel/kexec_image.c:73:26: sparse: sparse: cast to restricted __le64

vim +55 arch/riscv/kernel/kexec_image.c

    35	
    36	static void *image_load(struct kimage *image,
    37				char *kernel, unsigned long kernel_len,
    38				char *initrd, unsigned long initrd_len,
    39				char *cmdline, unsigned long cmdline_len)
    40	{
    41		struct riscv_image_header *h;
    42		u64 flags;
    43		bool be_image, be_kernel;
    44		struct kexec_buf kbuf;
    45		int ret;
    46	
    47		/* Check Image header */
    48		h = (struct riscv_image_header *)kernel;
    49		if (!h->image_size) {
    50			ret = -EINVAL;
    51			goto out;
    52		}
    53	
    54		/* Check endianness */
  > 55		flags = le64_to_cpu(h->flags);
    56		be_image = riscv_image_flag_field(flags, RISCV_IMAGE_FLAG_BE);
    57		be_kernel = IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
    58		if (be_image != be_kernel) {
    59			ret = -EINVAL;
    60			goto out;
    61		}
    62	
    63		/* Load the kernel image */
    64		kbuf.image = image;
    65		kbuf.buf_min = 0;
    66		kbuf.buf_max = ULONG_MAX;
    67		kbuf.top_down = false;
    68	
    69		kbuf.buffer = kernel;
    70		kbuf.bufsz = kernel_len;
    71		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
    72		kbuf.memsz = le64_to_cpu(h->image_size);
    73		kbuf.buf_align = le64_to_cpu(h->text_offset);
    74	
    75		ret = kexec_add_buffer(&kbuf);
    76		if (ret) {
    77			pr_err("Error add kernel image ret=%d\n", ret);
    78			goto out;
    79		}
    80	
    81		image->start = kbuf.mem;
    82	
    83		pr_info("Loaded kernel at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
    84			kbuf.mem, kbuf.bufsz, kbuf.memsz);
    85	
    86		ret = load_extra_segments(image, kbuf.mem, kbuf.memsz,
    87					  initrd, initrd_len, cmdline, cmdline_len);
    88	
    89	out:
    90		return ret ? ERR_PTR(ret) : NULL;
    91	}
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
