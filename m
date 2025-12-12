Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFC5314A9F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 09:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765532634; cv=none; b=q22XVA/rQCdngHSRMrU/NbCdXFDoZup501Je2hKhVaxpd5dq1YsJ2ZfYXyNTDaZ1sI5C2BUDfOP6RXo6+ETu1c62c034ETEeXBTzgkq9ALcXCWeLSXCc0Hv19JHmp9r+Ha2x1ZB9LiZMjtIwSkR3HM1odSyE4Qb4+ZS8dIUvBkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765532634; c=relaxed/simple;
	bh=vK6ve3ORyJjvjbINwd2v4gLZrZCBznPmG89C9/UqcSc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gp2W4/M7aaHggs1Um2b0rPFpJMdOJsf7Z5SXEe1byeEZ+nk59g+PUYuvLqyCVjU7ifDgmQC9WXNndEtHQgIXgmxXiAZHbfKYnVNpLrLcS5Wx6+mX5RURrY5dhpVjPS3VZeJvKujJkXGJjiExrFFdFGIH/chTC1FICvqBQg1+KxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JMev49qq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JMev49qq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765532631; x=1797068631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vK6ve3ORyJjvjbINwd2v4gLZrZCBznPmG89C9/UqcSc=;
  b=JMev49qqdCck6OQekpSQG3hp/4SoKB9+X1twG0ec+J7EvP85swsJ55Mm
   3dSuTXlfpSJ//3AtgJLgF73b61dCKyc6J8jZiSq4z67VI7lWIPZwj5RLg
   Zud+L4j18tFOoPKanfUNKjVipUNGYgeLVzba4DReDNjmfNaCXY+nv5pm2
   DKnx/ltqvqhhAhdWPuuBGBLTB9q8TlZ/usmf8KyK6s1RZCy0b5VIcxU/M
   P5W+ty+T8E4nxz5AMILdk2ucmMo0pgoBfmVs8tz9YrPIBVJ7u9AdmnnE2
   voDj1BVgqBZGxGVGAljVuK4RxIBQlgS0kqHqTFG4Fr+Ml1t7lAxvIvcPX
   w==;
X-CSE-ConnectionGUID: IfHvYGA7QqC4VGMkCO8IeQ==
X-CSE-MsgGUID: S89HalvSSvqjcB21MjwkLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71390868"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="71390868"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 01:43:45 -0800
X-CSE-ConnectionGUID: VQBwHgubQS6NsTKCaOtJtw==
X-CSE-MsgGUID: mmUAkF88Q+uA/WIfaxL3Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="234441073"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Dec 2025 01:43:44 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTzgb-000000005sw-3kaG;
	Fri, 12 Dec 2025 09:43:41 +0000
Date: Fri, 12 Dec 2025 17:43:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dave Airlie <airlied@redhat.com>, Timur Tabi <ttabi@nvidia.com>
Subject: drivers/gpu/drm/nouveau/dispnv50/crcca7d.c:28:17: sparse: sparse:
 cast removes address space '__iomem' of expression
Message-ID: <202512121711.NSEwoa9G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 6cc6e08d4542473d79ea83d9123d9d35e9c01c92 drm/nouveau/kms: add support for GB20x
date:   7 months ago
config: i386-randconfig-061-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121711.NSEwoa9G-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121711.NSEwoa9G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121711.NSEwoa9G-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/nouveau/dispnv50/crcca7d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/dispnv50/crcca7d.c:28:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/crcca7d.c:28:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/crcca7d.c:28:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcca7d.c:35:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcca7d.c:35:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcca7d.c:55:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcca7d.c:55:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcca7d.c:79:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcca7d.c:79:9: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +28 drivers/gpu/drm/nouveau/dispnv50/crcca7d.c

    12	
    13	static int
    14	crcca7d_set_ctx(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx)
    15	{
    16		struct nvif_push *push = &head->disp->core->chan.push;
    17		const int i = head->base.index;
    18		int ret;
    19	
    20		ret = PUSH_WAIT(push, ctx ? 3 : 2);
    21		if (ret)
    22			return ret;
    23	
    24		if (ctx) {
    25			const u32 crc_hi = upper_32_bits(ctx->mem.addr);
    26			const u32 crc_lo = lower_32_bits(ctx->mem.addr);
    27	
  > 28			PUSH_MTHD(push, NVCA7D, HEAD_SET_SURFACE_ADDRESS_HI_CRC(i), crc_hi,
    29	
    30						HEAD_SET_SURFACE_ADDRESS_LO_CRC(i),
    31				  NVVAL(NVCA7D, HEAD_SET_SURFACE_ADDRESS_LO_CRC, ADDRESS_LO, crc_lo >> 4) |
    32				  NVDEF(NVCA7D, HEAD_SET_SURFACE_ADDRESS_LO_CRC, TARGET, PHYSICAL_NVM) |
    33				  NVDEF(NVCA7D, HEAD_SET_SURFACE_ADDRESS_LO_CRC, ENABLE, ENABLE));
    34		} else {
    35			PUSH_MTHD(push, NVCA7D, HEAD_SET_SURFACE_ADDRESS_LO_CRC(i),
    36				  NVDEF(NVCA7D, HEAD_SET_SURFACE_ADDRESS_LO_CRC, ENABLE, DISABLE));
    37		}
    38	
    39		return 0;
    40	}
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
