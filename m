Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F3742067
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 04:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724820161; cv=none; b=CGuzcQjxN7J5ZBrDhUVdPj1o+GrDShPkXEsD17WuAYqqe0MIhf8EMA9HVpE6D18gIz5TqZ6zssZobrtT9o/7yKBcd8l3lsxmlerW/0Qo+Ktpf5pihmx673T1jtYgVkc5xUOAoTU/Z18hS1EB0F4dQTgJgNcT4a3UDDPBPjUlcNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724820161; c=relaxed/simple;
	bh=2ay/oOqiFBaFYr9Gx95uXp9a0/E+Hh4ICzvyh/8FHrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oxZxe7F+V2GqkAhq9Sw/7kxwaZR5XpYpaLnEf7fzWDCSSWiqdOzuzq/CbMvdV7wLynedYshex8m+uGIoev7JIL+LKyo+3gvo/9QPYVd5qFzcPDATzpl/Yp/9Gu2pK0yUDJzNG1lFqgJnX5kHf/XO+mw9yvmqZWoaIItmzQhFheE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfdU4+Cd; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfdU4+Cd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724820159; x=1756356159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ay/oOqiFBaFYr9Gx95uXp9a0/E+Hh4ICzvyh/8FHrs=;
  b=XfdU4+CdFKC0VJEBnX6LSVZshW2VO7pF8OiGkWDA6MQmUTEKEwcZHd8P
   kBgBnH4z/CdI1pCcwV/pdb/1CtVDURLrvR/wxyHh6TcjDquJKztak/hfi
   0jXGxQ2T6XEOzBIsHfOKE+nWvk+PZ3AJ3xAYTwGk3ZYyxfkjt9udfQgc0
   bRewLK8MXzlPppnspvjrX19TXUeKj2/jgY8EZ88DkodiV+k/xJrI6YMsk
   JGlR8NucmIokq0jnscl+Le9MdJzcLPi+Iwq37dDpjXSOCEclc6coVW4q3
   Kplw/aUxZBSm2grNZE0XdDbL72j73Mku9Rp71TB1XHEK4dkW1G/nTBIJu
   A==;
X-CSE-ConnectionGUID: 3Qov5fOlRvGgZpzPsq/yyg==
X-CSE-MsgGUID: t+z/rLSjQUieydxBbOaMfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23472340"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="23472340"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 21:42:38 -0700
X-CSE-ConnectionGUID: CJQa3YscTJmZLnbMMP45hQ==
X-CSE-MsgGUID: KjzmI+HMRmKcka0PWjo5DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="62820279"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Aug 2024 21:42:38 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjAVv-000KU4-1T;
	Wed, 28 Aug 2024 04:42:35 +0000
Date: Wed, 28 Aug 2024 12:42:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/39] warning: unknown and unstable
 feature specified for `-Ctarget-feature`: `reserve-x18`
Message-ID: <202408281220.PfRKp2lz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   1d249e2f6485e9f4dd8dc97d4af04b2982190168
commit: b5e76872bd38c8f103ba656e43bc4c3a53173520 [2/39] Merge 6d75c6f40a03 ("Merge tag 'arm64-upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux") into android-mainline
config: arm64-randconfig-r123-20240828 (https://download.01.org/0day-ci/archive/20240828/202408281220.PfRKp2lz-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
reproduce: (https://download.01.org/0day-ci/archive/20240828/202408281220.PfRKp2lz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281220.PfRKp2lz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unknown and unstable feature specified for `-Ctarget-feature`: `reserve-x18`
   |
   = note: it is still passed through to the codegen backend, but use of this feature might be unsound and the behavior of this feature can change in the future
   = help: consider filing a feature request
--
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   In file included from arch/arm64/kernel/asm-offsets.c:12:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
   |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
   clang diag: include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>> warning: unknown and unstable feature specified for `-Ctarget-feature`: `reserve-x18`
   |
   = note: it is still passed through to the codegen backend, but use of this feature might be unsound and the behavior of this feature can change in the future
   = help: consider filing a feature request

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
