Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45957144D07
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 11:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716462873; cv=none; b=poklpOuf4Q+ZZ0CufxQFdakt1CKuZn+LsPzF2ePYRnp/vTPsR7kbyhSJyJWNvxOJ25lnsR09MC2EYDp5XmLZ+cwwtoL9VAQ/et3KxitYQH66ZWShc/zkLKUcieEifD5++r8YjF7MIhWibnoCxzNK1TGb5H7cII3ea5jX3LpuhSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716462873; c=relaxed/simple;
	bh=FPKTNtEiZBbWqqP4ySqsPPXH5QynoOxn05J5JjkVIkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pgwq1Z0mSXHGX17cgT1OMLDxdXd1NmSS4PCQVLARvS33blat2BbtMAsIBoYVGFns5LsACwF8aGjdzLOQgYyCRiDAOcV2KfgpQydukBefx3Zg9OLzu/Q8a2yFkSMQYfsC4mtYqkDsg/k1/a5ZgGnGNDbkEjULJCg3T3RKxEaFeIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Guix8053; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Guix8053"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716462872; x=1747998872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FPKTNtEiZBbWqqP4ySqsPPXH5QynoOxn05J5JjkVIkQ=;
  b=Guix8053YXCxI66pYoMFek9FOyuP4tQIBaK7CF+1tfreaaDl0x95bSDP
   Q80wyTPrep3g3yHJeWYc3ENNu0xn4l4we1prpSWhSNxEobkTB9zj6rGBX
   SblREU+WMKiqKY7JPB+HqwBaeHE9Fc3Akmiq4VReKw80z7bSHpsCbAIaf
   rzLKuRDpUfszfBaOnjG7ln2EkV/ikL1IfK8/cEGtfJ8QlPyUotAMxUY43
   O9GRuGc3tnpmsMxzlZZVjBK3qwvCx/B8Tv+w4UY6xmMj3aX8vszmjOqa/
   y+i9wf/zYWh7HZ6cnVMWqMOsSZxy02EYOzd5viK+Xv+9jipMtHVyDC3kb
   g==;
X-CSE-ConnectionGUID: Tm1MwTaTTrSp39UMhurJ7w==
X-CSE-MsgGUID: HIch4ikmSAeJNI9UHPWASw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12621781"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="12621781"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 04:14:31 -0700
X-CSE-ConnectionGUID: eDicJHulSmSYPKF/nxTw8A==
X-CSE-MsgGUID: Y4ui49kfRfmEz9zjyUsUjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="34241650"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 May 2024 04:14:28 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sA6Ox-0002lw-1b;
	Thu, 23 May 2024 11:14:27 +0000
Date: Thu, 23 May 2024 19:14:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmap-fix-8d 15/36] lib/dynamic_debug.c:1203:41: error:
 invalid use of undefined type 'const struct module'
Message-ID: <202405231902.zfsQIr4E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-classmap-fix-8d
head:   07a74c0e1fe9c389f87ba0cd56d5178c3e87103c
commit: 1bc89a95b93be7bf897ed23bb5903ba2c901b9b6 [15/36] dyndbg-API: fix DECLARE_DYNDBG_CLASSMAP
config: x86_64-buildonly-randconfig-001-20240523 (https://download.01.org/0day-ci/archive/20240523/202405231902.zfsQIr4E-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405231902.zfsQIr4E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405231902.zfsQIr4E-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_apply_params':
   lib/dynamic_debug.c:1197:18: warning: extra tokens at end of #ifdef directive
    1197 | #ifdef IS_ENABLED(CONFIG_MODULES)
         |                  ^
>> lib/dynamic_debug.c:1203:41: error: invalid use of undefined type 'const struct module'
    1203 |                 for (i = 0, kp = cm->mod->kp; i < cm->mod->num_kp; i++, kp++)
         |                                         ^~
   lib/dynamic_debug.c:1203:58: error: invalid use of undefined type 'const struct module'
    1203 |                 for (i = 0, kp = cm->mod->kp; i < cm->mod->num_kp; i++, kp++)
         |                                                          ^~


vim +1203 lib/dynamic_debug.c

  1193	
  1194	static void ddebug_apply_params(const struct ddebug_class_map *cm, const char *modnm)
  1195	{
  1196		const struct kernel_param *kp;
  1197	#ifdef IS_ENABLED(CONFIG_MODULES)
  1198		int i;
  1199	
  1200		if (cm->mod) {
  1201			vpr_cm_info(cm, "loaded class:");
  1202			/* ifdef protects the cm->mod->kp deref */
> 1203			for (i = 0, kp = cm->mod->kp; i < cm->mod->num_kp; i++, kp++)
  1204				ddebug_match_apply_kparam(kp, cm, modnm);
  1205		}
  1206	#endif
  1207		if (!cm->mod) {
  1208			vpr_cm_info(cm, "builtin class:");
  1209			for (kp = __start___param; kp < __stop___param; kp++)
  1210				ddebug_match_apply_kparam(kp, cm, modnm);
  1211		}
  1212	}
  1213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
