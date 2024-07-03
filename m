Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7426D15D5B3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 12:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720008039; cv=none; b=sL3pbjehl90Uut92CCN0ehNaykpOUUUhtLUY3ud63GeHX7ra9sF9fGZIik5dly/H7aroIhGZPXXBkqornsrTQei8aeRp/XmjdlsTveG64z//R93cS+zUgie+8fsWO/q8M1Yo4HVkw++nqOga+aCuBPvuYxw8JddkAXctL318UYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720008039; c=relaxed/simple;
	bh=0/GpgWaW3GMGpaJ7kScaOWkgVWNYTJCWJZu96UvetBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k9hrbIJq+UYcWPj2e80jvM8/8b+Klld/L1VCelbaO2wZ3FMAVlG6r754bStlD/imxeRBsEvxfiN++btYzQ0lIjrGtQx1EyKpEfgvktH3CRc+3sqafSt1TlBl7mMBmwakP1070H3l8WVFfCQTckGGr3sbUdHLNv4kwekzbNSFgYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ayAPn2Nd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ayAPn2Nd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720008038; x=1751544038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0/GpgWaW3GMGpaJ7kScaOWkgVWNYTJCWJZu96UvetBY=;
  b=ayAPn2NdHWCaXMt5ozqQVKKJWsKZq9hHvkakWP6BuSErpc1qCrRCtAXJ
   3P86gNrXcTu0iZZME7O1Tytt9hhK0fP7mknXfrMJO0GdxH+FjcnHtFNu5
   jjptuhMvsDa0m5dXR4NSVxYqwV8graSSb+dCUOX9dbFMEfN/fzmrCBd8Z
   pZKkCfJcgSttn5IAFrEwLJiL4hbqdZUbruWu02YTbTZtLdVf4OMiVI+au
   27OWxNA7/YLrGRM56vQ8A73TxAGm1NsqfTpPj94KlOELdw21censUokTy
   w+gAPa1AlDm8Pw2TFncyL5KCyqGFS4fFGkaKzHCGMwOVh1TBAzKJWpS+F
   A==;
X-CSE-ConnectionGUID: 8Y85f83dRrugnxe/P/f6eg==
X-CSE-MsgGUID: FWYDQhFSQxqtLavteg3wxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="16954715"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="16954715"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 05:00:37 -0700
X-CSE-ConnectionGUID: ccgeiztjTjydLIzaLEyHfQ==
X-CSE-MsgGUID: wAoQtBqJRrOG9dBYiCP4Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="46244798"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jul 2024 05:00:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOyf3-000Pgc-2c;
	Wed, 03 Jul 2024 12:00:33 +0000
Date: Wed, 3 Jul 2024 20:00:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 216/296] ld:
 fs/xfs/scrub/metapath.c:131:undefined reference to `xfs_rtinode_create_path'
Message-ID: <202407031933.ZWURjGV6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   cdef340b918b477040a1837334c73ee13d833ce4
commit: 96a6303e91a9a1b0a4a3dbc644bee36324e75795 [216/296] xfs: scrub the metadir path of rt refcount btree files
config: x86_64-randconfig-011-20240703 (https://download.01.org/0day-ci/archive/20240703/202407031933.ZWURjGV6-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407031933.ZWURjGV6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407031933.ZWURjGV6-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/xfs/scrub/metapath.o: in function `xchk_setup_metapath':
   fs/xfs/scrub/metapath.c:142:(.text+0x9b6): undefined reference to `xfs_rtinode_create_path'
>> ld: fs/xfs/scrub/metapath.c:131:(.text+0xa2d): undefined reference to `xfs_rtinode_create_path'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
