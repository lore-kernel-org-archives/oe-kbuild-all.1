Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376163BB136
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 09:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789138; cv=none; b=Tl5PSrJuurA54/Yz98KnsQmxbHCM6/sVJs+mfHqutbLazBXrGveORkDmI67HDcSmi+2/GrQPz3Xlm6+zh9TnYpLd6Vchy7S52FyAsEl604vEEEf78I8SmYWaDt7LExnmEEvrftg4uCWQX84LLn+cvYJyE9DNiN0qCZxvYMNUswQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789138; c=relaxed/simple;
	bh=tdgB5Tv3HkgwIOeU4BuWY5gqvIS5aKEqKgWQTDe1qLQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=StZ1MxCcrYwPlL8ETkAzcZUDNgAmedLrBpep3J3o+6wm/BEx6Ic8vu7ch+0dB04ynxWyxXC4Ic9cNeWE5HCdrg0XAT3OioAGwjDqlq7nibFEVrhHzGxVOAUmd9HFOLuY4Bzzp0hMumaWdtC4OAppXejnkQK0nRYxynzNBzWoHvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VHn2NZSq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VHn2NZSq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779789138; x=1811325138;
  h=date:from:to:cc:subject:message-id;
  bh=tdgB5Tv3HkgwIOeU4BuWY5gqvIS5aKEqKgWQTDe1qLQ=;
  b=VHn2NZSqZhhJgJ8u7I6eUzOKv3aqwrHqfIclbgDDLs/ojZ+/Y1OA63in
   ZFB4uCC6g5HiJWq8PR11weop3fJcWSC3nBty9qvO8rDccBz7o0nu21g9J
   7fsAEUvxZgYrJj1llbseC+H+Tyf8N0iyPZObBYgYKvBnOSLGJ3a74qiru
   AFF/IgP3MpWdOk6XSBwp6csVvrYq2aKe1mT0EFlwt7lUK7qjAkOim6ubv
   cZJHotdiWHfOlIESPKon+IruRxU69jccJyEjIbICkzvSMY0ArOEJi0nNe
   8LCir8BuhG1WXLtHOiW+fRdFeh0KYA5qnFLOVg1crYjOR4VnHfKpGlQZY
   g==;
X-CSE-ConnectionGUID: xdn+UagORkmXJcTTzTNodA==
X-CSE-MsgGUID: 6dzTKxgwRH6xw13A0xnZvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84484769"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="84484769"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 02:52:17 -0700
X-CSE-ConnectionGUID: uejICFoaQxGjYKq7f/X9LA==
X-CSE-MsgGUID: z0RumsM0RJ23dv+UGHxw6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="241723850"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 May 2026 02:52:16 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRoSL-000000002JS-0IFu;
	Tue, 26 May 2026 09:52:13 +0000
Date: Tue, 26 May 2026 17:52:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2] Warning:
 drivers/ufs/core/ufshcd.c:2811 function parameter 'iid' not described in
 'ufshcd_prepare_utp_scsi_cmd_upiu'
Message-ID: <202605261712.ubwQkYsj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Konstantin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   edd8299e5e604db7b686b3e9351b57e39055d4b2
commit: 28c108aa56a37d8dbc634378b7bc828bb3465f88 [2/2] ANDROID: scsi: ufs: Add UFSHCD_ANDROID_QUIRK_SET_IID_TO_ONE
config: x86_64-randconfig-161-20260526 (https://download.01.org/0day-ci/archive/20260526/202605261712.ubwQkYsj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261712.ubwQkYsj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261712.ubwQkYsj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/ufs/core/ufshcd.c:2811 function parameter 'iid' not described in 'ufshcd_prepare_utp_scsi_cmd_upiu'
>> Warning: drivers/ufs/core/ufshcd.c:2843 function parameter 'iid' not described in 'ufshcd_prepare_utp_query_req_upiu'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
