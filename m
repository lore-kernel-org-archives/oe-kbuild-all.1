Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874C413C3D5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 05:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732772356; cv=none; b=fNeCcu12GJdzpoRxh9BWKbxIet3h6yMEkmm8T5A4oO+PN5kAQSz+HRClj2d2VgHTsIMvUebnP0BFkRCcmhElPCsGzqaT+wt0pmQx7kSJ+/bAF7Q/4hUU1mK+n6M4320o7cV/yk3l1VQq+PRXf7m9Oj+bz2bIrZ/FZMVWx1H6a3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732772356; c=relaxed/simple;
	bh=B0vZklBwNDmwQMG06w70lemTGYc31gfmnRE1kjX7Cgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AYbFpIoEA1/eJc0nM3JkLPI1nweqOdW1Ome4j2dj0HdIWcUV8+dXAdTqtQzrNSucyyHnLu1wcL3ACRlTFXqrC7p9vnsDQ9iGMQfMsBKUQnpYpK561e8dJG8kzkaM6GtPdLOr1/xi6IQvA9VUWwwrzhFYUNevLEYb26iUvyN8ugs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N0dMlu6o; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N0dMlu6o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732772355; x=1764308355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B0vZklBwNDmwQMG06w70lemTGYc31gfmnRE1kjX7Cgw=;
  b=N0dMlu6oxHHbSisbrx+xLYMGwx0lgZ9gjTZ8wNSV1tXJ87gNdmrX4/7t
   WxfVprGUvUXDGf7c8c9IwXsAJjBCU7+kh9MAo7SKHIMBTcJL0PQ76IMmJ
   3C3vBake1XZnmMF100kkEUmmFe6LeUtrFrlk/2hN9ym0Q3Hi59tDh3sIN
   +VD+xYj/uLh7TBevCeyzD4/Wm4kxg46DtgKNFRqj7+Hw0QqR3/8E+TUVO
   pDX3DtethEsA1tf/hWHXtNcj855o4FD8hZHJz8zJL30HR8BDLZrBFs0GS
   a2mV8CukR/uWeP6aKZMsfm9T+QvTYxYKRnCt5HEGmh0ygtCnmkmxMlddf
   A==;
X-CSE-ConnectionGUID: iHckfBZqSyCxZMLU1UMBXA==
X-CSE-MsgGUID: TSRZAxJUR0OuV3LZGSYJkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="33045260"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="33045260"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 21:39:12 -0800
X-CSE-ConnectionGUID: LYtrgb11QLKcuotchUC5sQ==
X-CSE-MsgGUID: YvU0qcPxS3WH+Nl3FDSlLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="97222905"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Nov 2024 21:39:10 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGXF6-00096r-0V;
	Thu, 28 Nov 2024 05:39:08 +0000
Date: Thu, 28 Nov 2024 13:38:21 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: sound/sh/sh_dac_audio.c:166:51: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202411281337.I4M07b7i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b86545e02e8c22fb89218f29d381fa8e8b91d815
commit: 2f432f4702134fac27677f13aba69ed830984f75 ALSA: sh: Convert to generic PCM copy ops
date:   1 year, 3 months ago
config: sh-randconfig-r111-20241122 (https://download.01.org/0day-ci/archive/20241128/202411281337.I4M07b7i-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241128/202411281337.I4M07b7i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281337.I4M07b7i-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/sh/sh_dac_audio.c:166:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *dst @@     got char * @@
   sound/sh/sh_dac_audio.c:166:51: sparse:     expected void [noderef] __iomem *dst
   sound/sh/sh_dac_audio.c:166:51: sparse:     got char *
   sound/sh/sh_dac_audio.c:185:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got char * @@
   sound/sh/sh_dac_audio.c:185:37: sparse:     expected void volatile [noderef] __iomem *
   sound/sh/sh_dac_audio.c:185:37: sparse:     got char *
   sound/sh/sh_dac_audio.c: note: in included file:
   arch/sh/include/cpu-sh3/cpu/dac.h:38:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/cpu-sh3/cpu/dac.h:38:21: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/cpu-sh3/cpu/dac.h:38:21: sparse:     got unsigned int
   arch/sh/include/cpu-sh3/cpu/dac.h:39:14: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/cpu-sh3/cpu/dac.h:39:14: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/cpu-sh3/cpu/dac.h:39:14: sparse:     got unsigned int

vim +166 sound/sh/sh_dac_audio.c

   158	
   159	static int snd_sh_dac_pcm_copy(struct snd_pcm_substream *substream,
   160				       int channel, unsigned long pos,
   161				       struct iov_iter *src, unsigned long count)
   162	{
   163		/* channel is not used (interleaved data) */
   164		struct snd_sh_dac *chip = snd_pcm_substream_chip(substream);
   165	
 > 166		if (copy_from_iter_toio(chip->data_buffer + pos, src, count))
   167			return -EFAULT;
   168		chip->buffer_end = chip->data_buffer + pos + count;
   169	
   170		if (chip->empty) {
   171			chip->empty = 0;
   172			dac_audio_start_timer(chip);
   173		}
   174	
   175		return 0;
   176	}
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
