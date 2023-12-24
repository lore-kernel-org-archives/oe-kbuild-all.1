Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DAD5663
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Dec 2023 15:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rr8/qtQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703430425; x=1734966425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cQ5E2OrAT98RnkZAg9Dro+WUFQep6DQdmHwhq/4b7hk=;
  b=Rr8/qtQvZRyrWeMZMh4D8uylmqogbCZOuix/gUKXacErXD54CKa2ltYm
   Rir4twH3Y8YK4N5Iew6/0waqQeqOuJCTewSn3NYCdzxwpTgmQuH1Hw+AS
   CSrjO3LkwV35q2bJHC1YElTcWCzZ4Bs5RsuH7nniOSoYvQslF/Md1rj/Q
   XgxrrxVSq+Z5x3KhZq5mqHRcQTTcH2uEOa/+7pNWBztQi/GYL5CX4VQY3
   7rFbiOBBolfhPtB4FwA4kOC1ih+Rh7lgrSfoWkELbctpUu6VxmqGsDURw
   UdyTYhILwTidXD7x3GaLLeE7dwGZCQ9M38/SdBHWGUjmPUnS/GpdCwK4X
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="375736080"
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; 
   d="scan'208";a="375736080"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 07:07:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="727333907"
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; 
   d="scan'208";a="727333907"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 24 Dec 2023 07:07:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHQ3v-000CMN-18;
	Sun, 24 Dec 2023 15:06:59 +0000
Date: Sun, 24 Dec 2023 23:04:35 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Arun R Murthy <arun.r.mruthy@intel.com>
Subject: drivers/gpu/drm/xe/display/xe_display_misc.c:10:14: warning: no
 previous prototype for 'intel_gmch_vga_set_decode'
Message-ID: <202312242306.cagXynVj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Uma,

FYI, the error/warning still remains.

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git new
head:   f30cae3de3b138849010f4e54d8800eb1cc080b9
commit: e2f3d6c51c72c6ae6046ede17f03ca962a093bc1 drm/xe/display: Create a dummy version for vga decode
date:   10 weeks ago
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20231224/202312242306.cagXynVj-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231224/202312242306.cagXynVj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312242306.cagXynVj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/display/xe_display_misc.c:10:14: warning: no previous prototype for 'intel_gmch_vga_set_decode' [-Wmissing-prototypes]
      10 | unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


vim +/intel_gmch_vga_set_decode +10 drivers/gpu/drm/xe/display/xe_display_misc.c

     9	
  > 10	unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
