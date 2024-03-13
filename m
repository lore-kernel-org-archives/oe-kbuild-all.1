Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2FD12B6F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 07:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314746; cv=none; b=I792JiLAg9brKwCr4w76EIQnjiS+6XQNShTZllYiz2+3xVS47e/5WKiteduoNVzVj091w/FwsG0HNGpMvikIHiBZ3pJWcCVFw/tfbmuDW88j7K2bV/PQZI/zzsRAB9jGPSF5xanutuiPBBjUpsH4fCAyMslrvNgASFGvfbbu3Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314746; c=relaxed/simple;
	bh=n/1c0o6zXEBuAzFFrCho1aei3lJwoPuXd86Fc/lCaGY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NoyFydSo6ed46agY34F3kz9JW1oEsGILAOBSVnDoVXn2h1amhI25CPMdusubKQaL/leRwaF5evlhZh1fCNi5DbrbyDWpP/84TefFFUGDS+WM33FCLU/FPpUZSZ5QAHjYsizhaIa1Tv15P/qjJmqYCEdLAUN7I+GKn8YzFYbk+XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZs6ljlO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZs6ljlO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314745; x=1741850745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n/1c0o6zXEBuAzFFrCho1aei3lJwoPuXd86Fc/lCaGY=;
  b=fZs6ljlOXViuk+9DFr2CZc8kr59JR5eTpow49D8gzkDxva+/YuK6GwOD
   WKPkR7qD14S/78BeEQwL6y0bfSSo2snqa6er+/Kb8WkAmq/Xz/L0l1VI0
   4XrEwBU403lzDHZlMkm86etruoah5rwv7t5UVEKWmjwp8v/CLrqxz3BSL
   23UILwf+nCTzgYj8FuGf+49vSjTtL925TnL+m4bqmLbTr0CuQOzFf1Qf/
   xBjnDbxIknPEQB1ETkBw+LQ+QB/OoUsvjuBBSx9I8jqoDOCIJOt2cfDGZ
   GaMUa7eUh5xS6t/ErqgAqvduir1xr3ZVk/ZJ70Mf0lXGjvR1zqZL4jeJv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="15785644"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="15785644"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16390280"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Mar 2024 00:25:38 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkIzX-000C8t-2I;
	Wed, 13 Mar 2024 07:25:35 +0000
Date: Wed, 13 Mar 2024 15:24:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 25744/30000]
 arch/arm64/kernel/cpufeature.c:1627:6: warning: no previous prototype for
 'update_pbha_perf_only_bit'
