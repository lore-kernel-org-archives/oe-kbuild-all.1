Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965126;
	b=Vs8QvptRH68JntjTVnhEYX4jbZWSB6eEc2spsQHUqMB5LiBaouZ3zO27MUImiQlOKnoy
	 FydJEAdQnMcdDCEIKTZ9mNDCu5HGmP3Ujt0us+xuQiF74+kdrMjX6AWacDOlpA+BNTqaw
	 V/BrKoZz6lIEdOg9S2QQakSvNLWnN5MFmI4j1A5OXUVzBcMUSKbw62gYQVCB/D5MA4DJW
	 PXTGA57kg9IX6jd7PVlEiPMfbtFg9hzIp2M8Sp5UbW3LyXmAou0aMemqz7O3VEZqYgeG0
	 Plat6i/VOjbIiiG7jGHPhhfF0Asy6nHQEMUXH0USUuJ9s0kVE1yl8I5gCr3rGxkoXsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965126;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=A145vFTZjLo7trSfILj75SLk8mEcBjz8Hl73LJnp/+U=;
	b=I+ciPZ3Ae+OYSFFRwBn3+YOtmLMhTZiY7OSxJQ7ZqvWsZD5ACQzZTJT5zsbg9fEFGtr2
	 2CMilaP2JytmlozTfY5PWHwVOqlnKGwnNcJ3z5vsaSgPtNxQrSxJJ4QhGLPyc8eGrwZ2l
	 cuFWhcdND+lhidBXMu4KN2oTre1v+U0Bmw8PNMlDaJgzqDrsaPKLWNjsjq4NXyWxmHPo9
	 PUMXJzSEOpRA7JCXaklacb8jlQMPEbMf1Ufd3gg3j7uiVvVxyECrHoKTAljOe2yl93Z4v
	 AH8IkDQ6Qzr9QGRe94VfH2n63bat1xssAoRf3l3Hrxo+cJKc8TGrrOXrgSRznRrt9jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="hX91CU/x";
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2647606A326
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 11:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2647606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hX91CU/x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793965125; x=1825501125;
  h=date:from:to:cc:subject:message-id;
  bh=TNO9m6clvrnN+voRcoHM/vxroL7ETP03B02V0popTEM=;
  b=hX91CU/xc+9eaOxbOglZheJa2PZIFevCsdMapgmTD8ZoVgCKSAbaPmA2
   OZZDl49uJEHBSHIwtDMuif94YDUiIQAPh5xvzUYgSDRxe1Cf2FcK7QEUb
   TIaSGlY4apiK5X++KQAAZ5Lsd2RofCYAIoJZWs+y9RY8YmKksUzP5QzLD
   Hr6RIzR/twsFcduVQNTP9xOQcJ3r77qOio1ed5Pvg6+mk9bLQ2mlZuAlH
   l5Zui3oByzBFntpKr8/hqc0Tt4uFTKvVZcph0T5mbamG1QNXYg1DY+7UR
   5NKVJM6f7dg1y/S4sq5JMNbpNGAtQTm9eAPQQxUeb3lXToRtD1h6HTUCt
   g==;
X-CSE-ConnectionGUID: 13MeHfJzS7+RlQJ3DdBnOg==
X-CSE-MsgGUID: ScuId78RS5WBjZne3tAmTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2674770"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2674770"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 03:38:44 -0800
X-CSE-ConnectionGUID: iy/9MSoqQ7ecLVkS0vOXoA==
X-CSE-MsgGUID: sxeN6i3jTka/XSnhAGSVwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7141985"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 06 Nov 2026 03:38:43 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPIHI-00000000AEX-1UyB;
	Fri, 06 Nov 2026 11:38:40 +0000
Date: Fri, 06 Nov 2026 12:37:50 +0100
From: kernel test robot <lkp@intel.com>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_sse_v12 42/46]
 arch/riscv/kernel/perf_callchain.c:125:22: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202611061208.jUDQsZ0A-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_sbi_sse_v12
head:   6edb42266d180e7a96cbf7c0f790f5170e1c5c5a
commit: d009198e6da0ab7b7dd2958bf4d6974cd99cc36b [42/46] perf: RISC-V: support callchains with SSE delivery
config: riscv-randconfig-r2309-20261106 (https://download.01.org/0day-ci/archive/20261106/202611061208.jUDQsZ0A-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.3.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611061208.jUDQsZ0A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611061208.jUDQsZ0A-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/perf_callchain.c:125:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *ptr @@     got void const * @@
   arch/riscv/kernel/perf_callchain.c:125:22: sparse:     expected void const [noderef] __user *ptr
   arch/riscv/kernel/perf_callchain.c:125:22: sparse:     got void const *
   arch/riscv/kernel/perf_callchain.c:133:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *src @@
   arch/riscv/kernel/perf_callchain.c:133:46: sparse:     expected void const [noderef] __user *from
   arch/riscv/kernel/perf_callchain.c:133:46: sparse:     got void const *src

vim +125 arch/riscv/kernel/perf_callchain.c

    92	
    93	unsigned long riscv_perf_out_copy_user(void *dst, const void *src,
    94					       unsigned long n)
    95	{
    96		unsigned long ret;
    97	
    98		/*
    99		 * Raw user-stack sampling can run in the NMI-like SSE context. Mirror
   100		 * x86's copy_from_user_nmi(): the copy may take a page fault, but it
   101		 * must not fault a non-resident page in. pagefault_disable() keeps the
   102		 * RISC-V fault handler on the nofault exception-table fixup (no
   103		 * handle_mm_fault(), no interrupt window), and the SSE entry saves and
   104		 * restores the interrupted task's stack metadata across that nested
   105		 * trap. A fault therefore returns the number of bytes not copied, and
   106		 * perf truncates the user-stack dump accordingly.
   107		 *
   108		 * In SSE context also approximate x86's nmi_uaccess_okay(): only sample
   109		 * when the active page table root still matches current->mm, so we do
   110		 * not walk an unrelated address space after interrupting a KVM guest, a
   111		 * kernel thread, or a task whose mm is being swapped. This root check
   112		 * does not close the window inside switch_mm() between writing satp and
   113		 * flushing the local TLB (RISC-V has no LOADED_MM_SWITCHING marker like
   114		 * x86); that is a window between instructions, not within one. In that
   115		 * window a stale TLB entry may still resolve to the outgoing mapping, and
   116		 * with ASID reuse the residue can even belong to an unrelated address
   117		 * space. The nofault fixup only bounds faulting accesses; it cannot
   118		 * detect a successful hit on a stale translation. This is therefore a
   119		 * bounded sample-quality gap (a mis-attributed or truncated user-stack
   120		 * dump), not a memory-safety hazard: the copy target is the perf ring
   121		 * buffer and the length is bounded, so a stale read cannot corrupt an
   122		 * unrelated kernel object.
   123		 */
   124		if (riscv_sse_get_interrupted_context()) {
 > 125			if (!access_ok(src, n))
   126				return n;
   127			if (!current->mm ||
   128			    (csr_read(CSR_SATP) & SATP_PPN) != virt_to_pfn(current->mm->pgd))
   129				return n;
   130		}
   131	
   132		pagefault_disable();
   133		ret = __copy_from_user_inatomic(dst, src, n);
   134		pagefault_enable();
   135	
   136		return ret;
   137	}
   138	#endif
   139	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
