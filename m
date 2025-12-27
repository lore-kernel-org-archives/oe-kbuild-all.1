Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F26A1C3BEB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 08:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766825427; cv=none; b=bvLZejWGtBemUfqRPdmJwRWVKrVXzo5VI2kwtV8AWCzd1iB1k/4rKrTyXJCEBpbGqLlr4QONGoFHSYaFSW4Eae0S0sY9GwiJ1runb/aybrc37jN7kqosOsvcFRp8nawXySHy/BHv+mDrFb6y6dPiEqocE6C6yRD+TqG22H/4FMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766825427; c=relaxed/simple;
	bh=LIYJWRM2ostRzNP24usN/z8CwSMeQ6ey9dstR0ccTmc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X6LBC6XyBnIDGng9iljDIT1EX5wYEycI1MupMW3puiX1jScsJGD2sHL6t0+DaQ9fhU5gAwzbqUfTVFFSY4oDMWH+PDa7jwYVvLOchGKAL0zoLabAe8OgZ77XMZZAh82hgrwMf6FyMEZf6MO05wEZ5Kb2EVTpJJ5a/3HoQXM9rwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oy7fHQCj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oy7fHQCj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766825427; x=1798361427;
  h=date:from:to:cc:subject:message-id;
  bh=LIYJWRM2ostRzNP24usN/z8CwSMeQ6ey9dstR0ccTmc=;
  b=Oy7fHQCjWdxr8tq4QE9ytZnDCZDPU4kXtzOsUXOZJfiJIEtw/RzE3fym
   WIO1maSvyH/FUejG23CjfiVgXcIygABxho4jKQDpHNtVtTDgSsWsV3cE8
   PiuIGH54nFbsJ7fnqOTQQ818AN60II539WspqhKIppWMWeASmz/zUQET0
   pI/wSYUVgVufsuAo0ckroP+ag8A1foUsjTh29WyTBNfSNTjNQtX3eEFIK
   uXkFbJoEg3Nz/2tPGwOgS/WI/O3euksN+b2hHFiiCkKUvx0yMsH6cLFXL
   DgZ+MbiQjQuqZQtVTamZ8Doays8LuQheOdnBeTlD1dEt2tkrxgGxGAMDi
   g==;
X-CSE-ConnectionGUID: o5pR6CLYRiaxp23HxRCdQA==
X-CSE-MsgGUID: l8NvEcMlSIGwIuwcTiTf8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="72162913"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="72162913"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 00:50:26 -0800
X-CSE-ConnectionGUID: 23O5fOIrQp6eTBlqbxxclA==
X-CSE-MsgGUID: 6xnYKm28Qt+6hsQ1pJ4K1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="205052157"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 27 Dec 2025 00:50:25 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZQ08-000000005hL-3dmI;
	Sat, 27 Dec 2025 08:50:18 +0000
Date: Sat, 27 Dec 2025 16:49:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-09 0/1]
 drivers/usb/typec/ucsi/cros_ec_ucsi.c:136:24: sparse: sparse: symbol
 'cros_ucsi_ops' was not declared. Should it be static?
Message-ID: <202512272232.jUUZl9eq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-09
head:   c7331b1c7e46d01561e731f80fd258feb217ca74
commit: 21d2121e6b9b304937bd44176a3773a3e30e5286 [0/1] UPSTREAM: usb: typec: ucsi: Implement ChromeOS UCSI driver
config: i386-randconfig-061-20251227 (https://download.01.org/0day-ci/archive/20251227/202512272232.jUUZl9eq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512272232.jUUZl9eq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512272232.jUUZl9eq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/typec/ucsi/cros_ec_ucsi.c:136:24: sparse: sparse: symbol 'cros_ucsi_ops' was not declared. Should it be static?

vim +/cros_ucsi_ops +136 drivers/usb/typec/ucsi/cros_ec_ucsi.c

   135	
 > 136	struct ucsi_operations cros_ucsi_ops = {
   137		.read_version = cros_ucsi_read_version,
   138		.read_cci = cros_ucsi_read_cci,
   139		.read_message_in = cros_ucsi_read_message_in,
   140		.async_control = cros_ucsi_async_control,
   141		.sync_control = cros_ucsi_sync_control,
   142	};
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
