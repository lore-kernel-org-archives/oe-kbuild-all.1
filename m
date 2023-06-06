Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2B55660
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 08:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686040031; x=1717576031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GIsyVGPDgE8PKkZxjDGVz34LapzyMmYSOROpzep7GcI=;
  b=iKMIzD4wHDg54OmENG6ieHHobGcZSIiJ55PCc0u4DVbBJXJSL9bDMEyJ
   yneufqMaXEiX9FoVk0V3AajZt5fMdE6r1XlA6U9PN6cpgRwbtKUFe4QlO
   9KWnZ1kmMObQo0zPu/htHJ6dz0w4MWU77DhNTySOM5+TFHBfikaCUghli
   PR2xbeTLCnG9QVb2QuWhSBAsc6/g2VQFhhdM5Bc2covceyuW6ZgVcYmc9
   /iEk+BMoiNOhZFrl+FhYhvib9nCY5GPA2gWOqExXVAAaCvy7f5xw3ny5i
   ftD3X5IasGiuWDow7sb/xkTwfIypAJyKk1dljy0+8yXMsVir3m13Hj/Al
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="336960759"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="336960759"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 01:27:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="703073891"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="703073891"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 Jun 2023 01:27:09 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6S20-00051r-1d;
	Tue, 06 Jun 2023 08:27:08 +0000
Date: Tue, 6 Jun 2023 16:26:49 +0800
From: kernel test robot <lkp@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
	Alan Previn <alan.previn.teres.alexis@intel.com>,
	dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 4/5] drm/i915/mtl/gsc: Add a gsc_info
 debugfs
Message-ID: <202306061637.gecTQnQd-lkp@intel.com>
References: <20230606022402.2048235-5-daniele.ceraolospurio@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606022402.2048235-5-daniele.ceraolospurio@intel.com>

Hi Daniele,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniele-Ceraolo-Spurio/drm-i915-gsc-fixes-and-updates-for-GSC-memory-allocation/20230606-102510
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230606022402.2048235-5-daniele.ceraolospurio%40intel.com
patch subject: [Intel-gfx] [PATCH v2 4/5] drm/i915/mtl/gsc: Add a gsc_info debugfs
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230606/202306061637.gecTQnQd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add drm-tip git://anongit.freedesktop.org/drm/drm-tip
        git fetch drm-tip drm-tip
        git checkout drm-tip/drm-tip
        b4 shazam https://lore.kernel.org/r/20230606022402.2048235-5-daniele.ceraolospurio@intel.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306061637.gecTQnQd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c:28:6: error: no previous prototype for 'intel_gsc_uc_debugfs_register' [-Werror=missing-prototypes]
      28 | void intel_gsc_uc_debugfs_register(struct intel_gsc_uc *gsc_uc, struct dentry *root)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/intel_gsc_uc_debugfs_register +28 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c

    27	
  > 28	void intel_gsc_uc_debugfs_register(struct intel_gsc_uc *gsc_uc, struct dentry *root)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
