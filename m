Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941058;
	b=XgXiImlyBu/IQuABmPBP9KtfCWHy8yTlHHrO2CYIsWep4ruA7L5WHi9CKI3xBz44y2WQ
	 F+r5AfbXwjlupt0x0y46w636+U7Nij0WsfgCiOZi3XFznDd6tvmQTXJFojPiUmdQSgjZE
	 gjJ7qevDNJ05NFw/lFNBnkP7mi7zrK6w7Q6wuj+in8bgOQxyfhld7OQIMwnUhfcYG5iFc
	 k+mqCV7vWjsl2dHEVLJAyDJnCGtzuCF4m3RMshQNDM8okxKxd6j1YrwODEV87O02l/ElP
	 MQ9U2g3YnEAoC6LbPjVvBdDvtsuIrmb8bbqfBNF7uA3tyLkzDy3e20gkYcsQk4P1IvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941058;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=2t8jwubNGc6qVMrV7MinUmFjbXeo5D0Hf6Lz5v607zo=;
	b=zeGf3V8ZpG/e9HR3w9adQg2nkYsvX6AM1WmO2q2ryhfTt/jdVcj+9TCluBJC13r5SyXH
	 ObF7CJsFy0oowrjDaTyowONXUAHAQWlUIEpvRDL5PT0A+RegFCP9B5UQjEHksCoq1Vorh
	 MFxFvcCrpxutqfn2nz1wg5qGNaeCOWTkVt9TWHwPuTsJIbOmtSSXW5xZ7GPAmvfpSaFRG
	 SJ1mB0dE1FjCxJ674+FtExoGwcbLs4NCcJbLQJEul+Cnxl7QKsMgwto6oza39vRsDBKdY
	 s9kyAPncicDanbfAfe+O3+qOiMgvTRWB7IR68BwUA7TdbeRl/usxDKNZV4keauYO1Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Td359PCE;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD12E606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 18:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD12E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Td359PCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794941058; x=1826477058;
  h=date:from:to:cc:subject:message-id;
  bh=mlXFwEyAtBQwNwlu0EIajUqB8OKun1R4is7ZPbTjjFI=;
  b=Td359PCEdVkroWr2FFW77uAxodicAEHsghS7YubociGGhPnEgR0h2Axx
   7DUu0bZkN2einsm/MKfiVTvvuF9Z5/8v/cZwbGH0e4I1stwHtWogf5gqy
   KPZmxZQox34XfW89ONotuZAr27ILsIkuCiUTmvnfLJh2nG1AdN7+aLt1W
   KvIlHaIm+B1JW+YPWA8Y3zMoxdfZXBZ6b7x/lBb8BN8Gvbe1Maf145Z60
   HNbu9PCkjvJQ5AlPAdAcrldirQuZzb3ShW+oJD0OUefXRxtftCP7027Yz
   i3u/7Qx2e+1MemLNNB08I1b5y+/L9DOJM+aZJykHDj2Qst9aD/dDoLAwP
   A==;
X-CSE-ConnectionGUID: 1fSa21hISdaTBIhyGBsG6w==
X-CSE-MsgGUID: JCpCUCi2QWqm7ySCPHkQ4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3648885"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3648885"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 10:44:18 -0800
X-CSE-ConnectionGUID: ZoLe+LsCQzGYi2XAWAprDw==
X-CSE-MsgGUID: gQdOFZi+SGW1shLEWD4lxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="11843489"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 17 Nov 2026 10:44:16 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTOA8-000000003BS-3oBk;
	Tue, 17 Nov 2026 18:44:12 +0000
Date: Tue, 17 Nov 2026 19:43:58 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 15/15] vmlinux.o: warning:
 objtool: x32_sys_call+0x1537: __x64_sys_exit() is missing a __noreturn
 annotation
Message-ID: <20261117193805.ilmIxmdu-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   1e0ab69e5e91f731731cd7c40b1142b2e6dac781
commit: 7de61eceed0333ff197dd5dbda2e9648c62b6556 [15/15] BACKPORT: mseal: wire up mseal syscall
config: x86_64-randconfig-r2306-20261117 (https://download.01.org/0day-ci/archive/20261117/20261117193805.ilmIxmdu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117193805.ilmIxmdu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261117193805.ilmIxmdu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: x64_sys_call+0xd0f: __x64_sys_exit_group() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: ia32_sys_call+0x164b: __ia32_sys_exit_group() is missing a __noreturn annotation
>> vmlinux.o: warning: objtool: x32_sys_call+0x1537: __x64_sys_exit() is missing a __noreturn annotation

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
