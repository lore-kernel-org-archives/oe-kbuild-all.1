Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F83238C21
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 17:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745948079; cv=none; b=uAqO8SGWOYSOQ3ZGcRMYSz4cI3A0xG1mjH+Uo56VqLfkwWwDVdDs+8Rs9/NJeGiOMeqPHI0Lxb0h7jEkjdp6TYJ2vlEmCuN3oFT5sCSm1lt4twWJIS3/+UMyQ2O6FyfSti0kxrRSCZuEIHeu7X7Si9++8wCArpevRRtay75bY/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745948079; c=relaxed/simple;
	bh=f+SelR1DpyZOA+VkSjsipk11j3yFapEZ8kQIKp8xGtM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=saKuh6LFpzj3ayj8UIsy9Kh5csUNANGpMDZlanG8yRiRL7bH4ZPXoQH/ug/hF/AOIZntuAbwSjLUVmX+KrsXj7+u04ITpIgM96QU98c+M6MnL0LoDJ6QnSJSAIMmFxa6PhLTGYkoKa1n1v20JGpkbeUfzU+neQtud3APrJIJrso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yn2hahoB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yn2hahoB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745948078; x=1777484078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f+SelR1DpyZOA+VkSjsipk11j3yFapEZ8kQIKp8xGtM=;
  b=Yn2hahoBMJWP5UCxvK6amQHzpZUB+7bBiRDg649VFLzwwcbk1hJ1vn1Q
   aL6kB24jpACEgTIiefmt9EgUnJG8pEW10BiBQCZFh+mecso2Qnjf3Xz8Q
   27xNDwfONqaPbEZzJ0V/VWNkEgc0NybF3iOUs4S4D0ZVp9V3SO2slN6wB
   Z/ES9xiVB9/CR6nHAJ3v3lgLQU94JwsaX5rhAoxZ4fBsXADw3CAdHMiuJ
   nVhKMEjVbmomDfPzsoSs8ekOYHBJxyJAamgRfZKL8Kh1AKR0qWt5Ee8DU
   /j+3a+dNc9LGNkvW9Z3astzgSLsM6CuvsKwz1iDLFupTQhFKuN8WqFzTa
   w==;
X-CSE-ConnectionGUID: nAULmQg+TCqu04jPnQR+og==
X-CSE-MsgGUID: /AoBFZGJRR+QQDRWHRB/+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="64998499"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="64998499"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 10:34:37 -0700
X-CSE-ConnectionGUID: dtRu567FRESpIBhhQ/yLbQ==
X-CSE-MsgGUID: u2LZDZ+CRn+Xi5YC6A5XYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="133786108"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2025 10:34:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9oqk-0001pN-0b;
	Tue, 29 Apr 2025 17:34:30 +0000
Date: Wed, 30 Apr 2025 01:34:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2881/2881] kismet: WARNING: unmet direct
 dependencies detected for PTP_1588_CLOCK when selected by SXE_VF
Message-ID: <202504300151.RfBZyPgj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b7710e01aad5e90a681267c840f4815b024b98c6
commit: 8cee206b5558245197158bd20895f95cc28d8468 [2881/2881] Ethernet: Linkdata: Supports Linkdata ethernet Controllers
config: x86_64-kismet-CONFIG_PTP_1588_CLOCK-CONFIG_SXE_VF-0-0 (https://download.01.org/0day-ci/archive/20250430/202504300151.RfBZyPgj-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250430/202504300151.RfBZyPgj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300151.RfBZyPgj-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PTP_1588_CLOCK when selected by SXE_VF
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
     Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
     Selected by [y]:
     - SXE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
     - SXE_VF [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
