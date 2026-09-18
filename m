Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809B0358399
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 21:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765660; cv=none; b=k0GTfATaThCdEY5IsYWqwvlGmQ8NtN3SStOb66cA9wuRmaCgGcRzhGoHhad49lbpuwwewtun+222dPPeJbk59IpPESDPd22pPsng//CPMrqnim7s+QvO6V4jxF9EVLfJxB0qYXCyaXB2pTW9o4zHZs0vu2xdhbCreTZRSqAqbgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765660; c=relaxed/simple;
	bh=mKCh8aX+5nTuj/Yh5p1dsdt/uKo3OkMADUp6TL9okZM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WTPZngOQzzM8FweuxAdzmcVtkD5RUHV9Cn6W3hAf7meHN/Hgw4tOBakZ8xIQVUg6fsWvyS7U7anZrt4+mKnVdVHiO3BnsCwBCUXZwAbH0I9pQUdtrLfIzdkOZLpHu6Mpg87gjauKUkMPcyQJTMF8X5oyNANQKd19btTq3nZtUyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/hk2/sE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/hk2/sE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789765658; x=1821301658;
  h=date:from:to:cc:subject:message-id;
  bh=mKCh8aX+5nTuj/Yh5p1dsdt/uKo3OkMADUp6TL9okZM=;
  b=D/hk2/sE+dDVcD4ordwOK5zVgfvAKB6YahkBgrt+7ZpU5n6qlrBr1Itz
   LHCrhZhYyu0IiXPZEEv0c1Dt6g6NGXsqtd7mVlfA6pSBhz6A19y5X5hC5
   bVCL5LdtZz+Q63UORdAGdfVgG8WF1uYcFI1pOM/8vdMqSzkCvcbSnb7pE
   /fEeTr2g/TIfcoBW4hUPnxW7i7H4xdy8fWaa1vDBeBu6CWx/3cLLdEmWI
   yMkDRfTvEM8C0rH+2k28B5gHpsUyruj3a+n1KuPaxhg0MmITucAOucJDj
   D1SWIYl+ZpVifleats5jy2TyIFbWHj/2AvJ81Rldm22F+FCfIvnb317Bf
   g==;
X-CSE-ConnectionGUID: z10z9aGyQwCeAe1UZbrgDA==
X-CSE-MsgGUID: AM1amC1lQeeWa8xg50bK7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="115831407"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="115831407"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 14:07:38 -0700
X-CSE-ConnectionGUID: WFk7gLaQRXGZQzl0j9M9zA==
X-CSE-MsgGUID: 9rjrOd6KSKiaKMRXYirbwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2782733"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 18 Sep 2026 14:07:37 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7fny-00000000AL7-24te;
	Fri, 18 Sep 2026 21:07:34 +0000
Date: Sat, 19 Sep 2026 05:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 1/1]
 arch/arm64/kvm/pkvm.c:756:5: sparse: sparse: symbol
 'pkvm_enable_smc_forwarding' was not declared. Should it be static?
Message-ID: <202609190530.kVT78zro-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   57041e4a7e52342473871000827584f966d8cbd3
commit: 128144da229a1de12ebe5bca87f607aa348c6ba9 [1/1] ANDROID: KVM: arm64: Add smc64 trap handling for protected guests
config: arm64-randconfig-r123-20260910 (https://download.01.org/0day-ci/archive/20260919/202609190530.kVT78zro-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609190530.kVT78zro-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609190530.kVT78zro-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/pkvm.c:756:5: sparse: sparse: symbol 'pkvm_enable_smc_forwarding' was not declared. Should it be static?

vim +/pkvm_enable_smc_forwarding +756 arch/arm64/kvm/pkvm.c

   755	
 > 756	int pkvm_enable_smc_forwarding(struct file *kvm_file)
   757	{
   758		struct kvm *host_kvm;
   759	
   760		if (!file_is_kvm(kvm_file))
   761			return -EINVAL;
   762	
   763		if (!kvm_get_kvm_safe(kvm_file->private_data))
   764			return -EINVAL;
   765	
   766		host_kvm = kvm_file->private_data;
   767		if (!host_kvm)
   768			return -EINVAL;
   769	
   770		host_kvm->arch.pkvm.smc_forwarded = true;
   771	
   772		return 0;
   773	}
   774	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
