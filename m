Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491AA3A1E7F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 10:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766141353; cv=none; b=GFA3no3f9wn2wD8rs+izggkCG1yAabO+mNY25rqRVDRRyA/luzz2R4L417ef9SU9pP4vvGlGOxK9eGEL+VXQEJWqa9CMZ9OoG9YWOclwXRJDM5S0SwDAtyvT8jzw9bblwz4Br3jpIo2NJSVjZbuTceQTMZHgtuXUtnFFLCYcG8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766141353; c=relaxed/simple;
	bh=LrEC3W/2KzGbzFG/oC0MV+2IHpymAu1YsQANgCmPRJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kveWHfg1832zYRwc+X0UBrN58c2Zmk8gO2AjeNThWD+5os3bqFiWi88UyvSrXgQFygXUGBobHhkRWEhIdYnuqgc3/lhPf2yijajVZQWpgZ170VE8CT7pDsgRq4IIi1CUIutx81ZPgdsfdi64RXCjWGcdLnukPchqoAxBTSHIexk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OcULJ4zA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OcULJ4zA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766141352; x=1797677352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LrEC3W/2KzGbzFG/oC0MV+2IHpymAu1YsQANgCmPRJ8=;
  b=OcULJ4zADpG9qCA8BYsHj0Mjexb+8WHBwXdkFJqfi7oBSl4pcEcP69aF
   s9kXKZeX8nW14mmRG2ohY+cjcVGhscYY5aiBWhEoF6PiJe3zg+XlQJmN8
   lBFJRN/XjZvdlVg3nN4BBPO5lcxTuM+vF82ieMT4p4qFr7VKWllchaTSL
   ay3uwyYA7ofvzyc0XGzlIjrUx9/9GFFU+Rw+W7fz90MORQBa0OJ5QsA5V
   7eoqROZ0Zs3t/RzbNxS9328GGdbA2B63bsAM62Kc4lZwfRG5DSBndBk1Z
   bYwBb8PYpzXrVCgLansuriof0EAHEwN26xkAOhJo4DwZo0umnH+WsFmTW
   Q==;
X-CSE-ConnectionGUID: H95Jmu2/Sc6PQDXLvFUDgA==
X-CSE-MsgGUID: aribD0VeRNaj5geOodbHRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68176337"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="68176337"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 02:49:11 -0800
X-CSE-ConnectionGUID: OhS3PuqYRPKArji31LeXgQ==
X-CSE-MsgGUID: WqcgkmoHSfKW932M/c+xrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="203228015"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Dec 2025 02:49:09 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWY2l-000000003NR-1O1m;
	Fri, 19 Dec 2025 10:49:07 +0000
Date: Fri, 19 Dec 2025 18:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4433:14:
 warning: performing pointer subtraction with a null pointer has undefined
 behavior
