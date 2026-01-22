Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ABB314D06
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 07:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769067173; cv=none; b=A0vBb0/RFfx50+QxZ+/SZ+5P+lGKeCN3Lg+5hGnVxAYOmYo40o4tOXzE2AkdJMJkslsnva0MRfwoJe6lI4BpejKHj/ZDy/L8VpST83yZX9MkvwYCpxIuYoOEhmrgA7O0N7OHgAHHif/NlpLkJqFxlgzsBpz8bIOToSl7DtVGeps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769067173; c=relaxed/simple;
	bh=xSV7HUJvzJGEUuMQZn1Z4tjNGwv5BT3Bx+hop6FE5QI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DBFcw/0friQw953h7u9wjbVgTmy3LNGmSXhbeaWKHJa2+NB4lVx93K3e9UbIeSG2CvBLssvHjJ0kLEkkKnr/TE9g4FPVV6Ms8IChyKoaRJj+nsTQ02Nw0NEcYVHPf4yOAgqpGmZosOSurD/42Auwx7GSW5Dek7oD1ve3MMKkv+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1Asu4CN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1Asu4CN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769067169; x=1800603169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xSV7HUJvzJGEUuMQZn1Z4tjNGwv5BT3Bx+hop6FE5QI=;
  b=a1Asu4CN0dEaEBV2eKVlXJfR4g0xVUKE1wauiTpXYFCHKUhAyrFMZBfQ
   cvFCzQnunUMfucALQFYpYYaNxarfV3fSrePsm4UMOUGzKEPWFXCIUvg0d
   NKdNOYUPxExfMbBBX0HI0QssPkXSAy1Ytt3u/GOKQ191uyVysLvOpkb2g
   UkBUpEnbgwloH4dtGo2pC89MBBLU+47PnG92KMHpso/M0KLGtBgcQMWb7
   OVQ9yLmEMHQQ/7ejRmrU17K+/U7qrpDzBWHAILG6wUNIuEO/Yk/OpW5TJ
   cUWVyFpEa++5S2dlUMCT+Ab550oEdFOoEtGlsBXoyIkfSpW8x/8B+xrAS
   g==;
X-CSE-ConnectionGUID: SRLqzstVQh2l0h0iGVjpcA==
X-CSE-MsgGUID: DcZ2REyQTwWxkGGIvKl2Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81675996"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="81675996"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 23:32:45 -0800
X-CSE-ConnectionGUID: auH/yIykQL6YtvYkeDsSeQ==
X-CSE-MsgGUID: CakCl2JtRGO2iArUt6NoZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="206478668"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Jan 2026 23:32:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vipBI-00000000SYb-2LRS;
	Thu, 22 Jan 2026 07:32:40 +0000
Date: Thu, 22 Jan 2026 15:31:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 David Gow <davidgow@google.com>
Subject: drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202601221514.Fm7yxAFX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Thomas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cf38b2340c0e60ef695b7137440a4d187ed49c88
commit: 031cdd3bc3f369553933c1b0f4cb18000162c8ff kunit: Enable PCI on UML without triggering WARN()
date:   4 months ago
config: um-randconfig-r123-20260120 (https://download.01.org/0day-ci/archive/20260122/202601221514.Fm7yxAFX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221514.Fm7yxAFX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221514.Fm7yxAFX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *kptr @@
   drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35: sparse:     got void *kptr
>> drivers/gpu/drm/loongson/lsdc_benchmark.c:42:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *kptr @@
   drivers/gpu/drm/loongson/lsdc_benchmark.c:42:51: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/loongson/lsdc_benchmark.c:42:51: sparse:     got void *kptr

vim +27 drivers/gpu/drm/loongson/lsdc_benchmark.c

f39db26c54281d Sui Jingfeng 2023-06-15  12  
f39db26c54281d Sui Jingfeng 2023-06-15  13  typedef void (*lsdc_copy_proc_t)(struct lsdc_bo *src_bo,
f39db26c54281d Sui Jingfeng 2023-06-15  14  				 struct lsdc_bo *dst_bo,
f39db26c54281d Sui Jingfeng 2023-06-15  15  				 unsigned int size,
f39db26c54281d Sui Jingfeng 2023-06-15  16  				 int n);
f39db26c54281d Sui Jingfeng 2023-06-15  17  
f39db26c54281d Sui Jingfeng 2023-06-15  18  static void lsdc_copy_gtt_to_vram_cpu(struct lsdc_bo *src_bo,
f39db26c54281d Sui Jingfeng 2023-06-15  19  				      struct lsdc_bo *dst_bo,
f39db26c54281d Sui Jingfeng 2023-06-15  20  				      unsigned int size,
f39db26c54281d Sui Jingfeng 2023-06-15  21  				      int n)
f39db26c54281d Sui Jingfeng 2023-06-15  22  {
f39db26c54281d Sui Jingfeng 2023-06-15  23  	lsdc_bo_kmap(src_bo);
f39db26c54281d Sui Jingfeng 2023-06-15  24  	lsdc_bo_kmap(dst_bo);
f39db26c54281d Sui Jingfeng 2023-06-15  25  
f39db26c54281d Sui Jingfeng 2023-06-15  26  	while (n--)
f39db26c54281d Sui Jingfeng 2023-06-15 @27  		memcpy_toio(dst_bo->kptr, src_bo->kptr, size);
f39db26c54281d Sui Jingfeng 2023-06-15  28  
f39db26c54281d Sui Jingfeng 2023-06-15  29  	lsdc_bo_kunmap(src_bo);
f39db26c54281d Sui Jingfeng 2023-06-15  30  	lsdc_bo_kunmap(dst_bo);
f39db26c54281d Sui Jingfeng 2023-06-15  31  }
f39db26c54281d Sui Jingfeng 2023-06-15  32  
f39db26c54281d Sui Jingfeng 2023-06-15  33  static void lsdc_copy_vram_to_gtt_cpu(struct lsdc_bo *src_bo,
f39db26c54281d Sui Jingfeng 2023-06-15  34  				      struct lsdc_bo *dst_bo,
f39db26c54281d Sui Jingfeng 2023-06-15  35  				      unsigned int size,
f39db26c54281d Sui Jingfeng 2023-06-15  36  				      int n)
f39db26c54281d Sui Jingfeng 2023-06-15  37  {
f39db26c54281d Sui Jingfeng 2023-06-15  38  	lsdc_bo_kmap(src_bo);
f39db26c54281d Sui Jingfeng 2023-06-15  39  	lsdc_bo_kmap(dst_bo);
f39db26c54281d Sui Jingfeng 2023-06-15  40  
f39db26c54281d Sui Jingfeng 2023-06-15  41  	while (n--)
f39db26c54281d Sui Jingfeng 2023-06-15 @42  		memcpy_fromio(dst_bo->kptr, src_bo->kptr, size);
f39db26c54281d Sui Jingfeng 2023-06-15  43  
f39db26c54281d Sui Jingfeng 2023-06-15  44  	lsdc_bo_kunmap(src_bo);
f39db26c54281d Sui Jingfeng 2023-06-15  45  	lsdc_bo_kunmap(dst_bo);
f39db26c54281d Sui Jingfeng 2023-06-15  46  }
f39db26c54281d Sui Jingfeng 2023-06-15  47  

:::::: The code at line 27 was first introduced by commit
:::::: f39db26c54281da6a785259498ca74b5e470476f drm: Add kms driver for loongson display controller

:::::: TO: Sui Jingfeng <suijingfeng@loongson.cn>
:::::: CC: Sui Jingfeng <suijingfeng@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
