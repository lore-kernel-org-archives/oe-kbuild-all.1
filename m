Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDE91D4337
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 22:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731017796; cv=none; b=eKNJ0gDmQgB14TKzV3LTyAYkEZqpHOAubGn40rX6+L7TXmpb5H4yQJzpFehx5TJwbmPE0l4x86usg3x/3uP6XRfLCkQ8WXEnm0zhNfjFzCMXqnpQX24sDvWc3wwi46Xh8HVWyZkSPwCRwjq+twMPU+lwHTCl8YLGDbISvvg9gA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731017796; c=relaxed/simple;
	bh=1utf0p32zAmm7nLv9sS2ZD186hfheynECG2twpLzuW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kpb+JXw9WhSf9TWEf4KokKy+hGaMoqEbaBpbm+5uYGzXZSXjb1cryAW0naB+zHBQVOFb4KlgWEsC/nfus7Su/sfluoCtKylctBWSK1Zg9V1kGMEjyWgiaYY8pPs9i9WaU5wuG2dO+vIN5A9DiX2jEZJdR+F9bep/Th5nTZSm/Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEQduWFP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEQduWFP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731017795; x=1762553795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1utf0p32zAmm7nLv9sS2ZD186hfheynECG2twpLzuW8=;
  b=aEQduWFP4pb0saSmTN+zLfciS17RoQB9zvL04j9PpNKcuStycRmDdHUm
   nPgszuyVJDxrnAKjE1cq0wkWZWIBTBpDcRUm9yVp2WGVC441kSK/Og6qP
   Z7lhls5CUXfwWQx3QiA/GGKy6T2SYRAM/4cTCiKw0iw0gJLpQ+3AiZoG0
   3YesTl9EDcO6/m3tNmW6Ytv/aQav5780UYCCXok+6rn6IXdt6YdVmeuEP
   1ARQ98UBnWsk3TP8p1z6Ob3W8ZonsdPeyuFD5uoz++XvZIQBUAhRAqDsD
   GrUaMxSV4nkE3Loj49Jvrx4k/9tEXd55zRxkGH4ZpgaNEBoNMl4DXH83W
   w==;
X-CSE-ConnectionGUID: g5k5T8DoQTCn/jKNbyKK8g==
X-CSE-MsgGUID: yOMlwOB7SvaTrtHx3sS4Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="41506916"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="41506916"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 14:16:34 -0800
X-CSE-ConnectionGUID: nrNC/RabSn2IyBnxgjd/5Q==
X-CSE-MsgGUID: RwUDHvSARdemCf07+gfjiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="89204463"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Nov 2024 14:16:33 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9Ann-000qig-04;
	Thu, 07 Nov 2024 22:16:31 +0000
Date: Fri, 8 Nov 2024 06:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 21144/30000] arch/arm64/kvm/reset.c:102:34:
 error: implicit declaration of function 'sve_max_virtualisable_vl'
Message-ID: <202411080635.2RiYCRd1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b96ea10d92add994f978118c6e3280a03a1daaf1
commit: 68da302c8ae30331c8917f1dc7b0f1682f696d71 [21144/30000] arm64/sve: Put system wide vector length information into structs
config: arm64-randconfig-004-20241108 (https://download.01.org/0day-ci/archive/20241108/202411080635.2RiYCRd1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411080635.2RiYCRd1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411080635.2RiYCRd1-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/reset.c: In function 'kvm_arm_init_sve':
>> arch/arm64/kvm/reset.c:102:34: error: implicit declaration of function 'sve_max_virtualisable_vl' [-Werror=implicit-function-declaration]
     102 |                 kvm_sve_max_vl = sve_max_virtualisable_vl();
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/sve_max_virtualisable_vl +102 arch/arm64/kvm/reset.c

    98	
    99	int kvm_arm_init_sve(void)
   100	{
   101		if (system_supports_sve()) {
 > 102			kvm_sve_max_vl = sve_max_virtualisable_vl();
   103	
   104			/*
   105			 * The get_sve_reg()/set_sve_reg() ioctl interface will need
   106			 * to be extended with multiple register slice support in
   107			 * order to support vector lengths greater than
   108			 * SVE_VL_ARCH_MAX:
   109			 */
   110			if (WARN_ON(kvm_sve_max_vl > SVE_VL_ARCH_MAX))
   111				kvm_sve_max_vl = SVE_VL_ARCH_MAX;
   112	
   113			/*
   114			 * Don't even try to make use of vector lengths that
   115			 * aren't available on all CPUs, for now:
   116			 */
   117			if (kvm_sve_max_vl < sve_max_vl())
   118				pr_warn("KVM: SVE vector length for guests limited to %u bytes\n",
   119					kvm_sve_max_vl);
   120		}
   121	
   122		return 0;
   123	}
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
