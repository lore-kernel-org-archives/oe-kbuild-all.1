Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474FF25A2A4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 08:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777536246; cv=none; b=JgEeRbTnv6gaGKxTU8ga/KBiZfX3Sn3BVu1KIuTFO8EBoTOjUC8L09Jlwu5La9nqfsm/nRs0bGY2FlxWXJplEMg7muiIe+gEyBmgsLCblv+3Se5s3wCgPe/ii6fJxKhTmgc7JYDdZon7vdNPzUkt5xL/Lx4QGOcyagiwsl5XrXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777536246; c=relaxed/simple;
	bh=yqtNtqsW1c8Uwm8Fql+zsyJXahRR8zMUqIa8KcoGT9I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H7/I8R6qBHyKytC0wZTEd0OzaKtCFEXaA5pmcj3ize6agwViKJS0yCrjApIGUwmm+HjMX9wsaSZgcgVee/U8KKDtofZQgm7+JO5RcLCxut2IhP9lQbBzOKluknCkB4lA5696+3PnU5dJXWqOTmimuZ9UV2ZtbIojDzw5KX+rgkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+Dtqucp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+Dtqucp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777536244; x=1809072244;
  h=date:from:to:cc:subject:message-id;
  bh=yqtNtqsW1c8Uwm8Fql+zsyJXahRR8zMUqIa8KcoGT9I=;
  b=a+Dtqucpn3M13/QKr15r3zU8Q4hd2bcRwrxx29w5RUyVXEpPpRciUend
   idXX61ZvTRmQq2WD0nQJzmwFMcBYvv1T940XWgoRqebVuv33txtoxR7uv
   L6YdOik90zpKakLrCP6snIlyIb3FmtrfTWlf8vKR+YY3a89k7UzY36fzP
   zXwEjajSv2BDNz9Dzc/JEftfzs66hxpvzmCKH9IgyAeH1lE/oW4j4arXB
   95ax7+Be7ktNvYrJu/GLETAdl5S0mj4k4bIfN1oioLxue9PBL7QgFGP+p
   GuJKhmCmwSaK0q500muWAK9QLCPB3+lomovOpfGW64uVSij3Ddcv3r6vk
   Q==;
X-CSE-ConnectionGUID: Wwx4fTCwRJ+0tANL3bWyXw==
X-CSE-MsgGUID: TgrZUePBS4qJOnmsJ8bmMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="66012225"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="66012225"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 01:04:03 -0700
X-CSE-ConnectionGUID: aJK9BEJYSgepAgtLtsuejw==
X-CSE-MsgGUID: Ip1oKYJZQoKZK6rmy+bLDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="238483764"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Apr 2026 01:04:01 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIMNL-00000000C8g-0PmI;
	Thu, 30 Apr 2026 08:03:59 +0000
Date: Thu, 30 Apr 2026 16:03:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Timur Tabi <ttabi@nvidia.com>
Subject: drivers/gpu/drm/nouveau/nvif/chan.c:11:32: sparse: sparse:
 cast removes address space '__iomem' of expression
Message-ID: <202604301541.JiYvVcb9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e75a43c7cec459a07d91ed17de4de13ede2b7758
commit: d1fb887a08d8a21284e9a4be476f103353a32e7a drm/nouveau/nv50-: separate CHANNEL_GPFIFO handling out from CHANNEL_DMA
date:   12 months ago
config: sparc64-randconfig-r132-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301541.JiYvVcb9-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301541.JiYvVcb9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d1fb887a08d8 ("drm/nouveau/nv50-: separate CHANNEL_GPFIFO handling out from CHANNEL_DMA")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301541.JiYvVcb9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvif/chan.c:11:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvif/chan.c:71:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *ptr @@     got void *userd @@
   drivers/gpu/drm/nouveau/nvif/chan.c:71:29: sparse:     expected void [noderef] __iomem *ptr
   drivers/gpu/drm/nouveau/nvif/chan.c:71:29: sparse:     got void *userd
   drivers/gpu/drm/nouveau/nvif/chan.c:73:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *ptr @@     got void *gpfifo @@
   drivers/gpu/drm/nouveau/nvif/chan.c:73:30: sparse:     expected void [noderef] __iomem *ptr
   drivers/gpu/drm/nouveau/nvif/chan.c:73:30: sparse:     got void *gpfifo
   drivers/gpu/drm/nouveau/nvif/chan.c:77:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *ptr @@     got void *push @@
   drivers/gpu/drm/nouveau/nvif/chan.c:77:39: sparse:     expected void [noderef] __iomem *ptr
   drivers/gpu/drm/nouveau/nvif/chan.c:77:39: sparse:     got void *push
   drivers/gpu/drm/nouveau/nvif/chan.c:89:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvif/chan.c:123:22: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +11 drivers/gpu/drm/nouveau/nvif/chan.c

     6	
     7	static void
     8	nvif_chan_gpfifo_push_kick(struct nvif_push *push)
     9	{
    10		struct nvif_chan *chan = container_of(push, typeof(*chan), push);
  > 11		u32 put = push->bgn - (u32 *)chan->push.mem.object.map.ptr;
    12		u32 cnt = push->cur - push->bgn;
    13	
    14		chan->func->gpfifo.push(chan, true, chan->push.addr + (put << 2), cnt << 2, false);
    15		chan->func->gpfifo.kick(chan);
    16	}
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
