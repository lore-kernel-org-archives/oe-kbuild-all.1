Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABA82FD7C3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 19:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789328690; cv=none; b=X0hn5zL8SOf6It8w+E4eKfSyzrx8woKC+VG8ZdD2pc3zeAq2CxkTuq4iV9m1sb+gp5PP98Y3DhFn0N5zgAweSAWi68FSPHXNFJTXMuOG+OASxn6Geam3/AAeAHYoRR3ZqzXUM0m+yxD6THNLM2z0HaJbto+HXX/CrzpntCdzoH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789328690; c=relaxed/simple;
	bh=v/AAHai8dEWw0uq39ihET6P6INaFkH9WCPgB+jvjNx8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=syPwjt6MRnQBMsTV859kvR2+ESSBqiQlRIP8dUuX/VnTLKG3gDdn3eAD7/+teYuWraKBESatbfCphiVDpUVSfXa7DfwC68vA6P+4Ep4jwVmHLOCiQ/zsb+hBjN30E/D/maPQij7LYEbL1xHai03dYOGl+Exf5jc9n91m4OX4hhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fO86gtmB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fO86gtmB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789328687; x=1820864687;
  h=date:from:to:cc:subject:message-id;
  bh=v/AAHai8dEWw0uq39ihET6P6INaFkH9WCPgB+jvjNx8=;
  b=fO86gtmBFun6hJ/+JgTgDe+m4NFi+OmhCYBsUNJFK4pKgZMR5bOapSil
   tW8nGIvAkEIgyiuIecrThj9urvFrZCpqKPd2oNYnXVZ5RK+SUHpIBiMix
   wFlkIDoA9cyc8MW2srhn4pNAZAXJLRMxSAlsmhr+wOG9+4Xm0T3SNvuZX
   4AxjsYuP89QmqQEf6moHnQ2dG9ZXZhFxnv1ewHnAunbmgKvk++cjfQMgh
   zDzI3wCThMR36sVvl50isOA7efIP6Oi87o+/VFNCa7L0jBgxq9b7SkUf9
   Ig9so+sKNOfJ9R5YDJpBO2G36FpjJ7zHh9mpRFA4gkXdP0K0YntYO8/Ps
   A==;
X-CSE-ConnectionGUID: Dlu5N2LVSOK85LtOvVahgQ==
X-CSE-MsgGUID: Ub/IQka1QKyGAqkD2YQtgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89723813"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="89723813"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 12:44:47 -0700
X-CSE-ConnectionGUID: JqwZeRh+SYi4wj6xWu8qCA==
X-CSE-MsgGUID: UEr8HCTHTGuK4BlLI5uDgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="310733439"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 13 Sep 2026 12:44:46 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5q82-000000001hP-4Bg3;
	Sun, 13 Sep 2026 19:44:42 +0000
Date: Sun, 13 Sep 2026 21:44:14 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 164/164] kismet: WARNING:
 unmet direct dependencies detected for PTP_1588_CLOCK when selected by SXE_VF
Message-ID: <202609132154.2WqenQtP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   271ed1169e6b74dae1a8cd72c9296e13fcfa1a16
commit: 2ce56273e0cf23f5fc1b079bf9a8e574ba6bc36d [164/164] anolis: net: supports linkdata ethernet controllers
config: x86_64-kismet-CONFIG_PTP_1588_CLOCK-CONFIG_SXE_VF-0-0 (https://download.01.org/0day-ci/archive/20260913/202609132154.2WqenQtP-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260913/202609132154.2WqenQtP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609132154.2WqenQtP-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PTP_1588_CLOCK when selected by SXE_VF
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
     Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
     Selected by [y]:
     - SXE_VF [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
     Selected by [m]:
     - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
