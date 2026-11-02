Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793578685;
	b=2hQIBF8dirzGiEHxUv3uxtseRRiJJMTUmG4sqglFw3VHQs4P2xiv/VMx6mdK9ddudil9
	 sFp4qRJl6kjCb0PMufR/qa2tTat0qDK314IYfCV0xGwn1WakEVVF+1eTY53/bOFLGhveM
	 hh7t0cy5kfuWoM/jy5rCPFzzvStGP5D+7EEyG2LU1mVnyZQg9ooHsVfizhKjVi82R3EVz
	 9ae1uwqInzWZVa7bUpN/L7Bz9Anatg8Kqs3/xcq2Zvu/rD5m6CGhgt2VmZJ4Eroa2s1Jt
	 qdEMx9t87lCLrz2C7ex6Ne4Y6Ig7NVhrrMXltYRYjA6ibfIOTRhSZSRyeaEDySBIqDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793578685;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=62l5yXEU/hSWQcMxM+Q94ToA/D3bbiEgCPLf2ItklzY=;
	b=wgVAFDn86ifWKsKpIsvIzhmDPgBUbGArZqo6o3f/rW0772gZ5E7yr3SzC3DweOiFITlM
	 4e1ijj1iHxm9WlpIlv1zCrl6bKAZnGEkSyhv/8uEsGzu1g5jlpw+Rllesz0OxhNKuHkYo
	 Uio0mkHMHk4Ue6v+mSaZC1lOXTmTaD+d2l6ex7MGY93FlJ3i6JAFoy344xE3062qGsadL
	 E3Yz2MZHdo2e0rwx8YNuRcZeLV4Xi4VxCx9ZQaT3Hb+WYDbxk4nsXDy529OpfZ9tA8rWP
	 Ox261h7ajhaQ363iIkgKxJEpX3lCo8+4rrYBVx5lmW+offBI1iI8u8e+x1AQpWTt2ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XqFXBlOS;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F9E606A324
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Nov 2026 00:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46F9E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XqFXBlOS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793578683; x=1825114683;
  h=date:from:to:cc:subject:message-id;
  bh=L5T9gk8VC7BmOW+gj5JsYA6WhOgXDEfKOBw92sScgH0=;
  b=XqFXBlOSZQ02AuNoK9jopQU2DsQ8HK8VsuBOl9WTBFf0VlOjBZeAEldv
   RTFSOrf5skclIOt77t6nb3BbyNfdpdPj8StKRf4+l02MZj0WWQpfp6A1I
   wNVsi7uvgdxRyBsHaUz6EZQ4ykuM/Ds73pDD261YEgPMGvnQiy+gYPHwC
   gm959apqQV6/dTZyA8mOe44Azh0jjmkgyH0IlFOtsD7EnbDnoZxLtaosC
   A+3v7L55rVL2maglGN848Pfff1TTKumJlzpkD85wm64g9ICHKOGgO2ooK
   An+JqAVJnUda81jS5jfGkLg3uOR+U3/uArWM+1eHWQZHW5L+eq7Xevo13
   Q==;
X-CSE-ConnectionGUID: S2APTiWCQDKab7yQrDkXWQ==
X-CSE-MsgGUID: 6E/f03CMQkC5lr6wpqMTig==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2258055"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2258055"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 16:18:02 -0800
X-CSE-ConnectionGUID: lpPxy2GORziKK01di5t1lA==
X-CSE-MsgGUID: oWwyQX8ySDmZXqCBUTlNoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="5958285"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Nov 2026 16:18:01 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNfkM-00000000g7Q-2eOX;
	Mon, 02 Nov 2026 00:17:58 +0000
Date: Mon, 02 Nov 2026 08:17:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-04 0/5]
 fs/fuse/dir.c:365:13: warning: 'fuse_dentry_release' defined but not used
Message-ID: <202611020848.miLSJWLD-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-04
head:   ec466d24ad7b3c4a3d9875354a48e8cd2b4e1ed4
commit: be926e6761d28d105ba672242e81e911e0d7e5e0 [0/5] ANDROID: fuse-bpf: fuse-bpf v1.3
config: i386-randconfig-1009-20261102 (https://download.01.org/0day-ci/archive/20261102/202611020848.miLSJWLD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261102/202611020848.miLSJWLD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611020848.miLSJWLD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/dir.c:365:13: warning: 'fuse_dentry_release' defined but not used [-Wunused-function]
     365 | static void fuse_dentry_release(struct dentry *dentry)
         |             ^~~~~~~~~~~~~~~~~~~
>> fs/fuse/dir.c:358:12: warning: 'fuse_dentry_init' defined but not used [-Wunused-function]
     358 | static int fuse_dentry_init(struct dentry *dentry)
         |            ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_SCU
   Depends on [n]: X86_PLATFORM_DEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
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
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/fuse_dentry_release +365 fs/fuse/dir.c

e5e5558e923f35 Miklos Szeredi     2005-09-09  356  
be926e6761d28d Paul Lawrence      2021-12-02  357  #if BITS_PER_LONG < 64 || defined(CONFIG_FUSE_BPF)
f75fdf22b0a847 Miklos Szeredi     2016-10-01 @358  static int fuse_dentry_init(struct dentry *dentry)
f75fdf22b0a847 Miklos Szeredi     2016-10-01  359  {
be926e6761d28d Paul Lawrence      2021-12-02  360  	dentry->d_fsdata = kzalloc(sizeof(struct fuse_dentry),
dc69e98c241e14 Khazhismel Kumykov 2019-09-17  361  				   GFP_KERNEL_ACCOUNT | __GFP_RECLAIMABLE);
f75fdf22b0a847 Miklos Szeredi     2016-10-01  362  
f75fdf22b0a847 Miklos Szeredi     2016-10-01  363  	return dentry->d_fsdata ? 0 : -ENOMEM;
f75fdf22b0a847 Miklos Szeredi     2016-10-01  364  }
f75fdf22b0a847 Miklos Szeredi     2016-10-01 @365  static void fuse_dentry_release(struct dentry *dentry)
f75fdf22b0a847 Miklos Szeredi     2016-10-01  366  {
be926e6761d28d Paul Lawrence      2021-12-02  367  	struct fuse_dentry *fd = dentry->d_fsdata;
be926e6761d28d Paul Lawrence      2021-12-02  368  

:::::: The code at line 365 was first introduced by commit
:::::: f75fdf22b0a84702d1b72fc1ccd53dcdde121c16 fuse: don't use ->d_time

:::::: TO: Miklos Szeredi <mszeredi@redhat.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
