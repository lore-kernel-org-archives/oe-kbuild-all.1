Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACD31CA8D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 12:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735907768; cv=none; b=NpsFwQa/tWFjpuTEMvRkhrS8K7ap3t0XGNV/Zab+LsiPCjbIOatXYKZHpiq9HYpnYVEp1Yc7p/WY0MmAaeMIrtK+mQqsdK8TxxCNSisi328/2urI4aPl3KHf+eey7hrNb82eFUxPeb+b0m1B2naDXMQniFUwh+yJowCKv+REryE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735907768; c=relaxed/simple;
	bh=WKpqejKxWVlD/Rpv5O57EtMIQF5f02Aszm8f3GusX8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XU/6x/RezwfT3iNm91Lq7uKkIPSsoM4vO6pvAkQsjALWE5gRyPWxqkIzNoUeGvkKAEh79gGFMuZ00PpgEbdlG5Wblmnct6JQuSQjZoGNrGjZw7TBZXFblKPSYKlMJSe6hKNBoI3O1yLilLQi1B93TkXkLVDRtu0b/qxZwhl5mYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DoHwWyAJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DoHwWyAJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735907767; x=1767443767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WKpqejKxWVlD/Rpv5O57EtMIQF5f02Aszm8f3GusX8k=;
  b=DoHwWyAJxDDjrCw+LsVKx+O1efHzeOgni4QYW2VPMeLxbiSjxhtQP7e3
   ADvY9PZOVAPA6/jPQYrEPTXWd5Pjrau2hjF+2lo67EeNnpZ8x2opwvl+6
   B0Fku1rJgqxpUSDETpBMPl0oG5/hetSbxoTtLIANbgmDudenMpQ8FYcRs
   kR/dVc3jM+I+EDxIq/QBlPK5yvA/jiaYIOn0+ITYquHXWpBEosqjRecTj
   mqzgutjcosJ4a7S3fUhwwTeQFk41DCAFIWfngZWrM6TfTosHc2hGUErgl
   Cv2WrwxTYYfmQRumLhYKXJUra6+wvl+UCqDM55ZnfE8FNchwO2E7M8JAw
   w==;
X-CSE-ConnectionGUID: TmKzg0zjQnKq+nt1WAnzsA==
X-CSE-MsgGUID: O26tu3MuSuSwew5g3+XzDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="46830299"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="46830299"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 04:36:05 -0800
X-CSE-ConnectionGUID: zbDw29muSiWkpblSSazyfA==
X-CSE-MsgGUID: yjFunt2pQVS2KQUfLe8Fjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106413919"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jan 2025 04:36:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTguI-0009jZ-0a;
	Fri, 03 Jan 2025 12:36:02 +0000
Date: Fri, 3 Jan 2025 20:35:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1693/1693] arch/loongarch/kvm/tlb.c:26:9: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202501032032.1nlRwHlW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   604e996dd0189ddb0875f389b87fa2084b3a9424
commit: 3f5dde7efb48ae2725aebecfbd47aacfa3def181 [1693/1693] LoongArch: KVM: Delay secondary mmu tlb flush until guest entry
config: loongarch-randconfig-r112-20250103 (https://download.01.org/0day-ci/archive/20250103/202501032032.1nlRwHlW-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250103/202501032032.1nlRwHlW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501032032.1nlRwHlW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/loongarch/kvm/tlb.c:26:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/tlb.c:26:9: sparse:     expected void *ptr
   arch/loongarch/kvm/tlb.c:26:9: sparse:     got unsigned int [noderef] __percpu *
>> arch/loongarch/kvm/tlb.c:26:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/tlb.c:26:9: sparse:     expected void *ptr
   arch/loongarch/kvm/tlb.c:26:9: sparse:     got unsigned int [noderef] __percpu *
>> arch/loongarch/kvm/tlb.c:26:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/tlb.c:26:9: sparse:     expected void *ptr
   arch/loongarch/kvm/tlb.c:26:9: sparse:     got unsigned int [noderef] __percpu *
>> arch/loongarch/kvm/tlb.c:26:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/tlb.c:26:9: sparse:     expected void *ptr
   arch/loongarch/kvm/tlb.c:26:9: sparse:     got unsigned int [noderef] __percpu *
>> arch/loongarch/kvm/tlb.c:26:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/tlb.c:26:9: sparse:     expected void *ptr
   arch/loongarch/kvm/tlb.c:26:9: sparse:     got int [noderef] __percpu *
>> arch/loongarch/kvm/tlb.c:26:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/tlb.c:26:9: sparse:     expected void *ptr
   arch/loongarch/kvm/tlb.c:26:9: sparse:     got int [noderef] __percpu *
>> arch/loongarch/kvm/tlb.c:26:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/tlb.c:26:9: sparse:     expected void *ptr
   arch/loongarch/kvm/tlb.c:26:9: sparse:     got int [noderef] __percpu *
>> arch/loongarch/kvm/tlb.c:26:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/tlb.c:26:9: sparse:     expected void *ptr
   arch/loongarch/kvm/tlb.c:26:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kvm/tlb.c:28:33: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'

vim +26 arch/loongarch/kvm/tlb.c

    23	
    24	void kvm_flush_tlb_gpa(struct kvm_vcpu *vcpu, unsigned long gpa)
    25	{
  > 26		lockdep_assert_irqs_disabled();

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
