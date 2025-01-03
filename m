Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BAE182
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 03:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735876082; cv=none; b=cUH6gG473kTfXJddO1YayXiYOIrVTEIgUEQpPDJdRb0bsnSF7rLen6DBJxr7e2Xg78cglyGw/Qwc43W/7Idwa911tiaCyIZwHgoIIlf8S+J0WWifhJNjSWIeVa8owjiWidY1SBSYEI/UwhcI/L3Vxs1ImVuVS6N8WktiP2ednSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735876082; c=relaxed/simple;
	bh=phsM8VKZWAzm67SCQPDToXbSdv73tOnVZtSg8U1jPQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kGaG4HXM1DteOJMmS9AEU8BqY1+dZuNq7+SltjIBaXNQqVKJ2onXSt1biknl6fYHqjhntrmir0wdFwF272IHUdUbZ3v6xxEfE9YLtieIpDS9t2DBYM+DOLfaSjsdkjyIXO62rjyP9obp3KI1qhf+OxYNcE+ARJKtE46yN2AUJAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZ4GGUOS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZ4GGUOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735876080; x=1767412080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=phsM8VKZWAzm67SCQPDToXbSdv73tOnVZtSg8U1jPQQ=;
  b=JZ4GGUOSrCfA15H3o0Y1ao8oLrllERk72exlmKtAAgoR6KWdXfkrP20a
   3ZyIm1DFXZcc6pviPv4iy1Z/i3CDVdArnmpBoOedgsHrb7qlIXW3OhN+T
   d+Ovwcc1w4QXaGeiv+tF/Apb2SuZWQd0PTLuX1gNxaRzk/zLK+3k2CT0f
   lZWwPFl4XItgGVmDvt6HfilEGkeWtifnnniQcKMCVC1Eo6FkI/p07i5j+
   XnfnMYe292DTd8iqScJIUovJmQ/HeNVBfPmk9Unu6dNsgnT2IK0XFkICK
   M9RheCWWGDheaAjBPyrr9AI4cuoTV1706X8TWOVDRXg+93ESndN/iJoNV
   Q==;
X-CSE-ConnectionGUID: GMpUdpvGRW6nNQbAXsBpvw==
X-CSE-MsgGUID: 2BUqJiMdRfe3uchgpq+NOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36275467"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36275467"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 19:48:00 -0800
X-CSE-ConnectionGUID: Arf2AJXZSTaJ7nPAj/XMTA==
X-CSE-MsgGUID: nCh6B3k0RfS3FhW4LBfkmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="106661527"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Jan 2025 19:47:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTYfE-0009A6-1n;
	Fri, 03 Jan 2025 03:47:56 +0000
Date: Fri, 3 Jan 2025 11:47:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1673/1673] arch/x86/kvm/svm/csv.c:30:5: sparse:
 sparse: symbol 'csv_vm_attestation' was not declared. Should it be static?
Message-ID: <202501031119.BkQTUZGn-lkp@intel.com>
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
commit: 0f13b8634792cff1f2fb18bf35e5a24d7a8cbf8e [1673/1673] KVM: x86: Support VM_ATTESTATION hypercall
config: x86_64-randconfig-121-20241230 (https://download.01.org/0day-ci/archive/20250103/202501031119.BkQTUZGn-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031119.BkQTUZGn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031119.BkQTUZGn-lkp@intel.com/

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
