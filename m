Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C772DF3F2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Oct 2026 21:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792273263; cv=none; b=HADFeD797df0HgRIm/ITmkkdaxxm9s3Oge4hnUhDXM32DxW89VLn14SGhXDgt1WhoeX2Saj5vRnKlFDImZCuPfqfehUgB5SQdZl/zQyddraG6maLyXbKZAIAAmKuXAvafFNKiCXggPEbf1CqvZTEOE+FnF8A5eMFTiy8j1ZXNyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792273263; c=relaxed/simple;
	bh=LrlAjwURPyJN7aCnYjLcUyD5jawPl3rEZf8cLNT4HIs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a6F4c42HToyT9r6bDaYeSC9Lwkz0PgbN2DybLETcttxuJg5AufRCGmafNamlVZU5wI95ua893SinfYaw6DujXs5cmvMvk8fcLSOaOtGDf1kKxdOy79dwOSabqc52YO0FfnwkeWzvT0Q51TuNRfjoAKcpzF34IVQxdudyoGRYcKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EVEJPVjf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVEJPVjf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792273261; x=1823809261;
  h=date:from:to:cc:subject:message-id;
  bh=LrlAjwURPyJN7aCnYjLcUyD5jawPl3rEZf8cLNT4HIs=;
  b=EVEJPVjfiiJSsT/QRxR3vO2ap9a+lvRtzGW1ROXHupJkU2/VLEQ6tuOr
   Nirl1tnxrvPPbyShbs+fPUCEgKslSLYNQeywdIZUa7b59kxDZsHAEMC/C
   uZm94Z5Ykj+9xIpyNKteLlzF0yEqbG/Bhmi4qdvx4VbBTPiZNKI6eHmkj
   Xb5zmzGVNduePn9z/WP67waCueXDajDrb7b9R/GqpVxwo3HtEjgUtaqO+
   HlQb0KXJb1JRObHpFfWlx6nOzDOxFrmpj2QbnCHlOJtUmpAlEuVnLZOd+
   TzXIunFtxliOImxNb3vAQZ2nSxhGXZ8rYa+0TWGeGIKPMsqcB48z2Nan8
   w==;
X-CSE-ConnectionGUID: 4uiI1eLVSPqj6dcpRFeJ4Q==
X-CSE-MsgGUID: 8ySWY0WpTaWgcTYBuVC4Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="897443"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="897443"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 14:41:00 -0700
X-CSE-ConnectionGUID: kWGI3D91TW2oyz0qVipy7Q==
X-CSE-MsgGUID: aSLhQWCGRVGVhPzRtb38vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2625127"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Oct 2026 14:40:59 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIC9A-00000000JmM-3eva;
	Sat, 17 Oct 2026 21:40:56 +0000
Date: Sun, 18 Oct 2026 05:40:00 +0800
From: kernel test robot <lkp@intel.com>
To: sofus <sofus.c@icloud.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 63/92]
 drivers/media/platform/apple/avd/avd-inst.h:141:41: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <202610180555.h3FOFdIf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   c792edd0ffb515a81db3e039bc6e2a611c51d65b
commit: 5a2ea5f4d6517dd100d8b717e9eb203e6fa1114e [63/92] media: apple: avd: define static values and bitmasks
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20261018/202610180555.h3FOFdIf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610180555.h3FOFdIf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610180555.h3FOFdIf-lkp@intel.com/

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
