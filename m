Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE11839E6DB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 13:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771940627; cv=none; b=pW1eTilOX3LyNvQHydkTLuOJbP6XXUXO3/BlRconHgM7KaKmZZJ6hAXiSqpPX3I+ZWyVt7gPy6smWlsLTgG4cU695Vcvp6r8BhO2LeqMriRDjCyTo87QD0iTG0D7l47uLEG15j9moa374PDkImARuuBO06wm6HXfHwlHDbaJCc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771940627; c=relaxed/simple;
	bh=lzUDvlcNfCbriKI3jg/PuF+vm/NMfj8dx4H8yiDDnPI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dk+h7PV2oh907ljeMXy19SMUehogVV9jPk/1NLgfBQQUZppKds1M9VJFNEIRbg50yWKNT7ijIvUH0NOllrCG+7UmPDit40iVGDJ16YjnxHZ7aWEXHM+l1/LKaKkKiZmtTuNtWYf/nVCvrIfYsIznfh2Lvd2uh7oWETx6jGp2DE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYA8bRZm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYA8bRZm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771940626; x=1803476626;
  h=date:from:to:cc:subject:message-id;
  bh=lzUDvlcNfCbriKI3jg/PuF+vm/NMfj8dx4H8yiDDnPI=;
  b=fYA8bRZmD/U/ucDdt113+q9DgYtBFQYaQ6fAM37S8W/EJ4B8AwKIB+cv
   SFg/mChMYSjbHMlshjX0SH6dNBGTcAMft39LH0ZNdA4OLfXGE+O0l+rl4
   2pBmyrai9uVVMD5xg04idM6/jkG177QDUpabgfEbmeo2DRbePU7cGO8NR
   2MhICb1QXwubwreM5+4b+yBhzcAlE+JD3awiy5GMLb/i8+NzW06zsm4+R
   z8uzacWM9uQaUwWxa5WIDLeg5+fFmgZOJAe9n4ac01iC3dmz4cnftWoze
   dySk8KN2RKV8ZoL0HXmBfxOBaxnFFBa+DVxVKiJpV2bIycHYh5mvDZDlY
   Q==;
X-CSE-ConnectionGUID: l1xZksjfRFy4CWhEEsVlqg==
X-CSE-MsgGUID: U8pv4DwtTrOrmbt13cY9Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="95569525"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="95569525"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 05:43:45 -0800
X-CSE-ConnectionGUID: 74IFW5o+QLCclNm1hoyfjA==
X-CSE-MsgGUID: Uk3PkuifRZuxKsqp/RizZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="220492359"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 24 Feb 2026 05:43:44 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vushS-000000005JJ-10Jh;
	Tue, 24 Feb 2026 13:43:42 +0000
Date: Tue, 24 Feb 2026 14:42:52 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-DMR-APX-ANBZ29353 30/30]
 liveupdate.c:190:18: error: implicit declaration of function 'memfd_create'
Message-ID: <202602241425.LpPHtq8D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-DMR-APX-ANBZ29353
head:   d8e6957edead90297a4f8cb1f247c54e559dbf8c
commit: 16deeeb8139c8017bc9a2eef904c688946fbabad [30/30] selftests/liveupdate: add userspace API selftests
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260224/202602241425.LpPHtq8D-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602241425.LpPHtq8D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602241425.LpPHtq8D-lkp@intel.com/

All errors (new ones prefixed by >>):

   liveupdate.c: In function 'liveupdate_device_preserve_memfd':
>> liveupdate.c:190:18: error: implicit declaration of function 'memfd_create' [-Wimplicit-function-declaration]
     190 |         mem_fd = memfd_create("test-memfd", 0);
         |                  ^~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
