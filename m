Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F053CCFC3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 12:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790512484; cv=none; b=bnYGLFjJNPgEVrFKSyUvDLb2IlIDAqVJ3fGP8R8djmoeuxaWVbfCQLrYpZ+RQDCAznZh0Ti6yke8muBNsiVHxMOTch/7X5Z/HILK9VkiSBQTWFtkSRBFfKcT43LLFxM/RuiVUpGCFWDc3HZW5ycpYXssYPpq6BM0PVAzpyuoD6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790512484; c=relaxed/simple;
	bh=J7Phmb0St5MNSr6PwsO7bSm7ZWhumBMoJ7v/xiZaW3Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cb7VmEX6kc5w3eCwqpJU7eBTyWSaPtrq0gTaoqKkn/PGWrVtVH/uzPlPxMazKmrpCxQvlN7OgP8cvMKiascSgMM8EG2VRshkFiY88ymzUwHvSJbvS+2U3NUa8qLSvCzZIGnaJpzvpDGoLYe3HiTDg6/VkbWJX7NSs4GvTkFNPQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuL+XiLh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuL+XiLh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790512482; x=1822048482;
  h=date:from:to:cc:subject:message-id;
  bh=J7Phmb0St5MNSr6PwsO7bSm7ZWhumBMoJ7v/xiZaW3Y=;
  b=OuL+XiLhCkmrObQBZ652AqgZKoZ7tryoppxsTdeP/VkXbMBpagKDq7Bf
   H+k3eJ4MLg+vE9dmHm6XM8CHlSY6TIq1epE+n1QzCzVNDD0BnaCQGceTD
   UN8Yez2azHrUoooy9KeqgNcEEYiKgfj2lE51PjVfaq2jh2XgNR4nBkDNr
   hEhSiog/bHuWIkgoocrlNnk6fqdjE52eluZB07jAo40nx6/PQOXoEASgA
   0+KgCPlsuSULr2dDCgFeV+5zCAGs/pxyNPkNE8rQYgChN3mmw0rPxYjcu
   1TKLXEybE60UY5qh49EbIX+B+PQm02f3uc1iEq66piXm9PFXmj11N2YS5
   g==;
X-CSE-ConnectionGUID: tXariW3YSnSdD4B0Oa4v7Q==
X-CSE-MsgGUID: ZmP2ffEASJeF4QT+m/Oxaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="100564236"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="100564236"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 05:34:41 -0700
X-CSE-ConnectionGUID: ZS8Kt445SLaiRExWkVMWsg==
X-CSE-MsgGUID: Rloi4B63RZCgR1si+C7cGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="312725061"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 27 Sep 2026 05:34:39 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAo5V-000000000Zl-1804;
	Sun, 27 Sep 2026 12:34:37 +0000
Date: Sun, 27 Sep 2026 14:34:15 +0200
From: kernel test robot <lkp@intel.com>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>,
 Ricardo Koller <ricarkol@google.com>
Subject: [linux-next:master 9572/10910] kismet: WARNING: unmet direct
 dependencies detected for DRM_TTM when selected by DRM_RADEON
Message-ID: <202609271435.lANS7mTP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 626ff2b34dbb7679b798f7a4962a8b3def695045 [9572/10910] um: allow deselecting CONFIG_MMU
config: um-kismet-CONFIG_DRM_TTM-CONFIG_DRM_RADEON-0-0 (https://download.01.org/0day-ci/archive/20260927/202609271435.lANS7mTP-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260927/202609271435.lANS7mTP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271435.lANS7mTP-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_TTM when selected by DRM_RADEON
   WARNING: unmet direct dependencies detected for PCI
     Depends on [n]: HAVE_PCI [=y] && MMU [=n]
     Selected by [y]:
     - FORCE_PCI [=y]
   
   WARNING: unmet direct dependencies detected for DRM_TTM
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_TTM_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]
     - DRM_RADEON [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && (AGP [=n] || !AGP [=n])

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
