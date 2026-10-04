Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0592D2848A7
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Oct 2026 14:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791123408; cv=none; b=iZrQgNcD0tT5HB+K4jfeJx55GLcDF6+nyqPd44N+4pPL8ORwXpVahl6rUS+qQjtZDephzhGRhFM+0l7skusEu1DL8dzO8/Xsnywg0x9GGsOO+DEUDB73eF1bmRAxOqpdbW51rpVzHPaWZ0zFs5a1S0DVG6IYVtv+QHXcOZj1UTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791123408; c=relaxed/simple;
	bh=UTXI19jnhDDhKnIcHdoEqjKYFqL/6q0sD1Ss4hDX+AI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p/w+3uiKLG/C5LhxeJIdlgbSA7v+cZFX4ODBhnAVuEANb6wGn81feRllYfI7Pk16MjaC/zE2ySI0HTkKbQQvWsL+z+Q9JYUP5rDYrky5pn3wQWaITGPr5TDrfCM8kkUlaO7tsBj0IA6Uq5lrR+HA5iGRYB14L+g7q13EpqPJWAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DCPjPCo8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DCPjPCo8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791123406; x=1822659406;
  h=date:from:to:cc:subject:message-id;
  bh=UTXI19jnhDDhKnIcHdoEqjKYFqL/6q0sD1Ss4hDX+AI=;
  b=DCPjPCo8RROBw0lvRq9B9SQzmtU4meW+HLXVHwMCyIv1M5xX5KMzpcS3
   vwphB0SwZo3aNbgbrS1eUNYtSIz3O8bNLwPtsf3k5NIjohR+mhrChFjtg
   H480l10hoGvdEoI4xSWyQGeRrQGDm21cMPBPgIO9aHOWM7tTia2A6Equ0
   e/cI+BNSmgS4nGKa9/FM68fBBi6XTdY2NYtFY9VmR7n6vDtwUWC2lKOYV
   p0viYmzMsrsK9myZOe7ny7pZMRLD+aYP4vLTUzuAstsolpKGXQFNlQCYv
   hasubS0b/g9e/taZ89MZb9L+NP9312eqVH4AjVXvEsr64w/j14BGradKr
   A==;
X-CSE-ConnectionGUID: 7PlYY0wKTF66uIzYmiWukQ==
X-CSE-MsgGUID: l4SX/9hkTBuoXF6wJPgWDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="94298940"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="94298940"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 07:16:45 -0700
X-CSE-ConnectionGUID: /98GtgIlRky6dU23z1ImaQ==
X-CSE-MsgGUID: tc1m9FddQxmXwwyesYDNNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="280362622"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 04 Oct 2026 07:16:45 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDN17-000000000Jf-3biE;
	Sun, 04 Oct 2026 14:16:41 +0000
Date: Sun, 04 Oct 2026 16:16:18 +0200
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_ng_V13 7/25]
 drivers/firmware/arm_scmi/telemetry.c:1568:48: sparse: sparse: non
 size-preserving pointer to integer cast
Message-ID: <202610041617.oqdi6UhM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_ng_V13
head:   ba9a465eed933939521f23908a646f15758f5d09
commit: d0aad02d334b9db4c51ec4c0682a4326de35205e [7/25] firmware: arm_scmi: Add support to parse SHMTIs areas
config: arm-randconfig-r2306-20261004 (https://download.01.org/0day-ci/archive/20261004/202610041617.oqdi6UhM-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610041617.oqdi6UhM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610041617.oqdi6UhM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_scmi/telemetry.c:1568:48: sparse: sparse: non size-preserving pointer to integer cast
   drivers/firmware/arm_scmi/telemetry.c:1680:48: sparse: sparse: non size-preserving pointer to integer cast

vim +1568 drivers/firmware/arm_scmi/telemetry.c

  1550	
  1551	static struct telemetry_block_ts *
  1552	scmi_telemetry_blkts_create(struct telemetry_info *ti,
  1553				    struct payload __iomem *payld)
  1554	{
  1555		struct telemetry_block_ts *bts;
  1556		int ret;
  1557	
  1558		bts = kzalloc_obj(*bts);
  1559		if (!bts)
  1560			return NULL;
  1561	
  1562		ret = scmi_telemetry_line_init(ti, &bts->line, payld, TDCF_BLK_TS_LINE);
  1563		if (ret) {
  1564			kfree(bts);
  1565			return NULL;
  1566		}
  1567	
> 1568		trace_scmi_tlm_collect(0, (__force u64)payld, 0, "SHMTI_NEW_BLKTS");
  1569	
  1570		return bts;
  1571	}
  1572	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
