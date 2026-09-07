Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA8729405
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 09:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772692; cv=none; b=HPXUcwKxeevTfv4xAn8nSOuU91Ro13DN68JrdcJv00AmovzXU9r5HKARzN4Y3FvpXwMF2qyKT4hF3gxVIb2wBC0sTf6bQAqW5KcUmHP3D3zSbMEPO8uDSderq38ALjpJs+bzVC17B4Ty8DJ+6R7XCqXB5MoYaKFTd0LaYTFErjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772692; c=relaxed/simple;
	bh=1iNVpgW8c0LMiliz5vp+EtKmeXuBsGFghCQK/HA7Ay8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IiplvcxWCV+4261oQpuaNweTVjWI5ClU5YgdwXeZutaL+yK9VpC/YNrCgpfJAiTJc+vKJwdkDD5O4qRqmu9cdQ3UFfaXJBWppP19YOW2npnmWrVIqZumzEjh1LxwVvevUhhFpddOBPlyEoJxeHa4VneT+Wy+psTrY8x+gamcQrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Brp/VYQb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Brp/VYQb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788772691; x=1820308691;
  h=date:from:to:cc:subject:message-id;
  bh=1iNVpgW8c0LMiliz5vp+EtKmeXuBsGFghCQK/HA7Ay8=;
  b=Brp/VYQbcfAjSmMz/X+CsTzVog2J3XPuCvGkzlIGEvB/jK4cf0CmVVwx
   aSIyek15s8gJ7ZVvlxxP2CZ5BYd2Xw6IQVBGooTL2mZ7qkr/viNK3/xJO
   kQkzttpw9RYa+k4WARmmZhv+R35iiEt/FYN/HZ7XZEMnaPUhQhsv/PInN
   Nz1sDDT2OVphOFqUwwctctbZuBgFtJk5nCSI8xqaiW2Pr99/oQiULsZaV
   eJtD3EClRwGfT9HTsmbeULE5phCbVG181LfeY3YO0gj5lBPouWzpwqDgS
   2kcOcoP3J4y9FiA19oqgARX08i45EmPw8yIH4l3zyqmKBzTnOINk3a3a1
   A==;
X-CSE-ConnectionGUID: qdzA9hZPQEqkbHD8W4sWiA==
X-CSE-MsgGUID: 4JJ207kPQq2UyPlUbudVlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="100332952"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="100332952"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 02:18:10 -0700
X-CSE-ConnectionGUID: bHd21x9ASaSMfz0qvzyLGA==
X-CSE-MsgGUID: YhrbCT9xQQuPms7l+MdZCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="269349514"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Sep 2026 02:18:10 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3VUN-000000000fz-0brO;
	Mon, 07 Sep 2026 09:18:07 +0000
Date: Mon, 07 Sep 2026 17:17:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 254/254]
 crypto/fips140-module.c:46:11: sparse: sparse: symbol
 '__initcall_start_marker' was not declared. Should it be static?
Message-ID: <202609071758.CrmZPcEg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   7025f9c2fb2cec65324445321db6486af3876474
commit: c6d5a767217ce93403528e99f1a1eb401a26eeb3 [254/254] ANDROID: fips140: add kernel crypto module
config: arm64-randconfig-r134-20260907 (https://download.01.org/0day-ci/archive/20260907/202609071758.CrmZPcEg-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 419c22c908c97dac45d161ce56fa01b99ec7debf)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260907/202609071758.CrmZPcEg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609071758.CrmZPcEg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> crypto/fips140-module.c:46:11: sparse: sparse: symbol '__initcall_start_marker' was not declared. Should it be static?
>> crypto/fips140-module.c:47:11: sparse: sparse: symbol '__initcall_end_marker' was not declared. Should it be static?
>> crypto/fips140-module.c:62:10: sparse: sparse: symbol '__text_start' was not declared. Should it be static?
>> crypto/fips140-module.c:63:10: sparse: sparse: symbol '__rodata_start' was not declared. Should it be static?

vim +/__initcall_start_marker +46 crypto/fips140-module.c

    45	
  > 46	const u32 __initcall_start_marker __section(".initcalls._start");
  > 47	const u32 __initcall_end_marker __section(".initcalls._end");
    48	
    49	const u8 __fips140_text_start __section(".text.._start");
    50	const u8 __fips140_text_end __section(".text.._end");
    51	
    52	const u8 __fips140_rodata_start __section(".rodata.._start");
    53	const u8 __fips140_rodata_end __section(".rodata.._end");
    54	
    55	/*
    56	 * We need this little detour to prevent Clang from detecting out of bounds
    57	 * accesses to __fips140_text_start and __fips140_rodata_start, which only exist
    58	 * to delineate the section, and so their sizes are not relevant to us.
    59	 */
    60	const u32 *__initcall_start = &__initcall_start_marker;
    61	
  > 62	const u8 *__text_start = &__fips140_text_start;
  > 63	const u8 *__rodata_start = &__fips140_rodata_start;
    64	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
