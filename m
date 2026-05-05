Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C372D061D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 09:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777975129; cv=none; b=iEeyxaW61snPJf3Nz+mq2Fmpy7Oxn5+np8OlZSFbef98dmQ8m2zQJp3oqtHpNTjF+vzlcVvvfPBU1vUxG7cuq5a6qms+R9mBGYzSKclNFUMMH2AvHhrshQ+8sKZ/n71MrPfUYLaskxdWsGnvUmaMGyEwZwubbKm8TS2TsaLlsmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777975129; c=relaxed/simple;
	bh=QRZv954mBw3Ha2Q048/MIQaSLvKZ6ZXzeBK18PjwiFs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SOM80mQuxJCw0oDMuHKMg/sfcxUR0gz998EdbsHoHmHBmUJMZs3dxzHPzdjUPLeggIqaYehgs3l0JlpbkQrsfUV1W2OkGIgHt8GXQz8cE8R/iHsHReturwbFk522zRW8KN5KVnrG93AYcYuputVjCbb2E2MGrgoEVPd12hA2RUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aYoUTyCG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aYoUTyCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777975128; x=1809511128;
  h=date:from:to:cc:subject:message-id;
  bh=QRZv954mBw3Ha2Q048/MIQaSLvKZ6ZXzeBK18PjwiFs=;
  b=aYoUTyCGvXJERIk2yvr22Km8TEchTJb3Y+2+JxqcBUsvkE7WP+Qyxb8H
   NZTYbB28rql4zS2Q8ONTdg0p807/sSnsrneJhdRflsV4iijgdrIZsPE6D
   mGFdhWsozEsxe/NzxIE64555ferOoVg0XYv0jbW+CUqrPn3wyrxrTZX4f
   AKgnahJTbV5QbkZCLGAzDb6EgD7ES3T1Pua8Xz45P1ZvW+qgIF3c8EqSb
   Yz6629mZ0IdmHi0I2WdE4fQ+HzZM7/oS91be6t8YYpiQ+urmExwOX5Ibi
   0ctF4pOwU4zeELPNYe60kq5C73iYZwEmhNeVzSiAo9zFa3pSzNz3wmEzV
   A==;
X-CSE-ConnectionGUID: tJNUrgSzRGS2870WBtAklg==
X-CSE-MsgGUID: p+mShSy/RPa82VGQFm5cAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78939964"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="78939964"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 02:58:47 -0700
X-CSE-ConnectionGUID: Yx9A7vclSSixqUG/EPvRHw==
X-CSE-MsgGUID: x3Tf8jhHR5eFlLcea69p8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="259122214"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 May 2026 02:58:45 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKCY6-0000000003X-237j;
	Tue, 05 May 2026 09:58:42 +0000
Date: Tue, 05 May 2026 17:58:06 +0800
From: kernel test robot <lkp@intel.com>
To: Youling Tang <tangyouling@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>
Subject: arch/loongarch/kernel/kexec_efi.c:64:22: sparse: sparse:
 cast to restricted __le64
Message-ID: <202605051728.xa3HaqRv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a293ec25d59dd96309058c70df5a4dd0f889a1e4
commit: 55d990f0084c2b8ab9321dc59fc11dce855b4d61 LoongArch: Add EFI binary support for kexec_file
date:   7 months ago
config: loongarch-randconfig-r122-20260505 (https://download.01.org/0day-ci/archive/20260505/202605051728.xa3HaqRv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605051728.xa3HaqRv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 55d990f0084c ("LoongArch: Add EFI binary support for kexec_file")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605051728.xa3HaqRv-lkp@intel.com/

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
