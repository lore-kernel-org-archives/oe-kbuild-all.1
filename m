Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF142E6CCD
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Aug 2026 07:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786262024; cv=none; b=ceseqZ36HdVgWPTUvg/uo/cnjFEMqnmud26kSeDHUPB/VLcCunjwFL85+ZzmUARIXqgPbPD8KnfRsBCFeEgCJeyQXYR6uh0VeeDTaJVjw+SJy0YiN1KHKyyjxpr8HYg/8To/g43FOnuL5BZvGZvuJPzopZDKSvjH/L38KXmfYN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786262024; c=relaxed/simple;
	bh=FBqxjHtuU0g55Ae27dXLvq3e8G4BZxncAPOgXAlCLfg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KiP6+/2q1gC+OLlbncxlzedsuX1q2eshMNTVCN4llDARC6lSu5IqdaBUf2UUyS/aD2XLxl00HTH4HMmDFcOrEuzyVyU3A+/Gu3O3x3745vKAiXDhOtqu3jcdOGqDD2w25ac9DC5++YEqFx0PJ1RdIXanArQj5l1hMc1oY0h5MAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8G7gtAd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8G7gtAd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786262021; x=1817798021;
  h=date:from:to:cc:subject:message-id;
  bh=FBqxjHtuU0g55Ae27dXLvq3e8G4BZxncAPOgXAlCLfg=;
  b=A8G7gtAdYDV6bejAtZ9rpb1zN2lBwfoFSXOnok1Ldm0dWAl6RAwEwIyV
   7BfWrN22ZE4Zc2XcgvwSopooYDxNKu12paS2KyDUjaOxXW+b5zs2Qq8Nq
   2RR3DcN9jCf8oZ46fOOkHBB+tqF0+cj5wDT9b7IesDU9U22gFzYUok4U/
   itnUxr0txo7/BPt63Dz/P+JiXIeIMqia8gjBmOKVU4oU8Yo8/zNjT0W7l
   mh/AzTOMqXLgJS8342gcZP+U2cLcFHMi9E2YUcRS1NXGpfpeqjD+K5WXQ
   Vr9ZrWEPwCCI1G2dSX7G0dYaAbhfc/vwvRrrQ89f5TXtkP4MkNoFQMWzk
   g==;
X-CSE-ConnectionGUID: Vu/MXJMmSmyS3PWS8d7kIQ==
X-CSE-MsgGUID: 60ohJGvxR5KpCCxuuaeXaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="104339020"
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="104339020"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 00:53:41 -0700
X-CSE-ConnectionGUID: vUHST749SDaA3ffnIkBU7Q==
X-CSE-MsgGUID: 0RqiPxsvS5q6Num517y59g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="260152991"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Aug 2026 00:53:39 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsyLg-00000000Lcb-1W5K;
	Sun, 09 Aug 2026 07:53:36 +0000
Date: Sun, 09 Aug 2026 15:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: sofus <sofus.c@icloud.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 64/67]
 drivers/media/platform/apple/avd/avd-inst.h:141:41: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <202608091532.mBFstVAm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   6b01d08e5d4d33d4a7cdfb1ecea6f78e295bfd75
commit: cbab401e27354c90eaa31798ca75eccfeb4b4d9c [64/67] media: apple: avd: define static values and bitmasks
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260809/202608091532.mBFstVAm-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260809/202608091532.mBFstVAm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608091532.mBFstVAm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/apple/avd/avd-h264.c:24:
   drivers/media/platform/apple/avd/avd-h264.c: In function 'stream_refs':
>> drivers/media/platform/apple/avd/avd-inst.h:141:41: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     141 | #define AVD_REF_NUM(v)                  FIELD_PREP(GENMASK(31, 28), v)
         |                                         ^~~~~~~~~~
   drivers/media/platform/apple/avd/avd-inst.h:195:41: note: in definition of macro 'push'
     195 | #define push(inst, name) push(avd, ctx, inst)
         |                                         ^~~~
   drivers/media/platform/apple/avd/avd-h264.c:127:22: note: in expansion of macro 'AVD_REF_NUM'
     127 |                 push(AVD_REF_NUM(run->num_valid - 1)
         |                      ^~~~~~~~~~~
--
   In file included from drivers/media/platform/apple/avd/avd-hevc.c:25:
   drivers/media/platform/apple/avd/avd-hevc.c: In function 'stream_refs':
>> drivers/media/platform/apple/avd/avd-inst.h:141:41: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     141 | #define AVD_REF_NUM(v)                  FIELD_PREP(GENMASK(31, 28), v)
         |                                         ^~~~~~~~~~
   drivers/media/platform/apple/avd/avd-inst.h:195:41: note: in definition of macro 'push'
     195 | #define push(inst, name) push(avd, ctx, inst)
         |                                         ^~~~
   drivers/media/platform/apple/avd/avd-hevc.c:125:22: note: in expansion of macro 'AVD_REF_NUM'
     125 |                 push(AVD_REF_NUM(decode->num_active_dpb_entries - 1)
         |                      ^~~~~~~~~~~


vim +/FIELD_PREP +141 drivers/media/platform/apple/avd/avd-inst.h

   140	
 > 141	#define AVD_REF_NUM(v)			FIELD_PREP(GENMASK(31, 28), v)
   142	#define AVD_REF_FLAG_CONST		FIELD_PREP(BIT(24), 1)
   143	#define AVD_REF_FLAG_LONG(v)		FIELD_PREP(BIT(17), !!(v))
   144	#define AVD_REF_DELTA_POC(v)		FIELD_PREP(GENMASK(16, 0), v)
   145	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
