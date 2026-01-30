Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4215F313558
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 07:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769758903; cv=none; b=C4LAsYhGEqHrzXSH3N5t5JRTgPCZ9Rn4eXika1wRPabVfHKXNnTirmYu82K8+9laXNA/xZbc8bVjkWgmqQphTh50bC5eKSSRbRVWfITLfkUpLkqoVOSx+qw+uMPZUhBpR5UnygcSq7cxl53yeh8phLC1yIbhxtOKqgoQ1p/ZjLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769758903; c=relaxed/simple;
	bh=zQtagessPPGz+h06OX8wmLWGWDROvS/ANeCfF//YDt0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cEAJjzjGDkTBbrQhbXEnYRLOaBLfXQu7NmLA7haJ3HkY/RBFUkp5mkJcNdHDZGHv0R9viIOlqjN9kljK8wQHhBraGp7c6fgKti22Fi3weOO5bRJDt4iFj2SXsM5I2wOyQmRwBSWPYy3C34GGLrgeAzFGULfdBGurTNSeWs/apo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OsSXC4EF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OsSXC4EF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769758901; x=1801294901;
  h=date:from:to:cc:subject:message-id;
  bh=zQtagessPPGz+h06OX8wmLWGWDROvS/ANeCfF//YDt0=;
  b=OsSXC4EFyi7EeS4fnDW/VLoujjZ0zanFO9A0HsO6GanDke/5fjuLwNb3
   UWaKN2XPJDHHknoZh5v0gcQOsz9OcDvzdFdqeH5HErLxl/gniDYlnzRKR
   T7/Z/532/f7ScBM50/lhqtjgWe5WfLfWXW4JLf6GDN8yyu0AdMA0xIFzU
   vaZ29JzPX62N/QidphKovlXaCylGjaG/ytCnnoET33i+Jcq6WALJD6EVf
   YNA/yRF5+vGcM+2tHhfvlK7sp/dixahD/y2POvEpMA7RB9Jyv42kxxE5i
   /TfSF9WXvLeJpZDaqBvtePOxXQItcTojOlNmRZ7YAXsgqf9R4d6D43noK
   Q==;
X-CSE-ConnectionGUID: LRC3Fad2SBqEBdeadP0DXg==
X-CSE-MsgGUID: Upf7dpkORUCXoeKkLz8P0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81323414"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="81323414"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 23:41:41 -0800
X-CSE-ConnectionGUID: a+t96H2dQJWm2ruAH7yqMQ==
X-CSE-MsgGUID: fJtAJ0HTQNuIfbwrl3pjGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="209046125"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Jan 2026 23:41:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlj8L-00000000cKq-1gMf;
	Fri, 30 Jan 2026 07:41:37 +0000
Date: Fri, 30 Jan 2026 15:40:43 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/cxl/region_rework_v3 3/9]
 drivers/dax/bus.c:399:19: error: implicit declaration of function
 'mhp_get_default_online_type'
Message-ID: <202601301530.CNT0dhHt-lkp@intel.com>
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
config: arc-randconfig-r072-20260130 (https://download.01.org/0day-ci/archive/20260130/202601301530.CNT0dhHt-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301530.CNT0dhHt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601301530.CNT0dhHt-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/dax/bus.c: In function 'create_store':
>> drivers/dax/bus.c:399:19: error: implicit declaration of function 'mhp_get_default_online_type' [-Werror=implicit-function-declaration]
       .online_type = mhp_get_default_online_type(),
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


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
