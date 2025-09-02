Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B7F323E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 06:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756793460; cv=none; b=UQlspEYYd1noX1mM8cm/SdLYdkt19mzinr0Uqwg/j/JzSRObcV+bZRxW9RzQcXSo/POjsReI8ZnqM1pJaMVRdV9lyfwTiy9PZnc4UN7N4uv06dS9rcayFJbrw5MjTY9fx3hrZpfoLy1yyJ3hNZnhr7avrpMqNLwHonu52+Z18Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756793460; c=relaxed/simple;
	bh=OtZS4c1ofDjeshEwOcW3WlWlvnW0fsLJBe5BhkxT/Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FTYqPq8mNc/YBLB+2LJ6h4uAz7Mwj2SPSeBg/WEAF1nL3AeA6pSTrGt661wrrkwL1ZFAVDqlxwApXZkiMB0NQL8/cw7vVXAO6TLCJ+VRF4I5J+ObYcZvtnrl46f9hF1jJr/paDlr5ipJC14Xb+/uTbKsr5U/KFqILOhRKbYLENw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jUUVGHy0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jUUVGHy0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756793459; x=1788329459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OtZS4c1ofDjeshEwOcW3WlWlvnW0fsLJBe5BhkxT/Nw=;
  b=jUUVGHy0JUTZkYJXX7vcGpK5kTHrMNsfi42Ks4G3az2nfnQz/pWNN+kt
   7tMuI2dcwALNFX1YUWS219F4No3dDnIpGb7WQFGQ66ra/AyeQ1ciZUlI6
   z5mWAXvf9ugMpRtM9XzeH3awE45m/wReuoK+MzX38UTCyHbGOLGd306bi
   vDqJtY9o4LKfPgyelHWvykKlLPhtf0fVWdgVrtsKFioZ6GEwbA/E5ndUx
   cC2vbFjEt0pXjvyURpZaY8luyqhlyvqCVPDqX4fxVUKLdLRMd+Z/W4lO7
   KZkhA8GKmIJKZJj1B0bjAnV4lVPHlOhIudSn/fWTGCeb5wcOcEv+6PiGZ
   Q==;
X-CSE-ConnectionGUID: 1prA8Z6FTFGtcNKWzkE9DQ==
X-CSE-MsgGUID: E/QeFa8mQJy8HVjs3DSo9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="61689797"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="61689797"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 23:10:58 -0700
X-CSE-ConnectionGUID: s9lVyWe/QZux3YK6iglKIA==
X-CSE-MsgGUID: dWvxfl/TQseVn6HM/t1ozA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="175563804"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Sep 2025 23:10:56 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utKDf-0001Ux-0a;
	Tue, 02 Sep 2025 06:10:28 +0000
Date: Tue, 2 Sep 2025 14:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-09 0/1] fs/f2fs/f2fs.h:2189:42:
 error: no member named 'read_waiters' in 'struct f2fs_rwsem'
Message-ID: <202509021401.kQktaQ8O-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-09
head:   efe70d86de873c3b4d76fdd8e6ef37ffa3a1c4c4
commit: 7a9cbd82c8b5f839a256b5b24b9775b2b09c7cf5 [0/1] ANDROID: vendor_hooks: add hooks for f2fs down read
config: x86_64-buildonly-randconfig-002-20250902 (https://download.01.org/0day-ci/archive/20250902/202509021401.kQktaQ8O-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021401.kQktaQ8O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021401.kQktaQ8O-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/data.c:25:
>> fs/f2fs/f2fs.h:2189:42: error: no member named 'read_waiters' in 'struct f2fs_rwsem'
    2189 |         _trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
         |                                            ~~~  ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
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
