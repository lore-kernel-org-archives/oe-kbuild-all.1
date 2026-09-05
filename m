Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9C535C1B1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 18:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788632639; cv=none; b=kodheIHL4TLmVlH/muE8mIG5aIHBV+v3aqONkt1Aq5yR+C2x7ryaSt0UX5Mz5CVqOpC63UF9BulO3TCigy8OoPkNjYW/i2K8ps6syox/pf/dhmqlNOwdVbveO5O0rsVeeKVTELoPAGW/L1GbBXSht+dhPEdabcSYlDjtgPv9HJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788632639; c=relaxed/simple;
	bh=cjFlMvNjaVpRlZomPo9fPm5n6KGu5coFZUxdWAOa/7Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lCpR0Cyk2s1tgyOKfDlKLmMjVnadITricHNijollNl3hqpFvYvnWB4kgNdHeCTLJ/WN0pj74ID1Q9+AQW8GMRCVhke3r957TfSO+2ThYFWK1hnuqA2zNISgvtovcurxVoJhenn8bhz4Rsba6XZkxSxe16/g6ZHrCqPJ/S3F4sZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgdS6fD/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgdS6fD/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788632637; x=1820168637;
  h=date:from:to:cc:subject:message-id;
  bh=cjFlMvNjaVpRlZomPo9fPm5n6KGu5coFZUxdWAOa/7Y=;
  b=hgdS6fD/WetjkwN9SOfScLI+p/1PeMPtnorssxFV9sd07Pu5em9nUCYL
   ikirrBY+1alkGMP8d9K0Wrp4voFbtD0yqtTTJ0lzhPfYc7kODl0jqI1qG
   H6d9Cp261ZTq8lZKW1gbMenY0sZi0hzJTsHGGCrF8jbNLa5FDaS/vkqhA
   r0BHaTun8o+739FaG0CNZJphT48Rtcon9CNGvv+XYn6MzQ6onS/C1+X4W
   MnroTRnna1CTDjUTka2uPh3rVHtkFuJ5629I2uHzNFHRs0xVMoIetdJtD
   qFL+pZfMzphpI0D8agsSw+u0uoNXY3puJT024EnCQh+7yhzCqkCpCWMtS
   g==;
X-CSE-ConnectionGUID: VnGKSKsuSx6KBJ7iOzuzqg==
X-CSE-MsgGUID: j7W3OEXEQq+GKhhjLb0bng==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="88947480"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="88947480"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 11:23:56 -0700
X-CSE-ConnectionGUID: ODvViMTaQHCGO4JIJhsWTw==
X-CSE-MsgGUID: IH3qVNEDRvOfQgoXIQpgIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="300228182"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Sep 2026 11:23:56 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2v3Q-000000000xV-3wSd;
	Sat, 05 Sep 2026 18:23:52 +0000
Date: Sun, 06 Sep 2026 02:23:41 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3200/4370]
 drivers/firewire/config-rom-parser-test.c:93:18: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202609060257.8wQo9w9N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
commit: 23e0d2e849eb84b8451c3f90e660222eea20f031 [3200/4370] firewire: core: add test to detect irm-is-1394-1995-only quirk in config ROM parser
config: csky-randconfig-r113-20260905 (https://download.01.org/0day-ci/archive/20260906/202609060257.8wQo9w9N-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260906/202609060257.8wQo9w9N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609060257.8wQo9w9N-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/firewire/core-device.c: note: in included file:
>> drivers/firewire/config-rom-parser-test.c:93:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/firewire/config-rom-parser-test.c:93:18: sparse:     expected unsigned int [usertype]
   drivers/firewire/config-rom-parser-test.c:93:18: sparse:     got restricted __be32 [usertype]

vim +93 drivers/firewire/config-rom-parser-test.c

    74	
    75	static int stub_run_regular_transaction(struct fw_card *card, int tcode, int destination_id,
    76						int generation, int speed, unsigned long long offset,
    77						void *payload, size_t length)
    78	{
    79		struct kunit *test = kunit_get_current_test();
    80		const struct parser_test_case *param = test->param_value;
    81	
    82		KUNIT_ASSERT_GE(test, offset, CSR_REGISTER_BASE | CSR_CONFIG_ROM);
    83		KUNIT_ASSERT_LT(test, offset, CSR_REGISTER_BASE | CSR_CONFIG_ROM_END);
    84		KUNIT_ASSERT_NOT_NULL(test, payload);
    85		KUNIT_ASSERT_EQ(test, length, 4);
    86	
    87		unsigned int index = (offset - (CSR_REGISTER_BASE | CSR_CONFIG_ROM)) / sizeof(u32);
    88		u32 *quadlet = payload;
    89	
    90		KUNIT_EXPECT_LE(test, speed, param->expected_speed);
    91		KUNIT_EXPECT_LT(test, index, param->quadlet_length);
    92	
  > 93		*quadlet = cpu_to_be32(param->quadlets[index]);
    94	
    95		return RCODE_COMPLETE;
    96	}
    97	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
