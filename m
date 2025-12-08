Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E6A21E0AF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 22:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765231450; cv=none; b=GuAT4ZFLK+LJf49BfBLampuWEEZQtuj4S5APpaEKlGidQ2joor09F7tqXX5RySybllUcbI+Sjjxruu9HE7dsub78Jn0PEJV2msZ+zpduzzGXiJXYRR0+na2y7PMjsErQkjQfPUqSzfn4SLqiNpr3M82H8LhMBum2Nn57qlEZP+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765231450; c=relaxed/simple;
	bh=y0dVtYgpBHW2zNQce4z7D4f7MlfdBKbveTKiyVO5kuw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SiyWAJ5LygZ5f5LQoyvjFMRFZbgbcmjNzhJ3ePcYtoyjSznxs0wW53ysEnrToDlJn2TikjUr9Joy12ioPsirX419CYg9so9jxNHUa59og2sPuTcaRm8dZMfWl1874RZV3S02jYCTYndR7Kuws7caE94DaEBldH5nSy2HOsJO3Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4tFUqep; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4tFUqep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765231449; x=1796767449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y0dVtYgpBHW2zNQce4z7D4f7MlfdBKbveTKiyVO5kuw=;
  b=m4tFUqepKDnWFZd88KoIwgLo7j4MXmHp12ThnPA3sKqrhg6ypMDx3a/3
   QIKh4KKMWy+iu2cJzzbzsoiRTRrtw79t8ANXYKoJ9eQQziP3Hwdkr1n3j
   pwgufvuWNJ0W8o1vr/xHauqvqZUJwNt+223bR6pdSXxMnHVSb79FPUevZ
   L0F5W8E7hwWnwCUuC8b4YkC9USc3nnAkS2fTYEpqreSBlQe7kFB9xdCqD
   2Z2kdzjCDKn8HzoBDNtlTj9auz+EsCmHLQGrzRkjzRnx+X78FQA0EIqDR
   SaNtxOSvx+40mMZAj7r9/XSPxfXwoSIXFM0w8MZwydKP79Ydjxax2twUl
   A==;
X-CSE-ConnectionGUID: 1mKseDAdQZup/IRE2s8OFg==
X-CSE-MsgGUID: tKqpYcjfQbGar0GOlwtdlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="66906256"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="66906256"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 14:04:09 -0800
X-CSE-ConnectionGUID: vn28ompwTmSVjIfnArVVbw==
X-CSE-MsgGUID: wDhsa4LXR6ORAznbDErmeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="195332165"
Received: from igk-lkp-server01.igk.intel.com (HELO a9286e139fc0) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 08 Dec 2025 14:04:07 -0800
Received: from kbuild by a9286e139fc0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSjKu-000000002GL-0eFT;
	Mon, 08 Dec 2025 22:04:04 +0000
Date: Mon, 8 Dec 2025 23:03:40 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, heppen <hepeng68@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3386/3386] drivers/acpi/cppc_acpi.c:1530:
 warning: Function parameter or member 'auto_act_window' not described in
 'cppc_set_auto_act_window'
Message-ID: <202512082313.2Za1o7Qf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi heppen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   69d9543977fd7abe8b555406c7a3e5d64d8292f8
commit: 6d474065f368e21b77526a5c30f5a1aed017142a [3386/3386] ACPI: CPPC: Add three register ABIs
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251208/202512082313.2Za1o7Qf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512082313.2Za1o7Qf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512082313.2Za1o7Qf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/cppc_acpi.c:450: warning: Function parameter or member 'cpc_pptr' not described in '__acpi_get_psd_map'
   drivers/acpi/cppc_acpi.c:700: warning: Function parameter or member 'pcc_ss_id' not described in 'pcc_data_alloc'
