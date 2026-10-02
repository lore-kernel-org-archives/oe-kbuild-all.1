Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7242110E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 00:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790899612; cv=none; b=khXXxJhjt6tTf8TBBd25dHoSZTmugqnzYWWMNBMKfPGs3c14UNbGk9NVyn+GlAcQra5EeN7Zpra3rVeHXDoPoQPoavJxbpDqcLA6d6kGoaQnodjf2SuExfA+vrK2UdvSvRddbFmSiCA1rPxZcIWPwSiWcmrKLtNhWRoctWZ/Mw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790899612; c=relaxed/simple;
	bh=QNk3nMdWOQrKGyQ9qpbmnpjHsACwm45q+cffMof5gRw=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGRWXmPuAkx8UrCbXnWe+qgElqlzfeMXBq5lN8elQtrkBlRa7q3M3UUzze3K9MCVfX1ZLlsUnAYj30Qiq4yQDoc9MimLkGhAWGsfA+CqZyayr6/2JfWcOvGq6e7wO6/2DHtEHfjftY+p+gYEyfHNQvus66d0hxwQL+p1FBEUteo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AufZXwTR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AufZXwTR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790899610; x=1822435610;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=QNk3nMdWOQrKGyQ9qpbmnpjHsACwm45q+cffMof5gRw=;
  b=AufZXwTRU1ZbBOSz8cXLKsLl8+QloUixupU6MarAFiPNB5IT5bvODvVR
   0wT4Y4ctNc/5zStYFMC5A/1vGTq0OfeGWPSHxGedGoytXfi0traqoYZjs
   JA7YZGms58bDSqqRZo+Ob7+rkC3JqOu/MjnW7EGHRl9yRLHkvMofITA6g
   PyF5fTfVs05kwTwfUagFglA/1jRovcqnsjCTCBTAZ1sEcNQhpyIrX2z4A
   pdZJolizGBfZeRTwobFZXwxrLaoF2uPo8nrsHj7GrVAQDA/+OttYJjkUi
   5fQK+//zbbjcwaBgv1//hhmVR/iRsWlcFnntGY/VeUebhpBBBwiXWRoOb
   g==;
X-CSE-ConnectionGUID: JStJFWMCSyiS40zFV7BsTQ==
X-CSE-MsgGUID: LEWUDKopTOqNKlbLWMoUEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102345397"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="102345397"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 17:06:49 -0700
X-CSE-ConnectionGUID: AvyxOjQ1RsO2A9IyoolIFA==
X-CSE-MsgGUID: 5Ey22pJLT0Cds9ipV7WiXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="314105088"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Oct 2026 17:06:49 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCQnW-00000000SWi-44fK
	for oe-kbuild-all@lists.linux.dev;
	Fri, 02 Oct 2026 00:06:46 +0000
Date: Fri, 2 Oct 2026 08:06:37 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: coresight: etm4x: Report whether the PMU counts external output 1
Message-ID: <202610020831.SAJsxWUB-lkp@intel.com>
References: <202610020831.SAJsxWUB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610020831.SAJsxWUB-lkp@intel.com>

Hi Amir,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Amir-Ayupov/coresight-Add-pmu_pulse-extout_pulse/20260930-233744
base:   
patch link:    https://lore.kernel.org/r/202610020831.SAJsxWUB-lkp%40intel.com
config: arm64-randconfig-1002-20261002 (https://download.01.org/0day-ci/archive/20261002/202610020831.SAJsxWUB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020831.SAJsxWUB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020831.SAJsxWUB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:5,
                    from include/linux/ioport.h:14,
                    from include/linux/acpi.h:13,
                    from drivers/hwtracing/coresight/coresight-etm4x-core.c:6:
   drivers/hwtracing/coresight/coresight-etm4x-core.c: In function 'etm4_pmu_has_extout1':
>> drivers/hwtracing/coresight/coresight-etm4x-core.c:1406:12: error: 'ARMV8_PMUV3_EXT_COMMON_EVENT_BASE' undeclared (first use in this function); did you mean 'ARMV8_PMU_EVTYPE_EVENT'?
               ARMV8_PMUV3_EXT_COMMON_EVENT_BASE)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:8:34: note: in definition of macro 'BIT_ULL'
    #define BIT_ULL(nr)  (ULL(1) << (nr))
                                     ^~
   drivers/hwtracing/coresight/coresight-etm4x-core.c:1406:12: note: each undeclared identifier is reported only once for each function it appears in
               ARMV8_PMUV3_EXT_COMMON_EVENT_BASE)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:8:34: note: in definition of macro 'BIT_ULL'
    #define BIT_ULL(nr)  (ULL(1) << (nr))
                                     ^~


vim +1406 drivers/hwtracing/coresight/coresight-etm4x-core.c

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
