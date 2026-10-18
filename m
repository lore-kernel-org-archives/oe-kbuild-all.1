Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904A01BD9D0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 03:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792294253; cv=none; b=hM1Pp8gnEetVU8qLxd3LxZLTPgWOjfG0K7R5kzy0iuftcnK4C5vnrWSqH5r2zWN1AUyIeDpSYeR3ouSCDnRKd0nL8pVHFveOJpq9yPYchVNZDNzKJ72bd3GO8VesHd9dJdh2LxSPTHa0yrkjbqJ/8Lo/f06Dr6uY7J7VhokTNAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792294253; c=relaxed/simple;
	bh=Ti4A3f1x5/jXtidbuCmgHHl4Wt3q8CS1wt6p+AXhN3Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a8qJWmyXwWY+HxoCq4C4arIQOeWhhDCP/yihUGOYqxtWHM9ThaMYu8V+fyVmi5XCKzI82tJJs0S5A81NH/X97DhPisXV7w32G+GFzXz1fU32gjSUzhe/qFbw4sIhMqw6EEUAGLhtUY0aKVYcBbAU4ElWDAepek9c/Vlc/RlNVug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/FJboBq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/FJboBq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792294252; x=1823830252;
  h=date:from:to:cc:subject:message-id;
  bh=Ti4A3f1x5/jXtidbuCmgHHl4Wt3q8CS1wt6p+AXhN3Y=;
  b=C/FJboBq7jczaLIqdacNxfLQDFueTlB+WWWxgUd6t2c2Gu9ApkvvfDSb
   E4lVQ5+EEulUk21Jy7A3tok9RAD7nVDEWSN9aZzDfXsNVg/OeP0fpT1bA
   +eIvFdtjACpli3Ibgt0Ol9CxHfDOMvpVwrI9ObSY4vK8FkeBrCa5McU4S
   x6D1K5JKvK4y4TEHUsmAHRMWj88tvwrfhW6L/bwJmKi5Ulo7sTw4SCxyN
   jgEgLe0S01m9CmBOfHlbEDNzAbciO22X8Z0hnsJTjUvPrwtFXC3EmBUVo
   GYHwMglxJOl0i3Fy+mrwSdhgpzycUIDZf2vZwvwaxveJP12d6WMhNOlLu
   Q==;
X-CSE-ConnectionGUID: /aDyqABiQjCK5eqHUFwJoA==
X-CSE-MsgGUID: uNyNj0VqS0+c6gEI+WEe0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="1039159"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="1039159"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 20:30:52 -0700
X-CSE-ConnectionGUID: nrj4AeAAR++DJ1wF7iSbgQ==
X-CSE-MsgGUID: RE8Oh15ETXWauqavWL+mRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2311077"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Oct 2026 20:30:51 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIHbk-00000000K2Q-0iDX;
	Sun, 18 Oct 2026 03:30:48 +0000
Date: Sun, 18 Oct 2026 11:30:38 +0800
From: kernel test robot <lkp@intel.com>
To: sofus <sofus.c@icloud.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 64/92]
 drivers/media/platform/apple/avd/avd-av1.c:115:33: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <202610181127.t647M50g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   c792edd0ffb515a81db3e039bc6e2a611c51d65b
commit: dc36ed8c5961b2c2cfb9d6badfd6fc8877d347b6 [64/92] media: apple: avd: add av1 support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20261018/202610181127.t647M50g-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610181127.t647M50g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610181127.t647M50g-lkp@intel.com/

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
