Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961F526BDBA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 01:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739238533; cv=none; b=UiBadHSUzGTba3WCusKuajtnqc28hPpDczCUj9ZkEsIdsCAR0PD/lb09Iy2g70GC0mG0u8ph3srGHfanUXaJsS/6KZ0QE8E9SK90cLRK9kEu414ZCVUGjzlKOqQydLIoIl/+70t6I1pYjX0FhU5nBukjcohdLlBaHLcj1dYAWu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739238533; c=relaxed/simple;
	bh=jkn2znR0NeJCQPy5kzKwSveuf57/qkRDu8nWgCKwwiM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JRcneABkbMfqrPrrImhogX+k0FQNuzoEzXdVa6abDMh1YtRCJ5udIY9+Av/8oa37+cyobrlLOA8vliBvEgBflhcqOiAJ1aEZsfM8YDWkZZfmu1Tv0zY842WpbvOnLx2mIjgcm2NWXk8jOcBvVIcmtVtBhVs6Fm6SYj4r99LnAzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ByAU0/+/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ByAU0/+/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739238531; x=1770774531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jkn2znR0NeJCQPy5kzKwSveuf57/qkRDu8nWgCKwwiM=;
  b=ByAU0/+//AtoigdS+fN0dBmw1qn8FLnzzHL3cTt97B5VAtlthyvY1TgI
   lU1RY+TH31iXai/a61gq7dW25mYugq3G6f+TUARslG5b8mVeyP8g+09fn
   A0mG4eVGKYKpvUqIEX1ShOZjqGPbBWzWYQzUT1GJlPZdMFkJGdN6aO3l1
   6bEkCVYNJBULrrKP4FqeOZQCr5kuy9xzkBWRaFM9gWvDP2kRvowkUXaMC
   2E6itbJtz7GU995v1a2hc3ylO3KLQjEfJlhVUJmquPYlRJ1ZsAdQ6WB3s
   FOZi+vdxwFkFAFl3wmsVfVSaA/LiCvvaQzSwSoiNi9QcOZNyczvlMVNL9
   w==;
X-CSE-ConnectionGUID: OmV96373TCOml2c8rJMtuA==
X-CSE-MsgGUID: DG4BZ8MpRqeGP6ZROV7+NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="40113856"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="40113856"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 17:48:51 -0800
X-CSE-ConnectionGUID: HxcUe1m8RL2sFV42V3/lHQ==
X-CSE-MsgGUID: BRTTeguBS4mRvjcqjaE0lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="113008797"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Feb 2025 17:48:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thfOK-0013db-00;
	Tue, 11 Feb 2025 01:48:48 +0000
Date: Tue, 11 Feb 2025 09:48:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 11/11]
 bq25890_charger.c:(.text+0xb4c): relocation truncated to fit:
 R_AARCH64_CALL26 against undefined symbol `devm_usb_get_phy'
Message-ID: <202502110920.Y2WAAOCm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   39762b7a60e9a0f1e5cd736d30163ca936a1ede2
commit: f7941b37ab1c4cc0a85a5617d32495908c3d08a2 [11/11] ANDROID: GKI: Enable CONFIG_USB_PHY for usb drivers like dwc3
config: arm64-randconfig-004-20250211 (https://download.01.org/0day-ci/archive/20250211/202502110920.Y2WAAOCm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502110920.Y2WAAOCm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110920.Y2WAAOCm-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_probe':
   bq25890_charger.c:(.text+0xb4c): undefined reference to `devm_usb_get_phy'
>> bq25890_charger.c:(.text+0xb4c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `devm_usb_get_phy'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
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
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