>> drivers/acpi/cppc_acpi.c:1530: warning: Function parameter or member 'auto_act_window' not described in 'cppc_set_auto_act_window'
>> drivers/acpi/cppc_acpi.c:1530: warning: Excess function parameter 'enable' description in 'cppc_set_auto_act_window'
>> drivers/acpi/cppc_acpi.c:1541: warning: Function parameter or member 'cpunum' not described in 'cppc_get_auto_act_window'
>> drivers/acpi/cppc_acpi.c:1541: warning: Function parameter or member 'auto_act_window' not described in 'cppc_get_auto_act_window'
>> drivers/acpi/cppc_acpi.c:1541: warning: Excess function parameter 'cpu' description in 'cppc_get_auto_act_window'
>> drivers/acpi/cppc_acpi.c:1541: warning: Excess function parameter 'enable' description in 'cppc_get_auto_act_window'
>> drivers/acpi/cppc_acpi.c:1552: warning: Function parameter or member 'auto_sel' not described in 'cppc_get_auto_sel'
>> drivers/acpi/cppc_acpi.c:1552: warning: Excess function parameter 'enable' description in 'cppc_get_auto_sel'
>> drivers/acpi/cppc_acpi.c:1575: warning: Function parameter or member 'epp_val' not described in 'cppc_set_epp'
>> drivers/acpi/cppc_acpi.c:1575: warning: Excess function parameter 'enable' description in 'cppc_set_epp'
   drivers/acpi/cppc_acpi.c:1716: warning: Function parameter or member 'cpu_num' not described in 'cppc_get_transition_latency'


vim +1530 drivers/acpi/cppc_acpi.c

  1523	
  1524	/**
  1525	 * cppc_set_auto_act_window - Write autonomous act window register.
  1526	 * @cpu    : CPU to which to write register.
  1527	 * @enable : the desired value of autonomous act window register to be updated.
  1528	 */
  1529	int cppc_set_auto_act_window(int cpu, u64 auto_act_window)
> 1530	{
  1531		return cppc_set_reg(cpu, AUTO_ACT_WINDOW, auto_act_window);
  1532	}
  1533	EXPORT_SYMBOL_GPL(cppc_set_auto_act_window);
  1534	
  1535	/**
  1536	 * cppc_get_auto_act_window - Read autonomous act window register.
  1537	 * @cpu    : CPU to which to write register.
  1538	 * @enable : the desired value of autonomous act window register to be updated.
  1539	 */
  1540	int cppc_get_auto_act_window(int cpunum, u64 *auto_act_window)
> 1541	{
  1542		return cppc_get_reg(cpunum, AUTO_ACT_WINDOW, auto_act_window);
  1543	}
  1544	EXPORT_SYMBOL_GPL(cppc_get_auto_act_window);
  1545	
  1546	/**
  1547	 * cppc_get_auto_sel - Read autonomous selection register.
  1548	 * @cpunum : CPU to which to write register.
  1549	 * @enable : the desired value of autonomous selection resiter to be updated.
  1550	 */
  1551	int cppc_get_auto_sel(int cpunum, u64 *auto_sel)
> 1552	{
  1553		return cppc_get_reg(cpunum, AUTO_SEL_ENABLE, auto_sel);
  1554	}
  1555	EXPORT_SYMBOL_GPL(cppc_get_auto_sel);
  1556	
  1557	
  1558	/**
  1559	 * cppc_set_auto_sel - Write autonomous selection register.
  1560	 * @cpu    : CPU to which to write register.
  1561	 * @enable : the desired value of autonomous selection resiter to be updated.
  1562	 */
  1563	int cppc_set_auto_sel(int cpu, bool enable)
  1564	{
  1565		return cppc_set_reg(cpu, AUTO_SEL_ENABLE, enable);
  1566	}
  1567	EXPORT_SYMBOL_GPL(cppc_set_auto_sel);
  1568	
  1569	/**
  1570	 * cppc_set_epp - Write energe perf register.
  1571	 * @cpu    : CPU to which to write register.
  1572	 * @enable : the desired value of energe perf register to be updated.
  1573	 */
  1574	int cppc_set_epp(int cpu, u64 epp_val)
> 1575	{
  1576		return cppc_set_reg(cpu, ENERGY_PERF, epp_val);
  1577	}
  1578	EXPORT_SYMBOL_GPL(cppc_set_epp);
  1579	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
