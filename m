Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427DA3DEAEC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 20:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774297572; cv=none; b=J/pItI4KJBf0Y2FxvOa0/ks5pKlzSCKMj5DY0eBW0+QwKoyeerfafUzGAtbm1ukzP73CQwt4vY4IKcKSv92ODy9IxyFSJ9Orv1sspFtUnbTIfWTXVbPeXPGNnlbCsofAIvfua/tSYZO3XE34BJSwwf+BYpMspNYcd1AEhpsE6mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774297572; c=relaxed/simple;
	bh=cRF0pObMmJa1HumcDoDw2CCpirIujXTJ+seW8hSxrLs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B/yvEUNK4znRI5ISnQb1J2zO4q05MyyQioA1ET7w6wL/d+BJ+YjPKKLMfDfWANPgsaqYRRSC3uH2zPh16rPdQnpUuwvl6QPAuFSfAzT9bcV/c7ZXhyrC2pfhs7erXZRmS+pIWGIRg2Qx8YhbRYn7qcyT/WwApvs5Do4ZnGF/fws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h4lBJ33x; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4lBJ33x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774297569; x=1805833569;
  h=date:from:to:cc:subject:message-id;
  bh=cRF0pObMmJa1HumcDoDw2CCpirIujXTJ+seW8hSxrLs=;
  b=h4lBJ33xNHxTWrykbyvMY0xTWlTnV3c0NA249gKv0WVJKfIu21/p31C5
   MNaacqD7oZ5dHuKGrp/Oc1qBxVxEj+NdLSnbUctG7L8/RMX0mrepV/zn7
   L5/HN+RBboUEbuER2azvh5/+0LZFPl1byXRb5D0T3jIYin5hyEtnyrVvx
   p+/5VIWmUBe3ivCSfMFpr6prbNWKMp9LcSPW7Iu6SqRxVsOq8RkBWSGuc
   uVB15XvlomKnsWTi6nz8nIMcxVRXl0CC5OheUdYSWGHkjd/BtqmFhVhBf
   hliT6WLl/+yjVcfkLYDYsa+MNvQNtnOnKYBuK5JtsLzXrbYQ8gvdmXrZ8
   g==;
X-CSE-ConnectionGUID: nVlnkbJETBWqnhQkb+5FRw==
X-CSE-MsgGUID: 2DMAelGhTwOemELtBRG5bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="100758134"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="100758134"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 13:26:09 -0700
X-CSE-ConnectionGUID: 1y00Y+BCR7yaMFiMU4PaLA==
X-CSE-MsgGUID: QUVtGv1GTZSj772kMMGI7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="224109566"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Mar 2026 13:25:57 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4lqU-000000003BH-1kjp;
	Mon, 23 Mar 2026 20:25:54 +0000
Date: Tue, 24 Mar 2026 04:24:54 +0800
From: kernel test robot <lkp@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: hppa-linux-ld: drivers/gpu/drm/xe/xe_module.o:undefined
 reference to `xe_configfs_init'
Message-ID: <202603240400.q3ryaiFZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: 16280ded45fba1216d1d4c6acfc20c2d5b45ef50 drm/xe: Add configfs to enable survivability mode
date:   12 months ago
config: parisc-randconfig-r051-20260323 (https://download.01.org/0day-ci/archive/20260324/202603240400.q3ryaiFZ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240400.q3ryaiFZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240400.q3ryaiFZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> hppa-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x8): undefined reference to `xe_configfs_init'
>> hppa-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0xc): undefined reference to `xe_configfs_exit'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
