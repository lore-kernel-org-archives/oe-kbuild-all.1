Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B4D3E5EDB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jul 2026 09:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799225; cv=none; b=c+QucPkRqe35BMvUm52Eavu/FBdX3CelzvTmOeSLpWdWqNCOUkYZo2RWt4yVs+HBbKvRMZ44eu8d06Gbdk8qYF10HST8Fg1y+q4o8zmmQZtAihgEv+OHnu0lP4UveE3IkXVmk/l2mmAPnLtdpMdRjLqvYTsIQtX110kYKCeJVvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799225; c=relaxed/simple;
	bh=jfvJPPVOWpxK8jU2mjYcI4mB3reBigcfpy9OZNoREDE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pNEPNUF6udm+vT1ZOopYrJvm9czz63jUQ5yX1NEWKK9Dp5iYIHpcfuRGDk7haPd7NGAhLp/5fQLby4ohdzWHRovOEPVIy4td0h4AMX5KlpOULlR3g1q4EnU65FTBmeg4G8td1rFdKWWB1V+2mNz9xy7nqbhUyikKobECWBoyYvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kcIbSp6l; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kcIbSp6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784799222; x=1816335222;
  h=date:from:to:cc:subject:message-id;
  bh=jfvJPPVOWpxK8jU2mjYcI4mB3reBigcfpy9OZNoREDE=;
  b=kcIbSp6luViH0zXQ6ckBmf2ISVTwgZ1DEpTiOdZAmlhaQpsiVrARklb/
   S3sl0H2r5VZGemrKq1LLYqm1Ftfhjraq4MywKk9ERjPmR/uZaGAotp+hZ
   paCLMafq9qSZVOt5nnTha7md1fxqgoHAGzr7naFUwXUmA89UPUIHj/lwc
   n8j96E9aJJnDw0JxS81a5SD84MNtafxHxJrSoY0G6FoEmk+a29+t6rah8
   Te3F0bKy+jV3XAo5kUvDuROiZTtk/su4QRH5WdVEQ34upnx4I1QMoDRTa
   mlwhYx4WiFnFeH9udfS7WY0P67hBNstmY0hple5R4QvBWp49c0iDx92RM
   Q==;
X-CSE-ConnectionGUID: ZWByp/b8QLawro7ibkxhiQ==
X-CSE-MsgGUID: v+yoxCh1SUimrISWGqezOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="95804563"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="95804563"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 02:33:42 -0700
X-CSE-ConnectionGUID: fA8pzJlGTtatYlpOZrg9og==
X-CSE-MsgGUID: ep2Y/eQeTheOReK+LWaDIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="255711684"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jul 2026 02:33:39 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmpo9-000000000kQ-3nLg;
	Thu, 23 Jul 2026 09:33:37 +0000
Date: Thu, 23 Jul 2026 11:33:36 +0200
From: kernel test robot <lkp@intel.com>
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 168/176] kismet: WARNING: unmet direct
 dependencies detected for DRM_GEM_SHMEM_HELPER when selected by DRM_XLNX_AVPG
Message-ID: <202607231131.Y3mU0d7i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   3128e0f044012bb39c8e24551d72e4a72e0808f0
commit: 317bbf6a2ab3aa4c3d6421fd943a3cc69ee69665 [168/176] drm: xlnx: Implement AV PG driver
config: sh-kismet-CONFIG_DRM_GEM_SHMEM_HELPER-CONFIG_DRM_XLNX_AVPG-0-0 (https://download.01.org/0day-ci/archive/20260723/202607231131.Y3mU0d7i-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260723/202607231131.Y3mU0d7i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607231131.Y3mU0d7i-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER when selected by DRM_XLNX_AVPG
   WARNING: unmet direct dependencies detected for DRM_XLNX_BRIDGE_VTC
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_XLNX_BRIDGE [=n]
     Selected by [y]:
     - DRM_XLNX_AVPG [=y] && HAS_IOMEM [=y] && DRM [=y] && OF [=y]
   
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_XLNX_AVPG [=y] && HAS_IOMEM [=y] && DRM [=y] && OF [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
