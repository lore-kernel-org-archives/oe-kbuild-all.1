Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E066FDC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Dec 2023 17:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cd1Cw3gM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702402324; x=1733938324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cfce93mNHkfWZR462dSsofXGjYS7vVs7PvP+WofDxiQ=;
  b=Cd1Cw3gMh7BXgpeEg74ZUyHDvgxaff+fIh/873v0M2FtiX9zNnUgqO2j
   IHoSE14XQuEKFwqJqTvXxKI1ztj/hyhpKyUlsNs54TfgS1SGRVtCw8AR7
   DA0iaRKnfayaozC5qIziP+QMsElwuzOnWfY1rWBbUa8LnedQI4l1lwaGu
   Mf+KsZVhabHXoIoyAWz8N17LUVuqnXgvCuB5MOr9lbye+bIUnKIwlWOue
   MKlEuOBKNPcDRT8l7M4OdYtOo+MR+981FsCUszrOegBWIWditlazj0aFx
   9pNiRLvucsZ9KhCSNp4+ceGoGmWeQPs9oCCsaiIB8wmT7EZGkocFqLJu3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="8211559"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="8211559"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 09:32:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="15096224"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 12 Dec 2023 09:32:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rD6bt-000JUF-39;
	Tue, 12 Dec 2023 17:31:57 +0000
Date: Wed, 13 Dec 2023 01:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Trimarchi <michael@amarulasolutions.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 6213/6946] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
Message-ID: <202312130153.eBbUNFQa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   abb240f7a2bd14567ab53e602db562bb683391e6
commit: 2e87bad7cd339882cf26b7101a1c87dab71962c9 [6213/6946] drm/panel: Add Synaptics R63353 panel driver
reproduce: (https://download.01.org/0day-ci/archive/20231213/202312130153.eBbUNFQa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312130153.eBbUNFQa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
