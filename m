Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9083B9952
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 15:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398906; cv=none; b=r6bdN2haVzrWXFInexQcDsd5OgZaCEn8KPSSVbqQeY0wVri5ZtOICDxOIdsdSPbPHd2oZAz0Brow4aMGcnIOvhH/8XsZ8RtbaNAobjU2RjFvicCRvZdIT8sV2jVpPe+msM/RCFsH41GdV+hevTZUvtBuINFx0lcDXCGO1Ip6QG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398906; c=relaxed/simple;
	bh=waBM8EeFBj3nSOImbAScNXOYDfg3wuOkx7yuHbQ/900=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lHlDfSuRsGyO7TSAsqBFiHh7N7XkXxCFsXESVN5DsQ3cIuaIzhJixKs7nDbHfbSOkZo7tKpHfVlbJTUKlNaZ82Pt+tdzLX1cPJEZTkwx5wF2+OsTeccfCF1dsQx2cyLl6Io2OcfvKD7FDUTk95mcJEl4JYjQEU+bvj0zovKtURA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nH3JcHX7; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nH3JcHX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789398904; x=1820934904;
  h=date:from:to:cc:subject:message-id;
  bh=waBM8EeFBj3nSOImbAScNXOYDfg3wuOkx7yuHbQ/900=;
  b=nH3JcHX7XwA/4u+QblVqeWysKo/INkFodTp2UCsfiYdeXcUS3cpqEw+M
   a1qqF19uwtfNoTSyOQdk8K+sYiNfx/rUcUVqUP8PTQrT2pgqKzUYBAZkT
   lEQrTVpmHx1kxz7lG0N8O8+rwgbZMZLTxcUoLbnwfPVtsUBoy8BwL3kod
   6rf3jntTrYItRrPhHnwLfEVA70b+LwCqIeABUXWrCjZDUfiqOgSvkEjuy
   6rVShK4jXeySq9dUr9qZE6box8mhegrGVs/j70bLIxtoj0BNKXaAILBKc
   P6KM2kDlhjgHFFcHewBAEGShbQoJgMMAp/pMtcgy/vc18SrwatDyodKgt
   A==;
X-CSE-ConnectionGUID: 7WmLlw/zRGCsI8wGcDJ+MA==
X-CSE-MsgGUID: oqFyxzofQ/erjHbGa8CGSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="262611"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="262611"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 08:15:02 -0700
X-CSE-ConnectionGUID: V8mkRscyQP2UFVtPgbXLPg==
X-CSE-MsgGUID: zUNBOSFMSF2S0iwRNI0rgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="268985368"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 14 Sep 2026 08:15:00 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x68OY-000000000CZ-0FFi;
	Mon, 14 Sep 2026 15:14:58 +0000
Date: Mon, 14 Sep 2026 17:14:17 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 265/265] kismet: WARNING:
 unmet direct dependencies detected for NETFILTER_FAMILY_BRIDGE when selected
 by GKI_HIDDEN_NET_CONFIGS
Message-ID: <202609141759.SPeFVLy8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   0cafa972f82900389c8c0ab872ab24f4ca9f5bd3
commit: bc4d82ee40515f0c770b28d0dc4fa532a2b1850e [265/265] ANDROID: KMI workaround for CONFIG_NETFILTER_FAMILY_BRIDGE
config: x86_64-kismet-CONFIG_NETFILTER_FAMILY_BRIDGE-CONFIG_GKI_HIDDEN_NET_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260914/202609141759.SPeFVLy8-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260914/202609141759.SPeFVLy8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609141759.SPeFVLy8-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for NETFILTER_FAMILY_BRIDGE when selected by GKI_HIDDEN_NET_CONFIGS
   WARNING: unmet direct dependencies detected for NETFILTER_FAMILY_BRIDGE
     Depends on [n]: NET [=n] && INET [=n] && NETFILTER [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for PAGE_POOL
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for NET_DEVLINK
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
