Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC95A2D600
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 21:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717794527; cv=none; b=jhH7Gnel1DFUVMpqi2aU4Q+0EXcjCYOCxj/IcEpmZOZxdkpY77v3yUEy7N96jO2IpzcwGq1SMhyBnqUe2cwmxd6bnT+0UWkOzQ6qYvIswYPRwXPDNngRJt7ovnm29JJQNqoBWnM+SmEbi7rpJ/fLtFhPCtUXiiFQT/P5vWPgEtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717794527; c=relaxed/simple;
	bh=8Wz8FMG3j8xrFcxWt/I3dUuJ5B7msGKjLsPF5pXnKMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qJViIqY1VX/zapCc6lK9kC4mhyGK+0PzkdrslhnNIxKGIFJjUPzoWByrouGgSoG4Q6nTZmErswcoH1zfbOiVZCVgx8Y9jhbaizvGMsy8hMqBg7LBMtRfbqBr7G37o+KlbRfvXuQjJ6OdMZkXGdRtJfHxc3tZ/A5R65Pn/2/WtqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpOdbTn6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpOdbTn6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717794525; x=1749330525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Wz8FMG3j8xrFcxWt/I3dUuJ5B7msGKjLsPF5pXnKMQ=;
  b=hpOdbTn6IIqzSiy+aOACG2eOochYep41AU4PDyM+TDg14vTqfr6dU/yv
   D01Zstagz75hzoRejrJJnzMPRCmDxOKNyEn/A3pRVByhl+rdpX8MmRfvp
   M4bGZfePkMGhzASTcirEMRg9OYHagLq730B1M3Q/izTzKB0cpQVD81KKl
   V1y9OidrE3XJuqfZeqn09cgRNT6lJmbG/zgZMND3ZEUbAFdXgdSIplcg1
   ZATqazEQS3H6gP5m/FtC1czjtuaUvcV99q7fqOPU2+O4Jd948B0s+EBOA
   jVDzkkw0upUXs44bIw+HayWdIwDGPhJwujmF7s87uHeVJIyDz7Qvo8vc/
   g==;
X-CSE-ConnectionGUID: GGB9pDbWTyWKCl2qHEeCZw==
X-CSE-MsgGUID: fLS8SxvhT6iGMRrZortBRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25159866"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="25159866"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 14:08:44 -0700
X-CSE-ConnectionGUID: XY7qTSzBSbGmDuCT5wawJA==
X-CSE-MsgGUID: fLAdvS57SW+7AkC+rw5IWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="38526062"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Jun 2024 14:08:43 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFgpF-0000Xi-01;
	Fri, 07 Jun 2024 21:08:41 +0000
Date: Sat, 8 Jun 2024 05:08:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/2]
 drivers/android/android_debug_symbols.c:49:38: error: 'try_to_compact_pages'
 undeclared here (not in a function); did you mean 'try_to_free_pages'?
Message-ID: <202406080515.XQpKx44Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   73e65037e4456d7b4d9050ec8ff1ad42a7f09ff3
commit: 7d32bc386a2608acecce8a43089b169d2dad0e05 [1/2] ANDROID: android: Add symbols to debug_symbols driver
config: arm-randconfig-001-20240608 (https://download.01.org/0day-ci/archive/20240608/202406080515.XQpKx44Q-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406080515.XQpKx44Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406080515.XQpKx44Q-lkp@intel.com/

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
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


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
