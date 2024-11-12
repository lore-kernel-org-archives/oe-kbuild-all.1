Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0C0158848
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 13:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731418092; cv=none; b=Ypt9tihSt2Vy7UzhHKsYgPenTmclfs5WwBZBUfMO3RjUIshsjrdi9hXLLdBxgM01245VRUlnEYtTAG7kUFZG81XZ0JWGTGiDxwOoi7x756GPfZzt5KbU5FngI0fQ6LagMb4fL4YKvVdscJi0Hb4TXxEL462i5ew+GAD6WL0JTtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731418092; c=relaxed/simple;
	bh=aLN8PauX162laYD9OWYkmXzejflBkN4IXR/tHq7hTl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uJzVFZATaZzveiHADA6/uiQiYgr8B0rz4fEkLvH9X9M/Tgsq7CWz2AxRNP9Ab5yzDwi5WIetkKdCrpiapKJL5GGq61FE59Nj6ELEiAFaeLOVvZHMhQR6FoElCo91W4t6WGrgSn7QJYLFac/zxEc9Owkrud1Or6TT5wc0i+w/254=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXRFErbx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXRFErbx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731418090; x=1762954090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aLN8PauX162laYD9OWYkmXzejflBkN4IXR/tHq7hTl0=;
  b=fXRFErbxalvq4Soin7ZTw/S5/WlwExo+xTpjGwTGPR7xeqVq98jjdoCq
   Q/CObinsrhP5Y0rXswFFYkTOzXl5Ux4w0Pi9pSTDszkvILAq0nBd6aiLp
   lzYoE9PTlzKmTqvilmJD1UTnWhjyKNRZB0O7jDTvDUv/F/ejp9TJ/GJYj
   wiBh2cBu3mSf+mNUQcmluAwaG/NzevjHFbHyi4bmqrLvlT4dkzC1eOl+T
   ph60gcyaI0HAI9I6n/IKGooZSZ9bn9RH4lPktaJTWn2GVGSP6xlk6vt9i
   rvWCylkkJJoFYDDNHjy1xQo0cxhEAqUuGvmqwWpVDoI+aVarDAeAloKKn
   Q==;
X-CSE-ConnectionGUID: dqpbOEsJRnWAKtd958Qnyg==
X-CSE-MsgGUID: DqEug9ttQL6Nj7sLPheLjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="48762201"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="48762201"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 05:28:08 -0800
X-CSE-ConnectionGUID: JZjlO/0TSrW4v1tzgZDWSQ==
X-CSE-MsgGUID: cMc+M4onR+qJQdVZ5ZUrsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="87415183"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Nov 2024 05:28:07 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAqw8-0001LR-0B;
	Tue, 12 Nov 2024 13:28:04 +0000
Date: Tue, 12 Nov 2024 21:28:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2024-08 3294/30000]
 arch/arm64/kvm/arm.c:1906:6: warning: no previous prototype for
 '_kvm_host_prot_finalize'
Message-ID: <202411122156.AWBnOeU2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Quentin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10-2024-08
head:   8ccaede74b66d523bf70436de9736037048f90d3
commit: 68bd98a28aa622358c73420792329221c86fbe0c [3294/30000] FROMLIST: KVM: arm64: Wrap the host with a stage 2
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241112/202411122156.AWBnOeU2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411122156.AWBnOeU2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411122156.AWBnOeU2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/arm.c:1906:6: warning: no previous prototype for '_kvm_host_prot_finalize' [-Wmissing-prototypes]
    1906 | void _kvm_host_prot_finalize(void *discard)
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/_kvm_host_prot_finalize +1906 arch/arm64/kvm/arm.c

  1905	
> 1906	void _kvm_host_prot_finalize(void *discard)
  1907	{
  1908		WARN_ON(kvm_call_hyp_nvhe(__pkvm_prot_finalize));
  1909	}
  1910	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
