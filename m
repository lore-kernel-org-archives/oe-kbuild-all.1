Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F71A1662FA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 08:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724834998; cv=none; b=HheAzR76wlvOGEoqH/cWq8XT9IJUdzHmfeYfxsVeyfwwBXX2kCEJ4MuDibudZM+2NpG3I3R6O5Dd+dLDycdWIarAA3bS37uo3GcYmXDvVK/9MF1UPrKWTIkG6SLvvbr7UAmmMG5Ipb7AXfuGscGGguMFpxmh1FoX/ZhNMj1tmWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724834998; c=relaxed/simple;
	bh=PCb4tcMtheTV5WYqWVYXJ0Z3yQEcgvR0Db4ynOKy5cI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KSzhf+GoCcArrh2TB1jsrWnqiE867kZ+JYyRGm21PQWa061DJnJwbtXrAcKWlIqw8u0WUlb5g/SiheyjjCfD7xuuIbdrPAQ+Od7Ea49x0qayUT1aR7+ANmw0tq8/ebO2hgt36FEju/x7A3amnd7z+P5kOuqoHuEbevzsWfV3r5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ICp1L7/A; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ICp1L7/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724834994; x=1756370994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PCb4tcMtheTV5WYqWVYXJ0Z3yQEcgvR0Db4ynOKy5cI=;
  b=ICp1L7/Al2AMz8G00heouuV/L9bociZQ6N4v2URjZR1sdtvsXtlO6MzE
   8Kjc8U7qxdAaxqAw6Jwu1B1mdEMtg5AB6a3Nvh3PQPzMl5s33t5DIIofK
   SALqx7XcxSbFjpk0Y1/MmIHPwZgaTBgRddRFv0mBsaRe7GccREKAkr22s
   3twijYWDy6RMxIJ+VsFpRh1RQRzAmpuars8GcHEp9j0ZraNU1gHbDMmQB
   mRVY8U2Pl+b3r1MEPTnObHwnx7TpmWS2TmQ7ODLqNwvUv2erteGcnxz03
   1P16B/WY67sI74ZdKXceUIDe2zmTBQBKeqd0f5gYoHYuQu09t51QaL00O
   g==;
X-CSE-ConnectionGUID: tuD15EBVQ12YCWui/6s5AQ==
X-CSE-MsgGUID: lcs15rllSJOOwoqX1zQKLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="34509682"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="34509682"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 01:49:51 -0700
X-CSE-ConnectionGUID: vVmY69HHShyXPtUr4NgwnA==
X-CSE-MsgGUID: lkLjJ8TLSROcIaabUcQ7Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="63493132"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Aug 2024 01:49:48 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjEN7-000Kh0-0m;
	Wed, 28 Aug 2024 08:49:45 +0000
Date: Wed, 28 Aug 2024 16:49:00 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 9880/10950] hook_frame.c:undefined reference to
 `sock_info_flag'
Message-ID: <202408281620.6nvQcA6S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   c99409f7fe0f14dae19af75e7e896e7a17b92946
commit: 62b6061f5714aa71e2d5fdb14db9d1341bb82dd4 [9880/10950] [PATCH] security: add security hook point
config: x86_64-buildonly-randconfig-004-20240828 (https://download.01.org/0day-ci/archive/20240828/202408281620.6nvQcA6S-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408281620.6nvQcA6S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281620.6nvQcA6S-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/tkernel/onionhook/hook_frame.o: in function `sock_hook_check':
>> hook_frame.c:(.text+0x83): undefined reference to `sock_info_flag'
   ld: kernel/tkernel/onionhook/hook_frame.o: in function `execve_hook_check':
>> hook_frame.c:(.text+0x103): undefined reference to `execve_info_flag'
   ld: kernel/tkernel/onionhook/hook_frame.o: in function `accept_hook_check':
>> hook_frame.c:(.text+0x1c3): undefined reference to `accept_info_flag'
   ld: kernel/tkernel/onionhook/hook_frame.o: in function `connect_hook_check':
>> hook_frame.c:(.text+0x283): undefined reference to `connect_info_flag'
   ld: kernel/tkernel/onionhook/hook_frame.o: in function `sendto_hook_check':
>> hook_frame.c:(.text+0x343): undefined reference to `sendto_info_flag'
   ld: kernel/tkernel/onionhook/hook_frame.o: in function `recvfrom_hook_check':
>> hook_frame.c:(.text+0x403): undefined reference to `recvfrom_info_flag'
   ld: kernel/tkernel/onionhook/hook_frame.o: in function `fork_hook_check':
>> hook_frame.c:(.text+0x4c3): undefined reference to `fork_info_flag'
   ld: kernel/tkernel/onionhook/hook_frame.o: in function `exit_hook_check':
>> hook_frame.c:(.text+0x543): undefined reference to `exit_info_flag'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
