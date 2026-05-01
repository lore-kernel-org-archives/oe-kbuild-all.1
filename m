Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375F9394496
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 10:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777632906; cv=none; b=O09G3uF33KG8duXIt1jVWX+5gS6A2ytY5UutsKlR7HXgvVphTNzUEaWZ7VigIlI5MCe0vIDGVx/MMMI0ynZcFuyGawzoQRp4hKQ61IVgsJymLo7ljqKCEFzSqMShkARaOEmjy+hzPTLYeURHWac0zxdbwW7XPUCdT4xE7x+WG+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777632906; c=relaxed/simple;
	bh=IswrL2UwlihOCvUBVJwTdDXTpf6Q4tXDe65r7OF9uSU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NLSIsDqMX6P5GAeYYFfpvjbgJ9MY9HSv1HMMQdpUVvl9XcRuWx0eDo29SQlyf6Fcohk/sRm9mfC9WGO3utWv7eKUKVke+vOHpWiaWIQsdvdU3Ci13oWdg51KVXUoteRgGJmCkrxndbGkbwdW7EFWzXAWebFqtpnwaSrSM1vpRJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DIBxh9Jw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DIBxh9Jw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777632903; x=1809168903;
  h=date:from:to:cc:subject:message-id;
  bh=IswrL2UwlihOCvUBVJwTdDXTpf6Q4tXDe65r7OF9uSU=;
  b=DIBxh9Jwmnq+07+tXYmUvwhSASlPFzKaoPpfF1DjJ99qegdXckDhl3wr
   KGDmX7d77IcKdXh/Nm0hUv+PRUePZPTRYMMhdqJtCUhxoK4cTuygJC7nl
   F8utiR7KNhkGbMRHciqq7vLtfeM0oDJ2Q0uJvJ66mry6+8Sx8nNjrooUP
   pnLRCr0KxBlMmWYBWABKpUCU7D1AkbQisIvjoqJ2uF+JQvOxQwR5GOr0v
   CmnuIonT1KbsB1vsr+hERtT6DcK/b0BUAeApNmYxtjKbPJorFYl+VoZG4
   A3kBWVcCqx0rqlaBNb0LFyXCIZURxZfBIVSvayAeml6lae6wDpxLq7avR
   w==;
X-CSE-ConnectionGUID: jwn/kOMrToStQEtzvzXCBA==
X-CSE-MsgGUID: kMJbwVu+Q+KUyOTdNZdTQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="89690124"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="89690124"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 03:55:00 -0700
X-CSE-ConnectionGUID: KkbRaNQASXiw9LMXwvwXJw==
X-CSE-MsgGUID: 8K2kCIylTCGRBBEWLMZ0Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="258188490"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 May 2026 03:54:57 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIlWJ-000000000Tf-1Ge2;
	Fri, 01 May 2026 10:54:55 +0000
Date: Fri, 01 May 2026 18:54:43 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Timur Tabi <ttabi@nvidia.com>
Subject: drivers/gpu/drm/nouveau/nvif/chan.c:11:32: sparse: sparse:
 cast removes address space '__iomem' of expression
Message-ID: <202605011849.1PCAgU5Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26fd6bff2c050196005312d1d306889220952a99
commit: d1fb887a08d8a21284e9a4be476f103353a32e7a drm/nouveau/nv50-: separate CHANNEL_GPFIFO handling out from CHANNEL_DMA
date:   12 months ago
config: sparc64-randconfig-r132-20260430 (https://download.01.org/0day-ci/archive/20260501/202605011849.1PCAgU5Y-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605011849.1PCAgU5Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d1fb887a08d8 ("drm/nouveau/nv50-: separate CHANNEL_GPFIFO handling out from CHANNEL_DMA")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605011849.1PCAgU5Y-lkp@intel.com/

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
