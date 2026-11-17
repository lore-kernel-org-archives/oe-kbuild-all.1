Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921714;
	b=CyAt+0n7do38syzOiOpshs0sAwp/KKqF+X8+TCWeh+z8hpUDKxPShMQ429AoGoblisxt
	 9U82pn3S0QapYm9Hjc10joMd7b/T8mDinMQhdI02/5HfxJHzumV9+DpAKVgOh2wgELjvA
	 IRPZf9s9jyDYqwCXr2evBJVkLGQo3GaVz1N0Ml0e2ete+uaVa4+Z2v+QO0a0MzPOQRy6T
	 Iv4rqqR7/zTiqUSgwHtcrPVHFSFBuwxwQYofunFexj+iuwwqQVqVUu3fpkbpxEtx9Cr7+
	 ZrbuxcMVeYd57L8eI6J/SrZytYxVDwZbAgxvzNJw5RVdQdLcONLbCal7dZmVUUc2/yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921714;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=xsQ/WUDuVy+fcssLQjZy5o017yLjBTQp4bQGjbRDHnw=;
	b=gdefMDYUylIOd56sRIC73kbudPSGBdP6PZYM/wua54UHv1HvFeF0SRAx9kYq4WjOb7/o
	 ci/bpiHoQkEwzwW4Ar4ulQqUnxxAq2Js6sO0zLQZCBFL+zr4op+5UJKImTtcSigKuBI/u
	 Gc6ErpMRpTd493E2mJKtC8t8dQAK5vE8BsARe6o2iPnCeMWvnUMeO45s+j+zIzyy22wK3
	 OTL5Zk3jBB2H9v39JngyzZ7qw3S6kpmAZZowmc5+einPFAGZ2vZdWNcv0LR/UtqKkojFO
	 jJ1OC3pKBRvDOe0cNPw7tPqedQKsN28n707QYLot7VXiQT4eS+6knR8lQQ+Azi57jGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lrqMzCQ3;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BAF606A336
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 13:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2BAF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lrqMzCQ3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794921713; x=1826457713;
  h=date:from:to:cc:subject:message-id;
  bh=APh3e7NknCPXQs4xm1350DkhO0jIG3bglgS0JEHHYWg=;
  b=lrqMzCQ3RQiV40z7ghRcsovBZVLEQN6BFqKy0XkWBaTh+MI+GjsJLqeT
   HGB5PF+Hf4MeVVX9uk2rpfwSsHYUUAZ7hY91cPuMH/3Vu5gUQ3w8tjVW9
   uSwGbmDftsY2wxEb7X0rpm0Q5bP7qzZLu6YJ7lEbdJlTxqi8oWE+jlHjA
   dVU0v6h6IHGsLjhLoIKL68ez6ILXeSTF72OjaGykqpqSTdLUfHuBFjD24
   x4QRxu3Jvvmc0YkLRr27K5K/DHizWAiCZQrg9NFZR2BAA/tl1Zy/G+4rd
   yB+lywMl+zh/jf7NSR/slIK0BSDGacb/gcg3Xhe+awhpGQ7z/gP/FVnj1
   A==;
X-CSE-ConnectionGUID: NfbdRmXRRnKp7JgFQk8wQA==
X-CSE-MsgGUID: QZ3h44G1TDuOoPVduzOVHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3557122"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3557122"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 05:21:52 -0800
X-CSE-ConnectionGUID: 8xqn7rqTQ1OJGY3Pg74vNQ==
X-CSE-MsgGUID: 4al2QaAmTDib/WaAI+dhsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9836320"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 17 Nov 2026 05:21:51 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTJ88-0000000037a-2Fzi;
	Tue, 17 Nov 2026 13:21:48 +0000
Date: Tue, 17 Nov 2026 14:21:32 +0100
From: kernel test robot <lkp@intel.com>
To: sofus <sofus.c@icloud.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 12/96]
 drivers/media/platform/apple/avd/avd-av1.c:115:33: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <20261117142009.7LtzghJo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   41eeb3a08926fbe6037568be57148a360190fbe6
commit: af81002d6674818b48f855da796c69b52322b45a [12/96] media: apple: avd: add av1 support
config: loongarch-randconfig-r2108-20261117 (https://download.01.org/0day-ci/archive/20261117/20261117142009.7LtzghJo-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117142009.7LtzghJo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261117142009.7LtzghJo-lkp@intel.com/

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
