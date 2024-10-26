Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F400C217F33
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 01:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729907805; cv=none; b=DIkmETitgsEmCGZa+OM22MCpanO7zOpC2csBuh6g894ESvYx4VgOuKZb/QsfEJbb4SYcEMRSV7m0oZbPzCbB56bdfBkk401IlpFExyDq28Gt4OhDr4QvNgnR3uwaTg5Cvp2ipFhymb7Tmm7p82oM7w8i4YAJHGwV6q/2lXcQmrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729907805; c=relaxed/simple;
	bh=nQLd/XJsG1ZyFmk77iFxKrpRnBNMb6E59kLMSa1oYWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=alRjEkXVIFBVWiy6vvjHybluqZYtCa8rzXqXo2tIP5q+3KxMBlIJ/WSfDaBRUMkAfKzLr4xKSUV+2Y4qm3F8/fe1ZF2U0qzER3ZxRF3Pt/rj7RauLuMxYKR3BeVB4QxcdGyGj3eCP91wTHHShJjInuhdL10c7iF1av74miFKkyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TOsz077g; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TOsz077g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729907803; x=1761443803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nQLd/XJsG1ZyFmk77iFxKrpRnBNMb6E59kLMSa1oYWg=;
  b=TOsz077gTgcGVWFICJDxdTCaif1kL+EpiDT2btOQ0k975hWBEApWQefA
   UcDZ4hjRv96w1zFFt7K1ADTcrLsfctzVLkfDeyM5xH40CHHMkCtVCuiC1
   3dHvRIOg1YWRgrR33W2LFMMoJfM0s1spuhXoRmO7/kU8K1nmCM8OHOXJT
   s45cFm+ysKqPRu3tL1a8BdcjGgO3TLFuL54G0RSQqcgF2jruQFk89YOPI
   tyS2vRlqtLJNezHbXz5rU4juOloEwIjxAait4eqg3LJ7XMg/RGpjF8a+y
   eL4A27Wx2rjiAW6Lx0etI1YW1LFKIz/aVYlUzkeaFmq0X6V49yMzFumCb
   Q==;
X-CSE-ConnectionGUID: J1EPrdrPRhSh1NY0DoZgZQ==
X-CSE-MsgGUID: juq44z/ATOejmVI0Qi0Vxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29717971"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29717971"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 18:56:43 -0700
X-CSE-ConnectionGUID: 39zEc/r6RsaWn55ykITGFw==
X-CSE-MsgGUID: FcJLBdsDT0+VE/adxlZflw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="86197310"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Oct 2024 18:56:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4W2h-000Z9R-1q;
	Sat, 26 Oct 2024 01:56:39 +0000
Date: Sat, 26 Oct 2024 09:55:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/5] ERROR: modpost:
 "v4l2_m2m_init" [drivers/staging/media/sunxi/cedrus/sunxi-cedrus.ko]
 undefined!
Message-ID: <202410260949.3JrbxBM6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   592a281e889da4339e27811acf7d5e960a6371b2
commit: 558762106d6e6e046ab9af372b9cadf4222893d7 [2/5] Merge 8afc66e8d43b ("Merge tag 'kbuild-v6.1' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild") into android-mainline
config: arm64-randconfig-001-20241026 (https://download.01.org/0day-ci/archive/20241026/202410260949.3JrbxBM6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260949.3JrbxBM6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260949.3JrbxBM6-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "devm_usb_get_phy" [drivers/power/supply/rt9455_charger.ko] undefined!
ERROR: modpost: "devm_usb_get_phy" [drivers/power/supply/bq25890_charger.ko] undefined!
ERROR: modpost: "devm_usb_get_phy" [drivers/power/supply/bq256xx_charger.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_init" [drivers/staging/media/sunxi/cedrus/sunxi-cedrus.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_next_buf" [drivers/staging/media/sunxi/cedrus/sunxi-cedrus.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_ctx_release" [drivers/staging/media/sunxi/cedrus/sunxi-cedrus.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_ioctl_stateless_try_decoder_cmd" [drivers/staging/media/sunxi/cedrus/sunxi-cedrus.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_buf_remove" [drivers/staging/media/sunxi/cedrus/sunxi-cedrus.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_buf_done_and_job_finish" [drivers/staging/media/sunxi/cedrus/sunxi-cedrus.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_ioctl_expbuf" [drivers/staging/media/sunxi/cedrus/sunxi-cedrus.ko] undefined!
WARNING: modpost: suppressed 41 unresolved symbol warnings because there were too many)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=m] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
