Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4EBDDBE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 05:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735880532; cv=none; b=TfUVlomJle6XWUpRsqNSbZqfTerLl2Lsxb4xh8fZI7mDxclegy20UpB1hLEwfwbo1Ao6JTUcCtu+P7rjChyomhmO+GaUPgMOGkwADxYmVHstcvWmb4RnCnEE+L4cLaRNe5M0vhMJPMMwBS6NDMgYvR7XEGgBPRBeriMVaqEq7JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735880532; c=relaxed/simple;
	bh=OlgCSKGLVCi5yWxp7lP/UM1wHEO0Xts3iPlKMnKA+cQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mk+RoOb3CMvq/yI1UNV7VuF0swi3gjDcLsPc4VeOQsdwEEz0F+02Rm3nDd+hg3TpfCZ5GN0vdODmPRnNEGdIr52QVLHvAH3ooBCZJGKwXL/G/CNU39JrBnfGM5FqKFh0VDxV+LJGIjnuMlG8rttaTwJbFgBN61ESmiKyik6bj8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ika1Le1V; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ika1Le1V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735880530; x=1767416530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OlgCSKGLVCi5yWxp7lP/UM1wHEO0Xts3iPlKMnKA+cQ=;
  b=Ika1Le1VKIM8602nLCNQcL509y6IqPbrTUgcJmE7BlOsHqFAx+0v7bC3
   3rTFmgGtI1yUDsdijpReYyl1ngKIkKaNlBtOUnbkt5zQOwzBkzASC0lGP
   RrwLBLVmaOooh+AqGw0SomLwwbB/e0GdrsByhMm1eVDJzeICp/SyIjt3c
   5FhTTZSMShs25F5bRmuCKtJMIT809t4Tr6lgPjAzVURegLoGdWMl2RQs+
   y7NNvnK+mzpTr6QdhEBMMtovgwGhkhUrCDI5HCBYhiZwZYSq5CF0X7E2G
   PcL+n2+RgaVklpM6rIcnsNFRVprIx0tyfv2PF7AaoJGdKJFDiozcg7Zla
   g==;
X-CSE-ConnectionGUID: Ohq1f3+pQIWj9r+sijBCVQ==
X-CSE-MsgGUID: lFS9jTT4T92PjGSFjMyaVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="47486860"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="47486860"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 21:02:09 -0800
X-CSE-ConnectionGUID: M0nCvrnQRLCvEJkeC7fm2A==
X-CSE-MsgGUID: DtbRyVrMSkKRjQcBAsu7wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101887238"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jan 2025 21:02:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTZp0-0009En-1i;
	Fri, 03 Jan 2025 05:02:06 +0000
Date: Fri, 3 Jan 2025 13:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1673/1673] arch/x86/kvm/svm/csv.c:129:52: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202501031232.HaQu3mzq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c2f1662c3fb301fe7ba127fe06c14538112982d4
commit: 07a18fb6c71ef75cc1205999cd2493b567649466 [1673/1673] KVM: SVM: Prepare memory pool to allocate buffers for KVM_CSV_COMMAND_BATCH
config: x86_64-randconfig-121-20241230 (https://download.01.org/0day-ci/archive/20250103/202501031232.HaQu3mzq-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031232.HaQu3mzq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031232.HaQu3mzq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/svm/csv.c:53:5: sparse: sparse: symbol 'csv_vm_attestation' was not declared. Should it be static?
>> arch/x86/kvm/svm/csv.c:129:52: sparse: sparse: Using plain integer as NULL pointer
>> arch/x86/kvm/svm/csv.c:129:6: sparse: sparse: symbol 'g_trans_mempool' was not declared. Should it be static?

vim +129 arch/x86/kvm/svm/csv.c

    52	
  > 53	int csv_vm_attestation(struct kvm *kvm, unsigned long gpa, unsigned long len)
    54	{
    55		struct kvm_sev_info *sev = &to_kvm_svm(kvm)->sev_info;
    56		struct sev_data_attestation_report *data = NULL;
    57		struct page **pages;
    58		unsigned long guest_uaddr, n;
    59		int ret = 0, offset, error;
    60	
    61		if (!sev_guest(kvm) || !hygon_kvm_hooks.sev_hooks_installed)
    62			return -ENOTTY;
    63	
    64		/*
    65		 * The physical address of guest must valid and page aligned, and
    66		 * the length of guest memory region must be page size aligned.
    67		 */
    68		if (!gpa || (gpa & ~PAGE_MASK) || (len & ~PAGE_MASK)) {
    69			pr_err("invalid guest address or length\n");
    70			return -EFAULT;
    71		}
    72	
    73		guest_uaddr = gfn_to_hva(kvm, gpa_to_gfn(gpa));
    74		pages = hygon_kvm_hooks.sev_pin_memory(kvm, guest_uaddr, len, &n, 1);
    75		if (IS_ERR(pages))
    76			return PTR_ERR(pages);
    77	
    78		/*
    79		 * The attestation report must be copied into contiguous memory region,
    80		 * lets verify that userspace memory pages are contiguous before we
    81		 * issue commmand.
    82		 */
    83		if (hygon_kvm_hooks.get_num_contig_pages(0, pages, n) != n) {
    84			ret = -EINVAL;
    85			goto e_unpin_memory;
    86		}
    87	
    88		ret = -ENOMEM;
    89		data = kzalloc(sizeof(*data), GFP_KERNEL);
    90		if (!data)
    91			goto e_unpin_memory;
    92	
    93		/* csv_vm_mnonce indicates attestation request from guest */
    94		if (sizeof(csv_vm_mnonce) >= sizeof(data->mnonce)) {
    95			ret = -EINVAL;
    96			goto e_free;
    97		}
    98	
    99		memcpy(data->mnonce, csv_vm_mnonce, sizeof(csv_vm_mnonce));
   100	
   101		offset = guest_uaddr & (PAGE_SIZE - 1);
   102		data->address = __sme_page_pa(pages[0]) + offset;
   103		data->len = len;
   104	
   105		data->handle = sev->handle;
   106		ret = hygon_kvm_hooks.sev_issue_cmd(kvm, SEV_CMD_ATTESTATION_REPORT,
   107						    data, &error);
   108	
   109		if (ret)
   110			pr_err("vm attestation ret %#x, error %#x\n", ret, error);
   111	
   112	e_free:
   113		kfree(data);
   114	e_unpin_memory:
   115		hygon_kvm_hooks.sev_unpin_memory(kvm, pages, n);
   116		return ret;
   117	}
   118	
   119	/*--1024--1023--1024--1023--*/
   120	#define TRANS_MEMPOOL_1ST_BLOCK_OFFSET		0
   121	#define TRANS_MEMPOOL_2ND_BLOCK_OFFSET		(1024 << PAGE_SHIFT)
   122	#define TRANS_MEMPOOL_3RD_BLOCK_OFFSET		(2047 << PAGE_SHIFT)
   123	#define TRANS_MEMPOOL_4TH_BLOCK_OFFSET		(3071 << PAGE_SHIFT)
   124	#define TRANS_MEMPOOL_BLOCKS_MAX_OFFSET		(4094 << PAGE_SHIFT)
   125	#define TRANS_MEMPOOL_BLOCK_NUM			4
   126	#define TRANS_MEMPOOL_BLOCK_SIZE		(1024 * PAGE_SIZE)
   127	
   128	static size_t g_mempool_offset;
 > 129	void *g_trans_mempool[TRANS_MEMPOOL_BLOCK_NUM] = { 0, };
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
