Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5362DC359
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 14:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768400815; cv=none; b=PVaM4JzVHFnzLxSy5BynKE3RzK9dbtGNZyvPAubfeEqCG1MVE3Yh+tP9NM3oibPZRENSNj1G5KbsIlBu6b3EYMH03AOEc6+Hel9l4l81Rf1FH2BYKroihMYQ5WH2sQbaxfR3Lq0+GW1LR07ewNqFg+ZRPAddXRMb9A9+fmNZqIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768400815; c=relaxed/simple;
	bh=V6xft2JUgHLr73IlGFHLP184X9XN157DVutLC/nmJpk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZAqFmkT80qo2sk8QkhRbU5TYkVJIp2UlM8jph8Bo/zqghHp+DaBsDmfhWLEfDFeVd46WObZ65fozTs44585jDYEnHpGney3ewDR+ZYKZj+gh2R8gxeCMcPE2bqe1Fk1u70y3Jka88ARiX7JVFB2IjfLiCAhYehLumAi0hJgZdOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fh5NIJKh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fh5NIJKh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768400814; x=1799936814;
  h=date:from:to:cc:subject:message-id;
  bh=V6xft2JUgHLr73IlGFHLP184X9XN157DVutLC/nmJpk=;
  b=Fh5NIJKhee3XUTF4Nmgr10FIA+ewpBQ4QCXsGsDH0r28m6b1a41iADIU
   FgwttKxiryAoyKmj2Oc0i+ckG7q5b2xsYbFWhX4J2mOGZ72AgoHzYq4xV
   xEksvz2yjLxLLReUURUWNLNLy3JszgsdXb+Zuwb08hsTFvbptDW0NV43M
   fNgaQJLTPMxN2iL8ajAMVhaTYFHi+3Tc9IMVwP73WyBWVKiTA/FZmiswQ
   y/J1oFsO5kzvnSN2xDWpykatbSW3IhEpA4/SvC7qqAF2lxYxcg3TPwNMV
   2IemBYE0xiUuZv1foTe/XYeKjP5gDpQfFURYYwUim9vLuHHAeVY/dCZix
   A==;
X-CSE-ConnectionGUID: 5RtetdOrTMyK1RCP0lvYJQ==
X-CSE-MsgGUID: 23mpU7v6QImp14QMGUuD1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73539549"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="73539549"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 06:26:51 -0800
X-CSE-ConnectionGUID: IQX7PepgRGKGNX80cDQJ7Q==
X-CSE-MsgGUID: zZsTpZvQSceb8avnDUAbVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="209736230"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Jan 2026 06:26:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg1pf-00000000GUi-0rME;
	Wed, 14 Jan 2026 14:26:47 +0000
Date: Wed, 14 Jan 2026 22:26:09 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/cxl/dax_hotplug/v1 6/8]
 drivers/dax/kmem.c:239:17: error: implicit declaration of function
 'offline_memory'
Message-ID: <202601142217.ls7RiwWM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Gregory,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/gourryinverse/linux scratch/gourry/cxl/dax_hotplug/v1
head:   22fae3f95d9ba4a7851533f500d7609e34bab29b
commit: 56dd024c0a3d9ce32b5ea8fd6d4dc52ab80093b7 [6/8] dax/kmem: add online/offline helper functions
config: x86_64-randconfig-r072-20260114 (https://download.01.org/0day-ci/archive/20260114/202601142217.ls7RiwWM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601142217.ls7RiwWM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601142217.ls7RiwWM-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/dax/kmem.c: In function 'dax_kmem_do_online':
>> drivers/dax/kmem.c:239:17: error: implicit declaration of function 'offline_memory' [-Wimplicit-function-declaration]
     239 |                 offline_memory(range.start, range_len(&range));
         |                 ^~~~~~~~~~~~~~
   drivers/dax/kmem.c: At top level:
   drivers/dax/kmem.c:254:12: warning: 'dax_kmem_do_offline' defined but not used [-Wunused-function]
     254 | static int dax_kmem_do_offline(struct dev_dax *dev_dax,
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/dax/kmem.c:204:12: warning: 'dax_kmem_do_online' defined but not used [-Wunused-function]
     204 | static int dax_kmem_do_online(struct dev_dax *dev_dax,
         |            ^~~~~~~~~~~~~~~~~~


vim +/offline_memory +239 drivers/dax/kmem.c

   192	
   193	/**
   194	 * dax_kmem_do_online - online memory blocks for dax kmem device
   195	 * @dev_dax: the dev_dax instance
   196	 * @data: the dax_kmem_data structure with resource tracking
   197	 * @online_type: MMOP_ONLINE or MMOP_ONLINE_MOVABLE
   198	 *
   199	 * Onlines all ranges in the dev_dax region with the specified online type.
   200	 * On partial failure, previously onlined ranges are rolled back to offline.
   201	 *
   202	 * Returns 0 on success, negative error code on failure.
   203	 */
   204	static int dax_kmem_do_online(struct dev_dax *dev_dax,
   205				      struct dax_kmem_data *data, int online_type)
   206	{
   207		int i, j, rc;
   208	
   209		for (i = 0; i < dev_dax->nr_range; i++) {
   210			struct range range;
   211	
   212			rc = dax_kmem_range(dev_dax, i, &range);
   213			if (rc)
   214				continue;
   215	
   216			if (!data->res[i])
   217				continue;
   218	
   219			rc = online_memory_range(range.start, range_len(&range),
   220						 online_type);
   221			if (rc)
   222				goto rollback;
   223		}
   224	
   225		return 0;
   226	
   227	rollback:
   228		/* Rollback previously onlined ranges */
   229		for (j = 0; j < i; j++) {
   230			struct range range;
   231	
   232			if (dax_kmem_range(dev_dax, j, &range))
   233				continue;
   234	
   235			if (!data->res[j])
   236				continue;
   237	
   238			/* Best effort rollback - ignore failures */
 > 239			offline_memory(range.start, range_len(&range));
   240		}
   241		return rc;
   242	}
   243	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
