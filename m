Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F011B4132
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 12:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747224923; cv=none; b=ckvZbppGEW3WMbL7uA4plsGgZjRb38rDaZPwlFNYYqLHsk03u3BVPrR1rWUyFwcyi37XwFlEpCqt1Nss+EOvJLwRIf/snzvMzVv1qAHd4H1mtJjFaxATFlNE+v/c6kNtLHY+jdJ6r2kjqX+l17RDkw4DUWRowZoJ/JmJ/btxlkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747224923; c=relaxed/simple;
	bh=W8gg+Bf914kcZfBtRxYKvQhGnQY5EjjLRejkUaK3QLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fH1+IoFVJ1g2DvGSrFcKXw7s/Iba8zq49FsS3MvHuy7dhcqFuAZug2LG+hTsKauDz/FceFmjcrDVt/XA6+mZoB2dP1+6gmNqhEKQRgC0ERg5mq8atoVWS4qyKRaCalhNXDMw8d+mw/XhA5wFCzfOInfLJxhynZfZHUtQdrULqbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gp5LiRis; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gp5LiRis"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747224921; x=1778760921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W8gg+Bf914kcZfBtRxYKvQhGnQY5EjjLRejkUaK3QLk=;
  b=gp5LiRisSz986xce08oWFirT1Sdbw45/E/Hk7Qu0ms0tj6PAZsWITd9U
   CTsWfNaQFReuWU89Ig1v/q7DLI4EoQuCLRmbq+jJFmyJAZPerRbe4aBW8
   ZOrF9cFSQSoVDoFmd7NTFIfG4xg5DO+VV68oKE4wPu3Gd2tENCOHe3K8I
   czxsHbmEPXvHc/QEs1l9rE4vasBpz7YzqY2Bfa2RlDgdkqSnV03uX5IOK
   Zofu+gidk8qqJexvMEKfz97Tg5rCrfA04RP7Uel00FO+x3wVjMES+Fwl+
   4UIfY/t87cW/8LZMHG5zAjktNl9x/DWd5I7RnYTxhjYBKMxqiq3M+jPnA
   Q==;
X-CSE-ConnectionGUID: 4wShd4K4Shq5FyPPzcIYJA==
X-CSE-MsgGUID: DTiNu35hTuaxeNvzs27DbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="52789776"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="52789776"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 05:15:20 -0700
X-CSE-ConnectionGUID: IO7MgHFWQHCgDUR4qlWGpw==
X-CSE-MsgGUID: TdlaqzPxSJykWy3c3N99Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="142898328"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 May 2025 05:15:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFB13-000H5R-1r;
	Wed, 14 May 2025 12:15:17 +0000
Date: Wed, 14 May 2025 20:14:36 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexghiti:alex-for-next 13/36]
 arch/riscv/kernel/kexec_image.c:55:17: sparse: sparse: cast to restricted
 __le64
Message-ID: <202505142049.MNXy8C5L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux.git alex-for-next
head:   135452d0c6114619fb954eaf9496210b5be0701d
commit: 1d57a3df656fca753d224b0ac803666842fb8f18 [13/36] riscv: kexec_file: Support loading Image binary file
config: riscv-randconfig-r111-20250514 (https://download.01.org/0day-ci/archive/20250514/202505142049.MNXy8C5L-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250514/202505142049.MNXy8C5L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505142049.MNXy8C5L-lkp@intel.com/

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
