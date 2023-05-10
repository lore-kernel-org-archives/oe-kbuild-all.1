Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5320063E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 09:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683710551; x=1715246551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z1i1MU+OPjmqhrBvkTlkbLNaT6XHeZ7DyaifCxpRUjk=;
  b=IDU7ueyCBqvQrxgmLiDKvyB+w9cyp4AyBqQdjSpEa107HEkO+r4YAmIh
   vSfmUyqTJmwEwXKLveOK5wWz9VWcnkgUabnikNN9lhU2qoAt3o7I3ljSJ
   7fsO3ydlBQYlOR97LdyjNLbCY7DX6pXz/XWiWTF7twRCh92yVE4DZ2IRd
   t+w5aakQgB+DW7oSkLrBdt68NrEX0424qiCPpDMbnTPapQXWIaZWtW0Wj
   4bT5twmqUo9/tN0KHrLdZv4s9Cqw4U/LrfVTRxKYhrVa1JScqzscOUxhc
   vgTP1DGBl6UfCZxkkOoqcXa3jRmurT5lENZmWl/zjdc11OOsrb9YUBOii
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="415742954"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="415742954"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 02:22:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="873513553"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="873513553"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 May 2023 02:22:23 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwg1f-00035l-0o;
	Wed, 10 May 2023 09:22:23 +0000
Date: Wed, 10 May 2023 17:21:43 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [mlankhorst:dumpcg 16783/16889]
 drivers/gpu/drm/xe/display/ext/i915_irq.c:1398:6: warning: no previous
 prototype for 'intel_display_irq_uninstall'
Message-ID: <202305101733.1Lc9vfUX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~mlankhorst/linux dumpcg
head:   169b450351c6705039540a916fccb470d26ec34c
commit: 65c8fb4caedd0854582db164ea9ffe89d6253f50 [16783/16889] drm/xe/display: Implement display support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230510/202305101733.1Lc9vfUX-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add mlankhorst git://people.freedesktop.org/~mlankhorst/linux
        git fetch --no-tags mlankhorst dumpcg
        git checkout 65c8fb4caedd0854582db164ea9ffe89d6253f50
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/xe/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305101733.1Lc9vfUX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/display/ext/i915_irq.c:1398:6: warning: no previous prototype for 'intel_display_irq_uninstall' [-Wmissing-prototypes]
    1398 | void intel_display_irq_uninstall(struct drm_i915_private *dev_priv)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/xe/display/ext/intel_device_info.c:131:5: warning: no previous prototype for '__i915_inject_probe_error' [-Wmissing-prototypes]
     131 | int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


vim +/intel_display_irq_uninstall +1398 drivers/gpu/drm/xe/display/ext/i915_irq.c

  1397	
> 1398	void intel_display_irq_uninstall(struct drm_i915_private *dev_priv)
  1399	{
  1400		intel_hpd_cancel_work(dev_priv);
  1401	}
  1402	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
