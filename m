Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462A71DB127
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Sep 2025 13:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758981135; cv=none; b=njL/L95Kddqstg7zTie/A7qoPMXZ73F89fru8Hthq020sff+pcEmPMSiNVxeonJxOMwxu4nUJejuQFcGnpCZ01VB9uQZ8k4oUFfGd0eXn8I0FPmTcZKeALWv2QwsvU5lZWuKzEhtJkwpzxwq5FCJ1NO8BAyUaSp1dx+myN1oW5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758981135; c=relaxed/simple;
	bh=176GQYYAzpTMAf1Sg3K2IgbLrFOV+0nTX30GHH1G0Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fH0wJeswqGRK0K+aAVJyTtHsK50eaZuPG8xBM2weL+7x74H2QsTkhUpwiIOt9TM9vhEfp7L8Zil57Q7dWchDVml4ysSQB0MbqaivAwRIgt3hb8KfCOLL6gtZXRoPNktWPpiG6erSv07iQXPsfxuLmCQrI6q8Ew4bYo4YgBqinIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IMeN+BlM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IMeN+BlM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758981133; x=1790517133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=176GQYYAzpTMAf1Sg3K2IgbLrFOV+0nTX30GHH1G0Ys=;
  b=IMeN+BlMrEb2sgafjfSFcsP+nVJ9JCiylLynBi7e45OHIAY/C6pvrdON
   GsQ1w9s6fT4B6m+sARwuS9XQFRnPSv2Ak6SJxcz6Sddrl6mVMZHXCrksB
   itCTwEFe9qaCllXClwGeknnJA0o5zh7cVAUyV6FMt8QGIWnoZZeB3UoFo
   FIMjiFczZFU36DNFCCCL3UIY3OFzFZtqYUuHoUWNQsRg7YodGzt4xZ3UG
   YaNGBF0xcR4UKH6gNwAzSvIZDAY1PpzlptkUiEKGBlvbD6q/CuivcZzUa
   bE8wRq8vqSyhEaZ4nkqeIiPs2WPlH1eJ9TEX/i3yuYtL5NinBiVy/zFy4
   w==;
X-CSE-ConnectionGUID: u3CGo2qSSPeX84xzhwOVcA==
X-CSE-MsgGUID: bXIG4jn4Tf+f3prDZSa9Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="61208973"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="61208973"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 06:52:12 -0700
X-CSE-ConnectionGUID: DnICycyqSL6zDj90ydOCDQ==
X-CSE-MsgGUID: Nj+psTydQHCmSvnGApdHzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="177110051"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 27 Sep 2025 06:52:12 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2VLN-00075w-0b;
	Sat, 27 Sep 2025 13:52:09 +0000
Date: Sat, 27 Sep 2025 21:51:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:x86/gmem_inplace 25/30] include/linux/kvm_host.h:2543:24:
 error: implicit declaration of function 'kvm_gmem_is_private'; did you mean
 'kvm_mem_is_private'?
Message-ID: <202509272154.pz9xNtSw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/gmem_inplace
head:   5140bf8b78f718d7df0eaf7d93420afeeb012afa
commit: b2676a336afad33e3df10d67698430a46541e489 [25/30] KVM: Wire up kvm_mem_is_private() to guest_memfd-tracked attributes
config: x86_64-buildonly-randconfig-004-20250927 (https://download.01.org/0day-ci/archive/20250927/202509272154.pz9xNtSw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509272154.pz9xNtSw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509272154.pz9xNtSw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/events/intel/core.c:17:
   include/linux/kvm_host.h: In function 'kvm_mem_is_private':
>> include/linux/kvm_host.h:2543:24: error: implicit declaration of function 'kvm_gmem_is_private'; did you mean 'kvm_mem_is_private'? [-Wimplicit-function-declaration]
    2543 |                 return kvm_gmem_is_private(slot, gfn);
         |                        ^~~~~~~~~~~~~~~~~~~
         |                        kvm_mem_is_private


vim +2543 include/linux/kvm_host.h

  2537	
  2538	static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
  2539	{
  2540		struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
  2541	
  2542		if (slot && kvm_memslot_is_gmem_only(slot))
> 2543			return kvm_gmem_is_private(slot, gfn);
  2544	
  2545		return kvm_get_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
  2546	}
  2547	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
