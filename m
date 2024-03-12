Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD36F5680
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 01:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710205748; cv=none; b=O+8nhEbQ1HysPohdyNQViZvChl66tqIJYV3tWgjX5pNNsjruMX1Q4VY6Fq0bclw0bEvMAMWg4XYQphBR6xXeghel/TZBGxXD47wBH7txwVbr2cDKY3Q7lNYuVqXlIfQMbLN4tjisdqxmoAu+hT65VA+AzX7x4+lj4Dou17t3v58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710205748; c=relaxed/simple;
	bh=c/T+RrQvx7Yn2+PJcfMhr+WK2Y4JuSYuux0+r41C2qc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BxBzIwiyQRwh7N5RfdR0ruBA5aN84LO5MNR8+GexbTEXwrE7zc9t80XbeJKjUXamIX9G3p3oisjouQTYnUY+uiNA8QkwAKHwfwN++xr983d1PdIC98Zbh/VTbOfdZpMJvNebIX79TPaJfp1wrCSRVKX3XZ8cEPWdVpGA4cMWf1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jt4d4XwE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jt4d4XwE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710205747; x=1741741747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c/T+RrQvx7Yn2+PJcfMhr+WK2Y4JuSYuux0+r41C2qc=;
  b=jt4d4XwEb7WH2mla2/yka3A+4ruX2Z06BpOrcke/t547D5CBEPy5ynj2
   bJSV4hgVJgM1uvcE+ju5K7FAkG1xxJV/gjTGfa/aRFkk3OCXwXkzaZspX
   jDzUZRquIholOXZcwVvVn0zK1RVmWTx0x3bD9PgcwZFWt9T9x2G9Gk1U+
   gO4GJWZTMVRXcx28nEqbEv5GgIa3Ik75UqfxGAqJ/0TV5BB4A6vlnsM4j
   e6/sSK4LLXOp4mVX3n35h3yXUBL9dZ49i/lKcc1iciN8Ge22I4vxjPOJH
   3XVUgvulqRXZPcpbEBxgWp4HO+QpfUnahW7uAH04vi+gAQhGrW6LrKkzN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="15458979"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="15458979"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 18:09:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="42271937"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Mar 2024 18:09:05 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjqda-0009b1-0z;
	Tue, 12 Mar 2024 01:09:02 +0000
Date: Tue, 12 Mar 2024 09:08:07 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:dcd-2024-03-10 9/26] drivers/cxl/core/memdev.c:113:25:
 sparse: sparse: symbol 'dev_attr_region_count' was not declared. Should it
 be static?
Message-ID: <202403120947.eqI0eNGU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-2024-03-10
head:   0dd99bd79b33de8f6e293c9a2373ca321dad33c7
commit: f649c5634f5047959eb0cffe61c7cec9075a5d61 [9/26] cxl/mem: Expose device dynamic capacity capabilities
config: i386-randconfig-063-20240311 (https://download.01.org/0day-ci/archive/20240312/202403120947.eqI0eNGU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403120947.eqI0eNGU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403120947.eqI0eNGU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cxl/core/memdev.c:113:25: sparse: sparse: symbol 'dev_attr_region_count' was not declared. Should it be static?

vim +/dev_attr_region_count +113 drivers/cxl/core/memdev.c

   112	
 > 113	struct device_attribute dev_attr_region_count =
   114		__ATTR(region_count, 0444, region_count_show, NULL);
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
