Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDBB23ED4A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 21:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733865588; cv=none; b=gBjdYZR/nx0+2RJeRMHSvcaqkRmt4WbH8PmsdJVeC3cNpIWk5ZGAd72qNxr1QVRlsaq/ghs7cm0pfRqYsZOBnn65sCcEgzDqKTfWBoknF5lKMThiCXZBXJJkSuabcuWvHWa8MFJ9++GWTC29/DfNdosSnGpxq4m9UHnRVrjs8rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733865588; c=relaxed/simple;
	bh=2eB2RPpAEwUxVY+wJqhAYL0JFNnEuKnq9SiEgJqhh64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f6++3RVTjxhIWKD8IwyejGrkupRiSnxXogD4uCWFUlIvVN78SYMGpKg6fBHOKQRJc1Ej8sWYZAm5mbH4JMfwRyZrMSSuuyovI17sUmdkFATIA8z0r2EvNgFjjCcoQjebAgITBg9SGL2S3tyKT+GisFyL4psg3W1Ry7qx0KLVWxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JnWcizxp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JnWcizxp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733865586; x=1765401586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2eB2RPpAEwUxVY+wJqhAYL0JFNnEuKnq9SiEgJqhh64=;
  b=JnWcizxpzHfey7/0oqoV+k6SxkgdR8WBm3k9hhkeUGpYPhaTSD+ERNDZ
   WUtNTn/XzxiIouQZnRQ/nHxWF6QfunHKFgi4eIRgb2OHVI/gSAlQ4UyRd
   Bqba8p96hOs2i81a14nBFwh+7tMQTXYm/BLsRU+/ekMExwpWkuXb1/ba7
   k0HpBk9GF3qS0Kw5kkUmXTXurWK8NOGgLB/0XP5iN7EYGYU00qTqEPFiV
   18LUkWGVCk8lDiSr6LJS8UWC3zZOYjG/ftwAROtrj5Yae3XryDuyrIM7H
   HjQHpNzfYUfyeW8rQ+2Z8JqchUI/kEffcb/Ar+4rJXAjmOBW4QAL0WeZa
   Q==;
X-CSE-ConnectionGUID: mDLtBJlXQk6ZcMHzU7cFYQ==
X-CSE-MsgGUID: XIw/cYRRQA+k0Sb6WgWq6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34369449"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="34369449"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 13:19:37 -0800
X-CSE-ConnectionGUID: aVgRi++4Tm2+ScV1butOuw==
X-CSE-MsgGUID: QPwNdaX0QESJEyHw/2iAZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="100591234"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Dec 2024 13:19:36 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tL7dm-0005y1-24;
	Tue, 10 Dec 2024 21:19:34 +0000
Date: Wed, 11 Dec 2024 05:19:21 +0800
From: kernel test robot <lkp@intel.com>
To: Bharat Bhushan <bbhushan2@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2291/2656] s390-linux-ld:
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.o:(__jump_table+0x8):
 undefined reference to `cn10k_ipsec_sa_enabled'
Message-ID: <202412110505.ZKDzGRMv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1b2ab8149928c1cea2d7eca30cd35bb7fe014053
commit: 6a77a158848a8c68930df27b8840660db8531222 [2291/2656] cn10k-ipsec: Process outbound ipsec crypto offload
config: s390-randconfig-001-20241210 (https://download.01.org/0day-ci/archive/20241211/202412110505.ZKDzGRMv-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412110505.ZKDzGRMv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412110505.ZKDzGRMv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> s390-linux-ld: drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.o:(__jump_table+0x8): undefined reference to `cn10k_ipsec_sa_enabled'
   s390-linux-ld: drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.o:(__jump_table+0x18): undefined reference to `cn10k_ipsec_sa_enabled'
   s390-linux-ld: drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.o:(__jump_table+0x28): undefined reference to `cn10k_ipsec_sa_enabled'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
