Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D4F1879
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 12:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680091482; x=1711627482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XDwhdUToSwxLAjq3QrRG+6IdJsFCmnIX/hm9GdXaIJI=;
  b=gRIsPVKHJDnqnhmvwlSByBPuUNZ5CMp0Ki2UAeB/cu9TYa/MQPOon7S3
   F8YuaL5mOwCL7JCwK5jPfFSIvfUGWTxnXuJ2QQV284bP2uhLKrIW7lWzK
   Rsq6gI+oRa/AfHnU7nlIcdubTV18yPVBFHeocipludkiTMmVdXHQKKISl
   jCfJyFLskC+hfce7hm+bWoEdASLyFOyGxl67JTBXsDCID5B8dsiRqlYSd
   LEqK9ZeVWlbHAT6cl8WIrrPMbewEM8WfCBPqG/9FFyMahOGe/bhmVSZ2v
   pB0/7H96Hum66oh3zsPsnfJvoktTS9jpwixcxI9EaBCX2ydX4DezIb9D0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="339581801"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="339581801"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 05:03:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="686805334"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="686805334"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Mar 2023 05:03:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phUWq-000JVO-1Y;
	Wed, 29 Mar 2023 12:03:48 +0000
Date: Wed, 29 Mar 2023 20:03:16 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/address-helpers 7/20]
 arch/arm/mach-omap2/omap_hwmod.c:2210:43: error: passing argument 3 of
 'of_range_to_resource' from incompatible pointer type
Message-ID: <202303291938.UTs4O8Wy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/address-helpers
head:   3a4e9c2e639e023556eefa93256ce5bf34137a60
commit: 4accd220ec46d92668127bbfb95fe5157a7cbeae [7/20] ARM: omap2: Use of_range_to_resource() for "ranges" parsing
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230329/202303291938.UTs4O8Wy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=4accd220ec46d92668127bbfb95fe5157a7cbeae
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/address-helpers
        git checkout 4accd220ec46d92668127bbfb95fe5157a7cbeae
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303291938.UTs4O8Wy-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/mach-omap2/omap_hwmod.c: In function 'omap_hwmod_parse_module_range':
>> arch/arm/mach-omap2/omap_hwmod.c:2210:43: error: passing argument 3 of 'of_range_to_resource' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2210 |         err = of_range_to_resource(np, 0, &res);
         |                                           ^~~~
         |                                           |
         |                                           struct resource **
   In file included from arch/arm/mach-omap2/omap_hwmod.c:140:
   include/linux/of_address.h:90:50: note: expected 'struct resource *' but argument is of type 'struct resource **'
      90 |                                 struct resource *res);
         |                                 ~~~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors


vim +/of_range_to_resource +2210 arch/arm/mach-omap2/omap_hwmod.c

  2183	
  2184	/**
  2185	 * omap_hwmod_parse_module_range - map module IO range from device tree
  2186	 * @oh: struct omap_hwmod *
  2187	 * @np: struct device_node *
  2188	 *
  2189	 * Parse the device tree range an interconnect target module provides
  2190	 * for it's child device IP blocks. This way we can support the old
  2191	 * "ti,hwmods" property with just dts data without a need for platform
  2192	 * data for IO resources. And we don't need all the child IP device
  2193	 * nodes available in the dts.
  2194	 */
  2195	int omap_hwmod_parse_module_range(struct omap_hwmod *oh,
  2196					  struct device_node *np,
  2197					  struct resource *res)
  2198	{
  2199		struct property *prop;
  2200		const char *name;
  2201		int err;
  2202	
  2203		of_property_for_each_string(np, "compatible", prop, name)
  2204			if (!strncmp("ti,sysc-", name, 8))
  2205				break;
  2206	
  2207		if (!name)
  2208			return -ENOENT;
  2209	
> 2210		err = of_range_to_resource(np, 0, &res);
  2211		if (err)
  2212			return err;
  2213	
  2214		pr_debug("omap_hwmod: %s %pOFn at %pR\n",
  2215			 oh->name, np, &res);
  2216	
  2217		if (oh && oh->mpu_rt_idx) {
  2218			omap_hwmod_fix_mpu_rt_idx(oh, np, res);
  2219	
  2220			return 0;
  2221		}
  2222	
  2223		return 0;
  2224	}
  2225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
