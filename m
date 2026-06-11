Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DCC38D402
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 22:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781215557; cv=none; b=qWjBVs23MRowlSrguh1FHFFpao4olkjhkEGI89hLxl9TpPAv/oLNM5Rjtslj06AzWxk6xOsvc8frhpoTeL0ogUKY+foAPr/rre4b1816dcb1huhklpQr9sZFKYBtoqcvXM+Trw6Qg2Za8I2AO07r4sG/bMVyUKT7KbNuqjOdLTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781215557; c=relaxed/simple;
	bh=fu6gbNLNE2PnwRFLDHClv4xRNq24PBQG4H60w7py9OY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VWJBRi/6745dnqcSZo8sGiu/62PSWxscu3b9m5+xakBVSsskon7x9fi3z5OAYqEsVfJviUPnbnRGrKlw5iGfoxLdFgIaJiTpPgMBCJU1eX/iON7xV8nyQZx6STqg/mXTRB2/nbIpgMAdjiLaP88pAJeuVNGsMT2zgGgy4f8NkjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xi0tmB3u; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xi0tmB3u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781215553; x=1812751553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fu6gbNLNE2PnwRFLDHClv4xRNq24PBQG4H60w7py9OY=;
  b=Xi0tmB3uZad/5GVfNqNdU9p2hJx4RUqwla5UKrvi0mvEDLHGBR8E98nw
   PlYt7am1V0P1eOAZMYYMh/r32wqhD2DhVhHZaTYl8C5F6/FAeuysx6q2G
   mgKgEjJMRIA3h3NPtKhZlF+LBhx8T45seE4H1Rl7TCF9D6+Or/bhKxjxw
   xLP/b+TWM9HInk378tav7LyMOjNuiZm7HpkkIRg1RRB16ZYirkk4J+9j3
   HbfgkVBZ87tUyEzq67x/Fy331ex+TDXAgKc9pHfcjeQpL8dLLrxAolgmD
   Y8BfM17JKq9kQKGVx1bQUQZ5EfTANxTTBKlzZZRZLjXH9i9dhrwlegLui
   g==;
X-CSE-ConnectionGUID: DpPEGVTZQ8Kx9LCtr3JrMA==
X-CSE-MsgGUID: 0b58x7d8Rw6VJlYKC0Yizw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81178283"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="81178283"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 15:05:52 -0700
X-CSE-ConnectionGUID: YC5iB+peRrO9NKERLED/9A==
X-CSE-MsgGUID: k2WSXSt9S6Kn7DvJ4es9nQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jun 2026 15:05:50 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXnX1-00000000Nux-2TeL;
	Thu, 11 Jun 2026 22:05:47 +0000
Date: Fri, 12 Jun 2026 06:05:04 +0800
From: kernel test robot <lkp@intel.com>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?utf-8?Q?"Bj=C3=B6rn?= =?utf-8?Q?_T=C3=B6pel"?= <bjorn@rivosinc.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: arch/riscv/kernel/kexec_image.c:55:17: sparse: sparse: cast
 to restricted __le64
Message-ID: <202606120608.xftxlgJl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: 809a11eea8e8c80491e3ba3a286af25409c072d5 riscv: kexec_file: Support loading Image binary file
date:   1 year ago
config: riscv-randconfig-r132-20260611 (https://download.01.org/0day-ci/archive/20260612/202606120608.xftxlgJl-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120608.xftxlgJl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 809a11eea8e8 ("riscv: kexec_file: Support loading Image binary file")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120608.xftxlgJl-lkp@intel.com/

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
