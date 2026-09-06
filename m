Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E243217704
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Sep 2026 02:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788662014; cv=none; b=cJeCIIsHHc2P0FO+ML14lzGaE4MDY+vDXaby4H8rV707zb+Vot48xnrgYPcmDsrZdpo8pEZNvfE8LlLLzbS8DFnRG/Wd9mW7MOlFSf4pIoJm3iYiUiTYoSmXigFV48WQ+B/Nsgun3UhHqZYFjptgiu0M+QaFelu6oWntRa+4SjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788662014; c=relaxed/simple;
	bh=34xUeW2fiSp0l6zQzzjde4heE4XWbLlgNyLfO+MO+WU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YdnFRrP+j7vMALOEVeOtEIIISEo8IkQFqOBvxRhAXSGmSMHH6wFsg2DXFav4uO7yqvAf3FtfszlMXbtKLxL9AeQ18eHyy9dpU1r7C2Bky6Ta2VNbTaSexZPlvpCT/TXLlk6toKqjaEoe8jSe64bOHopceLkiG30vJw01HR3uWFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GiYNTX7B; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GiYNTX7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788662012; x=1820198012;
  h=date:from:to:cc:subject:message-id;
  bh=34xUeW2fiSp0l6zQzzjde4heE4XWbLlgNyLfO+MO+WU=;
  b=GiYNTX7BUJ7setKi5CQ8nqd8XQ6r4WzMSXZYc/cXCABFmo+zgf1GDVun
   4OuV0tSRvVoWzPX5oAMkbHwGN9hGPNIZm27/fJRe9//nPHAwMAzg+H7E3
   KZRErDNHTcQJJC/jfns7qbWSk2KIiK5e55zXk0Ggb/KJjc4EjQXCAFvjE
   iuE4jczoJvyT9cEGpdMi6cggcpGYoDNIsIRBgc4lDngjVnlRYsnj+w4z5
   yJDCCxu4bVVX3FhntcT/ZgcCKmHqBOHNtAi7juNF3hb5M2nk/qnS1zc75
   QP945pKKaBMZdWvM5KKZYpZ6dPCJH5Ai2A9KXBxk2yO8RFgnArlqffMLL
   Q==;
X-CSE-ConnectionGUID: yt18zjw1Rb6+PoxEkm0S7Q==
X-CSE-MsgGUID: vguVvuCiT8G4D/Dc/VXJsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="88987762"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="88987762"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 19:33:32 -0700
X-CSE-ConnectionGUID: lbVC9GXTR+qauupZgzqgKw==
X-CSE-MsgGUID: 8+wkewFZQnGNl07wQEy5dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="270360016"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Sep 2026 19:33:30 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x32hC-000000001Id-2gQN;
	Sun, 06 Sep 2026 02:33:27 +0000
Date: Sun, 06 Sep 2026 10:32:51 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3206/4370]
 drivers/firewire/config-rom-generator-test.c:136:33: sparse: sparse:
 incompatible types in comparison expression (different base types):
