Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3CC241679
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 22:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755296538; cv=none; b=bnfHAfFuMsnZoa1Vh1lZZRo1knXqThOypzUhF3gO+KYPgARB7g/46gCabCSpPCvud1yNiQQ94Wd/ihbDJJ3XmcQGGBHO9A0bGf1Ag8wDq4T9mBTTLFiDGFYsEeqhHJd0u/niXS/fLTJpOjmChPuHE5qmCh3K6ro7OE7UkA7y97c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755296538; c=relaxed/simple;
	bh=TeEGfSKzr+KmtWRzPC6KJMmkfkypd4UeCO1XCcPIS0I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AnY4OsscnWyMiatBuuUE27UzcW8dzuHPfjCSixEYSiJikQ1L08fL/kIAYaB3dOKFn3l8xQeft/1Z1kekRw1URrbpgLySF/9hPThSQ9NbnGuJoX1Fl63I9mRorV0qUMkkZEqtcV5kAYvPyB+WpViSeHJlkMhxd757xHMANGwNj8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mdrqzUWQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mdrqzUWQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755296537; x=1786832537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TeEGfSKzr+KmtWRzPC6KJMmkfkypd4UeCO1XCcPIS0I=;
  b=mdrqzUWQIyZKT6nm3UXPBm0sw7flez+7ay2NUS39cht0a06AxB/nhC+8
   f3i4wjJPcFkuhPOgK3jNSF7DThQ7RQKDeWFpkmK7f7d+v4pAGyfnUc0q/
   65gPErP9HYxOlRBhcB/5rVqCrqbcC5G6PgZsL59zeDuK095IoGYACBvi5
   sfmhlsoROing9pojeCMZYKNGLjnfrjR/jq+Hkuw8H6Xn4O2+qKM2NGpb/
   9VV4907Cu4823+5Y85wwlBddxvWrvLXbW2auiSRCz4FY1hrN4XF8ngEH3
   y846vCgyCmWo0eG4WgCah6VPw0fefgR8JOBDe+q79IiFE9uumch4WNQwX
   Q==;
X-CSE-ConnectionGUID: QwVSDVY/Q1KsshUdyWdTug==
X-CSE-MsgGUID: XfRqOE6vSYO/e+hhH42AFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="83047359"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="83047359"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 15:22:16 -0700
X-CSE-ConnectionGUID: /lwnOXLbQCiOLdprM5CaVQ==
X-CSE-MsgGUID: bJhFJxx/TVOjE9GhFE6p+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171552395"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 15 Aug 2025 15:22:15 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1un2oO-000COQ-35;
	Fri, 15 Aug 2025 22:22:12 +0000
Date: Sat, 16 Aug 2025 06:21:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2681/2681] kismet: WARNING: unmet direct
 dependencies detected for PTP_1588_CLOCK when selected by SXE_VF
Message-ID: <202508160631.1oinAOzI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   54d96ebb93c9ff0573fe16586a47778ebe26de32
commit: dd013ad487534c1838afc2f55efdb5daec15aace [2681/2681] Ethernet: Linkdata: Supports Linkdata ethernet Controllers
config: arm64-kismet-CONFIG_PTP_1588_CLOCK-CONFIG_SXE_VF-0-0 (https://download.01.org/0day-ci/archive/20250816/202508160631.1oinAOzI-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250816/202508160631.1oinAOzI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508160631.1oinAOzI-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PTP_1588_CLOCK when selected by SXE_VF
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
     Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
     Selected by [y]:
     - SXE_VF [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 || ARM64 [=y]) && PCI [=y]
     Selected by [m]:
     - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 || ARM64 [=y]) && PCI [=y]
   
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
     Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
     Selected by [y]:
     - ARM64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
