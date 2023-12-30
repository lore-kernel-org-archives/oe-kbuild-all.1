Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B5BBE4D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Dec 2023 19:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="THJlpu9U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703964381; x=1735500381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6iVM/ObSLCM2iZzQwdcs7ki9Y2tfYQK+4FTGUljzDWI=;
  b=THJlpu9UZaFoYu1rhmcZhIGQ4KrVcd9my9QgOCs4QkCqXJbALlqTpBIG
   HmfIANCQEpB4jnapvSqrWFzC6kCsH0mITAFmmSb3vhVgd0zrKil5FGj6A
   V1kLixt259g16quP0LGM/eCWxw3CV/7op9bdbXvU97FYgFNEGnJVBPg8t
   hG/y8bX2iinn4wK9XITqIV3NHkY06GpDmjUJRbfMtGIq8wIQLYl8zKvPp
   LeA/x+80wbx2n/ZgyTsD5W+qOdoQgc630wPrUsw4zGvuWAwJeHMERpsJF
   3WAv8o21GIrMVe+5zIT4U8y8c9FmkoSp0pu/MCe7917XcHfPNB9HRxHZq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="463129209"
X-IronPort-AV: E=Sophos;i="6.04,318,1695711600"; 
   d="scan'208";a="463129209"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2023 11:26:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="869650882"
X-IronPort-AV: E=Sophos;i="6.04,318,1695711600"; 
   d="scan'208";a="869650882"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Dec 2023 11:26:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJeyP-000Iij-19;
	Sat, 30 Dec 2023 19:26:17 +0000
Date: Sun, 31 Dec 2023 03:25:56 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [drm-xe:drm-xe-next 1015/1016] kismet: WARNING: unmet direct
 dependencies detected for INTEL_MEI_ME when selected by INTEL_MEI_HDCP
Message-ID: <202312310301.kske2zoM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   7b3b98d034784b125bad7aca46f9e7a3cfcde45a
commit: 13c966ccd05e2a34f98e76a00ba56b698ae13693 [1015/1016] mei/hdcp: Also enable for XE
config: alpha-kismet-CONFIG_INTEL_MEI_ME-CONFIG_INTEL_MEI_HDCP-0-0 (https://download.01.org/0day-ci/archive/20231231/202312310301.kske2zoM-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231231/202312310301.kske2zoM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312310301.kske2zoM-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_MEI_ME when selected by INTEL_MEI_HDCP
   
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
     Depends on [n]: X86 && PCI [=y]
     Selected by [y]:
     - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
