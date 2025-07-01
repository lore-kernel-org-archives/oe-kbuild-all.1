Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01671AA1DB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 15:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751384626; cv=none; b=a3vDVQZdXl66ytKW50/c0WPj6vX14aKY5dpAmqbEsBiaox3qVqpM7wyOwD5hegHbXYeZh6BaHv+jRCTkQ9z7Wg6CqNvBTmLwiKlsBmPr87SluMBGZThGj7X+SR2bf9ZpQ2tVfM47ryzueeGSToyeTTSqDFZouo5wuhkGViAeQM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751384626; c=relaxed/simple;
	bh=XQbRTvcoNjF9/a5iVSW/AiP717uXqVF8WvG4zlGiDJI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mPCGtLG4Qc56reXzXuaLrERtGzMSoS3lOdgcsWSOTGu9Z0qguLuLVWmHorXEfrqpt7u+GWIGQSlYijIZbHdAThvJ/VSsVyf/uqzuQ+IVqLsYvW7p7/E7CQsNW7nddDqRbfLdjV/CkvkozlD80UZBI9F5zM5GJgdr8+hIXAm+RBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrJXdgK/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrJXdgK/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751384625; x=1782920625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XQbRTvcoNjF9/a5iVSW/AiP717uXqVF8WvG4zlGiDJI=;
  b=WrJXdgK/kjOuGmVNHC25jl9S+OLqNYw7iv9Q42Qu78GoAmB2E+erE3Ye
   uTq4nUefc3KKm2H7xuFVkuLL5e0X+NLSx3fGRZfLYB1dpOQ3fEegHHgcs
   80nRUQlb3wldOyahG/IwgIs2AAwxpMg9VbJ8hFyocVvB0Dk1WzZ8LYAe3
   GqRV8arlJYGlGHWHJcHwP8tpWnP/1m5XSYCT8dmf3yKpz5JtnJjArBf2c
   38pFQ/ChzzkWGc0CKDA9Ih8ymIpawc3SgmOrHjKGaelecU21HBWBAS2Hp
   DxVne1VMFhkJ9+KVgJ590SubKDotzZNuu5U70kv7JlFKLlEmZ4WUKhT8R
   A==;
X-CSE-ConnectionGUID: mCw0wn84Q2yw2XoF8dh9Sw==
X-CSE-MsgGUID: zc/pb3sWQgmnPxraXUBF0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53593346"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53593346"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 08:43:43 -0700
X-CSE-ConnectionGUID: d1FYm/3BRsyszbQLgYSdSA==
X-CSE-MsgGUID: krnPOZXiQ+yPk6ZtEIRs2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="159522830"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 01 Jul 2025 08:43:42 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWd91-00006P-1k;
	Tue, 01 Jul 2025 15:43:39 +0000
Date: Tue, 1 Jul 2025 17:43:10 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882] kernel/crash_core.c:380:13: warning:
 no previous prototype for function 'reserve_crashkernel_high'
Message-ID: <202507011754.bARO1PJL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c90dc8f5217147c6c3cfb99d952cfdcaf7e194e1
commit: baac34dd89ca15da7d7f0736fd0e69e13f315ae9 [2882/2882] arm64: kdump: Use page-level mapping for the high memory of crashkernel
config: x86_64-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250701/202507011754.bARO1PJL-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507011754.bARO1PJL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011754.bARO1PJL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/crash_core.c:380:13: warning: no previous prototype for function 'reserve_crashkernel_high' [-Wmissing-prototypes]
     380 | void __init reserve_crashkernel_high(void)
         |             ^
   kernel/crash_core.c:380:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     380 | void __init reserve_crashkernel_high(void)
         | ^
         | static 
   1 warning generated.


vim +/reserve_crashkernel_high +380 kernel/crash_core.c

   379	
 > 380	void __init reserve_crashkernel_high(void)
   381	{
   382		unsigned long long crash_base, crash_size;
   383		char *cmdline = boot_command_line;
   384		int ret;
   385	
   386		if (!IS_ENABLED(CONFIG_KEXEC_CORE))
   387			return;
   388	
   389		/* crashkernel=X[@offset] */
   390		ret = parse_crashkernel(cmdline, memblock_phys_mem_size(),
   391					&crash_size, &crash_base);
   392		if (ret || !crash_size) {
   393			ret = parse_crashkernel_high(cmdline, 0, &crash_size, &crash_base);
   394			if (ret || !crash_size)
   395				return;
   396		}
   397	
   398		crash_size = PAGE_ALIGN(crash_size);
   399	
   400		/*
   401		 * For the case crashkernel=X, may fall back to reserve memory above
   402		 * 4G, make reservations here in advance. It will be released later if
   403		 * the region is successfully reserved under 4G.
   404		 */
   405		if (!crash_base) {
   406			crash_base = memblock_phys_alloc_range(crash_size, CRASH_ALIGN,
   407							       crash_base, CRASH_ADDR_HIGH_MAX);
   408			if (!crash_base)
   409				return;
   410	
   411			crash_high_mem_reserved = true;
   412		}
   413	
   414		/* Mark the memory range that requires page-level mappings */
   415		crashk_res.start = crash_base;
   416		crashk_res.end   = crash_base + crash_size - 1;
   417	}
   418	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
