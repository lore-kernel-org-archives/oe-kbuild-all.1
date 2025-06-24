Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A433F26B094
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jun 2025 23:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750807643; cv=none; b=Ukfb4AwXE3eKYQEsmx2Be28ayVcyuyW750E4oBDSzpwYJJVcSNg0cI2Lj7wXIzopFT5xIt3kim4OP1elphNsE1OJJTpgzdd30IV+UV+kvdVvZt2f4dZ7TZKYFYu1ojGNNzvdxwIvt56X8v7IxWrC20zg3SBSpc1Z0jn+JaFr5lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750807643; c=relaxed/simple;
	bh=vkqiiBqvCRZpre6CjPfkJcFjxqo0MBUm9xmCZV5705k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ejxImZLjCZdpPIiy5yoCT9PZ31SPzkf8FJzhSiaDoUioVVVbUIWh546fgH4DmBEEMPPSicuoq903mxAE8GVKN6jRGR0QQRQdwtjL5Qjz61xbFulEGd3Qkyha1sEeV0eKHkqKcp8su6E23+cfneX+KtVBgwyp2eMltURcLiyfJqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FPzlFllB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FPzlFllB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750807641; x=1782343641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vkqiiBqvCRZpre6CjPfkJcFjxqo0MBUm9xmCZV5705k=;
  b=FPzlFllBIV0aOuesUUNuy8RNJuMWfxUdDEn85BpIiqRAm8wVUCK2S9xp
   u5RHA9FxnqhLeaTs4iFJiXXfYvrpEfLa3SVdej+OX/2cLGFpNgN6aop4a
   8+AX7qfcyPMPi3QJke15hLw9hAs2c+Hc5ZXF0ApdbP7/WkCP+zW6hRkEK
   Gv8r3BolaHQbYw9VlH1fiGhsZPCN1aeedL5Ez3+I6F4AW/74fIUof8BpH
   eBlvsOg03E4ztJaWh3UMEclzra8x4dZarN9xAN942Wzy227sESmWaFIII
   IKCEGe4ALWK9jaLYg4U7gkBFuI69Xy7Y0Mxox16Se9bBqWgA3RJVf/7Lv
   w==;
X-CSE-ConnectionGUID: 27VG5gCmQ3WPeThb20nORw==
X-CSE-MsgGUID: UEZEWHEcQXicD+QDRugqOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52180636"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="52180636"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 16:27:19 -0700
X-CSE-ConnectionGUID: AFWtqjaQTZi1w5I4BJIDWw==
X-CSE-MsgGUID: MFUUAL8hQtWK2q9eQ5vRcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="152174721"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Jun 2025 16:27:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUD2q-000Sb8-0B;
	Tue, 24 Jun 2025 23:27:16 +0000
Date: Wed, 25 Jun 2025 07:27:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] fs/f2fs/f2fs.h:2189:42: error:
 no member named 'read_waiters' in 'struct f2fs_rwsem'
Message-ID: <202506250720.leUjT6oZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi yipeng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   2078b865052feb57c7a4e7c72ec4c76d28e69454
commit: 7a9cbd82c8b5f839a256b5b24b9775b2b09c7cf5 [2/2] ANDROID: vendor_hooks: add hooks for f2fs down read
config: x86_64-buildonly-randconfig-004-20250625 (https://download.01.org/0day-ci/archive/20250625/202506250720.leUjT6oZ-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506250720.leUjT6oZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506250720.leUjT6oZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/segment.c:21:
>> fs/f2fs/f2fs.h:2189:42: error: no member named 'read_waiters' in 'struct f2fs_rwsem'
    2189 |         _trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
         |                                            ~~~  ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]


vim +2189 fs/f2fs/f2fs.h

  2182	
  2183	void _trace_android_rvh_f2fs_down_read(wait_queue_head_t *read_waiters,
  2184					   struct rw_semaphore *rwsem, bool *skip);
  2185	
  2186	static inline void f2fs_down_read(struct f2fs_rwsem *sem)
  2187	{
  2188		bool skip = false;
> 2189		_trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
  2190		if (skip)
  2191			return;
  2192	#ifdef CONFIG_F2FS_UNFAIR_RWSEM
  2193		wait_event(sem->read_waiters, down_read_trylock(&sem->internal_rwsem));
  2194	#else
  2195		down_read(&sem->internal_rwsem);
  2196	#endif
  2197	}
  2198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
