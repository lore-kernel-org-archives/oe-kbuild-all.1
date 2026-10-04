Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844D437C0EC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Oct 2026 16:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791130069; cv=none; b=iq/4DmjU+iwBeKwbtX3rLsnWRs7UlC18/lh4N2aRaN7mYgSIpRHeKXpHIQynQ7TZWAJb6zoyftLJuvR3fPDfn/BvSutVgjxfaoc0GGi32s8BFXhPE9QOxZkzbbu/dgD8s0MEr1dV5T8AAyQziQjcohKVqNTXo2q/VSK9POgjVGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791130069; c=relaxed/simple;
	bh=o+XeEr5uktmC3GPLiKarpr5ZGah2N8uJSJ/Yph9cRug=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ieqb29cGQEeriZL4u1CnnM8RQkfifazF94ZQSLJdfkrm2+OLD2tzBbhbyx+fKwYSRxlOGW5AEAb5R51YZaNVlQYJWpPc4OQYYosdcZEIsI9zzi0e8ZgpzTws2vEgq+LACpTCnwWD5AfxD8ysDXyOZC0Bl2BItmUBzCcJ6RE6WbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYZ1nG3l; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYZ1nG3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791130068; x=1822666068;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=o+XeEr5uktmC3GPLiKarpr5ZGah2N8uJSJ/Yph9cRug=;
  b=ZYZ1nG3luSTyJU9iAWC2xWs7bM2oaefkEsBk9xbdMl2tVZxzsUqFIhKN
   Zs37Jik/g3Gj3xE/4HkIPj+xb+weVNyC/ruqZDLkK+oOlIKUrxGKF9zU8
   xr3NFWAkizl7jQJ/auNU6UTAgf01mvRfWe4xGQyMKLUFdbxkmOw7E5ZPw
   7aMKHWmeDRt0f9y6+OQCL88oWKoJZxtwTUF5sBUryHIUWJkODBMnpRpmZ
   iV2DQC0ES8EmsIE8ltYjBeKP80Gk17mn2b0IkK2edpHFZgZP5mQGeLf/O
   y8iT6HfkdmrBSvBnw045RM8GyTySUphpu9kIzBYs4KTUBxXjRCCsDsH8C
   Q==;
X-CSE-ConnectionGUID: /Sa+4F4sSOWkzuZ7SwvRTA==
X-CSE-MsgGUID: N/Wz0H+MSkydQmfgXYeKnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90585394"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="90585394"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 09:07:47 -0700
X-CSE-ConnectionGUID: A1Hs7sXZSNmK+xI+PKr/AA==
X-CSE-MsgGUID: 7pJo4txhR3GD4+taQji3tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="274739115"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 04 Oct 2026 09:07:47 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDOka-000000000LP-1lE6
	for oe-kbuild-all@lists.linux.dev;
	Sun, 04 Oct 2026 16:07:44 +0000
Date: Sun, 4 Oct 2026 18:07:43 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: coresight: etm4x: Report whether the PMU counts external output 1
Message-ID: <202610041830.sVT0ZNBU-lkp@intel.com>
References: <202610041830.sVT0ZNBU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610041830.sVT0ZNBU-lkp@intel.com>

Hi Amir,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Amir-Ayupov/coresight-Add-pmu_pulse-extout_pulse/20260930-233744
base:   
patch link:    https://lore.kernel.org/r/202610041830.sVT0ZNBU-lkp%40intel.com
config: arm64-randconfig-r2100-20261004 (https://download.01.org/0day-ci/archive/20261004/202610041830.sVT0ZNBU-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610041830.sVT0ZNBU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610041830.sVT0ZNBU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-etm4x-core.c:1406:12: error: use of undeclared identifier 'ARMV8_PMUV3_EXT_COMMON_EVENT_BASE'
    1406 |                                        ARMV8_PMUV3_EXT_COMMON_EVENT_BASE)))
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/ARMV8_PMUV3_EXT_COMMON_EVENT_BASE +1406 drivers/hwtracing/coresight/coresight-etm4x-core.c

  1385	
  1386	/*
  1387	 * Check whether a PMU event can count external output 1 of this trace unit,
  1388	 * and whether the trace unit has event 1 to drive it, since event 0 is the
  1389	 * trace unit trigger. The PMU only reports whether an event is implemented,
  1390	 * not that the trace unit drives it, so also require a CPU whose manual
  1391	 * documents the connection.
  1392	 *
  1393	 * Must run on the CPU that owns the trace unit.
  1394	 */
  1395	static bool etm4_pmu_has_extout1(struct etmv4_drvdata *drvdata)
  1396	{
  1397		int pmuver = read_pmuver();
  1398	
  1399		if (!is_midr_in_range_list(etm4_pmu_extout1_cpus))
  1400			return false;
  1401	
  1402		/* PMCEID0_EL0[63:32] describe events 0x4000-0x401f from PMUv3p1 */
  1403		if (!pmuv3_implemented(pmuver) || pmuver < ID_AA64DFR0_EL1_PMUVer_V3P1)
  1404			return false;
  1405		if (!(read_pmceid0() & BIT_ULL(32 + ARMV8_PMUV3_PERFCTR_TRCEXTOUT1 -
> 1406					       ARMV8_PMUV3_EXT_COMMON_EVENT_BASE)))
  1407			return false;
  1408	
  1409		/* nr_event is TRCIDR0.NUMEVENT, the number of events minus one */
  1410		return drvdata->nr_event >= 1;
  1411	}
  1412	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
