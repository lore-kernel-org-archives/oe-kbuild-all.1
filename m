Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D634213D892
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 22:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720044534; cv=none; b=MNyflgd6p+PZukkyK51V+JEtHv9sNgGMaaP4pBpxDIHNIVDpqc8BRMIap15EMix7KLgf5DdEkKiNndkgl8ROyVSWo4Xr1ZGe7RKnNBb1vL1BzMOR4STuf3bUdX+qLT3SWryLNwla9m+aTy/QxuOuAy7mzlDI/oPVQoMAAebIPSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720044534; c=relaxed/simple;
	bh=JEZ6TRR/qEa/OtVS74VRKopXIiYzQD4dK6JvKLql10o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Og/6M/7b5QTcLoYDoau5Ti5RGpFFasml8Wd+0c6NyvuftzolR01JWFgdSudct83Vl5/NsDKx2zRx10gBbedrhEJAIdSkSpponKN5kZe9JYZhndLnQoQdCFD2FRWyhno7/698h01eHm4IVsXHLuTP8zkpJIBBIeKPiy1+STZJUFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaWFkzyV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaWFkzyV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720044533; x=1751580533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JEZ6TRR/qEa/OtVS74VRKopXIiYzQD4dK6JvKLql10o=;
  b=AaWFkzyV9JJHWZtk7pxTlco174iWVt+8rO9G7fHGnCsLNcUmLM4jvFj/
   hxWCkq5Lov5snwD6InAaXxBbF36K8iISwWMi+iKJ79glVAlhfN7W2KXeL
   gf29TLj/wWLtJQAp87e4F/rgvGOah6ZyxeH1k0kxAVd2MAlc/xq9Jqqj0
   T55vIuVXTddXpZ/9cMyJE33OREMVatF/WLZu2OpfUROZkoD9KQg7SoL+x
   1Jgc+L3VuVpdE3zoA0LQvFuFTGYRYlq2lfs/7qH/Q3Lg6bwy5oqQKTD/r
   DYtp5+i25NYdN0JKHRujZc5cVBXCIpkdTW+OkwBSPsD0zGvjbqWkg96Jp
   g==;
X-CSE-ConnectionGUID: 4EpW7D0NSVybY7mNDLKkzA==
X-CSE-MsgGUID: uPeOFJ03TYqjn/zIIorrrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="28695422"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="28695422"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 15:08:52 -0700
X-CSE-ConnectionGUID: P0NeAZQwT9Cc7Dk23N0/iQ==
X-CSE-MsgGUID: fuEXcWVCQnSq//ohJI8vxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="50989716"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jul 2024 15:08:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sP89g-000QHC-1g;
	Wed, 03 Jul 2024 22:08:48 +0000
Date: Thu, 4 Jul 2024 06:08:07 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko <andy@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 9444/10451] rtc-ds1307.c:undefined reference to
 `watchdog_init_timeout'
Message-ID: <202407040610.iyExANv0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: ab89fb5fb92c77a9486b6769bc8681251f094c67 [9444/10451] platform: cznic: turris-omnia-mcu: Add support for MCU watchdog
config: nios2-randconfig-r133-20240703 (https://download.01.org/0day-ci/archive/20240704/202407040610.iyExANv0-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240704/202407040610.iyExANv0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407040610.iyExANv0-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/rtc/rtc-ds1307.o: in function `ds1307_probe':
>> rtc-ds1307.c:(.text+0x254c): undefined reference to `watchdog_init_timeout'
>> rtc-ds1307.c:(.text+0x254c): relocation truncated to fit: R_NIOS2_CALL26 against `watchdog_init_timeout'
>> nios2-linux-ld: rtc-ds1307.c:(.text+0x255c): undefined reference to `devm_watchdog_register_device'
>> rtc-ds1307.c:(.text+0x255c): relocation truncated to fit: R_NIOS2_CALL26 against `devm_watchdog_register_device'
   nios2-linux-ld: drivers/platform/cznic/turris-omnia-mcu-watchdog.o: in function `omnia_mcu_register_watchdog':
>> turris-omnia-mcu-watchdog.c:(.text+0x25c): undefined reference to `watchdog_init_timeout'
>> turris-omnia-mcu-watchdog.c:(.text+0x25c): relocation truncated to fit: R_NIOS2_CALL26 against `watchdog_init_timeout'
>> nios2-linux-ld: turris-omnia-mcu-watchdog.c:(.text+0x35c): undefined reference to `devm_watchdog_register_device'
>> turris-omnia-mcu-watchdog.c:(.text+0x35c): relocation truncated to fit: R_NIOS2_CALL26 against `devm_watchdog_register_device'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WATCHDOG_CORE
   Depends on [n]: WATCHDOG [=n]
   Selected by [y]:
   - TURRIS_OMNIA_MCU [=y] && CZNIC_PLATFORMS [=y] && (MACH_ARMADA_38X || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
