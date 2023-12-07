Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058BD364
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 00:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PaNn62Wd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701910215; x=1733446215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ht3dsoiI2l8th8/erpa9XtHZtdW39Pp5AbSUu+iE6l4=;
  b=PaNn62WdWVjfr3VbSMnOgDS7kQ9RkciV8VDWatxfu7FcqQfQOvbitUf8
   axw3DkBXczfXfcL54jwgyTsdCgmyz1Havoisc8o7d5klEX9dcWLTzjsZD
   5P3tQJ9lDW9K9HyMy8K9XBhhZsSvQvNdheAvv/9VCsFgbP5JuOssXDEa0
   +4Fl/qwW2mIItfvNIeEmpBibYjT1aWTWL9QY3fPAQbYv1w1xImdV7BS2r
   nO7DElwzwuJIwmJU292QCZSpu9xaHiWKjtISLyIDoTFUyCl0VkfghzS/0
   g3qmlKmpxbRtXr26beiPmzte3Nb8DQe8DWjaNMsaY9ZdhAYt8WYNf9G9v
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="480344170"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="480344170"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 16:50:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="805829864"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="805829864"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 06 Dec 2023 16:50:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB2ag-000Be2-1Y;
	Thu, 07 Dec 2023 00:50:10 +0000
Date: Thu, 7 Dec 2023 08:49:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 1115/1891] panfrost_devfreq.c:undefined
 reference to `devfreq_cooling_em_register'
Message-ID: <202312070822.SWCW1ZeN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   b92a48381564e28f2ab3a5b9379814f2330bc9d1
commit: 8bff8e15e9fa3f884a08bd01f3371433aaca4965 [1115/1891] CHROMIUM: gpu: Enable Mali
config: arm64-randconfig-r051-20231207 (https://download.01.org/0day-ci/archive/20231207/202312070822.SWCW1ZeN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312070822.SWCW1ZeN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070822.SWCW1ZeN-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/gpu/drm/panfrost/panfrost_devfreq.o: in function `panfrost_devfreq_init':
>> panfrost_devfreq.c:(.text+0x418): undefined reference to `devfreq_cooling_em_register'
   aarch64-linux-ld: drivers/gpu/drm/panfrost/panfrost_devfreq.o: in function `panfrost_devfreq_fini':
>> panfrost_devfreq.c:(.text+0x4ec): undefined reference to `devfreq_cooling_unregister'
   aarch64-linux-ld: drivers/devfreq/devfreq.o: in function `devfreq_remove_device':
>> devfreq.c:(.text+0x2fb8): undefined reference to `devfreq_cooling_unregister'
   aarch64-linux-ld: drivers/devfreq/devfreq.o: in function `devfreq_add_device':
>> devfreq.c:(.text+0x36f8): undefined reference to `devfreq_cooling_em_register'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEVFREQ_THERMAL
   Depends on [n]: THERMAL [=n] && PM_DEVFREQ [=y] && PM_OPP [=y]
   Selected by [m]:
   - MALI [=m] && HAS_IOMEM [=y] && ARM64 [=y] && ARM64_PAGE_SHIFT [=12]=12 && !MALI_MIDGARD && MALI_MIDGARD!=m

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
