Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86BE1E491B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 06:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755930515; cv=none; b=HqeikNMOewQN6e0Lv8vaef+YCgqMHzv755X7N/UHWB7iyl18aZ1oDzu+azvVQDbxmwWvdg4hMWYRnpReGJbCfieugPF9Z4yZjKeCQiX755K2p0JF+Fkzbds/7xVKvs3iJXH5Fe7TP3zx9CsK0Nrrw66t8hoGYIm/dsw4YpJJtVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755930515; c=relaxed/simple;
	bh=daK6mIijV9FzA0G0u3fTiBhj0KFsGBcuxrYhWq1XTNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ex9jN86P/MQOmCAWbGKzQV8ehdNlYFkzZwfzDUv4Z1LIYVsmptUgnVBWe2NUyJTj3Ot2jlAXxZM+Ode4pg6pFQVyMpFX512iwQDAuWPHM27nfu8qpnpFl5qmCW+qbo4ec95CAKNDRcF6z2hs9z6qEL1PGrj+KtkwH2wCcGF6hbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/RxAdaw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/RxAdaw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755930513; x=1787466513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=daK6mIijV9FzA0G0u3fTiBhj0KFsGBcuxrYhWq1XTNk=;
  b=Y/RxAdaw0Cv8STSOaLyhr8v/CVC3FEpJleAZvsZKZyAaxSoWY4y8IAo6
   ouk1DjsSFQ1HU5qF8CkQ4td57N79P44HcxUPRTWNaJ1OqqxhxzFdNbQR5
   quEL2G0irrqlgm/ILfMQCD2UP4HHjUcvYEBvucuhuwmiTIzbgvItk4UfW
   MJEx1en90i7gag9QJJMPM3Lsp2CJuoqjy6CgrIkQBL32H+IWpeZhRz+dM
   ukiwV2bW94FynGmHIUGkNeUrtxqQSdMTllUYu9jenVaIHWrQMS/zYWlIn
   +7HMqO/h62jDf2IO0jqVyczwi8MAqksgm1H+oVYHDbEmZ21NBNB2V2+S7
   w==;
X-CSE-ConnectionGUID: G+ooXTmmQ3SLT/DK/wKv6w==
X-CSE-MsgGUID: 34nBC5WBTdWSdflnhUm6nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57938208"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="57938208"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 23:28:32 -0700
X-CSE-ConnectionGUID: bGbB8S4jSwGMUi095SgweQ==
X-CSE-MsgGUID: hPZbtPWpSna6+h1njPxmkg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Aug 2025 23:28:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uphjo-000M8D-38;
	Sat, 23 Aug 2025 06:28:28 +0000
Date: Sat, 23 Aug 2025 14:28:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 7/7] kismet: WARNING: unmet
 direct dependencies detected for INTEL_MEI_ME when selected by
 INTEL_MEI_HDCP
Message-ID: <202508231449.qAjPIYS3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   3f8a5612f90e91c6acf0f22bb5fa67ad1ce1c1e4
commit: d31eda960d587e7797f948cb91d5cc9cf951e9b2 [7/7] Merge 4cece7649650 ("Linux 6.9-rc1") into android-mainline
config: arm-kismet-CONFIG_INTEL_MEI_ME-CONFIG_INTEL_MEI_HDCP-0-0 (https://download.01.org/0day-ci/archive/20250823/202508231449.qAjPIYS3-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250823/202508231449.qAjPIYS3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508231449.qAjPIYS3-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_MEI_ME when selected by INTEL_MEI_HDCP
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
     Depends on [n]: X86 && PCI [=y]
     Selected by [y]:
     - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
     Depends on [n]: NET [=y] && WIRELESS [=n]
     Selected by [y]:
     - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   
   WARNING: unmet direct dependencies detected for WEXT_CORE
     Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
     Selected by [y]:
     - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   
   WARNING: unmet direct dependencies detected for WEXT_SPY
     Depends on [n]: NET [=y] && WIRELESS [=n]
     Selected by [y]:
     - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   
   WARNING: unmet direct dependencies detected for WEXT_PROC
     Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
     Selected by [y]:
     - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   
   WARNING: unmet direct dependencies detected for WEXT_PRIV
     Depends on [n]: NET [=y] && WIRELESS [=n]
     Selected by [y]:
     - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
