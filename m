Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A1C1422D6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 06:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718950472; cv=none; b=Jx7q5I3NoQJAbsy/43tgdz8dordIqR7x6WmPJpf7bAO0joUdt9ggaUN4w44n/TEXs4Nr8tJnMMPGf+xiM6961IqeHucp5H8Cs+zqbzo+pRzmol4TU9Fg7+1uNW65oei8X7BfXjvz7ASuRYyGmDy6Dv+hWJzif+9ulIyr63NbRMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718950472; c=relaxed/simple;
	bh=XUogZ+0KzAF6srsP8iSp4pG8wF+DXoZN6K0+TCxPntI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ncLO6LRQWSchdmNMuBIONf0VSZ1UzGG5r4AMAIVOGZy13GkBZYOes5Zds8OhoDSJMiwCT1o4plpcKOono2UHflmxTxN4dsTyX2+fVD27kK2npibOQOj38MEAx6rz0UiXSdcX0mLu1C7vxtqe7baPb3vafRGp6ySJrMmL2+VY0Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5zv/Llc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5zv/Llc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718950471; x=1750486471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XUogZ+0KzAF6srsP8iSp4pG8wF+DXoZN6K0+TCxPntI=;
  b=b5zv/Llc05UgGr/hXF7byugJTEbLp6k4usfTijpbEyNFDUfsL+N8ecSc
   P0fINHR5YegEBc+RfvkhnPOabZYp6hhv2/bdUb+xLloMtsPOi072uqjMM
   +bLmBMJjN40ZUcummIUu0NmQlfC+gBlUfZXd2RUo9VPu6K10O/mw+yYBW
   jOL0U4WaPUFr7lt5jE5qQwuDoQZ7rtsUAH/ZAcK7D0I64Yo0ZZrplfbsG
   QQYQFZgBYW6Le7MCDDVQyhrCICvq/xqSTQz7Wfhvp7VWeN3OtNI/shQWo
   +6y4qzFf/wFwAW3rJ/VeKZ3fVMfQ8zrr1XX4Z8ozuHQu7l4xL2kGmyfkt
   A==;
X-CSE-ConnectionGUID: Pkdb0QWCQhekhRRvMO4mZA==
X-CSE-MsgGUID: uTsp26FOS+maCb9BFRqVjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15946707"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="15946707"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 23:14:31 -0700
X-CSE-ConnectionGUID: IpYGBZ9/So2M8oRqxKSkJw==
X-CSE-MsgGUID: qLi+/Lz3SNOL6XbJD31JrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="42451164"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Jun 2024 23:14:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKXXW-0008Hu-37;
	Fri, 21 Jun 2024 06:14:26 +0000
Date: Fri, 21 Jun 2024 14:13:56 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:const_driver 3/10]
 arch/powerpc/platforms/pseries/vio.c:1582:58: sparse: sparse: incorrect type
 in argument 1 (different modifiers)
Message-ID: <202406211454.XbtJCp0g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git const_driver
head:   d5d1958dc29111bce74f9ddf7aec5803c308837e
commit: c75570c28cd80a9afb49f5081eed41288ad5d7bf [3/10] driver core: have match() callback in struct bus_type take a const *
config: powerpc64-randconfig-r113-20240621 (https://download.01.org/0day-ci/archive/20240621/202406211454.XbtJCp0g-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240621/202406211454.XbtJCp0g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406211454.XbtJCp0g-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/pseries/vio.c:1582:58: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct device_driver *drv @@     got struct device_driver const *drv @@
   arch/powerpc/platforms/pseries/vio.c:1582:58: sparse:     expected struct device_driver *drv
   arch/powerpc/platforms/pseries/vio.c:1582:58: sparse:     got struct device_driver const *drv

vim +1582 arch/powerpc/platforms/pseries/vio.c

  1578	
  1579	static int vio_bus_match(struct device *dev, const struct device_driver *drv)
  1580	{
  1581		const struct vio_dev *vio_dev = to_vio_dev(dev);
> 1582		const struct vio_driver *vio_drv = to_vio_driver(drv);
  1583		const struct vio_device_id *ids = vio_drv->id_table;
  1584	
  1585		return (ids != NULL) && (vio_match_device(ids, vio_dev) != NULL);
  1586	}
  1587	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
