Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5727A703
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Mar 2024 19:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711135840; cv=none; b=a4R1ubm2YIw4KwJ8cZG6KOUeuMS76UMbgCIopb7ISMkff8pi1wlOwAGOCCQMFLea91+4dtMNZydaJG4KiCLkspcZEGJnMvLkbszEIZgx5ePJFnhjz+XzXFHrfBLm9IgiGY4K4z5Jqo22k3RQoxeAlBhfonaNHvtAQZno88OL9xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711135840; c=relaxed/simple;
	bh=rGc4QeczFy9NpBIFxCz9dp+BYc/j1hTe9V0YafGBOVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YPuJMGlrJ4u3tgt6/GxQyF2yt7mTSFyghUDsShBVSm8b19F423V0iRT+JywzzcXzdM1bJGippoMjDBYS/FWdrkE06Rv+VxZGTfyG36cwrvs0K9rpWtnp4EdFCDkMGIxTlAHkqg6ABEAEzOVRLbVbLiO5OgHEjUh24DIabNdsI4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rdf+U+A+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rdf+U+A+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711135839; x=1742671839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rGc4QeczFy9NpBIFxCz9dp+BYc/j1hTe9V0YafGBOVU=;
  b=Rdf+U+A+Tcr+kuJIgIiSxpKFcUJoBJvfiz3xMrxaaWhooAGEdmVuxdeO
   jdRzWBbR9Ab8bytKVlBs2lSaCYdJ6w4c1qNrwFQBee21totE+mHX5xPCz
   jui+gXXkT7iUee6xt0TKqHYMtioVJWrIm8DVFAQ9UeTmXUdMXLIyFKK4I
   /N3dC6OOtc5wuKys4bI/2NThchfgi4ukuESHiXX6sBgxiYKFXRSUj/m7L
   TUv4adayW6w09tYqALCp4q+zUXZ8xCsqSv6HhqQjKQHyKmqT04USAJIzg
   opirYFRYaSa8VYNC2aBG5+77HP7CwQhuzswlddteu14Km/2n6Hclu0pXn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9990146"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="9990146"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 12:30:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="19696594"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Mar 2024 12:30:35 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnkb2-000KZ5-1s;
	Fri, 22 Mar 2024 19:30:32 +0000
Date: Sat, 23 Mar 2024 03:30:30 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 4603/4615]
 arch/x86/events/zhaoxin/uncore.c:2762:6: warning: no previous prototype for
 function 'kx5000_uncore_cpu_init'
Message-ID: <202403230331.vepgSQDo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   e0ee18f8b8228a1b9598534057943383c2ed23a5
commit: 706da336689b0e28091e742d5dbc3640f33d51c4 [4603/4615] x86/perf: Add PMU uncore support for Zhaoxin CPU
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240323/202403230331.vepgSQDo-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403230331.vepgSQDo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403230331.vepgSQDo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/events/zhaoxin/uncore.c:2762:6: warning: no previous prototype for function 'kx5000_uncore_cpu_init' [-Wmissing-prototypes]
    2762 | void kx5000_uncore_cpu_init(void)
         |      ^
   arch/x86/events/zhaoxin/uncore.c:2762:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2762 | void kx5000_uncore_cpu_init(void)
         | ^
         | static 
>> arch/x86/events/zhaoxin/uncore.c:2771:6: warning: no previous prototype for function 'kh40000_uncore_cpu_init' [-Wmissing-prototypes]
    2771 | void kh40000_uncore_cpu_init(void)
         |      ^
   arch/x86/events/zhaoxin/uncore.c:2771:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2771 | void kh40000_uncore_cpu_init(void)
         | ^
         | static 
>> arch/x86/events/zhaoxin/uncore.c:2776:5: warning: no previous prototype for function 'kh40000_uncore_pci_init' [-Wmissing-prototypes]
    2776 | int kh40000_uncore_pci_init(void)
         |     ^
   arch/x86/events/zhaoxin/uncore.c:2776:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2776 | int kh40000_uncore_pci_init(void)
         | ^
         | static 
>> arch/x86/events/zhaoxin/uncore.c:2792:6: warning: no previous prototype for function 'kx8000_uncore_cpu_init' [-Wmissing-prototypes]
    2792 | void kx8000_uncore_cpu_init(void)
         |      ^
   arch/x86/events/zhaoxin/uncore.c:2792:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2792 | void kx8000_uncore_cpu_init(void)
         | ^
         | static 
>> arch/x86/events/zhaoxin/uncore.c:2797:5: warning: no previous prototype for function 'kx8000_uncore_pci_init' [-Wmissing-prototypes]
    2797 | int kx8000_uncore_pci_init(void)
         |     ^
   arch/x86/events/zhaoxin/uncore.c:2797:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2797 | int kx8000_uncore_pci_init(void)
         | ^
         | static 
>> arch/x86/events/zhaoxin/uncore.c:2805:6: warning: no previous prototype for function 'kx8000_uncore_mmio_init' [-Wmissing-prototypes]
    2805 | void kx8000_uncore_mmio_init(void)
         |      ^
   arch/x86/events/zhaoxin/uncore.c:2805:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2805 | void kx8000_uncore_mmio_init(void)
         | ^
         | static 
   6 warnings generated.


vim +/kx5000_uncore_cpu_init +2762 arch/x86/events/zhaoxin/uncore.c

  2761	
> 2762	void kx5000_uncore_cpu_init(void)
  2763	{
  2764		uncore_msr_uncores = kx5000_msr_uncores;
  2765	}
  2766	
  2767	static const struct zhaoxin_uncore_init_fun kx5000_uncore_init __initconst = {
  2768		.cpu_init = kx5000_uncore_cpu_init,
  2769	};
  2770	
> 2771	void kh40000_uncore_cpu_init(void)
  2772	{
  2773		uncore_msr_uncores = kh40000_msr_uncores;
  2774	}
  2775	
> 2776	int kh40000_uncore_pci_init(void)
  2777	{
  2778		int ret = kh40000_pci2node_map_init();/*pci_bus to package mapping, do nothing*/
  2779	
  2780		if (ret)
  2781			return ret;
  2782		uncore_pci_uncores = kh40000_pci_uncores;
  2783		uncore_pci_driver = &kh40000_uncore_pci_driver;
  2784		return 0;
  2785	}
  2786	
  2787	static const struct zhaoxin_uncore_init_fun kh40000_uncore_init __initconst = {
  2788		.cpu_init = kh40000_uncore_cpu_init,
  2789		.pci_init = kh40000_uncore_pci_init,
  2790	};
  2791	
> 2792	void kx8000_uncore_cpu_init(void)
  2793	{
  2794		uncore_msr_uncores = kx8000_msr_uncores;
  2795	}
  2796	
> 2797	int kx8000_uncore_pci_init(void)
  2798	{
  2799		uncore_pci_uncores = kx8000_pci_uncores;
  2800		uncore_pci_driver = &kx8000_uncore_pci_driver;
  2801	
  2802		return 0;
  2803	}
  2804	
> 2805	void kx8000_uncore_mmio_init(void)
  2806	{
  2807		uncore_mmio_uncores = kx8000_mmio_uncores;
  2808	}
  2809	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
