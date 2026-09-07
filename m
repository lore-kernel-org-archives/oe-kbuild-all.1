Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E165144AB88
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 09:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774197; cv=none; b=r4AN9BApDYbmrm8U9hZatiO7zxNqpN2n95dm2yrKG0Z/kv7zaiRGBqZfQ61hhJLILUfdX18dxfi37RYMp7KCoprZtGspd+iJbPrlwocJw5J9pAcEljUSxE1D41QRaQuS6XvkGqdx1Hc2PgH0ab7pJt8dHwinTfMUwjHtE/xBXJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774197; c=relaxed/simple;
	bh=xOkyOcWWo/chRCAT5i9Sm/YVpP9wJQRCgiCW+asm4no=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ggHPjBc4O4DaUd2N3lQbIN8KDHDdu7Nn3QUTXGYGeSuv7Tkj2P5o4bSpQDzD+O1QIhHkQhz7Ubp8eA9a6lEHPYpOTVTixLhl81I8CoVz+cluBXvL/cDfbHiNQErqX0Xz36VpPAkJCnKaOmI5azBgqn64lipVnIrEp/2Am5yqB6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hrd/OgHj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hrd/OgHj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788774196; x=1820310196;
  h=date:from:to:cc:subject:message-id;
  bh=xOkyOcWWo/chRCAT5i9Sm/YVpP9wJQRCgiCW+asm4no=;
  b=hrd/OgHjRf4maY24xBd00KCPZChwuF/GQH21RjhU+7zY5I9t/TnfkzP5
   f5btuVWhrlS+DYmz03e9TlbnF69ZkrRnkAH/aug5z9twW84qjGdix5ddP
   ZXKUv2G1wYaHywaGVJrlFgn3fsQAlkS5gTsNFlIPI/Dmigs2oxDb/fmCD
   vJtxO4dG2SG/Tk2GUpWBkOyzTRslzCNxkeCFWTWVkvV7btZ5tnRv+/K9C
   2TWw4N/VYjz00sC7+4znSAiCWXemZgw+Hy69cuRkZx7KIEcW0MK/4Xlua
   cMLEae1+wBpLRDS3H7cb88MAffHeFOiVCamhah/Iuv5lOaT7lljDXRaZ1
   g==;
X-CSE-ConnectionGUID: bME1dGmXTW6/9C1p20CJLA==
X-CSE-MsgGUID: dJo8NPcuROmPig5G5yShSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89194127"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="89194127"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 02:43:15 -0700
X-CSE-ConnectionGUID: 4ubaIIdaSuGkuH5k3O/OVg==
X-CSE-MsgGUID: SLGkrpQuQAijZAkWNDEP5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="266977034"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 07 Sep 2026 02:43:14 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3Vse-000000000By-26tG;
	Mon, 07 Sep 2026 09:43:12 +0000
Date: Mon, 07 Sep 2026 11:42:13 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.3-rc 78/144] kismet: WARNING: unmet
 direct dependencies detected for FWNODE_PCS when selected by PCS_MTK_USXGMII
Message-ID: <202609071106.0rGV0ARR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.3-rc
head:   a48e9fe4c82938d01091baf795940325d6470030
commit: 9775a230703aed4ca384dfe8d9a1df84f62ffc96 [78/144] net: pcs: add driver for MediaTek USXGMII PCS
config: hexagon-kismet-CONFIG_FWNODE_PCS-CONFIG_PCS_MTK_USXGMII-0-0 (https://download.01.org/0day-ci/archive/20260907/202609071106.0rGV0ARR-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260907/202609071106.0rGV0ARR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609071106.0rGV0ARR-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FWNODE_PCS when selected by PCS_MTK_USXGMII
   WARNING: unmet direct dependencies detected for FWNODE_PCS
     Depends on [n]: NETDEVICES [=y] && (ACPI || OF [=n] || COMPILE_TEST [=n])
     Selected by [y]:
     - PCS_MTK_USXGMII [=y] && NETDEVICES [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
