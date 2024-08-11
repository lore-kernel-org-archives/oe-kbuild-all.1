Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77764C8E9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 10:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723371374; cv=none; b=cG0JlaDFoxeSIDLwzo4IN0xN37VH2E9M20OvbPy1T3BnZRslEJDckrXPCgF0OFFPjwF8AVacr3m6ZsZzFqZbOwoSg5Pc6ll1TrRTyac5SWzW0uMw5WnnXTBQNH8OX4sIqUxazTUNB6HS/HbvCn2a7J6th8VsRIgXwrYtbBY3KiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723371374; c=relaxed/simple;
	bh=52AYG6STBez7F5z5Sx7xyy8rrs6Ago1c48kIZuGDXMg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SXSBsr95G5mTfrMb1sljvEO4HwWE6X3YcsnUhEpovF3uC2DWD6k2PDplJUVNb/LgvGod8EyqzUhAF5ZmQjD26c5DXPMV4n7IHV/AVXKKvVQ6jqwhBLn/4juz79wELqpN1APAeHRYx/32ctOckZ9PXUMFKWpRZQuPUZmDiHDD5bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VF6sTqlS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VF6sTqlS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723371372; x=1754907372;
  h=date:from:cc:subject:message-id:mime-version;
  bh=52AYG6STBez7F5z5Sx7xyy8rrs6Ago1c48kIZuGDXMg=;
  b=VF6sTqlS4zElzL0UFPjnUogCmEVAUQTzVq8SnOuDUSohpoeyrlaQG7dt
   CbEcum9xXMyQs9bdSBKriOnqXsXNpRYpJvOfkGsXPsQvjBar/NNjVuuWA
   BjGxVGEzrbUDrJPO/aB1Z05Il5KkzpObBAs6chTIerXD2SBC2j2hc0Ibq
   dr3cmDYamV050HmBTSBljvA5CgoBU6qU0ARCXMuiu5XxBWw+lkY7Pxuia
   gaWIJopESQgWh+9w7gcduU4YJCR/PrEVCAA60RM/7/+VxsRNDEqBgZuSX
   MTvKw7aDM8pfyq1YCcIY+fGGMxZrW8uYC19CBws0O/DXeRDBGANOuKppM
   Q==;
X-CSE-ConnectionGUID: 96ppvIbvRpCODnx8p/Iuzw==
X-CSE-MsgGUID: qZZx/mJDQ4CKF3EnrA5iKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="21374723"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="21374723"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 03:16:11 -0700
X-CSE-ConnectionGUID: So3dBUS+TDeuxIwB7kvY0w==
X-CSE-MsgGUID: RzQ7sgrkTkWvyV4/oLKZxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="57883964"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 11 Aug 2024 03:16:11 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sd5bl-000Aks-0l;
	Sun, 11 Aug 2024 10:15:40 +0000
Date: Sun, 11 Aug 2024 18:14:40 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-android-linux-6.6.y-cicd 1/2]
 drivers/android/android_debug_symbols.c:49:38: error: 'try_to_compact_pages'
 undeclared here (not in a function); did you mean 'try_to_free_pages'?
Message-ID: <202408111848.oc1QqMZr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guanshun,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common ti-android-linux-6.6.y-cicd
head:   2541807a1ef54deb9241788913a930d9558d38fd
commit: 7d32bc386a2608acecce8a43089b169d2dad0e05 [1/2] ANDROID: android: Add symbols to debug_symbols driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240811/202408111848.oc1QqMZr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408111848.oc1QqMZr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408111848.oc1QqMZr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/android/android_debug_symbols.c:49:38: error: 'try_to_compact_pages' undeclared here (not in a function); did you mean 'try_to_free_pages'?
      49 |         ADS_ENTRY(ADS_COMPACT_PAGES, try_to_compact_pages),
         |                                      ^~~~~~~~~~~~~~~~~~~~
   drivers/android/android_debug_symbols.c:27:54: note: in definition of macro '_ADS_ENTRY'
      27 |         [index] = { .name = #symbol, .addr = (void *)symbol }
         |                                                      ^~~~~~
   drivers/android/android_debug_symbols.c:49:9: note: in expansion of macro 'ADS_ENTRY'
      49 |         ADS_ENTRY(ADS_COMPACT_PAGES, try_to_compact_pages),
         |         ^~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DMADEVICES
   Depends on [n]: HAS_DMA [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


vim +49 drivers/android/android_debug_symbols.c

    33	
    34	/*
    35	 * This module maintains static array of symbol and address information.
    36	 * Add all required core kernel symbols and their addresses into ads_entries[] array,
    37	 * so that vendor modules can query and to find address of non-exported symbol.
    38	 */
    39	static const struct ads_entry ads_entries[ADS_END] = {
    40		ADS_ENTRY(ADS_PER_CPU_START, __per_cpu_start),
    41		ADS_ENTRY(ADS_PER_CPU_END, __per_cpu_end),
    42		ADS_ENTRY(ADS_TEXT, _text),
    43		ADS_ENTRY(ADS_SEND, _end),
    44		ADS_ENTRY(ADS_MEM_BLOCK, &memblock),
    45		ADS_ENTRY(ADS_INIT_MM, &init_mm),
    46		ADS_ENTRY(ADS_ITERATE_SUPERS, iterate_supers),
    47		ADS_ENTRY(ADS_DROP_SLAB, drop_slab),
    48		ADS_ENTRY(ADS_FREE_PAGES, try_to_free_pages),
  > 49		ADS_ENTRY(ADS_COMPACT_PAGES, try_to_compact_pages),
    50	};
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
