Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B28C3E2AD1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 18:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789323046; cv=none; b=Rl1OGOW1VEw7Wvl//7q8YfLwxGEoOyg3zgTJ1C8CdpJRmiCoOXrsuhirVwFpoWStLgz4wMW2OPFjHL6MfzJkdsN1tjmD85PinpjJWJrsIGkHR41Keut3K2DrwddI0y+SpihytwIC09FVxszfLvQPypdVzQLyvd8kfKKnJHbYlZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789323046; c=relaxed/simple;
	bh=AQp/L+0ZMKB/8f4NsAwLNjcd1MESgm+Ppw8F1bcJhp4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=irg2mL0yljp9kze3//AY6NEt8kq++n3bznNPaw0IlQIk6OMEaOCQSGS6jNKIlrwtgWjZxnJMfR7GEsIVbzriedNKeHVTHqw5CuV9SQMWz1EKJIwx5tQOwwa/ByBWx2n21TG9gQiMIJXPa2/vmmzNNx97j0Keg5l5V9TlA7+L5gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IdBpDo5k; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IdBpDo5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789323041; x=1820859041;
  h=date:from:to:cc:subject:message-id;
  bh=AQp/L+0ZMKB/8f4NsAwLNjcd1MESgm+Ppw8F1bcJhp4=;
  b=IdBpDo5kIMqNh+1SI6yoile1HWK0lK4meIASVO1if5oKyE3ac66F5I5j
   wK+Ho9P/Viq2Hs5v8C0+erKEZJ9tAvW7yyRDWWrt6+mgtN8oy4U9VTu7B
   xLQmEW8SPwJ09DSMM4sT6gz/NmoviwmSkErIrMPDF5rTgncwq2Bpjfhmi
   208FVDx/ZuXkGZIGoucOEpPjKyx7l/5gxuPsC7fEAtNxcoVGp1x8aZXfF
   ICl19i67d8TWAoGaMbK2V4K9FnHKy79/Xlkvk6vX5bFyF4t8mgD1CWRWa
   3rc4ZD36EGTqaLa0Bwlw8N2/YdPH9bnR1wtxyYBOjn7G+QMzSPZJqNH5g
   A==;
X-CSE-ConnectionGUID: gQPH4X8WTYK+WUjfJkJfVw==
X-CSE-MsgGUID: mKgMpoo4TeiqELQL2ShVqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89737258"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="89737258"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 11:10:38 -0700
X-CSE-ConnectionGUID: ycctxCuvRx6TnnqSKPvnSQ==
X-CSE-MsgGUID: kEr5tZoERmC7/6rsFxVZLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="310720216"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 13 Sep 2026 11:10:37 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5oev-000000001ff-32Kp;
	Sun, 13 Sep 2026 18:10:33 +0000
Date: Sun, 13 Sep 2026 20:10:09 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 164/164] kismet: WARNING:
 unmet direct dependencies detected for PTP_1588_CLOCK when selected by
 SXE2_VF
Message-ID: <202609132054.vvS3gYPI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   271ed1169e6b74dae1a8cd72c9296e13fcfa1a16
commit: e0244015478adde7baee3a127e43091668d91289 [164/164] anolis: net: update linkdata ethernet driver features.
config: x86_64-kismet-CONFIG_PTP_1588_CLOCK-CONFIG_SXE2_VF-0-0 (https://download.01.org/0day-ci/archive/20260913/202609132054.vvS3gYPI-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260913/202609132054.vvS3gYPI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609132054.vvS3gYPI-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PTP_1588_CLOCK when selected by SXE2_VF
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
     Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
     Selected by [y]:
     - SXE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
     - SXE_VF [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
     - SXE2 [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && X86 [=y] && PCI [=y]
     - SXE2_VF [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && X86 [=y] && PCI [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
