Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D76030FC04
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 17:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765820290; cv=none; b=mEj68taUJbUwKgmFn6RH3l03hWItmdrLJJKIkGTjQ0DV+QFPDS1gM46yX7+rQqg1ZzTdYJpTj2zMWcJSsByNc6K+tpHFp9Decw18pVWJWR5QB8f7Q85jdgpxHaI+e33lX+eFiwaVRseoIi5Ct2GN+AyffRCrUTCE5w6IIImjvcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765820290; c=relaxed/simple;
	bh=7be2Pgd0nq8JZeFfaEnms33OjXDp/YimbN3ZCwHlZxk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mIQKfO3tOVk8lLpXwYbjL3mtjMJ69RR0ytiP2vrXPuRCkMSx6Dv4AzTe1zVyyOpoqsBWwQZS/T+Qq1TyNmIl2LYBWr1D0LADSwpTE2ewpwSlUHGSifOil0o7v5yHToqjr1XuwX/mfkRPIfY4wFppP409g2jH+puOaRj9ERCir04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUcSMLcu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUcSMLcu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765820288; x=1797356288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7be2Pgd0nq8JZeFfaEnms33OjXDp/YimbN3ZCwHlZxk=;
  b=iUcSMLcu3nXY23jWuc6kdQjrwrHliyu4UmntdLrMkmk1/zUBN71zMYbi
   VBuno0QCQXYpSnJ49JHXuzSYEpCi26zZe0P0eFTvJbEVnrRpqmRlrpDxk
   xYf6VjQzu/B5a3eSa1KFBGESCn3c1cKJRWRDC6ZbR4WXrF/jD464V3AfB
   4iX4q/RX6wRDBxXXFTO2ysBwjdMEo8Yg7v6hWedPhcT5tihmugFuZjeb1
   cvlJbIn3seibdK7ZVWKghdOry8uz5MePD+dsU3Snaj7abfN7UJ7W1joS+
   vDaJeaN+mwiH9XdPtjdH/l199QBT0K0pZGVfPIT3Hj7uiLICCkqxyA7Dn
   w==;
X-CSE-ConnectionGUID: vUijJhmZQHeCK1AEwwxoUg==
X-CSE-MsgGUID: uCNNmB88RrmkXEudf6Agsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67798596"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="67798596"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 09:38:06 -0800
X-CSE-ConnectionGUID: riguKn0aSAS7o8iBaoeUQw==
X-CSE-MsgGUID: wQGJq/GjRqSHIpoSBdhlxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197679288"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 15 Dec 2025 09:38:05 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVCWI-000000000Z3-2Hlv;
	Mon, 15 Dec 2025 17:38:02 +0000
Date: Tue, 16 Dec 2025 01:37:25 +0800
From: kernel test robot <lkp@intel.com>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: arch/riscv/kernel/kexec_image.c:55:17: sparse: sparse: cast to
 restricted __le64
Message-ID: <202512160142.4NPjO76q-lkp@intel.com>
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
commit: 809a11eea8e8c80491e3ba3a286af25409c072d5 riscv: kexec_file: Support loading Image binary file
date:   6 months ago
config: riscv-randconfig-r111-20251215 (https://download.01.org/0day-ci/archive/20251216/202512160142.4NPjO76q-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160142.4NPjO76q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512160142.4NPjO76q-lkp@intel.com/

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
