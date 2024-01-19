Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A521F60B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 17:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705685234; cv=none; b=NolGNLzf0HWN1KtSGTxtBNX+GNA34H2mfJh9tZTLuskUs4BSHDragDfA5Hy10ywqMWFhQeobNDF9RoQFctsT8RmnmAoW6Qq4K/JJQeMr8Jc/h3IWMy+GTLQXLuPYrhp+dtAvlD6CnqtzgFY0OMUynZPQXSUO7bXRASvkNg8rcJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705685234; c=relaxed/simple;
	bh=ApSvgK8LzDd6QgPkTgJ+nO+YUFetHWruyq9qk2BW3Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rj67Bm2pfK05357P7gMXZcP62kOuqJOzVdZ9kX9t9sUtV1HIrA9S4OQmWO5jslW1+Dho54UUzzNynZC3if4L0TdFvUPw6YzHj94LQV53nvvht1pxXM76Braa866BSKII3E2HQ+eCBUhEM+6UlJACHPmsgqyIMmO4XA7rxy9Ym+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g44Pf8RX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g44Pf8RX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705685232; x=1737221232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ApSvgK8LzDd6QgPkTgJ+nO+YUFetHWruyq9qk2BW3Yo=;
  b=g44Pf8RX/yn7AzpGILQRO20IVgZKcx+k7dCe/sEwSrWDCQJilDgzSThh
   Ok1tlrRlDe/iREj/jHseQXlGFwWXdJIjzWtfKc7wMmEBlkWssaB29KkA7
   Rronu1gnZVJolonbb6eXxBjW0TL6y8JTwMlXjzJPo6jtFfEFHj9xikpTB
   6fNSDwZqB5vgdfji0sta4Nhnr8TcddX6d6V4sPQgfGnWOnxHaqwR6s6MC
   VdJJzfiDj/m7C/E8LWEwuE/uVylEIIhBmevn8zzB20tGQi+8M9O0QTrYh
   wKiR7DIIIeBWae5b5r08tb4cX8d0wJRlrhNanR9k/8GZ9uTGT6SKqQsNu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="7488088"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="7488088"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 09:27:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="707481"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Jan 2024 09:27:11 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQse4-0004JO-37;
	Fri, 19 Jan 2024 17:27:08 +0000
Date: Sat, 20 Jan 2024 01:27:00 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:radxa-zero-linux-5.10.y 36/43]
 drivers/staging/media/meson/vdec/vdec_platform.c:272:17: error: expected
 declaration specifiers or '...' before string constant
Message-ID: <202401200106.kmJuCWd0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux radxa-zero-linux-5.10.y
head:   b463d9bf73277bb295f7353ac6502dd6d03f73c1
commit: a4a7adb288d2737ec7a3ba5e5167986492947fed [36/43] media: meson: vdec: Add MODULE_FIRMWARE macro
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240120/202401200106.kmJuCWd0-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200106.kmJuCWd0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401200106.kmJuCWd0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/media/meson/vdec/vdec_platform.c:272:17: error: expected declaration specifiers or '...' before string constant
     272 | MODULE_FIRMWARE("meson/vdec/g12a_h264.bin");
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/vdec_platform.c:273:17: error: expected declaration specifiers or '...' before string constant
     273 | MODULE_FIRMWARE("meson/vdec/g12a_vp9.bin");
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/vdec_platform.c:274:17: error: expected declaration specifiers or '...' before string constant
     274 | MODULE_FIRMWARE("meson/vdec/gxbb_h264.bin");
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/vdec_platform.c:275:17: error: expected declaration specifiers or '...' before string constant
     275 | MODULE_FIRMWARE("meson/vdec/gxl_h264.bin");
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/vdec_platform.c:276:17: error: expected declaration specifiers or '...' before string constant
     276 | MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/vdec_platform.c:277:17: error: expected declaration specifiers or '...' before string constant
     277 | MODULE_FIRMWARE("meson/vdec/gxl_vp9.bin");
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/vdec_platform.c:278:17: error: expected declaration specifiers or '...' before string constant
     278 | MODULE_FIRMWARE("meson/vdec/gxm_h264.bin");
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/vdec_platform.c:279:17: error: expected declaration specifiers or '...' before string constant
     279 | MODULE_FIRMWARE("meson/vdec/sm1_vp9_mmu.bin");
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +272 drivers/staging/media/meson/vdec/vdec_platform.c

   271	
 > 272	MODULE_FIRMWARE("meson/vdec/g12a_h264.bin");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
