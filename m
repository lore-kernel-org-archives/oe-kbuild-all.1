Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA50481670
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 12:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910668; cv=none; b=GBcJHPqaqNn7+oa4Elbzt+EhuF8K/sKUJg9iXKOkst4yw7YlqrNiUwCIvpFZOWbFtDmWcUSWXAPWoycGfGuVZeT7bCGJyoRm2sqkcys8iGpPLrlQAPdQE3zZJJ+S3wnwVukRlYp2dhRZIN3Rhc+T8LZiintElCIgBiNmhseCQn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910668; c=relaxed/simple;
	bh=e9wp3nYATKNjtaOSnq7irT80h1a7ri+QFzpRIwm7yvc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WhJxQmyV3lVUaHkSaeq0S36lwtibEO0sDwVXRuGc+aEaV/SCcp9Pxisi3jhjwycS8LVTvLp0B87GdBtvcFtYSwLJ9OV1FTwVlh+GFo74M0ARDFWCOJYN5w1yBBcE1MMQ+A0TuHXm5KS2ts67N0MBZKFN50viFJ7b3orbgo6jA98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvwwqvd/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvwwqvd/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782910668; x=1814446668;
  h=date:from:to:cc:subject:message-id;
  bh=e9wp3nYATKNjtaOSnq7irT80h1a7ri+QFzpRIwm7yvc=;
  b=mvwwqvd/Z38l2AaNcmPkF5XbrO7dnQkOjR+Bm46LFa2REiiXjEYl/m0w
   FoiUNmflWloTi+dwy+5lkximQqef3yaWiloA5zm74eH0QoBHkUQDgkNrD
   A0TdoZn+RNmvRACa3eff/8FivMM9fhjdXnNqaaxS9ppYrpi/2jBGvpw38
   aCl94jqCsiIum0p5kUj0ixgoExZT5QLv8eVIxbc387JjsvBJ8+z1893O4
   w0L0A4UFwpObfjKYwYYB9sDlinMn629WTqYnmodAl3qJWa1ZWA8e+IONe
   v1/mqrRb0MuFCS797VB8gdj7zYghE1tqdoWwPmdpN7EyU2j7yhq7Q95Nh
   Q==;
X-CSE-ConnectionGUID: RAcTPBnQQPuYzzWSK+84EA==
X-CSE-MsgGUID: LIHkZXDDQaqeBvgXTI/IPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="82759566"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="82759566"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:57:47 -0700
X-CSE-ConnectionGUID: Ul66bAPxSJ2RchkOw0AdCw==
X-CSE-MsgGUID: n7oLmI9eRbWoJRA7aBl2Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="248585146"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jul 2026 05:57:45 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weuVb-000000000mf-3uJ4;
	Wed, 01 Jul 2026 12:57:43 +0000
Date: Wed, 01 Jul 2026 14:57:26 +0200
From: kernel test robot <lkp@intel.com>
To: Srirangan Madhavan <smadhavan@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ERROR: modpost: "cxl_rcrb_to_aer"
 [drivers/cxl/core/cxl_core.ko] undefined!
Message-ID: <202607011439.7xx4Hj6u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Srirangan-Madhavan/cxl-Split-decoder-programming-into-a-reusable-helper/20260623-113059
head:   a33e29e7f1bcc0176e95f74c4001eb46be72b2dd
commit: 9084692f0bd67e91d5223de8797a04dcca56c37b cxl: Cache endpoint decoder settings during PCI enumeration
date:   8 days ago
config: x86_64-rhel-9.4-func (https://download.01.org/0day-ci/archive/20260701/202607011439.7xx4Hj6u-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607011439.7xx4Hj6u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607011439.7xx4Hj6u-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "cxl_rcrb_to_aer" [drivers/cxl/core/cxl_core.ko] undefined!
>> ERROR: modpost: "cxl_rcd_component_reg_phys" [drivers/cxl/core/cxl_core.ko] undefined!
>> ERROR: modpost: "devm_cxl_iomap_block" [drivers/cxl/core/cxl_core.ko] undefined!
>> ERROR: modpost: "__rcrb_to_component" [drivers/cxl/core/cxl_core.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
