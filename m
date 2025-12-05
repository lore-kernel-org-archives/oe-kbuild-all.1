Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960763242A9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 11:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764932511; cv=none; b=V8NkVI4h2avo9EQlQfvXgnfDSrQcD9xbE9Bb3BhE1mG6IuOcsMKUHGw0nqU52nILtSL06670bhTnKlJ0QZwFOk8JgC8eBzjBnFDccjBw0EVC7K49o6qmfU+xBo6b/HcfL8W3K6IbIiY4TKJikchsuU5dz6NEnny+2OYKuNex+ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764932511; c=relaxed/simple;
	bh=5cSbAIG9cGH7SWe0v6I4brSC4iBvEdsZUOwfhWMsc5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YKovZxYh69epMXqKmmQItytuvY8PA1yapJt1ty5T/LrPIq7ytu5HF6GKi/TRqFs5thCTZNV1MiHCWiqC3PYqxVCH5BzWrVzka3upZsL+r/urNVamUdBanGDCZeVxLoyU0yLi1yv/IrFuib+WcgwDMnzC8OgEKBsN/QbL/agnJCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BGtN3lUI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BGtN3lUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764932507; x=1796468507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5cSbAIG9cGH7SWe0v6I4brSC4iBvEdsZUOwfhWMsc5E=;
  b=BGtN3lUIeGZ78V632uT4Nb0BDjt2m9+VLffDDQE4U3zko6Ca1yhimeMj
   SSy8qM+wkXloIAdm6P8QzInrOv8Kc09cGDOYiTP0SsM1kfkWZE8fosgOC
   /gMJ4ROqlf9fKDXpMDhQz/KE8EItRLYVyzkzEc3DmggGNBJRneiYI40oK
   /wNW7lRZ5K4IJ5ToX0JY9/GjFNKnrt64oCr0IAtJlWbDjombQLWrMlM8m
   jgpWKPmRiKpOl5Fi53WVBO+C69bbQPbkUIbqfexuW3YL4+ZDXHMAsBWO5
   /I20FctNoA1xteXR+odbw9jpNbR6bNywJOy7QIvAcZm41mcZ10944wpaR
   w==;
X-CSE-ConnectionGUID: ge2d27jeQeqlKIzzDl2+9Q==
X-CSE-MsgGUID: RoYL7zZxQ1W+12fvL5k0fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70814644"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="70814644"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 03:01:42 -0800
X-CSE-ConnectionGUID: hkl+kk9pQnSB5/dMe89Aug==
X-CSE-MsgGUID: WJ1SubyDTi6JWQsRTKLEFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="199459077"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Dec 2025 03:01:41 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRTZD-00000000EuD-0Lyz;
	Fri, 05 Dec 2025 11:01:39 +0000
Date: Fri, 5 Dec 2025 19:00:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3382/3382] arch/arm64/kernel/topology.c:380:22:
 sparse: sparse: dereference of noderef expression
Message-ID: <202512051824.V6vO84rU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   06a8b520851290347ca458d4335bebc607fe3b58
commit: 488a3120a38a58d51124ab91b7edb1eed322bae3 [3382/3382] arm64: implement CPPC FFH support using AMUs
config: arm64-randconfig-r122-20251205 (https://download.01.org/0day-ci/archive/20251205/202512051824.V6vO84rU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051824.V6vO84rU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512051824.V6vO84rU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/topology.c:380:22: sparse: sparse: dereference of noderef expression

vim +380 arch/arm64/kernel/topology.c

   375	
   376	int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
   377	{
   378		int ret = -EOPNOTSUPP;
   379	
 > 380		switch ((u64)reg->address) {
   381		case 0x0:
   382			ret = counters_read_on_cpu(cpu, cpu_read_corecnt, val);
   383			break;
   384		case 0x1:
   385			ret = counters_read_on_cpu(cpu, cpu_read_constcnt, val);
   386			break;
   387		}
   388	
   389		if (!ret) {
   390			*val &= GENMASK_ULL(reg->bit_offset + reg->bit_width - 1,
   391					    reg->bit_offset);
   392			*val >>= reg->bit_offset;
   393		}
   394	
   395		return ret;
   396	}
   397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
