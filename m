Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D57F2F90EA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 09:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762334079; cv=none; b=kXyb3/FpB9ltlmD7fJQwAlWB2psATBv29fcqqbFAC5W4BSHzb++Kc7VQA8xQ3Ih1FoD23xnATbQDP61gvHT1c7AOVlDALUeRpG6QBT9H2xFHiST/cjrPjxUmGUNXsPRL+z+rKH8V/fzk1+ivN2cn3SAXBQdxKQ1dEw+MtnzW9NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762334079; c=relaxed/simple;
	bh=u0fKxsvHzeJVy1hd4oBI7TUhO22epWmpETJyGRhUWfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Msvz14Znj4ceqW1r0QJy0JzdVcF+Jq4yCEJLCRyfgrn8oxh5z/VG8kKjHKpLVrdkO+roVEVEsAcX5fIaqZd0MWgZby9b90zpr4BtdTy9T8zwww5sM9yW5+lvmoKEkigHW6FRJQZo+7hXuwM1pvm0aisPoslPKvd4RkHJje1sOls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HX71k1qD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HX71k1qD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762334078; x=1793870078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u0fKxsvHzeJVy1hd4oBI7TUhO22epWmpETJyGRhUWfk=;
  b=HX71k1qDBNV0jtzdsZpHwoWSaNEOCStWrrbYy7o7K5YLODeSO8U+y3S4
   D1KPiD3ER3YSyhdbEcHRsR2rO97L/5AYw9JMtdhRVo7RqR1/dN2CnXMTB
   hSiUd0LIDKqywAVIf+M3ZEG1qUtnXhW8MVGbwPInKYUyCGpFpPNDd7/Fd
   pXNKlpJNixKmZk32AkW0JI5vpjekr/TaPFVHtcMvOR9mW44YlQk3J3HuF
   /M8Aj9u0XTX5ODZzeqGpAoVslWMpWOjjTdt4U3Si4oTDqbJU7crFQvA3e
   GssYX12CKv5PsKxzMKEJjKkTU6649MBFwxosr76Khw3qvlpIm7C1EYSfS
   A==;
X-CSE-ConnectionGUID: QFXC3dpSQ3CXK6X8LjZuYA==
X-CSE-MsgGUID: dd2oknCQQd6PJ0ShSCpdZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64367570"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64367570"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 01:14:37 -0800
X-CSE-ConnectionGUID: oeBgs5DqS6G72x16uvgCdQ==
X-CSE-MsgGUID: 5CWr6KrzTOOCiD17Axqm8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="187250025"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 05 Nov 2025 01:14:36 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGZb8-000SM4-0n;
	Wed, 05 Nov 2025 09:14:34 +0000
Date: Wed, 5 Nov 2025 17:12:42 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [superm1:superm1/backlight-property 12/12] drm_connector.c:undefined
 reference to `drm_backlight_set_luminance'
Message-ID: <202511051715.to8JpFfs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git superm1/backlight-property
head:   e4d449a5f359fa7af06a7984f5e31875f8bee9dc
commit: e4d449a5f359fa7af06a7984f5e31875f8bee9dc [12/12] rename to luminance and add atomic prop
config: arc-nsimosci_hs_defconfig (https://download.01.org/0day-ci/archive/20251105/202511051715.to8JpFfs-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511051715.to8JpFfs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511051715.to8JpFfs-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: drivers/gpu/drm/drm_drv.o: in function `drm_core_exit':
   drm_drv.c:(.text+0x2ea): undefined reference to `drm_backlight_exit'
   arc-linux-ld: drm_drv.c:(.text+0x2ea): undefined reference to `drm_backlight_exit'
   arc-linux-ld: drivers/gpu/drm/drm_drv.o: in function `drm_core_init':
   drm_drv.c:(.init.text+0x28): undefined reference to `drm_backlight_init'
   arc-linux-ld: drm_drv.c:(.init.text+0x28): undefined reference to `drm_backlight_init'
   arc-linux-ld: drivers/gpu/drm/drm_connector.o: in function `drm_connector_unregister':
   drm_connector.c:(.text+0x2ce): undefined reference to `drm_backlight_unregister'
   arc-linux-ld: drm_connector.c:(.text+0x2ce): undefined reference to `drm_backlight_unregister'
   arc-linux-ld: drivers/gpu/drm/drm_connector.o: in function `drm_connector_register.part.0':
   drm_connector.c:(.text+0xdb4): undefined reference to `drm_backlight_register'
   arc-linux-ld: drm_connector.c:(.text+0xdb4): undefined reference to `drm_backlight_register'
   arc-linux-ld: drivers/gpu/drm/drm_connector.o: in function `drm_connector_cleanup':
   drm_connector.c:(.text+0x1bb6): undefined reference to `drm_backlight_free'
   arc-linux-ld: drm_connector.c:(.text+0x1bb6): undefined reference to `drm_backlight_free'
   arc-linux-ld: drivers/gpu/drm/drm_connector.o: in function `drm_connector_set_obj_prop':
>> drm_connector.c:(.text+0x236e): undefined reference to `drm_backlight_set_luminance'
>> arc-linux-ld: drm_connector.c:(.text+0x236e): undefined reference to `drm_backlight_set_luminance'
   arc-linux-ld: drivers/gpu/drm/drm_mode_object.o: in function `drm_object_property_set_value':
>> drm_mode_object.c:(.text+0x3de): undefined reference to `drm_backlight_set_luminance'
>> arc-linux-ld: drm_mode_object.c:(.text+0x3de): undefined reference to `drm_backlight_set_luminance'
   arc-linux-ld: drm_mode_object.c:(.text+0x418): undefined reference to `drm_backlight_set_luminance'
   arc-linux-ld: drivers/gpu/drm/drm_mode_object.o:drm_mode_object.c:(.text+0x418): more undefined references to `drm_backlight_set_luminance' follow
   arc-linux-ld: drivers/gpu/drm/drm_sysfs.o: in function `backlight_store':
   drm_sysfs.c:(.text+0xda): undefined reference to `drm_backlight_set_name'
   arc-linux-ld: drm_sysfs.c:(.text+0xda): undefined reference to `drm_backlight_set_name'
   arc-linux-ld: drivers/gpu/drm/drm_sysfs.o: in function `backlight_show':
   drm_sysfs.c:(.text+0x12a): undefined reference to `drm_backlight_get_name'
   arc-linux-ld: drm_sysfs.c:(.text+0x12a): undefined reference to `drm_backlight_get_name'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
