Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A63322A26
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 12:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765541517; cv=none; b=QV+rdze66MSj6D116MD75tg3GaejuoZrBCSFJwDVc3DoZdc3G6r49AuvC/hqIuntQk69Pcosa9gfvBdXkaNNgDSf38QjGSEeTAQORR2hgU5ejq2bd8Rg5SQ2on80YexbX1hv+8ZVGzWfdSGW53dLInJyp9qhupAOwZVjou86jss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765541517; c=relaxed/simple;
	bh=KTyVi82SZezqGBUAH6eSIH16YtfqjgjHho8sw7rtUXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R9182w9QUfKs4zMrMWrd4oUsyacflBElzjRMlHIQj8a4AFpMgMl8NktjEFqkylG0sXGF21fWL1i2CNl3Pc+mWOMqp7tMgJbqwGwac6OH7zg0uvhB67fU5C+EIs6MSjUdZgDC8gogcgTYTwOoXimkgpRJ9MYIxF3yZiAbsFKtRaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UP8Egrc+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UP8Egrc+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765541515; x=1797077515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KTyVi82SZezqGBUAH6eSIH16YtfqjgjHho8sw7rtUXU=;
  b=UP8Egrc+BeUWlwoZ6qBPD9ofCYmt0Hfg+gzHizd6qVIlNiU95ETNUMC5
   3N8KnQ+rmkbbufYDiWz/nduieZShTdE+eU7/DleRMXZfayLzCQdCU8Jtg
   Ka0R1fbAJ+ScJtbTPtwgVx49fIzRogrp7zHOD3Jq/gfkGg3C60KdBopeA
   kfKdQrIWiMy0Vo5NO9ml8Eaw1K1yiu/3kdG4RoR2n4DuDV1ONNNs3KfRf
   8TI6Ghea7D2ZoJ+guL616AMBDUDjOj+t2h35s/QvnGdt1yCYeb4DDFfut
   uDBcUKY8gyXypESNfz6piQ9m5THAek8Ua1E9PuU3QWgauIUfuYPlygJpO
   w==;
X-CSE-ConnectionGUID: FNefpL+qRL+5/p9kPFgrZQ==
X-CSE-MsgGUID: 9VsZp6nDSb+D1gxwgEhqWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67420682"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67420682"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 04:11:53 -0800
X-CSE-ConnectionGUID: MpxjNeZHRoGXBJHvh6+SLw==
X-CSE-MsgGUID: XgNNxL3wRNm4G8CKKqMrLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="196156071"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 04:11:52 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU1zx-0000000060v-0cD3;
	Fri, 12 Dec 2025 12:11:49 +0000
Date: Fri, 12 Dec 2025 20:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dave Airlie <airlied@redhat.com>, Timur Tabi <ttabi@nvidia.com>
Subject: drivers/gpu/drm/nouveau/gv100_fence.c:25:9: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202512122006.PfLMnLim-lkp@intel.com>
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
commit: b1ca384772b657df433acf0c36f0771d5ebe1138 drm/nouveau/gv100-: switch to volta semaphore methods
date:   7 months ago
config: alpha-randconfig-r134-20251212 (https://download.01.org/0day-ci/archive/20251212/202512122006.PfLMnLim-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512122006.PfLMnLim-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512122006.PfLMnLim-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/nouveau/gv100_fence.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
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
>> drivers/gpu/drm/nouveau/gv100_fence.c:25:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/gv100_fence.c:25:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/gv100_fence.c:25:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/gv100_fence.c:25:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/gv100_fence.c:29:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/gv100_fence.c:29:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/gv100_fence.c:35:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/gv100_fence.c:35:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/gv100_fence.c:51:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/gv100_fence.c:51:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/gv100_fence.c:51:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/gv100_fence.c:51:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/gv100_fence.c:55:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/gv100_fence.c:55:9: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +25 drivers/gpu/drm/nouveau/gv100_fence.c

    14	
    15	static int
    16	gv100_fence_emit32(struct nouveau_channel *chan, u64 virtual, u32 sequence)
    17	{
    18		struct nvif_push *push = &chan->chan.push;
    19		int ret;
    20	
    21		ret = PUSH_WAIT(push, 8);
    22		if (ret)
    23			return ret;
    24	
  > 25		PUSH_MTHD(push, NVC36F, SEM_ADDR_LO, lower_32_bits(virtual),
    26					SEM_ADDR_HI, upper_32_bits(virtual),
    27					SEM_PAYLOAD_LO, sequence);
    28	
    29		PUSH_MTHD(push, NVC36F, SEM_EXECUTE,
    30			  NVDEF(NVC36F, SEM_EXECUTE, OPERATION, RELEASE) |
    31			  NVDEF(NVC36F, SEM_EXECUTE, RELEASE_WFI, EN) |
    32			  NVDEF(NVC36F, SEM_EXECUTE, PAYLOAD_SIZE, 32BIT) |
    33			  NVDEF(NVC36F, SEM_EXECUTE, RELEASE_TIMESTAMP, DIS));
    34	
    35		PUSH_MTHD(push, NVC36F, NON_STALL_INTERRUPT, 0);
    36	
    37		PUSH_KICK(push);
    38		return 0;
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
