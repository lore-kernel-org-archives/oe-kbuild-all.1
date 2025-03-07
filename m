Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F4A215197
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 11:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741346763; cv=none; b=sHswBl9wV9UGTSIIO5nCvx4n6aBfvOKZNyEpKVD0OZUFCcctYd9Rkuz16tSwtwogrU2xi5+PpGBL5LtoQilP71BlzBQt9vG8OL+OG4cbYQRhLuHrd4DomBdtCvI3jDU+IYypwKJbQ6HWSS28ji58XMqofZKtTIRI2bQRUBHunGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741346763; c=relaxed/simple;
	bh=3WpvT+GW4J2wks6v0DSytO1ZXVUPHUh0ouyCkpRR5zc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GpNbcAdWD1fIaDLv46ODINTr6yrhXlI0Ko7gnLn7oHfkSRrZdLRlNLbVHwwH0zgxcpgDkNVXKEtWxt16RnOjc2MzXraJ+W7NUKQ5sVsKNqPlSEplhXxjzyEK+UyRFN57c2HLn1/e8TRAAzGYHJivTs566eX3ghwGlnQVJ64kIxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jjea5sde; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jjea5sde"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741346761; x=1772882761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3WpvT+GW4J2wks6v0DSytO1ZXVUPHUh0ouyCkpRR5zc=;
  b=Jjea5sdeC9wLXlyDhKJ4bQlKUwLdKPHx/3n3gNPJ0sC0Ke9DBjpEQtPP
   k0iurQHCzYCYg2EndAm9dVcnDM3+hDt0bhSoUIVa2QG8WPDH7Y4ZaQXrn
   87kIeVBOGRlabChrgRcjRtukl3VRVuqOmirXk26dhFbhjHKPlBJR54Q0E
   i2DqjkR9e/ToXhyBDuTrWYCDun4gsj7thVbASwdJ0NJEF5SDCIJDEPhXQ
   SV5oy5t9JJUl1lUqPsH0PJ8wcITVGqq8QJnw6w6MIblSSvL+FDEFSCrUx
   pqtOnW3tNYLUuEkXeBXtm85MVRjSSkFTEuqvk7w/gVlwvohbnR60SlgQ6
   w==;
X-CSE-ConnectionGUID: K526Az5wSIOKGGvfUICFdw==
X-CSE-MsgGUID: 3SSBd8PkRqCv9LNI2hHb0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46169190"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="46169190"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:26:00 -0800
X-CSE-ConnectionGUID: tNH6YjEvQt25MgD9WG6gEQ==
X-CSE-MsgGUID: afqflv5OTnKjNxV/Es7Rfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119225550"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 07 Mar 2025 03:25:59 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqVq0-0000N5-1t;
	Fri, 07 Mar 2025 11:25:56 +0000
Date: Fri, 7 Mar 2025 19:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Oak Zeng <oak.zeng@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: [drm-xe:drm-xe-next 20/32] xe_migrate.c:undefined reference to
 `__udivdi3'
Message-ID: <202503072137.G8mqBGo5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   8e8d76f62329127b31c64a034b052fb9e30e92af
commit: 9c44fd5f6e8aa1ed944f085926044fcbf797206c [20/32] drm/xe: Add migrate layer functions for SVM support
config: powerpc-randconfig-001-20250307 (https://download.01.org/0day-ci/archive/20250307/202503072137.G8mqBGo5-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503072137.G8mqBGo5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503072137.G8mqBGo5-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/gpu/drm/xe/xe_migrate.o: in function `xe_migrate_vram':
>> xe_migrate.c:(.text+0x235c): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