Message-ID: <202512191848.z7JNZNen-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d36711b0a31fb7c6682f53e306fa330cc0b125a2
commit: f1cb549bcd0b0a5fe8a845632b95359992eb0fae [2/2] drm/amd/display: Properly handle additional cases where DCN is not supported
config: x86_64-randconfig-122-20251212 (https://download.01.org/0day-ci/archive/20251219/202512191848.z7JNZNen-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191848.z7JNZNen-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191848.z7JNZNen-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4433:14: warning: performing pointer subtraction with a null pointer has undefined behavior [-Wnull-pointer-subtraction]
    4433 |         int index = GetIndexIntoMasterTable(DATA, Object_Header);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/atombios.h:7151:132: note: expanded from macro 'GetIndexIntoMasterTable'
    7151 | #define   GetIndexIntoMasterTable(MasterOrData, FieldName) (((char*)(&((ATOM_MASTER_LIST_OF_##MasterOrData##_TABLES*)0)->FieldName)-(char*)0)/sizeof(USHORT))
         |                                                                                                                                    ^~~~~~~~~
   2 warnings generated.


vim +4433 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

  4427	
  4428	static int dm_early_init(void *handle)
  4429	{
  4430		struct amdgpu_device *adev = (struct amdgpu_device *)handle;
  4431		struct amdgpu_mode_info *mode_info = &adev->mode_info;
  4432		struct atom_context *ctx = mode_info->atom_context;
> 4433		int index = GetIndexIntoMasterTable(DATA, Object_Header);
  4434		u16 data_offset;
  4435	
  4436		/* if there is no object header, skip DM */
  4437		if (!amdgpu_atom_parse_data_header(ctx, index, NULL, NULL, NULL, &data_offset)) {
  4438			adev->harvest_ip_mask |= AMD_HARVEST_IP_DMU_MASK;
  4439			dev_info(adev->dev, "No object header, skipping DM\n");
  4440			return -ENOENT;
  4441		}
  4442	
  4443		switch (adev->asic_type) {
  4444	#if defined(CONFIG_DRM_AMD_DC_SI)
  4445		case CHIP_TAHITI:
  4446		case CHIP_PITCAIRN:
  4447		case CHIP_VERDE:
  4448			adev->mode_info.num_crtc = 6;
  4449			adev->mode_info.num_hpd = 6;
  4450			adev->mode_info.num_dig = 6;
  4451			break;
  4452		case CHIP_OLAND:
  4453			adev->mode_info.num_crtc = 2;
  4454			adev->mode_info.num_hpd = 2;
  4455			adev->mode_info.num_dig = 2;
  4456			break;
  4457	#endif
  4458		case CHIP_BONAIRE:
  4459		case CHIP_HAWAII:
  4460			adev->mode_info.num_crtc = 6;
  4461			adev->mode_info.num_hpd = 6;
  4462			adev->mode_info.num_dig = 6;
  4463			break;
  4464		case CHIP_KAVERI:
  4465			adev->mode_info.num_crtc = 4;
  4466			adev->mode_info.num_hpd = 6;
  4467			adev->mode_info.num_dig = 7;
  4468			break;
  4469		case CHIP_KABINI:
  4470		case CHIP_MULLINS:
  4471			adev->mode_info.num_crtc = 2;
  4472			adev->mode_info.num_hpd = 6;
  4473			adev->mode_info.num_dig = 6;
  4474			break;
  4475		case CHIP_FIJI:
  4476		case CHIP_TONGA:
  4477			adev->mode_info.num_crtc = 6;
  4478			adev->mode_info.num_hpd = 6;
  4479			adev->mode_info.num_dig = 7;
  4480			break;
  4481		case CHIP_CARRIZO:
  4482			adev->mode_info.num_crtc = 3;
  4483			adev->mode_info.num_hpd = 6;
  4484			adev->mode_info.num_dig = 9;
  4485			break;
  4486		case CHIP_STONEY:
  4487			adev->mode_info.num_crtc = 2;
  4488			adev->mode_info.num_hpd = 6;
  4489			adev->mode_info.num_dig = 9;
  4490			break;
  4491		case CHIP_POLARIS11:
  4492		case CHIP_POLARIS12:
  4493			adev->mode_info.num_crtc = 5;
  4494			adev->mode_info.num_hpd = 5;
  4495			adev->mode_info.num_dig = 5;
  4496			break;
  4497		case CHIP_POLARIS10:
  4498		case CHIP_VEGAM:
  4499			adev->mode_info.num_crtc = 6;
  4500			adev->mode_info.num_hpd = 6;
  4501			adev->mode_info.num_dig = 6;
  4502			break;
  4503		case CHIP_VEGA10:
  4504		case CHIP_VEGA12:
  4505		case CHIP_VEGA20:
  4506			adev->mode_info.num_crtc = 6;
  4507			adev->mode_info.num_hpd = 6;
  4508			adev->mode_info.num_dig = 6;
  4509			break;
  4510	#if defined(CONFIG_DRM_AMD_DC_DCN)
  4511		case CHIP_RAVEN:
  4512		case CHIP_RENOIR:
  4513		case CHIP_VANGOGH:
  4514			adev->mode_info.num_crtc = 4;
  4515			adev->mode_info.num_hpd = 4;
  4516			adev->mode_info.num_dig = 4;
  4517			break;
  4518		case CHIP_NAVI10:
  4519		case CHIP_NAVI12:
  4520		case CHIP_SIENNA_CICHLID:
  4521		case CHIP_NAVY_FLOUNDER:
  4522			adev->mode_info.num_crtc = 6;
  4523			adev->mode_info.num_hpd = 6;
  4524			adev->mode_info.num_dig = 6;
  4525			break;
  4526		case CHIP_YELLOW_CARP:
  4527			adev->mode_info.num_crtc = 4;
  4528			adev->mode_info.num_hpd = 4;
  4529			adev->mode_info.num_dig = 4;
  4530			break;
  4531		case CHIP_NAVI14:
  4532		case CHIP_DIMGREY_CAVEFISH:
  4533			adev->mode_info.num_crtc = 5;
  4534			adev->mode_info.num_hpd = 5;
  4535			adev->mode_info.num_dig = 5;
  4536			break;
  4537		case CHIP_BEIGE_GOBY:
  4538			adev->mode_info.num_crtc = 2;
  4539			adev->mode_info.num_hpd = 2;
  4540			adev->mode_info.num_dig = 2;
  4541			break;
  4542	#endif
  4543		default:
  4544			DRM_ERROR("Unsupported ASIC type: 0x%X\n", adev->asic_type);
  4545			return -EINVAL;
  4546		}
  4547	
  4548		amdgpu_dm_set_irq_funcs(adev);
  4549	
  4550		if (adev->mode_info.funcs == NULL)
  4551			adev->mode_info.funcs = &dm_display_funcs;
  4552	
  4553		/*
  4554		 * Note: Do NOT change adev->audio_endpt_rreg and
  4555		 * adev->audio_endpt_wreg because they are initialised in
  4556		 * amdgpu_device_init()
  4557		 */
  4558	#if defined(CONFIG_DEBUG_KERNEL_DC)
  4559		device_create_file(
  4560			adev_to_drm(adev)->dev,
  4561			&dev_attr_s3_debug);
  4562	#endif
  4563	
  4564		return 0;
  4565	}
  4566	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
