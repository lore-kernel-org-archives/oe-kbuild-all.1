Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1024E343D71
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 15:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764949803; cv=none; b=PqGRh6uVTQOcv8WLoV63dJeyqiQAno/p+6AKSiqtVscYX7EcVpMlSCCKzkJF0yw0e/YiaxUPNTYemk6XqTKWsDZm+Mk9keY/5o7E5TLrAtRkO/OBy0eTLyPcJRpqY/NJs3XfL0FRRJyfKlUzGzjhz9EB72uelEw8yPTZLexLaS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764949803; c=relaxed/simple;
	bh=OCeTsiRfBmKs1la9f2Jq1lew9AL/APQ2LhOXqWShx+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KeF3+2ZjhZDOAQbPdNEFXyXcN0wqkE3LHpanRDv6n1/rv9UmKrmY9Ft+GjXvHPY8oOgPabYWJ25qY3xoc04fgUTP2dfQnANC/vSShpR5Evz4QElOHvNsNTHtXTWBzarMTALJiakZyy+XJmK0o6kGEhH/n0m9JMY3Miqjdig+AYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivB67hWo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivB67hWo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764949799; x=1796485799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OCeTsiRfBmKs1la9f2Jq1lew9AL/APQ2LhOXqWShx+4=;
  b=ivB67hWoxlUch0mvAzvAiwkDq3b64KjZHIsZHGV81J4i4PhAneKmFCc/
   lUk0lh+OkeHua1NMbnra3R8theOcPJCcQVH/1+L+iirnMxAwjQBFLM+yR
   TiANWIAUaJr8UczQopGulTUwls34MSkDRL1XBQ9lZQxcGkrg/WYEhEp2S
   SikCrtn957EpikzMvz83nu+El3ndEVpMKE8pCAPpZGfMFQ+rGAman+TgL
   p3W6VHUQw/8ZYeGNSGNRNmzwkdeg/XH+VmI2KGY1fWZLa63DT7VH/d+QK
   r97VcUN+wKAmOf8zKlzaIbWX8zXYTGrLBlwMJVafIExysjrUJSRaRcBA1
   Q==;
X-CSE-ConnectionGUID: wO7fJcNdTUSF4eQv2kATeQ==
X-CSE-MsgGUID: eRoAcMl6T2q5BhSR7MVxWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66174233"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="66174233"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 07:49:55 -0800
X-CSE-ConnectionGUID: GaDzKRxsS0ap7p/NLkV18Q==
X-CSE-MsgGUID: At7ck+0yRlqjlB0GYVg7gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="196111559"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Dec 2025 07:49:54 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRY47-00000000F9V-3siY;
	Fri, 05 Dec 2025 15:49:51 +0000
Date: Fri, 5 Dec 2025 23:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3382/3382] mm/mem_reliable.c:430:2: error:
 implicit declaration of function 'mem_reliable_ctrl_bit_disable'; did you
 mean 'mem_reliable_ctrl_bit_disabled'?
Message-ID: <202512052303.PrP6S3Hw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ma,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   06a8b520851290347ca458d4335bebc607fe3b58
commit: 2525d04c6308006b789564ed955081602727f38f [3382/3382] mm: Introduce proc interface to disable memory reliable features
config: arm64-randconfig-r122-20251205 (https://download.01.org/0day-ci/archive/20251205/202512052303.PrP6S3Hw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512052303.PrP6S3Hw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512052303.PrP6S3Hw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/mem_reliable.c: In function 'mem_reliable_feature_disable':
>> mm/mem_reliable.c:430:2: error: implicit declaration of function 'mem_reliable_ctrl_bit_disable'; did you mean 'mem_reliable_ctrl_bit_disabled'? [-Werror=implicit-function-declaration]
     mem_reliable_ctrl_bit_disable(idx);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     mem_reliable_ctrl_bit_disabled
   At top level:
>> mm/mem_reliable.c:405:13: warning: 'mem_reliable_ctrl_bit_disabled' defined but not used [-Wunused-function]
    static void mem_reliable_ctrl_bit_disabled(int idx) {}
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_IOV
   Depends on [n]: PCI [=n]
   Selected by [y]:
   - CRYPTO_DEV_HISI_MIGRATION [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && ARM64 [=y] && ACPI [=y]


vim +430 mm/mem_reliable.c

   387	
   388	static int __init reliable_sysctl_init(void)
   389	{
   390		if (!mem_reliable_is_enabled())
   391			return 0;
   392	
   393		if (!register_sysctl_table(reliable_dir_table)) {
   394			pr_err("register sysctl failed.");
   395			return -ENOMEM;
   396		}
   397	
   398		percpu_counter_init(&pagecache_reliable_pages, 0, GFP_KERNEL);
   399		percpu_counter_init(&anon_reliable_pages, 0, GFP_KERNEL);
   400	
   401		return 0;
   402	}
   403	arch_initcall(reliable_sysctl_init);
   404	#else
 > 405	static void mem_reliable_ctrl_bit_disabled(int idx) {}
   406	#endif
   407	
   408	static void mem_reliable_feature_disable(int idx)
   409	{
   410		char *str = NULL;
   411	
   412		switch (idx) {
   413		case MEM_RELIABLE_FALLBACK:
   414			reliable_allow_fallback = false;
   415			str = "fallback";
   416			break;
   417		case MEM_RELIABLE_SHMEM:
   418			shmem_reliable = false;
   419			str = "shmem";
   420			break;
   421		case MEM_RELIABLE_PAGECACHE:
   422			pagecache_use_reliable_mem = false;
   423			str = "pagecache";
   424			break;
   425		default:
   426			pr_err("unknown index: %d", idx);
   427			return;
   428		}
   429	
 > 430		mem_reliable_ctrl_bit_disable(idx);
   431		pr_info("%s is disabled\n", str);
   432	}
   433	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
