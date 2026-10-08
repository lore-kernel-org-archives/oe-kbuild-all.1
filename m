Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0F43911A8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 22:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498641; cv=none; b=Ze63FzB/n8ZMUUtB2HMmtPQgKZTtQBkx79TGjJY3KfUttLVCYTK871wKfcz0A2WUqZuUoFHkV8dFXDQMLWE9lUxjpelHuJjC7VcMqCIiERb/bdiwAmW4dmqJjGuWVlQZIeYKupneCcWuVHADLipVAes1cIe5308MINpKTmjoQW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498641; c=relaxed/simple;
	bh=Mlp/kVFWosMe3Hzi4VTOTLBk7ppxOCQlKIl2M8I3Eps=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h6B9wZ+nZ4aFQO2PTMM2mXUjv6C5xhzAvfth8tTOYNjJpfL4kZr8evhACHx1V1c4/9DenWldD2s9V38wZFKRw7fMeF2kp/2VY4Tz521Ujz8NVBYprSjJHKQyEqtqHzkK/HwvfIulX29JxwwhI1j0/c4CqurIlDRjr0TLO5xqNSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C+xFv3hC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C+xFv3hC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791498639; x=1823034639;
  h=date:from:to:cc:subject:message-id;
  bh=Mlp/kVFWosMe3Hzi4VTOTLBk7ppxOCQlKIl2M8I3Eps=;
  b=C+xFv3hCWLqDACkNgiVFN/ByNmzTAHk/ikfUW5QcDUt5Yt7BTF1viWEp
   TYRnK3Gerqk5Zf5hN8PAx8qM9In2u4mMSuYfJkv2V0oY10PgBGZBy66e5
   bD1xmf0Pu8dQxwJjBKZlO7YgMPuThJXJVDJ+cKj8oFrp/phjZ+WU1uHcC
   d9k69TiNImw1n409PLUDahNZO4+uJv6Gvi4KihuVeCPs4ZYBt1+sUSn6M
   JdxWbYCm21RwXocE9P/5wHdMSc5Na8sR2AABRcM3DAcDZ4BpLx6bcO5ec
   YdAGom1oo7ZOiiTCu+KthYtE7TPW9hhPoa2E4ha+kC+r6XbLaRyU6wmEF
   A==;
X-CSE-ConnectionGUID: 06tfO/BbRGS20kXt0SSvsA==
X-CSE-MsgGUID: xqSvh8TITqCADptmLM3OWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="168816"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="168816"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 15:30:38 -0700
X-CSE-ConnectionGUID: FxHQL7O2QLyzsZR2r4ZTTw==
X-CSE-MsgGUID: Z2A8wNKKQzOwPDGqgEuoMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="276958"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 08 Oct 2026 15:30:38 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEwdH-000000006Cd-1t9F;
	Thu, 08 Oct 2026 22:30:35 +0000
Date: Fri, 09 Oct 2026 00:30:19 +0200
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, fuse-devel@lists.sourceforge.net
Subject: [mszeredi-fuse:extent-map-v4 24/29] dev.c:undefined
 reference to `fuse_backing_close'
Message-ID: <202610090007.UyvnxsIF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git extent-map-v4
head:   4b2887a36cd547c2e59952e0a202094c82d9c6a9
commit: 922208fbfd2948a12a6348cc34709e6d54e4fcef [24/29] fuse: support 64 bit, server allocated backing ID
config: s390-randconfig-r2301-20261008 (https://download.01.org/0day-ci/archive/20261009/202610090007.UyvnxsIF-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610090007.UyvnxsIF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610090007.UyvnxsIF-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: fs/fuse/dev.o: in function `fuse_dev_ioctl_backing_close':
>> dev.c:(.text+0x793e): undefined reference to `fuse_backing_close'
   s390-linux-ld: fs/fuse/dev.o: in function `fuse_dev_ioctl':
   dev.c:(.text+0x7a94): undefined reference to `fuse_backing_open'
   s390-linux-ld: dev.c:(.text+0x7adc): undefined reference to `fuse_backing_open_64'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
