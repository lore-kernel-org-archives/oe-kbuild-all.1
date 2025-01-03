Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F271F8F1C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 11:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735903257; cv=none; b=bGR3L1ksFMV3kayrckZT41jFQefypznFRvaFciOM/N3r+C2tIuhs8fOPEqmkxcVdlfz2TGN94eJBr70aMUU/9JUsofAj5zyOs433dDshgpWMlcPVP+AsiL7h9zMlhtOSscfIBvIrms2N6VrfjBHyNnjrW3avuDhJX0yYWONy+MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735903257; c=relaxed/simple;
	bh=cvf5dJQYR4jOgCfNPZS/M8/kQMJ2U+K+lWTUa6xgYMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R/hzHwEBcJAxjDxcz90vxZvYdHSRGiXzQ1WUVQvWw8wsglexnX5PMixtxbiyGYliAxj771juZVsay3af2+RSq/4AfoyeXyoPzuw6uGYeDBqWgzDs7y/mbejXTJ0Z7VHeeS+2nu/MG/glzPcdYUXbaCwoJoiPjVeg/Mo1zA83rWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JTZQJ5Gx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JTZQJ5Gx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735903257; x=1767439257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cvf5dJQYR4jOgCfNPZS/M8/kQMJ2U+K+lWTUa6xgYMc=;
  b=JTZQJ5GxWwvQ/xCSy0FgR0dGtIMI1hXup7zbR1niXS5cz5fskSSC237x
   CHcy/pEYGXSymGviAFFErS6llyH3Zlzn/im38Tmd3JOYH91iz3vWIWqft
   cB02Bq1HsmTDTjWJQ7vvwlEdvGFaTcVC7TI3MnzMSV2GfYAE6TG498jSd
   CHyuSpe66Pifu8T0WU6cRzXO6NNkLTtSmHnLyE5NJ5/W/T41NpI8nQsdI
   9AMwD9uYhxGbc/hnobcKNqA4/kciz4br2u+Xlv6Fc+v6DJVYoI8wbBKRJ
   r5qlVn1GDWgO1tgqN5nK7SQ+yF613HFgexuzcsGUJYxk0lKnCdzJohJXM
   g==;
X-CSE-ConnectionGUID: aADDuwGXTea4CW+G5V5vNw==
X-CSE-MsgGUID: z5W0mIL7TyG9YtQGyGDzag==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="35852881"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="35852881"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 03:20:56 -0800
X-CSE-ConnectionGUID: NNp447thQka+wFv6BkF9Ow==
X-CSE-MsgGUID: hJ06fZPjSJyiNrVWssuVEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106821906"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Jan 2025 03:20:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTfjY-0009eo-1d;
	Fri, 03 Jan 2025 11:20:52 +0000
Date: Fri, 3 Jan 2025 19:20:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1693/1693]
 drivers/gpu/drm/loongson/ast_old/ast_mode.c:746:19: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202501031900.rHaRpOIu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   604e996dd0189ddb0875f389b87fa2084b3a9424
commit: 2815e6db6a7a2f0759dfc574e28b3b807a1a3377 [1693/1693] drm/loongson: use old version of ast driver for LoongArch platform
config: loongarch-randconfig-r112-20250103 (https://download.01.org/0day-ci/archive/20250103/202501031900.rHaRpOIu-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250103/202501031900.rHaRpOIu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031900.rHaRpOIu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/loongson/ast_old/ast_mode.c:746:19: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/loongson/ast_old/ast_mode.c:746:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *dstxor @@     got unsigned char [usertype] * @@
   drivers/gpu/drm/loongson/ast_old/ast_mode.c:746:16: sparse:     expected unsigned char [noderef] [usertype] __iomem *dstxor
   drivers/gpu/drm/loongson/ast_old/ast_mode.c:746:16: sparse:     got unsigned char [usertype] *
   drivers/gpu/drm/loongson/ast_old/ast_mode.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1136:16: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'

vim +/__iomem +746 drivers/gpu/drm/loongson/ast_old/ast_mode.c

   719	
   720	/*
   721	 * Cursor plane
   722	 */
   723	
   724	static void ast_update_cursor_image(u8 __iomem *dst, const u8 *src, int width,
   725					    int height)
   726	{
   727		union {
   728			u32 ul;
   729			u8 b[4];
   730		} srcdata32[2], data32;
   731		union {
   732			u16 us;
   733			u8 b[2];
   734		} data16;
   735		u32 csum = 0;
   736		s32 alpha_dst_delta, last_alpha_dst_delta;
   737		u8 __iomem *dstxor;
   738		const u8 *srcxor;
   739		int i, j;
   740		u32 per_pixel_copy, two_pixel_copy;
   741	
   742		alpha_dst_delta = AST_MAX_HWC_WIDTH << 1;
   743		last_alpha_dst_delta = alpha_dst_delta - (width << 1);
   744	
   745		srcxor = src;
 > 746		dstxor = (u8 *)dst + last_alpha_dst_delta +
   747			 (AST_MAX_HWC_HEIGHT - height) * alpha_dst_delta;
   748		per_pixel_copy = width & 1;
   749		two_pixel_copy = width >> 1;
   750	
   751		for (j = 0; j < height; j++) {
   752			for (i = 0; i < two_pixel_copy; i++) {
   753				srcdata32[0].ul = *((u32 *)srcxor) & 0xf0f0f0f0;
   754				srcdata32[1].ul = *((u32 *)(srcxor + 4)) & 0xf0f0f0f0;
   755				data32.b[0] = srcdata32[0].b[1] |
   756					      (srcdata32[0].b[0] >> 4);
   757				data32.b[1] = srcdata32[0].b[3] |
   758					      (srcdata32[0].b[2] >> 4);
   759				data32.b[2] = srcdata32[1].b[1] |
   760					      (srcdata32[1].b[0] >> 4);
   761				data32.b[3] = srcdata32[1].b[3] |
   762					      (srcdata32[1].b[2] >> 4);
   763	
   764				writel(data32.ul, dstxor);
   765				csum += data32.ul;
   766	
   767				dstxor += 4;
   768				srcxor += 8;
   769			}
   770	
   771			for (i = 0; i < per_pixel_copy; i++) {
   772				srcdata32[0].ul = *((u32 *)srcxor) & 0xf0f0f0f0;
   773				data16.b[0] = srcdata32[0].b[1] |
   774					      (srcdata32[0].b[0] >> 4);
   775				data16.b[1] = srcdata32[0].b[3] |
   776					      (srcdata32[0].b[2] >> 4);
   777				writew(data16.us, dstxor);
   778				csum += (u32)data16.us;
   779	
   780				dstxor += 2;
   781				srcxor += 4;
   782			}
   783			dstxor += last_alpha_dst_delta;
   784		}
   785	
   786		/* write checksum + signature */
   787		dst += AST_HWC_SIZE;
   788		writel(csum, dst);
   789		writel(width, dst + AST_HWC_SIGNATURE_SizeX);
   790		writel(height, dst + AST_HWC_SIGNATURE_SizeY);
   791		writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTX);
   792		writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTY);
   793	}
   794	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
