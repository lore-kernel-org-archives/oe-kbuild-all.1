Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59221183098
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 03:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730777167; cv=none; b=ATQF5UxhqHSl69RnkSSm9+U3TTFszTo8/kvQ0cs/0QXv8uu2D6GZCXE5RGeC3TXt999CeaExthD27j/6EWA0mnr5oXx/H1U1pAEagZ23Ojg2NfBDMjzKUi+ZtThK06fs5iLcckRIA6rnLp1Br/bSzm5SLoPqUI/bDjb4E7UVgeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730777167; c=relaxed/simple;
	bh=eiyF78PjEZxSz/jXdOO7rOIk4QRdEmDAJezANmG/ajI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IneWeBMepC0nUq8+HhqpNSlD/yYKBcLGh72ZkfeKQKfHmuQmQ0KU/ho9YaYFsl8eVUQ5vx5oPIGaa22cWloDCENLcH0C8BpYRvXuZqB/ZULUl37SM7IBqtEg0OI9o2P0LaTXycRMtO50fkFEsOrjNo/xrxDqkjpsv1HgAVPza6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BzO05OKD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BzO05OKD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730777166; x=1762313166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eiyF78PjEZxSz/jXdOO7rOIk4QRdEmDAJezANmG/ajI=;
  b=BzO05OKDtZ2AMZL8jJWTEWCBddrjcEDcSUhURVZEqu4PY6dhajLvZaUf
   mvgaVscPX5A0ecRvtRtbVVIlUqytIbknbW4bSH9EUyqCXtaV43H6yLM0B
   LM04taCkfnx8Ysm7S7eAdisXrRA1EAO6O20AphZm1kDaoccSfNNVE+Xxa
   sKAP6AmUrZ+vlYfXsfj6g8gUZVRAxOH94SbmpfteCGwJgESQFTJKbveh8
   CiKc7AMO6YkXrDrNm+wrqlJTqrL6Oh6m6dKID4u1YDdgHnQbxZU47+NK0
   2mdvFcorE/w1zLzim+3HQdBzCwiufZ2JtffBiRnaKZooHXKO8IxQBQLQV
   w==;
X-CSE-ConnectionGUID: Wozj4l77TzWuF1HeT7tXrw==
X-CSE-MsgGUID: bWHQUD+FSNufwpmOmj/pyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="55906211"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="55906211"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 19:26:02 -0800
X-CSE-ConnectionGUID: +EK4MxmJQ6SaKHXUiyM7iw==
X-CSE-MsgGUID: hjWxT/bKT6yCZbUruDLrSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="87788404"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Nov 2024 19:26:01 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8ACc-000lY9-2D;
	Tue, 05 Nov 2024 03:25:58 +0000
Date: Tue, 5 Nov 2024 11:25:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ram Muthiah <rammuthiah@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Alistair Delva <adelva@google.com>
Subject: jack.c:undefined reference to `input_free_device'
Message-ID: <202411051155.mYOoJcfg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ram,

FYI, the error/warning still remains.

tree:   https://github.com/ambarus/linux-0day syzkaller-id-5ecbc557fcdb8a2864e876f690ef377db999c50f
head:   caa714448992ba4eb583735a4acb26917fbc67a8
commit: 1e702f432d551041753c46ec0d6d49484e776441 ANDROID: GKI: Added missing SND configs
date:   4 years, 8 months ago
config: x86_64-buildonly-randconfig-003-20241105 (https://download.01.org/0day-ci/archive/20241105/202411051155.mYOoJcfg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051155.mYOoJcfg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051155.mYOoJcfg-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: sound/core/jack.o: in function `snd_jack_dev_disconnect':
>> jack.c:(.text+0x47): undefined reference to `input_free_device'
>> ld: jack.c:(.text+0x65): undefined reference to `input_unregister_device'
   ld: sound/core/jack.o: in function `snd_jack_dev_register':
>> jack.c:(.text+0x163): undefined reference to `input_set_capability'
>> ld: jack.c:(.text+0x184): undefined reference to `input_register_device'
   ld: sound/core/jack.o: in function `snd_jack_dev_free':
   jack.c:(.text+0x4ed): undefined reference to `input_free_device'
   ld: jack.c:(.text+0x531): undefined reference to `input_unregister_device'
   ld: sound/core/jack.o: in function `snd_jack_new':
>> jack.c:(.text+0x691): undefined reference to `input_allocate_device'
>> ld: jack.c:(.text+0x720): undefined reference to `input_set_capability'
>> ld: jack.c:(.text+0x80c): undefined reference to `input_free_device'
   ld: sound/core/jack.o: in function `snd_jack_report':
>> jack.c:(.text+0xa64): undefined reference to `input_event'
>> ld: jack.c:(.text+0xaf0): undefined reference to `input_event'
   ld: jack.c:(.text+0xb11): undefined reference to `input_event'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
