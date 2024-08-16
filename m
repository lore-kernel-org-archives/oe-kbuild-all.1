Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623E32BD04
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 00:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723769915; cv=none; b=iul6G3haNDi8+kDupX2UuxaDs8qao6ibrwhA9gMkEz0TDYrTHZpY5eZsvCbHeon1JjdDpdqMOsr5y5Uac803+DorJtCHAUpfRjnmyyV90ink+LSuORm9B+AcqiBBqmGMHmRzdQ7NQa0t5PYewKFFL/sR0frln5DWrD+ox97RWJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723769915; c=relaxed/simple;
	bh=hnXTFqRNT2OLMHLA4HKONHl4M8pazpgKXpEkH9dpQAg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QR5VsYIH8wBMycppVC6s0WQOMZjOhxbEeyDiKPegaxRVQ+TxpLhUXIof2f1POiFLEe3auhx+ShrUNnrQiggaomxF4z4RTiOL+1y+oCZzirkYll9sHhc2tznjSurIaAwEXv3Q2LqyGNf9twLZAgmednv3gppkQGFWVy9cK3DVgC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AanoFIgn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AanoFIgn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723769913; x=1755305913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hnXTFqRNT2OLMHLA4HKONHl4M8pazpgKXpEkH9dpQAg=;
  b=AanoFIgngcL0bvd60q8bgPAyls6MafqR+jiJEmllD0oJ73GdNNObnW8T
   ervPou6tD7wntH1PHmAeYwMS9hFroGenMdCPd5x9t+nBTNIWFv8kFcaQO
   s+pHZAV2olzTVpIZLfU860lb6EHFNqtb+dnOv1t6sNYUOPVTw0cdgFKN/
   yIaWCq8l7JK2IJPzPlWkfEVaGRdt+baDI73rmYb7JG4AO711ssGZ+5FHr
   ApSbqfDkGYjuvM0VBvGV5kQeOiUFSrfhnlPGiW9BWqifDZkbXvSJppAA0
   GxdOZFkcdRNwVmlCibr7aIcHHDlSu903fkgRL8Fv0gbWo0v2UxOHr6PxB
   A==;
X-CSE-ConnectionGUID: XNMWHuJdSqmeYxuYlYcKMQ==
X-CSE-MsgGUID: E/RO5AFsR9avCgd32TzcIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="25855679"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="25855679"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 17:58:32 -0700
X-CSE-ConnectionGUID: 5eED4DZvS/KcVwshmsHlVw==
X-CSE-MsgGUID: 7hhQps5GRlScWCWRI3JMKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="59160692"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Aug 2024 17:58:32 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1selIS-0005l0-2b;
	Fri, 16 Aug 2024 00:58:28 +0000
Date: Fri, 16 Aug 2024 08:57:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/7] kismet: WARNING: unmet direct
 dependencies detected for DIMLIB when selected by GKI_HIDDEN_VIRTUAL_CONFIGS
Message-ID: <202408160836.5FJLaR8V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   e337dea349f6e48b85ff029c6485842dfd64615d
commit: 1dfbe413d21f18f714cca818435299947bf5649a [1/7] Merge 6706415bf9f3 ("Merge tag 'gfs2-v6.10-rc1-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2") into android-mainline
config: i386-kismet-CONFIG_DIMLIB-CONFIG_GKI_HIDDEN_VIRTUAL_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20240816/202408160836.5FJLaR8V-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240816/202408160836.5FJLaR8V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408160836.5FJLaR8V-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DIMLIB when selected by GKI_HIDDEN_VIRTUAL_CONFIGS
   WARNING: unmet direct dependencies detected for DIMLIB
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
