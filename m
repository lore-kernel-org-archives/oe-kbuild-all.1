Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E4F374756
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 04:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534442; cv=none; b=gSgHyUIp5uF8nchT3+BkqXOF19apIbjw3CgxWMAGUugToWRImwBxpTBMkE0nIrp6+ftPA4mm05Q0/NDsMNZTTZI4qI01O4xpa/21g1j9bavOXXY4Xd/e/KbG1JVTapBugc9sosN2CzKX0jav1Y96XimnrSHLzhuXhzc9V2R5LJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534442; c=relaxed/simple;
	bh=LOUmNpWfe+JKtr9xxVx3oROmZMVEINDZSEH+LlbT3Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GBoisSyQAfHofp1sgSfktiB/z0Ls8IrLUA/4wtFXLUWX/Lm5VchG8fS3WT7VMRg2Qlz2tpNvYEyoVrqPdvcmglJw7xrBWZ0L8/BLKacZKohNouFzpnJC2FcKyPCpZ+nPjo/xdmnFRo6tgepj2aCnwgVtCcbhhkyWnZoJmerEpvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MDmJGQw3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MDmJGQw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534440; x=1807070440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LOUmNpWfe+JKtr9xxVx3oROmZMVEINDZSEH+LlbT3Ws=;
  b=MDmJGQw32jGqo1qQF+0CBs1xcD5baE57gMkCKSqmjDHk6hf/cMWDQvrc
   mC2cW+b7qum0ahsfMIdzrtmDU/penTOTsaWrZymH4g8J1QnuSiB7EijiJ
   9xXfKzIpRHtSikJRBwl6kBRlMb+Wc+ILl43FTYr1wtpdWx4DejID8JvIj
   CntDj03VZwVNvAOc3Sttz8b+6xfx67H1k3vEMutXBqYk+JThexLaD8mJD
   /DU93NqQbO9QIFPxPhQiY9Bzz58MqO+7zqutEuib/dS8UUO5i2qseRa6i
   v2NzmyzEKzUwrK4GaCnIMe7q/k06vy8kIdhVHC1mnddbxVAiXbAriTWcI
   g==;
X-CSE-ConnectionGUID: s7OIAG2BRsiV8uaAiMShmQ==
X-CSE-MsgGUID: p+9OOZH8TzSW5DUn9kLppA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86782257"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86782257"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:00:38 -0700
X-CSE-ConnectionGUID: 4lCzJT/pTxCRvbJ8W/kSFA==
X-CSE-MsgGUID: CiuNPI+WQpGOsi9WWl3OVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="225304373"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 21:00:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xc9-0000000007N-2JJj;
	Tue, 07 Apr 2026 04:00:33 +0000
Date: Tue, 07 Apr 2026 12:00:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-attr-device_attr 6/21]
 include/linux/device.h:157:27: error: initialized field overwritten
