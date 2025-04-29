Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1958126C17
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 16:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745944060; cv=none; b=NYLzwiHLebqpytiV4/VsLI+ZCAtICdyy4YHEHn+zacdASlGcaSVXIsaco1CGWEb0wA1gxjkzQRBteNpX5AzOlMbFA/ndVO8pxwQDzshW7m8c0sJe7KNyjaoESyOcN0Q6VawDceyFDE7uSPGfhHCpF71qFs7HrhhLHJiXrYvMkIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745944060; c=relaxed/simple;
	bh=LbRfgaI819h5OCyjG5uWT4fTZkOYZBHGwu3Waa6tGmw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bNmCLpxRA/Y9l+zVpbGi5isDOzFKK5RfXIUpEm37B5jg70I5L9/qSmI2ggJf2QnttbjnBZMHijcdWGfreleP0YvpnQZxZWJZZZ70YB7PRBUbUXziaJCoz/FkzsHw+2J5Rq3vmXpvmAQPyK0NO0otFbgALhNgl4BLKMzzBnjvh6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bHmQXJhB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHmQXJhB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745944058; x=1777480058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LbRfgaI819h5OCyjG5uWT4fTZkOYZBHGwu3Waa6tGmw=;
  b=bHmQXJhBUlQx0SODCQsea/SMT5J+/4oZ1Eb0vw3yX/92fsDftg9Nef4B
   gCTV1GRyWAqusfdQtQpoWluArQtDes6azhfMLhh/DVofc6JgQZVqbYDHk
   FJMWwvPJ0WHg3tVlFDBCKdQkJl1E1inCrke/EjYcG5Smyvuxdu+ktH/af
   irl23zQuFHqyYexKWp+uPRWTamALUO9BJqkZHOw1lVJUXrtIGo/7awCbu
   uTOJ7P07dcJZzyJpk0qC8gn1+r7DxA2AOYt19M7OU5iI9t7GXxcmRnpVd
   4A6wTkaYU8wGfp1KQugoFl6diHDoruMKHfu2Gij/yIExCN6eZIisNNLNE
   A==;
X-CSE-ConnectionGUID: eyFgvU+ARb+8SgNaNb1hcw==
X-CSE-MsgGUID: cpLlbbyuS7anZ5xmYZG4iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51397737"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="51397737"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 09:27:37 -0700
X-CSE-ConnectionGUID: MWS+PKz1TS2vXze/SCT3gQ==
X-CSE-MsgGUID: vIJMrObZT+ucd6mPINha0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="134373726"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Apr 2025 09:27:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9nnx-0000uP-37;
	Tue, 29 Apr 2025 16:27:33 +0000
Date: Wed, 30 Apr 2025 00:27:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2881/2881] kismet: WARNING: unmet direct
 dependencies detected for PTP_1588_CLOCK when selected by SXE
Message-ID: <202504300001.MoxWgMgI-lkp@intel.com>
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
config: x86_64-kismet-CONFIG_PTP_1588_CLOCK-CONFIG_SXE-0-0 (https://download.01.org/0day-ci/archive/20250430/202504300001.MoxWgMgI-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250430/202504300001.MoxWgMgI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300001.MoxWgMgI-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PTP_1588_CLOCK when selected by SXE
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
     Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
     Selected by [y]:
     - SXE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
     Selected by [m]:
     - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
