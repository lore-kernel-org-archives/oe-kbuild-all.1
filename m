Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BACF3BFE52
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 09:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220569; cv=none; b=cD5VTCziFZ46yYAK99FKZFA7Y7fY0TcyhXjQIqSThp5vlxi1rqxD5uYb25SbfH5yzk0TFjdEp+xJ7Xjk6fP8gPFBGbMSipicAj8r9Xhg7rq//s7F6O5up+WuHmXPKkKOQ12RDlXTHbpt1x6Qr5Kz5BnGhHV5OPyERgkuppAEwl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220569; c=relaxed/simple;
	bh=I+iL2Bx922rAVF3OiiXrU7Z96GKqRSSf7PTWuUK/4G4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PqIw/xgpBmYqh+PxkdWixeXZrS2RjNmfrfU4u5o8evfqdkiQLeQ4A0LD7fXzgJe5BQ/vDGE9tIc3lr/VqEKH6AmdpfmBVTIBCBhJrwWLPDyFdEesZF2B9PTBPtQTsMEWGjqdVslEtaTC0NsxvlqX0MV2o0KQ4pbLSLOVSTrybQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZhEV3Vj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZhEV3Vj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773220562; x=1804756562;
  h=date:from:to:cc:subject:message-id;
  bh=I+iL2Bx922rAVF3OiiXrU7Z96GKqRSSf7PTWuUK/4G4=;
  b=UZhEV3VjdDdUUTS+3zGUQwPlJ2gmITCWF94f/GFkpbN0sh7GmZ8++JbW
   pgNZlha1MHGc+DmKMz9/khF7P0MCVFMyt8ySX/XIxVffo8kJjumrUb89S
   W8lPlI0m2cHT/nBCbnyPjjsQaT/4ugC91FGlYnuDEtJjSMyZCYebr4sth
   O1SPUV/gOczgC1irpgJ5C2ABKn2+faU43HTPhohhCirmS4edwQFVNkFfV
   YjuwRmLx443e46wsVaQizlsUYcrUf3Oduu3eOImcEF3AWHAn2kGQg42/k
   QSdNFq4PsCr3IkMV8JOy7KscFWnEcA2qCEgxq6oW0JtgMOUvzE8bKqwCn
   w==;
X-CSE-ConnectionGUID: FJ9ODd/wTqmg5gedWyIkmg==
X-CSE-MsgGUID: pdGVxER8Tt6foF7FqEFLiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74402771"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74402771"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:16:00 -0700
X-CSE-ConnectionGUID: hjLcJn35REqeHGdZnPM9aA==
X-CSE-MsgGUID: 3AFjxznUQGyH3uIMoD6OaQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Mar 2026 02:15:59 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0FfY-000000000wP-3TuH;
	Wed, 11 Mar 2026 09:15:56 +0000
Date: Wed, 11 Mar 2026 17:15:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 17/17]
 drivers/gpu/drm/i915/gt/intel_rps.c:2732:2: error: #error "Use of GKI
 forbidden symbol_get/symbol_put symbols, please refactor code first"
Message-ID: <202603111717.eAZnVxNo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Tomasz,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   6ca2c2288ee8399eaf9532746cdb562577e09565
commit: f8833da199c243bbf9801b0eb6b36820abe8f3ec [17/17] ANDROID: [TEMP] i915: Provide workaround to build i915 as vendor module
config: x86_64-randconfig-073-20260311 (https://download.01.org/0day-ci/archive/20260311/202603111717.eAZnVxNo-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111717.eAZnVxNo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603111717.eAZnVxNo-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/gt/intel_rps.c: In function 'ips_ping_for_i915_load':
>> drivers/gpu/drm/i915/gt/intel_rps.c:2732:2: error: #error "Use of GKI forbidden symbol_get/symbol_put symbols, please refactor code first"
    2732 | #error "Use of GKI forbidden symbol_get/symbol_put symbols, please refactor code first"
         |  ^~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +2732 drivers/gpu/drm/i915/gt/intel_rps.c

  2714	
  2715	/*
  2716	 * Tells the intel_ips driver that the i915 driver is now loaded, if
  2717	 * IPS got loaded first.
  2718	 *
  2719	 * This awkward dance is so that neither module has to depend on the
  2720	 * other in order for IPS to do the appropriate communication of
  2721	 * GPU turbo limits to i915.
  2722	 */
  2723	static void
  2724	ips_ping_for_i915_load(void)
  2725	{
  2726	#if IS_ENABLED(CONFIG_INTEL_IPS)
  2727		/*
  2728		 * (b/352497771): GKI does not allow to build any vendor module which
  2729		 * uses symbol_get/symbol_put as symbol lookup circumvents all ABI
  2730		 * checking.
  2731		 */
> 2732	#error "Use of GKI forbidden symbol_get/symbol_put symbols, please refactor code first"
  2733		void (*link)(void);
  2734	
  2735		link = symbol_get(ips_link_to_i915_driver);
  2736		if (link) {
  2737			link();
  2738			symbol_put(ips_link_to_i915_driver);
  2739		}
  2740	#endif
  2741	}
  2742	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
