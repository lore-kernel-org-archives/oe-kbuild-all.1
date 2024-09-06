Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F972D2FF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 04:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725598031; cv=none; b=bSe8WCfXgJo+FkAOeMUDg3LF4agq60EtIk1gjlATstceT4QJdvqQU9UKdQfkGcCeUeGzvgt0o4Sib4uZBI+hi2Y7cEZDA71bO0ZbDDexUpEh1kNhzDx4ZTmo6qrXCCIyUVU/5AOSNtks40PQXdQtO/PxqCnqMP2FZpXD7dy9AaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725598031; c=relaxed/simple;
	bh=OFIrU4rY2ncKPCYxTzxwwXv+G0XXKpSPRoJkOSnbL7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u66xIp5jwVZyyZ4hnEiTpLgkgddYAlzJEyY0jonrLpPPJgew8htM3ULG4bGH5vJZ2ggT0KaRF8CmkWzBalG2jZvav4zjCeWCchkyhLiqcy2oQE2M1p31yoySTuABi0UTNFzsVwCk/5ua1xbagXJietdgNC8VbHpdhxCRNL2a13Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyji5nio; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyji5nio"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725598029; x=1757134029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OFIrU4rY2ncKPCYxTzxwwXv+G0XXKpSPRoJkOSnbL7A=;
  b=fyji5niokNvhE4yacDJ2YsH0joXer5SF7HRoVneymIjyxtbUWSb835O+
   UvPg101G/Ogbsd7hgnJJ8HXww3JiHKIGRVvqIWw1/Cmw/7P3tXj/03MN3
   4JujumgbD++7NYP0eWtY7bscp42kG/aDGC0XN98OmZLi0IbwjjQiyvZJv
   STUj+wbfLuqn28/SM7UfHTssLyfcxJIFDCt+GfV8x2DxHmRUBg1QqcEJs
   Igpfvu1j7V16aDu4GIuIhZQr2hx1szmbfNFNJ7RzEAxJukDCcxa+hzslT
   QjklhF6U3Yt8ts89krjL1i2A4toRVu/KYSwPInzFD7A0pIL1Tmg/qP4XT
   g==;
X-CSE-ConnectionGUID: eBnqPFTvQbCJC7A7//Y+Dg==
X-CSE-MsgGUID: yA1IKAkeTkq1iZ/00YCyfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24501505"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="24501505"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 21:47:07 -0700
X-CSE-ConnectionGUID: tuMtQSTBSJGKhaTkWPY3wQ==
X-CSE-MsgGUID: SyRgVOezSpKXFdldeSVCcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="103321741"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Sep 2024 21:47:06 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smQsB-000AeR-21;
	Fri, 06 Sep 2024 04:47:03 +0000
Date: Fri, 6 Sep 2024 12:46:46 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.11-rc6-esp32 35/53] kismet: WARNING: unmet
 direct dependencies detected for ESP32_IPC when selected by ESP32_WIFI_SHMEM
Message-ID: <202409061254.Ac3cxpMw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.11-rc6-esp32
head:   4a9ffb44ce4c24e9dcd4a5f06beeb3dded85319a
commit: de5a96ec7f9b35d9493bc022d16cd1a03ff73798 [35/53] esp_wifi: add IPC transport
config: alpha-kismet-CONFIG_ESP32_IPC-CONFIG_ESP32_WIFI_SHMEM-0-0 (https://download.01.org/0day-ci/archive/20240906/202409061254.Ac3cxpMw-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240906/202409061254.Ac3cxpMw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409061254.Ac3cxpMw-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ESP32_IPC when selected by ESP32_WIFI_SHMEM
   WARNING: unmet direct dependencies detected for ESP32_IPC
     Depends on [n]: OF [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - MTD_ESP32 [=y] && MTD [=y]
     - ESP32_WIFI_SHMEM [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ESPRESSIF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
