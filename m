Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DD418D63E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Aug 2024 11:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724152116; cv=none; b=AlnqAGENNqKb1c+fH6OVDYOn/wNWJXFIacyIdUpEXy23FsHsDgXCrHi/P0IQCFZfy03s5qTjIV9BwJbZSsgrJdGcwX3TrJAWNm6aCdEoCMcDOVFjcWnctb37xsw0NLtPF7Q4L4FgiQQo4bEIbah1lLonWPAGCiXB+B/IgRO5l2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724152116; c=relaxed/simple;
	bh=bV3ofQXhFF9NaGbgtgLImcWwoHEgCRbA0MYn7/vFowM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dBVNvYkv7AeWM7H2ZP3HZuJWNkmZeLRT4j9J2NpoLzOV5/XRkxg5WBWG5qylP7agTqLoPp2JOk1zoPA/8wrpuFeOlML8+CJePxX0OGrLMLx1tOvulyiYZ/OAd5G4dK1xXM1mIHT+F/QwCb62e4CYg0lVFe++nDsUEYZ5ze3rP04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8nNcxbT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8nNcxbT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724152115; x=1755688115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bV3ofQXhFF9NaGbgtgLImcWwoHEgCRbA0MYn7/vFowM=;
  b=Y8nNcxbTPJxQfn9Mx0L+J//0e78jKxqAD+S+aN1tMrgp5DtRSJpc9Cdc
   7Bb3rAAe7g8E2qQhHiuDAIkk9SngOFZ0XSenxlX9cmllZ7bk4zBzWfBOL
   KSVdXLwNbo0HFByWXua+SxO3qv8yc1j0CHKgylaQlv28ejZpCNKQJ0BEg
   VH5yB56hZVwvoplKJG07gp8zapp4OtzN+0myrEnRbl/KqKbaOWy7ufYDi
   zXZlcj5OcMFmcK5td1rBGtWC23RzhiIbl3aNWVaACvv5/S3bbxMFU9TzH
   lPkHZ1glC0Zx+SKKmz0+V4dj3ECsZxDYu074i1ZEEwoZYOBQ7034ymucv
   g==;
X-CSE-ConnectionGUID: DR4vP2poS3aKvoHwnwnH1g==
X-CSE-MsgGUID: Q3Gae4hKQ4GbsQl2nyNVxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33105670"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="33105670"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 04:08:34 -0700
X-CSE-ConnectionGUID: srfZUhgnQjK18MjUR6iLzg==
X-CSE-MsgGUID: HmMFqfMBSK+Dlk4Cf3W3jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="60659718"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Aug 2024 04:08:31 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgMiy-000A66-1P;
	Tue, 20 Aug 2024 11:08:28 +0000
Date: Tue, 20 Aug 2024 19:08:08 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 9912/9936]
 arch/x86/events/zhaoxin/uncore.c:2835:6: warning: no previous prototype for
 'kx7000_uncore_cpu_init'
Message-ID: <202408201901.AASvXub8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   304e0163925d5bb281ad9846c091c122b6cc42a9
commit: 008053bcdeaad929fa3f96b75eee49da15ab0a04 [9912/9936] perf/x86/zhaoxin/uncore: update KX-7000 support
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240820/202408201901.AASvXub8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408201901.AASvXub8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408201901.AASvXub8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/events/zhaoxin/uncore.c:2805:6: warning: no previous prototype for 'kx5000_uncore_cpu_init' [-Wmissing-prototypes]
    2805 | void kx5000_uncore_cpu_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/zhaoxin/uncore.c:2814:6: warning: no previous prototype for 'kh40000_uncore_cpu_init' [-Wmissing-prototypes]
    2814 | void kh40000_uncore_cpu_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/zhaoxin/uncore.c:2819:5: warning: no previous prototype for 'kh40000_uncore_pci_init' [-Wmissing-prototypes]
    2819 | int kh40000_uncore_pci_init(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/events/zhaoxin/uncore.c:2835:6: warning: no previous prototype for 'kx7000_uncore_cpu_init' [-Wmissing-prototypes]
    2835 | void kx7000_uncore_cpu_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/events/zhaoxin/uncore.c:2850:5: warning: no previous prototype for 'kx7000_uncore_pci_init' [-Wmissing-prototypes]
    2850 | int kx7000_uncore_pci_init(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/events/zhaoxin/uncore.c:2858:6: warning: no previous prototype for 'kx7000_uncore_mmio_init' [-Wmissing-prototypes]
    2858 | void kx7000_uncore_mmio_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/kx7000_uncore_cpu_init +2835 arch/x86/events/zhaoxin/uncore.c

  2804	
> 2805	void kx5000_uncore_cpu_init(void)
  2806	{
  2807		uncore_msr_uncores = kx5000_msr_uncores;
  2808	}
  2809	
  2810	static const struct zhaoxin_uncore_init_fun kx5000_uncore_init __initconst = {
  2811		.cpu_init = kx5000_uncore_cpu_init,
  2812	};
  2813	
> 2814	void kh40000_uncore_cpu_init(void)
  2815	{
  2816		uncore_msr_uncores = kh40000_msr_uncores;
  2817	}
  2818	
> 2819	int kh40000_uncore_pci_init(void)
  2820	{
  2821		int ret = kh40000_pci2node_map_init();/*pci_bus to package mapping, do nothing*/
  2822	
  2823		if (ret)
  2824			return ret;
  2825		uncore_pci_uncores = kh40000_pci_uncores;
  2826		uncore_pci_driver = &kh40000_uncore_pci_driver;
  2827		return 0;
  2828	}
  2829	
  2830	static const struct zhaoxin_uncore_init_fun kh40000_uncore_init __initconst = {
  2831		.cpu_init = kh40000_uncore_cpu_init,
  2832		.pci_init = kh40000_uncore_pci_init,
  2833	};
  2834	
> 2835	void kx7000_uncore_cpu_init(void)
  2836	{
  2837		u64 val;
  2838		int cpu;
  2839	
  2840		uncore_msr_uncores = kx7000_msr_uncores;
  2841	
  2842		/* clear bit 16 of MSR 0x1877 so that HIF can work normally */
  2843		for_each_present_cpu(cpu) {
  2844			rdmsrl_on_cpu(cpu, 0x1877, &val);
  2845			val = val & 0xfffffffffffeffffULL;
  2846			wrmsrl_on_cpu(cpu, 0x1877, val);
  2847		}
  2848	}
  2849	
> 2850	int kx7000_uncore_pci_init(void)
  2851	{
  2852		uncore_pci_uncores = kx7000_pci_uncores;
  2853		uncore_pci_driver = &kx7000_uncore_pci_driver;
  2854	
  2855		return 0;
  2856	}
  2857	
> 2858	void kx7000_uncore_mmio_init(void)
  2859	{
  2860		uncore_mmio_uncores = kx7000_mmio_uncores;
  2861	}
  2862	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
