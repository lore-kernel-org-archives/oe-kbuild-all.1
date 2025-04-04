Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3352E62B8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Apr 2025 04:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743740924; cv=none; b=GZSoO6mvUOkBPD9OrkrS3qJRXzIrhOy5ChJKIji2J49xAnPUYWILpbZIH+KHgAFKEkTzq7YVY+lX8Uc6rPaITUxCjKbtNJJaLyqZdQLc/15CJAc0CjAGUYa4vgNyjMA7hoD33u9UajFGq+xOVcvJFhNREm8b4odmJzTKewE2wXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743740924; c=relaxed/simple;
	bh=awfPBZvTvJfJJfgk5qGaoz0cX53rXtiEvNLx59uAYog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c1/UR207ybF4hOgjGlaJf6b7PLROp3B1sunm1PkVY2WseVjKaRazAbY8T2WovvR3quODjrznJY3q7sAcMl0HFNTrVsXoDsqL5zqYN9/vtQY5Fv6YhYm78GizcpZBbO1zl9Ewt19yEHJYmMwNrWEUWjz1VrpeWvmhhdkadVZdWVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RPZHfqY8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RPZHfqY8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743740921; x=1775276921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=awfPBZvTvJfJJfgk5qGaoz0cX53rXtiEvNLx59uAYog=;
  b=RPZHfqY8/bVjrx8qt1DVd5vasEkqqxeruZWHib2Vonr4jsP+6j5NtgQO
   PEbbEL3GG7Vc9yP/6TnyV/QRF1OSoiKRtV1XWtYLlfgRNxzvcM9YlWCDk
   UfqGXW/76wPQXbplPn6+Ca8f0KwMYA1CrnE4gkA5GKzWKJ8ZVlHo4SroR
   1o0F3imwd9r6MJL/OCeH2JjRvaQiAOQoWqqczT4QQR3hljeBuEEk1DWfY
   7gHDP7xvVCBHrbyOjUwt+ao+X2uz5wqMaTi3g1w4ldHTkCpd4YvtK+KpQ
   RQ7ZrJqhFWXQf1XUnssEeWQi6szngPduDZSaXZfdmJ5mPq6wC2uKtATbJ
   Q==;
X-CSE-ConnectionGUID: A4WdJcBrSEuBZvMTlkIaBA==
X-CSE-MsgGUID: AQQysG7wQNKE320TwMwfqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45064719"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="45064719"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 21:28:40 -0700
X-CSE-ConnectionGUID: A0YBCYjaSYKkyMNyX0m49w==
X-CSE-MsgGUID: HyI7JFy9R+ucAYJ1KHbNag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="158198289"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Apr 2025 21:28:38 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0YfU-0000zD-1a;
	Fri, 04 Apr 2025 04:28:36 +0000
Date: Fri, 4 Apr 2025 12:28:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/1] fs/f2fs/f2fs.h:2189:42:
 error: no member named 'read_waiters' in 'struct f2fs_rwsem'
Message-ID: <202504041249.I9zbFmeM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   18c0dbd488a87918fed6132a8975b90444454472
commit: 7a9cbd82c8b5f839a256b5b24b9775b2b09c7cf5 [0/1] ANDROID: vendor_hooks: add hooks for f2fs down read
config: x86_64-buildonly-randconfig-003-20250404 (https://download.01.org/0day-ci/archive/20250404/202504041249.I9zbFmeM-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504041249.I9zbFmeM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504041249.I9zbFmeM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/data.c:25:
>> fs/f2fs/f2fs.h:2189:42: error: no member named 'read_waiters' in 'struct f2fs_rwsem'
    2189 |         _trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
         |                                            ~~~  ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y] && 64BIT [=y]


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
