Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E031D86C9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 12:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733143312; cv=none; b=DtM2xS0aKrHDERglDGan58T+94iQhG8n4EqAOZTlYhQXewtW9kjaPlJcoqdLsHrR4mBNWGM0zEvgqy3HjvFs9W4eZTvpVhkntduMbmAAtnDrhorWM8/sB/xSiImW+aeFucEGxdLabk6HeLIgPxnrXoudtGBD/+EY+m3DE1FVzCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733143312; c=relaxed/simple;
	bh=2mdQfrGjashPTkcbqoI2aUTNVHrGq9ktPYp1Aavu9UA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hIOyZktvJ3szr5U4XZkTaWn2NY+YIkv33d2HbgtGbZDFFzxn/xU7o6MI7N9qiidVkDmZiZZHsxzFoY9VUWveYE2imyudj7A1uBlI+efs4XaRiyBm2av3YMtp09KVPti8VFEcfB4iHedCm3Vd/3uLBInzgfeuiInYf2oj4VCcw7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7P4UjIs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7P4UjIs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733143311; x=1764679311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2mdQfrGjashPTkcbqoI2aUTNVHrGq9ktPYp1Aavu9UA=;
  b=e7P4UjIsyGhaezMFMRx4BIGlJiX4oBfWcyhkWVnXNwcB4N3dNhLAyXHG
   f904TjB2noWKgJxoOb+V0kFjnF7naXnbO3PaiEypp+z0UZA1UlSy3BZ2+
   IIbXQuxHCw1itbm5u7ZQ0iO7T2eN7uFjSSEM+1IeOig2gFZwzLpbAkCUD
   wdCBPP00XQme7O9JM8qXKTOOjVBQ9omqzEwH09LdWAh2rWuXsAOz3ZXh0
   H4HK5aPloaxCeZ8RNG69o4FzSqlmfa4mse2vQpxllFS6dlHITDNcW5wZH
   8BhfU7w30DYV1rv6Ksx4YgQfpwS3BZLc1+LCquRajXPSj0FtHUMOqoHix
   Q==;
X-CSE-ConnectionGUID: JqME6jcHQOqxWOarUIjW/g==
X-CSE-MsgGUID: 1INPgTrdSxy7g9hPvLOLQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43919564"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="43919564"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 04:41:50 -0800
X-CSE-ConnectionGUID: QrQvvXpnRwGR2TiAzd9LOQ==
X-CSE-MsgGUID: 4t6CzQVKQh2jdsm6Hcfo6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="116355049"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 02 Dec 2024 04:41:49 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI5kJ-0002QJ-08;
	Mon, 02 Dec 2024 12:41:47 +0000
Date: Mon, 2 Dec 2024 20:41:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474]
 arch/x86/events/zhaoxin/uncore.c:2828:6: sparse: sparse: symbol
 'kx7000_uncore_cpu_init' was not declared. Should it be static?
Message-ID: <202412022008.S6r6cz7m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9809e40d1abbcdf278f3db91f03a94507bdbb442
commit: 25fd62f6e8c9636272009dfcbe04fb1a260cbf8d [1474/1474] perf/x86/zhaoxin/uncore: update KX-7000 support
config: x86_64-randconfig-121-20241118 (https://download.01.org/0day-ci/archive/20241202/202412022008.S6r6cz7m-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412022008.S6r6cz7m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412022008.S6r6cz7m-lkp@intel.com/

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
