Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E139E288C16
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 11:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814352; cv=none; b=G6QR0wCRURFxIv/cbSy1HBlhZbd7EV4OsRb4rHxW1ukI4gbm1JTgzciacIKzCAi5t2zehioLaOL0JsljSjgZBlnH7lHrAOlu1AScQg6VCh0FeWakA+R/Vxw33agIT36Ko+abChEbpz7KerspNdzDarEn2IrKyadieX3ojaU5+G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814352; c=relaxed/simple;
	bh=UIJr+iZX4Gdn9DfL3DCRNxvwmEFkh1CFaLFimkc0EO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r+3+pqa9huspIa41otDPfSUVpJzzlFlV42ws0BGIgOhEaHhiSKVo/NwAXoxOBPpxFv139azSIFl4fqH/df2H1ryno+1Vg74Fr5EiX7QqvNkM5vFIkNov9aJvCZDkBOq763dViEpqTNTm7JDi8jtkLdePZtVqOfv+CCujPhDLw7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T1FpAVcC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T1FpAVcC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756814350; x=1788350350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UIJr+iZX4Gdn9DfL3DCRNxvwmEFkh1CFaLFimkc0EO8=;
  b=T1FpAVcCZjWbeZ46AtoK7c3O8RmQs3LJDzY6HVXBPSo4QEnd+jdAwxv6
   gaGtygqMzeg46PsYoNAlgVFU1K8Z6MdqKB8GqVzMHRiz+94aHab17BWHE
   GTOhkyGJzmnV27tk6G5Jnd3mxGYiHTd+Q8wSFIpwBMT1GUUcIyNMtMvNC
   baLrVUXG+7eXepBzXBObzHIpEPJyI/1KUV2BGFySvCHFANuW1q3Q3iQjp
   sUJ1CuTKA+b6kXdwzRcdifqOTToEp8ytb8CEEXzYbO3U/Yuv/hBMVeMNf
   t1IDxIiS0NvVvq914YnoQCS39qjjXyQmD6wIZ+AI9jjUg9N+OYEOfoUZl
   A==;
X-CSE-ConnectionGUID: kDgJTJvXT2Wn1ZVxqvLbBg==
X-CSE-MsgGUID: FZ3kH3LQR0iTGez93oAbDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58939862"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58939862"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 04:59:06 -0700
X-CSE-ConnectionGUID: kQDm3EjJS3iMbcHgnSwlxA==
X-CSE-MsgGUID: P0pgDrAyQHO7vgftwu+RwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="194896903"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 02 Sep 2025 04:59:05 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utPei-0001vb-19;
	Tue, 02 Sep 2025 11:58:49 +0000
Date: Tue, 2 Sep 2025 19:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 0/1]
 drivers/power/supply/power_supply_core.c:590:5: error: conflicting types for
 'power_supply_get_by_phandle_array'; have 'int(struct device_node *, const
 char *, struct power_supply **, ssize_t)' {aka 'int(struct device_node *,
 const char *, struct power_su...
Message-ID: <202509021922.sxWTjMHg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   684da1412dd3eb4567a3355be10af89a43b42a44
commit: 64e2ee084b16924dde01aad0849acbc08c9ee506 [0/1] Merge 07b43820437b ("Merge tag 'for-v6.17' of git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply") into android-mainline
config: x86_64-buildonly-randconfig-006-20250902 (https://download.01.org/0day-ci/archive/20250902/202509021922.sxWTjMHg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021922.sxWTjMHg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021922.sxWTjMHg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/power/supply/power_supply_core.c:590:5: error: conflicting types for 'power_supply_get_by_phandle_array'; have 'int(struct device_node *, const char *, struct power_supply **, ssize_t)' {aka 'int(struct device_node *, const char *, struct power_supply **, long int)'}
     590 | int power_supply_get_by_phandle_array(struct device_node *np,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/power/supply/power_supply_core.c:21:
   include/linux/power_supply.h:823:1: note: previous definition of 'power_supply_get_by_phandle_array' with type 'int(struct device_node *, const char *, struct power_supply **, int)'
     823 | power_supply_get_by_phandle_array(struct device_node *np,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/power_supply_core.c: In function 'power_supply_get_by_phandle_array':
   drivers/power/supply/power_supply_core.c:596:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     596 |         int ret;
         |             ^~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_SCU
   Depends on [n]: X86_PLATFORM_DEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +590 drivers/power/supply/power_supply_core.c

dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  569  
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  570  /**
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  571   * power_supply_get_by_phandle_array() - Similar to
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  572   * power_supply_get_by_phandle but returns an array of power supply
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  573   * objects which are associated with the phandle.
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  574   * @np: Pointer to device node holding phandle property.
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  575   * @property: Name of property holding a power supply name.
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  576   * @psy: Array of power_supply pointers provided by the client which is
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  577   * filled by power_supply_get_by_phandle_array.
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  578   * @size: size of power_supply pointer array.
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  579   *
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  580   * If power supply was found, it increases reference count for the
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  581   * internal power supply's device. The user should power_supply_put()
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  582   * after usage.
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  583   *
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  584   * Return: On success returns the number of power supply objects filled
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  585   * in the @psy array.
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  586   * -EOVERFLOW when size of @psy array is not suffice.
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  587   * -EINVAL when @psy is NULL or @size is 0.
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  588   * -ENODEV when matching device_node is not found.
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  589   */
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01 @590  int power_supply_get_by_phandle_array(struct device_node *np,
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  591  				      const char *property,
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  592  				      struct power_supply **psy,
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  593  				      ssize_t size)
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  594  {
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  595  	struct device_node *power_supply_np;
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  596  	int ret;
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  597  	struct match_device_node_array_param param;
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  598  
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  599  	if (!psy || !size)
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  600  		return -EINVAL;
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  601  
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  602  	power_supply_np = of_parse_phandle(np, property, 0);
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  603  	if (!power_supply_np)
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  604  		return -ENODEV;
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  605  
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  606  	param.parent_of_node = power_supply_np;
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  607  	param.psy = psy;
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  608  	param.psy_size = size;
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  609  	param.psy_count = 0;
9f81255173e97d Lee Jones              2024-04-08  610  	ret = class_for_each_device(&power_supply_class, NULL, &param,
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  611  				    power_supply_match_device_node_array);
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  612  
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  613  	of_node_put(power_supply_np);
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  614  
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  615  	return param.psy_count;
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  616  }
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  617  EXPORT_SYMBOL_GPL(power_supply_get_by_phandle_array);
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  618  

:::::: The code at line 590 was first introduced by commit
:::::: dea1a925f6a164bc2b21ac2484983ae40347f012 ANDROID: power_supply: Add a helper function to retrieve psy array from phandle

:::::: TO: Badhri Jagan Sridharan <badhri@google.com>
:::::: CC: Alistair Delva <adelva@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
