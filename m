Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7612915ACB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 17:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717781366; cv=none; b=c3elL0kpnnSMp+gzeo1j+t0L9cUO7YcBS/94Irb+tvqOpKdZIPfsflXpA3ETdVcNzPyM0271AogfdagYtnf10sGYoqNSmnBsPRFAZlm3wMrL5q/AXUtQZ0x8iJLhlzJXRWctJ7dk3ZZI2lQe05i+E6h7TvBKS8qZrPtCpfTzvvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717781366; c=relaxed/simple;
	bh=LobnvV2dHN4PZrLnrEWxaWnTW2LC9dR1FQHdbjeG1wY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tJ3VxzkSh0UMrd7S4mMWfj9Sf7ukr4cL8eiNXv+lfkcaJyGML+E7iTJqLVFPnjKoKRn9Ea+bPnhMzrqhpwACebIzI5zoYErAaLiIvttwLqWSQsHBLyX7N/nERjHBk4dYCd6zCSadIUO5U1TVQ+TscgdAIrPERbK8CDnmtiXnkTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P8amWH89; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P8amWH89"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717781365; x=1749317365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LobnvV2dHN4PZrLnrEWxaWnTW2LC9dR1FQHdbjeG1wY=;
  b=P8amWH89nMMI3nYL19/uI1kKeWL6BwZoJLjThsulZYQICO1pXIYh5ZD4
   ugzNfuBBdbKqylhBk07ov61i8qVIcPVtB0NCdM5EuQgKKYPhYVfSsVlaG
   Z9+AZi8NZopyS0LJm26O17SIx1jZaU1h+DlglWrhtLlWq2Y9aDNaqyUvv
   yepWDl4IrWcFqq+w1eo0Js4PVR46IA1wg5VDGuVPCDzs7hZvguv+WjyHA
   3I4iK+Ae6GGWXduDNOYTXrsqIFlq6xLIHgVb6DKe4ltD3H5V2yL/VlNDr
   5u9wPGUTVxJ9+Q1xUaDC7Rh8RQcpvUOhX3Vqf9EXcUrD797uZiLDMXEDA
   g==;
X-CSE-ConnectionGUID: inNekD5uTtOXsisXP/Zohg==
X-CSE-MsgGUID: ZuiFoHiLRAevHs0sEzUatQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="32008706"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="32008706"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 10:29:25 -0700
X-CSE-ConnectionGUID: Uh7bZ/cdQvCsfIpPwn/pnA==
X-CSE-MsgGUID: 8MCL4bRvQESbxJi1hEw7Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="69168973"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Jun 2024 10:29:23 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFdOz-0000C2-0C;
	Fri, 07 Jun 2024 17:29:21 +0000
Date: Sat, 8 Jun 2024 01:29:19 +0800
From: kernel test robot <lkp@intel.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Roger Quadros <rogerq@kernel.org>
Subject: [rogerq:b4/am65-cpsw-multi-rx 5/9]
 drivers/net/ethernet/ti/cpsw_ale.h:37:2: error: redefinition of enumerator
 'ENTRIES'
Message-ID: <202406080153.iwYq2NZx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rogerq/linux b4/am65-cpsw-multi-rx
head:   de06f4cc19db62212a2f1e83905ab3b287ced30e
commit: 8ba5217a2987d80532ab08449a7f6141d0e78298 [5/9] net: ethernet: ti: cpsw_ale: use regfields for number of Entries and Policers
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240608/202406080153.iwYq2NZx-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406080153.iwYq2NZx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406080153.iwYq2NZx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/ti/cpsw.c:42:
>> drivers/net/ethernet/ti/cpsw_ale.h:37:2: error: redefinition of enumerator 'ENTRIES'
      37 |         ENTRIES,
         |         ^
   arch/x86/include/asm/processor.h:64:2: note: previous definition is here
      64 |         ENTRIES,
         |         ^
   1 error generated.
--
   In file included from drivers/net/ethernet/ti/cpsw_ale.c:22:
