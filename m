Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A15B469D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 03:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747540193; cv=none; b=NVgn1ubgeQGDeFPR1V5pdetF7Rc4Ili7cDtvYYkzs403nWmlOyf8RhQiM0iMfj230iA+NQiw0mQd1Q4CXibp/qRDj4V0fav4m1kfONhyxD75YMdZ/BHih3hGTwmAzZ6u9VfstSWWrO+Tv7ZiK19jy8Suy0jQZnFg1UEGbgPZP3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747540193; c=relaxed/simple;
	bh=Wx7BmQNALQDwkkp1Im0QaFe3X8eYU/7GfW52Gp2zeUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KH6qseZ8sXBvJus3RiMbr0dQuOJ1du1cbeBk+r6nU4b3o9rOvTPnJPHH3nvGLNTqOvvfGdnAy3jP3LZ2d+7W1JfSFbZYjdGVNZKPsdqkpPU0LaJ6L5+jl3NDAbSYKztUA7VsbiQjKMiz73X+NQlpxigvIVj+ikBljYBQ7SCPJcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6WUXQYt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6WUXQYt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747540191; x=1779076191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wx7BmQNALQDwkkp1Im0QaFe3X8eYU/7GfW52Gp2zeUQ=;
  b=L6WUXQYt5Feb4N5Wlw8xEeYFzKmGnPtGzaJglbPqDwDnWmz2CLDB6YT4
   obd4O1Uj3UiYkiJgM25VaEIQMExH+zMiUTZ2TsZ3aRIe24OupJAJlqY1G
   kR3vXwmc1za++oau0LX+7VXrjmA0QDio6yM7hqRgXl3LzDu9B0O8jsOaQ
   w2SNHic22U2DprIphB9i+UH7Fic9qmh1byqGM+yW0oGb0TlfZm0J97fl5
   vichQG95aS/jPKH3e1LhlisahL1NNjIeNZU9Od7hAZrXbhoX4sCDZmlIH
   5bF3IyyRUwJqarTzvjLRGAqcrENYvry6FlH8zUXFn0tU+qR9rOtrDONKI
   w==;
X-CSE-ConnectionGUID: nV6BzDf9TiOj5Lti1Vv+nw==
X-CSE-MsgGUID: WGwR2372QVCDC3KnATeOFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="53286790"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="53286790"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 20:49:51 -0700
X-CSE-ConnectionGUID: m432DKfyQRKd03Xg5ny7TQ==
X-CSE-MsgGUID: qQNAhMt8Q9CQEbmRPBUQRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="138972779"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 May 2025 20:49:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGV23-000Kat-20;
	Sun, 18 May 2025 03:49:47 +0000
Date: Sun, 18 May 2025 11:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 6/6] kismet: WARNING: unmet direct
 dependencies detected for IMS_MSI_ARRAY when selected by VFIO_MDEV_IDXD
Message-ID: <202505181116.yds0LBk9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   950b90b563b8c87ae35bb6edc4775609bc9471c2
commit: ed1b6dfe39ba3a1a37a242d0ef4dfb7b5ec06987 [6/6] vfio/mdev: idxd: add virtual device emulation support
config: x86_64-kismet-CONFIG_IMS_MSI_ARRAY-CONFIG_VFIO_MDEV_IDXD-0-0 (https://download.01.org/0day-ci/archive/20250518/202505181116.yds0LBk9-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250518/202505181116.yds0LBk9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505181116.yds0LBk9-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY when selected by VFIO_MDEV_IDXD
   WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY
     Depends on [n]: PCI [=n]
     Selected by [y]:
     - VFIO_MDEV_IDXD [=y] && VFIO [=y] && VFIO_MDEV [=y] && X86_64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
