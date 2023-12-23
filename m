Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B304689
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Dec 2023 01:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O44t516V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703293660; x=1734829660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gvS7qtAN+2WRZ6oc8kChC5ghZw3pP7GY8iukMbqApGM=;
  b=O44t516V97P/tCAUSzzQ60aKHaOcNd+k833uuOz1+JrVRmkxkGDx78tu
   smLOfPMv+QkoBhoMdB/05U6RKHEW7j+B8ePF/3CLUrjSGtpRngEnBQRoi
   5JzkqEorZpinljAHCuz/hkaHKs0Dpb8J8yD76onRoPpiSX7/G7bue9Ie0
   nJP2BsO4pEhKYI6ifwq/nrFqvTC+0dK/7+0819DmLOJ4ndamnx+OArAEF
   BKWrG8CJpnFXy6wgq5IfFa0P6XEs4d19ycjyltOLwZK43XQ0MvQhtWgfi
   4QHaTc1gZpy7LqwXh7wzTOK4QOciZ5tcwIbsvcnrrxeI14cp/+yGN/GsM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="381155940"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="381155940"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 17:07:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="1108663193"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="1108663193"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 22 Dec 2023 17:07:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGqTD-000A5I-1e;
	Sat, 23 Dec 2023 01:06:48 +0000
Date: Sat, 23 Dec 2023 09:03:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [linux-next:master 3893/10295] undefined reference to
 `auxiliary_device_init'
Message-ID: <202312230924.iWMeUsyr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: 7d9f1b72b29698e3030c2b163522cf4aa91b47e9 [3893/10295] usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE
config: x86_64-buildonly-randconfig-001-20231222 (https://download.01.org/0day-ci/archive/20231223/202312230924.iWMeUsyr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312230924.iWMeUsyr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312230924.iWMeUsyr-lkp@intel.com/

Note: the linux-next/master HEAD 39676dfe52331dba909c617f213fdb21015c8d10 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `drm_dp_hpd_bridge_register':
>> (.text+0x13d3030): undefined reference to `auxiliary_device_init'
>> ld: (.text+0x13d3046): undefined reference to `__auxiliary_device_add'
   ld: vmlinux.o: in function `drm_aux_hpd_bridge_drv_init':
>> aux-hpd-bridge.c:(.init.text+0x7feda): undefined reference to `__auxiliary_driver_register'
   ld: vmlinux.o: in function `drm_aux_hpd_bridge_drv_exit':
>> aux-hpd-bridge.c:(.exit.text+0xa58c): undefined reference to `auxiliary_driver_unregister'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_AUX_HPD_BRIDGE
   Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
   Selected by [y]:
   - TYPEC_QCOM_PMIC [=y] && USB_SUPPORT [=y] && TYPEC [=y] && TYPEC_TCPM [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && (DRM [=y] || DRM [=y]=n) && DRM_BRIDGE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
