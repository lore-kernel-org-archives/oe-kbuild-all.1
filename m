Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A502C21A94F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jun 2025 03:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751080215; cv=none; b=QXrFdJa6hWQYp2O01zyR1FY2FVi58+iOUmtxeI0qUrD10+vvvwKc/Y/Xw0b00zWHZn59W6UjJjld7FO3LkTy5w7s0pmiXKHJ4E3zB0hYJBUud4LeqTeWsdAMmxH5bOjIATUF5uG7Iel/J+ZxJXRlIpL+QyGV8HE5ZK+ypt28YqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751080215; c=relaxed/simple;
	bh=tXGSITN65mlpA/u++fn9W77Ipk9tvftmhuAx35+0eLI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QSSY3MpDRzx9hvuE51/sxH0ZITzgJsx9F9nMOHm0B0YyrqD6p2a23RSGOlFA/H7DfUCIFA8/L3dYkaxrvPNV3tU1ofmFJ5XWOaJ4BHgWv/wZctOAw9YDVMwTApzp2JNDpHM1T33KIzsj7gxx2lSqp8B7UXBVdy82Z/WUF9zG23g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0qUYgU0; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0qUYgU0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751080214; x=1782616214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tXGSITN65mlpA/u++fn9W77Ipk9tvftmhuAx35+0eLI=;
  b=R0qUYgU0nwC+foFP/ZvvnLAxhUOXde7p+DY8iPrsjkEzHb9kbiy3h/p6
   HwerDu7+a2xFZwkqHlR9PE2TqPhVr5dHWP4ACGBKvXERuKjPVNox2FsFu
   ayU7A2gKUl7NygTAjlWyLbDW6CI3Dh+Qr774tGcD2tnICJ5tuMB8evYJ5
   u8BMTigIBVe5BnHXLXbAKimJtM6Wol+Jf+/g61RagPKJnvDNyEwIxV6Q3
   G3ce6QyMEIhZfz1VwB8WmonRJOolc823widI/V5clulO28mey0PiFFSoz
   NS+WUCqeH+fvoj+1mWOcjb4bcqx2oMJQn/DQnB0xMCcnBqauZtuYsM4S5
   w==;
X-CSE-ConnectionGUID: vR5SB/AlRbeDY3Z7jlwKzA==
X-CSE-MsgGUID: Pk2rWzQrRpSfla7aeurEBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53491405"
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="53491405"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 20:10:13 -0700
X-CSE-ConnectionGUID: FBVYJNqhQPyVeGTsbsCqgg==
X-CSE-MsgGUID: pWyqEGzZS0GwJJTcOOd4aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="153259029"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Jun 2025 20:10:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVLxB-000WhW-2G;
	Sat, 28 Jun 2025 03:10:09 +0000
Date: Sat, 28 Jun 2025 11:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: Lijo Lazar <lijo.lazar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Infrastructure <z1.linuxinfra@amd.com>,
	Asad Kamal <asad.kamal@amd.com>
Subject: [agd5f:kq_resets 2255/2300]
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4151:33: error: 'adev'
 undeclared; did you mean 'cdev'?
Message-ID: <202506281140.mXfWT3EN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git kq_resets
head:   b88b120a41a95ee7e96b836a5323414a8f75606b
commit: f408cc771c3348f93476231d15a30b33b40641c4 [2255/2300] drm/amdgpu: Convert from DRM_* to dev_*
config: csky-randconfig-002-20250628 (https://download.01.org/0day-ci/archive/20250628/202506281140.mXfWT3EN-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506281140.mXfWT3EN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506281140.mXfWT3EN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/power_supply.h:15,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:30:
   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: In function 'amdgpu_device_asic_has_dc_support':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4151:33: error: 'adev' undeclared (first use in this function); did you mean 'cdev'?
    4151 |                                 adev->dev,
         |                                 ^~~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   include/linux/dev_printk.h:181:17: note: in expansion of macro 'dev_info'
     181 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
         |                 ^~~~~~~~~
   include/linux/dev_printk.h:205:9: note: in expansion of macro 'dev_level_once'
     205 |         dev_level_once(dev_info, dev, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4150:25: note: in expansion of macro 'dev_info_once'
    4150 |                         dev_info_once(
         |                         ^~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4151:33: note: each undeclared identifier is reported only once for each function it appears in
    4151 |                                 adev->dev,
         |                                 ^~~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   include/linux/dev_printk.h:181:17: note: in expansion of macro 'dev_info'
     181 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
         |                 ^~~~~~~~~
   include/linux/dev_printk.h:205:9: note: in expansion of macro 'dev_level_once'
     205 |         dev_level_once(dev_info, dev, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4150:25: note: in expansion of macro 'dev_info_once'
    4150 |                         dev_info_once(
         |                         ^~~~~~~~~~~~~


vim +4151 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

  4098	
  4099	/**
  4100	 * amdgpu_device_asic_has_dc_support - determine if DC supports the asic
  4101	 *
  4102	 * @asic_type: AMD asic type
  4103	 *
  4104	 * Check if there is DC (new modesetting infrastructre) support for an asic.
  4105	 * returns true if DC has support, false if not.
  4106	 */
  4107	bool amdgpu_device_asic_has_dc_support(enum amd_asic_type asic_type)
  4108	{
  4109		switch (asic_type) {
  4110	#ifdef CONFIG_DRM_AMDGPU_SI
  4111		case CHIP_HAINAN:
  4112	#endif
  4113		case CHIP_TOPAZ:
  4114			/* chips with no display hardware */
  4115			return false;
  4116	#if defined(CONFIG_DRM_AMD_DC)
  4117		case CHIP_TAHITI:
  4118		case CHIP_PITCAIRN:
  4119		case CHIP_VERDE:
  4120		case CHIP_OLAND:
  4121			/*
  4122			 * We have systems in the wild with these ASICs that require
  4123			 * LVDS and VGA support which is not supported with DC.
  4124			 *
  4125			 * Fallback to the non-DC driver here by default so as not to
  4126			 * cause regressions.
  4127			 */
  4128	#if defined(CONFIG_DRM_AMD_DC_SI)
  4129			return amdgpu_dc > 0;
  4130	#else
  4131			return false;
  4132	#endif
  4133		case CHIP_BONAIRE:
  4134		case CHIP_KAVERI:
  4135		case CHIP_KABINI:
  4136		case CHIP_MULLINS:
  4137			/*
  4138			 * We have systems in the wild with these ASICs that require
  4139			 * VGA support which is not supported with DC.
  4140			 *
  4141			 * Fallback to the non-DC driver here by default so as not to
  4142			 * cause regressions.
  4143			 */
  4144			return amdgpu_dc > 0;
  4145		default:
  4146			return amdgpu_dc != 0;
  4147	#else
  4148		default:
  4149			if (amdgpu_dc > 0)
  4150				dev_info_once(
> 4151					adev->dev,
  4152					"Display Core has been requested via kernel parameter but isn't supported by ASIC, ignoring\n");
  4153			return false;
  4154	#endif
  4155		}
  4156	}
  4157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
