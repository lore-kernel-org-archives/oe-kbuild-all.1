Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2217638F655
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 09:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445330; cv=none; b=jN+DoodqWx4SXok3jb33ucy9rklUMJZgYOcbROuVaD+42bxJLIhr346w9QSSaAcmeb7FU/K46qr/cFiAXdu/SqMr0nVf7Cj1fwQgZzXNmy2bV3a/SIsWU9TndMY0pfoq3kRyp8PI+4cXGW9cNnMkRUU+eYTi64SfkAnif6Fszj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445330; c=relaxed/simple;
	bh=E0Qpz/RhQo5XXhMAWqQ0oC09M0nFCI5jlleeZZJ8Tuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sjIhV6H5RYNxsur+75i7KplacesWfiiWKOB27XyMYuRsLunc42bNa9kixyZoq7SygqvDcuJ4MkoI9awUFMqMuiHHydt5Pgu+FkqSanyZbVegHfzSqt7B9jSJO101ygX8QrqqBoT0Fp9AJi6PHIwhPplFp5+0FmrwLzJzagW6iTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aaykeh59; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aaykeh59"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772445328; x=1803981328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E0Qpz/RhQo5XXhMAWqQ0oC09M0nFCI5jlleeZZJ8Tuo=;
  b=aaykeh59qp3QyrpetdFOh+xhBU/WirfcIeOsBl3z+0h08v05vYJZMo/m
   koNtG9c10PjKJqa7yMAhORRCNZOT0eWcDx2dfiiHv9rrW9Toj3f2wy8bP
   cB9CW3gQvUVnMWmYOuLiwAQ7BqSJSRMga7TCkDM26Bc66oxZvG6tc3Xm+
   UICIh4dvqIBF036ioo1vFN3qBCFYpMqWYk2PVBk5x4HGQUkdkDpkM3yeS
   Jz6K9iTAb7Nb9JTXpU/xeVO1iQ15XVmV803xop8NVfaK8KBhbRPi47XPA
   pQQSxQ4opHrECgKzS/103qIljdy4YThS63WGq/XPh2G8UQ6m+Zhyrqbm1
   w==;
X-CSE-ConnectionGUID: N8eB8a6uTrCjcsyIckqrzA==
X-CSE-MsgGUID: JgO0hawaTKmz4+K0o0U5qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84151031"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="84151031"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 01:55:26 -0800
X-CSE-ConnectionGUID: bz92VzzkSNCbpH/bJL3LJg==
X-CSE-MsgGUID: qC80Pt90QTa5PdTrRfoELg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="216737061"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Mar 2026 01:55:25 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwzzl-000000000he-2HGf;
	Mon, 02 Mar 2026 09:55:21 +0000
Date: Mon, 02 Mar 2026 17:54:21 +0800
From: kernel test robot <lkp@intel.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "Jernej =?utf-8?Q?=C5=A0krabec"?= <jernej.skrabec@gmail.com>
Subject: drivers/cpufreq/sun50i-cpufreq-nvmem.c:229:20: sparse:
 sparse: cast to restricted __le32
Message-ID: <202603021703.aBD0w99y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   11439c4635edd669ae435eec308f4ab8a0804808
commit: 14c8a418159e541d70dbf8fc71225d1623beaf0f cpufreq: sun50i: prevent out-of-bounds access
date:   11 months ago
config: riscv-randconfig-r133-20260302 (https://download.01.org/0day-ci/archive/20260302/202603021703.aBD0w99y-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603021703.aBD0w99y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603021703.aBD0w99y-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cpufreq/sun50i-cpufreq-nvmem.c:229:20: sparse: sparse: cast to restricted __le32

vim +229 drivers/cpufreq/sun50i-cpufreq-nvmem.c

   184	
   185	/**
   186	 * sun50i_cpufreq_get_efuse() - Determine speed grade from efuse value
   187	 *
   188	 * Returns non-negative speed bin index on success, a negative error
   189	 * value otherwise.
   190	 */
   191	static int sun50i_cpufreq_get_efuse(void)
   192	{
   193		const struct sunxi_cpufreq_data *opp_data;
   194		struct nvmem_cell *speedbin_nvmem;
   195		const struct of_device_id *match;
   196		struct device *cpu_dev;
   197		void *speedbin_ptr;
   198		u32 speedbin = 0;
   199		size_t len;
   200		int ret;
   201	
   202		cpu_dev = get_cpu_device(0);
   203		if (!cpu_dev)
   204			return -ENODEV;
   205	
   206		struct device_node *np __free(device_node) =
   207			dev_pm_opp_of_get_opp_desc_node(cpu_dev);
   208		if (!np)
   209			return -ENOENT;
   210	
   211		match = of_match_node(cpu_opp_match_list, np);
   212		if (!match)
   213			return -ENOENT;
   214	
   215		opp_data = match->data;
   216	
   217		speedbin_nvmem = of_nvmem_cell_get(np, NULL);
   218		if (IS_ERR(speedbin_nvmem))
   219			return dev_err_probe(cpu_dev, PTR_ERR(speedbin_nvmem),
   220					     "Could not get nvmem cell\n");
   221	
   222		speedbin_ptr = nvmem_cell_read(speedbin_nvmem, &len);
   223		nvmem_cell_put(speedbin_nvmem);
   224		if (IS_ERR(speedbin_ptr))
   225			return PTR_ERR(speedbin_ptr);
   226	
   227		if (len <= 4)
   228			memcpy(&speedbin, speedbin_ptr, len);
 > 229		speedbin = le32_to_cpu(speedbin);
   230	
   231		ret = opp_data->efuse_xlate(speedbin);
   232	
   233		kfree(speedbin_ptr);
   234	
   235		return ret;
   236	};
   237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
