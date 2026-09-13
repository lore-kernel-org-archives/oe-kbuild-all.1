Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CEB217723
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 15:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789312571; cv=none; b=CyPrtn2vyYz1UJg52mZrIPAWJc4CHPHuDIOWVeth46PzCncgZzsvZFKRycx//o95luTZqp1x1XhhU0QkPmA04VhrA1nYesjSMnr9swOSj6t2ARQqF96pMuzC2GFruCbSjaCjam0stnzrtfyd9sHzW5hqXRacCTQsiaw1Sgn74qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789312571; c=relaxed/simple;
	bh=EBNmvMlkrouALwnFGGbK/dY+CVdjxR7irvhMU7JVGo4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T/Yd396qCGfwmOVRyGGR3ND271GizffMzMCspYypi/MTJgrJqCTZL5nrswVpScmv/7Ow9Z2v5w8sEHM/+/6T4qB2gdQCjUSfZxuMZb1rwQApaifGQN3AK2CShRNMqXBGD1o5p6IUxRcrOCsUMQeO8l7690TJuPn9zZ/Q1r7c2Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DYMgDJs7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DYMgDJs7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789312570; x=1820848570;
  h=date:from:to:cc:subject:message-id;
  bh=EBNmvMlkrouALwnFGGbK/dY+CVdjxR7irvhMU7JVGo4=;
  b=DYMgDJs7zLblGjFQFmkZbsC/XjYzzvxF8LqLvXIS8R3oiaZJN4oMak04
   Abak7ACirsT28d2Hh5odlmLnVcHbLXKK3uQPRXQtN2f/FdCc3Z3u8NamY
   voDQFiAGVwyCnN+QfA/nfsWJUN9HAKDuvWQxwV/qh8RU1BQw0GxAX3owX
   awLkYlI5WafLSLU8uD9W/eDNJayKU4Jk/4rYp7FpoBWj4sMx9yOhF0BkG
   S2pdJ+tHG/ykKIH4+JdjJjZrV/uFtN/O0ZBsySLbBrAytY6EAVLq0Z3tG
   MzJStKzakuU1jo+UjhgqP2NWRR+Jjb8cUloHweSQuG+6T2hCsFf4zIDpY
   g==;
X-CSE-ConnectionGUID: eARS8feQRP6gEu+Bi9RlFA==
X-CSE-MsgGUID: f0T6yiiLQV+aZCoAceONxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="93388869"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="93388869"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 08:16:09 -0700
X-CSE-ConnectionGUID: hT9xjwTQR+aweQvQB0FDtQ==
X-CSE-MsgGUID: ZjPZWucLSC25szQRv5vZpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="274330221"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 13 Sep 2026 08:16:07 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5lw5-000000001dH-0nHa;
	Sun, 13 Sep 2026 15:16:05 +0000
Date: Sun, 13 Sep 2026 17:15:51 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 164/164] kismet: WARNING:
 unmet direct dependencies detected for PTP_1588_CLOCK when selected by SXE
Message-ID: <202609131736.3jx9kicY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   271ed1169e6b74dae1a8cd72c9296e13fcfa1a16
commit: 2ce56273e0cf23f5fc1b079bf9a8e574ba6bc36d [164/164] anolis: net: supports linkdata ethernet controllers
config: x86_64-kismet-CONFIG_PTP_1588_CLOCK-CONFIG_SXE-0-0 (https://download.01.org/0day-ci/archive/20260913/202609131736.3jx9kicY-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260913/202609131736.3jx9kicY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609131736.3jx9kicY-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PTP_1588_CLOCK when selected by SXE
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
     Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
     Selected by [y]:
     - SXE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
     - SXE_VF [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
