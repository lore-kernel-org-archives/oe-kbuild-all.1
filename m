Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782C31FC3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 02:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737946267; cv=none; b=Z4x5i0Lobth/tN7426HctCj0k+PfvTdDZ9G0vg41rbpEn2/OhUKLfwgtvpnJhiMjN+V1+2uNPBoWHcsf5X7U39nPCfxV9fpbEhkuuJ3DJz/Ij0LkQjjr4pcw4tI4lGUwxBAFIk+UZFSuGoR1WPOuUpEPbakdtDEUZ1PTWbd106Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737946267; c=relaxed/simple;
	bh=+Lw/tr/HoOaccy4kvIfOSHBA2dwJPs1kFAxxL1EYKR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e8guJrU9VzB8lr1ObHzvwyczJ8ROp8HDXLg4R5yufaj8eeINQtIbr80i5YHe7DhqkFCJ5tkHkr9aji1t/2+JQ7TLukddUuDiMyGuuyY+ssFlLfPfjWjnVMEkbxIChPpLAdn+B4Cz1S+0DQYJFdNGpO9jGELuZ+Uqox5hEX3uNrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FY7NRVN/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FY7NRVN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737946264; x=1769482264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Lw/tr/HoOaccy4kvIfOSHBA2dwJPs1kFAxxL1EYKR8=;
  b=FY7NRVN/X2VLWkosXtL+MTwX4gUGKk77lBUtahUk5zrBbOYiVPOPtNoS
   UeqdxNd7abU3GokQMPtL21noD8a713YaawXvvlMu1dHaYZarzQSBlN3qh
   1qIhnqRA82+Y9V8zMNEaRqYaBD3egCXV4csaonoteVfG0WoghMOItEgYs
   f0quk0YRM16HRBWGCOLUgVNFTJ8uBzzKKfQi+3XajJWCouHYCkBXFUy1T
   TisbzbsYXHjIFrR7Ofgko6geF95DeuHrvCMK2PtVQI0jlrJfyLbYUOEbA
   ICSyLFhazTE7tusPMQbgZbz5Gx4glgdT/P4xwAkMoaWvmSAxETpW4ExLk
   A==;
X-CSE-ConnectionGUID: xGegACZeS9a2oFXs9mjbbg==
X-CSE-MsgGUID: YkbW52RaTySvvbxpVz9FqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="48990623"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="48990623"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 18:51:03 -0800
X-CSE-ConnectionGUID: sW5n0iG/TYOxiGwMOoMYRQ==
X-CSE-MsgGUID: PPNJEPAERSOJaOfY1579ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="108287061"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Jan 2025 18:51:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcFDH-000gKR-1h;
	Mon, 27 Jan 2025 02:50:59 +0000
Date: Mon, 27 Jan 2025 10:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: James Clark <james.clark@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Subject: [arm-integrator:b4/dead-deamons 2/5] WARNING: modpost: vmlinux:
 section mismatch in reference: secondary_start_kernel+0x188 (section: .text)
 -> init_gic_priority_masking (section: .init.text)
Message-ID: <202501271022.uilX1FUx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/dead-deamons
head:   337a23015919bdcaf25c1f3bbfcb7b5bd11d7029
commit: a3a4fafbdc9963ed91b21a60f503fdf1ccdc8183 [2/5] Allow no SMP builds
config: arm64-randconfig-001-20250127 (https://download.01.org/0day-ci/archive/20250127/202501271022.uilX1FUx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501271022.uilX1FUx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501271022.uilX1FUx-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: secondary_start_kernel+0x188 (section: .text) -> init_gic_priority_masking (section: .init.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
