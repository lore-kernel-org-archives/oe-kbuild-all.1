Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423D51EDA1E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jun 2025 15:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751211883; cv=none; b=rwZ8N3aGuUUEB4k863RO5490AylbT+OfU/WMTqfSfXAULKjkU5Xv66XgKzlqU41+nVu9AqTQrU78+BrexpmS5qf7IwG2+MPk7qUOnixuTw4mBhQr0rr/iZuXdXIIiZkcIMNPZlxAq02YC5ftkWBNGqx3oOPPMqHM3pJWWBNxB0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751211883; c=relaxed/simple;
	bh=O8Em6nB1MV41GnArKu+RewNq0tbElsTuCoxOCaumqF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mPPBqxMAQqtHskFn2OOl3xx/pl68Ar2jqOdCP3eOJej857EIkYsWyYSMIf/argQVbxchffCy9UUSh3ZaB40m+BkhCg18Xv4HCkFCE0pI9VHZpb+LBh0jnsfzh7/PAJJ8fqkhmSCTK4d/pi6q0ryCHHs0Pu9XVDoiBUOHQJdXofA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQ+/ltYh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQ+/ltYh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751211881; x=1782747881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O8Em6nB1MV41GnArKu+RewNq0tbElsTuCoxOCaumqF4=;
  b=QQ+/ltYhjt5ZO6YI3XKfFvsY7Q/ZWhZEFZrUsGjM4dNYP4wDO7fyEHmG
   eWSvC8dqAQRnBGjipYkJJysxIAw2NJsfqzvaKrxNiLlIHkgZp90bvWwA9
   GIkvvuhuSb0Mz5WdUs1jPjq3SWgyR4YVsCpSAOJ/hC26eAN1HHhQedbvf
   jxGPxtqOBMnPXqgJHGGBxHko2s4hHgv7r+73D0KmKlUeMIpDb7gh8uJhr
   gY2rFaEOPim/HetPs7Bf/JSIMcjd8kkXfT/kX6xT/5drBAexCjIWT+fox
   Fnh+ljWMgwxKERhj+5YBFA+2SsUHflvJm9d+yQK/0QNvtw18j+AvuWOZU
   g==;
X-CSE-ConnectionGUID: UsO91l/qSR6vKuqg3tPPrw==
X-CSE-MsgGUID: 0F+YEir9S0iMs8wwSpFXnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53411913"
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="53411913"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 08:44:40 -0700
X-CSE-ConnectionGUID: +5qXzSZoQyuWc55kYmszVQ==
X-CSE-MsgGUID: 6BcfxEtyRcyCCeueAopo3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="153954655"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jun 2025 08:44:39 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVuCq-0000w7-2v;
	Sun, 29 Jun 2025 15:44:36 +0000
Date: Sun, 29 Jun 2025 17:43:55 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, heppen <hepeng68@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2985/2985] drivers/acpi/cppc_acpi.c:1530:
 warning: Function parameter or member 'auto_act_window' not described in
 'cppc_set_auto_act_window'
Message-ID: <202506291741.NhBzViuH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c245365237da527fb423d85e7ec54648113f843d
commit: 6d474065f368e21b77526a5c30f5a1aed017142a [2985/2985] ACPI: CPPC: Add three register ABIs
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250629/202506291741.NhBzViuH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506291741.NhBzViuH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506291741.NhBzViuH-lkp@intel.com/

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
