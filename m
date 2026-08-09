Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53CA3438B9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Aug 2026 21:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786311068; cv=none; b=fy/u0mUEgGmKH5O6IXEd/xMeX8qRTYdo80BIw+g1iHxZ5WMObnxsXsNAiCyW0BNOV07gWHdhUlcXGYPrmbUN5ScMnfS9NNBkrImAnAdCKcw/yjLqHeyLoHj4zJioigk9qsMUX8BtgqG8qnKQBnDjVz4yyjvLvdSCqN/xuAB719I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786311068; c=relaxed/simple;
	bh=m66c758Ie8A/20AilmL8XzYc00+I5jf951+fSex8XTQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O1UONv1IDlibtnaaXGIy2SGlyObbCwaMWQfbAl1hTD2Qj0VNg5tLYYDu8/h3oSCxhR6VtnXK2RXAUcaG7O3iZuiE2C0MX7onErENQuL+Ropf+EUUC2p3bGjzR3ThIvB3IbmOVEmYqnVeGd2m+IZokEJkl0UaQJX/5h5kxHH3a4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aXEX0ext; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXEX0ext"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786311065; x=1817847065;
  h=date:from:to:cc:subject:message-id;
  bh=m66c758Ie8A/20AilmL8XzYc00+I5jf951+fSex8XTQ=;
  b=aXEX0extlT+a/ZuCXZ7peS3nGU6nl8siyGXsgA0XbXSEzv2IY1iCHCBO
   8Lp/pswnzhcGb7+RUUKQHBxofUaxX89G9HSXdlaXr2HTfy6xp6LY6LU0C
   +ziYZyedaZvl9xGxxfuIWKWO2R/8pd3s76AGaBIRZJkKlZALdxpeAg/YB
   scTxdPt7VqvzyAg0BY4lZC6kB/y/i3Uhg6WHC0zkdkuyvQk1H6/ULMZI5
   2xKSrRS49dx3ezHHxncS4eV6RTlAiJ2Q/azCxrnCP2tDGM4eBNvsliU3w
   t9GFQcg6yWWdxW1iL2GuMj8eyPTsJGnJB9sTg36B7v6zc01VlaG6MoPbc
   w==;
X-CSE-ConnectionGUID: zBgklEs9Qa+wrSmZvYjznA==
X-CSE-MsgGUID: 4wJPrx0uSeaapIRW5Lyh1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="89353641"
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="89353641"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 14:31:04 -0700
X-CSE-ConnectionGUID: o2+EfJwwSgWMcNmT6/yqvQ==
X-CSE-MsgGUID: KgkurYrjQ9+DGpp+32ehSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="261129352"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Aug 2026 14:31:04 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtB6j-00000000MOk-21tq;
	Sun, 09 Aug 2026 21:31:01 +0000
Date: Mon, 10 Aug 2026 05:30:30 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_ng_V8 14/30]
 drivers/firmware/arm_scmi/telemetry.c:1448:48: sparse: sparse: non
 size-preserving pointer to integer cast
Message-ID: <202608100544.cd55x04T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_ng_V8
head:   bc3b27dd68cfc244c1e7717b72f88b2dfcb28d2e
commit: b3af22d84385fa2de874059ed603f6636ed76afb [14/30] firmware: arm_scmi: Add support to parse SHMTIs areas
config: powerpc-randconfig-r132-20260809 (https://download.01.org/0day-ci/archive/20260810/202608100544.cd55x04T-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260810/202608100544.cd55x04T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608100544.cd55x04T-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_scmi/telemetry.c:1448:48: sparse: sparse: non size-preserving pointer to integer cast
   drivers/firmware/arm_scmi/telemetry.c:1541:48: sparse: sparse: non size-preserving pointer to integer cast

vim +1448 drivers/firmware/arm_scmi/telemetry.c

  1429	
  1430	static struct telemetry_block_ts *
  1431	scmi_telemetry_blkts_create(struct telemetry_info *ti,
  1432				    struct payload __iomem *payld)
  1433	{
  1434		struct telemetry_block_ts *bts;
  1435		int ret;
  1436	
  1437		bts = kzalloc_obj(*bts);
  1438		if (!bts)
  1439			return NULL;
  1440	
  1441		ret = scmi_telemetry_line_init(&bts->line, &ti->xa_lines, payld,
  1442					       TDCF_BLK_TS_LINE);
  1443		if (ret) {
  1444			kfree(bts);
  1445			return NULL;
  1446		}
  1447	
> 1448		trace_scmi_tlm_collect(0, (__force u64)payld, 0, "SHMTI_NEW_BLKTS");
  1449	
  1450		return bts;
  1451	}
  1452	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
