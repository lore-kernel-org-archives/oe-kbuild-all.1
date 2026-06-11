Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2803D331EDA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 19:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781207206; cv=none; b=o0SvVPEiTNCN1Hgb/sab/PXCoHKLFu5fsTmrrB5+By78G7Ddc7I8GFipFhUMw0Sr7VzjUBqKe+QpiB4z69fjCH71LJQopRsT4fl8lhIpJSVRs0cvspOLR7fWvb/wew0lWV43tOtvC6P9hGuNKaq/kHIRKdLXl9htXEvrdG5b2yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781207206; c=relaxed/simple;
	bh=ywHamn2ko0IkK+9fF+aJg9ZM1yYT8PPHIj7T6JyTEcg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PniOpLTBixntaes6UgYMphLKRq/f5ioS12JZeWFStpZXpX18O7j9+PMbUPZ8bzc5R4ZYl6akuIsMmALQpXeY6kPbLysDiA1O4cCD7b+8r7rxjKw4mkeQbpgxD7wyXg8frupV7ykQNLxOsQvxlTy814FZKrqR01o6n+Gp9xJZgrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZf/WfPW; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZf/WfPW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781207203; x=1812743203;
  h=date:from:to:cc:subject:message-id;
  bh=ywHamn2ko0IkK+9fF+aJg9ZM1yYT8PPHIj7T6JyTEcg=;
  b=JZf/WfPW8oNXzLDQfVvVEjSW87v58Uh97rfdbPQJf6KPrltv7IqewxoK
   nqSKskb3EmdfR9hNxbFjs2+3rbJ54HuLlESGWC9PMhcxfR5k++VQlcG1W
   JnW0yNM0+0QLdjzTBzn4QEpLMq5CClaCcy6mFvP19Hba3IwZ2ac6iLaAO
   11vb7p5UzI1mFL/MNzwnGI1HRpXfBNnbRPP2Q2NDsknYVIbkX+FWKeyJz
   XfPkIk0vJA5ejgP9pa9mAMjVsvCdL6YJdnqBR2mCPm5PbEn8MFaTXZHh0
   uhiJPkdOKvtGOpSk9J3q8PCrwET9V4BHR0osvgc+VDSHnF1P+YwH4E3vm
   Q==;
X-CSE-ConnectionGUID: 7rmaK+gESuqNL33onbUlvA==
X-CSE-MsgGUID: gPmAzc/xT1ulBTTaJdyXvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="104699807"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="104699807"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 12:46:39 -0700
X-CSE-ConnectionGUID: pjyd++IPSYep1ETdoowOSw==
X-CSE-MsgGUID: 71Xmtu7YRtyiSseiTacypQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="246667734"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jun 2026 12:46:37 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXlMI-00000000Nmi-00v6;
	Thu, 11 Jun 2026 19:46:34 +0000
Date: Fri, 12 Jun 2026 03:45:47 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Timur Tabi <ttabi@nvidia.com>
Subject: drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:29:17: sparse:
 sparse: cast removes address space '__iomem' of expression
Message-ID: <202606120311.UT962mTj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: 6cc6e08d4542473d79ea83d9123d9d35e9c01c92 drm/nouveau/kms: add support for GB20x
date:   1 year, 1 month ago
config: powerpc-randconfig-r112-20260611 (https://download.01.org/0day-ci/archive/20260612/202606120311.UT962mTj-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120311.UT962mTj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6cc6e08d4542 ("drm/nouveau/kms: add support for GB20x")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120311.UT962mTj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, drivers/gpu/drm/nouveau/dispnv50/disp.h, ...):
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
>> drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:29:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:29:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:29:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:36:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:36:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:41:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:41:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:41:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:50:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:50:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:69:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:69:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:69:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:77:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:77:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:77:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:87:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:87:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:93:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:93:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:95:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:95:17: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +29 drivers/gpu/drm/nouveau/dispnv50/coreca7d.c

    14	
    15	static int
    16	coreca7d_update(struct nv50_core *core, u32 *interlock, bool ntfy)
    17	{
    18		const u64 ntfy_addr = core->disp->sync->offset + NV50_DISP_CORE_NTFY;
    19		const u32 ntfy_hi = upper_32_bits(ntfy_addr);
    20		const u32 ntfy_lo = lower_32_bits(ntfy_addr);
    21		struct nvif_push *push = &core->chan.push;
    22		int ret;
    23	
    24		ret = PUSH_WAIT(push, 5 + (ntfy ? 5 + 2 : 0));
    25		if (ret)
    26			return ret;
    27	
    28		if (ntfy) {
  > 29			PUSH_MTHD(push, NVCA7D, SET_SURFACE_ADDRESS_HI_NOTIFIER, ntfy_hi,
    30	
    31						SET_SURFACE_ADDRESS_LO_NOTIFIER,
    32				  NVVAL(NVCA7D, SET_SURFACE_ADDRESS_LO_NOTIFIER, ADDRESS_LO, ntfy_lo >> 4) |
    33				  NVDEF(NVCA7D, SET_SURFACE_ADDRESS_LO_NOTIFIER, TARGET, PHYSICAL_NVM) |
    34				  NVDEF(NVCA7D, SET_SURFACE_ADDRESS_LO_NOTIFIER, ENABLE, ENABLE));
    35	
    36			PUSH_MTHD(push, NVCA7D, SET_NOTIFIER_CONTROL,
    37				  NVDEF(NVCA7D, SET_NOTIFIER_CONTROL, MODE, WRITE) |
    38				  NVDEF(NVCA7D, SET_NOTIFIER_CONTROL, NOTIFY, ENABLE));
    39		}
    40	
    41		PUSH_MTHD(push, NVCA7D, SET_INTERLOCK_FLAGS, interlock[NV50_DISP_INTERLOCK_CURS],
    42					SET_WINDOW_INTERLOCK_FLAGS, interlock[NV50_DISP_INTERLOCK_WNDW]);
    43	
    44		PUSH_MTHD(push, NVCA7D, UPDATE,
    45			  NVDEF(NVCA7D, UPDATE, RELEASE_ELV, TRUE) |
    46			  NVDEF(NVCA7D, UPDATE, SPECIAL_HANDLING, NONE) |
    47			  NVDEF(NVCA7D, UPDATE, INHIBIT_INTERRUPTS, FALSE));
    48	
    49		if (ntfy) {
    50			PUSH_MTHD(push, NVCA7D, SET_NOTIFIER_CONTROL,
    51				  NVDEF(NVCA7D, SET_NOTIFIER_CONTROL, NOTIFY, DISABLE));
    52		}
    53	
    54		return PUSH_KICK(push);
    55	}
    56	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
