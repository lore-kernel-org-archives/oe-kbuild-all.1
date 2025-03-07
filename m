Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2EE21ABC3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 14:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741358664; cv=none; b=l85BD3GC/yy4Qhl2UBcw5czQDbSNUVqI1Qx2I2WLK0fRx4iQhZaK1pqbJNvsltR5x5qRSv3XGuYTzrs1kRk4TfcQl7tGL1oFvIusZx3lRg3szlm2oWDbuLYHFaWAiwcRcBfpx8ojbzVoDRTVY3gFdYay9l4nsZFuMMz3L0lw8E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741358664; c=relaxed/simple;
	bh=II45YIHY5cVH+9FrsaIQXFYmYgUzXFlX7n51x45hM1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RO9uAPwWNPrDlrBJ/k8B1SVh4Bro6gToHPxycnHUF+u4VJqBOCDNqnjXs43Cxvjnhq1EcdeKJyh4ohOXszwY2tP5FqwMuz9AuSN6+2FtGtmcLdOwPmCzpcQ9AItKW6pzcCo9shqZgQ+TQ4AK1+zK2qY+P2HncJelfhFDgyU4zMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hPela3un; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hPela3un"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741358663; x=1772894663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=II45YIHY5cVH+9FrsaIQXFYmYgUzXFlX7n51x45hM1w=;
  b=hPela3unRGhCOUoeyMIA4164vYuS3WoftrYtXlPX9hAOMtdxDvxDKh+/
   OPit56WC9UeyaYbkwgyhYBYsJF+Ns3+fYY8zTIO6POJ/2WCClgp1pgO9u
   ajnH6hxjZsU70Akz6IVR/eMWQdE9JDryxVRtSQIE97F7SbPcl9nkVgFOB
   Z9TF6FHL4OZPf+QH0pzjKPG3NehQntTpaKd4o4rDOKZDPpRiczAYfmllu
   LwDwlpBQAEO0SivpS9ArSCHJ6zbWXrfhI4A+vCsmb4EMB/GbsTLVj4Jni
   a2Zcc0gL7di1dAVgH0SeRnb968jNP1se5/LPzynVIvCmf8JKSNaCMTpqX
   g==;
X-CSE-ConnectionGUID: BZoqxAV7StGAvEkEjrWeyA==
X-CSE-MsgGUID: M3FFfdPbSBWaUrx+61JpFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53796820"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="53796820"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 06:44:23 -0800
X-CSE-ConnectionGUID: EWklOPoAScup/Oe7ligbGw==
X-CSE-MsgGUID: t/cSE9xSQ3mAbdilxDTRWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119867581"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 07 Mar 2025 06:44:21 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqYvr-0000aT-1b;
	Fri, 07 Mar 2025 14:44:13 +0000
Date: Fri, 7 Mar 2025 22:42:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Airlie <airlied@redhat.com>
Subject: [jfern:nova-core-experiments 181/411]
 drivers/gpu/drm/nouveau/nouveau_drm.c:483:1: warning: 'nouveau_driver'
 defined but not used
Message-ID: <202503072247.CJUOm1QI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-core-experiments
head:   3b93174b3502247b0c46bd54a7cf5f4105274edb
commit: 6af34248e0ae20561d9ec4986c158fa548fbf1f5 [181/411] drm/nouveau/nvif: add nvif_driver_func for nvkm->drm callbacks
config: csky-randconfig-002-20250307 (https://download.01.org/0day-ci/archive/20250307/202503072247.CJUOm1QI-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503072247.CJUOm1QI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503072247.CJUOm1QI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nouveau_drm.c:483:1: warning: 'nouveau_driver' defined but not used [-Wunused-const-variable=]
     483 | nouveau_driver = {
         | ^~~~~~~~~~~~~~


vim +/nouveau_driver +483 drivers/gpu/drm/nouveau/nouveau_drm.c

   481	
   482	static const struct nvif_driver_func
 > 483	nouveau_driver = {
   484		.event = nvif_event,
   485	};
   486	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
