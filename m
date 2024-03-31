Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A95D1C33
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 04:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711858701; cv=none; b=bCIJV3V+B9gWhur15lMFb/Br+CO0/0gcvT6oAR9l4tq15KBA94cGefcPFjZ1ObnQoXE7nPwnl2BZXJrruvr6qwGQgoy7kAsSgZUEHMYBKAaB5PwVgZOF3r4QgTOAh+m3CDUz1V7HtLFR9e3bLtAn7iWwf5lHcMjlZf2IbQG61IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711858701; c=relaxed/simple;
	bh=W15qf4iTQBxPyKh2e+H77svNHY/b9nK+TnNYDADBGbI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bNSQ8E7ziNJWBbryMyiyJ6kR2t+u1YNPTSJEA9LUTWppyJ7zb+zKNd9esBmytobAEV4MxFLT1DCQcQoNWUZGM/L/jS3XMICwPC27AYtBObw1WxQBo9J6XYCLFvIJ2qv95K++fmudazGzRbR40MLu4IxowEiaYThS1nO5i5K32RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLgU8F1r; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLgU8F1r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711858700; x=1743394700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W15qf4iTQBxPyKh2e+H77svNHY/b9nK+TnNYDADBGbI=;
  b=dLgU8F1rdgDK07dhWQlzUTpXA7ROhd1iSq+d95mJGk78dj290+n7croL
   rT42E8ig2b4hhP0SDMbr+TUFEmzRznY/xfcE2JVTw94ZNCpanDT3wz2XJ
   I2Zao+gu+w2tYDsLLcJyzgTa5Z7Y/tzfs2J/WOCFuiY1/i/Szdp+xStN8
   ppAFeluWWP6+NmQLOi6/vtLkN9BjHWsWaTItTadZMNTOHqNCSOxEhYV8u
   zs8+3uUIgM5bNbrtle96Yazr3HMhq4nCtNuknUuQN1mRWhj6sfyewD7Me
   HTkkmdgYGkWNSXqvYC5GZ/uuMLD8eAVfiA0c2677avGzV92j9ZFh9M8m1
   A==;
X-CSE-ConnectionGUID: FxvaqjHMTqK0O8U3IrjZpQ==
X-CSE-MsgGUID: b8cD9VP3QzqMq+Ertr1u9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="29483434"
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="29483434"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 21:18:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="17339085"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Mar 2024 21:18:15 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqme4-0000n6-2q;
	Sun, 31 Mar 2024 04:18:12 +0000
Date: Sun, 31 Mar 2024 12:17:58 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [conor:riscv-soc-fixes 1/1] drivers/cache/sifive_ccache.c:293:23:
 warning: variable 'quirks' set but not used
