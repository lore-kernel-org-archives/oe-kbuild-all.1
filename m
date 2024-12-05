Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533F41AA1C7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 07:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733382350; cv=none; b=OVCHJs55tGhLbTCqfn+1OL07ex2ktUAUpJOuARUZYaV5j4f3RVZG5sDbRLG0RVhgZXHVoK/mZLOurqbzx/PQOycd3Gen5wkfZmnDMpWW652u16tpW1wmjdB1D4Qa0llf9OwECBemkSEIdh71IfH2/S2sm3M+NPNE/WIoTjX4Uxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733382350; c=relaxed/simple;
	bh=Wc6U++1Ha670xseqZf+ssSwkKrH08ehsD5xnj5nnHkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T3IgpRvui5zbURCEJ+cSeNkULNk1xADY+Ff81sl9jcX4cNsMbuLaUrFr86PPk2q2N4wAL+w/MXwS260fZtTJpODP5S5R0OIewlv+OLCbk/sxfrvr61Q9+YeUTMThxLikHm717GJURbz4VBvsrlOqvNhLaun+VdCkUt+iTaMKx+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lazWnJKD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lazWnJKD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733382349; x=1764918349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wc6U++1Ha670xseqZf+ssSwkKrH08ehsD5xnj5nnHkg=;
  b=lazWnJKDuCwxYPvdPDxa6+jLVWX7meXY93zZEqVgda2Y2SvVnVbnJrN2
   qlK9ehZYFSjQ9oin8cHPKH5iJ0slfVZOjlc5X3HDcxY3WNKykbwJH7Dkn
   sD0bUztqcXRwlGWwu9M0VuHGxembA9bAvi960avzqjSNwMIeR2B1rrHBY
   9YPEiooFhfTyd+IGriLhM/wbA3bMa+JgbkjcaH2tKwh+VcqITspx09KQ/
   G/BdKu9DTh6+WSO8zv1+EbDUVM9K7NSEUDzU0seO1S7umk/9lsQfG3qZR
   /fZAIN3n6LaL3YIgcVaB/VVUZvqeUw/p2xTxird2wizQw7wNf+WNo4S4/
   A==;
X-CSE-ConnectionGUID: qS/33pj+TUmgqerYMkzRSA==
X-CSE-MsgGUID: 18mXosMkQiGcYrESf4gqYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33809644"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="33809644"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 23:05:48 -0800
X-CSE-ConnectionGUID: SUMQhdRrTyie8XkQcdu98Q==
X-CSE-MsgGUID: fZ2+E0bXQT689Sesp/drZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="124924429"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Dec 2024 23:05:46 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ5vk-0003vb-1o;
	Thu, 05 Dec 2024 07:05:44 +0000
Date: Thu, 5 Dec 2024 15:04:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, heppen <hepeng68@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2546/2546] drivers/acpi/cppc_acpi.c:1530:
 warning: Function parameter or member 'auto_act_window' not described in
 'cppc_set_auto_act_window'
Message-ID: <202412051441.aDAuRsLp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   fdc4bca5e9e486a894194c2b6a956492b11d8cc5
commit: 6d474065f368e21b77526a5c30f5a1aed017142a [2546/2546] ACPI: CPPC: Add three register ABIs
config: arm64-randconfig-004-20241205 (https://download.01.org/0day-ci/archive/20241205/202412051441.aDAuRsLp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051441.aDAuRsLp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051441.aDAuRsLp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/cppc_acpi.c:450: warning: Function parameter or member 'cpc_pptr' not described in '__acpi_get_psd_map'
   drivers/acpi/cppc_acpi.c:700: warning: Function parameter or member 'pcc_ss_id' not described in 'pcc_data_alloc'
>> drivers/acpi/cppc_acpi.c:1530: warning: Function parameter or member 'auto_act_window' not described in 'cppc_set_auto_act_window'
>> drivers/acpi/cppc_acpi.c:1530: warning: Excess function parameter 'enable' description in 'cppc_set_auto_act_window'
>> drivers/acpi/cppc_acpi.c:1541: warning: Function parameter or member 'cpunum' not described in 'cppc_get_auto_act_window'
>> drivers/acpi/cppc_acpi.c:1541: warning: Function parameter or member 'auto_act_window' not described in 'cppc_get_auto_act_window'
>> drivers/acpi/cppc_acpi.c:1541: warning: Excess function parameter 'cpu' description in 'cppc_get_auto_act_window'
>> drivers/acpi/cppc_acpi.c:1541: warning: Excess function parameter 'enable' description in 'cppc_get_auto_act_window'
   drivers/acpi/cppc_acpi.c:1552: warning: Function parameter or member 'auto_sel' not described in 'cppc_get_auto_sel'
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
