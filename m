Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465B33148D2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 18:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777486100; cv=none; b=Vie+1mtfG9igYl7mTB6Ft3+JdKg5DGNeOmXx7oH7VucFjbNM3LpAUGcrTa5SbTIUB0VagXTpNME3fpwk0zPOXG+R8X2npGPNTwWGpTBM8/W6c7b7Yp/8zIi+ghyYAt1RqJ0/XokBw0EOwDBuE9rMP3f2iiif1GSpm/ixu24RMtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777486100; c=relaxed/simple;
	bh=4SiXM/b0S1WmCoG6n7k8U8U7Mresa4+L8ibzsFHmatg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WJfgb2ErvSWbym4uBJR56yHBptBLNx83QbT6i2UUa7hLOs4u4cepjqPGux57wwU3wzqFDXgUYrPMWH1EV1nTw6UeKUmk7t74zhiH1M5BDwjvdXm45nQGkCkgfK1uEHRG3QZt/M9CsVZhCLL3+9lfXukpqlQPZ2jEFv4IVgBXDCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPm3e4Xj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPm3e4Xj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777486099; x=1809022099;
  h=date:from:to:cc:subject:message-id;
  bh=4SiXM/b0S1WmCoG6n7k8U8U7Mresa4+L8ibzsFHmatg=;
  b=lPm3e4XjBzxeVZpPnvegnfTNs1uVM67IxlC56omuFSJa0LgceyMLf1Px
   n4kt6JhhR5r4Q4D0UFACDAjTYWmpWLkldRwtCXkb5Q2h2npeb1WNz1O7A
   A6yq/+CaxDoIrWZuzVG+Cc4gDKmaZYyxdCPoy2xxWWgtFRFlIBkrRkAWB
   WjZKEa5MBTMkKtTD3HuV5a51jmXf3ZzQSo3a+9ywHDphJcNEP2QHKA3a1
   vtqd4aTNTyYKcLdgNGwlzvXVq/44OT5WmvPJ7suKkjWmZEa00B07NjZEY
   aibM9QkoG8lRp22k4UkPART5Bntcgg1YLq55bIoqC1biG1fFMCpsWF0XE
   g==;
X-CSE-ConnectionGUID: OBMzxvDlR/KgHdY7i5qjPA==
X-CSE-MsgGUID: cwK9CjSYRIWy0DeSQFZKqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="77451449"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="77451449"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 11:08:19 -0700
X-CSE-ConnectionGUID: hlv+cD8tTsiWXdLUxoDJSg==
X-CSE-MsgGUID: aluMXuuOTcmK32aftGG5VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="234219748"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Apr 2026 11:08:18 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wI9KZ-00000000BLW-0I01;
	Wed, 29 Apr 2026 18:08:15 +0000
Date: Thu, 30 Apr 2026 02:07:31 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:bitmap_print_to_pagebuf 12/13] cpu.c:undefined
 reference to `cpumap_print_to_pagebuf'
Message-ID: <202604300151.1xEoddzj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux bitmap_print_to_pagebuf
head:   09e1bcbc7572ac6d30f74e6f8ff9ea087b259a26
commit: f0db9f47a158c5333bd0d709d44a57bd700224df [12/13] cpumask: switch cpumap_print_to_pagebuf() to using scnprintf()
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260430/202604300151.1xEoddzj-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300151.1xEoddzj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300151.1xEoddzj-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: drivers/base/cpu.o: in function `show_cpus_attr':
>> cpu.c:(.text+0x38c): undefined reference to `cpumap_print_to_pagebuf'
>> cpu.c:(.text+0x38c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `cpumap_print_to_pagebuf'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
