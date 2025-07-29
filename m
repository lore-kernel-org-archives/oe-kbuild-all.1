Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9206724290D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 20:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753822330; cv=none; b=hSNGpdqCyMrOiNGJkKYEk6YcnT4pl4gyQwsItx1OIVy9D+9ei4DglKbY3JnzgAQCPnBx6N5onct8XXS7chictOeaLj9YITs1as8JVjkQsLlSiL056TK8Pqn3KTfdEAPPxvACqPPPbJg04mtjndv0Z1Kx+tdNWgLBGh0hWo/rN1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753822330; c=relaxed/simple;
	bh=xZnDqYfZp++x0/DN0UUEZ5XM4Gkj0oem8RcYxEurlqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M3SgntrZsFpB2papGvoe6jjcc+VY7/mwt8adSavQlhMx86qa2XggU5y4k9/Gsp0RofWbxiuJ27oklNFIXNWZQKEBohn7ZsTVUFNbHY6f8+bOOYW9P9RP/voTm3cccTDSvkgilDel/M1yp1iw7Fs/LZKnCbUxWd/llOBELoYU+sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dgIB2DCU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dgIB2DCU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753822329; x=1785358329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xZnDqYfZp++x0/DN0UUEZ5XM4Gkj0oem8RcYxEurlqY=;
  b=dgIB2DCUSZLyJtRdbADNgfR4k0S77Ie4ttCh5cIAMfnm6Kpy8JUceW2G
   NfMovvBy8V3ToJIzL/G71CnxIP/qg8i8SOGnfrJUymrJeAXL78ldWzESt
   5MlXh7BBEZo8Oc+ISqHbyzKrRSwUIHwXBvlNTFa2IdP+DOIT6lseE94JP
   Mzaa7FIhrZVwQ6xoNB78TtYD0JfuHQ2fRAoQW4L6D83yvv8MvapT98lWO
   N4nmWXGAHCtiSgTklF9MhAdVJ9NSKCnTlan70salGF5skcxUe4DhXjQH7
   mWhSm/RYkxYpRN2EFIwI2gpGu95zTQadSMXcpzYz0mzutUbSYzBNdyPqW
   Q==;
X-CSE-ConnectionGUID: JEJ+3ci4QLawcWbATJDKzQ==
X-CSE-MsgGUID: +SNuMG1HTHy5lXbpr1qbDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="66385331"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="66385331"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 13:52:08 -0700
X-CSE-ConnectionGUID: rPwT96cuTdiNZ2LnrfqRBg==
X-CSE-MsgGUID: eRbw2ZOIR5qkbe1bHZEo6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="162387011"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jul 2025 13:52:06 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugrIq-0001fv-1l;
	Tue, 29 Jul 2025 20:52:04 +0000
Date: Wed, 30 Jul 2025 04:51:09 +0800
From: kernel test robot <lkp@intel.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>
Subject: [drm-exynos:exynos-drm-misc-next 1284/1301]
 drivers/accel/rocket/rocket_drv.c:235:31: error: 'rocket_pm_ops' undeclared
 here (not in a function); did you mean 'rocket_probe'?
Message-ID: <202507300402.elg6gqoj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-misc-next
head:   01ac6e4e53b6351df42c97d217b0d2dbeef5c917
commit: ed98261b41687323ffa02ca20fef1e60b38fd1aa [1284/1301] accel/rocket: Add a new driver for Rockchip's NPU
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250730/202507300402.elg6gqoj-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507300402.elg6gqoj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507300402.elg6gqoj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:36,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/drm/drm_file.h:34,
                    from include/drm/drm_accel.h:11,
                    from drivers/accel/rocket/rocket_drv.c:4:
>> drivers/accel/rocket/rocket_drv.c:235:31: error: 'rocket_pm_ops' undeclared here (not in a function); did you mean 'rocket_probe'?
     235 |                 .pm = pm_ptr(&rocket_pm_ops),
         |                               ^~~~~~~~~~~~~
   include/linux/util_macros.h:136:44: note: in definition of macro 'PTR_IF'
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   drivers/accel/rocket/rocket_drv.c:235:23: note: in expansion of macro 'pm_ptr'
     235 |                 .pm = pm_ptr(&rocket_pm_ops),
         |                       ^~~~~~


vim +235 drivers/accel/rocket/rocket_drv.c

   229	
   230	static struct platform_driver rocket_driver = {
   231		.probe = rocket_probe,
   232		.remove = rocket_remove,
   233		.driver	 = {
   234			.name = "rocket",
 > 235			.pm = pm_ptr(&rocket_pm_ops),
   236			.of_match_table = dt_match,
   237		},
   238	};
   239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
