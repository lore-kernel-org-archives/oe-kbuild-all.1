Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0D932938D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 14:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766155115; cv=none; b=ZcBBF7L4mTznJ0ilUg9H5EXG8AiwikmLz5N+q6qNrKa59R2hXXyiWimqADNMETGSTwQmlhO6OGvPjc143t9uJ9pPfZ+dcGjia+J4/akeSBgMlX2WVsWCuwX4sLirEfIGTmoo1yAeNegLn3mWw+8wZQj6viqeTIGxQvDU/s8EW50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766155115; c=relaxed/simple;
	bh=YpI8POHFBZ+3gHAmgdOQS+M8K4LGXyAohymnx4YKp0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JFBEdeqcoEQY+0dyZ17troM+S+cucnt0VzbopAtpfoXEEchkR5yriGJosw+ERm5gkydNQQHkxBVeenBVm6yPjXi4VpEp6x7m+KOU9s19t4eR0V6I/EA+G/OONrD/j6kDtSyEf9Qh1sTtjjVSml6lDTD/wriQvpywr68YxJMX/hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3rA/DDC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3rA/DDC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766155113; x=1797691113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YpI8POHFBZ+3gHAmgdOQS+M8K4LGXyAohymnx4YKp0g=;
  b=C3rA/DDC5MjWW9N6SCPz+vQ+504GeZRt5UWzeaJa+ALeupg8SVjT4c2f
   Bk0p3GHC9BAyIbB2X2FEcQJ2LhTZrk+2+1BQvpxNGaayOzL69KJEBBEhq
   C1nXY6Z6C3eQb6qBwBEAIaXh1XrSGFspf9rfbg6IISz+cE9su7PbJR9RK
   uKK3TjznBnYoXnonASfjZI65ZLvs0XtE4q6iEi9AA9+uek33aV04Y/aew
   kwdGbsWuViKgXywRTKiahMKi0eSJ2rdsrbzaqjnrTgC5nWCB7nvufLJkC
   5nYR4KMcrpb3qL1HtKNkr7Dho94f84bTXA3mxv0waZsBz7sqFVDgcnL59
   w==;
X-CSE-ConnectionGUID: 2J/V7nGmSV6Kx4I/12c5DQ==
X-CSE-MsgGUID: ZBgjbCybTfSIvTOtsqnpxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68156578"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="68156578"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:38:30 -0800
X-CSE-ConnectionGUID: KIzzXBnKQbaWzvbyf/TMPQ==
X-CSE-MsgGUID: 0Fv3Id5LQQOzXsnar2FQgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="236300050"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Dec 2025 06:38:29 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWbch-000000003dZ-0X85;
	Fri, 19 Dec 2025 14:38:27 +0000
Date: Fri, 19 Dec 2025 22:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/4]
 drivers/of/property.c:1239: warning: Function parameter or member 'optional'
 not described in 'supplier_bindings'
Message-ID: <202512192239.5RoSDi1V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   500d05631d89314552da084e17819640507698bf
commit: 4049b5ae07d7d8f65bc2978b76c534500dde276d [0/4] UPSTREAM: of: property: Add fw_devlink support for optional properties
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251219/202512192239.5RoSDi1V-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512192239.5RoSDi1V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512192239.5RoSDi1V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/of/property.c:1239: warning: Function parameter or member 'optional' not described in 'supplier_bindings'
   drivers/of/property.c:1363: warning: Excess function parameter 'dev' description in 'of_link_property'


vim +1239 drivers/of/property.c

a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1218  
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1219  /**
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1220   * struct supplier_bindings - Property parsing functions for suppliers
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1221   *
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1222   * @parse_prop: function name
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1223   *	parse_prop() finds the node corresponding to a supplier phandle
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1224   * @parse_prop.np: Pointer to device node holding supplier phandle property
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1225   * @parse_prop.prop_name: Name of property holding a phandle value
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1226   * @parse_prop.index: For properties holding a list of phandles, this is the
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1227   *		      index into the list
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1228   *
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1229   * Returns:
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1230   * parse_prop() return values are
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1231   * - phandle node pointer with refcount incremented. Caller must of_node_put()
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1232   *   on it when done.
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1233   * - NULL if no phandle found at index
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1234   */
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1235  struct supplier_bindings {
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1236  	struct device_node *(*parse_prop)(struct device_node *np,
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1237  					  const char *prop_name, int index);
4049b5ae07d7d8 Saravana Kannan 2021-02-05  1238  	bool optional;
a3e1d1a7f5fccc Saravana Kannan 2019-09-04 @1239  };
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1240  

:::::: The code at line 1239 was first introduced by commit
:::::: a3e1d1a7f5fcccaf1d252278425fea9a4a553100 of: property: Add functional dependency link from DT bindings

:::::: TO: Saravana Kannan <saravanak@google.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
