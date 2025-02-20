Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081C11EC018
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Feb 2025 09:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740044036; cv=none; b=Fb08izKUYAru2ZbPYIy1MnYMz2cIi0gJ/1U6lTlsL3q7EME3DaJCOuKDmO2eX9MNZpe6LkpqvG4tICrPvq+GsRrlfQFXFiJQhxRA1XxiQR1DX7i7k3LBLNxb6IVmoTioi+BNOnYFMhFxO7qOPt6x1RcMCr5n+0F1nW6GtCaYH0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740044036; c=relaxed/simple;
	bh=pazP0gk3FmV0X5DLB3wYfAlzKrB9Rdm8n15n+jg4ekY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NHiY79pGZHRNSf7aXI5D0EpoFKsnQvVDGlZjDEz4df2zpOTYVfDfsATagC4agPeh0MuTRkdvHkKu2KWQLlfIGLq9UAf0SjATdQ6bfNPzMbh3ckmGxbbGonkxT00W478x5lH/Z+ETfcwdm0RR8NVU0a5G+cD7lOEb3M3YCVbF7kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GhH3yPn8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GhH3yPn8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740044034; x=1771580034;
  h=date:from:cc:subject:message-id:mime-version;
  bh=pazP0gk3FmV0X5DLB3wYfAlzKrB9Rdm8n15n+jg4ekY=;
  b=GhH3yPn8RjqdEPP8oRcyN/aY+rr/TOqXlFC4V+x8NbPIYyvfmnLVTsG7
   eW9M+B7LVlOAusbtATc4qf3G8mJ32ta9XKDC9Ok7yGl0LELcDQ7Y5knkG
   WXoRUduNoE/ezuDg35DrKZkKwxQqw7BY0yLjYxvLsHDS0cIIrQf32ugnu
   ROPs+TPF/nT0HVemcLgDwMbSGtRxNiuGQQEW+srHSSJHqA2dAZK2lwX6U
   arcxWtzkDU6slc0gvwxjtLYZS16ipyA8BJHPSV5ThbfyM2CW0ly5Q8Y1j
   Ug7qzsGVaHjasBfPFnzT+O1SCxi/eYjAblAX4o4f2KW8w+LpF3zLMS5sZ
   A==;
X-CSE-ConnectionGUID: FLOZb8jcRUaG2Wiq5dYx4Q==
X-CSE-MsgGUID: zbupC7W4RXi2FquGeTmxZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51797712"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51797712"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 01:33:53 -0800
X-CSE-ConnectionGUID: 8vD13C1nTseEbfq5VwLcCQ==
X-CSE-MsgGUID: Sj7qewjyRrOfGhzdizQegA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="119965769"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 20 Feb 2025 01:33:51 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tl2vz-00046B-2h
	for oe-kbuild-all@lists.linux.dev;
	Thu, 20 Feb 2025 09:33:40 +0000
Date: Thu, 20 Feb 2025 17:33:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/60 1/1] drivers/iio/dac/ti-dac7612.o: warning:
 objtool: missing symbol for section .init.text
Message-ID: <202502201733.CvUWKOVX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/60
head:   9e3b33a0fe250f006a2d39da8cc8f99a0101e89b
commit: 977724d20584bd268b0a84bc2fbfffbc8681b595 [1/1] iio:dac:ti-dac7612: Add driver for Texas Instruments DAC7612
config: x86_64-buildonly-randconfig-005-20250218 (https://download.01.org/0day-ci/archive/20250220/202502201733.CvUWKOVX-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502201733.CvUWKOVX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502201733.CvUWKOVX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/dac/ti-dac7612.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
