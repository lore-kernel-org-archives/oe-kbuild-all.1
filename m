Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B8C15ADD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 11:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dNHQfC8/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699097814; x=1730633814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vrHrakceFbGTEd+gcbDgVKGrFvKLRsf/Y5UhRk8Mq8U=;
  b=dNHQfC8/PXlYcOV9XNf3i+hNgSFvRbGjjRoVJSqlCBT2NQPEHWXw1Qsl
   xUFKzg1Moo1QUImyvohkioXaFFpg+7R1RxF6skuqp68TbXuRWNgks4Jyc
   +jROvUwm5Zffzxuux+uKGtD0DPbTxzKhGECdSz7EEfctar0zsgOYWcDLJ
   N46izxpuUoch+yv8uuyF4dcdUhSle4Wp60fBPs8rIYuOKtyo+tSRjMJQk
   4UoBVkaGlOo8IeI0IAd4YZP9ZcTGPWAbI+Kr+SI+ioWad+zN1HgU2vhMI
   lfewhosPp3HDqIqXeC90c4QylNpYswLEGXm1Dfn/+fjrwZDRPz6glzLXI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="391948534"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="391948534"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 04:36:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="905608016"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="905608016"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Nov 2023 04:36:50 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzExM-0004AY-1k;
	Sat, 04 Nov 2023 11:36:48 +0000
Date: Sat, 4 Nov 2023 19:36:20 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [drm-xe:drm-xe-next 1794/1905]
 drivers/gpu/drm/xe/display/ext/i915_utils.c:18:5: warning: no previous
 prototype for '__i915_inject_probe_error'
Message-ID: <202311041902.rsDm3Z8h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   bfa43da8e1f181fe2f8b84b39cb8a86e54f43731
commit: bc75b5825064c832457e4439b3a3ee03b5464fdb [1794/1905] drm/xe/display: Implement display support
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311041902.rsDm3Z8h-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041902.rsDm3Z8h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041902.rsDm3Z8h-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/display/ext/i915_utils.c:18:5: warning: no previous prototype for '__i915_inject_probe_error' [-Wmissing-prototypes]
      18 | int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


vim +/__i915_inject_probe_error +18 drivers/gpu/drm/xe/display/ext/i915_utils.c

    16	
    17	/* i915 specific, just put here for shutting it up */
  > 18	int __i915_inject_probe_error(struct drm_i915_private *i915, int err,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
