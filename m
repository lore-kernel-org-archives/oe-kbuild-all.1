Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2431AAD7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 17:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731866107; cv=none; b=p8Md8MpEE9bGEmGNGtZ/bWBMXOkAeM6lUUf6Zj+od5007SLnDqbJ4lUJUBxPYs52iRUjgx+FTJ2yZQlW2JNVSHfcmw0MU5zYQdWUPQwsdy4IGO42Adm9V2BTCIUUP3iBm/iMGcMxbLuCb4B1mwma6XLdFs2zFw16dNURuG3LjfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731866107; c=relaxed/simple;
	bh=oR4K6JU/q5ZrXyLerci6Q9Ih6YF5BGvqM8YxDUw3Ofg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EAZX9j49KKfwoo/tcBD1z2DWlb0Fuk31zRly44FPAT48KB00ZEYpwp7kl8Spt6uww7/ih38DMhIyPGQeXNJU3kYw1fgudj3hDprmrLGRZu+OZgSnn0OnmniwRxYcRMVhbPNFO3kuBIKVrz9NiXOA6Ig0DGukXYmCx281YE9Ih4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6xWSqSJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6xWSqSJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731866105; x=1763402105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oR4K6JU/q5ZrXyLerci6Q9Ih6YF5BGvqM8YxDUw3Ofg=;
  b=k6xWSqSJJSeAsSX50ROdvQJDZNf3eNJ+/Aq412ru8nYwMFYSzjfwBIqp
   K72uq+DFrVVsu96sRqdRW0zIbtOHVaMtoW4na3cEUbOXRLYpign05Tmjf
   zhEowin9Mcvi5PX4IB0nMOCAIXDTtN1LWTjketZEryEiSWpTA/BGbkx5X
   J79s0CLK6EBAWytrjHhQbdpqBvyGkRUG9APQo8XjQJdHDNkJxlT2MSDYP
   39AbvlKzS4ldw+U9D3Oh7uyiVgA55fevPszr3gKE2/pzRoHRZ3EaE5eM+
   /4w7B+e7M8pnmSj2pelI4H7IOG2VDdUnj/wbtWIqe5Rqnqo0Vb/tTdGLY
   A==;
X-CSE-ConnectionGUID: rRxTZv8WTRyfYCq+0WM9eQ==
X-CSE-MsgGUID: dv3MIl3dQ2yFh41l+OQhHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="49254348"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="49254348"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 09:55:04 -0800
X-CSE-ConnectionGUID: +6bT2R5SSnSMtmnxN3iesw==
X-CSE-MsgGUID: 3QPDXsfTSc2hHn1cspUvQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="89430495"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Nov 2024 09:55:03 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCjUC-0001yw-1v;
	Sun, 17 Nov 2024 17:55:00 +0000
Date: Mon, 18 Nov 2024 01:54:02 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-bin_attr-cb 119/120]
 drivers/of/kobj.c:80:23: error: assignment to 'ssize_t (*)(struct file *,
 struct kobject *, const struct bin_attribute *, char *, loff_t,  size_t)'
 {aka 'long int (*)(struct file *, struct kobject *, const struct
 bin_attribute *, char *, long long int,  l...
Message-ID: <202411180159.aiNAJVtK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-bin_attr-cb
head:   216b83e0b4d86a2170ccde16f4a8117e32c02d85
commit: bd9c9ea9d4ba3b26fb22e8dc805d2f7eb826856d [119/120] read/write
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20241118/202411180159.aiNAJVtK-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180159.aiNAJVtK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180159.aiNAJVtK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/of/kobj.c: In function '__of_add_property_sysfs':
>> drivers/of/kobj.c:80:23: error: assignment to 'ssize_t (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, loff_t,  size_t)' {aka 'long int (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, long long int,  long unsigned int)'} from incompatible pointer type 'ssize_t (*)(struct file *, struct kobject *, struct bin_attribute *, char *, loff_t,  size_t)' {aka 'long int (*)(struct file *, struct kobject *, struct bin_attribute *, char *, long long int,  long unsigned int)'} [-Wincompatible-pointer-types]
      80 |         pp->attr.read = of_node_property_read;
         |                       ^


vim +80 drivers/of/kobj.c

b56b5528f5b3c3 Rob Herring 2017-10-04  62  
b56b5528f5b3c3 Rob Herring 2017-10-04  63  int __of_add_property_sysfs(struct device_node *np, struct property *pp)
b56b5528f5b3c3 Rob Herring 2017-10-04  64  {
b56b5528f5b3c3 Rob Herring 2017-10-04  65  	int rc;
b56b5528f5b3c3 Rob Herring 2017-10-04  66  
b56b5528f5b3c3 Rob Herring 2017-10-04  67  	/* Important: Don't leak passwords */
b56b5528f5b3c3 Rob Herring 2017-10-04  68  	bool secure = strncmp(pp->name, "security-", 9) == 0;
b56b5528f5b3c3 Rob Herring 2017-10-04  69  
b56b5528f5b3c3 Rob Herring 2017-10-04  70  	if (!IS_ENABLED(CONFIG_SYSFS))
b56b5528f5b3c3 Rob Herring 2017-10-04  71  		return 0;
b56b5528f5b3c3 Rob Herring 2017-10-04  72  
b56b5528f5b3c3 Rob Herring 2017-10-04  73  	if (!of_kset || !of_node_is_attached(np))
b56b5528f5b3c3 Rob Herring 2017-10-04  74  		return 0;
b56b5528f5b3c3 Rob Herring 2017-10-04  75  
b56b5528f5b3c3 Rob Herring 2017-10-04  76  	sysfs_bin_attr_init(&pp->attr);
b56b5528f5b3c3 Rob Herring 2017-10-04  77  	pp->attr.attr.name = safe_name(&np->kobj, pp->name);
b56b5528f5b3c3 Rob Herring 2017-10-04  78  	pp->attr.attr.mode = secure ? 0400 : 0444;
b56b5528f5b3c3 Rob Herring 2017-10-04  79  	pp->attr.size = secure ? 0 : pp->length;
b56b5528f5b3c3 Rob Herring 2017-10-04 @80  	pp->attr.read = of_node_property_read;
b56b5528f5b3c3 Rob Herring 2017-10-04  81  
b56b5528f5b3c3 Rob Herring 2017-10-04  82  	rc = sysfs_create_bin_file(&np->kobj, &pp->attr);
b56b5528f5b3c3 Rob Herring 2017-10-04  83  	WARN(rc, "error adding attribute %s to node %pOF\n", pp->name, np);
b56b5528f5b3c3 Rob Herring 2017-10-04  84  	return rc;
b56b5528f5b3c3 Rob Herring 2017-10-04  85  }
b56b5528f5b3c3 Rob Herring 2017-10-04  86  

:::::: The code at line 80 was first introduced by commit
:::::: b56b5528f5b3c3d47e7c0ca67318c45e980d93f0 of: make kobject and bin_attribute support configurable

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: Rob Herring <robh@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