Message-ID: <202604051945.yvQXxV6C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-attr-device_attr
head:   f45ad0a3230a0f2acba54b0bd76d897a9b68f4da
commit: a3a148545994c7ec5f0c1ce47b824474e3ba5ff5 [6/21] driver core: Allow the constification of device attributes
config: i386-randconfig-002-20260405 (https://download.01.org/0day-ci/archive/20260405/202604051945.yvQXxV6C-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604051945.yvQXxV6C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604051945.yvQXxV6C-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/drm/drm_print.h:31,
                    from drivers/gpu/drm/xe/xe_assert.h:11,
                    from drivers/gpu/drm/xe/xe_gt_ccs_mode.c:9:
>> include/linux/device.h:157:27: error: initialized field overwritten [-Werror=override-init]
     157 |         .show_const     = _Generic(_show,                                               \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:179:9: note: in expansion of macro '__DEVICE_ATTR'
     179 |         __DEVICE_ATTR(_name, _mode, _name##_show, NULL)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:182:9: note: in expansion of macro '__DEVICE_ATTR_RO_MODE'
     182 |         __DEVICE_ATTR_RO_MODE(_name, 0444)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:251:52: note: in expansion of macro '__DEVICE_ATTR_RO'
     251 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_gt_ccs_mode.c:101:8: note: in expansion of macro 'DEVICE_ATTR_RO'
     101 | static DEVICE_ATTR_RO(num_cslices);
         |        ^~~~~~~~~~~~~~
   include/linux/device.h:157:27: note: (near initialization for 'dev_attr_num_cslices.<anonymous>.show_const')
     157 |         .show_const     = _Generic(_show,                                               \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:179:9: note: in expansion of macro '__DEVICE_ATTR'
     179 |         __DEVICE_ATTR(_name, _mode, _name##_show, NULL)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:182:9: note: in expansion of macro '__DEVICE_ATTR_RO_MODE'
     182 |         __DEVICE_ATTR_RO_MODE(_name, 0444)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:251:52: note: in expansion of macro '__DEVICE_ATTR_RO'
     251 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_gt_ccs_mode.c:101:8: note: in expansion of macro 'DEVICE_ATTR_RO'
     101 | static DEVICE_ATTR_RO(num_cslices);
         |        ^~~~~~~~~~~~~~
   include/linux/device.h:166:27: error: initialized field overwritten [-Werror=override-init]
     166 |         .store_const    = _Generic(_store,                                              \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:179:9: note: in expansion of macro '__DEVICE_ATTR'
     179 |         __DEVICE_ATTR(_name, _mode, _name##_show, NULL)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:182:9: note: in expansion of macro '__DEVICE_ATTR_RO_MODE'
     182 |         __DEVICE_ATTR_RO_MODE(_name, 0444)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:251:52: note: in expansion of macro '__DEVICE_ATTR_RO'
     251 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_gt_ccs_mode.c:101:8: note: in expansion of macro 'DEVICE_ATTR_RO'
     101 | static DEVICE_ATTR_RO(num_cslices);
         |        ^~~~~~~~~~~~~~
   include/linux/device.h:166:27: note: (near initialization for 'dev_attr_num_cslices.<anonymous>.store_const')
     166 |         .store_const    = _Generic(_store,                                              \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:179:9: note: in expansion of macro '__DEVICE_ATTR'
     179 |         __DEVICE_ATTR(_name, _mode, _name##_show, NULL)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:182:9: note: in expansion of macro '__DEVICE_ATTR_RO_MODE'
     182 |         __DEVICE_ATTR_RO_MODE(_name, 0444)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:251:52: note: in expansion of macro '__DEVICE_ATTR_RO'
     251 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_gt_ccs_mode.c:101:8: note: in expansion of macro 'DEVICE_ATTR_RO'
     101 | static DEVICE_ATTR_RO(num_cslices);
         |        ^~~~~~~~~~~~~~
>> include/linux/device.h:157:27: error: initialized field overwritten [-Werror=override-init]
     157 |         .show_const     = _Generic(_show,                                               \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:188:9: note: in expansion of macro '__DEVICE_ATTR'
     188 |         __DEVICE_ATTR(_name, _mode, _name##_show, _name##_store)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:191:9: note: in expansion of macro '__DEVICE_ATTR_RW_MODE'
     191 |         __DEVICE_ATTR_RW_MODE(_name, 0644)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:233:52: note: in expansion of macro '__DEVICE_ATTR_RW'
     233 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RW(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_gt_ccs_mode.c:163:8: note: in expansion of macro 'DEVICE_ATTR_RW'
     163 | static DEVICE_ATTR_RW(ccs_mode);
         |        ^~~~~~~~~~~~~~
   include/linux/device.h:157:27: note: (near initialization for 'dev_attr_ccs_mode.<anonymous>.show_const')
     157 |         .show_const     = _Generic(_show,                                               \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:188:9: note: in expansion of macro '__DEVICE_ATTR'
     188 |         __DEVICE_ATTR(_name, _mode, _name##_show, _name##_store)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:191:9: note: in expansion of macro '__DEVICE_ATTR_RW_MODE'
     191 |         __DEVICE_ATTR_RW_MODE(_name, 0644)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:233:52: note: in expansion of macro '__DEVICE_ATTR_RW'
     233 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RW(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_gt_ccs_mode.c:163:8: note: in expansion of macro 'DEVICE_ATTR_RW'
     163 | static DEVICE_ATTR_RW(ccs_mode);
         |        ^~~~~~~~~~~~~~
   include/linux/device.h:166:27: error: initialized field overwritten [-Werror=override-init]
     166 |         .store_const    = _Generic(_store,                                              \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:188:9: note: in expansion of macro '__DEVICE_ATTR'
     188 |         __DEVICE_ATTR(_name, _mode, _name##_show, _name##_store)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:191:9: note: in expansion of macro '__DEVICE_ATTR_RW_MODE'
     191 |         __DEVICE_ATTR_RW_MODE(_name, 0644)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:233:52: note: in expansion of macro '__DEVICE_ATTR_RW'
     233 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RW(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_gt_ccs_mode.c:163:8: note: in expansion of macro 'DEVICE_ATTR_RW'
     163 | static DEVICE_ATTR_RW(ccs_mode);
         |        ^~~~~~~~~~~~~~
   include/linux/device.h:166:27: note: (near initialization for 'dev_attr_ccs_mode.<anonymous>.store_const')
     166 |         .store_const    = _Generic(_store,                                              \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:188:9: note: in expansion of macro '__DEVICE_ATTR'
     188 |         __DEVICE_ATTR(_name, _mode, _name##_show, _name##_store)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:191:9: note: in expansion of macro '__DEVICE_ATTR_RW_MODE'
     191 |         __DEVICE_ATTR_RW_MODE(_name, 0644)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:233:52: note: in expansion of macro '__DEVICE_ATTR_RW'
     233 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RW(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_gt_ccs_mode.c:163:8: note: in expansion of macro 'DEVICE_ATTR_RW'
     163 | static DEVICE_ATTR_RW(ccs_mode);
         |        ^~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from include/linux/pci.h:37,
                    from drivers/gpu/drm/xe/xe_survivability_mode.c:10:
>> include/linux/device.h:157:27: error: initialized field overwritten [-Werror=override-init]
     157 |         .show_const     = _Generic(_show,                                               \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:179:9: note: in expansion of macro '__DEVICE_ATTR'
     179 |         __DEVICE_ATTR(_name, _mode, _name##_show, NULL)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:260:52: note: in expansion of macro '__DEVICE_ATTR_RO_MODE'
     260 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO_MODE(_name, 0400)
         |                                                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_survivability_mode.c:200:8: note: in expansion of macro 'DEVICE_ATTR_ADMIN_RO'
     200 | static DEVICE_ATTR_ADMIN_RO(survivability_mode);
         |        ^~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:157:27: note: (near initialization for 'dev_attr_survivability_mode.<anonymous>.show_const')
     157 |         .show_const     = _Generic(_show,                                               \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:179:9: note: in expansion of macro '__DEVICE_ATTR'
     179 |         __DEVICE_ATTR(_name, _mode, _name##_show, NULL)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:260:52: note: in expansion of macro '__DEVICE_ATTR_RO_MODE'
     260 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO_MODE(_name, 0400)
         |                                                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_survivability_mode.c:200:8: note: in expansion of macro 'DEVICE_ATTR_ADMIN_RO'
     200 | static DEVICE_ATTR_ADMIN_RO(survivability_mode);
         |        ^~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:166:27: error: initialized field overwritten [-Werror=override-init]
     166 |         .store_const    = _Generic(_store,                                              \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:179:9: note: in expansion of macro '__DEVICE_ATTR'
     179 |         __DEVICE_ATTR(_name, _mode, _name##_show, NULL)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:260:52: note: in expansion of macro '__DEVICE_ATTR_RO_MODE'
     260 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO_MODE(_name, 0400)
         |                                                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_survivability_mode.c:200:8: note: in expansion of macro 'DEVICE_ATTR_ADMIN_RO'
     200 | static DEVICE_ATTR_ADMIN_RO(survivability_mode);
         |        ^~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:166:27: note: (near initialization for 'dev_attr_survivability_mode.<anonymous>.store_const')
     166 |         .store_const    = _Generic(_store,                                              \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:179:9: note: in expansion of macro '__DEVICE_ATTR'
     179 |         __DEVICE_ATTR(_name, _mode, _name##_show, NULL)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:260:52: note: in expansion of macro '__DEVICE_ATTR_RO_MODE'
     260 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO_MODE(_name, 0400)
         |                                                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_survivability_mode.c:200:8: note: in expansion of macro 'DEVICE_ATTR_ADMIN_RO'
     200 | static DEVICE_ATTR_ADMIN_RO(survivability_mode);
         |        ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from include/linux/pci.h:37,
                    from drivers/gpu/drm/xe/xe_device_types.h:9,
                    from drivers/gpu/drm/xe/xe_tile.h:9,
                    from drivers/gpu/drm/xe/xe_vram_freq.c:10:
>> include/linux/device.h:157:27: error: initialized field overwritten [-Werror=override-init]
     157 |         .show_const     = _Generic(_show,                                               \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:179:9: note: in expansion of macro '__DEVICE_ATTR'
     179 |         __DEVICE_ATTR(_name, _mode, _name##_show, NULL)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:182:9: note: in expansion of macro '__DEVICE_ATTR_RO_MODE'
     182 |         __DEVICE_ATTR_RO_MODE(_name, 0444)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:251:52: note: in expansion of macro '__DEVICE_ATTR_RO'
     251 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_vram_freq.c:52:8: note: in expansion of macro 'DEVICE_ATTR_RO'
      52 | static DEVICE_ATTR_RO(max_freq);
         |        ^~~~~~~~~~~~~~
   include/linux/device.h:157:27: note: (near initialization for 'dev_attr_max_freq.<anonymous>.show_const')
     157 |         .show_const     = _Generic(_show,                                               \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:179:9: note: in expansion of macro '__DEVICE_ATTR'
     179 |         __DEVICE_ATTR(_name, _mode, _name##_show, NULL)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:182:9: note: in expansion of macro '__DEVICE_ATTR_RO_MODE'
     182 |         __DEVICE_ATTR_RO_MODE(_name, 0444)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:251:52: note: in expansion of macro '__DEVICE_ATTR_RO'
     251 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_vram_freq.c:52:8: note: in expansion of macro 'DEVICE_ATTR_RO'
      52 | static DEVICE_ATTR_RO(max_freq);
         |        ^~~~~~~~~~~~~~
   include/linux/device.h:166:27: error: initialized field overwritten [-Werror=override-init]
     166 |         .store_const    = _Generic(_store,                                              \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:179:9: note: in expansion of macro '__DEVICE_ATTR'
     179 |         __DEVICE_ATTR(_name, _mode, _name##_show, NULL)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:182:9: note: in expansion of macro '__DEVICE_ATTR_RO_MODE'
     182 |         __DEVICE_ATTR_RO_MODE(_name, 0444)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:251:52: note: in expansion of macro '__DEVICE_ATTR_RO'
     251 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_vram_freq.c:52:8: note: in expansion of macro 'DEVICE_ATTR_RO'
      52 | static DEVICE_ATTR_RO(max_freq);
         |        ^~~~~~~~~~~~~~
   include/linux/device.h:166:27: note: (near initialization for 'dev_attr_max_freq.<anonymous>.store_const')
     166 |         .store_const    = _Generic(_store,                                              \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:179:9: note: in expansion of macro '__DEVICE_ATTR'
     179 |         __DEVICE_ATTR(_name, _mode, _name##_show, NULL)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:182:9: note: in expansion of macro '__DEVICE_ATTR_RO_MODE'
     182 |         __DEVICE_ATTR_RO_MODE(_name, 0444)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:251:52: note: in expansion of macro '__DEVICE_ATTR_RO'
     251 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_vram_freq.c:52:8: note: in expansion of macro 'DEVICE_ATTR_RO'
      52 | static DEVICE_ATTR_RO(max_freq);
         |        ^~~~~~~~~~~~~~
>> include/linux/device.h:157:27: error: initialized field overwritten [-Werror=override-init]
     157 |         .show_const     = _Generic(_show,                                               \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:179:9: note: in expansion of macro '__DEVICE_ATTR'
     179 |         __DEVICE_ATTR(_name, _mode, _name##_show, NULL)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:182:9: note: in expansion of macro '__DEVICE_ATTR_RO_MODE'
     182 |         __DEVICE_ATTR_RO_MODE(_name, 0444)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:251:52: note: in expansion of macro '__DEVICE_ATTR_RO'
     251 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_vram_freq.c:74:8: note: in expansion of macro 'DEVICE_ATTR_RO'
      74 | static DEVICE_ATTR_RO(min_freq);
         |        ^~~~~~~~~~~~~~
   include/linux/device.h:157:27: note: (near initialization for 'dev_attr_min_freq.<anonymous>.show_const')
     157 |         .show_const     = _Generic(_show,                                               \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:179:9: note: in expansion of macro '__DEVICE_ATTR'
     179 |         __DEVICE_ATTR(_name, _mode, _name##_show, NULL)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:182:9: note: in expansion of macro '__DEVICE_ATTR_RO_MODE'
     182 |         __DEVICE_ATTR_RO_MODE(_name, 0444)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:251:52: note: in expansion of macro '__DEVICE_ATTR_RO'
     251 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_vram_freq.c:74:8: note: in expansion of macro 'DEVICE_ATTR_RO'
      74 | static DEVICE_ATTR_RO(min_freq);
         |        ^~~~~~~~~~~~~~
   include/linux/device.h:166:27: error: initialized field overwritten [-Werror=override-init]
     166 |         .store_const    = _Generic(_store,                                              \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:179:9: note: in expansion of macro '__DEVICE_ATTR'
     179 |         __DEVICE_ATTR(_name, _mode, _name##_show, NULL)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:182:9: note: in expansion of macro '__DEVICE_ATTR_RO_MODE'
     182 |         __DEVICE_ATTR_RO_MODE(_name, 0444)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:251:52: note: in expansion of macro '__DEVICE_ATTR_RO'
     251 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_vram_freq.c:74:8: note: in expansion of macro 'DEVICE_ATTR_RO'
      74 | static DEVICE_ATTR_RO(min_freq);
         |        ^~~~~~~~~~~~~~
   include/linux/device.h:166:27: note: (near initialization for 'dev_attr_min_freq.<anonymous>.store_const')
     166 |         .store_const    = _Generic(_store,                                              \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:179:9: note: in expansion of macro '__DEVICE_ATTR'
     179 |         __DEVICE_ATTR(_name, _mode, _name##_show, NULL)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:182:9: note: in expansion of macro '__DEVICE_ATTR_RO_MODE'
     182 |         __DEVICE_ATTR_RO_MODE(_name, 0444)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:251:52: note: in expansion of macro '__DEVICE_ATTR_RO'
     251 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_vram_freq.c:74:8: note: in expansion of macro 'DEVICE_ATTR_RO'
      74 | static DEVICE_ATTR_RO(min_freq);
         |        ^~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
..


vim +157 include/linux/device.h

   130	
   131	ssize_t device_show_ulong(struct device *dev, struct device_attribute *attr,
   132				  char *buf);
   133	ssize_t device_store_ulong(struct device *dev, struct device_attribute *attr,
   134				   const char *buf, size_t count);
   135	ssize_t device_show_int(struct device *dev, struct device_attribute *attr,
   136				char *buf);
   137	ssize_t device_store_int(struct device *dev, struct device_attribute *attr,
   138				 const char *buf, size_t count);
   139	ssize_t device_show_bool(struct device *dev, struct device_attribute *attr,
   140				char *buf);
   141	ssize_t device_store_bool(struct device *dev, struct device_attribute *attr,
   142				 const char *buf, size_t count);
   143	ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
   144				   char *buf);
   145	
   146	typedef ssize_t __device_show_handler_const(struct device *dev, const struct device_attribute *attr,
   147						    char *buf);
   148	typedef ssize_t __device_store_handler_const(struct device *dev, const struct device_attribute *attr,
   149						     const char *buf, size_t count);
   150	
   151	#define __DEVICE_ATTR_SHOW_STORE(_show, _store)						\
   152		.show		= _Generic(_show,						\
   153				  __device_show_handler_const * :				\
   154					__SYSFS_FUNCTION_ALTERNATIVE_FALLBACK(_show),		\
   155				  default : _show						\
   156		),										\
 > 157		.show_const	= _Generic(_show,						\
   158				  __device_show_handler_const * : _show,			\
   159				  default : __SYSFS_FUNCTION_ALTERNATIVE_FALLBACK(_show)	\
   160		),										\
   161		.store		= _Generic(_store,						\
   162				  __device_store_handler_const * :				\
   163					__SYSFS_FUNCTION_ALTERNATIVE_FALLBACK(_store),		\
   164				  default : _store						\
   165		),										\
   166		.store_const	= _Generic(_store,						\
   167				  __device_store_handler_const * : _store,			\
   168				  default : __SYSFS_FUNCTION_ALTERNATIVE_FALLBACK(_store)	\
   169		),
   170	
   171	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