Message-ID: <202403311253.Z4NvIBxI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git riscv-soc-fixes
head:   c90847bcbfb65d0f1c48fcc73a2b3a2d4ceac6a1
commit: c90847bcbfb65d0f1c48fcc73a2b3a2d4ceac6a1 [1/1] cache: sifive_ccache: Partially convert to a platform driver
config: riscv-randconfig-001-20240331 (https://download.01.org/0day-ci/archive/20240331/202403311253.Z4NvIBxI-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403311253.Z4NvIBxI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403311253.Z4NvIBxI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cache/sifive_ccache.c: In function 'sifive_ccache_init':
>> drivers/cache/sifive_ccache.c:293:23: warning: variable 'quirks' set but not used [-Wunused-but-set-variable]
     293 |         unsigned long quirks;
         |                       ^~~~~~


vim +/quirks +293 drivers/cache/sifive_ccache.c

c90847bcbfb65d drivers/cache/sifive_ccache.c      Samuel Holland       2024-03-26  287  
ca120a79cf5a33 drivers/soc/sifive/sifive_ccache.c Greentime Hu         2022-09-13  288  static int __init sifive_ccache_init(void)
ca120a79cf5a33 drivers/soc/sifive/sifive_ccache.c Greentime Hu         2022-09-13  289  {
ca120a79cf5a33 drivers/soc/sifive/sifive_ccache.c Greentime Hu         2022-09-13  290  	struct device_node *np;
ca120a79cf5a33 drivers/soc/sifive/sifive_ccache.c Greentime Hu         2022-09-13  291  	struct resource res;
0d5701dc9cd653 drivers/cache/sifive_ccache.c      Emil Renner Berthing 2023-10-31  292  	const struct of_device_id *match;
0d5701dc9cd653 drivers/cache/sifive_ccache.c      Emil Renner Berthing 2023-10-31 @293  	unsigned long quirks;
c90847bcbfb65d drivers/cache/sifive_ccache.c      Samuel Holland       2024-03-26  294  	int rc;
ca120a79cf5a33 drivers/soc/sifive/sifive_ccache.c Greentime Hu         2022-09-13  295  
0d5701dc9cd653 drivers/cache/sifive_ccache.c      Emil Renner Berthing 2023-10-31  296  	np = of_find_matching_node_and_match(NULL, sifive_ccache_ids, &match);
ca120a79cf5a33 drivers/soc/sifive/sifive_ccache.c Greentime Hu         2022-09-13  297  	if (!np)
ca120a79cf5a33 drivers/soc/sifive/sifive_ccache.c Greentime Hu         2022-09-13  298  		return -ENODEV;
ca120a79cf5a33 drivers/soc/sifive/sifive_ccache.c Greentime Hu         2022-09-13  299  
0d5701dc9cd653 drivers/cache/sifive_ccache.c      Emil Renner Berthing 2023-10-31  300  	quirks = (uintptr_t)match->data;
0d5701dc9cd653 drivers/cache/sifive_ccache.c      Emil Renner Berthing 2023-10-31  301  
8fbf94fea0b4e1 drivers/soc/sifive/sifive_ccache.c Yang Yingliang       2022-10-18  302  	if (of_address_to_resource(np, 0, &res)) {
8fbf94fea0b4e1 drivers/soc/sifive/sifive_ccache.c Yang Yingliang       2022-10-18  303  		rc = -ENODEV;
8fbf94fea0b4e1 drivers/soc/sifive/sifive_ccache.c Yang Yingliang       2022-10-18  304  		goto err_node_put;
8fbf94fea0b4e1 drivers/soc/sifive/sifive_ccache.c Yang Yingliang       2022-10-18  305  	}
ca120a79cf5a33 drivers/soc/sifive/sifive_ccache.c Greentime Hu         2022-09-13  306  
ca120a79cf5a33 drivers/soc/sifive/sifive_ccache.c Greentime Hu         2022-09-13  307  	ccache_base = ioremap(res.start, resource_size(&res));
8fbf94fea0b4e1 drivers/soc/sifive/sifive_ccache.c Yang Yingliang       2022-10-18  308  	if (!ccache_base) {
8fbf94fea0b4e1 drivers/soc/sifive/sifive_ccache.c Yang Yingliang       2022-10-18  309  		rc = -ENOMEM;
8fbf94fea0b4e1 drivers/soc/sifive/sifive_ccache.c Yang Yingliang       2022-10-18  310  		goto err_node_put;
8fbf94fea0b4e1 drivers/soc/sifive/sifive_ccache.c Yang Yingliang       2022-10-18  311  	}
ca120a79cf5a33 drivers/soc/sifive/sifive_ccache.c Greentime Hu         2022-09-13  312  
73e770f085023d drivers/soc/sifive/sifive_ccache.c Yang Yingliang       2022-10-18  313  	if (of_property_read_u32(np, "cache-level", &level)) {
73e770f085023d drivers/soc/sifive/sifive_ccache.c Yang Yingliang       2022-10-18  314  		rc = -ENOENT;
73e770f085023d drivers/soc/sifive/sifive_ccache.c Yang Yingliang       2022-10-18  315  		goto err_unmap;
73e770f085023d drivers/soc/sifive/sifive_ccache.c Yang Yingliang       2022-10-18  316  	}
95f196f3212bbc drivers/soc/sifive/sifive_ccache.c Zong Li              2022-09-13  317  

:::::: The code at line 293 was first introduced by commit
:::::: 0d5701dc9cd653ae757cc06e39b3a39272863395 soc: sifive: ccache: Add StarFive JH7100 support

:::::: TO: Emil Renner Berthing <kernel@esmil.dk>
:::::: CC: Conor Dooley <conor.dooley@microchip.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
