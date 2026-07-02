Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750FF36A01E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782982439; cv=none; b=kmYMiFgZspj9FNJNIJMi/LJz6Gjt9UlmcxD3XS7RB2ahHUJvITeU2A/TZ7BgQzVLMkVfsje6JFZvRXiTXesXAJ5y12ECZyY2z8q0yuLcqvW22kj8K4i0M4sg+JL97KvJh2CZLlXFyi0KTNWbbPE/4YuatFGL2GOKu1Fggwmu/LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782982439; c=relaxed/simple;
	bh=7A94FG2QZuv2jmKauFelFwdFfYrNjVMHn8QGIjTtsUE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=phimvGRpn1HF+gs/UHre9BrR9xR/nREshnlAxYrqTIfa/aepDv0sWuddHVhZKR83y6y5UBXA6y1vLXI/VKIJB3uUOX/8oARhzudv2k4OqWiPQmXnu9HyBoUBxyomejgjZdjWXaEOJNvcPfvGigGaVPM5/NaqT15KhDu6tEAJd0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPpJwAT+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPpJwAT+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782982438; x=1814518438;
  h=date:from:to:cc:subject:message-id;
  bh=7A94FG2QZuv2jmKauFelFwdFfYrNjVMHn8QGIjTtsUE=;
  b=NPpJwAT+HEJjPKsdCNGKv5Wy9+qPxfUwv8T9B0WUay72jAl65CK9lze/
   KJNxgAlpgYAE1T3aXviy9PsP39xmIU2cz+Hfb1gqvDyx1IeYIHDj2UIuw
   5GRpkQ1MOVRnblvnfQ+P5UvYRNowA2kXklvcw2MIdgj39lxgnmAWkz5bG
   4K4hD6/fcQHdFRMmpESKJKM7Ua1vjgJXJ0Mle1W1rqQ+r4Jy5JmEU9wXG
   j90yrBnXiG6d23SRyWZROOe90AB8L4u2qYPUiOs2+PlxEusamHZkLCHJn
   48TTCuAAT9dGY1+mdCAXFwBQez2YGSvkb8lzce/zZVqkdAMRr1LJ0NYSj
   w==;
X-CSE-ConnectionGUID: x0WW1tmETfe9RMmehpstXA==
X-CSE-MsgGUID: TiLCAwCuQFuQ7SGljmZ6Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83509242"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83509242"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 01:53:58 -0700
X-CSE-ConnectionGUID: 97PpQAVGQYKIy+WlrOj2tA==
X-CSE-MsgGUID: Ht/8l4QcSt2LpaQXxZ9kcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="277129478"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 02 Jul 2026 01:53:56 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfDBB-000000001Bd-2gzP;
	Thu, 02 Jul 2026 08:53:53 +0000
Date: Thu, 02 Jul 2026 10:53:14 +0200
From: kernel test robot <lkp@intel.com>
To: Yixun Lan <dlan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: FATAL ERROR: Syntax error parsing input tree
Message-ID: <202607021011.Plw2dWcN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Yixun-Lan/scsi-ufs-spacemit-dt-bindings-Add-UFS-controller-for-K3-SoC/20260702-103626
head:   486c1d498ba49051337ead54bb5f3da8982ae5c2
commit: caf19e2a5055c667b4f42a6ca85ffc831390d433 scsi: ufs: spacemit: dt-bindings: Add UFS controller for K3 SoC
date:   6 hours ago
config: openrisc-randconfig-2051-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021011.Plw2dWcN-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 9.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021011.Plw2dWcN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021011.Plw2dWcN-lkp@intel.com/

All errors (new ones prefixed by >>):

   Lexical error: Documentation/devicetree/bindings/ufs/spacemit,k3-ufshc.example.dts:24.27-46 Unexpected 'CLK_APMU_UFS_REFCLK'
>> FATAL ERROR: Syntax error parsing input tree

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
