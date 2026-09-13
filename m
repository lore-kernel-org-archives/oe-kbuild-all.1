Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E7313957E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 16:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789318085; cv=none; b=qulPNvQOD7J6001sLlpruTX/eQ8iMx3Pj0wmjnnAOoGWV7fkQn2Jyt74BiYCRFsqXHVmPE1xIObK7lL5SU61wkIVMydNCO1xXuItW8m0xpE7oI1X3m5EOEYNbgHgYoQwLlsyojHlVuPI2FcAxuyG/8EHM23bz1uUu59EW6yz/Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789318085; c=relaxed/simple;
	bh=W4bUyrP48Yi+ybLkXXZ5qMRYkLANjhqE8I8nYNlWcXE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XYg90ImaeyYylx43DAgR02Y2ZPYpS5jPHzTFpR2n5fgO13A4/lweUDTgPGw+ApUItSCHBdt+kZc9629i+3wbFgjgEFyO6bZFpk7ETskcet3ORSmcfzFvcuqEgGO4Qx9s3do4m9GmX4MbFxe1HfwKlmidk/hliQbDjZ3nMuZ+WaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWNxGN1H; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWNxGN1H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789318083; x=1820854083;
  h=date:from:to:cc:subject:message-id;
  bh=W4bUyrP48Yi+ybLkXXZ5qMRYkLANjhqE8I8nYNlWcXE=;
  b=aWNxGN1HZsdFj+Ot7uEsjlI4CfXtLtz57BIuOQEbbkgNx5oWvhbA0Acx
   hIiGOvejRfgX68uJkzZRSiUlrAYSr5kjkTRqcLX0snSFWBxUpD362Z7Jh
   NG1i8M9psZyqxZyA9OeueunwkW3H/bANLda36CkUjUZ706xAdwuq7Hja8
   YtKtnNYfveaQYPukXD06qQmA3XLTcHSFZ9j437TRwsPWmRx/YnTn5+Q2K
   nXq8mraMXUvEd2n6cTmoUUbUhTADOUFSc4csM+1S0hTUQGtQnMk5bqciE
   VeYVaLRkf8sWazNeDAsZIfQUHcTq7XabHkcsBHYNd6WqvxU7I6wRoc+d8
   w==;
X-CSE-ConnectionGUID: kY8gTs7eQjiKeI9CXUt5qA==
X-CSE-MsgGUID: 99QEpSMDSTmrcqpWVPa+Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89628016"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="89628016"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 09:48:03 -0700
X-CSE-ConnectionGUID: MA0WPzUcQfi7W1cSsqVZzA==
X-CSE-MsgGUID: QTA1wG6SRFuIB2seOARmyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="295912626"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 13 Sep 2026 09:48:01 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5nN1-000000001eh-1Ct1;
	Sun, 13 Sep 2026 16:47:59 +0000
Date: Sun, 13 Sep 2026 18:47:33 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 164/164] kismet: WARNING:
 unmet direct dependencies detected for PTP_1588_CLOCK when selected by SXE2
Message-ID: <202609131822.GET9DulB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   271ed1169e6b74dae1a8cd72c9296e13fcfa1a16
commit: e0244015478adde7baee3a127e43091668d91289 [164/164] anolis: net: update linkdata ethernet driver features.
config: x86_64-kismet-CONFIG_PTP_1588_CLOCK-CONFIG_SXE2-0-0 (https://download.01.org/0day-ci/archive/20260913/202609131822.GET9DulB-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260913/202609131822.GET9DulB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609131822.GET9DulB-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PTP_1588_CLOCK when selected by SXE2
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
