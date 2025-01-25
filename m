Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1209F146A68
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 10:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737802670; cv=none; b=IgbiUBb792YEZDTqpb72ZK/qLCYZtjs86w8WdjWYL6uBrv0oN4pvATQh/Db9Ln+SgvHOv3qZa3+VGMH15TTG2EZ6qLDtQ0XtIR5Rn7LVaWZYnD9kHE+p78XChYFh7Ab/RCHoY/OFNkQfVYHLsKaWsyLEQAe9J+9olEoD1g07CAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737802670; c=relaxed/simple;
	bh=FBBZb/fYADhhR8mvtpkIZHPKFZXaiMsjTUVYeBdo+1U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BDQWzdZIevNGRmd4C6lGmZu5wSzVBWthMq5yBsr7R7KrdQ0Dbwk3T2zcXOM3Y/Whf1ntx49N0++Rb0gI82VRxqX3eMbRq0TFJwK2Wqg4PMTDU32/I/RGLglWe4v7b6gMHsMFz+eLlXyUD1Wq+LCezyuRXhOw31HUPt3J04MSaDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PvuKbdHO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PvuKbdHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737802669; x=1769338669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FBBZb/fYADhhR8mvtpkIZHPKFZXaiMsjTUVYeBdo+1U=;
  b=PvuKbdHOWxtSayBMhU2mn5Hw9IQHQZowIIK2In2Yx1lrom5yC32ob6mI
   spH5rnD3U7Yj2O3y+HyE3mcGenajL5beayTtuE5ObX8eduqu3KbgiInry
   7BzlDXZVBnErofewWcDoMVggg1FRPvfwBygb+1FgEp1rT2Qo95C3qNmxr
   eZJBK4nfkp3PDqyYMX97W/UaYGG0AUBR2wPp5FrdKIK09NwfgeyApHL+8
   W2VSzEx7ki5hkbgnwjTEE+ZRzk8FhpM945+vVBAsXbOraLSUaOWAAxbRt
   VZ0f9+/ODWSgjtIrV2k12gCxsSi0b+4VRbmGgj7zBrCANvhV9xzcAsBqb
   g==;
X-CSE-ConnectionGUID: kVWzkYCiTg2IWg9yn4+Uiw==
X-CSE-MsgGUID: qfYfQxYBQ7OFWwZ62+urIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38243213"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="38243213"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 02:57:48 -0800
X-CSE-ConnectionGUID: ra/AVP3NQR2s+2vfu/CQag==
X-CSE-MsgGUID: +tfm1vvySs2De0A4qgO/BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="112989035"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Jan 2025 02:57:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbdrE-000djH-2B;
	Sat, 25 Jan 2025 10:57:44 +0000
Date: Sat, 25 Jan 2025 18:56:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] kismet: WARNING: unmet direct
 dependencies detected for INTEL_MEI_ME when selected by INTEL_MEI_PXP
Message-ID: <202501251825.rLirqOUC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   6ab8cf3e119e5846b97e0cd66ade22fa83d7ddde
commit: d31eda960d587e7797f948cb91d5cc9cf951e9b2 [2/2] Merge 4cece7649650 ("Linux 6.9-rc1") into android-mainline
config: arm64-kismet-CONFIG_INTEL_MEI_ME-CONFIG_INTEL_MEI_PXP-0-0 (https://download.01.org/0day-ci/archive/20250125/202501251825.rLirqOUC-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250125/202501251825.rLirqOUC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251825.rLirqOUC-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_MEI_ME when selected by INTEL_MEI_PXP
   WARNING: unmet direct dependencies detected for PHYLINK
     Depends on [n]: NETDEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
     Depends on [n]: X86 && PCI [=y]
     Selected by [m]:
     - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
