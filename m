Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D699413ADE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 19:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iehwt632"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703877035; x=1735413035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XKhYM1EPGbg5zGaX7rcnB9iKdxWmIWVW4u01QqVOka8=;
  b=iehwt632JKKpOIcSthTRM7ldd+xnVtpbzJlg857m+fKzPFBlUddHYu5y
   QwdQwXdHAdgkDe+y1+cgMabvRwG4rfZ2MvjgBGW+kPtRglRisvOj39C+O
   JAcI2a3aBIf1U61uv+N/Jt+Q/ofaVoG6rvbbJ6xddgBPufpA/SHZc0ibR
   ITmsBa1PZnR3biPcz8uSiXz5Lwwps0/lITHS+TJ71eTZzt2JdMs7baDUj
   1XSpZcQVmBFkt4V5nnmL32iJ+cOC+x/aXYijhrXCeBOkOyk+s0WW7KHKo
   ElRISvqDGPYOJYvFhrLrzEtFGiDc381tBxmkFRKUMaI/VAwBFKdmawUq3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="3750315"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="3750315"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 11:10:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="897584088"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="897584088"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 29 Dec 2023 11:10:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJIFY-000HjR-2O;
	Fri, 29 Dec 2023 19:10:28 +0000
Date: Sat, 30 Dec 2023 03:09:52 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Helbech Kleist <andreaskleist@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [kleist:ipu4-dev 27/59] kismet: WARNING: unmet direct dependencies
 detected for AMBU_IPU_BRIDGE when selected by VIDEO_INTEL_IPU4
Message-ID: <202312300358.4XEDDKrP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Kleist/linux ipu4-dev
head:   15245fe26e07c9118f0f5c03af5469832928f3dc
commit: 5b533c00c6dbf8691c6e2167d6afb196bb00d74a [27/59] ambu: Add AMBU_IPU_BRIDGE
config: x86_64-kismet-CONFIG_AMBU_IPU_BRIDGE-CONFIG_VIDEO_INTEL_IPU4-0-0 (https://download.01.org/0day-ci/archive/20231230/202312300358.4XEDDKrP-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231230/202312300358.4XEDDKrP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312300358.4XEDDKrP-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for AMBU_IPU_BRIDGE when selected by VIDEO_INTEL_IPU4
   
   WARNING: unmet direct dependencies detected for AMBU_IPU_BRIDGE
     Depends on [n]: MEDIA_SUPPORT [=y] && PCI [=y] && MEDIA_PCI_SUPPORT [=y] && I2C [=n]
     Selected by [y]:
     - VIDEO_INTEL_IPU4 [=y] && PCI [=y] && (ACPI [=n] || COMPILE_TEST [=y]) && MEDIA_SUPPORT [=y] && MEDIA_PCI_SUPPORT [=y] && X86 [=y] && X86_64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
