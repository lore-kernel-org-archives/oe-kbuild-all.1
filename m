Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1C42D063F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 18:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765303565; cv=none; b=YIfQz9fK8KmoIULK+UBESy5VuH4MqV4AfYXH/xCMLS2KsfMzLS7+SJRDkfOCzIRKRHbr+QRU7j0ahXzX7/Q36Ai0Y9h5oLWhmjmhMfH8pwpgTU1fDDZtf5H7kyR2b4JGgB8+vL2FkUdTFlP1TkUpv6R7vS+BjVooDFP+P7ETe+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765303565; c=relaxed/simple;
	bh=Ii7Ryf+/0FMJ6ilObzseU6bllZ69hpVIsWlzkwRWn70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nh080qjzUt5ZwE0G2/Nh9NH9ybl2Bs+aS2wzaA+Dg5Q7biS9R+V1JDS2R6NUdsHM3gQVKy+yfcSM2z+IostwKPA/KGnZtQr4IwT2DDS3R44sHxn5U8Yq7ybu4ALDwXVsHhvUooKqBMBtBGR0XWqHXblo/UB7R9zLNyYFtKN4B2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hc+OtHzH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hc+OtHzH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765303562; x=1796839562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ii7Ryf+/0FMJ6ilObzseU6bllZ69hpVIsWlzkwRWn70=;
  b=Hc+OtHzHVCO9Cekl9TpMMeJnD9zSrMyqZIXMkC0pYmjomiNVsg2hp8ry
   97KkS94oAudu9Le/sHIxfphdvv/ninS0t8oVdlzBNvhWDn3DEAWWPs6BY
   diCsS+sJnlxVt5DEKJa0FrRLW4Mx9ZmAb3+HBa/wjA7/LVbyCw3smwxDY
   fhhAKpWFZZNLH0MZjNzQ9s2cnlJFtm9g0thtfMMNMawr6iifjU+MbVxBx
   PvYSec6VHu0gjgVKApCOv2nTpwxtnpAuo30rBc0eIdiWo77j3WmqWgvcc
   SLSqTHDmGAi9u5pRPt6Pim33p/znX0uDjaZrWssZNBSEyy6pK+bq6SRUl
   g==;
X-CSE-ConnectionGUID: UMLTz4HTTNGBUNZkGABQow==
X-CSE-MsgGUID: M0LC2MIEQu2Rl2qMpl5AYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="77884476"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="77884476"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 10:06:01 -0800
X-CSE-ConnectionGUID: kwcqz60jRkCoD6Ypv42Y9g==
X-CSE-MsgGUID: 6CfK0ws4SaGQ+IZDXhOjgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="226955193"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Dec 2025 10:06:00 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT261-0000000028I-28Gd;
	Tue, 09 Dec 2025 18:05:57 +0000
Date: Wed, 10 Dec 2025 02:05:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 8/8]
 drivers/vfio/platform/reset/vfio-platform-calxedaxgmac.o: warning: objtool:
 vfio_platform_calxedaxgmac_reset+0x169: undefined stack state
Message-ID: <202512100138.l2GcNirB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   36b0641190f41e775eda8e00d55eebe83eebd927
commit: acd4b6b3c4098b7eae68484359098c8bd4f74039 [8/8] ANDROID: x86/paravirt: Add pv_mmio_ops
config: x86_64-buildonly-randconfig-005-20251209 (https://download.01.org/0day-ci/archive/20251210/202512100138.l2GcNirB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512100138.l2GcNirB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512100138.l2GcNirB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/platform/reset/vfio-platform-calxedaxgmac.o: warning: objtool: vfio_platform_calxedaxgmac_reset+0x169: undefined stack state

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