Message-ID: <202403131533.AIOfBKrb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4fa7099066983597bd415dde5a3e416bf2bd8f7c
commit: f43933b3f947a7f9314ec8d704c6ae01041dbbba [25744/30000] arm64: cpufeature: Enable PBHA for stage1 early via FDT
config: arm64-randconfig-002-20240312 (https://download.01.org/0day-ci/archive/20240313/202403131533.AIOfBKrb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403131533.AIOfBKrb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403131533.AIOfBKrb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/cpufeature.c:1627:6: warning: no previous prototype for 'update_pbha_perf_only_bit' [-Wmissing-prototypes]
    1627 | void update_pbha_perf_only_bit(const u8 *bits, int cnt)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/cpufeature.c:1729:13: warning: no previous prototype for 'early_pbha_init' [-Wmissing-prototypes]
    1729 | void __init early_pbha_init(void)
         |             ^~~~~~~~~~~~~~~


vim +/update_pbha_perf_only_bit +1627 arch/arm64/kernel/cpufeature.c

  1626	
> 1627	void update_pbha_perf_only_bit(const u8 *bits, int cnt)
  1628	{
  1629		u8 val;
  1630		int i;
  1631	
  1632		/* any listed value is usable at stage 1 */
  1633		for (i = 0 ; i < cnt; i++) {
  1634			val = bits[i];
  1635			if (val > 0xf)
  1636				continue;
  1637	
  1638			pbha_stage1_enable_bits |= val;
  1639			set_bit(val, &arm64_pbha_perf_only_values);
  1640		}
  1641	}
  1642	
  1643	static bool plat_can_use_pbha_stage1(const struct arm64_cpu_capabilities *cap,
  1644					     int scope)
  1645	{
  1646		u8 val;
  1647		struct device_node *cpus;
  1648		const u8 *perf_only_vals;
  1649		int num_perf_only_vals, i;
  1650	
  1651		if (!has_cpuid_feature(cap, scope))
  1652			return false;
  1653	
  1654		/*
  1655		 * Calls with scope == SCOPE_LOCAL_CPU need only testing whether this
  1656		 * cpu has the feature. A later 'system' scope call will check for a
  1657		 * firmware description.
  1658		 */
  1659		if (scope == SCOPE_LOCAL_CPU)
  1660			return true;
  1661	
  1662		spin_lock(&pbha_dt_lock);
  1663		if (pbha_enabled)
  1664			goto out_unlock;
  1665	
  1666		cpus = of_find_node_by_path("/cpus");
  1667		if (!cpus)
  1668			goto done;
  1669	
  1670		perf_only_vals = of_get_property(cpus, "arm,pbha-performance-only",
  1671						 &num_perf_only_vals);
  1672		if (!perf_only_vals)
  1673			goto done;
  1674	
  1675		update_pbha_perf_only_bit(perf_only_vals, num_perf_only_vals);
  1676	
  1677		/*
  1678		 * for stage2 the values are collapsed back to 4 bits that can only
  1679		 * enable values in the arm64_pbha_perf_only_values mask.
  1680		 */
  1681		for (i = 0 ; i < num_perf_only_vals; i++) {
  1682			val = perf_only_vals[i];
  1683			if (val > 0xf)
  1684				continue;
  1685	
  1686			stage2_test_pbha_value(val);
  1687		}
  1688	
  1689	done:
  1690		of_node_put(cpus);
  1691		pbha_enabled = true;
  1692	
  1693	out_unlock:
  1694		spin_unlock(&pbha_dt_lock);
  1695		return !!pbha_stage1_enable_bits;
  1696	}
  1697	
  1698	static void enable_pbha_inner(void)
  1699	{
  1700		u64 tcr;
  1701	
  1702		if (!pbha_stage1_enable_bits)
  1703			return;
  1704	
  1705		tcr = read_sysreg(tcr_el1);
  1706		tcr |= FIELD_PREP(TCR_HWU0nn_MASK, pbha_stage1_enable_bits);
  1707		tcr |= FIELD_PREP(TCR_HWU1nn_MASK, pbha_stage1_enable_bits);
  1708		tcr |= FIELD_PREP(TCR_HPD0, 1) | FIELD_PREP(TCR_HPD1, 1);
  1709	
  1710		write_sysreg(tcr, tcr_el1);
  1711		isb();
  1712		local_flush_tlb_all();
  1713	}
  1714	
  1715	static void cpu_enable_pbha(struct arm64_cpu_capabilities const *cap)
  1716	{
  1717		enable_pbha_inner();
  1718	}
  1719	
  1720	static inline bool cpu_has_pbha(void)
  1721	{
  1722		u64 mmfr1 = read_cpuid(ID_AA64MMFR1_EL1);
  1723		int val = cpuid_feature_extract_unsigned_field(mmfr1,
  1724							       ID_AA64MMFR1_HPD_SHIFT);
  1725	
  1726		return val == 2;
  1727	}
  1728	
> 1729	void __init early_pbha_init(void)
  1730	{
  1731		void *fdt;
  1732		int node;
  1733		const u8 *prop;
  1734		int size;
  1735	
  1736		spin_lock(&pbha_dt_lock);
  1737	
  1738		fdt = get_early_fdt_ptr();
  1739		if (!fdt)
  1740			goto unlock;
  1741	
  1742		node = fdt_path_offset(fdt, "/cpus");
  1743		if (node < 0)
  1744			goto unlock;
  1745	
  1746		prop = fdt_getprop(fdt, node, "arm,pbha-performance-only", &size);
  1747		if (!prop)
  1748			goto unlock;
  1749	
  1750		if (!cpu_has_pbha())
  1751			goto unlock;
  1752	
  1753		update_pbha_perf_only_bit(prop, size);
  1754		enable_pbha_inner();
  1755	
  1756		pbha_enabled = true;
  1757	
  1758	unlock:
  1759		spin_unlock(&pbha_dt_lock);
  1760	}
  1761	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
