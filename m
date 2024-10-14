Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6310F481B3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 14:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728917306; cv=none; b=j4S8neXYW2inmWpPk02uTcqURUrAN0hTLZP3EF8W51xDml6eKrPxB1pBNOlyUCQ/jkr+rk/J4tlbNwxQSSXqkTU4SjnynhG5+ysavufjH4oHcWatgTd4ugsTB7n5eeA5CcQoJEnC1q4Q7S7IJyh9B1xqbpq6g7Ir4SbKS9wkV7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728917306; c=relaxed/simple;
	bh=VNUkXGvVJ5G7yKqScpfhgaHfWbOfhznDlAQQeIVC1cM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VqpujfE6HhdCZMsZloy+71zVvt841cwvkEgIGxZeaqwYbg/0wH0BKrGpao9XPg4vHtQdgEMBLqMIR7jRFOw+v+o1wW3nfqlWKUThioF/BLcHHw2m32O6ixr96WD48E947L7Cgs5Gu23jmKcfG47P4veSd1st1nmlNhxXmIO4i2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V0Vhcwx8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V0Vhcwx8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728917304; x=1760453304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VNUkXGvVJ5G7yKqScpfhgaHfWbOfhznDlAQQeIVC1cM=;
  b=V0Vhcwx8g8Kq+zzIdhVZagkYRrOClupfZn3g6XWJbqo4Ns23h5N5t5eC
   pU38FGyYJGXjc2UQ0hWmm7TECIKqJyPq6rlnwrS0W0znSf6lsvDykgfAp
   4cvNMZkjizu55d994Wqymh8pnUemUBV4Q4JxwGfZ5OgB7o4GRMaHUA58e
   G7BC77ieuZf9PCHdw/K6l71+lgk8NCJE49E7IjRXKz7F596sfTg5fCfqm
   y6EIPb3FHNdMhbzqOOFD3rY/D1lExal6VpKakcYYlee4d5Sfh0FZvzQ3C
   DZ6B2MxZjyEeAcNtubjyg8hoEp/KiTm+G7pn5+TkMnnOj89dXCeb6DSQ0
   w==;
X-CSE-ConnectionGUID: v9vlxfCGQtaAk5UH5Skl3g==
X-CSE-MsgGUID: BSVfeNFHSbuR/5CUVrYCvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="28152650"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="28152650"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 07:48:24 -0700
X-CSE-ConnectionGUID: Tknm3CW7QTKNIpTSrOYVPA==
X-CSE-MsgGUID: fikXTy4VS1yKVbTssystLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="77700367"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Oct 2024 07:48:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0MMv-000FoE-0F;
	Mon, 14 Oct 2024 14:48:21 +0000
Date: Mon, 14 Oct 2024 22:48:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-6.6.y 161/686]
 arch/x86/kernel/cpu/resctrl/rdtgroup.c:1554:5-8: Unneeded variable: "ret".
 Return "0" on line 1588
