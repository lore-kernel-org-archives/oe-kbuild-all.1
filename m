Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794765208;
	b=bHYVMf2oCGPUYUe7CxEWTBeF1PUVAgpgbm051EjYJYlnbJJaQU5btWpCLlRWcgkNtAzj
	 dC3vsq2iveXNgWlIjBGtZR0rOy8dfpGavDG3pOhnM2INyE8jeQl0GvbXfwrEwfRusSs66
	 Eyv6QqtnacplBtMrE6k9pyyOD/CxA9qfDLv7QcE7aLlQuTK5As9ocI+xoAhViZIIN28VF
	 Qp7i5nSj0GjVzfBUpUUbDVAotxAen1CKznFQrenF8Nea6bBdqEctJemhj96YttgtWxX1A
	 PvDZY67f5qQP8TW5GG3FyOIZE3iY0qe+p6Ux2F0CQeLbnaXtPsrGfpL8KgX6xylzoKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765208;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=q46SORLl5ejCI3na4o1Gz2SbfTIhcU3eDi5Kshx7/gI=;
	b=qKhXPQJsMZZqplKkeYB9g64dD4JRv1FeOf827KqSoAVKEymwK+JeYNIRUCtTV/A5Fzvl
	 GaNDQAewfFuw4un1ODyAVV9FBsU4sL26m0iQhhjOEvB7NfINt/XLgsxkA4fhYsVX0fB4B
	 00Sy2q/iNTLtSN0P1YClQ7UMrAUogKqP5v5RVVzi6Ur4ZGOdJXvgWIxtfhFd+sgAhWcbv
	 GNvOqMnHYbqBSiDdt2JvaITxaCYwyhMWuL6pqzvu7pf/zsbuVnW6fUayQLFA2EXrvKKPV
	 lpPIk4LREHBuq6xHoi7eqTUkHqTG6wBL3GDTuujqptxGULLILaTSvme8HB4KjIw4uwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c3IwGJg2;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F756606A31D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 17:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F756606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c3IwGJg2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794765208; x=1826301208;
  h=date:from:to:cc:subject:message-id;
  bh=XelxfjOQWNd2sOD5uPGjFATX8rSTgPrliozaxU83Gvo=;
  b=c3IwGJg2o/5u4+2dR9cg/Q42wkb00QeZKfv1WqF4/sTeny602pnrEddV
   rkc3TuqeOo1JtIlGwLM6XEoCm5oxnsYqcUo81hEGPCgYbHb7BNgbg90Qb
   3rXzwfU+U7UnEf2aeHliyNAWLig2WX+Pj47m3klsnlQSrZjDc6n4ft1P/
   erN/nibIvqpbIgwIk/1nuoqFEaABwKe51qJlk5MTgZJabxgnP/9mGsndK
   gmUeFO4xMUhHQQFHufthC8JD+hSjekf9lj9wGXrOEQqNPgNFj5CrVHYhT
   yApj0ojnS38zOy5xY5EWoPwvVTK9BId+7nEm2SrJKaxuRzB+DAaGqMxAQ
   g==;
X-CSE-ConnectionGUID: PVXHiYtnTtSaN7IRjmMOOQ==
X-CSE-MsgGUID: mNj4DPMPSFK5ZLOLCgtJFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3584208"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3584208"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 09:53:27 -0800
X-CSE-ConnectionGUID: h4UkWkorR9WQpAAfckQI3g==
X-CSE-MsgGUID: EgWvtRbyQiOFRNtJfMA5bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9194493"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 15 Nov 2026 09:53:25 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSePr-000000002LL-282x;
	Sun, 15 Nov 2026 17:53:23 +0000
Date: Sun, 15 Nov 2026 18:52:46 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 3/3] kismet: WARNING: unmet
 direct dependencies detected for SPI_PHYTIUM when selected by
 SPI_PHYTIUM_PLAT
Message-ID: <202611151857.m7tse5j1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   dc68b182b9f87e42548fb6ce886be612535b2116
commit: 3aecfb5d583a915dc68f9fb5b5bc7dd643d5016d [3/3] anolis: spi: add support for Phytium SPI
config: x86_64-kismet-CONFIG_SPI_PHYTIUM-CONFIG_SPI_PHYTIUM_PLAT-0-0 (https://download.01.org/0day-ci/archive/20261115/202611151857.m7tse5j1-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261115/202611151857.m7tse5j1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151857.m7tse5j1-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PLAT
   WARNING: unmet direct dependencies detected for SPI_PHYTIUM
     Depends on [n]: SPI [=y] && SPI_MASTER [=y] && (ARCH_PHYTIUM || COMPILE_TEST [=n])
     Selected by [y]:
     - SPI_PHYTIUM_PLAT [=y] && SPI [=y] && SPI_MASTER [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
