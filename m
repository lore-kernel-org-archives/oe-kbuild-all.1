Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3191E1E12
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 12:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768566546; cv=none; b=UAk5xMxf6jVXxKedYKYvWxRUOJqZnXr0qggEc7js48wqEykJ13niXhHlUvrEdjxGwaxD6t2jxw7qsSrfflZlSXFGgF0smIU4N1X0+nmXnyrfuxIISoQSHSan+i9hsa/s8JL3D6cuNw3f+WdQaXzaeHczf46cB+bqVJM6cP3ABVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768566546; c=relaxed/simple;
	bh=xIkARKTod9qZwlj6+ZHBfVoXvPCD9YxddqjOflszluU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KYfFziC8mbAfyXRzGCcQxoTpD0Tlwn5qjJ8DKI8G95mL89P0b2E7js2miU77A3fK6sNe44QdRIWnv2wjYZ53xphhFTWglVMdZB30CMmlr0q7oY1RTxgpoifkDodKOseNglXXAzmMC/NXdlQCZq0A7wvaQO06em6ion6pc+1J3M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aMQS2Xu4; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aMQS2Xu4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768566543; x=1800102543;
  h=date:from:to:cc:subject:message-id;
  bh=xIkARKTod9qZwlj6+ZHBfVoXvPCD9YxddqjOflszluU=;
  b=aMQS2Xu4tJtQWBfObdpsjt8PXrUOtUtZ9beO1xsqdp+EcUDMoZM/QkLk
   Y74OPSYEoTE9oPLKsZ7ExKDS0no6hChIYVR7dAt3NbmTY5BUQBD0wM/3j
   qIYHq39cc70cUaHzPWZgb0XMjkKVW0LhdX/RaaqqGz+ys0on2htVhvlWE
   z4nkyIrFEz0yRtEcrdifTp0Day8DeD+ElALyui5/v8Vgev6SW4zIcIePQ
   PS80d6xEUASjL6RMraNkVbz5BoDcEzv3Gpp4hT6O6GJ2HDaaY24EDLznE
   1BST6qBwklTmlq5OEQ4xz68ik6fEnJtnaGVCnDcFV5mEJcAhyFOYK6hMl
   A==;
X-CSE-ConnectionGUID: 0lRpdFjaQfGkDZP4rRF6Qg==
X-CSE-MsgGUID: KeryQ47xT/CBAgTWFuiLvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="68889857"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="68889857"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:29:01 -0800
X-CSE-ConnectionGUID: 3kDEdd/JRTqju5f9gqQu6w==
X-CSE-MsgGUID: 0ARiPR4qTVWC6HlQ4BbgFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="204384771"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Jan 2026 04:28:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgiwi-00000000KpK-0ayI;
	Fri, 16 Jan 2026 12:28:56 +0000
Date: Fri, 16 Jan 2026 20:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Timur Tabi <ttabi@nvidia.com>
Subject: drivers/gpu/drm/nouveau/dispnv50/crcca7d.c:28:17: sparse:
 sparse: cast removes address space '__iomem' of expression
Message-ID: <202601162023.AzRe6Ekz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   983d014aafb14ee5e4915465bf8948e8f3a723b5
commit: 6cc6e08d4542473d79ea83d9123d9d35e9c01c92 drm/nouveau/kms: add support for GB20x
date:   8 months ago
config: x86_64-randconfig-121-20260113 (https://download.01.org/0day-ci/archive/20260116/202601162023.AzRe6Ekz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601162023.AzRe6Ekz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601162023.AzRe6Ekz-lkp@intel.com/

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