Message-ID: <202410142258.0pkZ0eN5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common upstream-linux-6.6.y
head:   d4576c5670090297b903771726a526f81fdd8c7c
commit: 2e205eb59ea50ee9c2c90ab048e12b58b9b0bd1c [161/686] x86/resctrl: Read supported bandwidth sources from CPUID
config: x86_64-randconfig-r061-20241014 (https://download.01.org/0day-ci/archive/20241014/202410142258.0pkZ0eN5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410142258.0pkZ0eN5-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/resctrl/rdtgroup.c:1554:5-8: Unneeded variable: "ret". Return "0" on line 1588

vim +1554 arch/x86/kernel/cpu/resctrl/rdtgroup.c

92bd5a1390335b Babu Moger 2023-01-13  1549  
92bd5a1390335b Babu Moger 2023-01-13  1550  static int mbm_config_write_domain(struct rdt_resource *r,
92bd5a1390335b Babu Moger 2023-01-13  1551  				   struct rdt_domain *d, u32 evtid, u32 val)
92bd5a1390335b Babu Moger 2023-01-13  1552  {
92bd5a1390335b Babu Moger 2023-01-13  1553  	struct mon_config_info mon_info = {0};
92bd5a1390335b Babu Moger 2023-01-13 @1554  	int ret = 0;
92bd5a1390335b Babu Moger 2023-01-13  1555  
92bd5a1390335b Babu Moger 2023-01-13  1556  	/*
92bd5a1390335b Babu Moger 2023-01-13  1557  	 * Read the current config value first. If both are the same then
92bd5a1390335b Babu Moger 2023-01-13  1558  	 * no need to write it again.
92bd5a1390335b Babu Moger 2023-01-13  1559  	 */
92bd5a1390335b Babu Moger 2023-01-13  1560  	mon_info.evtid = evtid;
92bd5a1390335b Babu Moger 2023-01-13  1561  	mondata_config_read(d, &mon_info);
92bd5a1390335b Babu Moger 2023-01-13  1562  	if (mon_info.mon_config == val)
92bd5a1390335b Babu Moger 2023-01-13  1563  		goto out;
92bd5a1390335b Babu Moger 2023-01-13  1564  
92bd5a1390335b Babu Moger 2023-01-13  1565  	mon_info.mon_config = val;
92bd5a1390335b Babu Moger 2023-01-13  1566  
92bd5a1390335b Babu Moger 2023-01-13  1567  	/*
92bd5a1390335b Babu Moger 2023-01-13  1568  	 * Update MSR_IA32_EVT_CFG_BASE MSR on one of the CPUs in the
92bd5a1390335b Babu Moger 2023-01-13  1569  	 * domain. The MSRs offset from MSR MSR_IA32_EVT_CFG_BASE
92bd5a1390335b Babu Moger 2023-01-13  1570  	 * are scoped at the domain level. Writing any of these MSRs
92bd5a1390335b Babu Moger 2023-01-13  1571  	 * on one CPU is observed by all the CPUs in the domain.
92bd5a1390335b Babu Moger 2023-01-13  1572  	 */
92bd5a1390335b Babu Moger 2023-01-13  1573  	smp_call_function_any(&d->cpu_mask, mon_event_config_write,
92bd5a1390335b Babu Moger 2023-01-13  1574  			      &mon_info, 1);
92bd5a1390335b Babu Moger 2023-01-13  1575  
92bd5a1390335b Babu Moger 2023-01-13  1576  	/*
92bd5a1390335b Babu Moger 2023-01-13  1577  	 * When an Event Configuration is changed, the bandwidth counters
92bd5a1390335b Babu Moger 2023-01-13  1578  	 * for all RMIDs and Events will be cleared by the hardware. The
92bd5a1390335b Babu Moger 2023-01-13  1579  	 * hardware also sets MSR_IA32_QM_CTR.Unavailable (bit 62) for
92bd5a1390335b Babu Moger 2023-01-13  1580  	 * every RMID on the next read to any event for every RMID.
92bd5a1390335b Babu Moger 2023-01-13  1581  	 * Subsequent reads will have MSR_IA32_QM_CTR.Unavailable (bit 62)
92bd5a1390335b Babu Moger 2023-01-13  1582  	 * cleared while it is tracked by the hardware. Clear the
92bd5a1390335b Babu Moger 2023-01-13  1583  	 * mbm_local and mbm_total counts for all the RMIDs.
92bd5a1390335b Babu Moger 2023-01-13  1584  	 */
92bd5a1390335b Babu Moger 2023-01-13  1585  	resctrl_arch_reset_rmid_all(r, d);
92bd5a1390335b Babu Moger 2023-01-13  1586  
92bd5a1390335b Babu Moger 2023-01-13  1587  out:
92bd5a1390335b Babu Moger 2023-01-13 @1588  	return ret;
92bd5a1390335b Babu Moger 2023-01-13  1589  }
92bd5a1390335b Babu Moger 2023-01-13  1590  

:::::: The code at line 1554 was first introduced by commit
:::::: 92bd5a1390335bb3cc76bdf1b4356edbc94d408d x86/resctrl: Add interface to write mbm_total_bytes_config

:::::: TO: Babu Moger <babu.moger@amd.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
