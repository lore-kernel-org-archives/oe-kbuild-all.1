Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378441A76BC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 14:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735569536; cv=none; b=FmuOhJBJw4PG41kJGm1Xcn1mPpwYRSU7htgjKPE80YLDK3mKGZMFEaBYY337H6pkdwpCqk8i3VclvMFYRDVh298UIDos0jgcxH23+uHRmGzPgElHfakleEZOK/st/fNpUcw0xGV3wY5IPi9y5nVYSuzKuPeYcJvl//vzkhvFPtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735569536; c=relaxed/simple;
	bh=xhec6Egl0gjhupm0kdW5P1aT2CN5sMJx+d07ZPeRHqk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aqh4216gNTSuQnG8n3XN8Bk8y1FagQze7OQSEdmnlqpv5PjDNdxo/ptRV67DXVz8oe23L6IfJppW7sPFifcFQMkVa2FHKcAt/JCqdMWQ+B/Afh/GXa+BjgkqBk/03OnguhoRNJT/pbqc9A7WYpRurEKlFCZcUHGVFSVGACUjwBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RlHS636w; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RlHS636w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735569535; x=1767105535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xhec6Egl0gjhupm0kdW5P1aT2CN5sMJx+d07ZPeRHqk=;
  b=RlHS636wwYbMOfMNm/49BuYkvvIi5SFvzY5DDRHJODH+UpJO/kv44k81
   76o5QEI1883U98BOYqEcgtM9oNqsC+N0OQMiYM0y17uHl33R1wuMphaZa
   IsIxeL4ZMei9dVeoHgSH7VGS2F85DmUrJK5iaTj+5reUXvzAIunktx/M1
   +eDfC/J1ZAIg6Cdv3vdIN2pCztfjbMZN7/WquCXCjCs0eTc15D7Ccl+R8
   MQhvV4Enh3e6Z/lpChBAAnLGAKAMjJHVCaqEzR8DvzHjfO4tgrWyoh0pp
   5MIFkI7Lj8QXU5Myr3Phyf6r430aUYSnm6nU/wJ3kjpdbKMDzIlflWxek
   w==;
X-CSE-ConnectionGUID: nzYT9ViqTWCsR+fgZj4zxA==
X-CSE-MsgGUID: 6wNI1+M9Tqqmf4uWfatU8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="39631108"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="39631108"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 06:38:55 -0800
X-CSE-ConnectionGUID: aRs8gQ6NRlCeNprSYvQaxA==
X-CSE-MsgGUID: erw2t6uqSy+8mS4wFafAkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="100568897"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Dec 2024 06:38:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSGux-0005r4-1K;
	Mon, 30 Dec 2024 14:38:51 +0000
Date: Mon, 30 Dec 2024 22:38:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1673/1673] arch/x86/kvm/svm/csv.c:30:5: sparse:
 sparse: symbol 'csv_vm_attestation' was not declared. Should it be static?
Message-ID: <202412302222.H5YbllyE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8fc6624288123b0750ac5164020e637b70f1de2b
commit: 0f13b8634792cff1f2fb18bf35e5a24d7a8cbf8e [1673/1673] KVM: x86: Support VM_ATTESTATION hypercall
config: x86_64-randconfig-121-20241230 (https://download.01.org/0day-ci/archive/20241230/202412302222.H5YbllyE-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241230/202412302222.H5YbllyE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412302222.H5YbllyE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kvm/svm/csv.c:30:5: sparse: sparse: symbol 'csv_vm_attestation' was not declared. Should it be static?

vim +/csv_vm_attestation +30 arch/x86/kvm/svm/csv.c

    29	
  > 30	int csv_vm_attestation(struct kvm *kvm, unsigned long gpa, unsigned long len)
    31	{
    32		struct kvm_sev_info *sev = &to_kvm_svm(kvm)->sev_info;
    33		struct sev_data_attestation_report *data = NULL;
    34		struct page **pages;
    35		unsigned long guest_uaddr, n;
    36		int ret = 0, offset, error;
    37	
    38		if (!sev_guest(kvm) || !hygon_kvm_hooks.sev_hooks_installed)
    39			return -ENOTTY;
    40	
    41		/*
    42		 * The physical address of guest must valid and page aligned, and
    43		 * the length of guest memory region must be page size aligned.
    44		 */
    45		if (!gpa || (gpa & ~PAGE_MASK) || (len & ~PAGE_MASK)) {
    46			pr_err("invalid guest address or length\n");
    47			return -EFAULT;
    48		}
    49	
    50		guest_uaddr = gfn_to_hva(kvm, gpa_to_gfn(gpa));
    51		pages = hygon_kvm_hooks.sev_pin_memory(kvm, guest_uaddr, len, &n, 1);
    52		if (IS_ERR(pages))
    53			return PTR_ERR(pages);
    54	
    55		/*
    56		 * The attestation report must be copied into contiguous memory region,
    57		 * lets verify that userspace memory pages are contiguous before we
    58		 * issue commmand.
    59		 */
    60		if (hygon_kvm_hooks.get_num_contig_pages(0, pages, n) != n) {
    61			ret = -EINVAL;
    62			goto e_unpin_memory;
    63		}
    64	
    65		ret = -ENOMEM;
    66		data = kzalloc(sizeof(*data), GFP_KERNEL);
    67		if (!data)
    68			goto e_unpin_memory;
    69	
    70		/* csv_vm_mnonce indicates attestation request from guest */
    71		if (sizeof(csv_vm_mnonce) >= sizeof(data->mnonce)) {
    72			ret = -EINVAL;
    73			goto e_free;
    74		}
    75	
    76		memcpy(data->mnonce, csv_vm_mnonce, sizeof(csv_vm_mnonce));
    77	
    78		offset = guest_uaddr & (PAGE_SIZE - 1);
    79		data->address = __sme_page_pa(pages[0]) + offset;
    80		data->len = len;
    81	
    82		data->handle = sev->handle;
    83		ret = hygon_kvm_hooks.sev_issue_cmd(kvm, SEV_CMD_ATTESTATION_REPORT,
    84						    data, &error);
    85	
    86		if (ret)
    87			pr_err("vm attestation ret %#x, error %#x\n", ret, error);
    88	
    89	e_free:
    90		kfree(data);
    91	e_unpin_memory:
    92		hygon_kvm_hooks.sev_unpin_memory(kvm, pages, n);
    93		return ret;
    94	}
    95	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
