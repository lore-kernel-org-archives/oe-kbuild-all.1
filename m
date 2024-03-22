Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B2D5FB81
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Mar 2024 17:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711127797; cv=none; b=KCBet5wZ1Zrg9HX7q/gglhq3iTlx0IfVw3++qGrPNyy0D6T+dk9/93cpqocbuwOp7x6B3SRz5qhbQDOYJE359WUkXObW0T5t8MzOVbqfYaGPsAtgAvQbvydsMCs13fzOqrlyqnt6Exu23N/hMjXdnXoURVAO9bvUq0dF5J0DK2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711127797; c=relaxed/simple;
	bh=2KdXe/3w6ZAWCW1jDxkteZc9ZxXVZC6NpGyLh+xfh+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PosQr/0ka+LscfuYdvT3BnQNiSgPT3y9VEAfGw3ub9mglainBBm52rOtBmQxSFdTNwE5u0uQFYaBK98HXbKb8t69RGbfV8j7+ZIwTdSmqxKFEJDSD8Whh3PRRY2OwHYJcFY/KS3NeJbipo7EVTH8ywa5h04gOOHP2Sv+ra8F+K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eYaWxVGO; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eYaWxVGO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711127795; x=1742663795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2KdXe/3w6ZAWCW1jDxkteZc9ZxXVZC6NpGyLh+xfh+w=;
  b=eYaWxVGOslYISjCKB4ZIAziNbVGONR6b9emKHL4hRKVqekr7oEpe4VD/
   lso8OGvlIktG+iyR7eWB0YRrkdRhVKe1nrc7HPAzJUdKYZFwsB3FXwr57
   7b3zbsrPzjVu2BK8wgvcmbjq2HchxzTXkYIRNC6lk+plvhlpdYMhjF64P
   EH67lS849J/ak5uFg/eGoz272MKqJwkHLKcJ/WTqOAqtw7JUNIkZnysY+
   IFH9SbizVCq5B9otaBDaWve/oUBnAl0pa+erlEb0tWcO+MkYr1Tjs92q7
   /8Z4l4DGq4pGm0wSjkBJCQ5OuWrs6k5RwOm9/aRiWwte8cIC7ahb+3z5A
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="23680165"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="23680165"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 10:16:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="19667971"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Mar 2024 10:16:31 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rniVI-000KTP-1Y;
	Fri, 22 Mar 2024 17:16:28 +0000
Date: Sat, 23 Mar 2024 01:16:17 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 4603/4615]
 arch/x86/events/zhaoxin/uncore.c:2762:6: warning: no previous prototype for
 'kx5000_uncore_cpu_init'
Message-ID: <202403230148.cjnzHHGA-lkp@intel.com>
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
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240323/202403230148.cjnzHHGA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403230148.cjnzHHGA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403230148.cjnzHHGA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/events/zhaoxin/uncore.c:2762:6: warning: no previous prototype for 'kx5000_uncore_cpu_init' [-Wmissing-prototypes]
    2762 | void kx5000_uncore_cpu_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/events/zhaoxin/uncore.c:2771:6: warning: no previous prototype for 'kh40000_uncore_cpu_init' [-Wmissing-prototypes]
    2771 | void kh40000_uncore_cpu_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/events/zhaoxin/uncore.c:2776:5: warning: no previous prototype for 'kh40000_uncore_pci_init' [-Wmissing-prototypes]
    2776 | int kh40000_uncore_pci_init(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/events/zhaoxin/uncore.c:2792:6: warning: no previous prototype for 'kx8000_uncore_cpu_init' [-Wmissing-prototypes]
    2792 | void kx8000_uncore_cpu_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/events/zhaoxin/uncore.c:2797:5: warning: no previous prototype for 'kx8000_uncore_pci_init' [-Wmissing-prototypes]
    2797 | int kx8000_uncore_pci_init(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/events/zhaoxin/uncore.c:2805:6: warning: no previous prototype for 'kx8000_uncore_mmio_init' [-Wmissing-prototypes]
    2805 | void kx8000_uncore_mmio_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~


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
