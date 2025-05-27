Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712B8136347
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 04:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748321068; cv=none; b=QZY/yKVcFVbO8uFxxAG6ynI4+MqzBT3DQG/UvOTbKSsum7FDESzn1cmJhhlbnaPcNvXI42iuDnyhXx0c3oYLPmuN2anqI/e4w+MGlFvkf4XPbIamoW8q7a1sM7OUXvcyWcITGefitCi5MTwiFJEaFYj4cudfH+AZ6bMW+8cSUTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748321068; c=relaxed/simple;
	bh=giKuITiVksW186WMg0XL7H5IE5QcAgzPJYq314QujKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BraWZEN5ykf65a5eW4jhO+m0s28Di61y+XR3mFshhz+SS73DTle9a4VBhFrzEHJQpD1tM1giTSAszXgeniZIIZijEhZ4OSRRs0tvzhvUqq4sTEpqSIFcTuw8cM3CtARm0ccWKfoMQDTq1oWq57BzbCoGDXucfaX5cyDwd5Dfqa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYpXOLtj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYpXOLtj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748321066; x=1779857066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=giKuITiVksW186WMg0XL7H5IE5QcAgzPJYq314QujKo=;
  b=PYpXOLtjTk5X6yfszGBGYJFmwjGh8DsXZO2IDj9ilICbqqEV35gJQ1K5
   9aKCVrVaZFdeY1RReTvuyFU4te5NSPGWlhiCD19pPc44hHW3b26Zx+whs
   ThZcokkfLox1B3ZXJR+usjxCNW31FG1X3fAnXcPQ81e84y6lJmf18qLAP
   NY9a7e8MY5qj12Dv0FyzjWgaD1fp5fRGADzL5gYn4vI76SvKgRqGuUc3P
   psBjh3JlOWgwdHRrQ5GiQwBwVFfqHf4WTJX/VfFR+a4FrcXgEThbnPj3U
   TWrGSnf6VokI+pn9+9JzSmJWm+wFSI+wNoXNsV+cAkIhNwViFuEwiZys3
   A==;
X-CSE-ConnectionGUID: tYq9LkhOTvKPHf14gGYqMA==
X-CSE-MsgGUID: 3/XLorGMTUKB/7JUhNBuJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="54097969"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="54097969"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 21:44:26 -0700
X-CSE-ConnectionGUID: 1oSQINRxTYqlddSBlixpQA==
X-CSE-MsgGUID: ysc1Ye/EQeyovnA3XeHVLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="142993679"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 May 2025 21:44:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJmAo-000St6-2r;
	Tue, 27 May 2025 04:44:22 +0000
Date: Tue, 27 May 2025 12:43:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1/1] WARNING:
 vmlinux.o(.text.unlikely+0x10b84): Section mismatch in reference from the
 function gic_smp_init() to the function .init.text:set_smp_ipi_range()
Message-ID: <202505271254.Ge57x0WH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   71d0515397de96c7ff0dd2c6be6e2af7a113e997
commit: 5f824b386b4038f7059c781a67edd8cc4c66eeed [1/1] BACKPORT: irqchip/gic-v3: Configure SGIs as standard interrupts
config: arm64-randconfig-r111-20250527 (https://download.01.org/0day-ci/archive/20250527/202505271254.Ge57x0WH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250527/202505271254.Ge57x0WH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505271254.Ge57x0WH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> WARNING: vmlinux.o(.text.unlikely+0x10b84): Section mismatch in reference from the function gic_smp_init() to the function .init.text:set_smp_ipi_range()
   The function gic_smp_init() references
   the function __init set_smp_ipi_range().
   This is often because gic_smp_init lacks a __init
   annotation or the annotation of set_smp_ipi_range is wrong.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
