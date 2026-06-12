Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3E73D9DB0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 11:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781265398; cv=none; b=AbitDsje+9kqDjK/XzhEdj2VT0Vk7hPEa+Ow1zXrssn53mjib5JD1hwx875sqS5jOiOGo9OJB+BJAGhadddwTLSmk9K9XKJhbIGTyOMVBWT7AAslopUbP18/IvHgRDcFt/v39LD62HigTBYhO47ZhKJHOme6I28S6CGzk+aVawo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781265398; c=relaxed/simple;
	bh=OiMebg8drplDVSe2HGuMroecpWoUn7si+u9pUlJG4mM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ni8mcmxCnMFPp1sZPq8hesUqpdgioZ9wrDpjwygM9nzaEn+JQa+ukvS9PAExTOuHf0I9rvtEaI5x3YJbFH5p5sLumviTSytwP2NTwDIdhOyCwrHrXN4AA2LJRjHmI/8MsA2/siVJk66UJd2zGnLeBb2Z2s5OEXY2izA9x/ERF1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mbp4Dimy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mbp4Dimy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781265395; x=1812801395;
  h=date:from:to:cc:subject:message-id;
  bh=OiMebg8drplDVSe2HGuMroecpWoUn7si+u9pUlJG4mM=;
  b=Mbp4Dimy0iOVYUbj9eYw8tBbHsILlaxblsByB++QhPOWIpNUdRuDXRfE
   FjzSGI9n7M87xhFuAdRZIykVWAB2QSFq5mb+Me7neRtRB6nbyZPk4xJ6C
   j2d+xBMZvVjzVHnQuKafN1KHAPgKEztKyYKynz81cI7YDOhVkBIZr8d9t
   i+9fcMikKp9kOP2G7vmjCX2gc79vlmQXavcCXtyoDIvagSZi1c0P4H5z/
   oje9rdpFTXh2L8Zx6gwRUdVrWqX0OjVEHOLkpq95yUVf2956tYPeciNUz
   r48NMneFQ+u3vwq+nk+gIo8gaKYn5yDQQV76MVWQVQSD9PC9S8S0iZ5DS
   A==;
X-CSE-ConnectionGUID: 5bviBimIR6umAqqyAeCr7g==
X-CSE-MsgGUID: 0ggbO9JDS1+k52wvYzYItg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85993369"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="85993369"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 04:56:35 -0700
X-CSE-ConnectionGUID: /KrEtD87RZmgq19hLQ1/vg==
X-CSE-MsgGUID: 2L1+MwKUS5qYXX0lFCbcAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="248690496"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jun 2026 04:56:32 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY0Uw-00000000Ohn-1en2;
	Fri, 12 Jun 2026 11:56:30 +0000
Date: Fri, 12 Jun 2026 19:56:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Sean Christopherson <seanjc@google.com>, Fuad Tabba <tabba@google.com>
Subject: [sean-jc:x86/gmem_inplace 30/59]
 arch/s390/kvm/../../../virt/kvm/kvm_main.c:2437:12: warning:
 'kvm_supported_mem_attributes' defined but not used
Message-ID: <202606121943.HbEtzxip-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/gmem_inplace
head:   ee82c791cf17377ef4b741e56d41fc1e454a1c6c
commit: d2dd49c5f92f1ccb2f22e281942dfb7771e27bc2 [30/59] KVM: guest_memfd: Advertise KVM_SET_MEMORY_ATTRIBUTES2 ioctl
config: s390-randconfig-002-20260612 (https://download.01.org/0day-ci/archive/20260612/202606121943.HbEtzxip-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121943.HbEtzxip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121943.HbEtzxip-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/s390/kvm/../../../virt/kvm/kvm_main.c:2437:12: warning: 'kvm_supported_mem_attributes' defined but not used [-Wunused-function]
    static u64 kvm_supported_mem_attributes(struct kvm *kvm)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kvm_supported_mem_attributes +2437 arch/s390/kvm/../../../virt/kvm/kvm_main.c

  2436	
> 2437	static u64 kvm_supported_mem_attributes(struct kvm *kvm)
  2438	{
  2439	#ifdef kvm_arch_has_private_mem
  2440		if (!kvm || kvm_arch_has_private_mem(kvm))
  2441			return KVM_MEMORY_ATTRIBUTE_PRIVATE;
  2442	#endif
  2443	
  2444		return 0;
  2445	}
  2446	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
