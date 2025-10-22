Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8922D027F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 03:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761104209; cv=none; b=Xx4l4JV/GkEO6enTlZGSOAir12n0jEMG8f6ZPDkKLeYrrHcysYqwTRLVQe17kJ2M9tD0o0jXUbBo/fed+sSmLGuWoP8ellK30Mq18h0PN6+ZgZhxjsvp77inLYHgLnyVQQuSBCOdY4GGzwvhRFzpCgyY1u+X9CmYMbg0NyJmui4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761104209; c=relaxed/simple;
	bh=k4pVxaVrrVZkBvAQqVU0zEjkUkR0r3TN/yb0P/TLII8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nUSf1WOPMzDag9lN1LUdpqKI9BIQQnqbHjGbwnG/eh6wXFcCRvPzbzOdsyo/I2oaf8Wo1lq/XKq3gmWAecOBcyjl/o/V5xslHBBSurQvyvxI0oi4V68VgMienVflKML/zLshXh+lnm8xYzlZ+JNaLh6Bg4BIgpJY6DG+GUHUMNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cuiQyFAM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cuiQyFAM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761104208; x=1792640208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k4pVxaVrrVZkBvAQqVU0zEjkUkR0r3TN/yb0P/TLII8=;
  b=cuiQyFAMtQ7bPfX1EkaAmZ0+5FX5bFb2/NkIMz5f0Q0gJOMG5ZvOgaHL
   DSSr/6mqMOZsYCno1qLRFc42r8Yj+KcnoYQZL6btAVtT/ZiluFEvYSJP2
   XF8en4gASjhH5NO6uf1Ole4789/ym/dYGRZcSM1qQmkfqEgp9lEOwzGVF
   vujCzhP+/fkyinMyRv5fmJ67g1+M+eieMeQFh2w+HAG2u3IZTIEVCdKnX
   Q6mXIZgjWyM2R6sPViMZ8639UAnrOe5PLsH49fmBGVBWZW6Z2SsWjTI0z
   NPBmUsFfHz6BX+RZNzS38BcXvZ9z13U2IdWpTDMZfJzo+q06dHVT9e80c
   g==;
X-CSE-ConnectionGUID: 4xCu+jtBQRSKsz7DnMj9WQ==
X-CSE-MsgGUID: lt+RGOr3RWSY3Ygz1ykw2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50816829"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="50816829"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 20:36:47 -0700
X-CSE-ConnectionGUID: CgsbnrI5SCicfy1584No7g==
X-CSE-MsgGUID: L/kBTZ/cSBKbg/ebTNiP3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="184536671"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Oct 2025 20:36:46 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBPeK-000ByD-1O;
	Wed, 22 Oct 2025 03:36:36 +0000
Date: Wed, 22 Oct 2025 11:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/3] ERROR: modpost:
 "__i915_to_display" [drivers/gpu/drm/i915/kvmgt.ko] undefined!
Message-ID: <202510221135.EAQjSYVE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jani,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   f46f3581ac62d905b79a3eabe27557d6125f3630
commit: dedf061dd416a65a919b221ce2b895506866c8f7 [0/3] UPSTREAM: drm/i915/display: add intel_display_conversion.c to hide stuff better
config: x86_64-buildonly-randconfig-001-20251022 (https://download.01.org/0day-ci/archive/20251022/202510221135.EAQjSYVE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510221135.EAQjSYVE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510221135.EAQjSYVE-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: module coda uses symbol d_drop from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module exfat uses symbol d_drop from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module exfat uses symbol d_rehash from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module cifs uses symbol d_drop from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module cifs uses symbol __break_lease from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module cifs uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cifs uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cifs uses symbol mntget from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module fuse uses symbol dget_parent from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module fuse uses symbol mntget from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module fuse uses symbol path_get from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module fuse uses symbol d_drop from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module overlay uses symbol prepare_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol vfs_statfs from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module overlay uses symbol lock_rename from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module overlay uses symbol unlock_rename from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module overlay uses symbol dget_parent from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module overlay uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol vfs_path_lookup from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module overlay uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol dentry_open from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module overlay uses symbol vfs_getattr from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module overlay uses symbol d_drop from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module xfs uses symbol __break_lease from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module xfs uses symbol dget_parent from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module xfs uses symbol dentry_open from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module kafs uses symbol d_drop from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module kafs uses symbol dget_parent from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module kafs uses symbol d_rehash from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module kafs uses symbol mntget from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
>> ERROR: modpost: "__i915_to_display" [drivers/gpu/drm/i915/kvmgt.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
