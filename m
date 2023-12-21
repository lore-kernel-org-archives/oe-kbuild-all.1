Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B192855E6C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Dec 2023 20:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbdYqPA8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703192108; x=1734728108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yH+8XxeAPCb/MzMujSHK6cf2STSjmzRpjwzyuZiYeSo=;
  b=kbdYqPA8o3MRszxlOUs0zzSbdD0H/H/nDEhaJvd44YJWt4ydWo7Mp3th
   65td9WSNGhX6P0dxlCXFL9LmSIexcSkc8XDx/18LR89mHna53oAzyJoeZ
   ilWMZGNbrreV1VuP9vXrl7HnhttwWqDrBEaCiTjka/c7f7VP9J22dixvU
   XJwxWIjiepD/QiXvwVsf34VrB6hc5E47ehBmZOA7El2GHgBwqxgeXlqEq
   XBgeS54Kimbik0Knn2PftOEeagVK174IYVg3Zaz4IExN922XmApbK/fxe
   T//hmPvvij/oanMKaxs5j+1XK3L0pMlycJTELU98kci55AedPlWOG43L+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="3270190"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="3270190"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 12:55:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="726552661"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="726552661"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 21 Dec 2023 12:55:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGQ4K-0008iD-0w;
	Thu, 21 Dec 2023 20:55:01 +0000
Date: Fri, 22 Dec 2023 04:54:42 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.7-rc2 105/110] kismet: WARNING: unmet direct
 dependencies detected for RESCTRL_FS when selected by ARM64_MPAM
Message-ID: <202312220418.scoMiOFV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.7-rc2
head:   b530deed244d9b45f3bce3cccde91f6ed0ebf7ea
commit: 01473b460f8b425cf15bc838864435ce79c366b4 [105/110] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
config: arm64-kismet-CONFIG_RESCTRL_FS-CONFIG_ARM64_MPAM-0-0 (https://download.01.org/0day-ci/archive/20231222/202312220418.scoMiOFV-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231222/202312220418.scoMiOFV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312220418.scoMiOFV-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESCTRL_FS when selected by ARM64_MPAM
   
   WARNING: unmet direct dependencies detected for RESCTRL_FS
     Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
     Selected by [y]:
     - ARM64_MPAM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