>> drivers/net/ethernet/ti/cpsw_ale.h:37:2: error: redefinition of enumerator 'ENTRIES'
      37 |         ENTRIES,
         |         ^
   arch/x86/include/asm/processor.h:64:2: note: previous definition is here
      64 |         ENTRIES,
         |         ^
   drivers/net/ethernet/ti/cpsw_ale.c:1307:14: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    1307 |         [ENTRIES]       = REG_FIELD(ALE_STATUS, 0, 7),
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/regmap.h:1348:37: note: expanded from macro 'REG_FIELD'
    1348 | #define REG_FIELD(_reg, _lsb, _msb) {           \
         |                                     ^~~~~~~~~~~~~
    1349 |                                 .reg = _reg,    \
         |                                 ~~~~~~~~~~~~~~~~~
    1350 |                                 .lsb = _lsb,    \
         |                                 ~~~~~~~~~~~~~~~~~
    1351 |                                 .msb = _msb,    \
         |                                 ~~~~~~~~~~~~~~~~~
    1352 |                                 }
         |                                 ~
   drivers/net/ethernet/ti/cpsw_ale.c:1304:16: note: previous initialization is here
    1304 |         [MINOR_VER]     = REG_FIELD(ALE_IDVER, 0, 7),
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/regmap.h:1348:37: note: expanded from macro 'REG_FIELD'
    1348 | #define REG_FIELD(_reg, _lsb, _msb) {           \
         |                                     ^~~~~~~~~~~~~
    1349 |                                 .reg = _reg,    \
         |                                 ~~~~~~~~~~~~~~~~~
    1350 |                                 .lsb = _lsb,    \
         |                                 ~~~~~~~~~~~~~~~~~
    1351 |                                 .msb = _msb,    \
         |                                 ~~~~~~~~~~~~~~~~~
    1352 |                                 }
         |                                 ~
   drivers/net/ethernet/ti/cpsw_ale.c:1308:15: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    1308 |         [POLICERS]      = REG_FIELD(ALE_STATUS, 8, 15),
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/regmap.h:1348:37: note: expanded from macro 'REG_FIELD'
    1348 | #define REG_FIELD(_reg, _lsb, _msb) {           \
         |                                     ^~~~~~~~~~~~~
    1349 |                                 .reg = _reg,    \
         |                                 ~~~~~~~~~~~~~~~~~
    1350 |                                 .lsb = _lsb,    \
         |                                 ~~~~~~~~~~~~~~~~~
    1351 |                                 .msb = _msb,    \
         |                                 ~~~~~~~~~~~~~~~~~
    1352 |                                 }
         |                                 ~
   drivers/net/ethernet/ti/cpsw_ale.c:1307:14: note: previous initialization is here
    1307 |         [ENTRIES]       = REG_FIELD(ALE_STATUS, 0, 7),
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/regmap.h:1348:37: note: expanded from macro 'REG_FIELD'
    1348 | #define REG_FIELD(_reg, _lsb, _msb) {           \
         |                                     ^~~~~~~~~~~~~
    1349 |                                 .reg = _reg,    \
         |                                 ~~~~~~~~~~~~~~~~~
    1350 |                                 .lsb = _lsb,    \
         |                                 ~~~~~~~~~~~~~~~~~
    1351 |                                 .msb = _msb,    \
         |                                 ~~~~~~~~~~~~~~~~~
    1352 |                                 }
         |                                 ~
   drivers/net/ethernet/ti/cpsw_ale.c:1445:20: warning: array index 1 is past the end of the array (that has type 'struct regmap_field *[1]') [-Warray-bounds]
    1445 |         regmap_field_read(ale->fields[MAJOR_VER], &rev_major);
         |                           ^           ~~~~~~~~~
   drivers/net/ethernet/ti/cpsw_ale.h:47:2: note: array 'fields' declared here
      47 |         struct regmap_field     *fields[ALE_FIELDS_MAX];
         |         ^
   3 warnings and 1 error generated.


vim +/ENTRIES +37 drivers/net/ethernet/ti/cpsw_ale.h

    33	
    34	enum ale_fields {
    35		MINOR_VER,
    36		MAJOR_VER,
  > 37		ENTRIES,
    38		POLICERS,
    39		/* terminator */
    40		ALE_FIELDS_MAX,
    41	};
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
