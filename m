Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2737A2BD1B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 03:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743566263; cv=none; b=cwzqSOQZygJ/jHR4v1JsMUHPLj6nt/EEim6bosRjPNyW6cBJrr+yamwReeqRpvXlgobdADL9zb62cYlfDshVl2RDJvqHWl2vAyYXqb/Ae4tPSfVcXs89tMRmNSAFsCCRFDNBteCKUtMkg3fy+E9eybcr3JpacnpOBk8LBoggjoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743566263; c=relaxed/simple;
	bh=r3W0F0uflv5MOlvDyKDiM2oqrl0KmyDnLdobVoEdwr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FUaCI6AMSQ0aVIgDT0cDlYz6sKfy0RwY/Wymo6LH4LhOVDktx/MgaLKxPGo6f50H9q4K+vkfPnHTJippkYeVDJpm/SjCNBAhsnJ5iI/ugCn2kKTmlYpAEZvdkM8UZkPxiL08Bo6yynIijLjloZmgqVkcMKKwUlyAE6GYTYz0LfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QmUE6kW2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QmUE6kW2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743566262; x=1775102262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r3W0F0uflv5MOlvDyKDiM2oqrl0KmyDnLdobVoEdwr8=;
  b=QmUE6kW2pp07CD0dSx+sd87RtQWF0ps3xubCFM2o+o84ZTkhEWtyAlhm
   AQysfauHHFV3Lo9uuHD/HCk1fcmNDhGopxiyYqzK3vcqr25ht5NFFPt94
   oIDJbIong9vs7/9Zqf7akPqoO78lnfyFTvexi5i+1oVGkaKZrmGuVsvXp
   h2OMlylt+3TWjlxhVuN0Jw3hV1+GoSKRzVnd2rykQPoPl+3UXz9m3KKGC
   6W2rv5LvPzW7Bu8XpyWxINIdW/8kYfQow3wjFBldSxiBev6D8fvNmQNMK
   8RXRfUCdABDyGxjiD7STNHgdTkaTLt6J1urTjoyLWqo6icadi7bpS+5GM
   A==;
X-CSE-ConnectionGUID: ciTYwmJETPGy31fyh6EVIg==
X-CSE-MsgGUID: rLGYQN0SSwapNw1hhp9DHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="62447473"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="62447473"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 20:57:41 -0700
X-CSE-ConnectionGUID: K16Wv/viRAmd84QkSJGDDQ==
X-CSE-MsgGUID: Cxuzf0vsRsSGvFJJXy8zNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="157560383"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Apr 2025 20:57:41 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzpEQ-000ASc-0w;
	Wed, 02 Apr 2025 03:57:38 +0000
Date: Wed, 2 Apr 2025 11:57:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1] kismet: WARNING: unmet
 direct dependencies detected for ACPI_THERMAL_LIB when selected by
 GKI_HIDDEN_THERMAL_CONFIGS
Message-ID: <202504021122.9wo9AjsJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   68d4a6392d8b6a8598e9882ab3a4077b85d11b04
commit: c9e60fd1823c5aa4950d3a00ed2f76deb56fb0c7 [1/1] ANDROID: [TEMP] GKI: x86: Add hidden thermal configs
config: i386-kismet-CONFIG_ACPI_THERMAL_LIB-CONFIG_GKI_HIDDEN_THERMAL_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250402/202504021122.9wo9AjsJ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250402/202504021122.9wo9AjsJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504021122.9wo9AjsJ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB when selected by GKI_HIDDEN_THERMAL_CONFIGS
   WARNING: unmet direct dependencies detected for USB_PHY
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - GKI_HIDDEN_USB_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for INTEL_TCC
     Depends on [n]: THERMAL [=n] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=n]) && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_THERMAL_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB
     Depends on [n]: ACPI [=y] && THERMAL [=n]
     Selected by [y]:
     - GKI_HIDDEN_THERMAL_CONFIGS [=y] && X86 [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
