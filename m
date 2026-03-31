Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98CA2DB794
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 23:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774998655; cv=none; b=M6er5nIMz7iC748J99v+iBnOQTqO/D9S5I/oTkPbp2v1Cs8yp3mA0Fw3Xz4BLbKfCwLdZpQ1v2ZsnvyOzWYDVtSpxNC2i2cyd8HLt+wkr6iwHB0T0Uu4nL+Xt2TFMc2/TgQYzxqvRVhhQ46eVy6iScWSL2NxBMkK9avxZHzi5co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774998655; c=relaxed/simple;
	bh=P8Axd4NAHBpJQVhx6KD21+UxtQu/88LlrzOXzornrXQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u5S7gNoBzwRfUbIwffpQVeQN8mbLoNibj4T5R+2bxI+nSFIbp7AnefWYWkC0v/CoeQNLNUtkClsEiIvrMjzXPCa079z4SQzr5ZDsyMC+QPeCXOu7ESZ3XN53FfJ/7aAjsDZNS7M1Y4jiwV++MQ6BewetjKtiQH+7iCzPAU0ZIIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kecWKzHD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kecWKzHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774998654; x=1806534654;
  h=date:from:to:cc:subject:message-id;
  bh=P8Axd4NAHBpJQVhx6KD21+UxtQu/88LlrzOXzornrXQ=;
  b=kecWKzHDZTx3UTa6R1Ye/mezy2cjH74tkteznBbNAKGogZj4wQaZAVdv
   2YhkDdgh9AnCDaphOLkW23DFDnEGkmSPtSofotsdN6mXEhz76k7ro4muW
   jlWMW6GskbEfaWfbnmctfmoPrMwnYvPUduLtdMbdksJwI82eY0kBz242C
   AXnbEXmDUqYyLSg2F4cACQTw0XJvfjkklXVhe1L7oS57+0FLy/8M7/vW9
   SD0r1Qikgh/54nSMUpYoCNmxTGvD4w9S7j6yZ2SthazmE8Lm3vNwqSGY1
   61mFt7kFKvZbG3URw7+AfadupGUmxsReiFPHpnGfrOpTZPY3dW6yM4LZ0
   w==;
X-CSE-ConnectionGUID: b4AOejH5TA+Ftxlum61BTw==
X-CSE-MsgGUID: 84mMWTD7T6SzliKVwlPflA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="98638413"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="98638413"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 16:10:53 -0700
X-CSE-ConnectionGUID: 90dU186PQtukvBkdQRXgFA==
X-CSE-MsgGUID: CsWh5Hp+Tf2pIYjGoZ93yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="223197009"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Mar 2026 16:10:51 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7iET-000000004Ov-1ZUo;
	Tue, 31 Mar 2026 23:10:49 +0000
Date: Wed, 01 Apr 2026 07:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 0/1] ld:
 mm/shmem.o:undefined reference to `ashmem_memfd_ioctl'
Message-ID: <202604010736.pzKtuvMC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   5a9c9e4d03fdceddbdb6e2cf9180ffc3f9c13dde
commit: 398bbc0409f7586f909b17195dc4a1268d855277 [0/1] ANDROID: mm/memfd-ashmem-shim: Align ioctl handler name with Rust version
config: i386-randconfig-006-20260401 (https://download.01.org/0day-ci/archive/20260401/202604010736.pzKtuvMC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010736.pzKtuvMC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010736.pzKtuvMC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: mm/shmem.o:(.rodata+0x568): undefined reference to `ashmem_memfd_ioctl'
   ld: lib/decompress_unzstd.o: in function `handle_zstd_error':
   lib/decompress_unzstd.c:92:(.init.text+0xb): undefined reference to `zstd_get_error_code'
   ld: lib/decompress_unzstd.c:94:(.init.text+0x14): undefined reference to `zstd_is_error'
   ld: lib/decompress_unzstd.o: in function `decompress_single':
   lib/decompress_unzstd.c:129:(.init.text+0xc6): undefined reference to `zstd_dctx_workspace_bound'
   ld: lib/decompress_unzstd.c:131:(.init.text+0xd7): undefined reference to `zstd_init_dctx'
   ld: lib/decompress_unzstd.c:144:(.init.text+0xf6): undefined reference to `zstd_find_frame_compressed_size'
   ld: lib/decompress_unzstd.c:150:(.init.text+0x119): undefined reference to `zstd_decompress_dctx'
   ld: lib/decompress_unzstd.o: in function `__unzstd':
   lib/decompress_unzstd.c:249:(.init.text+0x215): undefined reference to `zstd_get_frame_header'
   ld: lib/decompress_unzstd.c:268:(.init.text+0x263): undefined reference to `zstd_dstream_workspace_bound'
   ld: lib/decompress_unzstd.c:270:(.init.text+0x278): undefined reference to `zstd_init_dstream'
   ld: lib/decompress_unzstd.c:303:(.init.text+0x2b3): undefined reference to `zstd_decompress_stream'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
