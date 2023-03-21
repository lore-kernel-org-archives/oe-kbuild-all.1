Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB68D2ED
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 17:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679420565; x=1710956565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gi7aFEpzlosOKusmrmkkhq7J9cvv+LEhNzbbQpQ9OlI=;
  b=bqand4SQm2+8kK++32Byy8Glb8Oz8d/nIPtuTPw4OTYBVXOfIjyLBlFB
   VVAj3bIY7vi1bRkw7h2HqSeK3iuGBAppj366/AYWqYXzxkqFtYoUCcEz1
   yqcaBB3DelvEHZggcu0WkNaDz6EBNGpCy+h7JRyTjJN9W2Oo+Ap/hTKWT
   OJ/sFu6aDMnAw1CO/UXJ+cE6bccoXtNsoRg76isTTA4xpAW+6mDBkMMgR
   5jEyQ9YrgWhiA9Rv8ZLl3ja+pDDUbp5eb9+4Crgctjn1nE/I2kC0W4IlL
   WdPaTUoFDa+0tmUDxz0TDatl47+2AyyRvahxF/Om/gnHIQfkwk2qIlZF0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366750108"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="366750108"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 10:42:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792192848"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="792192848"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2023 10:42:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peg0Q-000CDR-1Y;
	Tue, 21 Mar 2023 17:42:42 +0000
Date: Wed, 22 Mar 2023 01:42:33 +0800
From: kernel test robot <lkp@intel.com>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Rob Clark <robdclark@chromium.org>,
	Neil Armstrong <narmstrong@baylibre.com>, linux-doc@vger.kernel.org
Subject: [drm-msm:msm-next-external-fixes 1/7] htmldocs:
 Documentation/gpu/automated_testing.rst: WARNING: document isn't included in
 any toctree
Message-ID: <202303220144.u436oUpr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next-external-fixes
head:   c19e7f34333932c31586d745ff6b55020cc50ce7
commit: 3fb933e2de673deb97a53287612d7afdb1980465 [1/7] drm: Add initial ci/ subdirectory
reproduce:
        git remote add drm-msm https://gitlab.freedesktop.org/drm/msm.git
        git fetch --no-tags drm-msm msm-next-external-fixes
        git checkout 3fb933e2de673deb97a53287612d7afdb1980465
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220144.u436oUpr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/automated_testing.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
