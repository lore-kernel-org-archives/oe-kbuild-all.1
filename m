Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B5F56479
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 21:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705698559; cv=none; b=i6TYkpXpMqMEdpdm+l2cdzcMCCggm52pHR/leAXH2ZS3wGFAB/BmHbLLGiuPMTrAXHVc2Fv8odo9bsaBypKv42Hq3myWh8EDr+AJADI4fytn5CLm2qaAUVZrXhxCd7GSQvxLG6lM3Tlz6K35a/8+5WSTOVrTBZBuFV3u4s5RRl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705698559; c=relaxed/simple;
	bh=19i+hznCTUpS2rHMOuddJ6hWZyeAnR+nNGD7dYlLdtw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SLbxkFT4NHkDGOywCcLPgu5dQ+pnzadit2EHkSTO4OJ1Gee7KiAoNDcjp1W+YDvNMTNTTCAfBsMEa2NFjhVvarfC+L9+zr69o8ybaCKdTwtjblJcRMemt5ZrgzzGRglIRa8eBSkK6JbiKUBULzeYZRDnvhg5jXp66Khtis2h4go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8Wcc9xq; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8Wcc9xq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705698557; x=1737234557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=19i+hznCTUpS2rHMOuddJ6hWZyeAnR+nNGD7dYlLdtw=;
  b=I8Wcc9xqoHqT+oLFbDu0QLtP4n4wu+YcZTkB9Xyttmeps+kScIWwNBJj
   xc93p31+nSHvRsSW1FRhFBdRHVVw5J0c4C6CMIQe7d2J7Bcqkw7A8JaRu
   PGBBlJBz1aI/MIRt/wJZIAurxLZtBR/ZwjaJVqzCs5Kt59EHL2v6BzMxw
   1Hbw34j0nuN3xO68VyGrFMN6DPBQafdRacJarD/O8WU/TsBjLqIQ+mnog
   grOC6bkm8NMN4z+1NpO8JvGu6yIIU7/jVSDnS8G684qZGzPzPsLRt9vK1
   L+GBZQ+kmhq3bKagRDeqGRTYb4gN8b/fY5u18CAnf/ev90o7Gz/yNHKog
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="404607639"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="404607639"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 13:09:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="670030"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Jan 2024 13:09:15 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQw6z-0004Qa-0W;
	Fri, 19 Jan 2024 21:09:13 +0000
Date: Sat, 20 Jan 2024 05:09:06 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:radxa-zero-linux-5.10.y 36/43]
 drivers/staging/media/meson/vdec/vdec_platform.c:272:17: error: expected
 parameter declarator
Message-ID: <202401200533.vS79tJoE-lkp@intel.com>
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240120/202401200533.vS79tJoE-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d92ce344bf641e6bb025b41b3f1a77dd25e2b3e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200533.vS79tJoE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401200533.vS79tJoE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/media/meson/vdec/vdec_platform.c:272:17: error: expected parameter declarator
     272 | MODULE_FIRMWARE("meson/vdec/g12a_h264.bin");
         |                 ^
>> drivers/staging/media/meson/vdec/vdec_platform.c:272:17: error: expected ')'
   drivers/staging/media/meson/vdec/vdec_platform.c:272:16: note: to match this '('
     272 | MODULE_FIRMWARE("meson/vdec/g12a_h264.bin");
         |                ^
>> drivers/staging/media/meson/vdec/vdec_platform.c:272:1: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
     272 | MODULE_FIRMWARE("meson/vdec/g12a_h264.bin");
         | ^
         | int
>> drivers/staging/media/meson/vdec/vdec_platform.c:272:16: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
     272 | MODULE_FIRMWARE("meson/vdec/g12a_h264.bin");
         |                ^                          
         |                                           void
   drivers/staging/media/meson/vdec/vdec_platform.c:273:17: error: expected parameter declarator
     273 | MODULE_FIRMWARE("meson/vdec/g12a_vp9.bin");
         |                 ^
   drivers/staging/media/meson/vdec/vdec_platform.c:273:17: error: expected ')'
   drivers/staging/media/meson/vdec/vdec_platform.c:273:16: note: to match this '('
     273 | MODULE_FIRMWARE("meson/vdec/g12a_vp9.bin");
         |                ^
   drivers/staging/media/meson/vdec/vdec_platform.c:273:1: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
     273 | MODULE_FIRMWARE("meson/vdec/g12a_vp9.bin");
         | ^
         | int
   drivers/staging/media/meson/vdec/vdec_platform.c:273:16: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
     273 | MODULE_FIRMWARE("meson/vdec/g12a_vp9.bin");
         |                ^                         
         |                                          void
   drivers/staging/media/meson/vdec/vdec_platform.c:274:17: error: expected parameter declarator
     274 | MODULE_FIRMWARE("meson/vdec/gxbb_h264.bin");
         |                 ^
   drivers/staging/media/meson/vdec/vdec_platform.c:274:17: error: expected ')'
   drivers/staging/media/meson/vdec/vdec_platform.c:274:16: note: to match this '('
     274 | MODULE_FIRMWARE("meson/vdec/gxbb_h264.bin");
         |                ^
   drivers/staging/media/meson/vdec/vdec_platform.c:274:1: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
     274 | MODULE_FIRMWARE("meson/vdec/gxbb_h264.bin");
         | ^
         | int
   drivers/staging/media/meson/vdec/vdec_platform.c:274:16: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
     274 | MODULE_FIRMWARE("meson/vdec/gxbb_h264.bin");
         |                ^                          
         |                                           void
   drivers/staging/media/meson/vdec/vdec_platform.c:275:17: error: expected parameter declarator
     275 | MODULE_FIRMWARE("meson/vdec/gxl_h264.bin");
         |                 ^
   drivers/staging/media/meson/vdec/vdec_platform.c:275:17: error: expected ')'
   drivers/staging/media/meson/vdec/vdec_platform.c:275:16: note: to match this '('
     275 | MODULE_FIRMWARE("meson/vdec/gxl_h264.bin");
         |                ^
   drivers/staging/media/meson/vdec/vdec_platform.c:275:1: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
     275 | MODULE_FIRMWARE("meson/vdec/gxl_h264.bin");
         | ^
         | int
   drivers/staging/media/meson/vdec/vdec_platform.c:275:16: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
     275 | MODULE_FIRMWARE("meson/vdec/gxl_h264.bin");
         |                ^                         
         |                                          void
   drivers/staging/media/meson/vdec/vdec_platform.c:276:17: error: expected parameter declarator
     276 | MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
         |                 ^
   drivers/staging/media/meson/vdec/vdec_platform.c:276:17: error: expected ')'
   drivers/staging/media/meson/vdec/vdec_platform.c:276:16: note: to match this '('
     276 | MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
         |                ^
   drivers/staging/media/meson/vdec/vdec_platform.c:276:1: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
     276 | MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
         | ^
         | int
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +272 drivers/staging/media/meson/vdec/vdec_platform.c

   271	
 > 272	MODULE_FIRMWARE("meson/vdec/g12a_h264.bin");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
