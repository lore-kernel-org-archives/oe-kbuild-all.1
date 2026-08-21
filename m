Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86C4379998
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 19:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787341814; cv=none; b=PtzPzltGjHadDUOLTiXOPS79Ianzb69LoHyhPPWiGSUwTtFIyHeol0G5VDUetcKz+CZ8UG4xQVn9bf4p0NTGdjAntrTX4rW83jvB1bH3lqacYqGWSLUK4+9IwzdVy505Tbl3NL5o8ZiJmq34YxT9T7r6c8VjLClnnLCynY4n4HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787341814; c=relaxed/simple;
	bh=g7EsGYDWY8AGLxDGq6tKjRSad9kynKt2I6+VgES5KMo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=buEuLvvOhUfUNRYXn8MS/j3JbaLDokmxmRJvzBfv9bDiXDLyYdlwEVBD6ia0WpB9eZOWr5P2AOuLr5bpZWovWN4cXSGOAjR676v5S08S+wJxq2wsMmNtC+VBiJcQqbGqWD7rli40FFqP1z2PxFgin95vv9UhB7cwOc1APKQWG4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aaZ77Y06; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aaZ77Y06"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787341810; x=1818877810;
  h=date:from:to:cc:subject:message-id;
  bh=g7EsGYDWY8AGLxDGq6tKjRSad9kynKt2I6+VgES5KMo=;
  b=aaZ77Y06hJ+BK1kR43kOcmFgQTaF/JEH1FOoZmAR+W6C1yPKbubX4iTs
   XKDiI653nWPQiWfk6kXOVh89YzSMAi654u+3JgKkZS+pKdrVdLJ/gkgXh
   Tmzbg8+suTKSlqYZLZWbXmTGNS4jFzbf0EwyDW6Zn+zGOCKNPOlMEQZFK
   dzl/A0Zr8SKAxu6rp1wVdl0u8kPV1CYXctFXRuRzyUIqWBNgddCgyLute
   ULZcjy1BNBr2MiI1b5BPJCLHvgvCYYXnGxQBMCtfSR7EDdOvURiH2gWwG
   Pl72C6jOE8QlqnjwnwLyYrIAZ1fZYsCF+x6bWjizfc36qQAxEV/RhN0Rz
   Q==;
X-CSE-ConnectionGUID: 7T+9Ae65STyhqdeXytUuqg==
X-CSE-MsgGUID: fz8OSZmKTMOJxG3erz/AlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="98488865"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="98488865"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 12:50:07 -0700
X-CSE-ConnectionGUID: Fx1oGeDgSP2UCyVyvSzGLQ==
X-CSE-MsgGUID: WxwjffFoTseRbnsO+VRf6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="270264754"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Aug 2026 12:50:06 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxVFa-00000000qOt-2HaO;
	Fri, 21 Aug 2026 19:50:02 +0000
Date: Sat, 22 Aug 2026 03:49:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 226/226]
 kernel/module/gki_module.c:31:6: warning: no previous prototype for
 'gki_is_module_unprotected_symbol'
Message-ID: <202608220345.55ZnAOXz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ramji,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d89a71b35286ef21319e2aeff62c77f2f7244cb7
commit: e9669eeb2f4580e44226cf1b582340f4b6388387 [226/226] ANDROID: GKI: Add module load time symbol protection
config: arm64-randconfig-004-20260822 (https://download.01.org/0day-ci/archive/20260822/202608220345.55ZnAOXz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220345.55ZnAOXz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608220345.55ZnAOXz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module/gki_module.c:31:6: warning: no previous prototype for 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
      31 | bool gki_is_module_unprotected_symbol(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]


vim +/gki_is_module_unprotected_symbol +31 kernel/module/gki_module.c

    25	
    26	/**
    27	 * gki_is_module_unprotected_symbol - Is a symbol unprotected for unsigned module?
    28	 *
    29	 * @name:	Symbol being checked in list of unprotected symbols
    30	 */
  > 31	bool gki_is_module_unprotected_symbol(const char *name)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
