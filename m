Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358359;
	b=sON1A0eSpVsrlskND1NkLLyHiThu6cjhKo2is2hM1a0M0AQe9ktUE1ISc2u+mJ3Ws00e
	 e7EtnX/IyNsjy6sfx250p6gBvyc8mu/tkwT0vqYqLykGE+s6ER+NCdCl18vXQUUDiAWmW
	 sKJ2m6tAnSsuIHhQeWr1QWoLrvRNXX1ms3ZAwBO7xC+6D6Ba7ypUJ5U4dPohg9AXjTEyw
	 H2YXsi7rUlRLTfx3cxWLXSkColZ1crDb6p2oapB7tE3NxoRTiFYuMetzIOND7A50UGkPc
	 8hzX+m36Jnbs86bj/PgokXWQzRcB+vMGtvLQRO5mWMA4VmwK7b3vYEVFeY76vJt1kwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358359;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=cVJsYNPggr8kkaZnLw4M0svUs+J18zL7sakWdU/UuSw=;
	b=WK3PASwNB2ADlQMq6ZgCKKZT2vsTGwHssZfiJJnGMPZMzs7rWQc/hiaChmoOvt4YwZHN
	 gk0FmxH8AUZ0TR5U4i7PS1qcjCWgHoP/YSmivxwmgTU4U2lqMHYhddiDB/B98stbvK/Dy
	 mDAXlXy5KjV0j1n63tBbCjgJer8UpD1hkE3s9m6ZgbhTT2CqZHJRQCYSXcPbizsDL/Iou
	 7+DUaKv8VQJw61fS76m0Gnso0jvMzxmJaPy5ha1Lm4Fljvsz/rc/lQzYO5HWJy+rFfsow
	 0xyupQ6YCLi6XeecBkz+9aLfcIqmXnC4UZP4UwneDKswJc96M536gHbDttgLzIddAGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nUajrCWY;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3524F606A31C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 11:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3524F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nUajrCWY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793358358; x=1824894358;
  h=date:from:to:cc:subject:message-id;
  bh=hOgJuMGPK1eED9/GYR9uYaXPCQp7Ewe4sKKqtDXoXcQ=;
  b=nUajrCWYGhQIzPZ1QU0Kp3JsEBblZFU79w2elHnyOV0eyL9RfiOvkolx
   FAuUs5UwfkLmmn62f9MdTHiPA4ZaFZgKqffb3ulEFgh8vQmEYbQNE1xJ0
   s066pWFXv8Sw9SlzxFOhZlux4TzBlWKh9Is9FdMEf3lak1hs1yy8KQmd3
   hKnlO6PkjdJwyKO9JbySjLyJ3RhCsBNwCEM45Rlu7TZAn99ewCK+AVVpV
   x1xI8qADblPaI93OyXMOt4rvYj7AoJrVJXj88s6t7CQ50rA7AbkwPn0XR
   oYFdLT7+bwpqzosmeCmMx/gXzbQRXn+EcXyXHa4b0yvUWqMkVdEqijHc4
   A==;
X-CSE-ConnectionGUID: cKYnDlnRQwWBKXom6zWSbg==
X-CSE-MsgGUID: tRoUXaVdSvmHXHjlTSnswA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2133281"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2133281"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 04:05:57 -0700
X-CSE-ConnectionGUID: jL0J3rMrRXe2SS5x34R1vA==
X-CSE-MsgGUID: XVub5Vh3Qeyjbe3Yoso5Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7235111"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 30 Oct 2026 04:05:56 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMkQi-00000000bcm-46V3;
	Fri, 30 Oct 2026 11:05:52 +0000
Date: Fri, 30 Oct 2026 19:04:58 +0800
From: kernel test robot <lkp@intel.com>
To: sofus <sofus.c@icloud.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 64/94]
 drivers/media/platform/apple/avd/avd-av1.c:115:33: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <202610301818.R2SvaVvI-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi sofus,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   2e6ef8294919b4bd7b23756d836b447b0b4ffb5f
commit: dc36ed8c5961b2c2cfb9d6badfd6fc8877d347b6 [64/94] media: apple: avd: add av1 support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20261030/202610301818.R2SvaVvI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610301818.R2SvaVvI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610301818.R2SvaVvI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/apple/avd/avd-av1.c:27:
   drivers/media/platform/apple/avd/avd-av1.c: In function 'set_refs':
>> drivers/media/platform/apple/avd/avd-av1.c:115:33: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     115 | #define AV1_GM_TYPE(v)          FIELD_PREP(GENMASK(31, 30), v)
         |                                 ^~~~~~~~~~
   drivers/media/platform/apple/avd/avd-inst.h:195:41: note: in definition of macro 'push'
     195 | #define push(inst, name) push(avd, ctx, inst)
         |                                         ^~~~
   drivers/media/platform/apple/avd/avd-av1.c:315:30: note: in expansion of macro 'AV1_GM_TYPE'
     315 |                         push(AV1_GM_TYPE(gm->type[ref_idx]) |
         |                              ^~~~~~~~~~~
   drivers/media/platform/apple/avd/avd-av1.c: In function 'set_header':
   drivers/media/platform/apple/avd/avd-av1.c:586:47: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
     586 |                         frame->upscaled_width - 1, "upscaled_width");
         |                         ~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/media/platform/apple/avd/avd-inst.h:195:41: note: in definition of macro 'push'
     195 | #define push(inst, name) push(avd, ctx, inst)
         |                                         ^~~~


vim +/FIELD_PREP +115 drivers/media/platform/apple/avd/avd-av1.c

   113	
   114	#define AV1_GM_VALID(v)		FIELD_PREP(BIT(30), !!(v))
 > 115	#define AV1_GM_TYPE(v)		FIELD_PREP(GENMASK(31, 30), v)
   116	#define AV1_GM_PARAM0(v)	FIELD_PREP(GENMASK(29, 15), v)
   117	#define AV1_GM_PARAM1(v)	FIELD_PREP(GENMASK(14, 0), v)
   118	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
