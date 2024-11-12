Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0D94C91
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 04:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731387159; cv=none; b=YcXqHtPGCImTRxSPXuamQo25vzPVbr2wtLZRevHYWk4rV4qISgkUvwj4pwdnEgFAzs1pDxvTbkbHut71iNhmvhJLTRK5q/gJVm+HMD8+ZmYlyB/xqdccebwGHfCMeQsmUOpjQwvHljgZJIZDU17eLpyeHnyi0uGO1Wz1JkfdUNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731387159; c=relaxed/simple;
	bh=1kdVsdCTTri5ULDYvEw/dzhDNHYR3IgG9JpgUWmgJ7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bsWjgKctfj4OAC/5epfgKW0UVgNk8+hLh945/uikTgVZXQjOMLzehxbX1XG/hN68V1X+LSmw19P5WT7rIo8p+sBBB0tVQ+nbOQfjB2VXHHjJVHFv86CgNBNMU5Xp1w5fFGrlqOvgQ4cGwM9R5azhGFpIGzXuxg2M3PwKmUphhv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0bysf6e; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0bysf6e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731387158; x=1762923158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1kdVsdCTTri5ULDYvEw/dzhDNHYR3IgG9JpgUWmgJ7U=;
  b=T0bysf6eINfmNEdHvBT5m3nIH1AZYPMS0MGxEE1kbqG9+P3/Sisl/zFA
   zAD2LQ/UdOngz+up+Pj9l3NStGxOYftXFXPm1eyrP0NqVNKgBUcXzGYUP
   FJGRq01TILZM11uJ4xkx7zksD2ov5VeJf3z8xWpaEixMZGU4AscOCn0Li
   KsNmTEt5b42SMqHgO1XohUiyMMGoBRk7Pz3F2Z1/99YNV2huFe7jCAcuz
   j8dqApHk2Nw3D7fpUyfdvyRy1aYsyIWc4/T2Dm7rtcWXM1lIN8kYFJPaq
   7nWM8TIjqCx2Q8Pjq1SOVogRaWQfL5KWe5fKgxcPmBkTdJX35Y9Z5fkcM
   Q==;
X-CSE-ConnectionGUID: XH9y2xusSja+te9feJswoQ==
X-CSE-MsgGUID: aNXVryRTSt2rrBkVMpixZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31357952"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31357952"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 20:52:37 -0800
X-CSE-ConnectionGUID: ZNvJdCqiSS+20RADYJXxBA==
X-CSE-MsgGUID: cxqWOYJxRiSeFWT6P81YVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="88052820"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Nov 2024 20:52:35 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAitF-0000TV-0x;
	Tue, 12 Nov 2024 04:52:33 +0000
Date: Tue, 12 Nov 2024 12:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 9715/30000] kismet: WARNING: unmet
 direct dependencies detected for CRYPTO_ZSTD when selected by INCREMENTAL_FS
Message-ID: <202411121253.dmnXuEiX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   104cc535f91241da2629d8e2d5abcf57a97b0afd
commit: c3e816a56786096a2f1521a3445a5f6b056af6f9 [9715/30000] ANDROID: Incremental fs: Add zstd compression support
config: x86_64-kismet-CONFIG_CRYPTO_ZSTD-CONFIG_INCREMENTAL_FS-0-0 (https://download.01.org/0day-ci/archive/20241112/202411121253.dmnXuEiX-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241112/202411121253.dmnXuEiX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411121253.dmnXuEiX-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_ZSTD when selected by INCREMENTAL_FS
   WARNING: unmet direct dependencies detected for CRYPTO_CRC32
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - RDMA_RXE [=y] && (INFINIBAND_USER_ACCESS [=y] || !INFINIBAND_USER_ACCESS [=y]) && INET [=y] && PCI [=y] && INFINIBAND [=y] && (!64BIT [=y] || ARCH_DMA_ADDR_T_64BIT [=y])
   
   WARNING: unmet direct dependencies detected for CRYPTO_ZSTD
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
