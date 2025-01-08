Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021D81F2C50
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343206; cv=none; b=pnxLW1DYAzBPqPsQEOyTbJT2oqhOSjm6p+dWT+ptY0oXL8DEmNaZxGZ/twbe+usQuBFGu9HFqsCnqXeTXYrW4PeIpi5JAMaxJ9SDPPJAuduTzGjW0oQ5v3rDJQbUdAPcsYsfw2mObc2q3reF3nDdKOZuniOa0tyuAde3n3S66ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343206; c=relaxed/simple;
	bh=CeBwB9EZxq4kDC/7ilkI0KINFN3La3DgrWyqaVfjT78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oafr0GffUtPGIP0Pf+JT8IXHVtKBv1e4JLJHn9bZYdmGfxkBEtpsLqBnIdeWP8GX8YJD0lg8u8CiE+JFth0OPOSvqAE9iiKrSyG0lzFCKRT6vgIGV/F4HhtvIQU/FNWuF0697gpcuJEAvPKiJnui1dSG83IhwvMhWGXWOhddvvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFcdPAZS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFcdPAZS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736343203; x=1767879203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CeBwB9EZxq4kDC/7ilkI0KINFN3La3DgrWyqaVfjT78=;
  b=SFcdPAZSTr14xUoV0VNUfqhRq7opUHf5mor4loiphNaCnCKJjbLEiTb9
   QDWDyKE/RteV5+ngW+r62vtfnq0wEXCpFaRjY4NPEQTJRivMI58mbN1gw
   MAcvWskG4n9f+ZR8Abfl7eCMkwtUT60smdpMmCgvnD68rBpq2TWkzZmAo
   DfwdOdio27xqmURwCh/wx0cHQ3ttpL5z5KxKIUK0725O8J0Ma58JSL4f8
   gEzhCifRxnHJ3GnImRBpfYi6dranmaFCu9hq+K00MeIASyCxJ9976kMqk
   yDWzkpkrPo774YD98m3kDClfAvj1DY9MfNVkcK3kv3m161YlzdtxMhDPz
   w==;
X-CSE-ConnectionGUID: 7sHktZo4QOS49ApbPrvgOA==
X-CSE-MsgGUID: Wxemc9R1R3WUJnOr1vdIqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="40335428"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="40335428"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 05:33:19 -0800
X-CSE-ConnectionGUID: VFFig5c+QhGiDPREbCrr5A==
X-CSE-MsgGUID: 66/XR/42QMaKZJC0EdauxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133997825"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Jan 2025 05:33:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVWBP-000G8X-2y;
	Wed, 08 Jan 2025 13:33:15 +0000
Date: Wed, 8 Jan 2025 21:32:42 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [djiang:cxl/extended-linear 4/4] ERROR: modpost: "memory_failure"
 [drivers/cxl/core/cxl_core.ko] undefined!
Message-ID: <202501082134.hNJiJCPv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/extended-linear
head:   2cd4cea23c873047dabad1e6d800cfc9c81fb397
commit: 2cd4cea23c873047dabad1e6d800cfc9c81fb397 [4/4] cxl: Add mce notifier to emit aliased address for extended linear cache
config: x86_64-randconfig-104-20250108 (https://download.01.org/0day-ci/archive/20250108/202501082134.hNJiJCPv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501082134.hNJiJCPv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501082134.hNJiJCPv-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "memory_failure" [drivers/cxl/core/cxl_core.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
