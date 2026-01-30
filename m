Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097101DED4C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 05:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769752355; cv=none; b=bYvuPNJzU/W+1QW3HBU4r+x4vLNlbwNFTi+f6l1KtNoRkKH2Gyc5wwzvrDiyGfblC88uJ/lslBcjNnaUleh3wRCp9GSSLqdnSOAGd2VjClV6Usr5KbHKQgFbqlXTpoYXxTBIJsAU1gPbiPagmP0KiBXR/YNJG8Gl50SoXBdVRJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769752355; c=relaxed/simple;
	bh=cIh/ntk2Q3qhH8AlW4i/zTgtTi6ezv0YKCStozyzo1U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hilG0ft9dtGLNwstxYYprxmGrQhtPZAlh1aqLdB5oLak81cKMysfq4S7MzOKbbJbiIGD6mICk2VSeqrBwGqRV2nGGMMCseGwpgI/bT9dUBOgQfDmSVO5Ra+1ggfSOeJ5/MrGeKE1aj0Zrk3rgV/Wj64D3+BdwvGGasu0/TikbqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oJpBggrl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJpBggrl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769752354; x=1801288354;
  h=date:from:to:cc:subject:message-id;
  bh=cIh/ntk2Q3qhH8AlW4i/zTgtTi6ezv0YKCStozyzo1U=;
  b=oJpBggrldyVWHFWDIpA5DgqLSSLX37OtUIN8WDXMlJpKeBe1OMkGnr3B
   wWF8mP7Xr1DgvS7cr08tN9T8sJk35kyympycweGf9pzq8bnFYWV8e4QmH
   1qfYK0IcKI9XJmDoS8bPUdeIy3r2KArcHdsUYcd/HrDXFMPvTlpE3W66e
   SLq2LdMXgac5P0b1ztZg6zHEYoBPcqljqFuwOcqeNFT7AyXQkye2nVr6z
   1PL3YERjUvwwS6ozdnKky5DNU/BhxkAWXjeMQ40klExAP28z1fD1Wuuyr
   daVK66YHMj50Be9hJ07HnUQctHIttkaFhv6f7pvHUeRhUXHnJZHbfz6PD
   w==;
X-CSE-ConnectionGUID: vGLIfHGJQYW08inoLsrhYQ==
X-CSE-MsgGUID: BT2uhE+0S5Gp4QP2Qj2X7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70718651"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="70718651"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 21:52:34 -0800
X-CSE-ConnectionGUID: 2XzuuYowQOaWtpw/H+aoag==
X-CSE-MsgGUID: X++FjoRfSbmhN58jWE4SOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="209192311"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Jan 2026 21:52:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlhQj-00000000cEY-3KD9;
	Fri, 30 Jan 2026 05:52:29 +0000
Date: Fri, 30 Jan 2026 13:51:39 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/cxl/region_rework_v3 3/9]
 drivers/dax/bus.c:399:19: error: call to undeclared function
 'mhp_get_default_online_type'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202601301322.lxdfxxrW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Gregory,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/gourryinverse/linux scratch/gourry/cxl/region_rework_v3
head:   ef956221cc52b1c29b05280fcec99686d744d6b4
commit: 1c62c9d9a74f19eadae9fe4d7a008a154e77cc7a [3/9] dax: plumb online_type from dax_kmem creators to hotplug
config: x86_64-randconfig-161-20260130 (https://download.01.org/0day-ci/archive/20260130/202601301322.lxdfxxrW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301322.lxdfxxrW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601301322.lxdfxxrW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dax/bus.c:399:19: error: call to undeclared function 'mhp_get_default_online_type'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     399 |                         .online_type = mhp_get_default_online_type(),
         |                                        ^
   1 error generated.


vim +/mhp_get_default_online_type +399 drivers/dax/bus.c

   369	
   370	static ssize_t create_store(struct device *dev, struct device_attribute *attr,
   371			const char *buf, size_t len)
   372	{
   373		struct dax_region *dax_region = dev_get_drvdata(dev);
   374		unsigned long long avail;
   375		ssize_t rc;
   376		int val;
   377	
   378		if (is_static(dax_region))
   379			return -EINVAL;
   380	
   381		rc = kstrtoint(buf, 0, &val);
   382		if (rc)
   383			return rc;
   384		if (val != 1)
   385			return -EINVAL;
   386	
   387		rc = down_write_killable(&dax_region_rwsem);
   388		if (rc)
   389			return rc;
   390		avail = dax_region_avail_size(dax_region);
   391		if (avail == 0)
   392			rc = -ENOSPC;
   393		else {
   394			struct dev_dax_data data = {
   395				.dax_region = dax_region,
   396				.size = 0,
   397				.id = -1,
   398				.memmap_on_memory = false,
 > 399				.online_type = mhp_get_default_online_type(),
   400			};
   401			struct dev_dax *dev_dax = __devm_create_dev_dax(&data);
   402	
   403			if (IS_ERR(dev_dax))
   404				rc = PTR_ERR(dev_dax);
   405			else {
   406				/*
   407				 * In support of crafting multiple new devices
   408				 * simultaneously multiple seeds can be created,
   409				 * but only the first one that has not been
   410				 * successfully bound is tracked as the region
   411				 * seed.
   412				 */
   413				if (!dax_region->seed)
   414					dax_region->seed = &dev_dax->dev;
   415				dax_region->youngest = &dev_dax->dev;
   416				rc = len;
   417			}
   418		}
   419		up_write(&dax_region_rwsem);
   420	
   421		return rc;
   422	}
   423	static DEVICE_ATTR_RW(create);
   424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
