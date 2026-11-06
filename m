Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991022;
	b=VJYd7bHkvEh7aNIWdX3YqmVMy7QsSNfLOeIDTqL5AdOJ16guaRiRItiTJSK+TrpQ0baT
	 nQXitD8wlw+tUqqn+n7EIS1mJXDhaCHP2sttQuLgx24KcpcGSVcp8udN6AC8Q1nXuG2S9
	 /CCoZZP6F+/R2DLwqIfcGrzHx46RjOe+vhPJPifbr1sZRxTKloYidxM+g1aXsIRr3Ft71
	 uPQNj3QZUkMRbT8kgRdqXPkQ87cVOetUliW0/Cm7K/RTrwEYHThl271IyhWSyJJSa5BDY
	 7lKpmvx+3tUUyLzcZHdIn+uQzyLiq7nV0FVbIPwI15MMSCHlri+cODUSrAH7qpmtEAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991022;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=qzehR+mAXD7hqA3PkbJSkIi/YhFouFiAGPXWub87H1U=;
	b=C/LvTr0jmCP0hxJWhwACqU+eqkwf8+uP6W+5chjvMoR+v/11My11ERgTZ8RfS0JRgJER
	 HeKlWd3EcxBBQQ22IWjzNLZWgc9ydEqa6D7sH/1xTMAyAIPEsiwxcIDbihbnP30dLmB6q
	 dXydXrq/y+8mv7Yj7QOYn4ZtEWaBIIVykginWyzRszkd6C8k1LV2Yn051wRCeKC3PPAjQ
	 wZ1FNLmDwYAe/ofDpdzN6b5701gSMLpjgDGtMrwHTot5h6CNAP1dfhjmcLxywmvnleLnj
	 WGahSDzDL9wbyPUZ7bdF0d44cjGYJxRe5OWfHbb51LpuyRaXEPLwHh/DKfFXhX6bNhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TRf6gyYB;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF369606A326
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 18:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF369606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TRf6gyYB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793991021; x=1825527021;
  h=date:from:to:cc:subject:message-id;
  bh=5QRGVGiouzmD2JRcq9wyOM4BO+p5hlm6Nq1MvMyYvck=;
  b=TRf6gyYBAme+1L92+bWG7tawJ3lmUFjVK+FlrhAfkSWln+eP/zgfRqeV
   BkzrfVQX+E86d9Qku1fNovhAajEtfoz3gYG5b8AimftpdyIIXEfnrLGNP
   bqZoX/VLLjUyUbAnTTSNX+wximbLHL+V/m4RMKaHJ8Qxeq7MFeQNYhzpo
   GxubW0DooxyZ8tgXiLQjwidiBJM1XBg0lJB+lG5F6SwU22zD59ej0hjTL
   NjBXSoKLYQ018jLMUqxUIRdJRmUuArxLjr+d+u2kx8AjPyI32mSHYn0UV
   xV2lvAYI/nR7QEW4/Fub6Psl2evN9oODyrAieQUSXi0Q/ed3M97X6bqGU
   g==;
X-CSE-ConnectionGUID: GUDDXPg4QRuId+7W1Y+4Qw==
X-CSE-MsgGUID: gETFMqGdRpWb62iJ77nBVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2710869"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2710869"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 10:50:20 -0800
X-CSE-ConnectionGUID: t2tiqV3CQ36YxecGld6d5w==
X-CSE-MsgGUID: gVBKvs7AQnymPend81y9hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7210176"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 06 Nov 2026 10:50:19 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPP0y-00000000AKp-2k57;
	Fri, 06 Nov 2026 18:50:16 +0000
Date: Fri, 06 Nov 2026 19:49:56 +0100
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:efi-image-info 4/5]
 drivers/firmware/efi/libstub/arm64.c:143:43: sparse: sparse: restricted
 __le32 degrades to integer
Message-ID: <202611061921.kd5SOdmJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-image-info
head:   8c7de009299435f0fd9d77e1b31c7b25db4727f3
commit: d0bb1aa57517bc3e96a3f8cce8bef4f42aa3b9a4 [4/5] efi/arm64: Expose struct efi_image_info via the image header
config: arm64-randconfig-r2310-20261106 (https://download.01.org/0day-ci/archive/20261106/202611061921.kd5SOdmJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611061921.kd5SOdmJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611061921.kd5SOdmJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/firmware/efi/libstub/arm64.c:91:12: sparse: sparse: symbol 'code_size' was not declared. Should it be static?
>> drivers/firmware/efi/libstub/arm64.c:143:43: sparse: sparse: restricted __le32 degrades to integer

vim +143 drivers/firmware/efi/libstub/arm64.c

    90	
  > 91	u32 __weak code_size;
    92	
    93	void efi_cache_sync_image(unsigned long image_base,
    94				  unsigned long alloc_size)
    95	{
    96		u32 ctr = read_cpuid_effective_cachetype();
    97		u64 lsize = 4 << cpuid_feature_extract_unsigned_field(ctr,
    98							CTR_EL0_DminLine_SHIFT);
    99	
   100		/* only perform the cache maintenance if needed for I/D coherency */
   101		if (!(ctr & BIT(CTR_EL0_IDC_SHIFT))) {
   102			unsigned long base = image_base;
   103			unsigned long size = code_size;
   104	
   105			do {
   106				asm("dc " DCTYPE ", %0" :: "r"(base));
   107				base += lsize;
   108				size -= lsize;
   109			} while (size >= lsize);
   110		}
   111	
   112		asm("ic ialluis");
   113		dsb(ish);
   114		isb();
   115	}
   116	
   117	unsigned long __weak primary_entry_offset(void)
   118	{
   119		/*
   120		 * By default, we can invoke the kernel via the branch instruction in
   121		 * the image header, so offset #0. This will be overridden by the EFI
   122		 * stub build that is linked into the core kernel, as in that case, the
   123		 * image header may not have been loaded into memory, or may be mapped
   124		 * with non-executable permissions.
   125		 */
   126	       return 0;
   127	}
   128	
   129	void __noreturn efi_enter_kernel(unsigned long entrypoint,
   130					 unsigned long fdt_addr,
   131					 unsigned long fdt_size)
   132	{
   133		void (* __noreturn enter_kernel)(u64, u64, u64, u64);
   134	
   135		enter_kernel = (void *)entrypoint + primary_entry_offset();
   136		enter_kernel(fdt_addr, 0, 0, 0);
   137	}
   138	
   139	const struct efi_image_info *zboot_get_image_info(unsigned long image_base)
   140	{
   141		auto header = (const struct arm64_image_header *)image_base;
   142	
 > 143		return (void *)image_base + header->efi_image_info_offset;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