Message-ID: <202609061023.GbWS6Skb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
commit: 996096154e7b569d9cb4911361b3b77f7ead9c5d [3206/4370] firewire: core: add test to generate with AV/C unit in config ROM generator
config: csky-randconfig-r113-20260905 (https://download.01.org/0day-ci/archive/20260906/202609061023.GbWS6Skb-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260906/202609061023.GbWS6Skb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609061023.GbWS6Skb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/firewire/config-rom-generator-test.c:56:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:57:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:57:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:57:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:58:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:58:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:58:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:59:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:59:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:59:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:60:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:60:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:60:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:61:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:61:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:61:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:62:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:62:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:62:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:63:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:63:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:63:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:64:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:64:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:64:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:65:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:65:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:65:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:66:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:66:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:66:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:67:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:67:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:67:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:68:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:68:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:68:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:69:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:69:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:69:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:70:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:70:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:70:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:71:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:71:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:71:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:72:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:72:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:72:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:73:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:73:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:73:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:74:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:74:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:74:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:75:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:75:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:75:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:76:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:76:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:76:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:77:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:77:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:77:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:78:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:78:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:78:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:79:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:79:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:79:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:80:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:80:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:80:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:81:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:81:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:81:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:82:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:82:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:82:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:83:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:83:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:83:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:84:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:84:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:84:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:85:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:85:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:85:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:86:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:86:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:86:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:87:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-generator-test.c:87:9: sparse:     expected unsigned int
   drivers/firewire/config-rom-generator-test.c:87:9: sparse:     got restricted __be32 [usertype]
   drivers/firewire/config-rom-generator-test.c:99:29: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __be32 const [usertype] *const expected @@     got unsigned int const * @@
   drivers/firewire/config-rom-generator-test.c:99:29: sparse:     expected restricted __be32 const [usertype] *const expected
   drivers/firewire/config-rom-generator-test.c:99:29: sparse:     got unsigned int const *
   drivers/firewire/config-rom-generator-test.c:105:29: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __be32 const [usertype] *const expected @@     got unsigned int const * @@
   drivers/firewire/config-rom-generator-test.c:105:29: sparse:     expected restricted __be32 const [usertype] *const expected
   drivers/firewire/config-rom-generator-test.c:105:29: sparse:     got unsigned int const *
>> drivers/firewire/config-rom-generator-test.c:136:33: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/firewire/config-rom-generator-test.c:136:33: sparse:    restricted __be32 const [usertype] *
   drivers/firewire/config-rom-generator-test.c:136:33: sparse:    unsigned int const *
   drivers/firewire/config-rom-generator-test.c:147:33: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/firewire/config-rom-generator-test.c:147:33: sparse:    restricted __be32 const [usertype] *
   drivers/firewire/config-rom-generator-test.c:147:33: sparse:    unsigned int const *

vim +136 drivers/firewire/config-rom-generator-test.c

    54	
    55	static const u32 config_rom_with_avc_unit[] = {
    56		cpu_to_be32(0x0404c1e5), // bus info
    57		cpu_to_be32(0x31333934), // |
    58		cpu_to_be32(0xf000b233), // |
    59		cpu_to_be32(0x01234567), // |
    60		cpu_to_be32(0x89abcdef), // v
    61		cpu_to_be32(0x0006a2d2), // root directory
    62		cpu_to_be32(0x0c0083c0), // |
    63		cpu_to_be32(0x03001f11), // |
    64		cpu_to_be32(0x81000004), // |
    65		cpu_to_be32(0x17023901), // |
    66		cpu_to_be32(0x81000009), // |
    67		cpu_to_be32(0xd100000c), // v
    68		cpu_to_be32(0x00064cb7), // text descriptor leaf (from root)
    69		cpu_to_be32(0x00000000), // |
    70		cpu_to_be32(0x00000000), // |
    71		cpu_to_be32(0x4c696e75), // |
    72		cpu_to_be32(0x78204669), // |
    73		cpu_to_be32(0x72657769), // |
    74		cpu_to_be32(0x72650000), // v
    75		cpu_to_be32(0x0003ff1c), // text descriptor leaf (from root)
    76		cpu_to_be32(0x00000000), // |
    77		cpu_to_be32(0x00000000), // |
    78		cpu_to_be32(0x4a756a75), // v
    79		cpu_to_be32(0x0004227b), // unit directory (from root)
    80		cpu_to_be32(0x1200a02d), // |
    81		cpu_to_be32(0x13010001), // |
    82		cpu_to_be32(0x17260827), // |
    83		cpu_to_be32(0x81000001), // v
    84		cpu_to_be32(0x0003f771), // text descriptor leaf (from unit)
    85		cpu_to_be32(0x00000000), // |
    86		cpu_to_be32(0x00000000), // |
  > 87		cpu_to_be32(0x50756900), // v
    88	};
    89	
    90	static const struct generator_test_case {
    91		const char *const name;
    92		int config_rom_generation;
    93		const __be32 *const expected;
    94		unsigned int quadlet_length;
    95	} generator_test_cases[] = {
    96		{
    97			.name = "bare",
    98			.config_rom_generation = 0,
    99			.expected = config_rom_bare,
   100			.quadlet_length = ARRAY_SIZE(config_rom_bare),
   101		},
   102		{
   103			.name = "with_avc_unit",
   104			.config_rom_generation = 1,
   105			.expected = config_rom_with_avc_unit,
   106			.quadlet_length = ARRAY_SIZE(config_rom_with_avc_unit),
   107		},
   108	};
   109	
   110	// Define generator_test_gen_params.
   111	KUNIT_ARRAY_PARAM_DESC(generator_test, generator_test_cases, name);
   112	
   113	struct state_data {
   114		struct fw_card card;
   115		__be32 config_rom[(CSR_CONFIG_ROM_END - CSR_CONFIG_ROM) / sizeof(__be32)];
   116	};
   117	
   118	static void test_config_rom_generator(struct kunit *test)
   119	{
   120		// Use kernel stack since they should be mutable for doubly linked-list.
   121		struct fw_descriptor avc_unit_entry = {
   122			.length = ARRAY_SIZE(avc_unit_directory_and_leaf),
   123			.key = (CSR_DIRECTORY | CSR_UNIT) << 24,
   124			.data = avc_unit_directory_and_leaf,
   125		};
   126		const struct generator_test_case *test_case = test->param_value;
   127		struct state_data *state = test->priv;
   128		struct fw_card *card = &state->card;
   129		__be32 *config_rom = state->config_rom;
   130	
   131		card->config_rom_generation = test_case->config_rom_generation;
   132		card->link_speed = SCODE_800;
   133		card->max_receive = 11;
   134		card->guid = 0x0123456789abcdefULL;
   135	
 > 136		if (test_case->expected == config_rom_with_avc_unit)
   137			KUNIT_EXPECT_EQ(test, fw_core_add_descriptor(&avc_unit_entry), 0);
   138	
   139		scoped_guard(mutex, &card_mutex) {
   140			generate_config_rom(card, config_rom);
   141			KUNIT_EXPECT_EQ(test, config_rom_length, test_case->quadlet_length);
   142		}
   143	
   144		KUNIT_EXPECT_MEMEQ(test, config_rom, test_case->expected,
   145				   sizeof(*test_case->expected) * test_case->quadlet_length);
   146	
   147		if (test_case->expected == config_rom_with_avc_unit)
   148			fw_core_remove_descriptor(&avc_unit_entry);
   149	}
   150	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
