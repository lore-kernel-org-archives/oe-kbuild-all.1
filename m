Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9A13BD22C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 22:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788647237; cv=none; b=BgHb59ikU/kb+oEFHYk6PKh5S8qO92g+kIyoxYQUZq9UnNhSgl/KJlyxR7ydPDhVXd/AL9tiGa7LNpvB2a3DvaEoxx14IypLw4RQkf0Fu/EiihRz+AEPuef8oZEbep/KUmcWqU0WP2zVCbB9ydqnnhiW8LU8n22ou9VP1BR7aSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788647237; c=relaxed/simple;
	bh=w4FvxTqpCKe4OhzheVDaehAU1a/A4eMv0YMz8Gd4t4k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MTQZLGUdpEXXdNzdpz1oEuHafHm4qav38sqnZHdQWcBXYbfKk1yr4X654OvKt6V5cqNr5v6b/pvc0xfz+jX8zZlPIqemDVXY2tMEkNPOtUbY8514/oVYAu2SvjYyUGlyZ4mFzrK1zKyHYJT45fYXTAvR664a9UPM1Fie/H0ctFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqyKc5nL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqyKc5nL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788647233; x=1820183233;
  h=date:from:to:cc:subject:message-id;
  bh=w4FvxTqpCKe4OhzheVDaehAU1a/A4eMv0YMz8Gd4t4k=;
  b=FqyKc5nLmSrqPEeo92LWCIvrDusF1B6jafH/P/GiRtLUQShcpw7N9FHG
   A0t9IH/4wCdWdAK8kr185a3mjM6ma41nRBdxySoi9y8kKv3qddNqEfnyi
   hT02bmwzs382iO7/GBD+IXcfso4KG96B5pdC661xsxeUmqes2WjCdoUlC
   /3o5V8GPFIDoHTHV6Rojimx5jW/TfETZzOShBPcbeilxBLwS2APrVxTYV
   BdREfYDKsxWurhIevmE8o3UZ+6DBpmOsy/zUzR0H1700I//mXqNhuNkVZ
   CgkHoap8Tuo4t6cwgcXJOElMn3xGTlW9l5B923SWBBRNvXAMJit0lAFCW
   A==;
X-CSE-ConnectionGUID: b4ROSMaCSIWNs4Fw5PA7zw==
X-CSE-MsgGUID: 2wR2/6ECQ3SiHa6qLkBiwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="114649815"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="114649815"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 15:27:12 -0700
X-CSE-ConnectionGUID: Ejp0z8pEShGOxwlumOCJyw==
X-CSE-MsgGUID: pqWPM4k7Ryy7FhaV1rBO+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="268623171"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Sep 2026 15:27:11 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2yqq-0000000019H-2Z51;
	Sat, 05 Sep 2026 22:27:08 +0000
Date: Sun, 06 Sep 2026 06:26:12 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3205/4370]
 drivers/firewire/config-rom-generator-test.c:13:9: sparse: sparse: incorrect
 type in initializer (different base types)
Message-ID: <202609060630.rC0Zz88P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
commit: ee9a8c9afb579630fec599a7736a5ee677301a27 [3205/4370] firewire: core: add test for root directory generation in config ROM generator
config: csky-randconfig-r113-20260905 (https://download.01.org/0day-ci/archive/20260906/202609060630.rC0Zz88P-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260906/202609060630.rC0Zz88P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609060630.rC0Zz88P-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/firewire/core-card.c: note: in included file:
>> drivers/firewire/config-rom-generator-test.c:13:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:13:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:13:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:14:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:14:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:14:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:15:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:15:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:15:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:16:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:16:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:16:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:17:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:17:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:17:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:18:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:18:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:18:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:19:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:19:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:19:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:20:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:20:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:20:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:21:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:21:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:21:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:22:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:22:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:22:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:23:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:23:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:23:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:24:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:24:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:24:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:25:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:25:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:25:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:26:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:26:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:26:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:27:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:27:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:27:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:28:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:28:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:28:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:29:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:29:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:29:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:30:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:30:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:30:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:31:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:31:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:31:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:32:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:32:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:32:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:33:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:33:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:33:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:34:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:34:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:34:9: sparse:     got restricted __be32 [usertype]
>> drivers/firewire/config-rom-generator-test.c:46:29: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __be32 const [usertype] *const expected @@     got unsigned int const * @@
   drivers/firewire/config-rom-generator-test.c:46:29: sparse:     expected restricted __be32 const [usertype] *const expected
   drivers/firewire/config-rom-generator-test.c:46:29: sparse:     got unsigned int const *

vim +13 drivers/firewire/config-rom-generator-test.c

    11	
    12	static const u32 config_rom_bare[] = {
  > 13		cpu_to_be32(0x0404921b), // bus info
    14		cpu_to_be32(0x31333934), // |
    15		cpu_to_be32(0xf000b223), // |
    16		cpu_to_be32(0x01234567), // |
    17		cpu_to_be32(0x89abcdef), // v
    18		cpu_to_be32(0x00051b70), // root directory
    19		cpu_to_be32(0x0c0083c0), // |
    20		cpu_to_be32(0x03001f11), // |
    21		cpu_to_be32(0x81000003), // |
    22		cpu_to_be32(0x17023901), // |
    23		cpu_to_be32(0x81000008), // v
    24		cpu_to_be32(0x00064cb7), // text descriptor leaf (from root)
    25		cpu_to_be32(0x00000000), // |
    26		cpu_to_be32(0x00000000), // |
    27		cpu_to_be32(0x4c696e75), // |
    28		cpu_to_be32(0x78204669), // |
    29		cpu_to_be32(0x72657769), // |
    30		cpu_to_be32(0x72650000), // v
    31		cpu_to_be32(0x0003ff1c), // text descriptor leaf (from root)
    32		cpu_to_be32(0x00000000), // |
    33		cpu_to_be32(0x00000000), // |
    34		cpu_to_be32(0x4a756a75), // v Juju is a code name at the development time of this stack.
    35	};
    36	
    37	static const struct generator_test_case {
    38		const char *const name;
    39		int config_rom_generation;
    40		const __be32 *const expected;
    41		unsigned int quadlet_length;
    42	} generator_test_cases[] = {
    43		{
    44			.name = "bare",
    45			.config_rom_generation = 0,
  > 46			.expected = config_rom_bare,
    47			.quadlet_length = ARRAY_SIZE(config_rom_bare),
    48		},
    49	};
    50	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
