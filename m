Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DB413E03E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 16:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732119495; cv=none; b=cnFXLEBYcXjwXqL/1dRimpDjR8GyNdGdWqHY2VG3v6AElTqO/7Tlgg1f/UfNJ0xiK7XPzKD+aQEZ0oNNL4yiQIJiAhzHd6YhKS3XOSbjNinOgoxg8lPGiCTzKhZr8VYerNY6oxvmmVeVwbDP88mJujw97mXN/CmFrqqFQXVbu0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732119495; c=relaxed/simple;
	bh=FcSjwVVKkfXc1XaUbPb+d/cmu+ETwLNSviqNFKrk6U4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G+t1zVnHELVlgU2qPEO/vGv3Jzg614nWOvQezPn99+WRRADah1nTVs7bQXvus67/pG8m8fGXW+O0sVuPrlXP2eNYsFep9yxojOMiS1U2534DdLS24goR6j3jEC1NdWTXM/NN9fWHnJWuP/lZxbjtsYbQ1c+5eMKGpLv2m7DZg8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7JPCPnn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7JPCPnn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732119493; x=1763655493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FcSjwVVKkfXc1XaUbPb+d/cmu+ETwLNSviqNFKrk6U4=;
  b=O7JPCPnnid0ApC2IFhgArla/PUw/hqLePB72en/kSKOgWCM8Pld6Cjjb
   jGtza5WDRggkAvuRJu0fEfnS6K2Ac13HJSAPUaaPII4U1R3xp+23YvwIY
   gsW1mvdvuloR6LrkfnSPiR9vSWjK53liP0ymyJkZASRY+4md99KMek6vG
   ePq0Aj8T9mZbcZXVhblmudC1IQM0Hj50SNDG2QH/JbV1K77xEtn3y0uZ6
   tVO29Vbgj86tQ0jSIUfdhSez5K2cyAa4/hPjnLVD10fkkfVMYDcXfJnHy
   YEuFaknpOTU3IelQ93epl4SiOGCL5uGpGtngFwo6nf/2ipWIBLpEjvS9p
   g==;
X-CSE-ConnectionGUID: TagQFipTSFeM1IvKIn46VA==
X-CSE-MsgGUID: EVgPynz8SlWei5xDelgCyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="31558910"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="31558910"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 08:18:13 -0800
X-CSE-ConnectionGUID: J1JSUNQiS2+onQMIK5imRA==
X-CSE-MsgGUID: efiGPqEgQHqqa6a4LJw0kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="89777947"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Nov 2024 08:18:10 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDnP5-00010F-2d;
	Wed, 20 Nov 2024 16:18:07 +0000
Date: Thu, 21 Nov 2024 00:17:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474]
 arch/x86/events/zhaoxin/uncore.c:2828:6: sparse: sparse: symbol
 'kx7000_uncore_cpu_init' was not declared. Should it be static?
Message-ID: <202411210004.SQKwK1XS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cce003012298a00277187319a2527882a18278c1
commit: 25fd62f6e8c9636272009dfcbe04fb1a260cbf8d [1474/1474] perf/x86/zhaoxin/uncore: update KX-7000 support
config: x86_64-randconfig-121-20241118 (https://download.01.org/0day-ci/archive/20241121/202411210004.SQKwK1XS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411210004.SQKwK1XS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411210004.SQKwK1XS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/events/zhaoxin/uncore.c:2426:28: sparse: sparse: symbol 'uncore_msr_cluster_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2431:28: sparse: sparse: symbol 'uncore_msr_subnode_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2437:28: sparse: sparse: symbol 'uncore_pci_subnode_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2798:6: sparse: sparse: symbol 'kx5000_uncore_cpu_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2807:6: sparse: sparse: symbol 'kh40000_uncore_cpu_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2812:5: sparse: sparse: symbol 'kh40000_uncore_pci_init' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2828:6: sparse: sparse: symbol 'kx7000_uncore_cpu_init' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2843:5: sparse: sparse: symbol 'kx7000_uncore_pci_init' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2851:6: sparse: sparse: symbol 'kx7000_uncore_mmio_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/kx7000_uncore_cpu_init +2828 arch/x86/events/zhaoxin/uncore.c

  2827	
> 2828	void kx7000_uncore_cpu_init(void)
  2829	{
  2830		u64 val;
  2831		int cpu;
  2832	
  2833		uncore_msr_uncores = kx7000_msr_uncores;
  2834	
  2835		/* clear bit 16 of MSR 0x1877 so that HIF can work normally */
  2836		for_each_present_cpu(cpu) {
  2837			rdmsrl_on_cpu(cpu, 0x1877, &val);
  2838			val = val & 0xfffffffffffeffffULL;
  2839			wrmsrl_on_cpu(cpu, 0x1877, val);
  2840		}
  2841	}
  2842	
> 2843	int kx7000_uncore_pci_init(void)
  2844	{
  2845		uncore_pci_uncores = kx7000_pci_uncores;
  2846		uncore_pci_driver = &kx7000_uncore_pci_driver;
  2847	
  2848		return 0;
  2849	}
  2850	
> 2851	void kx7000_uncore_mmio_init(void)
  2852	{
  2853		uncore_mmio_uncores = kx7000_mmio_uncores;
  2854	}
  2855	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
