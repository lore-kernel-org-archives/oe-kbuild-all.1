Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7DA25B1DA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 10:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766313842; cv=none; b=CYVbzlLWwlxiuuta/pFQoCnazhqt4c8oMwFVJD0AX5qeyhLkVN8pCv2tDq1/S0s/Y+08+JuuarxzlfzjcQ8v58krgoEm5+L082cJ+9cc80J/gOXgp1WP6iXnFoJNyKoL9zfgGxoGhlsqMUI2uTohnvNfvddnbWUGkdTpE1dX7SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766313842; c=relaxed/simple;
	bh=RQxaabf/zPBcMKg20lRYRMOJarHUy5u6hSAN3WB5TTY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sxFHdQCcAee7Gsue2c67nWOotADSqDVy8XKWM48vXmNbY4PU4G6m01l1XzFupquVRE4HJ6KeJwW7U26fjAqRvD8gkop5r4gc+8shzWAOUWtU3ccsw9NPVQRkQXlDF5BaCNI+hVANrInbRY4BsO578mxeHJrrbPFneInAYaqejaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eR9s2HU1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eR9s2HU1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766313841; x=1797849841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RQxaabf/zPBcMKg20lRYRMOJarHUy5u6hSAN3WB5TTY=;
  b=eR9s2HU19QISVuPCkBh5mXwht7GDRYeMfBXgXtzVpVQfrv8rkN82/5gM
   hGlR2U3vVSjX4HcmoCZRB0+tQ79BDdvfCU+bGtSPyvS5ERpXCSrN0yFKz
   5MIuyh9pyqnkaBX1M8QBJgjWlwBZvgg7g2E0B7ktoX9UmlA8g1PLqBYGo
   N8cfog4wzUYwvDH6MBTiC1j3Sr2Eku2VCEC2fuqK4AMV7f682zGKiwc5c
   7gKDuEK//s9f0d5f8V5KLMUbYMyWNgSf4j6jUcUsG61zUNDL+nq+Seaos
   hsQKcnvuad9pV2nhXMMsPSPKYSboyw6gTAzuMx9pHu+OGQBVophIi9BGb
   Q==;
X-CSE-ConnectionGUID: p8Jws858SPOaWBTvQbySUw==
X-CSE-MsgGUID: PjKLNEt7TVaUwhXF3aZj9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67955192"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="67955192"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 02:43:59 -0800
X-CSE-ConnectionGUID: nDcY8ZiaQvGe8j7lMa/BZg==
X-CSE-MsgGUID: Vf1Zc10lRoezBWN5dyk4pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198430756"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 21 Dec 2025 02:43:58 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXGup-0000000050e-2vzl;
	Sun, 21 Dec 2025 10:43:55 +0000
Date: Sun, 21 Dec 2025 11:43:20 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for HVC_DRIVER when selected by
 GKI_HIDDEN_VIRTUAL_CONFIGS
Message-ID: <202512211146.A6Ip3FUH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2141da9e498139ac37a520b62dfdc77db8003146
commit: 180e8150bde1627efa62910f16ff32d2e4fa85db [12/12] ANDROID: GKI: build in HVC_DRIVER
config: x86_64-kismet-CONFIG_HVC_DRIVER-CONFIG_GKI_HIDDEN_VIRTUAL_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251221/202512211146.A6Ip3FUH-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211146.A6Ip3FUH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211146.A6Ip3FUH-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HVC_DRIVER when selected by GKI_HIDDEN_VIRTUAL_CONFIGS
   WARNING: unmet direct dependencies detected for HVC_DRIVER
     Depends on [n]: TTY [=n]
     Selected by [y]:
     - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
