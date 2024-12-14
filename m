Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CDBBA27
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 01:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734139908; cv=none; b=pqLeXUQuVSIhpBwF2sSWD3GUJ5ZzSL1QNNjbWXFfrJ55HtPw+u/HxjcUfmb619Kxw4DQHzwC9O3qRb/FkNdJyPQ2tiYwBMiXtV2Q7+hZd22WVTFHHcJGgfaxo4uXES66lFFejDfYOZsHmZBokn8TDGSEr0Rh4PNlQqEHvQuH8/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734139908; c=relaxed/simple;
	bh=jQnmicTEfgyzIQqPD9oydE7wU7cYY1boV40aKZDOCY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N5E2soGjYdGSxaWIjKgfcAqU3EJCeOsie9YHTGQ9h2WWemDWBpGPdpBRDEx5IuNI4KhNH/KET1ruuOv05jKtqwGlcqhzLesYsqRsoH74xFrMmThA5ACXebASIhPPlpTmoICPE0ZCsj70xtiFkrjD7QYuoGIFoPq8/4LhQ1ha9Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OytHf9/x; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OytHf9/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734139906; x=1765675906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jQnmicTEfgyzIQqPD9oydE7wU7cYY1boV40aKZDOCY8=;
  b=OytHf9/xdZwJ2b/K/nWJtCF/Q1wbMm3YvbjpWqOay9e5NutjriWnWfmF
   Kr68m2s8kPgESg7DB58ilS9NwKiQ0nmDgR/ADmT3TGtXMaWblDCAqo/iF
   2QQYkWSM0FWe11+CRNocTMROzdmcIRqqmNYk9/YKE6wCUTphpuLwN0omg
   hKRcV4VhFSOG5EURF623hy9HpywXOUflPlbShuwjQwvwbjDfZ0kqdi237
   OkDJeV/zI3Qh+MxWxPzdenzaoAxCUFNn1JbXbfrgp7BV4NuJl+T87HM1W
   Ai1Fer0zETCes1t1naJ+WmuLSiyZDE9UcLQJA4QGfbmArQ/1kOT7HhDCG
   w==;
X-CSE-ConnectionGUID: twZl3RRZQJ+nR+ksMkQqig==
X-CSE-MsgGUID: 58mdYWAVSbOcBF4N3e9FUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45089130"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45089130"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 17:31:43 -0800
X-CSE-ConnectionGUID: ZuZz2nQpQF6B3CcOHKlSVA==
X-CSE-MsgGUID: ayA99VayRoWkFGsnD/zXrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="97098031"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Dec 2024 17:31:41 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMH0M-000CcF-2W;
	Sat, 14 Dec 2024 01:31:38 +0000
Date: Sat, 14 Dec 2024 09:31:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, QIU ZHITENG <qiuzhiteng@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1636/1636] arch/x86/kernel/cpu/hygon.c:480:6:
 warning: no previous prototype for function 'set_c86_features_para_invalid'
Message-ID: <202412140911.UsV56v7f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d68dc6ee371ec5466be9b2d76bdca0b360940adc
commit: 48fb9af1d04848a2583b2dbf3b7091eca38dd482 [1636/1636] mm: Enhanced copy capabilities for Hygon processor
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241214/202412140911.UsV56v7f-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412140911.UsV56v7f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412140911.UsV56v7f-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/hygon.c:480:6: warning: no previous prototype for function 'set_c86_features_para_invalid' [-Wmissing-prototypes]
     480 | void set_c86_features_para_invalid(void)
         |      ^
   arch/x86/kernel/cpu/hygon.c:480:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     480 | void set_c86_features_para_invalid(void)
         | ^
         | static 
>> arch/x86/kernel/cpu/hygon.c:485:14: warning: no previous prototype for function 'get_nt_block_copy_mini_len' [-Wmissing-prototypes]
     485 | unsigned int get_nt_block_copy_mini_len(void)
         |              ^
   arch/x86/kernel/cpu/hygon.c:485:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     485 | unsigned int get_nt_block_copy_mini_len(void)
         | ^
         | static 
   2 warnings generated.
--
   In file included from arch/x86/kernel/fpu/core.c:14:
   In file included from arch/x86/include/asm/traps.h:6:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2242:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/fpu/core.c:466:14: warning: no previous prototype for function 'get_fpustate_free_space' [-Wmissing-prototypes]
     466 | unsigned int get_fpustate_free_space(struct fpu *fpu)
         |              ^
   arch/x86/kernel/fpu/core.c:466:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     466 | unsigned int get_fpustate_free_space(struct fpu *fpu)
         | ^
         | static 
   6 warnings generated.


vim +/set_c86_features_para_invalid +480 arch/x86/kernel/cpu/hygon.c

   479	
 > 480	void set_c86_features_para_invalid(void)
   481	{
   482		memset((void *)&hygon_c86_data, 0, sizeof(struct hygon_c86_info));
   483	}
   484	
 > 485	unsigned int get_nt_block_copy_mini_len(void)
   486	{
   487		unsigned int mini_len = hygon_c86_data.nt_cpy_mini_len;
   488	
   489		return mini_len;
   490	}
   491	EXPORT_SYMBOL_GPL(get_nt_block_copy_mini_len);
   492	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
