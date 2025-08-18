Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF5030E0FC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 09:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755510610; cv=none; b=WSzzwLRLMUnKNt2s+W0RzKwO/+4JC1fI302euxpNBnp5JmVVlaVNfPVWW2NB/jmddXJgcX1K/qi5oI/Je7ulxDN+d0Mbfg8drB0KL3bd/whomJBV5ClawFdAuXgPk3IfrrDLZk7n2O5jCvuGGd3BLbLxh2/CnODY7gn50fY7iI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755510610; c=relaxed/simple;
	bh=cDUSJUol9RA4RTCFdAQHlvCLDfkiGDc93ZJeeuzVVro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JY6SIEY3xQAHDNquNyP7bBQM3wHk3rW+RlGjtwBMqIVqXGvnK78vK36AyKFpijGoOFgLH8a2avnZhCG9tv+KPPwvp5Ja3f0WKEE1yu3OUT6t0H9Hlsdswwdu8pSQmAybEqbeqSpA1izhuMAe1og3ES/ZKCbI+mfNgzMMDUJcYbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJneJBAY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJneJBAY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755510607; x=1787046607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cDUSJUol9RA4RTCFdAQHlvCLDfkiGDc93ZJeeuzVVro=;
  b=DJneJBAYevbMj/ml5amumbatOqGNSlTRRhtaAlJojW7mz80eRn0kbu2T
   HgAUJnRpYnVm+qwB1h4QTCo41Wl9wxAjmg9QsV3uDDrLHj4rP3LT793Du
   9b7R88erEwuEc2nA5N6TuO821M0JyYMYRBJbeQRxbF4z00hgjhMVhGWiJ
   Xdy2yW/cqf0N1t+e5HXa/twBlls/U2Idmb0sFO1ReWv5x5zsn0Akbupk2
   NEfYppSjf/iBB77WCMqWnFMJI7PMX4AXmBgYm9cJEKLfSGOV4HrFuUOr8
   oIcu5DU8GwZEOlRq//UBpWhGP8Ic8dNy7CXUIYGTXcfCDjQS54UrQ4708
   A==;
X-CSE-ConnectionGUID: dpOEDOAzSTejivGl9iFtRA==
X-CSE-MsgGUID: 8iDFeXs4TKGzd99McddHAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="60353726"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="60353726"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 02:50:07 -0700
X-CSE-ConnectionGUID: UlwayW54QvmYicejOFQ2Xg==
X-CSE-MsgGUID: AjIDGltdQhOeylAEW2+7Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167927310"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 18 Aug 2025 02:50:06 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unwV9-00013z-2t;
	Mon, 18 Aug 2025 09:50:03 +0000
Date: Mon, 18 Aug 2025 11:49:03 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2687/2687]
 arch/x86/events/zhaoxin/uncore.c:2828:6: warning: no previous prototype for
 function 'kx7000_uncore_cpu_init'
Message-ID: <202508181149.ZQroekLv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi leoliu-oc,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   57dc07b15d29507022f36882532a0fe229cf2805
commit: 25fd62f6e8c9636272009dfcbe04fb1a260cbf8d [2687/2687] perf/x86/zhaoxin/uncore: update KX-7000 support
config: x86_64-buildonly-randconfig-2003-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181149.ZQroekLv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508181149.ZQroekLv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508181149.ZQroekLv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/events/zhaoxin/uncore.c:3:
   In file included from arch/x86/events/zhaoxin/uncore.h:3:
   In file included from include/linux/pci.h:1666:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2235:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   arch/x86/events/zhaoxin/uncore.c:2798:6: warning: no previous prototype for function 'kx5000_uncore_cpu_init' [-Wmissing-prototypes]
    2798 | void kx5000_uncore_cpu_init(void)
         |      ^
   arch/x86/events/zhaoxin/uncore.c:2798:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2798 | void kx5000_uncore_cpu_init(void)
         | ^
         | static 
   arch/x86/events/zhaoxin/uncore.c:2807:6: warning: no previous prototype for function 'kh40000_uncore_cpu_init' [-Wmissing-prototypes]
    2807 | void kh40000_uncore_cpu_init(void)
         |      ^
   arch/x86/events/zhaoxin/uncore.c:2807:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2807 | void kh40000_uncore_cpu_init(void)
         | ^
         | static 
   arch/x86/events/zhaoxin/uncore.c:2812:5: warning: no previous prototype for function 'kh40000_uncore_pci_init' [-Wmissing-prototypes]
    2812 | int kh40000_uncore_pci_init(void)
         |     ^
   arch/x86/events/zhaoxin/uncore.c:2812:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2812 | int kh40000_uncore_pci_init(void)
         | ^
         | static 
>> arch/x86/events/zhaoxin/uncore.c:2828:6: warning: no previous prototype for function 'kx7000_uncore_cpu_init' [-Wmissing-prototypes]
    2828 | void kx7000_uncore_cpu_init(void)
         |      ^
   arch/x86/events/zhaoxin/uncore.c:2828:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2828 | void kx7000_uncore_cpu_init(void)
         | ^
         | static 
>> arch/x86/events/zhaoxin/uncore.c:2843:5: warning: no previous prototype for function 'kx7000_uncore_pci_init' [-Wmissing-prototypes]
    2843 | int kx7000_uncore_pci_init(void)
         |     ^
   arch/x86/events/zhaoxin/uncore.c:2843:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2843 | int kx7000_uncore_pci_init(void)
         | ^
         | static 
>> arch/x86/events/zhaoxin/uncore.c:2851:6: warning: no previous prototype for function 'kx7000_uncore_mmio_init' [-Wmissing-prototypes]
    2851 | void kx7000_uncore_mmio_init(void)
         |      ^
   arch/x86/events/zhaoxin/uncore.c:2851:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2851 | void kx7000_uncore_mmio_init(void)
         | ^
         | static 
   7 warnings generated.


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
