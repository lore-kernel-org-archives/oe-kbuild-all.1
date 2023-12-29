Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9677C11711
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 14:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B9CdMi/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703858425; x=1735394425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xhKPSsN0hvEtNCoc4GaknfFjk8ok7sEB7nJ0p+Jhlpc=;
  b=B9CdMi/s7cqdBxWbNURDBCx/EbreAmpe/SDXN+yDeEjKrt0b5J6UqWmz
   dafjk3c8P0WZRw0yRwZQGg4SvgXL+g7GzLU+b3oBgd/QGZBUcAftlU6rN
   flsbXhQIGxp+aThFE1Uhl3KJDdWut1WcM5yR8DBWGx3RQN+ARbiWmDEuZ
   vgu9PSriUpGLilaItgW/VHLYVZknKmz98nNaPbA4u4saH5URm3NaGfPBh
   diz+zhaINOKc2FusMfy5vHZZKczriedUdYc/H1pmFK21DlBrGoL15Pcjn
   BHe5tfMlL7Ih8RtJAY7fyLhOiM3YZIpyn8sDKuudMT7bg0NgJiG0FfZtQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="10035361"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="10035361"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 05:59:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="849217422"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="849217422"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Dec 2023 05:59:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJDOB-000HUZ-04;
	Fri, 29 Dec 2023 13:59:03 +0000
Date: Fri, 29 Dec 2023 21:58:33 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [drm-xe:drm-xe-next 802/1046] kismet: WARNING: unmet direct
 dependencies detected for ACPI_WMI when selected by DRM_XE
Message-ID: <202312292136.7nFLaL9f-lkp@intel.com>
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
commit: 44e694958b95395bd1c41508c88c8ca141bf9bd7 [802/1046] drm/xe/display: Implement display support
config: x86_64-kismet-CONFIG_ACPI_WMI-CONFIG_DRM_XE-0-0 (https://download.01.org/0day-ci/archive/20231229/202312292136.7nFLaL9f-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231229/202312292136.7nFLaL9f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312292136.7nFLaL9f-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_WMI when selected by DRM_XE
   
   WARNING: unmet direct dependencies detected for ACPI_WMI
     Depends on [n]: X86_PLATFORM_DEVICES [=n] && ACPI [=y]
     Selected by [m]:
     - DRM_XE [=m] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (m && MODULES [=y] || y && KUNIT [=n]=y) && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
