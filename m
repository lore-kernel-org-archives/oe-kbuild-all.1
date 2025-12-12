Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CD02D7DE6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 05:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765517009; cv=none; b=Y1HEUK8hVw80ATxOjhoXiZgMCdIRazJ809fkBgXLyXOj/Rm8JwMIxcWTWblmTd6H8qpyj7B+KU2HdbzkIBI8FbUzZ3EH98uHT71V5tSlSXui0h/hx+ktQg3ctcSuCdRJj9D9OrfCD8x1yUP4H4mKzMZUbFTWaRxrUtaVXfwQ6g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765517009; c=relaxed/simple;
	bh=LDavBn/x7uDtoY5k7EpVadIYo6iq6d8cyLHTSN0ooug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kQ0mKK1s3wOEusncyc6sqinHki++ZSYifGLaJGgbGPzlSlPGm71447jSR7g/rqUlqfLI5G/W/Q1Zc2eoVTzl/qDf8j0n/VYB+3LdsHoLznKFmipoQU/h/oOK5emUnojastafmCxlobVpASNtTkyp33TlVCgvA2ODc3H4tOZLNBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6KciVmS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6KciVmS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765517009; x=1797053009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LDavBn/x7uDtoY5k7EpVadIYo6iq6d8cyLHTSN0ooug=;
  b=m6KciVmStPDeSnPH6mjn6suz8GzHv8iEW4cjWElJy54QWEGkNVO0pe70
   ITyFnQtfQuc0FA0R5rOYdVKlWZA+zFaA3ablJ+6Z3Ec+MMagrxwbwZsYc
   x7X/m4+t6kjhV6jdH7tMJ4oTJJq9ineoVZEib3rkE90qHf8T2+KUDCoc6
   83SM1Hci4BlEutxkXYUNot0GWX/xIw2LRaYiMi1BwRWAslwWhIIMjGWB4
   zLHHWwnA4iNtebo03UreP+y1m32SO4bwvpEuaWhJZ8W7CsXdtKZXgb1tb
   x+jHtLky0KgdCWqjhSp4wDgH935JFixUHXIAMxYgmj8k5SCnpUR3hH9+H
   w==;
X-CSE-ConnectionGUID: YU02mHKBQXWFWAK7cRQGFw==
X-CSE-MsgGUID: mAVbf4S0Sc+F7tjWruA4Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78615693"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78615693"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 21:23:28 -0800
X-CSE-ConnectionGUID: 9v8wAllPTQ2vo1jdw0w9YQ==
X-CSE-MsgGUID: G01C/dwCRty9WOXrp/sL3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="234390042"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Dec 2025 21:23:26 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTvch-000000005aL-1qUM;
	Fri, 12 Dec 2025 05:23:23 +0000
Date: Fri, 12 Dec 2025 13:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dave Airlie <airlied@redhat.com>, Timur Tabi <ttabi@nvidia.com>
Subject: drivers/gpu/drm/nouveau/nvif/chan.c:38:51: sparse: sparse: incorrect
 type in initializer (different address spaces)
Message-ID: <202512121331.N9I5gDz3-lkp@intel.com>
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
commit: 862450a85b85a3e88e9065c9d2421f3ef17d054c drm/nouveau/gf100-: track chan progress with non-WFI semaphore release
date:   7 months ago
config: i386-randconfig-061-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121331.N9I5gDz3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121331.N9I5gDz3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121331.N9I5gDz3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/nouveau/nvif/chan.c:11:32: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nvif/chan.c:38:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [usertype] *map @@     got void [noderef] __iomem *ptr @@
   drivers/gpu/drm/nouveau/nvif/chan.c:38:51: sparse:     expected unsigned int const [usertype] *map
   drivers/gpu/drm/nouveau/nvif/chan.c:38:51: sparse:     got void [noderef] __iomem *ptr
   drivers/gpu/drm/nouveau/nvif/chan.c:98:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *ptr @@     got void *userd @@
   drivers/gpu/drm/nouveau/nvif/chan.c:98:29: sparse:     expected void [noderef] __iomem *ptr
   drivers/gpu/drm/nouveau/nvif/chan.c:98:29: sparse:     got void *userd
   drivers/gpu/drm/nouveau/nvif/chan.c:100:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *ptr @@     got void *gpfifo @@
   drivers/gpu/drm/nouveau/nvif/chan.c:100:30: sparse:     expected void [noderef] __iomem *ptr
   drivers/gpu/drm/nouveau/nvif/chan.c:100:30: sparse:     got void *gpfifo
   drivers/gpu/drm/nouveau/nvif/chan.c:104:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *ptr @@     got void *push @@
   drivers/gpu/drm/nouveau/nvif/chan.c:104:39: sparse:     expected void [noderef] __iomem *ptr
   drivers/gpu/drm/nouveau/nvif/chan.c:104:39: sparse:     got void *push
   drivers/gpu/drm/nouveau/nvif/chan.c:116:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvif/chan.c:152:22: sparse: sparse: cast removes address space '__iomem' of expression

vim +38 drivers/gpu/drm/nouveau/nvif/chan.c

     6	
     7	static void
     8	nvif_chan_gpfifo_push_kick(struct nvif_push *push)
     9	{
    10		struct nvif_chan *chan = container_of(push, typeof(*chan), push);
  > 11		u32 put = push->bgn - (u32 *)chan->push.mem.object.map.ptr;
    12		u32 cnt;
    13	
    14		if (chan->func->gpfifo.post) {
    15			if (push->end - push->cur < chan->func->gpfifo.post_size)
    16				push->end = push->cur + chan->func->gpfifo.post_size;
    17	
    18			WARN_ON(nvif_chan_gpfifo_post(chan));
    19		}
    20	
    21		cnt = push->cur - push->bgn;
    22	
    23		chan->func->gpfifo.push(chan, true, chan->push.addr + (put << 2), cnt << 2, false);
    24		chan->func->gpfifo.kick(chan);
    25	}
    26	
    27	static int
    28	nvif_chan_gpfifo_push_wait(struct nvif_push *push, u32 push_nr)
    29	{
    30		struct nvif_chan *chan = container_of(push, typeof(*chan), push);
    31	
    32		return nvif_chan_gpfifo_wait(chan, 1, push_nr);
    33	}
    34	
    35	int
    36	nvif_chan_gpfifo_post(struct nvif_chan *chan)
    37	{
  > 38		const u32 *map = chan->push.mem.object.map.ptr;
    39		const u32 pbptr = (chan->push.cur - map) + chan->func->gpfifo.post_size;
    40		const u32 gpptr = (chan->gpfifo.cur + 1) & chan->gpfifo.max;
    41	
    42		return chan->func->gpfifo.post(chan, gpptr, pbptr);
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
