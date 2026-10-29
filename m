Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793242956;
	b=y8vjZt1cF8Bn+T0WzQpHC1tzF6MnEb986qc0xeEK0XfSzr4lzX/e+GiUhMhyHeUX6SsE
	 3Gkh0PhOWQpHRM539imtsrKhYsvQJH/Fbwn5vUSwSWOg//GJABURFkGPJuYR/H4COxw0l
	 ZRbBT2jAoEzJV5La9NlOG0EZr366hZ4XJy5bmGe2jNykecRbl4A2VoElmqlxaVn8DTKia
	 8RKMMfAvIAXtm9QymwKShya2XqquHhjwIjV4vZh0LeOyUMZ1NxKHKPBDMn+HjuhN2laCg
	 20keS1CvEKOyNuqS1mdJnnZhFAdaiKW/kZ0hTlIf9nso34kTNFzlrPd7EYSBHa5NYLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793242956;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=qpTJW5QWmfevHFgrIcUc7Ec9nreDr6kcUnSOw+Iu4Zk=;
	b=48WZlfrDDun0YXDWz5UpySEPdv7HaKFZBfl5O0ydHOvt44XdMmPI67r53cjfxzrWcwQO
	 vg/MdOmL+JJ9FgZPSDCjAsQYpwA8x+R9gLeYdtYN5sPidf2LRJ4bR0GH2e9V6oeDPUQQz
	 X4bhd0GP5zWcAZxEXNIC5EWkIj8C7J1YC6sZZ5SQDj0LwOGLBmONPKZxmS3DRRTTHNoAC
	 +oQs3pvd9yky5dI2RbijpStpNram+JArmewMB169xe5tJYSArhtVKBiAsGlPW3PVfEt+4
	 cfIwIZ/zCXR9c+RLVQ7QfdsECsnKcwKJay/FuGuf73qE2VTZKbe7iDFdy7yHfYndyOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bBA18Vln;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2D2606A31A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 03:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A2D2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bBA18Vln
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793242954; x=1824778954;
  h=date:from:to:cc:subject:message-id;
  bh=MeClWH1MPk6oRHUOIbKtQFvcsIV4qHtV33DV4oVGwNw=;
  b=bBA18Vln2OtMvJKPgD7zbPxe23kVraS6nYk6aCkHyhbbNBuHE/2FJoSC
   m0ZQ/cxVbDVPMymsCi5OeervKAuc11JjU0+Wg5nUJBFl13q55rCONMALR
   Oip4FieC/aKOqfxgkEDW8ZByrxZO2IBfbYl5qmu0QhnbLUW337nr6xFdS
   FDaQzsfdzcGBxFMK7l8UJIrMy9OQcuL9WOqNSGabZv31mgsIcG3QUgNkS
   AjEZ/4Y33VVIn5XcJ4f5hu9+Ivsf4Y9xcxGzZrZqTAm3xKDaXqRGoY5y7
   iviFGyjXZa+u12BtWiDEL7BhiBQHdoFljAG53H1K6W4y6lRFjHdIrRqo1
   g==;
X-CSE-ConnectionGUID: 8zDiHLulQke1JMciAf6Pqg==
X-CSE-MsgGUID: KwAWxnEBS/GRjcuQ+puFVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1869484"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1869484"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 20:02:34 -0700
X-CSE-ConnectionGUID: iRxIKE6YQO+J6+VD4jzs1w==
X-CSE-MsgGUID: VLKyVZUTSUWI2Qflq2K7ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5355253"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 28 Oct 2026 20:02:32 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMGPL-0000000057X-3KTg;
	Thu, 29 Oct 2026 03:02:27 +0000
Date: Thu, 29 Oct 2026 04:01:20 +0100
From: kernel test robot <lkp@intel.com>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:sse_test_v10 6/9]
 arch/riscv/kernel/perf_callchain.c:104:54: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202610290308.ffDFtbzR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git sse_test_v10
head:   b153606b426cd9cdcd8786f48fc3774eb1f61abe
commit: 2ff6aa7cc8aff24dfae190b31053f7cab8762459 [6/9] perf: RISC-V: support callchains with SSE delivery
config: riscv-randconfig-r2308-20261029 (https://download.01.org/0day-ci/archive/20261029/202610290308.ffDFtbzR-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610290308.ffDFtbzR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610290308.ffDFtbzR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/perf_callchain.c:104:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *src @@
   arch/riscv/kernel/perf_callchain.c:104:54: sparse:     expected void const [noderef] __user *from
   arch/riscv/kernel/perf_callchain.c:104:54: sparse:     got void const *src
>> arch/riscv/kernel/perf_callchain.c:109:14: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *ptr @@     got void const *src @@
   arch/riscv/kernel/perf_callchain.c:109:14: sparse:     expected void const [noderef] __user *ptr
   arch/riscv/kernel/perf_callchain.c:109:14: sparse:     got void const *src

vim +104 arch/riscv/kernel/perf_callchain.c

    92	
    93	unsigned long riscv_perf_out_copy_user(void *dst, const void *src,
    94					       unsigned long n)
    95	{
    96		unsigned long addr = (unsigned long)src;
    97		unsigned long copied = 0;
    98	
    99		/* Keep the generic fast path unchanged outside an SSE handler. */
   100		if (!riscv_sse_get_interrupted_context()) {
   101			unsigned long ret;
   102	
   103			pagefault_disable();
 > 104			ret = __copy_from_user_inatomic(dst, src, n);
   105			pagefault_enable();
   106			return ret;
   107		}
   108	
 > 109		if (!access_ok(src, n))
   110			return n;
   111	
   112		/* Do not sample user memory through an unrelated active page table. */
   113		if (!current->mm ||
   114		    (csr_read(CSR_SATP) & SATP_PPN) != virt_to_pfn(current->mm->pgd))
   115			return n;
   116	
   117		while (copied < n) {
   118			unsigned long offset = offset_in_page(addr);
   119			unsigned long chunk = min(n - copied, PAGE_SIZE - offset);
   120			struct page *page;
   121	
   122			/*
   123			 * Fast-only GUP cannot fault. This follows perf_virt_to_phys():
   124			 * local interrupts remain disabled throughout SSE processing, so a
   125			 * concurrent unmap cannot complete its TLB teardown before this
   126			 * temporary reference is put.
   127			 */
   128			if (!get_user_page_fast_only(addr, 0, &page))
   129				break;
   130	
   131			memcpy((char *)dst + copied,
   132			       (char *)page_address(page) + offset, chunk);
   133			put_page(page);
   134			addr += chunk;
   135			copied += chunk;
   136		}
   137	
   138		return n - copied;
   139	}
   140	#endif
   141	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
