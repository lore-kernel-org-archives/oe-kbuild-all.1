Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47487219FF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 05:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736660817; cv=none; b=gjkj327hRW0n0FBQnbrGBP7nGItD9uRAA7ODoj6+n+p6WykQ3zHOKP0oJDMhKVRZgjAHI4ht6aIURcOBJ+6zZqU2cXqRtECv9BTtEG3v/IYKvvW+MBJ8N9FdMVjUu+eSKB7UHn/br3B0zrUQnHMFHIzkGa6VDX8vETnIkR9QB8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736660817; c=relaxed/simple;
	bh=Xdz8wWZ5bzkEtYaNKwb7NpsoBCP10p/1n5hbogU/8i4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qujqXg8NSFeVGcomShw5JC9qIJJEkF4gQetqYii4NMS2G4isgJYj6BpzQPB7ssW72VozQJMiqTXO81UefdGTnaRo8e8x9HBUWPThwGLQeOeZCo7kAnaKWI9ZxE4Kwd5ldeTBbmYmtKDes6lNirlrsD3cIL0BTZ5Uug2/g1wYy6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WmlfSS/s; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WmlfSS/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736660815; x=1768196815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xdz8wWZ5bzkEtYaNKwb7NpsoBCP10p/1n5hbogU/8i4=;
  b=WmlfSS/sqodlYV5DiI3G40qJ1NkjrJQei8CGQsBSJ5RNAOIvCurtAI7g
   6CCj1yBdi87q1YecZIdj/91D8U9wpFdduawD/18xmRa4nMX4Om1fPWLmT
   1C57fat7DHxRtZAiY91lzQt823HHYc9KRRTllHPW9W9Tw/XAUvppKlFmC
   P5FIQsTBs8AYAeHndws8huKY30x1MkSsJzTDr1L8SCxG4Ykl/UbdIXSBX
   xKWs7B3fDtNG7eAtdVvE+TuZAgcRROCDhpeCfDLUFAbx+MaJZyqDEky0b
   tRH8BjWLuarJQLXXwwYY/4cWJPzauKtf3TAfz5xnW8cEj5iHwrQR0ex39
   g==;
X-CSE-ConnectionGUID: LtPeuVJIT6O6hxTESgqtaw==
X-CSE-MsgGUID: avYH5wECQHGZmMmlT0EJaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="47484314"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="47484314"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 21:46:54 -0800
X-CSE-ConnectionGUID: 7us9ZUTSR0i2xNsITrCrkQ==
X-CSE-MsgGUID: Pvt2qhPgRayNOd1BErAv5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="109153362"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jan 2025 21:46:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWqoE-000LcR-0C;
	Sun, 12 Jan 2025 05:46:50 +0000
Date: Sun, 12 Jan 2025 13:45:53 +0800
From: kernel test robot <lkp@intel.com>
To: Pallav Joshi <pallav.joshi@xilinx.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:lkp_test 89/504] kismet: WARNING: unmet direct
 dependencies detected for SERIAL_CORE when selected by SERIAL_UARTLITE_RS485
Message-ID: <202501121521.4Qf49j6M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: d11653418f7967e167d903d090c1e979b98a6a16 [89/504] staging: uartlite-rs485: Initial commit to add drv
config: nios2-kismet-CONFIG_SERIAL_CORE-CONFIG_SERIAL_UARTLITE_RS485-0-0 (https://download.01.org/0day-ci/archive/20250112/202501121521.4Qf49j6M-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250112/202501121521.4Qf49j6M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121521.4Qf49j6M-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SERIAL_CORE when selected by SERIAL_UARTLITE_RS485
   WARNING: unmet direct dependencies detected for SERIAL_CORE
     Depends on [n]: TTY [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - SERIAL_UARTLITE_RS485 [=y] && STAGING [=y] && HAS_IOMEM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
