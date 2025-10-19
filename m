Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCD24A3E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Oct 2025 18:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760897867; cv=none; b=EPrMv5Trm/0YhbiZ6VfLLvesBu5s14KvdSpewQpSdZJshqwXq6hjSkDUuFhqwHZJtq/tmU8A0RO+YqYAcMfJcb17fq194cspRpUDMY5vvW7pO5/MzZrfKFCVmX8HDFKb21PLKCiAaoSrGy9RxB0o/eCpK5l91SZCQPpRG7v7mfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760897867; c=relaxed/simple;
	bh=np5DJCYV5CKNvV/Qx7NZkBny/nhGskPLxiLF61mmrTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JINCIDHAW+A3bkV2j4BKF/atO/XUllq7KH22Joia4xPuj3ckBFOfeQVaVR4yE6WANwGDqlXnQPeeu37buQer94m/4QEpHMyt0r1keWsSvm+4X3GOL6YxfYbAxGsOV1+GCARMWNTeT+Y4a8cPaKwEzj42ZOE4wH20VAlrCAbHe74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mnI2pzC9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mnI2pzC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760897865; x=1792433865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=np5DJCYV5CKNvV/Qx7NZkBny/nhGskPLxiLF61mmrTM=;
  b=mnI2pzC9gkS3OZdbF7GNz+U8kk2kUEfqBjDGadrcA0kD8RPi8WCweVgK
   SPNRWqf66/v0jpCL57gkVj5m7MDl/+nt4L9Smo/UCetL7EQMfLPfVTotv
   Cj6ykeH61fnF1Y/e+fLzZ1oGhgh2Jyk8Rc0UuhsTvwdcZJ7FK0qScLIrq
   zFEGEul1VlofIUARBx1NdU16/Y16n9o198w9MoZLCAEWTHcLmCvsROeN/
   MvSR3bF6upILEr7m8nymoYg/dmq4GE5cykn341ZErW25xLlUzGoBFsNro
   npIR0gQ44BbM62kOomFXTUz5vMBpXG81rs+sfpN1XlofIAaybBvX70KTZ
   A==;
X-CSE-ConnectionGUID: 2ZbDSFHzS0OObv4+Eg47cw==
X-CSE-MsgGUID: mciuYP3KT0qMDGybRtmeug==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="73324314"
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="73324314"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 11:17:44 -0700
X-CSE-ConnectionGUID: 6HV98DaRR62O/GxzDN02+w==
X-CSE-MsgGUID: A72itsFtRAmXAhUQYGh6gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="183121041"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 19 Oct 2025 11:17:42 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAXy6-0009Fd-19;
	Sun, 19 Oct 2025 18:17:30 +0000
Date: Mon, 20 Oct 2025 02:16:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix-6.17 24/66] lib/dynamic_debug.c:1094:21: error:
 implicit declaration of function 'class_in_range'
Message-ID: <202510200209.AQaf6ShC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-drm-fix-6.17
head:   8bb67a0fa5ebb8abb2a6b99571d578e7312176ee
commit: 9a5f996fbf6813690e55ea7ba6c0a710440627ff [24/66] dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
config: i386-randconfig-016-20251019 (https://download.01.org/0day-ci/archive/20251020/202510200209.AQaf6ShC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510200209.AQaf6ShC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510200209.AQaf6ShC-lkp@intel.com/

Note: the jimc/dd-drm-fix-6.17 HEAD 8bb67a0fa5ebb8abb2a6b99571d578e7312176ee builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_class_name':
>> lib/dynamic_debug.c:1094:21: error: implicit declaration of function 'class_in_range' [-Wimplicit-function-declaration]
    1094 |                 if (class_in_range(dp->class_id, cli->map))
         |                     ^~~~~~~~~~~~~~


vim +/class_in_range +1094 lib/dynamic_debug.c

  1082	
  1083	static const char *ddebug_class_name(struct _ddebug_info *di, struct _ddebug *dp)
  1084	{
  1085		struct _ddebug_class_map *map;
  1086		struct _ddebug_class_user *cli;
  1087		int i;
  1088	
  1089		for_subvec(i, map, di, maps)
  1090			if (ddebug_class_in_range(dp->class_id, map))
  1091				return map->class_names[dp->class_id - map->base];
  1092	
  1093		for_subvec(i, cli, di, users)
> 1094			if (class_in_range(dp->class_id, cli->map))
  1095				return cli->map->class_names[dp->class_id - cli->map->base];
  1096	
  1097		return NULL;
  1098	}
  1099	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
